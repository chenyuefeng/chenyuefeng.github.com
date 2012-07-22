---
layout: post
title: "字符串循环移位"
date: 2012-07-22 19:06
comments: true
categories: [ algorithm, programming ]
---
## 问题描述 ##
将一个n元一维向量向左循环移位k个位置。例如，`n=9，k=3`， 向量`abcdefghi`就变成了`defghiabc`，在考虑到节省内存的情况下，如何在`O(n)`的复杂度下对向量进行移位。

## 方法一 ##
移动`c = x[0], x[0] = x[k], x[k] = x[2*k], ...`依次类推，直到返回到`x[0]`，改为从`c`取值。
<!-- more -->

``` c shift_zaji.c fist algorithm
int gcd(int a, int b)
{
        int r;
        while(1){
                r = a % b;
                if ( r == 0 )
                        return b;
                a = b;
                b = r;
        }
}
void shift(char * str, int n, int k)
{
        int turns = gcd(n, k);
        int i, j, tmp;
        char c;
        k = k % n;
        for( i= 0; i < turns; ++ i){
                c = str[i];
                tmp = i;
                while (1){
                        j = tmp + k;
                        if ( j >= n )
                                j -= n;
                        if ( j == i )
                                break;
                        str[tmp] =  str[j];
                        tmp = j;
                }       
                str[tmp] = c;
        }
}       
```

## 方法二  块交换算法##
对向量进行循环移位其实是交换向量`ab`的两个部分，得到向量`ba`,如果`a`代表向量的前`k`个元素,分为两种情况，

*     `length(a) < length(b)`那么将`b`分为<code>b<sub>l</sub>b<sub>r</sub></code>, 其中<code>b<sub>r</sub></code>与`a`等长，那么将`a`与<code>b<sub>r</sub></code>进行交换，最后形成<code>b<sub>r</sub>b<sub>l</sub>a</code>,现在只要交换<code>b<sub>r</sub>b<sub>l</sub></code>的子问题。
*     `length(a) >= length(b)`那么将`a`分为<code>a<sub>l</sub>a<sub>r</sub></code>, 其中<code>a<sub>l</sub></code>与`b`等长，那么将<code>a<sub>l</sub></code>与`b`进行交换，最后形成<code>ba<sub>r</sub>a<sub>l</sub></code>,现在只要交换<code>a<sub>r</sub>a<sub>l</sub></code>的子问题。

``` c shift_block_swap.c block swap algorithm
void swap(char * str, int a_l, int b_l, int len)
{
        int i = a_l , j = b_l, k;
        for( k = 0; k < len; k ++){
                str[a_l + k] ^= str[b_l + k]; 
                str[b_l + k] ^= str[a_l + k]; 
                str[a_l + k] ^= str[b_l + k]; 
        }   
}
void shift(char * str, int n, int k)
{
        int i = k;
        int p = k;
        int j = n - p;
        while ( i != j){ 
                if( i > j ){
                        swap(str, p - i , p, j); 
                        i -= j;
                }else {
                        swap(str, p - i, p + j - i, i); 
                        j = j - i;
                }   
        }   
        swap(str, p - i, p, j); 
}
```

## 方法三 求逆算法##
同方法二，将问题归结为`ab`转化为`ba`，先对`a`求逆得<code>a<sup>r</sup></code>,对`b`求逆得到<code>b<sup>r</sup></code>，对<code>a<sup>r</sup>b<sup>r</sup></code>逆得`ba`，就是所求的结果

``` c shift_reverse.c reverse algorithm
void reverse(char * str, int start, int end)
{
        while( start <  end ){
                str[start] ^= str[end];
                str[end] ^= str[start];
                str[start] ^= str[end];
                start ++; 
                end --; 
        }   
}
void shift(char * str, int n, int k)
{
        k = k % n;
        reverse(str, 0, k - 1); 
        reverse(str, k, n - 1); 
        reverse(str, 0, n - 1); 
}
```

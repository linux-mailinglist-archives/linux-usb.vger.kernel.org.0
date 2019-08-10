Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60C4088AAE
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2019 12:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbfHJKUN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Aug 2019 06:20:13 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40506 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfHJKUN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Aug 2019 06:20:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id m8so60690434lji.7
        for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2019 03:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Sq+6WqpBLaoDnZr39PsY/fQut7RglmH69G4syGYdWNo=;
        b=tLw/xrN3nkWKecpxzW5sPTVkFFTaLhsramlyCkj7eaSKZz6a1uRzw28+4LJIhGB+24
         A3T+bct9hlfM8sXFDk8nbnaLGanH5XFzB6HG3iPWQZi/Uxdsi6GVUukvJexdakztwtOw
         p59/ZKZS69yXzHJMAeoo5EvNcbT3pSFH/5Q+adgVZxbptJz9pCXW8TBAAMyXOCjYsSvN
         WiQeuX10bfqMISv3uS4WBGfy0/n3Szneb86uASIYs6QP5zTs7kyfiP7YnqpZQTu47Mrp
         dtcSsfFy9ibFh5U7uB3O7DtjFJSYegzxqqG4gbvdh204/NbyTS+soFEeoKIFSBQSzd3Z
         x2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Sq+6WqpBLaoDnZr39PsY/fQut7RglmH69G4syGYdWNo=;
        b=ioyE0MH9KvztBfzcP2d8agz2fr0z4EnKbpBKLJRKWlf5N2mTl2p55N7AC0bZGFyWoo
         afbTZFqZym8YT3uIkYFbtrHGe8pNcFiExubUuF31/G7J+1xOsmgATEk7nflHe5bmpo1u
         8QfjW6YIDE+BVaWw/Bzq2GdDar697f/CVbX3Q9n/k2BhOZm9Y2Yrh43wWORTFOIZRGAj
         XjBHu3YljuSrrVFWLcAtJDE/Uldd7Ik1XyFshL03wCjuaUNLY27EOvD9e6TAiQyF9KG+
         DorDzmBstWCGlwX9m//c4vcIvAZglWamz4hdiuMY5TDH1rJYfbuGDDF4h17EFFMtiqBE
         79cA==
X-Gm-Message-State: APjAAAU7MCZ39NNKNP5mKjAKJSDbMAHDLrp7r6j0oC3zjH0PNFBlmiqs
        xuMugH4m1zQbRvCmkjIJ/4Dwrw==
X-Google-Smtp-Source: APXvYqx5avYfGx2MFNcpS82xmwm1Oq3cm6YBNaGbYQ/4WYUkHtj/CNLg89ZluEVcn3ib2fDTh+rKPA==
X-Received: by 2002:a2e:a415:: with SMTP id p21mr13856843ljn.111.1565432410967;
        Sat, 10 Aug 2019 03:20:10 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4d5:6a53:c586:c2b6:b7e6:3b26? ([2a00:1fa0:4d5:6a53:c586:c2b6:b7e6:3b26])
        by smtp.gmail.com with ESMTPSA id t21sm339759ljd.91.2019.08.10.03.20.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 10 Aug 2019 03:20:10 -0700 (PDT)
Subject: Re: [PATCH v2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file to reflect IP block
To:     Simon Horman <horms+renesas@verge.net.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20190809213710.31783-1-horms+renesas@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0be0a8f4-881d-d959-fd71-70670a6a86db@cogentembedded.com>
Date:   Sat, 10 Aug 2019 13:19:53 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809213710.31783-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 10.08.2019 0:37, Simon Horman wrote:

> For consistency with the naming of (most) other documentation files for DT
> bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> documentation file from renesas,usb3.txt to renesas,usb3-peri.txt
> 
> This refines a recent rename from renesas_usb3.txt to renesas-usb3.txt.

    To renesas,usb3.txt, perhaps? That's what I'm seeing as the original file
in this patch...

> The motivation is to more accurately reflect the IP block documented in
> this file.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> * Based on v5.3-rc1
> 
> v2
> * Add review tag
> * Correct changelog
> ---
>   .../devicetree/bindings/usb/{renesas,usb3.txt => renesas,usb3-peri.txt}   | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename Documentation/devicetree/bindings/usb/{renesas,usb3.txt => renesas,usb3-peri.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3.txt b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/usb/renesas,usb3.txt
> rename to Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt

MBR, Sergei

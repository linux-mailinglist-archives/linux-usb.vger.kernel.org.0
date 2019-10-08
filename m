Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEF72D00C6
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 20:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfJHSnk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 14:43:40 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33655 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbfJHSnk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Oct 2019 14:43:40 -0400
Received: by mail-pg1-f195.google.com with SMTP id i76so3598460pgc.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2019 11:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TRNvdENmrzteLcjzZNNzx71QZYBe1QCDNQZ3vGceSaI=;
        b=Wel0BS9C/ergdFg5qrGfNBsBqqDgFYbGzyNxm0gOyvM8cufjztBOfcdYHeOVq3LGj/
         6ipAYTBks2tlxvKD8Lu3GJHnvKn/eCUgU6jsWQWHLBJTbvkMrCoaxF0aXVgb2SWEzH5/
         79x6mKNgXoAqoA61bT6opjWw+alZxr2xzptx3HJ27H/pYLnGkqb97YNqBUlD2bgiSc2s
         nK7aAhZ0vJdKbxMW5WGd9QHXafzY2N/jf5eS4mYkfFX/Isf7uTwuyctaVcnuBMnpn/Uv
         ruNfdTWXXAaRQHvrtWa2GyGVd2CeONAqJczKfuVzH62Sbv0C4wlHpPvtYZFM8LSKhCHT
         i3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TRNvdENmrzteLcjzZNNzx71QZYBe1QCDNQZ3vGceSaI=;
        b=WGPkcRvtD25oI3fIJa6L4Ny9uHP+vcIO78nLs6ljVO3inlYu8lt0Jb5oedQi+bXtLh
         9m7Lcpceq3YMdn0nzx+LAaPXPY3P8e05DuYhfGr15WvPbbLxCebanfjrsfGYjk88qBLA
         3GdzgpsvDS6vMWvy0CJ/pRDAysPYGFsHy6Knj3bPrkoYwkGHmS0KOU99kbGFcIrp1f6q
         Ft2JzT3mbgnK+pBXs4AMl6HnJpnHwhu+Jg2ddVldLdV4w/S06joH/JtN6s5QqUVyHR9f
         uBl8jfTB5jBJ3EMioP2ORreQkS04WEchEilW+7mKzUxCS0B8b9kCCV46zswj7odCzDOy
         mGSw==
X-Gm-Message-State: APjAAAV3Ga+YeCChsh4qlrvGhxYL7Hlhu8VNVEtDM4P8RpMH3ol33T9b
        KsG3hJTKD/VMk46DABZuG9KXDjGg8uo=
X-Google-Smtp-Source: APXvYqxMVAGdphfgsWcD9JiixWZB6pxOuZdA4WZH0UNk833sXccCTNMYIhjCHWGwu8Xk4sPl+BLiyQ==
X-Received: by 2002:a62:2f84:: with SMTP id v126mr40869977pfv.167.1570560219814;
        Tue, 08 Oct 2019 11:43:39 -0700 (PDT)
Received: from saurav ([106.220.24.144])
        by smtp.gmail.com with ESMTPSA id k66sm3113654pjb.11.2019.10.08.11.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 11:43:39 -0700 (PDT)
Date:   Wed, 9 Oct 2019 00:13:32 +0530
From:   SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     balbi@kernel.org, Kevin Hilman <khilman@baylibre.com>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        saurav.girepunje@hotmail.com
Subject: Re: [PATCH] usb: dwc3: dwc3-meson-g12a.c: use
 devm_platform_ioremap_resource()
Message-ID: <20191008184330.GA3437@saurav>
References: <20191008102751.GA10401@saurav>
 <7h7e5f5lbd.fsf@baylibre.com>
 <CAFBinCBxwcuSd7RYpJ0PvLM3-O1SHuXsbvaLFwO48z-hRs+hsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFBinCBxwcuSd7RYpJ0PvLM3-O1SHuXsbvaLFwO48z-hRs+hsQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 08, 2019 at 07:29:28PM +0200, Martin Blumenstingl wrote:
> Hi Saurav,
> 
> On Tue, Oct 8, 2019 at 5:06 PM Kevin Hilman <khilman@baylibre.com> wrote:
> >
> > Saurav Girepunje <saurav.girepunje@gmail.com> writes:
> >
> > > Use the new helper that wraps the calls to platform_get_resource()
> > > and devm_ioremap_resource() together in dwc3_meson_g12a_probe().
> > >
> > > Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> the following commit is already in mainline:
> 
> commit c6e4999cd930b8bd11dd8d4767e871b47f502845
> Author: YueHaibing <yuehaibing@huawei.com>
> Date:   Fri Aug 2 21:04:08 2019 +0800
>    usb: dwc3: meson-g12a: use devm_platform_ioremap_resource() to simplify code
> 
> 
> Martin
Ok...Thanks for the information.

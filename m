Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 569DFC4AEB
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2019 11:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbfJBJ7D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 05:59:03 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:36499 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbfJBJ7D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 05:59:03 -0400
Received: by mail-lj1-f180.google.com with SMTP id v24so16468572ljj.3
        for <linux-usb@vger.kernel.org>; Wed, 02 Oct 2019 02:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OkoAD3zF88C5Dqs5GDjGfZUubxaHKzigTpk6jczMUV4=;
        b=owXVBrJYtnZRaVIwENh/rlP88kq0VB7JIS3jsy6Lhy3DxynqpO3+oxF5pq491xnKmc
         Cm6ZnDtSW4BCe1V95OuNHoHtn07a4MO18l/EvzIfuApdakUKmArS8FKE4Qg7sTTrW2rh
         iZiu63Oy3v8kIiytmA4Im5E/AJdtBxurwmYExxrksSWbw+uVBkQQqQdvhvH3Z5aNaVuV
         OZ13Tnv/4jjSQ0HJsffOoguH4rR0unUVSLImp3BMlySuRZqtWgzml17EZ8oq2P1PBg7Y
         xuKKDfQmA3Utm9C50uNzezCcWalEuy2/V2DgSkf8/pjvTUmIOQnj4apyiWB5Ow6to3Aa
         c/jQ==
X-Gm-Message-State: APjAAAXQvzQAwfj8tdeoIaQyF4FG02p+59zSkHsChI9EzdePNZZEReT2
        BzBwiNDyaGjSpsAgNSlOFb8=
X-Google-Smtp-Source: APXvYqx9fTcr3FCzNYS7urXZKx3/7o+rX5lzVRFMQce3a4L4LDeQ+K6L2IKHM6/V1XQKmhPurT+2RA==
X-Received: by 2002:a2e:8645:: with SMTP id i5mr1887485ljj.32.1570010341027;
        Wed, 02 Oct 2019 02:59:01 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id q19sm5787264lfj.9.2019.10.02.02.59.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 02:59:00 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iFbPZ-0006Ht-FC; Wed, 02 Oct 2019 11:59:10 +0200
Date:   Wed, 2 Oct 2019 11:59:09 +0200
From:   Johan Hovold <johan@kernel.org>
To:     beni.mahler@gmx.net
Cc:     johan@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: FTDI: Add device IDs for Sienna and Echelon
 PL-20
Message-ID: <20191002095909.GR13531@localhost>
References: <20190904222620.23618-1-beni.mahler@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904222620.23618-1-beni.mahler@gmx.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 05, 2019 at 12:26:20AM +0200, beni.mahler@gmx.net wrote:
> From: Beni Mahler <beni.mahler@gmx.net>
> 
> Both devices added here have a FTDI chip inside. The device from Echelon
> is called 'Network Interface' it is actually a LON network gateway.
> 
>  ID 0403:8348 Future Technology Devices International, Ltd
>  https://www.eltako.com/fileadmin/downloads/de/datenblatt/Datenblatt_PL-SW-PROF.pdf
> 
>  ID 0920:7500 Network Interface
>  https://www.echelon.com/products/u20-usb-network-interface

It wasn't obvious to me that these two are essentially the same product
(?) using different IDs so at first I wondered why you included them in
the same patch.

> Signed-off-by: Beni Mahler <beni.mahler@gmx.net>

Now applied, thanks.

Johan

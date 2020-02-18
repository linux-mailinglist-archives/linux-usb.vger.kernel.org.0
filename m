Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E896A163393
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 21:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgBRU50 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 15:57:26 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36702 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbgBRU50 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 15:57:26 -0500
Received: by mail-pf1-f194.google.com with SMTP id 185so11270738pfv.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 12:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7G02odti0in1pq50CWlLcK4M4B/JV9odEsJqdHdLviE=;
        b=KHoVLGc755Nz6QKqLcJzGCgRBp+XXAiXHMpAaVBedqGguP4caPbh3yUqoHbxMMDRhZ
         LuCujhgxmDMzq2G+oZSoadDw/WHfbdzPUn4k34rX+Q0rOtxp/xSOCSg3mpURlTXk9jD4
         7PGYe7gsEODmAYge8vu4b3lJ/qUFPc/QDHc/GxtKJDkb70eWqZSa8lP1/mhQcmcSmSJa
         weLvEenZ0VJddUoUwme/2uDnrM2G0V43DED0oOQ97gdsf+DhXzmidMpXn2AJqC737cTG
         nBenUWs8zdSWxuUWWZJZNOTAr7rzVoM0Ek74SdvHtWJKvD1n/A83THFEAl/zMrsbaZmF
         DR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7G02odti0in1pq50CWlLcK4M4B/JV9odEsJqdHdLviE=;
        b=LeoOvWEBCIXuJH3ttbSwkb0BnWQ/jshZbCw+MlJadrWcGiJPc7EUeonCsnPORE8VPN
         cdwpyCh06ArUDx8ZXQMt0UdnL6vfA6209PNftBQvoNl+pXrk+fylIGBJRAkmkSmp1Mqw
         b/UblZSG7whd/bT2QhPnbdfb69IJswVJmX/thFR+PSQSEm6sWMjcQg9ndrs6OX/HdpKv
         xbBHuM+U17J9uNpflSEWpx8ldphHmxNbsRLSssICiJAt5oWSQRPo09vx6iuXm3/oAjyl
         llNM9NtN5WQMEoZ8LHhuJFOAQtWmcJufGN5RngaZ3pJPtycTP9rIV7ICmIpTbe7gDmwz
         l3Hg==
X-Gm-Message-State: APjAAAXFGvKX1LZjCrJsIh8VXeFF3UeJucVPCdsDsAsNTfPNA+NBNDkD
        yOyshKhr3K8SNX1SlCvZ50ZlLEnmMc4mipeosNA=
X-Google-Smtp-Source: APXvYqxl/xUw4Bt2Rq0VgN9BTwXuXH3FcqqjT11pvZykTUXjHtCX1r2J07POGReBKNUY6CQFRQxMEFp6g/kg8c3TWBQ=
X-Received: by 2002:a65:5242:: with SMTP id q2mr23952408pgp.74.1582059445708;
 Tue, 18 Feb 2020 12:57:25 -0800 (PST)
MIME-Version: 1.0
References: <20200216172117.49832-1-noralf@tronnes.org>
In-Reply-To: <20200216172117.49832-1-noralf@tronnes.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 18 Feb 2020 22:57:15 +0200
Message-ID: <CAHp75Vc6=V=cXM0mmh88V6XLmJT6kFnJCS547vgxX0zBG+cTZQ@mail.gmail.com>
Subject: Re: [RFC 0/9] Regmap over USB for Multifunction USB Device (gpio,
 display, ...)
To:     =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     Mark Brown <broonie@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        USB <linux-usb@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Feb 16, 2020 at 7:30 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org> wr=
ote:
>
> Hi,
>
> A while back I had the idea to turn a Raspberry Pi Zero into a $5
> USB to HDMI/SDTV/DSI/DPI display adapter.
>
> Thinking about how to represent the display to the driver I realised
> that hardware use registers as API. And Linux does have a generic
> register abstraction: regmap. Furthermore this means that if I can do a
> regmap over USB implementation, it will be easy to do other functions
> like gpio, adc and others. After a few iterations trying to understand
> the USB subsystem and satisfying driver requirements, I now have
> something that looks promising.
>
> I'm sending out an early version hoping to get feedback especially on
> the core parts that handles regmap and interrupts.
>
> Overview:
>
>           USB Host          :         USB Device
>                             :
>             --------------  :  ------------------
> ----------  | mfd: mud   |  :  | f_mud          |  ----------
> | Driver |  --------------  :  |                |  | Driver |
> ----------  | regmap-usb |  :  | (mud_regmap)   |  ----------
>             --------------  :  ------------------
>
>
> I've attached 2 drivers:
> - gpio/pinctrl: is more or less finished
> - display: needs a lot more work

Can regmap-usb be used for drivers/mfd/dln2.c for example?

--=20
With Best Regards,
Andy Shevchenko

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD3D2032C7
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 11:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgFVJD5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 05:03:57 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33370 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbgFVJDz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jun 2020 05:03:55 -0400
Received: by mail-lj1-f193.google.com with SMTP id s1so18421156ljo.0
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2020 02:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RDM7FJkHpnWTqwWUz/a7tne//mjT6QAg0+EYxz+tMRo=;
        b=YAJkgBWsAaRTHPHv2KJ0jkIat9lxHoGjM1lR89j6ldmepoW+EHVpgEXGAu6NWQqMEA
         UXbwOPsmKzk7IyraWZJhbkvRm67ytau/L5tEUam4hT1XpYllD0OR7sJTxLtBQqLxS6Zt
         udU3Uy42qcqkMbraRUXXy1j7lPgTVm8wrlBbBXXQMc3zAMZTNwnthcEVayDSlSrueRQ1
         xZbVVoYEY/272rz1BipTrbT5WH4Luz5SzSM/4Kl8etnt7FVZVuW79YMkAPImfCnrkJVB
         S/Iwd08HDKrN0aLNY7Rl80ZiQDDaBJZYyQPQV8YmGWMpevpGFs66k2Jq9Q+JrOfTw1GW
         ftuw==
X-Gm-Message-State: AOAM530jWVCgYzuA/xB0n/48Fr6mlSO/bM6V2VEEjwXLN+dQEJksWOyx
        AugAUSMeM77IwqCrhXgIh/w=
X-Google-Smtp-Source: ABdhPJydYhbbHXOqAf79UG/yZyYeJCNFh4hoL5uvHwYViKbY+DrmGkqtpJajl5MFDAQ/3dH81gUUZA==
X-Received: by 2002:a2e:890d:: with SMTP id d13mr8295634lji.75.1592816632794;
        Mon, 22 Jun 2020 02:03:52 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id g12sm2620567ljl.33.2020.06.22.02.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 02:03:51 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jnIMp-0007Ob-FB; Mon, 22 Jun 2020 11:03:51 +0200
Date:   Mon, 22 Jun 2020 11:03:51 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org, charles-yeh@prolific.com.tw,
        Vera.Wang@quantatw.com, Tim-Chen@quantatw.com, BenLin@quantatw.com
Subject: Re: [PATCH] USB: serial: pl2303: Add new chip to support Chrome OS
Message-ID: <20200622090351.GB3334@localhost>
References: <20200617125924.1696-1-charlesyeh522@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617125924.1696-1-charlesyeh522@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 17, 2020 at 08:59:24PM +0800, Charles Yeh wrote:
> Prolific has developed a new USB to UART chip: PL2303HXN
> PL2303HXN : PL2303GC/PL2303GS/PL2303GT/PL2303GL/PL2303GE/PL2303GB
> The Vendor request used by the PL2303HXN (TYPE_HXN) is different from
> the existing PL2303 series (TYPE_HX & TYPE_01).
> Therefore, different Vendor requests are used to issue related commands.
> 
> Google Chrome OEM's vendor is Quanta
> The modification requirements of this patch file are from
> Google-->Quanta-->>Prolific
> Currently Chrome OS does not support PL2303HXN (TYPE_HXN),
> So Quanta hopes that Prolific provide patch files to support Chrome OS.
> 
> Below is the patch file modification instructions.
> 
> 1. Added a new TYPE_HXN type in pl2303_type_data, and then executes
>    new Vendor request,new flow control and other related instructions
>    if TYPE_HXN is recognized.
> 
> 2. Because the new PL2303HXN only accept the new Vendor request,
>    the old Vendor request cannot be accepted (the error message
>    will be returned)
>    So first determine the TYPE_HX or TYPE_HXN through
>    PL2303_READ_TYPE_HX_STATUS in pl2303_startup.
> 
>   2.1 If the return message is "1", then the PL2303 is the existing
>       TYPE_HX/ TYPE_01 series.
>       The other settings in pl2303_startup are to continue execution.
>   2.2 If the return message is "not 1", then the PL2303 is the new
>       TYPE_HXN series.
>       The other settings in pl2303_startup are ignored.
>       (PL2303HXN will directly use the default value in the hardware,
>        no need to add additional settings through the software)
> 
> 3. In pl2303_open: Because TYPE_HXN is different from the instruction of reset
>    down/up stream used by TYPE_HX.
>    Therefore, we will also execute different instructions here.
> 
> 4. In pl2303_set_termios: The UART flow control instructions used by
>    TYPE_HXN/TYPE_HX/TYPE_01 are different.
>    Therefore, we will also execute different instructions here.
> 
> 5. In pl2303_vendor_read & pl2303_vendor_write, since TYPE_HXN is different
>    from the vendor request instruction used by TYPE_HX/TYPE_01,
>    it will also execute different instructions here.
> 
> 6. In pl2303_update_reg: TYPE_HXN used different register for flow control.
>    Therefore, we will also execute different instructions here.
> 
> Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
> ---
>  drivers/usb/serial/pl2303.c | 124 +++++++++++++++++++++++++++++-------
>  drivers/usb/serial/pl2303.h |   7 +-
>  2 files changed, 107 insertions(+), 24 deletions(-)

Most, or even all, of this has already been merged to mainline. Why are
you posting it again?

If you want to add further features you need to base your patches on the
latest code.

Johan

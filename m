Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61B66160EF4
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 10:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbgBQJkS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 04:40:18 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39725 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728919AbgBQJkS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 04:40:18 -0500
Received: by mail-wr1-f65.google.com with SMTP id y11so18784802wrt.6
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 01:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=EdGaBU8GlJ6+ebYPZm4D4Vc7OdrOdEupdVUC3PA0Kqo=;
        b=BoQAZyr8xOTBI0RUTUiHGsWUtX+8Sm0amUe8cGzYu5tJfdtFVHs9zztlOFMNafaGgp
         KKt5JQvfKHybXwQoJOHDprRLpdz9teh+d2MuWWgP+QE08V/TXBFbhm02ChVCFZg26UEQ
         4jeAJhtl3lhaYxuvxqAZYEL2mvlcTWuaon8MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EdGaBU8GlJ6+ebYPZm4D4Vc7OdrOdEupdVUC3PA0Kqo=;
        b=OoJJsC9jUmr7hFJ8b+NsIgZIT0+7p2oEod1lWWTorHw28LvtDqVdK+0MdSQVF1UH/h
         BUic1ZaqobfsTPSVTlDt45MZYfQX/+yxyHzvkwcAssefywwwhWcTjpgGjJHAQwIbu6G3
         mOf1UsGv9M/kwmIvGCJT3J3ynSn48FBGOBmBWivVGIxvbYngf6FBM5lwTgoIrK11YL6w
         stktA8HDG6BwztvTSnzJqZz47BZjCigPm70sWtbHuBagoahrLLngheQukRr4de2uLLsz
         xzYjsCrp23lK8yLL+f4Y2c0fVqCEryOpXNZouks1jYPkYBPsnDfmc5RaJF+2HuEVptR9
         6M8A==
X-Gm-Message-State: APjAAAXTJI2oh7R/P7aycSXIlHWmINqLHZ92NQ4HWVOi4nmV/On+RcHH
        qLfKJCn6ClTt40fifGSxKNBQEw==
X-Google-Smtp-Source: APXvYqyuAnblXVnD2DvknIFKJVMC6EHEvV94UyIJPFqVnR9IZiqiH76ZLehdtxNtlRbUPoI6nckRAA==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr21765197wru.398.1581932415164;
        Mon, 17 Feb 2020 01:40:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s22sm19372384wmh.4.2020.02.17.01.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 01:40:14 -0800 (PST)
Date:   Mon, 17 Feb 2020 10:40:12 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc:     broonie@kernel.org, balbi@kernel.org, lee.jones@linaro.org,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC 0/9] Regmap over USB for Multifunction USB Device (gpio,
 display, ...)
Message-ID: <20200217094012.GI2363188@phenom.ffwll.local>
References: <20200216172117.49832-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200216172117.49832-1-noralf@tronnes.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Feb 16, 2020 at 06:21:08PM +0100, Noralf Trønnes wrote:
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
> 
> 
> USB3 device
> I've only tested this with usb2 devices (Pi, BBB) so I should get myself
> a usb3 gadget capable board. My searching didn't turn up much, so this
> seems to be quite rare. ROCK960 has USB 3.0 type C OTG but the price is
> $139 which is a bit expensive for this hobby project. Does anyone know
> of a cheap board?
> 
> Noralf.

Pretty cool idea, and the drm side looks really tiny (after all your
drm_client work that is). I think the important feedback here is for the
usb and regmap stuff, that's totally out of my area. I've commented on the
drm_client patch, but that's just minor stuff, imo looks good.

Cheers, Daniel

> 
> 
> Noralf Trønnes (9):
>   regmap: Add USB support
>   mfd: Add driver for Multifunction USB Device
>   usb: gadget: function: Add Multifunction USB Device support
>   pinctrl: Add Multifunction USB Device pinctrl driver
>   usb: gadget: function: mud: Add gpio support
>   regmap: Speed up _regmap_raw_write_impl() for large buffers
>   drm: Add Multifunction USB Device display driver
>   drm/client: Add drm_client_init_from_id() and drm_client_modeset_set()
>   usb: gadget: function: mud: Add display support
> 
>  drivers/base/regmap/Kconfig              |    8 +-
>  drivers/base/regmap/Makefile             |    1 +
>  drivers/base/regmap/regmap-usb.c         | 1026 ++++++++++++++++++
>  drivers/base/regmap/regmap.c             |   10 +-
>  drivers/gpu/drm/Kconfig                  |    2 +
>  drivers/gpu/drm/Makefile                 |    1 +
>  drivers/gpu/drm/drm_client.c             |   37 +
>  drivers/gpu/drm/drm_client_modeset.c     |   52 +
>  drivers/gpu/drm/mud/Kconfig              |   18 +
>  drivers/gpu/drm/mud/Makefile             |    4 +
>  drivers/gpu/drm/mud/mud_drm.c            | 1198 ++++++++++++++++++++++
>  drivers/gpu/drm/mud/mud_drm.h            |  137 +++
>  drivers/gpu/drm/mud/mud_drm_gadget.c     |  889 ++++++++++++++++
>  drivers/mfd/Kconfig                      |    8 +
>  drivers/mfd/Makefile                     |    1 +
>  drivers/mfd/mud.c                        |  580 +++++++++++
>  drivers/pinctrl/Kconfig                  |    9 +
>  drivers/pinctrl/Makefile                 |    1 +
>  drivers/pinctrl/pinctrl-mud.c            |  657 ++++++++++++
>  drivers/pinctrl/pinctrl-mud.h            |   89 ++
>  drivers/usb/gadget/Kconfig               |   36 +
>  drivers/usb/gadget/function/Makefile     |    6 +
>  drivers/usb/gadget/function/f_mud.c      |  913 +++++++++++++++++
>  drivers/usb/gadget/function/f_mud.h      |  210 ++++
>  drivers/usb/gadget/function/f_mud_drm.c  |  181 ++++
>  drivers/usb/gadget/function/f_mud_pins.c |  962 +++++++++++++++++
>  drivers/usb/gadget/function/mud_regmap.c |  936 +++++++++++++++++
>  include/drm/drm_client.h                 |    4 +
>  include/linux/mfd/mud.h                  |   16 +
>  include/linux/regmap.h                   |   23 +
>  include/linux/regmap_usb.h               |   97 ++
>  31 files changed, 8107 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/base/regmap/regmap-usb.c
>  create mode 100644 drivers/gpu/drm/mud/Kconfig
>  create mode 100644 drivers/gpu/drm/mud/Makefile
>  create mode 100644 drivers/gpu/drm/mud/mud_drm.c
>  create mode 100644 drivers/gpu/drm/mud/mud_drm.h
>  create mode 100644 drivers/gpu/drm/mud/mud_drm_gadget.c
>  create mode 100644 drivers/mfd/mud.c
>  create mode 100644 drivers/pinctrl/pinctrl-mud.c
>  create mode 100644 drivers/pinctrl/pinctrl-mud.h
>  create mode 100644 drivers/usb/gadget/function/f_mud.c
>  create mode 100644 drivers/usb/gadget/function/f_mud.h
>  create mode 100644 drivers/usb/gadget/function/f_mud_drm.c
>  create mode 100644 drivers/usb/gadget/function/f_mud_pins.c
>  create mode 100644 drivers/usb/gadget/function/mud_regmap.c
>  create mode 100644 include/linux/mfd/mud.h
>  create mode 100644 include/linux/regmap_usb.h
> 
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

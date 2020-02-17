Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 946B216101C
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 11:32:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729224AbgBQKcf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 05:32:35 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40923 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729128AbgBQKcf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 05:32:35 -0500
Received: by mail-wm1-f67.google.com with SMTP id t14so17827450wmi.5
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 02:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OaP0FaJcagLTSICxNrpD1/SFOL88YCvMRC3wY7fBRiA=;
        b=IM0tuBKeauG72OJJ/qKJqJwqZRT+beMqCmtsKM2O6vSbfGNMTueImuYDguVsoxjDhG
         uBTWSb4P4DvwPRVKK4dwDuv8QoWb6RMqRoGLcBhXnfj9weGVB6u6RCSoHpIW7SQk45QA
         CFjPU1vKLhS3Nx473/9IER6YOx/ND4BNzOk0ajKGr+xt9bNgpPybOUZcZqPNVOfFCgX4
         AtWfPloWMGciTNLHLvbQ+uB6nu3I8kf0/VofS/xrSKjLtod9e7qDX+n0K06UDBrS8jmP
         3uxd9LcCEEf4Kf/2ez8+x/G2sBooH7mBUAk1b6bxnvfmtbBTimbGn7PxpgNJ7tTSpfR7
         Tp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OaP0FaJcagLTSICxNrpD1/SFOL88YCvMRC3wY7fBRiA=;
        b=BW9HGGoI8UKnwcOC7fkGIkR927bbEeUMZ+x6/MhZKAWAP6icd+DzIAlXIZavzJ6RYB
         w6EybummLuzy+vacFejr42OHvvEYMMYN+Km9V/kn3/Qrj2GSoEHkxlAn2cWFJ3MSzDZK
         2NhXSth/rF8KPHioYt6TcdrGM8lP+JTt/rZ793ylqthLkJdkcFcGvJnZ6HjnZh80X41O
         Fdja0Zx/88ZaS3QLUrkcSp7SRDxnzCC+ZQBRdbcNolRreTRnOpGUOTUcMwd9GOJgqOxZ
         sbqUR7ek+J94Oz1x7sW+YSGBcmL58HEtORQdjrTeU9cE305rQM5cSSn13ODWHQXNAYes
         U/eg==
X-Gm-Message-State: APjAAAUgPHsR5b4NOcgB4QCLlRmkKw2evEGK6H8P5/Y7D4jtRD3tOv0X
        jxLMQYLA/UlOjbVMK4Bt/OCSxlcHBekCuQ==
X-Google-Smtp-Source: APXvYqzbyMnrEd7xzdVjEnQxxcRK3MwJueS5Smh+GPjA0WbTPryBes72FBKFAn9lZ4k/GqaNTO6hZA==
X-Received: by 2002:a05:600c:2942:: with SMTP id n2mr20938711wmd.87.1581935552421;
        Mon, 17 Feb 2020 02:32:32 -0800 (PST)
Received: from [10.1.3.173] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z8sm289761wrq.22.2020.02.17.02.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2020 02:32:31 -0800 (PST)
Subject: Re: [RFC 0/9] Regmap over USB for Multifunction USB Device (gpio,
 display, ...)
To:     =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        broonie@kernel.org, balbi@kernel.org, lee.jones@linaro.org
Cc:     linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200216172117.49832-1-noralf@tronnes.org>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <62e6e9b1-f44a-42ae-a971-8b947763284b@baylibre.com>
Date:   Mon, 17 Feb 2020 11:32:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200216172117.49832-1-noralf@tronnes.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 16/02/2020 18:21, Noralf Trønnes wrote:
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

The idea is really like ARA's greybus, but much simpler !
Anyway nice idea, do you have good performance over USB2 and
RPi's awful DWC2 gagdet controller ?

Neil
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


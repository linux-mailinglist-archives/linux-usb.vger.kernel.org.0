Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5A454DABD4
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 08:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354208AbiCPHaz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 03:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349045AbiCPHax (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 03:30:53 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF240BC08
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 00:29:38 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id v130-20020a1cac88000000b00389d0a5c511so2678274wme.5
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 00:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kgNwF822XLCpGGuXU87MYUal/QeHjmk53OqzbsvP3bY=;
        b=xD/WCj/AZbGlstB61QBDFLGXR/Q1SP1OwvMRpNEHYlufjUEV/fKRX43+FBYIWRB0mf
         WVCcyBCJ4q+y+xkzlWFsmRK3x3aWWobiSZZ2vdJs3IOQMVrU94MJdN6vz5Ovn7wfa5o4
         ET7lGASgldMyWo+jbMPLLaIgBLsK2xFBgLY7aggnDiAy7bMK/0vvkVURJG5iWdm0WWcL
         UZtGMCGvt/mbF8H/jU+std2FfmIxQvj6Ht9Yqa18vsT7KyTG3L35XnIpwyaK01wpyVPk
         d+b6Kc8t3fZetoIQTo0BoVhBFpafF//kYTtojPOh71qD3DF1npK5grUvsKtw06O+T5YW
         IRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=kgNwF822XLCpGGuXU87MYUal/QeHjmk53OqzbsvP3bY=;
        b=pJi5swNuv8kBnIzMVXmNbIb5kYMEcDtbWkhUv1Hj12oHFDgwnOmgKFD1OlnLGWxgLB
         IMPHVMDE3FWN+CaeUycxsMGsYJ9MY0mUVvwHORz9FKIlvp5J4R27++WOMcnhTDmtLg/K
         b+B8QRKzd9ND9l3EervNCC+eFDjdMVRS3okcWloFZjdf0iWX6GF6SqPdk2cml5yGnYgr
         K67D5cj1xLNA2CtUjZqPIxm4Ay678UTNfBzdvbIogxodFKw6lzQAcXs75soVK2MzZmDf
         mAxdgqA/6dhFRB29XvyvrnhyZoaiqLkbBoroWteUv1TSYvXirdmHLvsfG9HJQOWEI1RU
         LKjg==
X-Gm-Message-State: AOAM532+4tPi6rfVTIS7VcVXGMkPHxCl97tGc222SShWKKQRE0ISiSR5
        3aEfGZLsz7LBQLRpnaYcIYlNXg==
X-Google-Smtp-Source: ABdhPJzX8MMJ0NL8uSl/FdpeIZgB04fJEiEQQC/NKc206ehgFfgEO4RvrogJnLOwzfteKqBEo+fK3Q==
X-Received: by 2002:a05:600c:3d07:b0:38b:94f2:5d17 with SMTP id bh7-20020a05600c3d0700b0038b94f25d17mr5139780wmb.67.1647415776688;
        Wed, 16 Mar 2022 00:29:36 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id p18-20020adfba92000000b001e4ae791663sm932414wrg.62.2022.03.16.00.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 00:29:36 -0700 (PDT)
Date:   Wed, 16 Mar 2022 07:29:34 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Frank Zago <frank@zago.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org, gunar@schorcht.net
Subject: Re: [PATCH v3] mfd: ch341: add driver for the WCH CH341 in I2C/GPIO
 mode
Message-ID: <YjGR3i5W4HAZfsc0@google.com>
References: <20220314030937.22762-1-frank@zago.net>
 <YjCpq8YVwmZzOzwE@google.com>
 <fee91f27-17c4-25c0-c149-3b20161429ba@zago.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fee91f27-17c4-25c0-c149-3b20161429ba@zago.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 15 Mar 2022, Frank Zago wrote:

> Hello Lee,
> 
> >> Changes from v2:
> >>   - bug fixes
> >>   - more robust USB enumeration
> >>   - Changed to an MFD driver as suggested
> > 
> > Perhaps you should have engaged with me before potentially wasting
> > your valuable time.
> > 
> > MFD is designed to take a parent platform driver and split it out into
> > various sub-systems.  If you don't use the MFD Core API (which is the
> > case here) it is not an MFD.  MFD is not a dumping ground for
> > collections of random device drivers.
> > 
> > I have no problem with you placing registration and core code inside
> > MFD (that *is* what it was designed for), but the leaf 'functionality'
> > should be placed in more appropriate locations.
> > 
> > I2C  => drivers/i2c
> > SPI  => drivers/spi
> > GPIO => drivers/gpio (or perhaps drivers/pinctrl)
> > USB  => drivers/usb
> > UART => drivers/tty/serial
> > 
> > Etc ... Find places for everything.
> > 
> > Anything left over, give to Greg (drivers/misc). :)
> > 
> 
> AFAICS that works if the driver is built-in, but not as a module. 

How did you reach that conclusion?

I expect most of the drivers in MFD and their children to be modules.

  `git grep module_.*_driver -- drivers/mfd/`

> I'd prefer that driver to be a module if desired, and have all its files in the same
> place instead of scattered in various directories.

The design and organisation of the kernel does not work like that.

> I can try drivers/misc if it's a better place.

I suspect you'll receive the same advice from Greg and Arnd.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

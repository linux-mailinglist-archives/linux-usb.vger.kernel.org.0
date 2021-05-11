Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5121937B053
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 22:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhEKUxG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 16:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhEKUxE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 16:53:04 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D9CC061574
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 13:51:57 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so2082394pjv.1
        for <linux-usb@vger.kernel.org>; Tue, 11 May 2021 13:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W5Qnc5EzfFj0jm8fDMB9beWK5EJEiWj/P1PBb+TTDU4=;
        b=Dw71iMV5v2wlQEl77x7OfgTIWjZi6CpYIJ0+hmePGAqo46ugJF51AMPWD0wocbzmSx
         er6tOHuuqaljxhXiPpxJPtYFKoGI5TFML6ZV+q1QLOfwcE/A1QxVBT3MpWHQrr3oDsRs
         GeZpsbchM7C9s16yBZjdpBPEL7E4jKiw8GT68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W5Qnc5EzfFj0jm8fDMB9beWK5EJEiWj/P1PBb+TTDU4=;
        b=P7OIFh4v4Eg/btTzGd4StbniGu2ef+OeU7e4MJamXHYOOVBzX39vf3cv3khLi4u8N1
         EtatsPbuu4/HUFIRgREl6Q3L+qGRgyJJ6JmgrNtBMkPx3c4DMdI1as9ga7qGe5kJendj
         YQXXmrHFOHwx5+dhXT1v4UmawlhZbIeaX6yFI8fuHPOQ11uBjQp1Fvgu4d6d9qXKlPkU
         xfvyI9kdIH4ReXJS6sekCdofTX1K/iIapXGzxHDyzOW8wNUjtbsMwJ0ApGc6H+ady+Iw
         AAprlF6vjb4zJ3EWRpJqUzhjK/CVX67+Dh/pRWV9cjiFaMLDT9WeYe+Bj5HjZgjROMwJ
         QvEg==
X-Gm-Message-State: AOAM531N51+Vk7Z4ilO7k25Vc5o1pc03V9LeS4WZ4THx0/T9zD87mewY
        HE9pmHmD6/idEsWI6IPJWkjd7w==
X-Google-Smtp-Source: ABdhPJzNaApiUg1KYiw0HcH4Ed97zxZ22/krtu4Ajv+hOhcNDJNl+160VLBQ+7+8YXDXnF8Xrpp6jA==
X-Received: by 2002:a17:902:b104:b029:ee:beb3:ef0a with SMTP id q4-20020a170902b104b02900eebeb3ef0amr31720154plr.80.1620766316776;
        Tue, 11 May 2021 13:51:56 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:f1d7:673a:456e:c653])
        by smtp.gmail.com with UTF8SMTPSA id f14sm961036pjj.53.2021.05.11.13.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 13:51:56 -0700 (PDT)
Date:   Tue, 11 May 2021 13:51:54 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>, kbuild-all@lists.01.org,
        Peter Chen <peter.chen@kernel.org>,
        Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v9 4/5] usb: host: xhci-plat: Create platform device for
 onboard hubs in probe()
Message-ID: <YJruarGVOZPdy7y1@google.com>
References: <20210503124408.v9.4.I7a3a7d9d2126c34079b1cab87aa0b2ec3030f9b7@changeid>
 <202105061414.b3RnwEfI-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202105061414.b3RnwEfI-lkp@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 06, 2021 at 02:24:53PM +0800, kernel test robot wrote:
> Hi Matthias,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on driver-core/driver-core-testing]
> [also build test ERROR on linus/master v5.12 next-20210506]
> [cannot apply to usb/usb-testing robh/for-next char-misc/char-misc-testing]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Matthias-Kaehlcke/USB-misc-Add-onboard_usb_hub-driver/20210504-034618
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git 9ccce092fc64d19504fa54de4fd659e279cc92e7
> config: parisc-randconfig-c024-20210505 (attached as .config)
> compiler: hppa-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/ce77fd553380117a63f633ab2cd2652c22a3ff98
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Matthias-Kaehlcke/USB-misc-Add-onboard_usb_hub-driver/20210504-034618
>         git checkout ce77fd553380117a63f633ab2cd2652c22a3ff98
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross W=1 ARCH=parisc 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    hppa-linux-ld: drivers/usb/host/xhci-plat.o: in function `xhci_plat_probe':
> >> (.text+0x70c): undefined reference to `of_is_onboard_usb_hub'

The relevant config options are:

  CONFIG_COMPILE_TEST=y
  CONFIG_USB_XHCI_PLATFORM=y
  # CONFIG_USB_ONBOARD_HUB is not set

and include/linux/usb/onboard_hub.h has:

  #if defined(CONFIG_USB_ONBOARD_HUB) || defined(CONFIG_COMPILE_TEST)
  bool of_is_onboard_usb_hub(const struct device_node *np);
  #else
  static inline bool of_is_onboard_usb_hub(const struct device_node *np)
  {
  	return false;
  }
  #endif

So it looks like '|| defined(CONFIG_COMPILE_TEST)' should be removed to
use the stub for CONFIG_COMPILE_TEST (or the actual function if
CONFIG_USB_ONBOARD_HUB is also enabled).

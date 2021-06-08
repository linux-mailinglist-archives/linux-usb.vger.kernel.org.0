Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5973A055D
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 22:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbhFHU5v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 16:57:51 -0400
Received: from mail-pl1-f179.google.com ([209.85.214.179]:36862 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhFHU5u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Jun 2021 16:57:50 -0400
Received: by mail-pl1-f179.google.com with SMTP id x10so11364978plg.3
        for <linux-usb@vger.kernel.org>; Tue, 08 Jun 2021 13:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6hYA66ZCbNvcE8qzws0oh1fPqhir7ALyY56AO7honLQ=;
        b=LMM6fXOepDzE9S+l3clqDXE4NGXVT6d5j4/IJQ9hIibDgk9AAXI/f39c+o19h+35z/
         IIVyxGQVGMfNDMofrh+Ua9BT04U26qI60S1GF1xoKJX0gDytiU1l3GYypXDJlDrmbkPt
         SD2LsPe6ctTV86BwOxEyIzf7vEmVb7YeavJFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6hYA66ZCbNvcE8qzws0oh1fPqhir7ALyY56AO7honLQ=;
        b=oiYAmUOG7p9dIfTG37R6Whzh4EvG9CGehA59tgWRj7kF8+1xlOM2KBV6BKycRD5npR
         8xuKwozKBD7x2zBemo/K6OBVdH9t/XGRxQY1pycadigx9iENpqIcNzYcpQFmhiTDa7WS
         GbQkPIbXa4Vj9IlkFEyl7eYOAhVLPWPHgn/93IjHN4CwwOoaUJFfIRwGYUlmEzL4G5Nn
         IskrFQi2BnFzBBsbct0pHDbQmGj2ByL6rUqG4Ne/5dWT/qChdjnsSNYUAsAkG7QtL/f+
         lVJ2g2VR8jQiD6sPLcFs/8NX5I2MD5e3ARbf1ugafmFBxVxWOWqORAkyieqNYbml0W6i
         6PnQ==
X-Gm-Message-State: AOAM530hN15i32dadQE029k4mj6NNluYhfKz6yJoAKCnFhrLO0N5VG3p
        RUihq4/mfZNa2+ow7hjwUP59Nw==
X-Google-Smtp-Source: ABdhPJxeyclDf1gRAz7+KzkZI1FeivoAM1vIDkxEilRDGxPTAdvn7VtLXxL6cyQP316OupuUaJKNjQ==
X-Received: by 2002:a17:902:be0d:b029:f9:c913:821f with SMTP id r13-20020a170902be0db02900f9c913821fmr1645365pls.2.1623185697594;
        Tue, 08 Jun 2021 13:54:57 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:337e:d5fa:6c05:db83])
        by smtp.gmail.com with UTF8SMTPSA id gw21sm16244073pjb.41.2021.06.08.13.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 13:54:57 -0700 (PDT)
Date:   Tue, 8 Jun 2021 13:54:55 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kernel test robot <lkp@intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        kbuild-all@lists.01.org, Michal Simek <monstr@monstr.eu>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        linux-usb@vger.kernel.org, Bastien Nocera <hadess@hadess.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/5] USB: misc: Add onboard_usb_hub driver
Message-ID: <YL/ZHyvnRlS4AC5N@google.com>
References: <20210604144027.v11.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <202106050751.uNo0uAEm-lkp@intel.com>
 <YL5cvT4NvMLIuH+C@google.com>
 <YL5kL38o8JLDp8LK@kroah.com>
 <YL5mP4lGoiHNjAYN@google.com>
 <YL8wqCQZvim7iB02@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YL8wqCQZvim7iB02@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 08, 2021 at 10:56:08AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jun 07, 2021 at 11:32:31AM -0700, Matthias Kaehlcke wrote:
> > On Mon, Jun 07, 2021 at 08:23:43PM +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Jun 07, 2021 at 10:51:57AM -0700, Matthias Kaehlcke wrote:
> > > > On Sat, Jun 05, 2021 at 07:18:38AM +0800, kernel test robot wrote:
> > > > > Hi Matthias,
> > > > > 
> > > > > I love your patch! Perhaps something to improve:
> > > > > 
> > > > > [auto build test WARNING on next-20210604]
> > > > > [also build test WARNING on v5.13-rc4]
> > > > > [cannot apply to usb/usb-testing robh/for-next char-misc/char-misc-testing driver-core/driver-core-testing linus/master v5.13-rc4 v5.13-rc3 v5.13-rc2]
> > > > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > > > And when submitting patch, we suggest to use '--base' as documented in
> > > > > https://git-scm.com/docs/git-format-patch]
> > > > > 
> > > > > url:    https://github.com/0day-ci/linux/commits/Matthias-Kaehlcke/USB-misc-Add-onboard_usb_hub-driver/20210605-054213
> > > > > base:    ccc252d2e818f6a479441119ad453c3ce7c7c461
> > > > > config: arc-allyesconfig (attached as .config)
> > > > > compiler: arceb-elf-gcc (GCC) 9.3.0
> > > > > reproduce (this is a W=1 build):
> > > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > > >         chmod +x ~/bin/make.cross
> > > > >         # https://github.com/0day-ci/linux/commit/7107f99a12058b7147342c6f763d026102bd6606
> > > > >         git remote add linux-review https://github.com/0day-ci/linux
> > > > >         git fetch --no-tags linux-review Matthias-Kaehlcke/USB-misc-Add-onboard_usb_hub-driver/20210605-054213
> > > > >         git checkout 7107f99a12058b7147342c6f763d026102bd6606
> > > > >         # save the attached .config to linux build tree
> > > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arc 
> > > > > 
> > > > > If you fix the issue, kindly add following tag as appropriate
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > 
> > > > > All warnings (new ones prefixed by >>):
> > > > > 
> > > > > >> drivers/usb/misc/onboard_usb_hub.c:400:6: warning: no previous prototype for 'onboard_hub_create_pdevs' [-Wmissing-prototypes]
> > > > >      400 | void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
> > > > >          |      ^~~~~~~~~~~~~~~~~~~~~~~~
> > > > > >> drivers/usb/misc/onboard_usb_hub.c:458:6: warning: no previous prototype for 'onboard_hub_destroy_pdevs' [-Wmissing-prototypes]
> > > > >      458 | void onboard_hub_destroy_pdevs(struct list_head *pdev_list)
> > > > >          |      ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > > 
> > > > Oh, I wasn't aware that prototypes are required for public functions.
> > > 
> > > How else can they be called?
> > 
> > Well, there are prototypes in include/linux/usb/onboard_hub.h, however this
> > header isn't included (anymore) by the driver itself to avoid conflicts
> > when COMPILE_TEST=y (see https://lkml.org/lkml/2021/5/25/975).
> 
> Then that needs to be resolved please.

I already sent at least two versions exclusively to deal with related
issues, but there are still configurations that cause trouble, I
would appreciate some guidance here.

The latest issue was:

> I get a build error when I apply this series to my tree:
> 
> drivers/usb/misc/onboard_usb_hub.c:273:6: error: redefinition of ‘of_is_onboard_usb_hub’
>   273 | bool of_is_onboard_usb_hub(const struct device_node *np)
>       |      ^~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/usb/misc/onboard_usb_hub.c:21:
> ./include/linux/usb/onboard_hub.h:9:20: note: previous definition of ‘of_is_onboard_usb_hub’ with type ‘bool(const struct device_node *)’ {aka ‘_Bool(const struct device_node *)’}
>     9 | static inline bool of_is_onboard_usb_hub(const struct device_node *np)
>       |                    ^~~~~~~~~~~~~~~~~~~~~

This was with the following declaration in the header:

  #ifdef CONFIG_USB_ONBOARD_HUB
  bool of_is_onboard_usb_hub(const struct device_node *np);
  #else
  static inline bool of_is_onboard_usb_hub(const struct device_node *np)
  {
    return false;
  }
  #endif

My initial assumption was that in this case the configuration was
COMPILE_TEST=y and USB_ONBOARD_HUB=n, however should onboard_usb_hub.c
even be compiled with USB_ONBOARD_HUB=n? IIUC COMPILE_TEST=y allows
to compile certain drivers even when they couldn't actually run/be
loaded on the target platform, but the config option would still need
to be enabled.

Then again, there was apparently an attempt to compile onboard_usb_hub.c,
however the static inline from the header was picked, which suggests
CONFIG_USB_ONBOARD_HUB=n.

Also please let me know if you have other comments besides the prototype
question, I'd prefer to avoid version churn if possible, this series
already had a bit of that primarily due to the prototype issue.

Thanks

Matthias

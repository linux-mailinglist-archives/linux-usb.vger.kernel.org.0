Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 672B93D30B6
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jul 2021 02:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232763AbhGVXhD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jul 2021 19:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232697AbhGVXhD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jul 2021 19:37:03 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED97C061575
        for <linux-usb@vger.kernel.org>; Thu, 22 Jul 2021 17:17:36 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id a17-20020a17090abe11b0290173ce472b8aso6609950pjs.2
        for <linux-usb@vger.kernel.org>; Thu, 22 Jul 2021 17:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vII52lR5avF5/D7xMgIb0yTqZk8+0rt8gmIw50zl2ag=;
        b=aGA7GyrF6vTN9WKQmL++RXdUAyrqCyzmeO9DJGI9ESX4rBQboOjVZEzj7yTV1HhyiW
         STszhq8KhzQVIpNxc1g9UHzJBCJv2ubOcqr2HDh4fJi9EeddgmRWYQCxfcsMoemasgOM
         wTrgqA7OAV+0ZONUr42S8DXE9eb4VuicsPM3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vII52lR5avF5/D7xMgIb0yTqZk8+0rt8gmIw50zl2ag=;
        b=GjFPp5C6r64bdHPQyIAfqS9oMjgUxiGwREvALA7Jlc4DEbGvKL9i/2XzWZ/wEx9oFl
         QP0KPFAq4/Jyichanm8Dwv3JAV1pdzuQqxJB4u8qcvczgBBEsFVcxxawpnqSgus2WYQ/
         JCoi0DQUrZZxzxwFoeSImBpYazATYKeHuleDJEMQEKWvUebxN7oeomFsiWRaL7+TYMQr
         tLYwshUkwt1IKM+KmXl1CeuwmqOo/yqHFMMExYAeti8VxwoS0ICukukWEeFvfmHJllhE
         0patCyO+bEkXsg3EQ7uA7U2j84aFHT7Jz8kKM+9Dw2X9I5pYcky0UQPd+V30NkhpwhA+
         4Bew==
X-Gm-Message-State: AOAM533ItFwQdNzmGyxDUDaCIzdO1fq3kfKxC0Ncnqv0JT3h5cDs7p3j
        UopvExHvt5juCfxXCch5aW5+AQ==
X-Google-Smtp-Source: ABdhPJxpYVOU3EygLgcLac/ndORv1V2smY4bgwoMBiWOJJTRP9/yB6XCce7j+eSQijDZXcRBWjJkdw==
X-Received: by 2002:a17:902:e752:b029:12b:8ae3:e9e9 with SMTP id p18-20020a170902e752b029012b8ae3e9e9mr1756503plf.33.1626999456250;
        Thu, 22 Jul 2021 17:17:36 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:bbf7:30ab:1e60:9786])
        by smtp.gmail.com with UTF8SMTPSA id u24sm32701196pfm.200.2021.07.22.17.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 17:17:35 -0700 (PDT)
Date:   Thu, 22 Jul 2021 17:17:34 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>, kbuild-all@lists.01.org,
        Michal Simek <monstr@monstr.eu>, linux-usb@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Bastien Nocera <hadess@hadess.net>
Subject: Re: [PATCH v14 4/6] usb: Specify dependencies on USB_XHCI_PLATFORM
 with 'depends on'
Message-ID: <YPoKnkttCyCHHn4T@google.com>
References: <20210719152055.v14.4.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
 <202107210812.LLUZpfu9-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202107210812.LLUZpfu9-lkp@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 21, 2021 at 08:46:17AM +0800, kernel test robot wrote:
> Hi Matthias,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on usb/usb-testing]
> [also build test ERROR on robh/for-next driver-core/driver-core-testing linus/master v5.14-rc2 next-20210720]
> [cannot apply to char-misc/char-misc-testing]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Matthias-Kaehlcke/usb-misc-Add-onboard_usb_hub-driver/20210720-144614
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> config: i386-randconfig-a003-20210720 (attached as .config)
> compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/0day-ci/linux/commit/1ac4caccda0f2e6904b0e1462bc9735c690d719f
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Matthias-Kaehlcke/usb-misc-Add-onboard_usb_hub-driver/20210720-144614
>         git checkout 1ac4caccda0f2e6904b0e1462bc9735c690d719f
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    ld: drivers/usb/dwc3/core.o: in function `dwc3_resume_common':
> >> drivers/usb/dwc3/core.c:1853: undefined reference to `dwc3_gadget_resume'
>    ld: drivers/usb/dwc3/core.o: in function `dwc3_runtime_resume':
> >> drivers/usb/dwc3/core.c:1912: undefined reference to `dwc3_gadget_process_pending_events'
>    ld: drivers/usb/dwc3/core.o: in function `dwc3_suspend_common':
> >> drivers/usb/dwc3/core.c:1750: undefined reference to `dwc3_gadget_suspend'

What happened here is that USB_DWC3 was selected, but one of USB_DWC3_HOST,
USB_DWC3_GADGET or USB_DWC3_DUAL_ROLE.

Typically one of them would be selected by:

  choice
          bool "DWC3 Mode Selection"
          default USB_DWC3_DUAL_ROLE if (USB && USB_GADGET)
          default USB_DWC3_HOST if (USB && !USB_GADGET)
          default USB_DWC3_GADGET if (!USB && USB_GADGET)

In this case USB_XHCI_PLATFORM is not set (previously it would be selected
by USB_DWC3) and USB_DWC3_HOST (and USB_DWC3_DUAL_ROLE) now depends on it.

The following change should fix this:

  config USB_DWC3
 -        depends on (USB || USB_GADGET) && HAS_DMA
 +        depends on (USB && USB_XHCI_PLATFORM) || USB_GADGET)) && HAS_DMA

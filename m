Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01075244E64
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 20:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgHNSNz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Aug 2020 14:13:55 -0400
Received: from mga04.intel.com ([192.55.52.120]:7145 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbgHNSNz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Aug 2020 14:13:55 -0400
IronPort-SDR: u7QbS7WZk1MiAGm9E3MI05IXXrkF3oyjzL5jBFjPblWuWzlTRbObaGLPCpl4JKFhnzPuLRVB4L
 8VAWvKnBo6Eg==
X-IronPort-AV: E=McAfee;i="6000,8403,9713"; a="151879837"
X-IronPort-AV: E=Sophos;i="5.76,313,1592895600"; 
   d="scan'208";a="151879837"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2020 11:13:54 -0700
IronPort-SDR: Nmtv3c/6JAeu51g46WNTSTQGAT4DNwiLMvs+3qC1OigKDZjUh8QcE9jtuay2ThbVfLie1g9wlX
 x52ICC1SpOAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,313,1592895600"; 
   d="scan'208";a="325792702"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 14 Aug 2020 11:13:53 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k6e6q-008iLn-4c; Fri, 14 Aug 2020 21:07:20 +0300
Date:   Fri, 14 Aug 2020 21:07:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     John Garry <john.garry@huawei.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [Report]: BUG: KASAN: use-after-free in usb_hcd_pci_remove
Message-ID: <20200814180720.GE1891694@smile.fi.intel.com>
References: <b5f23591-50c1-f01e-31a0-879eeec3ab3f@huawei.com>
 <20200813182811.GA4035999@kroah.com>
 <00274550-e14c-79a8-7c6e-aa58ada74fd4@huawei.com>
 <30a8c4ca-64c2-863b-cfcd-0970599c0ba3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30a8c4ca-64c2-863b-cfcd-0970599c0ba3@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 14, 2020 at 06:18:16PM +0100, John Garry wrote:

Thanks for notifying me, my comments below.

...

> From a3b9e1b405d1efdfee2ee672bbf7dc1c7de62d66 Mon Sep 17 00:00:00 2001
> From: John Garry <john.garry@huawei.com>
> Date: Fri, 14 Aug 2020 18:14:51 +0100
> Subject: [PATCH] usb: hcd: Fix use-after-free in usb_hcd_pci_remove()
> 
> KASAN reports when CONFIG_DEBUG_TEST_DRIVER_REMOVE is enabled:

Please, reduce these huge trace backs, they have a lot of unneeded bulk.

> ==================================================================
> [58.095667] BUG: KASAN: use-after-free in usb_hcd_pci_remove+0xbc/0x168
> [58.102272] Read of size 8 at addr ffff002a0b6e8120 by task swapper/0/1

...

> [58.497758]  ffff002a0b6e8200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> fb fb
> [58.504968]
> ==================================================================
> 
> Fix by relocating the usb_put_hcd() call until after the hcd->driver->flags
> check.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>
> 
> diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
> index 4dc443aaef5c..44a8d3644973 100644
> --- a/drivers/usb/core/hcd-pci.c
> +++ b/drivers/usb/core/hcd-pci.c
> @@ -346,9 +346,9 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
>  		dev_set_drvdata(&dev->dev, NULL);
>  		up_read(&companions_rwsem);
>  	}
> -	usb_put_hcd(hcd);
>  	if ((hcd->driver->flags & HCD_MASK) < HCD_USB3)
>  		pci_free_irq_vectors(dev);
> +	usb_put_hcd(hcd);

It's not correct approach.
We need to copy flags to a temporary variable.
I will send a new patch soon to test, thanks!

>  	pci_disable_device(dev);
>  }
>  EXPORT_SYMBOL_GPL(usb_hcd_pci_remove);

-- 
With Best Regards,
Andy Shevchenko



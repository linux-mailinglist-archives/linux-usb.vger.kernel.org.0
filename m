Return-Path: <linux-usb+bounces-1604-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F03C7C8DF7
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 21:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C771B20B65
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 19:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5763524212;
	Fri, 13 Oct 2023 19:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8hPO4co"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39CB1C29B
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 19:55:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC56AD;
	Fri, 13 Oct 2023 12:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697226913; x=1728762913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=68JJ7XqWYEhdYbfx8XacG3bVDmgPmxyq3uAcgh/iPk0=;
  b=b8hPO4coDHsZ0rJobn+z+deb/ozYCCDrPYjWoE23eaC+PiLjroWo5Wjh
   m5hqk2K/bPKWmCIwDnbPl5KbIxCwFRfvJWE+l6mqJsM/p1oWLMXW4Rjob
   ju4C5rFNbhLaCc0k9peEKVWzBMA/hnB+R5HaSdSgE20F3hLwO2BrVZjO+
   L1Kk3amqJQsOr/fElv12oKv8QFeuriby7x/G7aMdLar8NeH/ThglYFhmK
   0ui1ICr/B0hHZam7SKJpHpNbIEfCgp+2UACu5Qt3qVWnkwQdGTdhIFrI8
   IqFp66vTXUsePAwnNdPfFhnQ2t00/XWNeUgbc2qgh2F1/SdAXkBkbbflt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="365519011"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="365519011"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 12:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="898685373"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="898685373"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 12:53:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qrOFY-00000005Js9-0vUI;
	Fri, 13 Oct 2023 22:55:08 +0300
Date: Fri, 13 Oct 2023 22:55:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hongren Zheng <i@zenithal.me>
Cc: Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [PATCH -next] usb/usbip: fix wrong data added to platform device
Message-ID: <ZSmgmw+//ymBHtfN@smile.fi.intel.com>
References: <ZSkhWa5wmAGsAdCK@Sun>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSkhWa5wmAGsAdCK@Sun>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Oct 13, 2023 at 06:52:09PM +0800, Hongren Zheng wrote:
> .data of platform_device_info will be copied into .platform_data of
> struct device via platform_device_add_data.
> 
> However, vhcis[i] contains a spinlock, is dynamically allocated and
> used by other code, so it is not meant to be copied. The workaround
> was to use void *vhci as an agent, but it was removed in the commit
> suggested below.
> 
> This patch adds back the workaround and changes the way of using
> platform_data accordingly.

Thanks for fixing this.

...

> -	struct vhci *vhci = dev_get_platdata(hcd->self.controller);

> -

The blank line here is on purpose.

> +	struct vhci *vhci = *((void **)dev_get_platdata(hcd->self.controller));

-- 
With Best Regards,
Andy Shevchenko




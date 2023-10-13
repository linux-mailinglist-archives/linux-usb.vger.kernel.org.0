Return-Path: <linux-usb+bounces-1605-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB95B7C8E05
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 21:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A53F01C2122E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 19:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2498B250E1;
	Fri, 13 Oct 2023 19:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1stEPS2"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD8B1428A
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 19:58:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2ECCE;
	Fri, 13 Oct 2023 12:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697227105; x=1728763105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bgfmh1ZnunbqsvNWTPsxu1umgXA01kRIlA1XHogR3lc=;
  b=l1stEPS2OFmNIm1INCLSeTGRlWwDTPJTzxhWWb68XP5NquEdKWQOEco+
   zMlYfAmamlnqElUt+t0M/sx6IBnpWnUj66NE4EqCLgMVKFf9JJpDStaZh
   sJxXfR76s8waoniIGGR3o91BUdYfYEs6mF63tQmhycFEC8Pds2l3hPCsD
   V6KFEyMy0ZSnP7vhJKXHSV/GgxbcKlWSyaHKPyqqACcfCXKaGUsE7crrc
   MQbKEL0njU+LWoodlp9aweTDQJOQjFlLUzgD50BOSXa12PwIc2UUNajhe
   tgVEqM+L62P1SCoiZH61chBCBAhp3tpzRdOShkr4cqRKPkplltmU+56tQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="3861467"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="3861467"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 12:58:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="845599505"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="845599505"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 12:58:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qrOIM-00000005JuR-3tMn;
	Fri, 13 Oct 2023 22:58:02 +0300
Date: Fri, 13 Oct 2023 22:58:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hongren Zheng <i@zenithal.me>
Cc: Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [PATCH -next] usb/usbip: fix wrong data added to platform device
Message-ID: <ZSmhSozvQfggY8Cg@smile.fi.intel.com>
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

...


One more thing...

>  static int __init vhci_hcd_init(void)
>  {
>  	int i, ret;
> +	void *vhci;
>  
>  	if (usb_disabled())
>  		return -ENODEV;
> @@ -1522,10 +1522,11 @@ static int __init vhci_hcd_init(void)
>  		goto err_driver_register;
>  
>  	for (i = 0; i < vhci_num_controllers; i++) {

> +		vhci = &vhcis[i];

This should be

		void *vhci = &vhcis[i];

because otherwise we mix code and definitions which is not so good style. (Yet
we allow to do that in exceptional cases: 1) iterators in for-loops, and 2)
RAII allocations with __free() in use.)

>  		struct platform_device_info pdevinfo = {
>  			.name = driver_name,
>  			.id = i,
> -			.data = &vhcis[i],
> +			.data = &vhci,
>  			.size_data = sizeof(void *),
>  		};

-- 
With Best Regards,
Andy Shevchenko




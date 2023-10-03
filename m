Return-Path: <linux-usb+bounces-1004-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9467B64AF
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 10:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 7A9681C2042F
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 08:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA823DDBB;
	Tue,  3 Oct 2023 08:50:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A00ADDB6
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 08:50:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C81EAF;
	Tue,  3 Oct 2023 01:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696323022; x=1727859022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bsIPAoe9uQsjZTCUKSh/8bZVh/ODAdfnpu5PZQbpYK4=;
  b=a4FCVLwmubfVAppI9gtvCoZk3RCMww3vi4D6hgkqh0PhEFKWIUZB5oRW
   ZDswUqqTcXFUelF+Dau8ukMYL20QCf2X+xNVQUwV338QdhlssPIAlgIun
   z9JrtbgPcnLAuDu1M9lm8Bzws0h9y5EW/N2Zm9sp5aMcow0gRGB3aL/JZ
   9ByUuVN6DJsknpIvUS9yA9FlKMqjfzl4WK0YVkfrqfW6avRYfLA/fNxsx
   Vr5vlarJgIquOrxojDKQaViwLA2G0KuADqoS47NfgYdW+0fgN3BVA/cWJ
   jyiBBfMdFLPsgj4GNUMA3OeWLVVDIt2xK5pjoSY2taoY5BGMs6sOfZPzt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="381706793"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="381706793"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 01:50:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="894402870"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="894402870"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 01:48:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qnb6f-00000002RAU-0Ufi;
	Tue, 03 Oct 2023 11:50:17 +0300
Date: Tue, 3 Oct 2023 11:50:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 03/10] xhci: dbc: Use sysfs_emit() to instead of
 scnprintf()
Message-ID: <ZRvVyN7A/AWoZLj5@smile.fi.intel.com>
References: <20231002161610.2648818-3-andriy.shevchenko@linux.intel.com>
 <202310030150.M1SfrYmG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310030150.M1SfrYmG-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 03, 2023 at 02:03:53AM +0800, kernel test robot wrote:


> All warnings (new ones prefixed by >>):
> 
>    drivers/usb/host/xhci-dbgcap.c: In function 'dbc_show':
> >> drivers/usb/host/xhci-dbgcap.c:926:34: warning: unused variable 'p' [-Wunused-variable]
>      926 |         const char              *p;
>          |                                  ^

Indeed, forgot to remove it...

Mathias, tell me if you want a v2 of this patch or the entire series.

-- 
With Best Regards,
Andy Shevchenko




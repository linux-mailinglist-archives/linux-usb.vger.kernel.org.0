Return-Path: <linux-usb+bounces-1657-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D061D7CA0E4
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 09:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BCBE2815F7
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 07:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92074171CA;
	Mon, 16 Oct 2023 07:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzSuSai+"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3CDA2D
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 07:40:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9B210B;
	Mon, 16 Oct 2023 00:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697442041; x=1728978041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NgdSAXAr5Yv++6YFDE2oc6WmnDXuiL3XQf8bVDd1u/k=;
  b=MzSuSai+maCcLYImlRpbQHrbTKlP8Hq5DsrPNyPiCUEEpnKMPgAJLsGy
   pHmISe5UeFEzL4elqwnBgNKlOWWgYMR2c/b2Su08Gd97zQ3uLfg2DEi+7
   RbeADN+6jcvzDCvcnC8ofe7UkqzX1ghKEzb3W0PXhDXtVGTDntCspWITH
   5Jg/BNfLyuWTzn75+Jn0zA/XZMpjQH+hwny/O+vPc6/Tc7M98zUZ1Y1lG
   1xxC2xDmvAz3aSTPp2HL8QPr2y0dbcLCW37bZ/xcWiX3gikBKUN+uIHNS
   PYjsGEwVUOL/IrgRcgyj7yXSiJIxVKIzx1lxZ+W8R1e7Qqymr5ZaFfXYZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="384342828"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="384342828"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 00:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="732203277"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="732203277"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 00:40:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qsIDL-00000005x24-3L40;
	Mon, 16 Oct 2023 10:40:35 +0300
Date: Mon, 16 Oct 2023 10:40:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hongren Zheng <i@zenithal.me>
Cc: Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [PATCH v2 -next] usb/usbip: fix wrong data added to platform
 device
Message-ID: <ZSzo816RQEP1ha/l@smile.fi.intel.com>
References: <ZSpHPCaQ5DDA9Ysl@Sun>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSpHPCaQ5DDA9Ysl@Sun>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Oct 14, 2023 at 03:46:04PM +0800, Hongren Zheng wrote:
> .data of platform_device_info will be copied into .platform_data of
> struct device via platform_device_add_data.

platform_device_add_data()

> However, vhcis[i] contains a spinlock, is dynamically allocated and
> used by other code, so it is not meant to be copied. The workaround
> was to use void *vhci as an agent, but it was removed in the commit
> suggested below.
> 
> This patch adds back the workaround and changes the way of using
> platform_data accordingly.

Good learning to me, thank you for the fix!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




Return-Path: <linux-usb+bounces-2872-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EDA7EAF84
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 12:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C903EB20B26
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 11:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C693C699;
	Tue, 14 Nov 2023 11:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4cf7BEg"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3940F2374B
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 11:51:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05968DD
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 03:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699962692; x=1731498692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aNdo2bdFlrLCrU6Ludhf7SjRGjzIpszpHTY11xqzaNY=;
  b=C4cf7BEgTOi1yYymg13UfH/dDDRfcxYhlh7cf4ZHJPo+JIhtBn/4S+IM
   e1XoTGG8AJrohu8ZT9dO6S/lAWitd1kun5sG40U3D92sDYo0L6Is+w3Os
   dLvEOL+fiNtuw6qdwRD48VX03LIAbmkEYj2B22A+xqAZmNkDV56TKDHOu
   Q3e1lmz0GTxr3kbd6HaLJXeK4/lyx+HUgGVBm3goB/AvUfnFjzIAwT0fK
   ZbKEVbbbpM7LtaioYC8qwc19hh4+bq7OmuM8Uyju5lN1MEox1cgeZjkky
   DGBSkmLgUQ0XsbIjI1heo2OHhuyv+dc9Z3Y8fNwmWe2+ufHPYqLU7La1Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="9278118"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="9278118"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 03:51:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1096071597"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="1096071597"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 03:51:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r2rx1-0000000DnZC-20RO;
	Tue, 14 Nov 2023 13:51:27 +0200
Date: Tue, 14 Nov 2023 13:51:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wentong Wu <wentong.wu@intel.com>
Cc: hdegoede@redhat.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: misc: ljca: Drop _ADR support to get ljca children
 devices
Message-ID: <ZVNfPyuNS7Drzo3u@smile.fi.intel.com>
References: <20231114072531.1366753-1-wentong.wu@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114072531.1366753-1-wentong.wu@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 14, 2023 at 03:25:31PM +0800, Wentong Wu wrote:
> Currently the shipped platforms use only _HID to distinguish
> ljca children devices. The _ADR support here is for future HW.
> This patch is to drop _ADR support and we can then re-introduce
> it (revert this patch) if future HW actually starts using _ADR
> to distinguish children devices.

Thank you!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko




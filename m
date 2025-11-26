Return-Path: <linux-usb+bounces-30949-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7274DC88E94
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 10:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C5543A2E26
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 09:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A2E3168E4;
	Wed, 26 Nov 2025 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2XVZShi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF581303CAF;
	Wed, 26 Nov 2025 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149036; cv=none; b=rPnfJYZC2zs+cb0lbOgbxzwSjI1SNJvy9s7Hgi/LGlM9fGfeFt6aNC2hd+2wTvNGg1t5OkWtmfAtm4jkLI/6hFpdxLOsOELfuKIwi76MZLugWO1fOKbbZ9x5pMWrL8+FCzEXCogfAs7k3KBZ6yePY/IaoJQ4LR6Qzfw3IaCKGGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149036; c=relaxed/simple;
	bh=LD4jCPyEQejJtjkSUJeBmG11UrJ99NqnFYDMTKqYSnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H87in3FxjxJgZvG57cMdGIwkFzH68LsRc/hZacE2SQNf4nKX6gUOW/NcmY2+TbSizB7839JdhHh1NV1oOFPzg2clB2QrJej5Tw8DNUI7gJM/+bx2SAt5/4TsjCkVELk5GHwor4TaRjLcJEBYKDgxm1x9jojET5xhmoEMs8+7grc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2XVZShi; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764149034; x=1795685034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LD4jCPyEQejJtjkSUJeBmG11UrJ99NqnFYDMTKqYSnE=;
  b=T2XVZShiAvNpFP8IZVMrQUA6E6x3zGs5///ssXGTvL9jA2mHT3UICcga
   UL9rencNbpcXOPQHzNEkAMFrvJr5gPyi0azygMUOsT/GP7wJMUmab6VdJ
   lpiSSPM0xvp7tc8OG9TWXnueiY/86dR7pUPGeHIezl8BKiWe/AEVeIN+i
   e4dMJRmf3Qg/8w6yopBulvw+yKVHaAvP1aOZzr7SkwEV7F71OHiFqTxmn
   D1vq8MtQD6s07uC1i4gPuQlsL1AAwIczSZfKr+7l55ESjfykKKMDTw5Ol
   u/CPBlQEDYBwzP5dOSKiXL5VKqqdywC9NkwpTcfk5wLBPkWmOyki9Zlvc
   A==;
X-CSE-ConnectionGUID: 1HB4bkjRRJGWzfbEIpAh7w==
X-CSE-MsgGUID: /9/i/BeWS32QkENUpXCWJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66065705"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66065705"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 01:23:53 -0800
X-CSE-ConnectionGUID: A9AINvWQT++eEUVA/lmRMQ==
X-CSE-MsgGUID: tRe9/BiASZCYLnFjLEWN+Q==
X-ExtLoop1: 1
Received: from iherna2-mobl4.amr.corp.intel.com (HELO kuha) ([10.124.223.25])
  by fmviesa003.fm.intel.com with SMTP; 26 Nov 2025 01:23:47 -0800
Received: by kuha (sSMTP sendmail emulation); Wed, 26 Nov 2025 11:23:41 +0200
Date: Wed, 26 Nov 2025 11:23:41 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] USB Type-C alternate mode priorities
Message-ID: <aSbHHXIFYAqLzxzY@kuha>
References: <20251124124639.1101335-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124124639.1101335-1-akuchynski@chromium.org>

Hi Andrei, guys,

Mon, Nov 24, 2025 at 12:46:35PM +0000, Andrei Kuchynski kirjoitti:
> This patch series introduces a mechanism for setting USB Type-C alternate
> mode priorities. It allows the user to specify their preferred order for
> mode selection, such as USB4, Thunderbolt, or DisplayPort.
> 
> A new sysfs attribute named 'priority' is exposed to provide user-space
> control over the mode selection process.
> 
> This series was tested on a Android OS device running kernel 6.18.0-rc6.
> 
> Changes in v5:
> - Patches 3 and 4 (v4) have been consolidated into a singular patch,
> keeping the mode priority implementation within drivers/usb/typec/class.c.
> 
> Andrei Kuchynski (4):
>   usb: typec: Add mode_control field to port property
>   platform/chrome: cros_ec_typec: Set no_mode_control flag
>   usb: typec: ucsi: Set no_mode_control flag
>   usb: typec: Expose alternate mode priority via sysfs
> 
>  Documentation/ABI/testing/sysfs-class-typec | 11 +++
>  drivers/platform/chrome/cros_ec_typec.c     |  1 +
>  drivers/usb/typec/class.c                   | 99 ++++++++++++++++++++-
>  drivers/usb/typec/class.h                   |  1 +
>  drivers/usb/typec/ucsi/ucsi.c               |  1 +
>  include/linux/usb/typec.h                   |  2 +
>  include/linux/usb/typec_altmode.h           |  1 +
>  7 files changed, 112 insertions(+), 4 deletions(-)

These are okay by me. I think we can move to the next step. But I'm
not sure we apply these before that, because the file has no effect
at the moment.

Br,

-- 
heikki


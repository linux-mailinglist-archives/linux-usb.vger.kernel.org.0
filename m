Return-Path: <linux-usb+bounces-23029-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5436A87BD3
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 11:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82EEC18903C2
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 09:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC942262D02;
	Mon, 14 Apr 2025 09:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exSeGMeG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B744E261595
	for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744622811; cv=none; b=Sd1cmztPVepzWiomn+JTamuA22JL4/v+dyAqX2HpIUrCddfpj/DMsfPnbSCRbD8+dOo4ww4+Mx1pgGtVmLiK+bKJj+Jqu3K0TiPJtowrQa0JbGVwcIKdGt7hAFX56uju94sMpYOPWKjkcPh9y/es+n/pbjLL2pH2bXk0Ws8L2fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744622811; c=relaxed/simple;
	bh=37VS89QQqIIi7aBefMZcCMzGdx4VBJJjA68P2LMe8Lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mw/M0SPF5RzN8SMnQol3SP32gLRyRMizJpAK98Kb2be5XS6LjjD3vRUbwgKj3wslz5KLbEoaO0ws8pikJZ4dsuUNqzUDP70zI6vmxtNBG2EwiyMVGZY7aTEzFHVz3L5iktDmKg/5BtLu4SGLdbcSztkSk3fKU4DN9G0PV1nv/VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exSeGMeG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744622810; x=1776158810;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=37VS89QQqIIi7aBefMZcCMzGdx4VBJJjA68P2LMe8Lc=;
  b=exSeGMeGdGWf9LUubbR3W1CnWllOOSGPIllY4Ln2dJ7VW/WYNoimPRCS
   ff7yDalQz/ZvfaX14emRighWkfnhQUqsbWntU1JUVof1PRMzhaWbEBB6/
   UB6Yqx/hnBkzXmv6tpsGF6FB8wRPEKlh4oaWbI6iXt5uyAiFisNXufW6J
   8kAUemRtb4sR3d5qm7QEL9ZVIQLL1wlkjbFzytURj7gf9zE+URGlrmj82
   VaLK6J7zW52BE1/e/pO8bXyvIgFgQzOJWtyIqiSMHNGOF8hUwQn/yDMva
   VuiRq3hnyGbb0fI+mR+S7Dae8n5fBiJlg6a4d68KJIRMIaEAZ80k/zoxw
   w==;
X-CSE-ConnectionGUID: rgXOBIWJS5KELRE39npA4w==
X-CSE-MsgGUID: bXVwkl06QFa1peuSTcoX8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46216960"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="46216960"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:26:49 -0700
X-CSE-ConnectionGUID: RpvTPs3pRb2skKtYb1WZ5Q==
X-CSE-MsgGUID: cudrLHOoT7mdY2DpOu/P0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130746520"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 14 Apr 2025 02:26:49 -0700
Message-ID: <3c6c4f72-be17-4b25-8279-912311983e0e@linux.intel.com>
Date: Mon, 14 Apr 2025 12:28:00 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] usb: xhci: set requested IMODI to the closest
 supported value
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
References: <20250408115752.1344901-1-niklas.neronin@linux.intel.com>
 <20250408115752.1344901-2-niklas.neronin@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250408115752.1344901-2-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8.4.2025 14.57, Niklas Neronin wrote:
> The function configures the Interrupt Moderation Interval (IMODI) via bits
> 15:0 in the Interrupt Moderation Register. The IMODI value is specified in
> increments of 250 nanoseconds. For instance, an IMODI register value of 16
> corresponds to 4000 nanoseconds, resulting in an interrupt every ~1ms.
> 
> Currently, the function fails when a requested IMODI value is too large,
> only logging a warning message for secondary interrupters. Prevent this by
> automatically adjusting the IMODI value to the nearest supported value.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>   drivers/usb/host/xhci-mem.c | 5 +----
>   drivers/usb/host/xhci.c     | 7 +++++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 

This patch now conflicts with the recently accepted sideband series.
Any chance you could respin this on top of that.

Otherwise whole series looks good.

Thanks
Mathias



Return-Path: <linux-usb+bounces-5072-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2032F82DAB9
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 14:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 458E21C21A8E
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 13:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89AE1756F;
	Mon, 15 Jan 2024 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LiIZhU1r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0140817585
	for <linux-usb@vger.kernel.org>; Mon, 15 Jan 2024 13:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705327046; x=1736863046;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=RG37vZkflGLMhN3A26a3EvPmmgK4um4GIMKDpVfjwms=;
  b=LiIZhU1r1Y5366BTUz+m9hU6R+v/zzBwoUO4ay8SPQlz8alH9j0GFGj2
   ACO3FapC93qzvg9toTvbkm2gESF8I1nSc0bUJBp5bLHjqpK4fkcPlHtGD
   LYb0EPpngAVm8949cSbixgXe3iuGUPvHk6CHh1Tw53E9qYUXi1MkpHehn
   ivnwg2c2r7V/VCGfs5Ox6JEk+X4nHcFTTlKbFuDbHZUmHQ/vwQhxqnkTD
   Ty7SNRt6i87yU7Jn90sH97L9mE0mTWvCax1DjPEA/re6SsIEaeKsZw6Tq
   mDZ9Me1Z1KjgL7ZcQCP6Ud8QWmA31guWEdcsqGfCocJ6GZ5dcuHszcI4y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="18222293"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="18222293"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 05:57:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="776735654"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="776735654"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga007.jf.intel.com with ESMTP; 15 Jan 2024 05:57:23 -0800
Message-ID: <a4573246-7047-dba3-efbf-3f88a952e322@linux.intel.com>
Date: Mon, 15 Jan 2024 15:58:53 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: =?UTF-8?Q?Micha=c5=82_Pecio?= <michal.pecio@gmail.com>,
 linux-usb@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>
References: <20240112235205.1259f60c@foxbook>
 <20240113214757.3f658913@foxbook> <20240114150647.18a46131@foxbook>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: "Transfer event TRB DMA ptr not part of current TD" spam after
 USB disconnection
In-Reply-To: <20240114150647.18a46131@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14.1.2024 16.06, Michał Pecio wrote:
> Hi Mathias,
> 
> I found that the code which causes my problems was specifically added
> by your commit d104d0152a97f ("xhci: fix isoc endpoint dequeue from
> advancing too far on transaction error").
> 
> Reverting this change removes the disconnection spam on my two NEC
> hosts (different boards but same 1033:0194 rev 03 chip IDs). I have no
> other hosts available to try at this time.
> 
> It also resolves similar spam and subsequent stream lockup on one
> particular pair of host adapter and device, which suffers intermittent
> transaction errors for reasons currently unknown. With d104d0152a97f
> reverted this device loses frames as expected but keeps going.
> 
> So this surely looks like the right thing to do with my NEC hosts, but
> of course d104d0152a97f was done for a reason, which apparently is that
> some (unspecified) other hosts really work differently.

Thanks for debugging this issue.

Most hosts trigger transaction error events for either every TRB as
xhci spec says, (xhci section 4.10.2) or only on the last TRB in a TD
which has the "interrupt on completion" IOC flag set.
  
If we revert d104d0152a97f and finish the td on the first error event
then we will get a similar "Transfer event TRB DMA ptr not part of current TD"
message for each remaing TRB in that TD that issues a error event.

So this case where only the fist TRB triggers an error event isn't yet
handled by the driver.

I'll take a look at it.
Can you try out some testpatches if I post them?

Thanks
Mathias



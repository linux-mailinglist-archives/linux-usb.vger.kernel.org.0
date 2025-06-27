Return-Path: <linux-usb+bounces-25180-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C19AEBA8B
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 16:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 335D0173362
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 14:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1368C2E88A2;
	Fri, 27 Jun 2025 14:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcUB1hbp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC692E1C78
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035940; cv=none; b=OiNf/9suRLFvQqROyfrlhnPr7ogvf3S4hpUMGqkU0aZ7OFEdVMW5AhxrzfZSXEI4i7OF81Bea6GwY8EKBV/CuHqbyxAg4F8Ts+IsHaNKxxRjPdYReKsnwt1mGsRjaXkZXhfwyYSGxtNSEzwX6Ag3U4pIoT9WU47HiyJpRU5mywQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035940; c=relaxed/simple;
	bh=aMBjJxYs+BQCGpEqHrTv1T9gTwTE1vDizZ1ekzLS0Us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gxp7f3ue5H+SK5NOAL+MJzZO072lSJxBjL+iP6wSpQJJLvG+tR8xoxirKCW6BRY9dLJH7nzzmxv8mdYIokvyIvIXZ0FU+uHXeQpePrXbAyuSPbYHPZEDRBwGbE0UUSKg97Vpq+TY6VR311ZzetNZow7MCMqQp3ULvkg+7r/hubY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcUB1hbp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751035939; x=1782571939;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aMBjJxYs+BQCGpEqHrTv1T9gTwTE1vDizZ1ekzLS0Us=;
  b=dcUB1hbpurYhAtRb9AWpWoqC+ZynR3gK/d80dRXQybZ+z9sA7hZ1eBBu
   f8PDZIgIyrStZeRCLu3E/r4uSYDpw8qCN0haD5Ub0sZUAc0gVFG4avu8m
   WbT7spcPdUpqZ/gQmd2kiNzwNQiYRj43qxokbs2kORlu4yrT/ble9qBIb
   uujSkyGXMt91L8bj2kxYXbA6s5QK3FEFvaIY+Srf8TbqFwUdCIWbydRZb
   WpwA/GEtfzfFgQcvlDnmWK45fB4zKo4GKD07J7zFOsvNWbRzugTPsr/79
   GPCyF2DWhJ+SGsqdyLljhd1h1t8o3vYZyRMpUS4+PM90hECgG3BE0HF3c
   A==;
X-CSE-ConnectionGUID: XI54NOxhRriBAqjz6t5Z8w==
X-CSE-MsgGUID: uUjNcJw+R2usRf+4zGSL/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57028405"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57028405"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 07:52:17 -0700
X-CSE-ConnectionGUID: LfqfSQpFSmWWAeV/857bXw==
X-CSE-MsgGUID: P2zFvpZGRY6VKw6mlf3XmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152347382"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 27 Jun 2025 07:52:16 -0700
Message-ID: <6f251f36-cdfb-4cf3-9066-e84d5842c875@linux.intel.com>
Date: Fri, 27 Jun 2025 17:52:14 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v2 1/1] usb: hub: Fix flushing and scheduling of
 delayed work tuning runtime pm
To: Mark Brown <broonie@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 stern@rowland.harvard.edu, oneukum@suse.com, konrad.dybcio@oss.qualcomm.com,
 stable@kernel.org
References: <20250627142044.3872229-1-mathias.nyman@linux.intel.com>
 <20250627142044.3872229-2-mathias.nyman@linux.intel.com>
 <e42dad63-cb3c-4bc8-9b1e-d43c8e976313@sirena.org.uk>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <e42dad63-cb3c-4bc8-9b1e-d43c8e976313@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.6.2025 17.34, Mark Brown wrote:
> On Fri, Jun 27, 2025 at 05:20:44PM +0300, Mathias Nyman wrote:
>> Delayed work to prevent USB3 hubs from runtime-suspending immediately
>> after resume was added in commit 8f5b7e2bec1c ("usb: hub: fix detection
>> of high tier USB3 devices behind suspended hubs").
> 
> This doesn't apply for me against any of mainline, pending-fixes or
> -next.

Ah, right, -next of course already has version 1 of  "usb: hub: Fix
flushing and scheduling of delayed work that tunes runtime pm"

I'll rebase this patch on top of that

Thanks
-Mathias


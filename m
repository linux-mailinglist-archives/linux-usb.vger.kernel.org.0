Return-Path: <linux-usb+bounces-19189-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F69A08FCB
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 12:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1DBC3A22C5
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 11:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E56C20B813;
	Fri, 10 Jan 2025 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQHlteBN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF881AAA1F;
	Fri, 10 Jan 2025 11:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736510128; cv=none; b=jnhSoWvdQOAs+bfGIfmtsQMg02rw4WsjT2TOXrrlot1N3HsyUpRfEdB668VsX0VHh1IbibLtNSpTfLzze4N3RFMlHOzMu9AuOzb+SNNyGHmZPnTstZ0G3rRWW13GhLr/Qmx8XfyTzQb4MZTfx3kjc9TrvKnJDnvQkSnEHXBjCug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736510128; c=relaxed/simple;
	bh=fe/vL8MFlcdhzcPms3ouaOUKW+WLHYlff63uLxLyERg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eONvYcs9hyQlWAAlZ4jCmwAJJ01RlffOVSRzDbOtY/lVvk7YyjjnR+8P/nhW7PeIrqnyik1aV/RR+YGR5opy8mvUb945hKf6LSSmNYoMFgkmPPVqe/TzuNrlc/CB/awRsUTFU8Uuvv9Iy02FOR2/sUFw98vi+JMd2ni/BdsQVlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQHlteBN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736510128; x=1768046128;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fe/vL8MFlcdhzcPms3ouaOUKW+WLHYlff63uLxLyERg=;
  b=CQHlteBNY+FlUZsEnPaBlQwnKBlo32EMpczN0PdnkoqVjSJXcXK2Hjem
   fJOufNXQtTSpcffrr0g5scZ0S4R14sbLt5hMW/h9kLDnKTD3WUaIDN0Uj
   IzuqbqDy9UldXNfQbUnSZe1Pmg/jlUiDxGQ2WtDaeK+/y3741rZwDp56M
   VOhbHaXikskI0kvlk2g37P9iLduqGB5lmKjVtBs7K6DFhwtm36beHLZKR
   4rrHmez6eiu1kJQ6wO/umPg582c96wcPc37y1S5PsKZhNVhI+FZRm2XXx
   4KTUPE2KkfmQ7AYWwhTblxCsp2ErKYOTJbb70wN7Bozp5bw4hfXkIBoRa
   w==;
X-CSE-ConnectionGUID: D+AJor1aTRysegtfqrD0Zw==
X-CSE-MsgGUID: Xg19PYg4TwanJEHhaHAvhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36683257"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36683257"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 03:55:27 -0800
X-CSE-ConnectionGUID: v7t/+wO4QCC3QJLJ2ixpUw==
X-CSE-MsgGUID: iVhhGRyAQGu9jvsHQ3YMuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108816762"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa005.jf.intel.com with ESMTP; 10 Jan 2025 03:55:25 -0800
Message-ID: <e265a4b8-7bf8-49ff-9073-d150892bb6dd@linux.intel.com>
Date: Fri, 10 Jan 2025 13:56:21 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Enable the TRB overfetch quirk on VIA VL805
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Niklas Neronin <niklas.neronin@linux.intel.com>
References: <20250107153509.727b981e@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250107153509.727b981e@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7.1.2025 16.35, Michal Pecio wrote:
> Raspberry Pi is a major user of those chips and they discovered a bug -
> when the end of a transfer ring segment is reached, up to four TRBs can
> be prefetched from the next page even if the segment ends with link TRB
> and on page boundary (the chip claims to support standard 4KB pages).
> 
> It also appears that if the prefetched TRBs belong to a different ring
> whose doorbell is later rung, they may be used without refreshing from
> system RAM and the endpoint will stay idle if their cycle bit is stale.
> 
> Other users complain about IOMMU faults on x86 systems, unsurprisingly.
> 
> Deal with it by using existing quirk which allocates a dummy page after
> each transfer ring segment. This was seen to resolve both problems. RPi
> came up with a more efficient solution, shortening each segment by four
> TRBs, but it complicated the driver and they ditched it for this quirk.
> 
> Also rename the quirk and add VL805 device ID macro.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> Link: https://github.com/raspberrypi/linux/issues/4685
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=215906
> CC: stable@vger.kernel.org

Thanks, adding to queue

-Mathias



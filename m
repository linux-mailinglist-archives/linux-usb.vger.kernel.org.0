Return-Path: <linux-usb+bounces-16866-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C86B29B661C
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2024 15:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 066141C216B6
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2024 14:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C741F6698;
	Wed, 30 Oct 2024 14:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYBrp+JN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7161B1F4274
	for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2024 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730298826; cv=none; b=CvoKfNsmF9D2JCVTYJR8ovU1PzkHPuYd2t4Q+o8q5hI3KrFycUK8vv3TtJmlui5/OXYodavwuRLMDGX9YBXCqhfYaFqNSQKctjDscQpUvnLVqlOUM+DOJErU0l25KPsCMzoUy1YmNSuYa5YEKuRLr0koM6yS1IvGS4UHasgt3A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730298826; c=relaxed/simple;
	bh=iPl6/drvSWq2LSrAlQ18OHApKYTDCqwk+AiNBX6cnQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtF/6zxePKKmrlBFW9/y/EUXLDMOf0yFaJQNL8EiZVMr0r64+NV0LudrYV9xnpe/qSmgVcINJJ0uatyoPaEPZM2iY9ATe6+kKz6bKIeUSxg2GkdE1L3U3DACRoYkBdsTdDNoE1cb3M417eL43s2zkuqTGzMl5Sfu9LksHTs2hBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYBrp+JN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730298825; x=1761834825;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iPl6/drvSWq2LSrAlQ18OHApKYTDCqwk+AiNBX6cnQU=;
  b=lYBrp+JNoRskMt7MGur1N6u3BdYAeoggCuIMRs9lABCg0t4iYQwQ1bN4
   GAtvS1RR//+idx9aS4OzD489wVO/TzAd374FWVRNRFrCZJgGbBzWF1c41
   VSOzqEXn8dg66io82yh8pLM0XvFGrHDtGpAp3eps7MZy1d9P/6cw046A0
   HZxPd1wZpH2ZQ4jtaN0SL/LN2eZv/rVl+5W7p1WZ2g7dO8cDm3dWDAt2s
   NrGoFwe7jtFje9HWIIfkiIQNZEBMO0nKBkloUqfMkFfML7/96DmZiTPxS
   zVCgxLV33dk2nuJzuYY5ARU2DUUSNeCrtbB0YjmlQpMmyC9Gj62ocPE7v
   w==;
X-CSE-ConnectionGUID: i31oQFHSRXaDVY7dIWyjKQ==
X-CSE-MsgGUID: ZkE1667lS+SLUrBedxmeFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41104372"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41104372"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 07:33:44 -0700
X-CSE-ConnectionGUID: EOuLAwM0SqOKR0qSeGyFiA==
X-CSE-MsgGUID: KF6iB9ahQ4+fhdQZsDNBgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="87476888"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa004.jf.intel.com with ESMTP; 30 Oct 2024 07:33:42 -0700
Message-ID: <6b3b47ef-bd14-4dfb-bff4-fbfd190902ef@linux.intel.com>
Date: Wed, 30 Oct 2024 16:35:56 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] usb: xhci: various xhci cleanups and improvements
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org, =?UTF-8?Q?Micha=C5=82_Pecio?=
 <michal.pecio@gmail.com>
References: <20241017130508.1293021-1-niklas.neronin@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20241017130508.1293021-1-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.10.2024 16.05, Niklas Neronin wrote:
> Here's a handful cleanups and improvements for the xHCI driver.
> 
> Niklas Neronin (8):
>    usb: xhci: simplify TDs start and end naming scheme in struct
>      'xhci_td'

Fixed commit message issue tha Michal pointed out

>    usb: xhci: move link TRB quirk to xhci_gen_setup()
>    usb: xhci: request MSI/-X according to requested amount
>    usb: xhci: improve xhci_clear_command_ring()
>    usb: xhci: remove unused arguments from td_to_noop()
>    usb: xhci: refactor xhci_td_cleanup() to return void
>    usb: xhci: add help function xhci_dequeue_td()
>    usb: xhci: remove irrelevant comment
> 
>   drivers/usb/host/xhci-mem.c  |   5 --
>   drivers/usb/host/xhci-pci.c  |  11 +--
>   drivers/usb/host/xhci-ring.c | 153 +++++++++++++++++------------------
>   drivers/usb/host/xhci.c      |  20 ++---
>   drivers/usb/host/xhci.h      |   6 +-
>   5 files changed, 88 insertions(+), 107 deletions(-)
> 

Series added,
Fixed Patch [1/8] commit message issue that Michal pointed out

Thanks
Mathias


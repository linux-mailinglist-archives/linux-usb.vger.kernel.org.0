Return-Path: <linux-usb+bounces-14177-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ED8960A96
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 14:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 518F6B251B7
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 12:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711A61BA862;
	Tue, 27 Aug 2024 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2FXkZ8k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F611A0AEA
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 12:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724762175; cv=none; b=t8YGcFXxhx21qRW8u6bpx2khWjSoPxM4dvETEBCp52CKme3RmeEp+nLao2zTLfuSWiGu2FqG43uneFwwlJcpBciSB4uMyfZrD+sE1ey39V9eNtsMQUsZiTBxr617HdYJP0WIbnOGO2qhdBw4OxE1pL5VNrvivmELdfFS6I1Q1pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724762175; c=relaxed/simple;
	bh=iXdvzeQAKuUXQf0kE4BXdiByWz9J3yuqUsik5xI5gHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EqqrAH5Xrwq5QfusYK0nEa5AXwyNq+Gpntk6U0wTKvGrpEjlfJghXhsAfLKjA5EcRSaEJThowzsYf5fjl/7hZhmmGoiedb7WowvoeunDBGs8qZNeAKQJN/ViRBNfIGCDjs77M5RPhpH/AS4j5qJQ88ExbpUTvmtYnIuvSzCC7gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2FXkZ8k; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724762174; x=1756298174;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iXdvzeQAKuUXQf0kE4BXdiByWz9J3yuqUsik5xI5gHc=;
  b=M2FXkZ8kMBdIGu8y3JQe7lGYG3o66E158TPB/pzk0GXXJIn9fYJ1kLfP
   PzJkWwobbNIhY0/GLizUWecnoiU4a9Czp6QnvdcOtdRcWbtwAo74pK8mQ
   ZN1FTWc+FFhuXoyuEprxZwG74PX9dcdO5R+TOMSbIE8xZBdvAjqbKWB5W
   UX5YnckAVvyxU8HYVG9zfmg9WKhYfkxqX994euYLomdCxX/oAZ1Cth759
   eYqvXRpaLtPp0fvKgJn+cXDk3x8yr+fhIZCDaDuaEKXBzdLzXNUa7RBlW
   +LEOV59325y3GDg4t30d0A2dxBbgBW/ZncyNrKggy8m+XgScjObAcQglC
   A==;
X-CSE-ConnectionGUID: yY+JOjJhT0aJqTtwLWmVxw==
X-CSE-MsgGUID: 5hTOvQGgQv21djMqmixSgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23396257"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="23396257"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:36:13 -0700
X-CSE-ConnectionGUID: zQdpp1N8SgqlGp5/Xo50RQ==
X-CSE-MsgGUID: jTK/19Y8QCeglUSMhmn7/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="67188452"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 27 Aug 2024 05:36:12 -0700
Message-ID: <ca65e086-b5eb-424b-9757-7df581cd8fb4@linux.intel.com>
Date: Tue, 27 Aug 2024 15:38:17 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
To: FPS <mista.tapas@gmx.net>, =?UTF-8?Q?Micha=C5=82_Pecio?=
 <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <20240820130158.339b4d87@foxbook>
 <bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net>
 <20240821150233.4f8f66ef@foxbook>
 <e6879e07-3548-41c1-b18a-55c40d041b86@linux.intel.com>
 <2b81ac60-32f5-4b71-98de-d336b7282cfb@gmx.net>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2b81ac60-32f5-4b71-98de-d336b7282cfb@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.8.2024 14.43, FPS wrote:
> On Wed, Aug 21, 2024 at 05:15:00PM +0300, Mathias Nyman wrote:
>  > My best guess is that these are caused by a full xhci event ring.
>  >
>  > If event ring is full it would stop transfer rings, and we would see
>  > missed service events. This matches the logs.
>  >
>  > The events get handled and cleared in the interrupt handler, but
>  > not every event generates an interrupt. for isoc transfers we
> intentionally
>  > block a lot of event triggered interrupts.
> 
> This has piqued my interest. Can you point me to the code in the kernel
> source where this filtering happens?

When a transfer completes the xHC hw will add an event on the event ring pointing
to this completed transfer block (TRB), and trigger an interrupt.
We can prevent xHC from generating the interrupt by setting a BEI (Block Event Interrupt)
flag in the Transfer Block (TRB)

To make sure every event triggers an interrupt just comment out:

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 4ea2c3e072a9..de61a1018155 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -4108,8 +4108,8 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
                                 td->last_trb = ep_ring->enqueue;
                                 td->last_trb_seg = ep_ring->enq_seg;
                                 field |= TRB_IOC;
-                               if (trb_block_event_intr(xhci, num_tds, i, ir))
-                                       field |= TRB_BEI;
+//                             if (trb_block_event_intr(xhci, num_tds, i, ir))
+//                                     field |= TRB_BEI;

But I don't think this is the issue after looking at the traces.

Thanks
Mathias


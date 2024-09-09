Return-Path: <linux-usb+bounces-14865-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1949971DF8
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2024 17:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF45FB21962
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2024 15:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA85139AFD;
	Mon,  9 Sep 2024 15:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMsJYHu4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E0C6BFC0
	for <linux-usb@vger.kernel.org>; Mon,  9 Sep 2024 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725895340; cv=none; b=JKh/iTz2Sie03BH9oMEJiQNIML/qSM922WepN3K8Td+Rx7Gn+5QV+pke0M07dlgLEvhcWE5wno0qLRqdobqvEzIbI595UTPpaRZNyYSagk76byDKJ/MVUjkHb55DZpHts9zmKvDJRMIL3Hhg/6PDFxiIw3Zt4dxIVhQSx99bSho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725895340; c=relaxed/simple;
	bh=FWCtnaqFP7pJeILegu29BWo7Iudu17gjMK7c5h2aBBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhCtZYUbsK5X0jKYiTfg9dp6cA8dIkpJVl72kPsZlpf9i0uzaAXe36oxVFMTfVfrZ414cBgMOsk5R6+HmFUTOTDbTtEnyQnKklf1r9wvZ/XfgkMZ6kXrGZbirViOOd5DqFkBrpptU7Pi44Z9+l4HRjTtnCLOs5Gq8QCIKZls7dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMsJYHu4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725895338; x=1757431338;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FWCtnaqFP7pJeILegu29BWo7Iudu17gjMK7c5h2aBBQ=;
  b=AMsJYHu4PS9eyXt11YdnIqfhw8qFJS+Bqb0eRvsgm/kj8wJ3ChiNc1FP
   5TwoWOdEMAyDbI+0+9iHk2zBX9o6Ev5Z1y2I5+Dq7hOcDvqLA/6fN8Gnc
   KmQmguKtvZ/3YMEhorWgse7S3ox97A5Ej7YwQ9Q4xO5hAhRPaXT10R/KJ
   qvFIzPTKl+Y511wkuYkHrRsrWBIw33lX45JtJeb+UpJB7tlaLMD5wQBkF
   t2WqfrVdHu2KVR4EhpHCfk03gzPJsVi3iqU/wDk1pO3+NxDsUSa0VGZj3
   rLtAk0VGB1yticTqkHq44I+rY7BOaTURmV7Rk+xIDvQU9kKE/v7aKveSb
   g==;
X-CSE-ConnectionGUID: mxRP9FpATUmY0QFsoHc00A==
X-CSE-MsgGUID: L5oNHSTdRfiSf7E0K9Z3QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24098397"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24098397"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 08:22:18 -0700
X-CSE-ConnectionGUID: mFh4gcNkQhSiAG+O/bpZzg==
X-CSE-MsgGUID: TdEYZzrpT2eied5fTjcpBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="66330253"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa006.fm.intel.com with ESMTP; 09 Sep 2024 08:22:17 -0700
Message-ID: <ecc97ef6-ae0f-44e3-ad6e-60a8df0b54a6@linux.intel.com>
Date: Mon, 9 Sep 2024 18:24:23 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Strange issues with UAS URB cancellation
To: Marc SCHAEFER <schaefer@alphanet.ch>
Cc: Micha?? Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
References: <ZtcUGe0FWxpO6058@alphanet.ch> <ZtcUq37F6gqgzifm@alphanet.ch>
 <ZtcVXoI6jNM9Lqbl@alphanet.ch> <20240903174535.6e5e581b@foxbook>
 <ZtdmOiKN6hb2Y82I@alphanet.ch>
 <71c073de-8af5-4457-88eb-91a709c2d941@linux.intel.com>
 <ZtiMp39CWrI0e+GB@alphanet.ch>
 <e16c21cd-41f3-4191-9957-6e61ddfefd24@linux.intel.com>
 <ZtnHs8udyl6bfGdF@alphanet.ch> <ZtnI57FYnoz1xKxF@alphanet.ch>
 <ZtnpOfv2qXCUy5/i@alphanet.ch>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <ZtnpOfv2qXCUy5/i@alphanet.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5.9.2024 20.24, Marc SCHAEFER wrote:
> On Thu, Sep 05, 2024 at 05:06:15PM +0200, Marc SCHAEFER wrote:
>> [ 3040.780444] usb 3-1.1.2: reset SuperSpeed Plus Gen 2x1 USB device number 7 using xhci_hcd
>> [ 3040.828021] scsi host16: uas_eh_device_reset_handler success
> 
> [ 4808.165397] xhci_hcd 0000:01:00.0: Cancel URB 00000000bcd65caa, dev 1.1.1, ep 0x85, stream_id 6 starting at offset 0xd9964960
> [ 4808.439706] xhci_hcd 0000:01:00.0: Cancel URB 000000000d48b0aa, dev 1.1.4, ep 0x85, stream_id 6 starting at offset 0x12c7ef0
> [ 4808.439981] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd invalid because of stream ID configuration
> [ 4808.439984] xhci_hcd 0000:01:00.0: MN: Set TR Dequeue Pointer Command: deq 00000000012c7f02 stream 6 slot 12 ep 11 flags c
> [ 4808.450328] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 10 comp_code 3
> [ 4808.450339] xhci_hcd 0000:01:00.0: Looking for event-dma 00000000012c7ef0 trb-start 00000000012c7f00 trb-end 0000000000000000 seg-start 00000000012c7000 seg-end 00000000012c7ff0
> [ 4808.450342] xhci_hcd 0000:01:00.0: Looking for event-dma 00000000012c7ef0 trb-start 00000000012c6000 trb-end 00000000012c6700 seg-start 00000000012c6000 seg-end 00000000012c6ff0
> [ 4808.450345] xhci_hcd 0000:01:00.0: MN: No TD found, fix halted ep

Thanks.

So the failed 'Set TR Deq' command is the start of the issue.

xHC host fails to move the past that cancelled transfer, but xhci driver gives
back the URB anyway. Once ring continues running it starts from that cancelled
transfer, triggering a babble error, pointing to that given back TD.

Still unclear why that 'Set TR Deq' command failed in the first place.

The 'Set TR Deq' command TRB looks fine. Stream ID is ok, (6) and Stream Context
type (SCT) which is bits 3:1 of dequeue 00000000012c7f02 is looks fine (=1, which
means  primary stream array with dequeue pointing to transfer ring)
  
Maybe stream is dropped, or something else is messing with endpoint context
MaxPSstream, or Linear Stream Address (LSA) fields before the 'Set TD Deq' command.
That would trigger stream ID issues like this.

Can I ask you to add some select traces on top of the patch?
They should show content of endpoint context:

as root:

mount -t debugfs none /sys/kernel/debug/tracing
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/xhci_handle_command/enable
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/xhci_handle_cmd_set_deq/enable
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/xhci_handle_cmd_set_deq_ep/enable
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/xhci_handle_cmd_config_ep/enable
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/xhci_configure_endpoint/enable
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/xhci_configure_endpoint_ctrl_ctx/enable
echo 1 >  /sys/kernel/debug/tracing/tracing_on
<reproduce issue>
Send content of /sys/kernel/debug/tracing/trace

Sample output:

<idle>-0       [013] d.h2.  1606.344913: xhci_handle_command: CMD: Set TR Dequeue Pointer Command: deq 0000000116f65921 stream 0 slot 4 ep 1 flags C
<idle>-0       [013] d.h2.  1606.344915: xhci_handle_cmd_set_deq: RS 00000 full-speed Ctx Entries 9 MEL 0 us Port# 6/0 [TT Slot 0 Port# 0 TTT 0 Intr 0] Addr 4 State configured
<idle>-0       [013] d.h2.  1606.344917: xhci_handle_cmd_set_deq_ep: State stopped mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Ctrl burst 0 maxp 64 deq 0000000116f65921 avg trb len 0
<idle>-0       [013] d.h2.  1606.376754: xhci_handle_command: CMD: Reset Endpoint Command: ctx 0000000000000000 slot 4 ep 1 flags t:C

And then send me both the trace and dmesg of triggered case.

Thanks
Mathias


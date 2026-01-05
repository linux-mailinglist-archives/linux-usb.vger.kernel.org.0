Return-Path: <linux-usb+bounces-31919-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE88CF4007
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 15:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F12373177DEC
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 13:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3545031AA82;
	Mon,  5 Jan 2026 13:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2AEVaRx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690DA1E47CC;
	Mon,  5 Jan 2026 13:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620713; cv=none; b=lSIGJ6UWQvXDLr01eTUs3LSVhWOrX/L3BbgiwLjmjf/kSNKqmUOmSwQgYOdXCy1MkylkfWXp5MC6/MNSUFuPk5dhv7cyh/VhHPCxlVWIVBmaJtBIjIK7A/nc8tGTRf95DUFMnLqKsVsOSApwP7lsoaIELPQXq4JqImKQEj926jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620713; c=relaxed/simple;
	bh=odN4J1pukOqIlENFLktpR+RzjtbO/HFZRa2yjp+bibc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EybnXtoeOIiq3va3xOeIO1NCa4Ca4Y+tokMo6egBbI7woFhzNTfHGp/lRna1p11W3OwzfFYDQ4bURlX6LbYxJXOu7R43xM0qiDZ+bY6WhrnJaK7M9gEeH2WHdSdp60HZeJRzIbUKOsFPXRM/b0uwS/2UzYVItVE8InXsG28HHyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2AEVaRx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767620711; x=1799156711;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=odN4J1pukOqIlENFLktpR+RzjtbO/HFZRa2yjp+bibc=;
  b=Z2AEVaRxm0bex5v6lG8f3k8WkkWxTJgoGpMnDWsAdfw3ygh1aiKpqUDw
   l7seubM5j1602YFrKRxXOqliAcLA3/h0m9MSzr6I02femKN41/nSWFlbb
   BdKVTNAqH0z/FAya9zxlcwSeUlWuv7W5ulAi85ccbi4+Fe0w0Jcs/yrwT
   AUFpaqqMIDrvxSSoj/rK5nQosm22QzIu6StJa9NpCDip30BIIXIHDbRdC
   yB6e8goJPOz04JwKfX5ShsXwdtvzYnvAiUpIfCz4vbOpiOjZJOwzolL7U
   NxV8LvcLm9qVF3Q5MJZWWQxkXMdTbZzgF1atQbNZ6Zc7JV+33+fOgxufs
   g==;
X-CSE-ConnectionGUID: 8wLFbGAmRJaczkalwFJMLA==
X-CSE-MsgGUID: HJS1atBEQL+wkRmPsAOVGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69057639"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="69057639"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 05:45:10 -0800
X-CSE-ConnectionGUID: 2HOJ7Q60Toa143nICo8zUQ==
X-CSE-MsgGUID: A+v7On08Team4WIS9ool6g==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.156]) ([10.245.244.156])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 05:45:09 -0800
Message-ID: <f2c03c5d-d667-4398-9267-77d7f6aaf6b3@linux.intel.com>
Date: Mon, 5 Jan 2026 15:45:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Consultation on the issue of digital headphones freezing
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <TYUPR06MB6217B105B059A7730C4F6EC8D2B9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <TYUPR06MB6217B105B059A7730C4F6EC8D2B9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

On 1/4/26 14:44, 胡连勤 wrote:
> Hello linux experts:
> 
> I have a question. My device freezes when using it with digital headphones.
> The stack trace is as follows:
> 
> [192165.107937][    C0] xhci-hcd xhci-hcd.3.auto: Error: Failed finding new dequeue state
> [192165.107946][    C0] xhci-hcd xhci-hcd.3.auto: Failed to clear cancelled cached URB 000000002d756eab, mark clear anyway
> [192165.108387][T17454] usb 1-1: reset full-speed USB device number 2 using xhci-hcd
> [192165.225904][T17454] usb 1-1: device descriptor read/64, error -71
> [192165.442224][T17454] usb 1-1: Device not responding to setup address.
> [192165.642107][T17454] usb 1-1: Device not responding to setup address.
> [192165.845879][T17454] usb 1-1: device not accepting address 2, error -71
> [192165.846031][T17454] usb 1-1: WARN: invalid context state for evaluate context command.
> [192165.957927][T17454] usb 1-1: reset full-speed USB device number 2 using xhci-hcd
> [192165.958032][T17454] xhci-hcd xhci-hcd.3.auto: ERROR: unexpected setup context command completion code 0x11.
> [192165.958040][T17454] usb 1-1: hub failed to enable device, error -22
> [192165.958165][T17454] usb 1-1: WARN: invalid context state for evaluate context command.
> [192166.070623][T17454] usb 1-1: reset full-speed USB device number 2 using xhci-hcd
> [192166.070728][T17454] xhci-hcd xhci-hcd.3.auto: ERROR: unexpected setup address command completion code 0x11.
> [192166.273835][T17454] xhci-hcd xhci-hcd.3.auto: ERROR: unexpected setup address command completion code 0x11.
> [192166.473788][T17454] usb 1-1: device not accepting address 2, error -22
> [192166.473943][T17454] usb 1-1: WARN: invalid context state for evaluate context command.
> [192166.585802][T17454] usb 1-1: reset full-speed USB device number 2 using xhci-hcd
> [192166.585901][T17454] xhci-hcd xhci-hcd.3.auto: ERROR: unexpected setup address command completion code 0x11.
> [192166.785850][T17454] xhci-hcd xhci-hcd.3.auto: ERROR: unexpected setup address command completion code 0x11.
> [192166.985829][T17454] usb 1-1: device not accepting address 2, error -22
> [192166.986836][T17454] usb 1-1: USB disconnect, device number 2
> [192166.990744][T17170] pc : xhci_initialize_ring_info+0x0/0x30
> [192166.990754][T17170] lr : xhci_sideband_remove_endpoint+0x84/0xb8
> [192166.990760][T17170] sp : ffffffc0f2d6ba10
> [192166.990763][T17170] x29: ffffffc0f2d6ba10 x28: ffffff884082a7c0 x27: ffffff89e4e43c00
> [192166.990772][T17170] x26: ffffff8a689d2c00 x25: 0000000000000000 x24: 0000000000000000
> [192166.990780][T17170] x23: ffffffe881212e50 x22: ffffff88feaad210 x21: 00000000ffffffed
> [192166.990788][T17170] x20: ffffff8880dd6200 x19: ffffff88feaad200 x18: ffffffe883debf00
> [192166.990795][T17170] x17: 00000000e11f7a81 x16: 00000000e11f7a81 x15: 0000000000000000
> [192166.990803][T17170] x14: 0000000000000000 x13: 0000000000000000 x12: ffffff89a7dcfc60
> [192166.990811][T17170] x11: 0000000000000029 x10: 0000000000000000 x9 : 03f28220e26a0a00
> [192166.990818][T17170] x8 : 0000000000000003 x7 : 0000000000000000 x6 : 0000000000000000
> [192166.990826][T17170] x5 : ffffffe88253eda8 x4 : fffffffee69f73e0 x3 : 00000000802a0029
> [192166.990834][T17170] x2 : ffffff89a7dcfc60 x1 : 00000000802a002a x0 : 0000000000000000
> [192166.990841][T17170] Call trace:
> [192166.990843][T17170]  xhci_initialize_ring_info+0x0/0x30
> [192166.990853][T17170]  handle_uaudio_stream_req+0xacc/0xda0 [snd_usb_audio_qmi 0fac57c02f06d038d015e5719390f9b3eda86e61]
> [192166.990865][T17170]  qmi_invoke_handler+0xd8/0x144 [qmi_helpers 4e26e13e3f77f3f53f00b1285e47dea9167ec3b4]
> [192166.990878][T17170]  qmi_data_ready_work+0x2ec/0x764 [qmi_helpers 4e26e13e3f77f3f53f00b1285e47dea9167ec3b4]
> [192166.990891][T17170]  process_scheduled_works+0x1c4/0x45c
> [192166.990897][T17170]  worker_thread+0x32c/0x3e8
> [192166.990903][T17170]  kthread+0x11c/0x1b0
> [192166.990912][T17170]  ret_from_fork+0x10/0x20
> [192166.990921][T17170] Code: a8c37bfd d50323bf d65f03c0 cee7796a (f9400009)
> [192166.990924][T17170] ---[ end trace 0000000000000000 ]---
> [192166.990929][T17170] Kernel panic - not syncing: Oops: Fatal exception
> [192166.990932][T17170] SMP: stopping secondary CPUs
> 
> Trace 32 analysis revealed that the crash was caused by ep->ring being null when calling the xhci_sideband_remove_endpoint function.
> I haven't come up with a better solution than this one.
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
> index a85f62a73313..04ae2cbba838 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -206,7 +206,7 @@ xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
>   	ep_index = xhci_get_endpoint_index(&host_ep->desc);
>   	ep = sb->eps[ep_index];
>   
> -	if (!ep || !ep->sideband || ep->sideband != sb)
> +	if (!ep || !ep->sideband || !ep->ring || ep->sideband != sb)
>   		return -ENODEV;

We can't return yet if endpoint and sideband are valid, but ring is missing.
We should still set

ep->sideband = NULL;
sb->eps[ep->ep_index] = NULL;

in __xhci_sideband_remove() for this sideband and endpoint.

Was xhci_sideband_notify_ep_ring_free() called for this endpoint?
We can in that case possibly avoid calling both xhci_stop_endpoint_sync()
and xhci_initialize_ring_info() during this xhci_sideband_remove_endpoint()
call.


The failure to find new dequeue states also look worrying:
[192165.107937][    C0] xhci-hcd xhci-hcd.3.auto: Error: Failed finding new dequeue state
[192165.107946][    C0] xhci-hcd xhci-hcd.3.auto: Failed to clear cancelled cached URB 000000002d756eab, mark clear anyway

If this endpoint is offloaded (sideband) then xhci driver shouldn't try
to find a new dequeue position.

Thanks
Mathias





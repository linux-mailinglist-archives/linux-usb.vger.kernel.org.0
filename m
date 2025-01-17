Return-Path: <linux-usb+bounces-19503-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B82A153F4
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 17:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDBF118822E1
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 16:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B878D19AD93;
	Fri, 17 Jan 2025 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OZn7Qww1"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B313E199249
	for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 16:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737130466; cv=none; b=VzFjnrt6QNiWjSUfGQ89Jiu9iL5DKpOUpxBt9/sSE5KSDl6bzFDE10WK34IfqsJGxpPnTCLDCX5eOqwI/9T0OtOHkC31Y+E6/Gr0rgQBCO8dGU8LQ5IcuHz2MW+6v8aKFf4tdZ3Qge29Uewpu5sK8dIWv9f5Z7hDnsEjJHGX4qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737130466; c=relaxed/simple;
	bh=4zQ50fHmDM5UQ+JgPuTXColKDwD9In18PeFQw+fRGN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oqQzafA6YYMEywM6oL4UVFZ+ILHDRFT609GTBGEM122ziMGp+tanHICHtBjshg50c6VaZV2rCOFn0aTvNXGZbDNBYNltMJz1RlCsxos9xVnJLRxezIv4hCHWWfZi9ClA9qoZSX0FK9WADE0dGtPbX+BDq7OMqPoKtHeQfhuzN28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OZn7Qww1; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <943a7b09-8e77-4813-810a-18fea0e61482@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737130456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GM8x8MtsDcmopQN4jNDpNDZDXHTL/s/+R5gURRJe7Sc=;
	b=OZn7Qww1QUnJhJE60jakeiFTXPqCau8KtQr8k/EY0BXSlmgxSeV2BikJUsP84Wo1LBay2O
	kO6RTNygPqdqVsyyDgLQ+wJYE6sUXoaXM+rk7eV6pBBEOm7MIdjuHmhM+k2rZh2xWXsLnt
	X3Z/Gjb2rzWqKY/a5PyQRwJCGgXqnjI=
Date: Fri, 17 Jan 2025 09:55:00 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v9 0/5] Support system sleep with offloaded usb transfers
To: Guan-Yu Lin <guanyulin@google.com>, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, mathias.nyman@intel.com,
 stern@rowland.harvard.edu, perex@perex.cz, tiwai@suse.com,
 sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com,
 ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250117145145.3093352-1-guanyulin@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250117145145.3093352-1-guanyulin@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/17/25 8:48 AM, Guan-Yu Lin wrote:
> Wesley Cheng and Mathias Nyman's USB offload design enables a co-processor
> to handle some USB transfers, potentially allowing the main system to
> sleep and save power. However, Linux's power management system halts the
> USB host controller when the main system isn't managing any USB transfers.
> To address this, the proposal modifies the system to recognize offloaded
> USB transfers and manage power accordingly.

You probably want to expand on the problem statement and clarify quite a few ambiguous statements.

a) "allowing the main system to sleep and save power". What is the 'main system' and what sort of sleep are you referring to? 
Traditionally when playing audio the audio devices remain in D0. Support for playback during 'S0 idle' is more complicated, I have yet to see a working solution even without USB offload in the picture.

b) when referring to power management, you have to be specific on whether you mean 'runtime_pm' or regular power management. Not the same thing but there are related issues.

c) for audio offload the transactions that go through the DSP or co-processor are only for audio endpoints. Control transactions rely on endpoint0 and are NOT offloaded to the best of my knowledge. Which means that you would need to track control transactions as well, even if there is no audio streaming. Otherwise you would have a risk of the XHCI controller transitioning in and out of sleep states.
 
> This involves two key steps:
> 1. Transfer Status Tracking: Propose xhci_sideband_get and
> xhci_sideband_put to track USB transfers on the co-processor, ensuring the
> system is aware of any ongoing activity.


> 2. Power Management Adjustment:  Modifications to the USB driver stack
> (dwc3 controller driver, xhci host controller driver, and USB device
> drivers) allow the system to sleep without disrupting co-processor managed
> USB transfers. This involves adding conditional checks to bypass some
> power management operations.

This is even more confusing, initially the point was to prevent the controller from sleeping while there are offloaded transactions, but now the goal would be to allow the system to sleep while there are offloaded transactions. This isn't the same problem, is it?
 
> patches depends on series "Introduce QC USB SND audio offloading support" 
> https://lore.kernel.org/lkml/20241213235403.4109199-1-quic_wcheng@quicinc.com/T/
> 
> changelog
> ----------
> Changes in v9:
> - Remove unnecessary white space change.
> 
> Changes in v8:
> - Change the runtime pm api to correct the error handling flow.
> - Not flushing endpoints of actively offloaded USB devices to avoid
>   possible USB transfer conflicts.
> 
> Changes in v7:
> - Remove counting mechanism in struct usb_hcd. The USB device's offload
>   status will be solely recorded in each related struct usb_device.
> - Utilizes `needs_remote_wakeup` attribute in struct usb_interface to
>   control the suspend flow of USB interfaces and associated USB endpoints.
>   This addresses the need to support interrupt transfers generated by
>   offloaded USB devices while the system is suspended.
> - Block any offload_usage change during USB device suspend period.
> 
> Changes in v6:
> - Fix build errors when CONFIG_USB_XHCI_SIDEBAND is disabled.
> - Explicitly specify the data structure of the drvdata refereced in
>   dwc3_suspend(), dwc3_resume().
> - Move the initialization of counters to the patches introducing them.
> 
> Changes in v5:
> - Walk through the USB children in usb_sideband_check() to determine the
>   sideband activity under the specific USB device. 
> - Replace atomic_t by refcount_t.
> - Reduce logs by using dev_dbg & remove __func__.
> 
> Changes in v4:
> - Isolate the feature into USB driver stack.
> - Integrate with series "Introduce QC USB SND audio offloading support"
> 
> Changes in v3:
> - Integrate the feature with the pm core framework.
> 
> Changes in v2:
> - Cosmetics changes on coding style.
> 
> [v3] PM / core: conditionally skip system pm in device/driver model
> [v2] usb: host: enable suspend-to-RAM control in userspace
> [v1] [RFC] usb: host: Allow userspace to control usb suspend flows
> ---
> 
> Guan-Yu Lin (5):
>   usb: dwc3: separate dev_pm_ops for each pm_event
>   usb: xhci-plat: separate dev_pm_ops for each pm_event
>   usb: add apis for offload usage tracking
>   xhci: sideband: add api to trace sideband usage
>   usb: host: enable USB offload during system sleep
> 
>  drivers/usb/core/driver.c         | 131 +++++++++++++++++++++++++++++-
>  drivers/usb/core/endpoint.c       |   8 --
>  drivers/usb/core/usb.c            |   4 +
>  drivers/usb/dwc3/core.c           | 105 +++++++++++++++++++++++-
>  drivers/usb/dwc3/core.h           |   1 +
>  drivers/usb/host/xhci-plat.c      |  42 +++++++++-
>  drivers/usb/host/xhci-sideband.c  |  82 +++++++++++++++++++
>  include/linux/usb.h               |  27 +++++-
>  include/linux/usb/hcd.h           |   7 ++
>  include/linux/usb/xhci-sideband.h |   6 ++
>  sound/usb/qcom/qc_audio_offload.c |   3 +
>  11 files changed, 398 insertions(+), 18 deletions(-)
> 



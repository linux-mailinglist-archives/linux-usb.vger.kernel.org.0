Return-Path: <linux-usb+bounces-19819-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E09B9A20CEF
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 16:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53B97167B8B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 15:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625031CDA0B;
	Tue, 28 Jan 2025 15:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eMt+HqjR"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6D71AB6DE
	for <linux-usb@vger.kernel.org>; Tue, 28 Jan 2025 15:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738077736; cv=none; b=SdgdcsHTNrULYOh167Z8PpQYrHd3KUQxSMVhU+dl309YHYfcf5E8mURiLhnOBz7wF0gTcvO4AOCJ3sycW5sl77dQ3KuvLsakVr3CrhhGJIBNPobnSm1hVG11n/b3u3XNa5aFhDEjFN3zyCm/gXwSZdYI8PnRwe5FB3KglzmSx2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738077736; c=relaxed/simple;
	bh=fBhXCOxlE0sDtXA5KqGMsuFwhadcWorovaetBrcwlac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgsTta3lrErnX17a+KsX58uxHEgaNgHX96MkuAz+Larqr5hsA+FQ9upgT5+uGyld2FYrbREAo8+wcaXvWdioMwPg7uf4Qcxs6niaDRDuD1VkFIpwIuhSoalei5a2xoyvP0MxrOL47G1aPZA9vOhdObp8oVn4FEcJOnIll0ha6Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eMt+HqjR; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <e5b1c3bf-4457-4859-92fc-785f7d6037fa@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738077717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KpQ8AJ1oQ+zA8JdYVE8VfY7psb5v8TlvoPlHMv2Bvyo=;
	b=eMt+HqjRRzqMKqRCQAdkxEZ7/e4vTqMZjpNUgTlxMvQ/e9u2KRg2I90aRhgrUW6idDK13p
	Kl4wCkgF0QBFLWy8XO48F1+5ym4v3JSyzP6cC77M8ri8aSbW/xM89TWMG+bWLrUxRhpflB
	oR9TRuboIbJKVMTpyVLk6YRRh18Cs1I=
Date: Tue, 28 Jan 2025 09:11:29 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v9 0/5] Support system sleep with offloaded usb transfers
To: Guan-Yu Lin <guanyulin@google.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
 mathias.nyman@intel.com, stern@rowland.harvard.edu, perex@perex.cz,
 tiwai@suse.com, sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com,
 ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250117145145.3093352-1-guanyulin@google.com>
 <943a7b09-8e77-4813-810a-18fea0e61482@linux.dev>
 <CAOuDEK3aip9SLCUPOzpVPwx-O4rmF-+sQrF4GJasGPBzV=qJdg@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <CAOuDEK3aip9SLCUPOzpVPwx-O4rmF-+sQrF4GJasGPBzV=qJdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


>>> 2. Power Management Adjustment:  Modifications to the USB driver stack
>>> (dwc3 controller driver, xhci host controller driver, and USB device
>>> drivers) allow the system to sleep without disrupting co-processor managed
>>> USB transfers. This involves adding conditional checks to bypass some
>>> power management operations.
>>
>> This is even more confusing, initially the point was to prevent the controller from sleeping while there are offloaded transactions, but now the goal would be to allow the system to sleep while there are offloaded transactions. This isn't the same problem, is it?
>>
> 
> The purpose of this series is to allow offloaded usb transfers happen
> during system sleep. In order to achieve this, we need to prevent the
> controller from sleeping when there's offloaded usb transfer ongoing,
> specifically when the system is sleeping.
> Without this series, the system could still allow offloaded usb
> traffic when the system is active, but the system would put the
> controller to sleep when the system is going to sleep, thus we're not
> able to suspend the system when we have offloaded usb transfers in the
> current system.

I am not following, sorry.

Is the desired outcome to 

a) prevent the system from entering S3 if there is an active USB audio offloaded stream?

or b) allow offloaded transactions even when the system is in S3?


which is it?

a) would be rather interesting, but currently we don't have any such behavior supported. When the system enters S3 all audio stops. The stream will resume when the system goes back to S0. Do we really want the battery to drain in S3?

b) seems rather complicated, once the on-going DMA transfers complete then who's going to refill buffers for the USB offloaded streams? Allowing the lowest level to operate even in S3 is only a small part of the puzzle, someone's got to provide data at some point. Unless the data is generated also by a side DSP having access to mass storage or wireless interfaces?


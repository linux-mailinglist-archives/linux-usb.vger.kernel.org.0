Return-Path: <linux-usb+bounces-20053-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32632A2681D
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 00:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B91CD16526A
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 23:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4EE21148B;
	Mon,  3 Feb 2025 23:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VMrvn6C6"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2952433D9
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 23:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738627068; cv=none; b=JM2Az9EupYgc0M2fx9rdD3ETCryIcRe0jEpnav/XkQ8gNu/otAMjgkX+VVCPEaYwx8/Q20QHE11dQZ3JFFLPwbUrv53Xo4ENWvrmBV1z9EMP/P8KVMFfh1HxpeDWO7UcZp5qBGEKfGjlBX/ogUk2xoMBHX3WTNOIxpnNdYgPtC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738627068; c=relaxed/simple;
	bh=nBB7oz3ua9loVwHQe8siOT7x+e/IyZvBAZ/PU0h8rdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwDJgF50eukK3tYQo5pgyQiqiblx0ZG4gvIflrF4379LYuZ3Kmj1NLfqR+6aQ958JZd/6HKi3IdlDbN3b0FBfUCh8/aTEKNbI2sx6fD9fz4zYUgrZxYBZJYT4t/oWg5tSNBq1/1X/+HB52FRNM0zFt2JlyjGHTPMedWgUH7qSNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VMrvn6C6; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <c8c699f7-bf9b-4e36-910e-c6f1c7092543@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738627063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UbnqC4ekamBqecRRMpHYSlKhj+7M062OAmXaaMk8fD0=;
	b=VMrvn6C6SgEHZv6w3pg5hOZO9g9oWMqPSI5wfZ19rOL85UAY/wzkbRone1FkpC9d508YwC
	qzyneSeCGqx7f2LrWeXPpD7nAFpjTu79J+2qyjY/NbDbyRyA46nKiGbgtQEZ0JLf7ZcYUy
	hidUg9ViA+WPgckjjBjQbkrSxPvPgzk=
Date: Mon, 3 Feb 2025 17:57:39 -0600
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
 <e5b1c3bf-4457-4859-92fc-785f7d6037fa@linux.dev>
 <CAOuDEK2u509kNjyL6qm27QgvtoCscRcsLixW=W8ABz2NF8A-tw@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <CAOuDEK2u509kNjyL6qm27QgvtoCscRcsLixW=W8ABz2NF8A-tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 2/2/25 20:57, Guan-Yu Lin wrote:
> On Tue, Jan 28, 2025 at 11:22 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.dev> wrote:
>>
>> I am not following, sorry.
>>
>> Is the desired outcome to
>>
>> a) prevent the system from entering S3 if there is an active USB audio offloaded stream?
>>
>> or b) allow offloaded transactions even when the system is in S3?
>>
>>
>> which is it?
>>
>> a) would be rather interesting, but currently we don't have any such behavior supported. When the system enters S3 all audio stops. The stream will resume when the system goes back to S0. Do we really want the battery to drain in S3?
>>
>> b) seems rather complicated, once the on-going DMA transfers complete then who's going to refill buffers for the USB offloaded streams? Allowing the lowest level to operate even in S3 is only a small part of the puzzle, someone's got to provide data at some point. Unless the data is generated also by a side DSP having access to mass storage or wireless interfaces?
> 
> Thanks for the question, the intent of our proposal should be (b), to
> allow offloaded transactions even when the system is in S3.
> In our design, the DSP wakes the system before the buffers are fully
> drained. This patchset enables the USB controller for offloaded
> transfers during system suspend (S3). To be precise, this patchset
> focuses solely on enabling the USB controller in S3 and does not
> include other necessary components for continuous offloaded USB
> transfers. I'll revise the commit message/cover letter to reflect
> this.Thanks for highlighting the potential ambiguity.

Thanks for the precision.

It was my understanding that anything above S1 could incur a hardware/software latency of two seconds or more to go back to S0. That would imply a buffering scheme that's significantly larger than usual offloaded solutions. In "typical" offload implementations it's rare to go beyond 100s of ms, since at some point you run into user-experience issues when applying volume changes or when changing tracks. It's usually a no-go if the user has to wait for a perceivable amount of time while the buffers drain.

Not to mention that quite a few platforms no longer support S3, since 'Modern Standby' aka "S0 Low Power Idle" or 's2idle' was introduced in the Windows 10 days S3 became largely a legacy feature gradually dropped since no one really uses it.


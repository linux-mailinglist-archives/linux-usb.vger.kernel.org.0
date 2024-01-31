Return-Path: <linux-usb+bounces-5712-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A755A8447D8
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 20:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 383421F243FF
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 19:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8FA3770C;
	Wed, 31 Jan 2024 19:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="R+3UsVQ4"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63653E479
	for <linux-usb@vger.kernel.org>; Wed, 31 Jan 2024 19:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706728597; cv=none; b=t3p2doLIJ0Dq2FUl7Yg4gFSsAIwjjm4COemfC8gVGcylcAU2V1a9DBBNUCzwGqrTNWnxXqjHcO2umL3G+bHEU+OEb05x9y/cvf/ZSdAIBBtKJ5GaKAnK2FUtTQxY+kcy3YJZqT86UfCBLEIllSst64CKioLf0LKNL5OIMMDvUzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706728597; c=relaxed/simple;
	bh=XWUy7YtxmrfP5omRSPV+uanADqOlM2OMzYTi5/C9v3M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=N9ZleYDMVLGU9AnO1nRfi+GxI6VMLt6Ddn/G+afwUuxnHBBB9yT4IeRyq8CHq1biM9+dyBCtqkhXBFQVfGaGdgvtpL4So0sOMX5xRLQbi1eiVT4Ulqw4IYVo2K//Qb1DSyecwVmyABl2yXja6gJ9/h2KELCuQwD/jrW1P+rm00E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=R+3UsVQ4; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AysmXUx4qd1V9m+b7E8hOLgGPAMV9C7I8szryF3o/VY=; b=R+3UsVQ4V6xodCtXDQIgCiK7px
	T8srOPtgkhjEYYsHwyQL1GCWydKLIhkQdhMbynQOC7vAFw5wClpBZYo8Jdj4OhvGhz59Dba6qkjiY
	xJFP+ylRUjWSpRm6kCDWiWlf+vsSMEuoim7m9GBQQ3HjVorIMfAb1Dpl6tJB/e3XAI48BTztqT4xO
	eVhddum/iw60OY1OodFnI0FoRyjD5m+M1XBI0cIiYHbCYuyt1keuk8d6MiI0pzGZySO//1Yq92JCK
	hYUPIATUXkqh63TjNNC3HX17IcFGMtpCzZfUJNC92ZBCG/iXBHgve01NSx4+Jjwo55WLwZkpKRorx
	EYntEt2Q==;
Received: from [187.90.178.235] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rVG4S-00CEP8-DQ; Wed, 31 Jan 2024 20:16:28 +0100
Message-ID: <9e21fe04-6571-2c29-e40d-4d16b55ae46e@igalia.com>
Date: Wed, 31 Jan 2024 16:16:22 -0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "balbi@kernel.org" <balbi@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "johan@kernel.org" <johan@kernel.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Vivek Dasmohapatra <vivek@collabora.com>,
 "piyush.mehta@amd.com" <piyush.mehta@amd.com>,
 "ray.huang@amd.com" <ray.huang@amd.com>
References: <20240111020119.5u3k3csn3bi2zhtw@synopsys.com>
 <849d11d9-9302-4d76-01b6-b5046f474fda@igalia.com>
 <20240113013320.mrqqrdajrnw62kis@synopsys.com>
 <54a9b6b6-ef41-f76a-43e0-a395adddb455@igalia.com>
 <20240117003437.mxgo3ebxql4ftwjt@synopsys.com>
 <8b49285e-46de-c52a-ea8d-542c91ba4128@igalia.com>
 <20240118003949.tmw3uq76hvwe4ylz@synopsys.com>
 <e2d02355-b47b-8298-c5c9-8c6d199b2728@igalia.com>
 <20240123021237.hyckfhsxvem7ydqv@synopsys.com>
 <dd3339b0-75ac-b64e-4dac-d9394e91baef@igalia.com>
 <20240130021704.ndbkkyksauku7nwr@synopsys.com>
 <29ebf575-e09b-4452-ed60-41a667e78c5f@igalia.com>
Content-Language: en-US
In-Reply-To: <29ebf575-e09b-4452-ed60-41a667e78c5f@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/01/2024 15:16, Guilherme G. Piccoli wrote:
> [...]
>>> And ftrace timestamps unfortunately don't help with that, it's not
>>> showing how much time the device stay suspended, so it might be
>>> confusing and both cases could appear as the same exact scenario, even
>>> if they are completely different (fail vs success cases).
>>
>> That's odd.. my assumption was the timestamps to be valid. Were you able
>> to confirm that it's the issue with the timestamps? Perhaps check if the
>> other devices in the system also wakeup at the approximately same
>> time printed in the timestamps?
>>
> 
> Hi Thinh, indeed - this a bit odd right? I guess this is maybe related
> with the way kernel keeps track of clocks on suspend - despite TSC keeps
> accounting on suspend (at least for all modern x86 processors IIUC), the
> timestamps in both tracing buffer or dmesg do not reflect suspend time.
> 
> Is it different in your x86 systems? Or maybe in other architectures you
> have experience with?
> 
> I've done a test on Steam Deck, take a look in both attachments - seems
> to be aligned with my perception. Also checked dmesg on my Intel laptop
> (i5-6300U, with "nonstop_tsc" capability) and the timestamps do not
> reflect the time spent in S3 suspend...
> 

Just a heads-up: just noticed that on s2idle sleep, the timestamps seems
to reflect the suspended time - just tested here. But on S3/deep sleep,
they don't...

Cheers!


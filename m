Return-Path: <linux-usb+bounces-7485-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 696BD870660
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 17:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C754828456C
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 16:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A7E482CA;
	Mon,  4 Mar 2024 15:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="H7N+N9yn"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8DB481D1
	for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709567988; cv=none; b=qqJzFq57X8D7UZAwG8TiXagq+p4RDaUn0T/B2VPH/yd3/oMgdttltFdaYcDtqPCnhEyVwuFQeRkd7TBcp36e3XcNw+wsWtEdBkeeHxdSgG2x3pD1Pvsg0qFKiIE24ipORoUSTwdgrddJUYXnEc0XdcATxqtQ7SVPgfHslcXft1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709567988; c=relaxed/simple;
	bh=Q7ylEujqfgR6huOg65Xk3XTQLZdydtRD7v5p23RD7wU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fnQVSe7C5RrdEst5IAQPHomqmqF//iE/5qqOTKbBPxQiDnLwIksTD1Tu/wvz70cIQBmbLUwsH8RV7iMW7yO0rZL+ADxy4gzDQAnOUoGFL0YEQC3HAvUpv7L/oLRANLU8DgrFOxKMt4yk2Vw4mxLlFC4l37bWgxjr7Nr1yDhSykw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=H7N+N9yn; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RJ8ayUD7jeKjKG0iGt1FVR6w5hQU6L/FTODDhjGGMMo=; b=H7N+N9yn15Ao/9B2d0T9O4xdSA
	mJvkhCODqlKEwdH6ZaqbzzmRyn2pptO04w/n5k9Yy8JCD+Fo0jMugjmKdNx4h850Nz/PISqDbsx+c
	yn/OA7klzFKVwfcdtMd7OsdsXnPX5mtTGbL3v38fZIXRX6HDlS589nhSIrGRgK26G56fdSOfVRXyG
	zeoEeyPDaDUu7YGm9po1qb++Z4oISTi4L06Sw02hTcteEP7svHvHMu8gQSctarg2izCNkVQ/tBdis
	XUfKyjCECiBiO3RgBqTUPnGTm+f7TfZeJ6ncj+81ttOUwghNcsEAADntn1TEI3FgK/BWXrfK8igKN
	pYcZh8Gw==;
Received: from [187.90.173.251] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rhAiy-005uOa-G8; Mon, 04 Mar 2024 16:59:32 +0100
Message-ID: <7594701a-34d7-579b-6c9c-05a18d3ab651@igalia.com>
Date: Mon, 4 Mar 2024 12:59:24 -0300
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
References: <20240118003949.tmw3uq76hvwe4ylz@synopsys.com>
 <e2d02355-b47b-8298-c5c9-8c6d199b2728@igalia.com>
 <20240123021237.hyckfhsxvem7ydqv@synopsys.com>
 <dd3339b0-75ac-b64e-4dac-d9394e91baef@igalia.com>
 <20240130021704.ndbkkyksauku7nwr@synopsys.com>
 <29ebf575-e09b-4452-ed60-41a667e78c5f@igalia.com>
 <20240201012301.qtp4vr67cwnte5im@synopsys.com>
 <20d855ca-678c-671b-d956-f08f2ac88573@igalia.com>
 <20240206025307.j2lz3v2idwm7gusp@synopsys.com>
 <43013c1a-92c1-658b-ace9-8ed6ae98769e@igalia.com>
 <20240208235300.pjife5zxfz5onqvk@synopsys.com>
 <b9495221-54be-ae5d-774a-f1450290b104@igalia.com>
Content-Language: en-US
In-Reply-To: <b9495221-54be-ae5d-774a-f1450290b104@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/02/2024 22:18, Guilherme G. Piccoli wrote:
> On 08/02/2024 20:53, Thinh Nguyen wrote:
>> [...]
>>
>> Thanks. I have some suspicions of what happened. I'll create a patch,
>> but I'll need some time.
>>
>> Thanks,
>> Thinh
> 
> Thank you a bunch! Let us know when you have a candidate, I can test it
> quickly in the Steam Deck =)
> 
> Cheers,
> 
> 
> Guilherme
> 

Hi Thinh, hope everything is alright.

Let me know if we can help in anything or provide more test results,
we'd be glad to.

Thanks,


Guilherme


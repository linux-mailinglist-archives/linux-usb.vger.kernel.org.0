Return-Path: <linux-usb+bounces-5884-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AADAD849F4B
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 17:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BEBA280FBB
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 16:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21FE33CCC;
	Mon,  5 Feb 2024 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="A4YB4WtJ";
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="PcUoqISG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B5E3A1A7
	for <linux-usb@vger.kernel.org>; Mon,  5 Feb 2024 16:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.101.85.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707149557; cv=none; b=WZhlfvX47ohQnItj1fnReCe/ltj/FKRepQXB+e5UpDrae2nYej96u4SMKoOmpSvUDNLmnxsOP7dItgQVPHSuFRVynpswljR0qivjwc6gFzgIeCjxMUl1NMrBg9UpB79kG+n/8/Cx5ngm2RHlPjZztjmNl5a6lKAHiEJqWw+/5RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707149557; c=relaxed/simple;
	bh=uSlUGB7/nW8BeUTP/+/HTcbLJck7un5N6zm8RUnWGo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mcmCkwRGibyf6PIhD6R2HNwAcNVKkDCGICv0rkxhF/5uO9snYYN41kSJtXOCGeIYMPm5Elgl00gUbS2UhcboiX4dc6VP323qleigNhBCE26A4/Ocl9UwOsz1uI5qWJj1uNY/etIuX80+iJoVoJeI6gXd2z8nhKRe34ioWbjhtwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ivitera.com; spf=pass smtp.mailfrom=ivitera.com; dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b=A4YB4WtJ; dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b=PcUoqISG; arc=none smtp.client-ip=88.101.85.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ivitera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ivitera.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id A514915BA07;
	Mon,  5 Feb 2024 17:12:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1707149552; bh=uSlUGB7/nW8BeUTP/+/HTcbLJck7un5N6zm8RUnWGo4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A4YB4WtJ9k5lOv4RBsiwpZBiN2yNo70tY+jWKDBmtOFvPuBQi3dNhqNU7DQ60Hi/r
	 fnUXiZGGeZOskzSgW6NX1SMMt+pkEZesPQAOXaUlBMQSQ+t4tK1GJ1QdAkTHnWXx4z
	 YKpaQSgXqisjrHbC0ONd7gTuyaUK97ur8d9z71mM=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJ6y4FaAWpXp; Mon,  5 Feb 2024 17:12:31 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 630AD15B268;
	Mon,  5 Feb 2024 17:12:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1707149551; bh=uSlUGB7/nW8BeUTP/+/HTcbLJck7un5N6zm8RUnWGo4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PcUoqISG19murlrN701P57qapILYSqHC9PQ38aXJllm6rkkWxQyyTG1JPXZpfpP95
	 fEGEsnjV/S/rUsYkD4GpJU/y3ws4ocozGIBQQo17DaDX2o0jQe1e6NIXm5Q5ptq+TE
	 arAxcR2GoWSFAFLcfU8aSPE80JM1aK/CgW66sngs=
Message-ID: <7be78d25-d19a-c8db-461b-1f04de6fcca1@ivitera.com>
Date: Mon, 5 Feb 2024 17:12:31 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: usb: gadget: dwc2: RK3308: Transmission to EP OUT stalls at
 larger packet size
Content-Language: en-US
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <91811ad2-991e-bd34-b3ec-2b92229bdd8b@ivitera.com>
 <758d6e5d-d5b4-2bcc-bd51-fb7b49356532@ivitera.com>
 <fb6f2c71-0362-0f17-bd86-725f772710b4@synopsys.com>
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <fb6f2c71-0362-0f17-bd86-725f772710b4@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dne 05. 02. 24 v 16:40 Minas Harutyunyan napsal(a):
> Hi Pavel,
> 
> On 2/5/24 18:35, Pavel Hofman wrote:
>>
>>>
>> It really looks like some DMA performance issue. Stream 980 bytes/ 250us
>> (bInterval=2) is bitperfect, no dropped packets. While 24 bytes/125us
>> (bInterval=1) gets stuck. IIUC the DMA is not capable of copying packets
>> every 125us. Please is there any chance to tweak the performance to
>> handle the 125us packets reliably?
>>
Minas, thanks a lot!

> Quick analysis.
> 1. In dmesg seen BNA (buffer not available) interrupt which mean driver
> not prepare DMA descriptor on time.

This is still listed, even with the req_num=8 and no dropouts:

[ 1851.090554] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 1851.108563] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 1851.158427] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 1851.166529] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 1851.188525] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 1851.190529] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt

Please is there any way to improve? Interesting that it produces no 
dropouts.

> 2. For a try please disable debug printing from g_audio:
> [ 2080.107701] u_audio_iso_complete: iso_complete status(-61) 0/1000
That helped too, thanks.

> 3. Please try run device in Buffer DMA instead of Descriptor DMA:
> p->g_dma_desc = hw->dma_desc_enable;
> replace to:
> p->g_dma_desc = 0;
> 

Actually this made the transfer worse. With req_num=8 and dma_desc 
enabled transfer clean, with dma_desc disabled many dropouts, with 
req_num=2 no transfer at all.

With regards,

Pavel.



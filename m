Return-Path: <linux-usb+bounces-5885-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB5F849F5F
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 17:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C2401F231E2
	for <lists+linux-usb@lfdr.de>; Mon,  5 Feb 2024 16:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A3733CF9;
	Mon,  5 Feb 2024 16:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="QLtkcRXP";
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="QLtkcRXP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8F932C92
	for <linux-usb@vger.kernel.org>; Mon,  5 Feb 2024 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.101.85.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707150049; cv=none; b=SWWGgiFdZY2ts3JBYfb25jD0k4SIcLAz0KdDEOs48ik8RVAIOC8DgOGv7bTvtafMkzlhCR2Oml27BsoNM1FJS/VDsObEi4wQcaHGR3pQkLCb9rGHxmkdnbkzyAnGfOd0B2rbA1eSOilYPqa5TGxLrUVWj/CVtgouB6yjijEKQhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707150049; c=relaxed/simple;
	bh=Yk7xWZ3NninhYZkG2g6wg1C2lkfbmTfMRwUbjG7U/KM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRy9AqZaIT+lyhUvC9xeBKRdGIAbc9PH40paKBG+2cipcXaX8aIdIG2CxgX8vRStO9KzBoQ0tgnVf8boTd8GoZ2yB1DlQXpBSeDC09TJSit28C6LhrBz69X4MQYWqJk893iDOdQahuZu0h6slDA9u3adrRg/5ozogyv3KDFuPTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ivitera.com; spf=pass smtp.mailfrom=ivitera.com; dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b=QLtkcRXP; dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b=QLtkcRXP; arc=none smtp.client-ip=88.101.85.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ivitera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ivitera.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 86D0515B2CB;
	Mon,  5 Feb 2024 17:20:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1707150044; bh=Yk7xWZ3NninhYZkG2g6wg1C2lkfbmTfMRwUbjG7U/KM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QLtkcRXPNebSkAChHyh1CEQDXbFLtCjpIYJtDdIo/rO5GrNELXPO3Mc3w/H1A3j8D
	 u3GAvY87W+UQuLNpBoY8wCGkRZCuuWdvD8s0AFlCyxzkbiQy6hREttJSx2ouKCf4++
	 JW6u3IhMvGbYoTReHMu+6N8huATfP+kSN8EO6cB8=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id raINZqyFqUZg; Mon,  5 Feb 2024 17:20:44 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 0C58A15B2CA;
	Mon,  5 Feb 2024 17:20:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1707150044; bh=Yk7xWZ3NninhYZkG2g6wg1C2lkfbmTfMRwUbjG7U/KM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QLtkcRXPNebSkAChHyh1CEQDXbFLtCjpIYJtDdIo/rO5GrNELXPO3Mc3w/H1A3j8D
	 u3GAvY87W+UQuLNpBoY8wCGkRZCuuWdvD8s0AFlCyxzkbiQy6hREttJSx2ouKCf4++
	 JW6u3IhMvGbYoTReHMu+6N8huATfP+kSN8EO6cB8=
Message-ID: <caffc13f-2bb2-ccb3-26a2-ba875d163b27@ivitera.com>
Date: Mon, 5 Feb 2024 17:20:43 +0100
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
 <4c198e2b-72fe-f21c-77a0-7c011ace3c6d@ivitera.com>
 <0efd145e-eacd-412d-a937-7c7a91790de7@synopsys.com>
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <0efd145e-eacd-412d-a937-7c7a91790de7@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



Dne 05. 02. 24 v 17:05 Minas Harutyunyan napsal(a):
> Hi Pavel,
> 
> On 2/5/24 19:52, Pavel Hofman wrote:
>>
>>
>> Dne 05. 02. 24 v 15:35 Pavel Hofman napsal(a):
>>>
>>>>
>>> It really looks like some DMA performance issue. Stream 980 bytes/
>>> 250us (bInterval=2) is bitperfect, no dropped packets. While 24
>>> bytes/125us (bInterval=1) gets stuck. IIUC the DMA is not capable of
>>> copying packets every 125us. Please is there any chance to tweak the
>>> performance to handle the 125us packets reliably?
>>>
>>
>> I tried increasing f_uac2 req_number/UAC2_DEF_REQ_NUM from 2 to 8 and
>> streaming seems to run stable at 125us microframes now (in both
>> directions simultaneously). Please is there any other gadget tweak which
>> could potentially reduce the risk of dropped packets? Something like
>> using plain DMA instead of desc DMA (no idea :-) )...
>>
>> Thanks a lot for your expert opinion.
> 
> 
> Yes, it's mandatory to increase f_uac2_req_number, at least 4. Obviously
> 2 is not enough for descriptor list and main cause of BNA interrupt.

Interestingly, increasing req_number from 8 to 16 did not seem to have 
any effect on frequency of the BNAs:

[ 2444.657558] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 2444.659406] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 2444.683667] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 2444.723693] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 2444.725426] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 2444.763671] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 2444.783599] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 2444.795679] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 2444.833475] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 2444.839453] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 2444.917478] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 2444.923416] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt
[ 2444.935450] dwc2 ff400000.usb: dwc2_hsotg_epint: BNA interrupt


> Another suggestion to change DMA mode from DDMA to BDMA as I suggested
> in previous email.

Please what is the technical difference? I wonder why BDMA made it so 
worse than DDMA. Thanks!





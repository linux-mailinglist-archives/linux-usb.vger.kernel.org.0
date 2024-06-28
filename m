Return-Path: <linux-usb+bounces-11766-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8581B91B45C
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 03:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DCD1283EBF
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 00:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B26D27E;
	Fri, 28 Jun 2024 00:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QfFnqfq8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4968C18028;
	Fri, 28 Jun 2024 00:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719536389; cv=none; b=gLYlNr1ULhsGx/jOnrbt4ndtynkhF1Om2fq3LSxJE1PP0/pUTJ0TXSkhD/UGmSLduQNUw1VlJBILb2XAtWtA2UeHEghIX18ODTRILEQtRk5Y+Xpi8DANOQeJVzLeiarIlMgwKTgHd4Uaqat619KjiPW535YnMkbk8+Sn93Ssckk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719536389; c=relaxed/simple;
	bh=k/O1dWo/zAC1tNUGUZJKfZkv4B/bidKsE11l9K373b8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X9SMnhVlYJvHUF3PqncdXg3m68ihkZmMkFahLQGP3EicmM6eRinulyCq3hg1farMuPTzVr0QsbVtrX/Onk/uHsuRQw+brFJIzFW25i7lcMy78QY0nhXRHI6QESns1oGY3jYcqpINqhcA74NPFmjE0q+zRnTSP97daJmQjSzLLkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QfFnqfq8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RKDOaH010655;
	Fri, 28 Jun 2024 00:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/O1dWo/zAC1tNUGUZJKfZkv4B/bidKsE11l9K373b8=; b=QfFnqfq8tG7g6dfm
	efc93a6syk0bnFKBqUzBuwinQmJsjh1TXeXZYJnENI9EYFTJncgPd5jnWCyCdCMW
	0+usnKLImAGRgku8/UPVsFk8atD9uGmoRDIkGOCdospSSs9En3p4GcVqr5zauBQ/
	HxhhyHJv/2h1sjdsXmvJ+V43GwOiNrQ6KY6eQHLHeTekkCqosx0aWtr/gnqJfXQ6
	db+C/EBH7WkH90heksU4eX0Hk++o0aZ5GlSpyBS4CafcJrxeo9cHbfAeQ4yOt7P/
	gHDcsdnhk1MKiDXMjY+tlP/8DfhCfj76/fCXoPKWScTrROXmWP08uM1Fz3qqWtMt
	PexYtA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400bdqdt5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 00:59:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45S0xDuK008732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 00:59:13 GMT
Received: from [10.71.115.79] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 17:59:12 -0700
Message-ID: <fd8f1eb0-4b21-4697-8175-a61bc3858852@quicinc.com>
Date: Thu, 27 Jun 2024 17:59:12 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <robh@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <20240610235808.22173-33-quic_wcheng@quicinc.com>
 <5be51e1f-70c9-4bbc-96fa-1e50e441bd35@linux.intel.com>
 <408d9e8e-0f40-7e66-54be-2f8d2c0783a3@quicinc.com>
 <ca1e1063-e1bd-4e03-a7cd-91985e9954e9@linux.intel.com>
 <096d59a0-5e18-092c-c9ae-d98130226f06@quicinc.com>
 <368d9019-2c96-468e-b472-7e1127f76213@linux.intel.com>
 <eb6370ea-47a0-3659-3c10-cb7f95e3e520@quicinc.com>
 <510468c7-b181-48d0-bf2d-3e478b2f2aca@linux.intel.com>
 <c7a95157-1b71-1489-3657-8fe67f9acb4e@quicinc.com>
 <90463a4e-c2e7-4b59-9a79-23533b4acd1e@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <90463a4e-c2e7-4b59-9a79-23533b4acd1e@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: I7ji9nTic-FHqo6aBSK-W7atlFLOSzuU
X-Proofpoint-GUID: I7ji9nTic-FHqo6aBSK-W7atlFLOSzuU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_16,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406280005

Hi Pierre,

On 6/21/2024 1:27 AM, Pierre-Louis Bossart wrote:
>
>
>> I'll spend some time to evaluate your suggestion about moving the logic
>> to control the offloading from USB SND versus ASoC, since there are
>> valid points.  However, before I do that, I just want to make sure folks
>> are also inline with that thinking.  I've had to put a lot of effort
>> moving things around such as the previous example, and now you've
>> suggested to move it back to the vendor specific drivers.
>>
>> @Pierre, since you've helped with providing a lot of valuable input in
>> the previous revisions on the kcontrol uses, what do you think about the
>> proposal from Amadeusz?  Basically shifting the offload device selection
>> into USB SND from the ASoC USB BE driver, and having this per USB SND
>> device.
>>
>> [1]
>> https://lore.kernel.org/linux-usb/20231017200109.11407-30-quic_wcheng@quicinc.com/
> This thread is very hard to follow, I am not sure I fully understood the
> initial proposal, and I am not sure I follow Amadeusz' either.
>
> There are really multiple layers to deal with
>
> a) is the controller able to support the offload path? IIRC this is
> embedded in an obscure XHCI property, it would make sense to expose it
> as a control, or component string, of the USB card.

If a component string/tag is desired, I already have some way of doing that.  I can add it to the USB card.

>
> b) is there a companion card capable of dealing with the offload path?
> Since the presence of this card may depend on driver probe, there should
> be a control on the USB card. userspace could detect changes to this
> control and detect if that path is or is no longer enabled.

So currently, the "USB Offload Playback Capable Card" kcontrol (on the USB card) will determine if there is an offload path.  However, this differs than what Amadeusz is suggesting, in that he wants a single kcontrol created for EACH USB card identified (per USB audio device), and a simple enable/disable control to determine if the offload path is enabled for that card/pcm stream.

It would be a simpler approach for the userspace, and if the card that handles the offload card isn't present, then these enable/disable control will be set to "disabled," and even if users attempt to set the control, it won't go through.

>
> c) which PCM device is actually offloaded? This could be plural for some
> implementations. The mapping between PCM devices exposed by the USB
> card, and those exposed by the companion card, should be known to
> userspace. I am not sure how this would be done though, a variable
> number of controls is a sure way to confuse userspace.

Expanding on Amadeusz's suggestion, my idea is to have an enable/disable kcontrol per USB stream.  For example, one USB card could have multiple PCM devices (USB streams).  So we would have something like:

PCM Offload Playback Enable Stream#0  enable/disable

PCM Offload Playback Enable Stream#1  enable/disable

....

So we'd know which USB card and PCM device is selected for USB SND.  However, I see what you're getting at in case there are multiple supported streams, because userspace needs to know which ASoC card/pcm combination corresponds to which USB device/combination.

What do you think about having a USB card kcontrol to display the mapped ASoC card and PCM indexes?

PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0, PCM device#1)

To summarize, if we did this, I'd plan to remove all the kcontrols in ASoC card, and have the following in the USB card for an USB audio device that supports one USB stream:

PCM Offload Playback Enable Stream#0  enable/disable

PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0, PCM device#1)


Thanks

Wesley Cheng



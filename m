Return-Path: <linux-usb+bounces-13214-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 830E894B49C
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 03:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05A9F1F2282C
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 01:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938489450;
	Thu,  8 Aug 2024 01:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WMyNtwaF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9586553BE;
	Thu,  8 Aug 2024 01:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723080246; cv=none; b=o9KnrhsH6aJmHrWQQ5zgAXF7esHLo+S+QWvW5K4Pv6xupw+kQ9Y86dwssh6tz1iy8GdI6HLQXmRbfWc5T9J6n9n0rl/XtAnO/1ZSR4WapkSEpJ9v1UxQD/JO7qeTeoI2a26Tw6dG05e5no9LKru5+2KhNhE67bR1DLpfxR/o0aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723080246; c=relaxed/simple;
	bh=Wq2V+URM8X6t0tiJlQDxKR2P6vbpnEkooM3I2HkeLKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tdOZysa+v9K6OycLcilOVVtDLkT9BkdwkJSaTV/wR9VWLKStO9Obv2mLGygM9+Jm5N4w+gFhdrxrMeRpbtFHqli71slrs46ZUQjGPRLWZMZXgFCNhjUGXF5/yUvZACRWjq4GhChhHzkurUoPMLmsGAUEVY3wmjIpbLebTu07l6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WMyNtwaF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477NdsFT011985;
	Thu, 8 Aug 2024 01:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wq2V+URM8X6t0tiJlQDxKR2P6vbpnEkooM3I2HkeLKQ=; b=WMyNtwaFmkf1Qp1o
	VMNMKSxvx5Pzkx4zzziBDcrYNlA8vgB2dJ1VYTu47rACjwCrWflPxdSTsyQbmw4u
	hB17KItl7QqtdKAz8HjAx2i8xSB09md713lEXXxLPiVS6TZOlNmlO0uNxoFQILm9
	u5y+rzvG//mm9xHZ2PsCVNb6GvJ2PtQu5DVCUW8hf+yLrvCIOuJLY6KLVrV01etY
	yzDZQi7RoYip1a4XuN1sd00KYh1vF1gE5JHAub2Mq5j6ANJrHYTjtLH6gLS7y9vZ
	uL4My0ycD9CcWm0xdFQSnCfL2zLgwYVLeHkjBBg72R3jJDGeadIqNbJi5amkhi+p
	zSGCSA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sa8f4crg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 01:23:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4781NkGD008725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 01:23:46 GMT
Received: from [10.71.113.127] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 18:23:45 -0700
Message-ID: <d2a7ea11-bff3-406e-945c-2edd427da234@quicinc.com>
Date: Wed, 7 Aug 2024 18:23:45 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 12/34] ASoC: doc: Add documentation for SOC USB
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-13-quic_wcheng@quicinc.com>
 <1a93dbae-6fba-4f07-a732-51a4cd98ff2a@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <1a93dbae-6fba-4f07-a732-51a4cd98ff2a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V0cUcdzHelabXu5uAdaJg1g3v8T3tWBE
X-Proofpoint-ORIG-GUID: V0cUcdzHelabXu5uAdaJg1g3v8T3tWBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_15,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=970
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080008

Hi Amadeusz,

On 8/6/2024 7:51 AM, Amadeusz Sławiński wrote:
> On 8/1/2024 3:17 AM, Wesley Cheng wrote:
>> With the introduction of the soc-usb driver, add documentation highlighting
>> details on how to utilize the new driver and how it interacts with
>> different components in USB SND and ASoC.  It provides examples on how to
>> implement the drivers that will need to be introduced in order to enable
>> USB audio offloading.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>
> (...)
>
>> +
>> +One potential use case would be to support USB audio offloading, which is
>> +an implementation that allows for an external DSP on the SoC to handle the
>> +transfer of audio data over the USB bus.  This would let the main
>> +processor to stay in lower power modes for longer durations.  The following
>
> *duration
>
> (...)
>
>> +
>> +In order to account for conditions where driver or device existence is
>> +not guaranteed, USB SND exposes snd_usb_rediscover_devices() to resend the
>> +connect events for any identified USB audio interfaces.  Consider the
>> +the following situtation:
>
> *situation
>
>> +USB Offload Related Kcontrols
>> +=============================
>> +Details
>> +-------
>> +A set of kcontrols can be utilized by applications to help select the proper sound
>> +devices to enable USB audio offloading.  SOC USB exposes the get_offload_dev()
>> +callback that designs can use to ensure that the proper indices are returned to the
>> +application.
>
> At the moment I only see getter below, how does application set it?
>
>> +
>> +Implementation
>> +--------------
>> +
>> +**Example:**
>> +
>> +  **Sound Cards**:
>> +
>> +    ::
>> +
>> +      0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>> +                        SM8250-MTP-WCD9380-WSA8810-VA-DMIC
>> +      1 [Seri           ]: USB-Audio - Plantronics Blackwire 3225 Seri
>> +                        Plantronics Plantronics Blackwire 3225 Seri at usb-xhci-hcd.1.auto-1.1, full sp
>> +      2 [C320M          ]: USB-Audio - Plantronics C320-M
>> +                      Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed
>> +
>> +  **USB Sound Card** - card#1:
>> +
>> +    ::
>> +
>> +      USB Offload Playback Route PCM#0        -1, -1 (range -1->255)
>> +
>> +  **USB Sound Card** - card#2:
>> +
>> +    ::
>> +
>> +      USB Offload Playback Route PCM#0        0, 1 (range -1->255)
>> +
>> +The above example shows a scenario where the system has one ASoC platform card
>> +(card#0) and two USB sound devices connected (card#1 and card#2).  When reading
>> +the available kcontrols for each USB audio device, the following kcontrol lists
>> +the mapped offload path for the specific device:
>> +
>> +    "USB Offload Playback Route#*"
>> +
>> +The kcontrol is indexed, because a USB audio device could potentially have
>> +several PCM devices.  The above kcontrols are defined as:
>> +
>> +  - ``USB Offload Playback Route PCM`` **(R)**: Returns the ASoC platform sound
>> +    card and PCM device index.  The output "0, 1" (card index, PCM device index)
>> +    signifies that there is an available offload path for the USB SND device
>> +    through card#0-PCM device#1.  If "-1, -1" is seen, then no offload path is
>> +    available for the USB SND device.
>> +
>
> That's better, although I'm still not convinced end users care where offload happens.
>
> Few questions though, so I'm sure I understand how it works:
> Does "0, 1" in this case means that if you try to open device 1 on card 0, you won't be able to do it, because it is offloading USB?
>
No, it means that if you open device 1 on card 0, that will be the USB offload path to the USB audio device.
> In case it is "-1, -1" is there a chance that it can change?
>
It can change to non-negative when the offload path is enabled for that device.  Currently, since we removed the device selection logic entirely (for now), if say you have 2 USB audio devices connected.  As mentioned previously, we will select the latest USB headset connected, and the other will have "-1, -1" as the output when reading its controls.  Now, if the last USB headset is unplugged, then there is still an available USB device that can be offloaded, so it will switch to allowing that device to be offloaded, and you should see that be a non-negative kcontrol.

Thanks

Wesley Cheng



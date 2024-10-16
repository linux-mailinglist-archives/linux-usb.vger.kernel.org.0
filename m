Return-Path: <linux-usb+bounces-16347-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 615819A164A
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 01:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 170E41F21F15
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 23:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702AA1D517A;
	Wed, 16 Oct 2024 23:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GENuveHC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9430B282FA
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 23:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729122946; cv=none; b=I4gfvFplLxTO4VJsdZ60UWt2uCZhh6AFHQU9Le/hk8s4EpGhNosyyZnWSZDuuxsRDdcd4vNnUp5TIYNPUhbYTdqKdH3OfaaIjCkTSXjjt5SBk5Od4j/qQPdytuig2QeCR3vICuMN+UQAOVqCHjgOsAPslGAL5ip2gZrLY2bQR8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729122946; c=relaxed/simple;
	bh=SLBc+yIfU0DzILVM3pYWEOp3m55RHBcnaag9iY1gl0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rR6VdF1tsoptSaWXpYASDCm+7B0e0bLFqvy7CTMRyveDXRBgfLGPPdM6iVyrF4Ngaf8fj8cLy1xWow2EJGooINQ4pyzabyZam4AB18GR0K+w8ulT+E7eVUXmmUiYO7MAE0RtpkD4KqEx2RL95TP47pjdXEYcFjlnvH4L52g4Eho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GENuveHC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GLAPhG011275;
	Wed, 16 Oct 2024 23:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4xDI88iUIgAlyaFHAdspR3r1YnA8gsDv9xKc02LDJEc=; b=GENuveHC6HhJxUpc
	vgnVpEEnUbafVSDG/Jg9QVe7uL1lsAxvdGY0VLo0C/bwD8kLLzv/CzBEcnaksBDX
	1v1SSVYCznOB3jP0vC2esxqvVEnChMb/EpbNOncBtqAW83K8FKFqvuvT6LyhUBgK
	KsWbn/0Fs8fk0hCZWrqrE9gpzfSWl3v6i4Xc+l8dD5cGpMYvFRl+OfS8hdufqWNk
	YW8VWFlwr9GBwjYTZfnHBsRih+e6bL2epgZ3ysdM356tVQ/wOZkjReQo1EJ82Rf8
	jj5aZjzT10FTW1AyJBS2rVlvpISeaf/3Ku6MowykPP1LuwIY8/O2piibeBYtvCff
	rcl4eg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abm5j5f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 23:55:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GNtaS5029115
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 23:55:36 GMT
Received: from [10.110.33.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Oct
 2024 16:55:36 -0700
Message-ID: <9918669c-3bfd-4d42-93c4-218e9364b7cc@quicinc.com>
Date: Wed, 16 Oct 2024 16:55:34 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "usb: gadget: composite: fix OS descriptors
 w_value
To: Greg KH <greg@kroah.com>, Peter Korsgaard <peter@korsgaard.com>
CC: "Vodicka, Michal" <michal.vodicka@hidglobal.com>,
        "balbi@kernel.org"
	<balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Vrastil, Michal" <michal.vrastil@hidglobal.com>,
        "stable@kernel.org"
	<stable@kernel.org>
References: <AS8PR05MB10129E57ED13CF18746FC4BE18A9B2@AS8PR05MB10129.eurprd05.prod.outlook.com>
 <5f8cdcac-6927-429a-8ef5-0891c90e8efd@korsgaard.com>
 <2024100457-able-sake-47fd@gregkh>
Content-Language: en-US
From: Elson Serrao <quic_eserrao@quicinc.com>
In-Reply-To: <2024100457-able-sake-47fd@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UCEcIWl562FJnA-3SiVHfupfctBbn1PK
X-Proofpoint-GUID: UCEcIWl562FJnA-3SiVHfupfctBbn1PK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1011 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=729 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160154



On 10/4/2024 6:33 AM, Greg KH wrote:
> On Fri, Sep 13, 2024 at 05:39:21PM +0200, Peter Korsgaard wrote:
>> On 9/11/24 03:32, Vodicka, Michal wrote:
>>>> Hmm, very odd. How are you testing this on the host side?
>>>
>>> We just attach the device and check the registry values created by OS
>>> for our device. As
>>> HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_XXXX&PID_YYYY&MI_NN\<device_instance>\Device Parameters.
>>> When it works our extended properties are created there.
>>>
>>> We check the communication using USB analyzer which clearly shows
>>> wValue bytes are in opposite order than documented. This is SETUP
>>> packet captured:
>>>
>>> Offset  0   1   2   3   4   5   6   7
>>> 0x000   C1  A1  02  00  05  00  0A  00
>>>
>>> As you can see, this is interface request and out interface number was
>>> 2 which is in the low byte of wValue.
>>
>> OK, annoying. I am traveling for conferences this/next week so I cannot
>> verify here, but presumably you are correct. Do you perhaps have a more
>> complete capture you can share?
>>
>>
>>>
>>>> Could it be that you are running into the WinUSB bug described here:
>>>
>>> No. The mentioned bug is in wIndex and out problem is wValue. Also,
>>> MSOS descriptors are read before WinUsb is even run.
>>
>> Ahh yes, indeed.
>>
>>
>>> What Windows version were you using and have you used USB analyzer to
>>> check the communication?
>>
>> It's been a while, but I believe Windows 10. In the end I ended up shuffling
>> the interfaces around so the one with the MSOS descriptors was interface 0
>> for better compatibility, so it is possible that something went wrong with
>> my interface != 0 tests.
>>
>> If so, then I am fine with reverting, but we should probably add a comment
>> explaining that the documentation is wrong.
> 
> Ok, Michal, can you add some text tothe changelog and send a v2 for
> this?
> 

HI Michal

I am facing a similar issue where the Windows host is unable to fetch OS descriptor from the device running v6.9 kernel with Android mainline. Tested your patch and it fixes the issue.

Host Machine: Windows10 22H2
Composite device: NCM+Android Debugger (ADB)
Issue: Windows host is unable to fetch the OS descriptor for ADB interface and hence ADB functionality is failing.

Also checked the USB analyzer output and it shows wValue bytes in opposite order than documented i.e interface number is in the lower bytes (for Extended Properties OS Desc)

Thanks
Elson 


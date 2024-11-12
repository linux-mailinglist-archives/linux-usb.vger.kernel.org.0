Return-Path: <linux-usb+bounces-17512-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2649C6122
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 20:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 833E6B64E4F
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 18:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6E621503E;
	Tue, 12 Nov 2024 18:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EDdnt+ft"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC0E201270
	for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 18:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731435078; cv=none; b=KN95AGUaYydWcVJkgGWIBKY1KE8g+iuvLQt09boHCmdVVk/TmcnAdwTnF+OTt+KztdJolbhge97M9XER75HNB8cu1h2F25kuD3QOkWR8QbCPGfO9xixuGFFVbL7oMcZioN+AaGKmNbSKZScgihNm0Slc+mEgg24z+doGAtxhpTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731435078; c=relaxed/simple;
	bh=WEyU2eELYCeaI6KWdqPQfG0vwKD8uFPgLdaeIEHq7cE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=DC8VxYalyoKfTQ2W75n4K0IYOeEh+Ka6boAOvLxsfliHFbGzdL1/rF+PIkcUIZS18glLUAWuiIbLJBMOQcPvb6GwwFkx3NXM7daC/H6mL2Oj2Zcz6NwVtmKVdyfhkUxsAn9784zsAOmi0nkpke/shICY3niqIp6++qiIhwr/mpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EDdnt+ft; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACG28uR022161;
	Tue, 12 Nov 2024 18:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4e72X7oSGlrRBVawxp5Z/tI2DBNI18AINbfCTMXsoIo=; b=EDdnt+ftxXVTCpye
	U4M4IsIuxzIpJDlZoLEndHUkck07Kkg28Nke9ItPOphqGTTyMbNuVrSBHDuqeJAU
	v7E9XiR2HWDt8bNS27F5s6Blg+5x7f9xSnRTKWT/G+yBd1hDU9xeslWXtUcGm1p3
	j4Yge4PHERnGDV84FogCGJK+iS5BoVMgcl0WNer7jCLBGrcaXcJAVyQHzHgp7VqO
	eUGC4mbZCt0kquHNbo1rbnnE470TrkBWp25Gx48AUPkG33miwhYDNgDR5I1o4Chx
	skqXH+eRRd8f5cVYQt8fiNh1B8a3VKgeW+dOSKdITE26yKcdywCBQLz0p1C14U/W
	oFsGtA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42uc60cxcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 18:11:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACIB3QQ032472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 18:11:04 GMT
Received: from [10.110.84.56] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 10:11:03 -0800
Message-ID: <7bab2899-9150-4e8c-9a96-b1bbf20f4d61@quicinc.com>
Date: Tue, 12 Nov 2024 10:11:03 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "usb: gadget: composite: fix OS descriptors
 w_value
From: Elson Serrao <quic_eserrao@quicinc.com>
To: "Vrastil, Michal" <michal.vrastil@hidglobal.com>, Greg KH <greg@kroah.com>
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
 <9918669c-3bfd-4d42-93c4-218e9364b7cc@quicinc.com>
Content-Language: en-US
In-Reply-To: <9918669c-3bfd-4d42-93c4-218e9364b7cc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7G42FgAEp9vN7uzfcE8R7hKgVONRcnU6
X-Proofpoint-ORIG-GUID: 7G42FgAEp9vN7uzfcE8R7hKgVONRcnU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120145



On 10/16/2024 4:55 PM, Elson Serrao wrote:
> 
> 
> On 10/4/2024 6:33 AM, Greg KH wrote:
>> On Fri, Sep 13, 2024 at 05:39:21PM +0200, Peter Korsgaard wrote:
>>> On 9/11/24 03:32, Vodicka, Michal wrote:
>>>>> Hmm, very odd. How are you testing this on the host side?
>>>>
>>>> We just attach the device and check the registry values created by OS
>>>> for our device. As
>>>> HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USB\VID_XXXX&PID_YYYY&MI_NN\<device_instance>\Device Parameters.
>>>> When it works our extended properties are created there.
>>>>
>>>> We check the communication using USB analyzer which clearly shows
>>>> wValue bytes are in opposite order than documented. This is SETUP
>>>> packet captured:
>>>>
>>>> Offset  0   1   2   3   4   5   6   7
>>>> 0x000   C1  A1  02  00  05  00  0A  00
>>>>
>>>> As you can see, this is interface request and out interface number was
>>>> 2 which is in the low byte of wValue.
>>>
>>> OK, annoying. I am traveling for conferences this/next week so I cannot
>>> verify here, but presumably you are correct. Do you perhaps have a more
>>> complete capture you can share?
>>>
>>>
>>>>
>>>>> Could it be that you are running into the WinUSB bug described here:
>>>>
>>>> No. The mentioned bug is in wIndex and out problem is wValue. Also,
>>>> MSOS descriptors are read before WinUsb is even run.
>>>
>>> Ahh yes, indeed.
>>>
>>>
>>>> What Windows version were you using and have you used USB analyzer to
>>>> check the communication?
>>>
>>> It's been a while, but I believe Windows 10. In the end I ended up shuffling
>>> the interfaces around so the one with the MSOS descriptors was interface 0
>>> for better compatibility, so it is possible that something went wrong with
>>> my interface != 0 tests.
>>>
>>> If so, then I am fine with reverting, but we should probably add a comment
>>> explaining that the documentation is wrong.
>>
>> Ok, Michal, can you add some text tothe changelog and send a v2 for
>> this?
>>
> 
> HI Michal
> 
> I am facing a similar issue where the Windows host is unable to fetch OS descriptor from the device running v6.9 kernel with Android mainline. Tested your patch and it fixes the issue.
> 
> Host Machine: Windows10 22H2
> Composite device: NCM+Android Debugger (ADB)
> Issue: Windows host is unable to fetch the OS descriptor for ADB interface and hence ADB functionality is failing.
> 
> Also checked the USB analyzer output and it shows wValue bytes in opposite order than documented i.e interface number is in the lower bytes (for Extended Properties OS Desc)
> 

HI Michal,Greg

Since there has been no update for quite some time, would it be okay if I upload v2 with the feedback given ? This bug is impacting ADB enumeration on Qualcomm platforms, so would like to proceed with this fix.

Thanks
Elson


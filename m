Return-Path: <linux-usb+bounces-18814-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5929FC809
	for <lists+linux-usb@lfdr.de>; Thu, 26 Dec 2024 06:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 458A47A00FF
	for <lists+linux-usb@lfdr.de>; Thu, 26 Dec 2024 05:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4AC152514;
	Thu, 26 Dec 2024 05:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SikUAmGD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525591494CF;
	Thu, 26 Dec 2024 05:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735189222; cv=none; b=SYKmjo0elWGC88KC+X9mZHFRSl1bsswPxG7qixMHaJ/FFM8Rans1xR8/JrCNx12U6DIiw32VorkLLtBYGqdFlrpF7cGnZd5mI+JhYNwZbe71eqLMLKxe0n5NBV3rzsabcChE/TJUSGI1sd96HIAwB+8IFVdgGNXzvwpcca7VNDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735189222; c=relaxed/simple;
	bh=lgAiyRRTw5Gkq3ciHl1dAy5aGKVcVaYyyVxUFYVSPM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GH8edwDUnq7MVGuNSUwjTe/CxkwVVz3VfQjuVDqcWg3C/xFWmcNXhRqbvZ/DTxtwOXr7hI3BtSl+t2wvOMKCRplf8dq6mBVdT1t6kFsjVkdWsID2n2kd0jBHrZt1MLZNMJYvWgGQ/oA0UkXiU/a8VtN3qtExEUGblRA2JRu5p4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SikUAmGD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BPNhICO024661;
	Thu, 26 Dec 2024 05:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2IuYkSp6AxlbuOpnjBRf6p/ZhNrZwj0Q13iRxH7f54=; b=SikUAmGD89vMOrU8
	pPADHek5bk4M2D654y8HyngLKc+MSdY4eU2FAp20q9aQdDqJJh9ubX9ZUis1k4US
	WMkES8aipA4nlVGQBpa/Z/E25TIcAgzy/gmKYrNFK3gzwA4EgQ7KdMZG4OLB8isT
	JWKHrMR3VG0WC0OOlCPoKADeowBnsLAYC5OiLrZj7r6YsGu7n8g8amMD8comJm2U
	lvIwbEdwO3aO73bKdd31JSGsewnONQkPRnqK9X6trJsoT6TEaPqG+Z3AkVDmYpoH
	fVsbqzOR2WXVlcIzZQ9P1n1b9Bvib2QQphFLZbUWVteRNjlvcw4FkouIx/90AyF1
	21Ya4g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rkhs2jrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 05:00:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ50565015028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 05:00:05 GMT
Received: from [10.218.35.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 21:00:02 -0800
Message-ID: <a39cee8d-bf79-4fa3-96fd-e414af8c9f74@quicinc.com>
Date: Thu, 26 Dec 2024 10:29:59 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIIHYzXSB1c2I6IGdhZGdldDogdV9zZXJp?=
 =?UTF-8?Q?al=3A_Disable_ep_before_setting_port_to_null_to_fix_the_crash_cau?=
 =?UTF-8?Q?sed_by_port_being_null?=
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "mwalle@kernel.org" <mwalle@kernel.org>,
        "quic_jjohnson@quicinc.com"
	<quic_jjohnson@quicinc.com>,
        David Brownell <dbrownell@users.sourceforge.net>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        opensource.kernel <opensource.kernel@vivo.com>
References: <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <b511a84b-62d9-43cf-9a16-f365832873cb@quicinc.com>
 <TYUPR06MB6217705570D07BCEE6D7F771D20C2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Prashanth K <quic_prashk@quicinc.com>
In-Reply-To: <TYUPR06MB6217705570D07BCEE6D7F771D20C2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lRQz3I0rUOqxBe8N-2x5oGKbOa2DwAQj
X-Proofpoint-GUID: lRQz3I0rUOqxBe8N-2x5oGKbOa2DwAQj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=776
 clxscore=1015 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260041



On 25-12-24 12:33 pm, 胡连勤 wrote:
> Hello  Prashanth K:
> 
>>> Considering that in some extreme cases, when performing the unbinding
>>> operation, gserial_disconnect has cleared gser->ioport, which triggers
>>> gadget reconfiguration, and then calls gs_read_complete, resulting in
>>> access to a null pointer. Therefore, ep is disabled before
>>> gserial_disconnect sets port to null to prevent this from happening.
>>
>> gs_read_complete() gets port from ep->driver_data, and it shouldn't get
>> affected if gser->ioport is null as long as port[port_num].port is valid. Am I
>> missing something here?
> 
> This description is not very appropriate, thank you very much for your suggestion, I will modify it.

Seems like this patch has already accepted applied to Gregs tree. So I
think its fine for now, just update new description here.

> 
>>>
>>> Call trace:
>>>  gs_read_complete+0x58/0x240
>>>  usb_gadget_giveback_request+0x40/0x160
>>>  dwc3_remove_requests+0x170/0x484
>>>  dwc3_ep0_out_start+0xb0/0x1d4
>>>  __dwc3_gadget_start+0x25c/0x720
>>>  kretprobe_trampoline.cfi_jt+0x0/0x8
>>>  kretprobe_trampoline.cfi_jt+0x0/0x8
>>>  udc_bind_to_driver+0x1d8/0x300
>>>  usb_gadget_probe_driver+0xa8/0x1dc
>>>  gadget_dev_desc_UDC_store+0x13c/0x188
>>>  configfs_write_iter+0x160/0x1f4
>>>  vfs_write+0x2d0/0x40c
>>>  ksys_write+0x7c/0xf0
>>>  __arm64_sys_write+0x20/0x30
>>>  invoke_syscall+0x60/0x150
>>>  el0_svc_common+0x8c/0xf8
>>>  do_el0_svc+0x28/0xa0
>>>  el0_svc+0x24/0x84
>>>
> 
> Thanks

Regards,
Prashanth K


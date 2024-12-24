Return-Path: <linux-usb+bounces-18762-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C5B9FB95C
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 05:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 247DC1884534
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 04:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1461494A8;
	Tue, 24 Dec 2024 04:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PYBFdRCd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0DFEC0;
	Tue, 24 Dec 2024 04:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735016010; cv=none; b=HEO+77ac6vD3RRI+1G+p7YqpA98LjYwqgRSL57NoPKGDL1dWeVpIAoDfJ/rX5uFk6t9eoDcC0G6QHNqi8rLN2Zawc2SJSTrGPXDhh4HNF30uTLYSvk7zRbeu44Gx5xM5n4XmK7hVaPXcRTmyWmXvegTM+ZngE9PuNj9hJ6bcxow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735016010; c=relaxed/simple;
	bh=/1Lzn/BaD2iIRuPhLpSdvX5/LFsvL6iyfqARpxRnzgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mN97X6b4WiSevNusO11g4vondREpIK+hNmbZT92XCSDsUzD5wmp7cun5WRgPSxIt8z6ti1qhGs5p43BBubFvzkTWXTIdvp6LuECny3rWkRvMg606rmFQM7rUf+ZxTL2Yk1Z/bhQa2fcKN96f0LdCNXb7nXNRDaD2YLOyfyg2GcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PYBFdRCd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNHTiTb018497;
	Tue, 24 Dec 2024 04:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LPHzaS5HJ3kAH/sKLqnPBZfnoh2RetWotl+/+llzUPU=; b=PYBFdRCdCVY5flJ/
	PMZv2stE/QSuQU1K+kPEXT1Or9E+F4TjM4v8GK5XeUFgX/yXR2wbTtfUOcsOxWVx
	jIzIpBgpGmC4atPy4mO5dsNuHUvw7R/NmUs3lLWoDqeTw0axG2FbqJkCtRwKbRDh
	kaHNsk5XmEdN7Jby4ABB6c0E8RAUm2zxqnSy4z/PnC2ixWUVAEYJ3Fg4T9ZvJ64N
	GXMHcnLLpQZ/o0BmeJ/zuKpfrhQYenDaejo7DEwEyS5R3/kf0cDbJiUw5rNB/Ek/
	uAUwa4tNhWhEZzcwFC9rzE50YkXnCPPFTpjQJKjNTnnOn2Yake4H1rMzY6yXiHE8
	+7n5BA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qca19f7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 04:53:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO4rFk8018684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 04:53:15 GMT
Received: from [10.218.35.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 20:53:12 -0800
Message-ID: <b511a84b-62d9-43cf-9a16-f365832873cb@quicinc.com>
Date: Tue, 24 Dec 2024 10:23:09 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: gadget: u_serial: Disable ep before setting port
 to null to fix the crash caused by port being null
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
Content-Language: en-US
From: Prashanth K <quic_prashk@quicinc.com>
In-Reply-To: <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZWhPCsm5PeiXi30_BuoKFJZCTwI4BXNy
X-Proofpoint-GUID: ZWhPCsm5PeiXi30_BuoKFJZCTwI4BXNy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=322 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412240036



On 17-12-24 01:28 pm, 胡连勤 wrote:
> From: Lianqin Hu <hulianqin@vivo.com>
> 
> Considering that in some extreme cases, when performing the
> unbinding operation, gserial_disconnect has cleared gser->ioport,
> which triggers gadget reconfiguration, and then calls gs_read_complete,
> resulting in access to a null pointer. Therefore, ep is disabled before
> gserial_disconnect sets port to null to prevent this from happening.

gs_read_complete() gets port from ep->driver_data, and it shouldn't get
affected if gser->ioport is null as long as port[port_num].port is
valid. Am I missing something here?
> 
> Call trace:
>  gs_read_complete+0x58/0x240
>  usb_gadget_giveback_request+0x40/0x160
>  dwc3_remove_requests+0x170/0x484
>  dwc3_ep0_out_start+0xb0/0x1d4
>  __dwc3_gadget_start+0x25c/0x720
>  kretprobe_trampoline.cfi_jt+0x0/0x8
>  kretprobe_trampoline.cfi_jt+0x0/0x8
>  udc_bind_to_driver+0x1d8/0x300
>  usb_gadget_probe_driver+0xa8/0x1dc
>  gadget_dev_desc_UDC_store+0x13c/0x188
>  configfs_write_iter+0x160/0x1f4
>  vfs_write+0x2d0/0x40c
>  ksys_write+0x7c/0xf0
>  __arm64_sys_write+0x20/0x30
>  invoke_syscall+0x60/0x150
>  el0_svc_common+0x8c/0xf8
>  do_el0_svc+0x28/0xa0
>  el0_svc+0x24/0x84
>
Regards,
Prashanth K


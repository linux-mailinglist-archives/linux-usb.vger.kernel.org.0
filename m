Return-Path: <linux-usb+bounces-7038-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B088669CC
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 07:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBB791C20982
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 06:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C04C1B966;
	Mon, 26 Feb 2024 06:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aP7TIsPo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B57F18EA8
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 06:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708927292; cv=none; b=DBpEgPAB3ft7AZzP07fbDPa3Iy3fYgHteMvTDOydKwhh+m1/TEoC1/xlWXKFNBaZcyJkpa3DEOJihAFPBUX9/h+HfIG8DShccc7bAoIDoEqa3Uh5j8LL/WGSmsdHUyJT3lt8ndNwVKi/egvjE63KRk2BwBtDKnqHvUTfE2RkYe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708927292; c=relaxed/simple;
	bh=SxtYx0vCSl0gqRUlnFJZVlDBlZTN3Y2+Y8ps+LWa3L0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=USqtw8GqX8dqSiEUGZHIeCQxqBLaUEpxOCYIAhMB7aN1JXBq6YxkZSMjBiS/1VfdCs9M1KIuGTZFwqDSU47eX8zzfYBrm5yZO7E7NGJZAVMYDTHwLwrsprqlistFP+FmwmPL0GRhpH6qcN5G41Bw0/Pjl++9JfzzSzqJd2J/Uo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aP7TIsPo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41Q5chHF005107;
	Mon, 26 Feb 2024 06:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=tqZhjtkDHMQm95jqby7Oj+zd+7Dnim/pTy58W8Cj9Wc=; b=aP
	7TIsPo9TCsr/izLO5AywNhk3o9hcsfdIiKDFmfyKO+uJOkJMD2oWdfDTq9rc4HtR
	E6ix29RX0DIcIIq3cbGyth5vW3c3qEbBaYsi4Gjz34wF5bUrLH8+mZmYXdkvvZB7
	5vMLIbOJlWxU/ieectcmu9Bq69AnWBMV+qAdlsluB1V0t1OwT7fpp2ni4PLQjU/P
	ypX/FBExUOJ+pm9r3pmKkR4FrX78qlVvSSQrVSFAnkJKDGWpMC78MBrs0IPpjIZf
	/SXFWZMAkimh8hyMnZxMXec3KGlNx5PfofTj7ly9vWQoFCjt7cB88NBpwlhKxcXA
	GWTVvyDTfrYsguPWumog==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxmg3c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 06:01:16 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41Q61Grv002872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 06:01:16 GMT
Received: from [10.253.33.53] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 25 Feb
 2024 22:01:14 -0800
Message-ID: <bce66ef7-efb7-4bbe-9d84-d363f046963f@quicinc.com>
Date: Mon, 26 Feb 2024 14:01:12 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btusb: Use right timeout macro to receive
 control message
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <stern@rowland.harvard.edu>, <linux-usb@vger.kernel.org>,
        <usb-storage@lists.one-eyed-alien.net>
References: <1708682416-8664-1-git-send-email-quic_zijuhu@quicinc.com>
 <2024022341-rice-worry-c99b@gregkh>
From: quic_zijuhu <quic_zijuhu@quicinc.com>
In-Reply-To: <2024022341-rice-worry-c99b@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2vVP_WRtAI2rS4fh0FDuiGTWsFq5Jcdx
X-Proofpoint-ORIG-GUID: 2vVP_WRtAI2rS4fh0FDuiGTWsFq5Jcdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_02,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 malwarescore=0 mlxlogscore=880 impostorscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260043

On 2/23/2024 7:33 PM, Greg KH wrote:
> On Fri, Feb 23, 2024 at 06:00:16PM +0800, Zijun Hu wrote:
>> USB driver defines macro @USB_CTRL_SET_TIMEOUT for sending control message
>> and @USB_CTRL_GET_TIMEOUT for receiving, but sierra_get_swoc_info() wrongly
>> uses @USB_CTRL_SET_TIMEOUT as argument of usb_control_msg() to receive
>> control message, fixed by using @USB_CTRL_GET_TIMEOUT to receive message.
> 
> You do realize they are both the same value, right?  Why don't we just
> change it to USB_CTRL_TIMEOUT so that people don't think changing this
> matters?
> 
1)
will optimize this change title if this change is worthy after code review

2)
yes, i noticed both macros have the same value and carefully read below code block.

include/linux/usb.h:
/*
 * timeouts, in milliseconds, used for sending/receiving control messages
 * they typically complete within a few frames (msec) after they're issued
 * USB identifies 5 second timeouts, maybe more in a few cases, and a few
 * slow devices (like some MGE Ellipse UPSes) actually push that limit.
 */
#define USB_CTRL_GET_TIMEOUT	5000
#define USB_CTRL_SET_TIMEOUT	5000

3)
these two macros are introduced at the same time by Linus Torvalds with commit 1da177e4c3f4 ("Linux-2.6.12-rc2")
below is my points why it is better to keep current two macros than unifying both to one USB_CTRL_TIMEOUT

 point A)
 we can't confirm that sending always have the same timeout as receiving for various devices, it is easy to adjust individual
 macro value if sending potentially does not have the same value as receiving in future.

 point B)
 current two macros defined by usb.h has been used by many usb drivers, there are more drivers need to be corrected if macro NAME are changed.

> thanks,
> 
> greg k-h



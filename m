Return-Path: <linux-usb+bounces-27484-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F15B6B41598
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 08:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4628D206C0A
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 06:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E906F2D979A;
	Wed,  3 Sep 2025 06:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQDvF9wB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08B92D8799
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 06:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756882333; cv=none; b=RhGWgXlq4ONIS0CjuOsdnOgZkocYx4+y4UO1s6gbryqb3OewNa/v0hgcu2ohA+3ol6lbyWE10SESaYEY3SpboLPxFXQMN/PEmhomgbcVtx0NjUbsIgUDxXMkAPOELAEOC8f7XtFu2zpfTYfWeU1iPviPMv8dDMCxOOhUgtRFnTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756882333; c=relaxed/simple;
	bh=QHyI31iXOsXHQnr+3AzHnSOgkcOzBaLTCdzD2n8E34A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoyrK9SK3qr+DWy8k5SNstfiOcIVnrAur0ViwIq04VaGzzr2nuBt85qaHM8lUOukGwyoPEsc6C/OywfVaQngski5W/ybAVPSSk+643mANFzVukovBJ08QB96Y+WKGVbrqK+F33O0ql04NbUdrKs5pS/1soWcE8tsGVNeT9iiZXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQDvF9wB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5831tCUa032288
	for <linux-usb@vger.kernel.org>; Wed, 3 Sep 2025 06:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xh06HkTHgX0IXaOaZlgESddUPOj5qIUQ3p3Th2I8MiM=; b=XQDvF9wBcIRTT8MT
	taZneGfSYagOEw1rJJoH5mmX5QrcgoreB0soLZy8sD5MUOfSxjTX1T31eN5AEVX/
	+NHxZk+S5F79NA0oCyKMVT204r4n6BhI+PwQby2vZYRgiQy/ALq8N9OaJgwlCHST
	fK1M9lHfFt0D7D6sTQTOkNmhJmuxRh5Jwu2Gy/GEurQDHx/ysMGEKY3juKDBGdXZ
	sfN/eFWN7pb8MiAWY/UhfHEvh+6dFi84CAS/DYY4HuSPncblQM1nYissru2iOPYF
	C9/yydygRHFnxWu8OWjWvTUX0aGvosXyYfXdEiJf5trDmXu7TKLTeXJljfKgKAUO
	G+B6yQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8tfu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 03 Sep 2025 06:52:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7725a76dcb4so512822b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 02 Sep 2025 23:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756882330; x=1757487130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xh06HkTHgX0IXaOaZlgESddUPOj5qIUQ3p3Th2I8MiM=;
        b=UmIOr4On0Z5kycyoZ12+XdVrUkHXlNJl5VBHwlwO9LwnpwDPPE+R2EKFP0Q9uVI10n
         voeaLEQUti6mbDwbehyGZ92IrlBta40uRKtvY5BWMbFIPm74M1L6926kRQRqH9W1KoW4
         gGy2qCDwt/jIVLet4YJ3TR/qdRbGzrmTqVT7/nk8mTQp9oZakZP/v9FD4bIaEfo8/zIo
         /c2a87qw+8N28Egq3XQUfdxqEjUk8bOAALusvSSGr03CWY5nL8ktBDtWO1ZuQ/Qt+rNY
         hlwZnKCnRsbqWp0r0UH9KIy0FghBHQjcmomM7JcaBPHnNN+0xinV2NlqNOJPKYsV4c+Y
         CHww==
X-Forwarded-Encrypted: i=1; AJvYcCXdWvlz5iMmhcEl4MCRK5a4YEtRjXqBmm47JMHo62c2PeO0pqHFVJtmYMljzdYmRkPU1rcgaxPK0fY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws+K+LWlRX7V5oP3BK16XdDposTBOc707wN8CHd+xu9MCVF4G7
	GsaEGL3bxk909dOGnw2e8ZZQ1g+VjUabIKAccQ1j7GG/PCXRPuSSPdxuRRyl66V1O2AwzINDQaT
	u4WowVd4r8y44Bce3ZRHonohSVcihe+u5uvYvEBalMigbl9MAv04pnfBAlF6wEHQ=
X-Gm-Gg: ASbGncsfkZenS/WwC5SiWssItDf1DtIE7F+YxfTLvKN1fjuZiQJtFNH05txssxWJE+z
	6kyKb5IgJigZxWJXfsfBh4CpOHMcMpUYhCtDkP5bZSCEGZtku7rGMk1GY+k4AzPxjQVkNKejIAp
	cNm/ZcUoBKKP6majYU27T2MRJM899Lm6XU6NMiNm1Cvrh++8jFO5pe2hCzEuvEpZ8XkKW8+IKmI
	w84EuLFfZaRCmf6X0jMthw7iC9DEOdQgFA8BLVPnNEVWbxdALWjRMZgf1av8XqmwaHYD6Sh2trJ
	fMRpO8mzRQCBfoFb3R2Y2w08FMxOOc5268iaB5fvd6QpwlygsM2D535JOexIfw+vr9Vp
X-Received: by 2002:a05:6a21:32a4:b0:240:cd0:b18f with SMTP id adf61e73a8af0-243d505ce60mr23025634637.4.1756882329650;
        Tue, 02 Sep 2025 23:52:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXajHBDkYe23FL7mguuC493CU9o4nYUdXepF1r/U+XRkTqaTve2Jr243ltR83czIWc5OLoOw==
X-Received: by 2002:a05:6a21:32a4:b0:240:cd0:b18f with SMTP id adf61e73a8af0-243d505ce60mr23025569637.4.1756882328812;
        Tue, 02 Sep 2025 23:52:08 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f8a0a3948sm5981277a12.27.2025.09.02.23.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 23:52:08 -0700 (PDT)
Message-ID: <67329e66-2221-426b-88a4-eece06d694ec@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 12:22:03 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: Log dwc3 instance name in traces
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250825114433.3170867-1-prashanth.k@oss.qualcomm.com>
 <20250828224852.ukelgargocektp3z@synopsys.com>
 <5b30f63a-5999-48f1-972f-93f02fcc0ec2@oss.qualcomm.com>
 <20250902234450.vdair2jjrtpmpdal@synopsys.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250902234450.vdair2jjrtpmpdal@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0krK23JG2v-zGLi2wOjvJDBTUkFyDYQj
X-Proofpoint-GUID: 0krK23JG2v-zGLi2wOjvJDBTUkFyDYQj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX+UCdaUxTRxs1
 wbf6hfrrC5MjVWi+AirEX7xx7QPBLNCp8BfH7IoWszYqYHyLg6sNnBexx9KeDIYjcpGV95+BFVL
 6lAaTcju3vv7kgHJnVwO46pzjx94uj5l4hfgajA16acWxeu36xl58FxEqKv5bSEu+YcK7UM2DTs
 fZWadCb2m1vq06ED6cERRr7J2o6amcv5VRXXLOEQSOjq0oll80wJu0Wz7TW6/SzM7/XN3XNWlqp
 7+shQnFoTbXRrIdmD9Nje7D/ytoFtRiXzNE2VgxTrJ/yMHPIAi39+AzuRF4W/AgLj5Olt57bBxT
 aKg+soZywG1smlO2tYgNSmdMMb60bHv96uWFlylUcrndLSs99KE1zTE9+6ltIIPRWQc90rSQfp9
 DpymtgLk
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b7e59b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=k2XJ8v2PsYtg0y1r_vcA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020



On 9/3/2025 5:14 AM, Thinh Nguyen wrote:
> On Mon, Sep 01, 2025, Prashanth K wrote:
>>
>>
>> On 8/29/2025 4:18 AM, Thinh Nguyen wrote:
>>> Hi,
>>>
>>> On Mon, Aug 25, 2025, Prashanth K wrote:
>>>> When multiple DWC3 controllers are being used, trace events from
>>>> different instances get mixed up making debugging difficult as
>>>> there's no way to distinguish which instance generated the trace.
>>>>
>>>> Append the device name to trace events to clearly identify the
>>>> source instance.
>>>
>>> Can we print the base address instead of the device name? This will be
>>> consistent across different device names, and it will be easier to
>>> create filter.
>>>
>> Did you mean to print the iomem (base address) directly?
>> I think using device name is more readable, in most cases device name
>> would contain the base address also. Let me know if you are pointing to
>> something else.>>
> 
> Yes, I mean the device base address. PCI devices won't have the base
> address as part of the device name.
> 
But the base address (void __iomem *base) wouldn't be helpful.
Using the base address, i guess we would be able to differentiate the
traces when there are multiple instances, but it wouldn't help us
identify which controller instance generated which trace.

And for PCI devices, i agree that it doesn't have  address in device
name, but i think we should be able to identify the correct instance
based on the bus/device numbers, right ?

>>>> Example trace output,
>>>> before ->  dwc3_event: event (00000101): Reset [U0]
>>>> after  ->  dwc3_event: a600000.usb: event (00000101): Reset [U0]
>>>>
>>>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>

Regards,
Prashanth K


Return-Path: <linux-usb+bounces-20640-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E01B3A35985
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 09:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DEAA1891DF1
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 08:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D71322AE59;
	Fri, 14 Feb 2025 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSd9bn8b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784E522A7EE
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 08:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739523419; cv=none; b=WJbr7g7mZCNNTsLkivEuP6b67rWbyoVlJEIQaP22W3lN7/XYPW8nN7DZr9+3Bojh1kv12ffwzXyB2ilYjnn4HRpogKjxYFc0OF0tGpJElU5xLxe6uS5ngV5x7VwRGeHRayjLNW92HNXalzlk2meUcznZWTycmawVK7EnxbaVAL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739523419; c=relaxed/simple;
	bh=N2oMEh6KNf6wBuiHWeggrzEjBJybpqlqwqAt7hY3EyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MRn6aFOj5qGISEVpYNS4tSZM9SyJts98GXSh/e6n78EUHKhI6XJrKHS3chjmcyLuDWLHyhHJW/f8ZSjE3/baI6x0XbM2MYJHchbbnryiZ9Xfu2mkCTmvij2jpYSnf9Azo3MhA+fPiqFJSchZU7XNYTJIFzRNNfvbAG00hUROJjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSd9bn8b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DKDBff027801
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 08:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zt82XTOmepbxt73N1eo4Gcxa2vbkGwf5dADu4EFFH+w=; b=gSd9bn8b7SfqRDSj
	62HWhD+6Z68T4K2/jUZoXM89ENZRZ1XYc51Gpgx721HbkQTibqoqYNNoPogrgsPd
	nCK0TL1AWA6hxa+3t5mtEj9VrsQ7QJfM70yrphUjDuBFB64TGmxEMGiT1dxTWVvQ
	irXeSyLR9UgVs6qASOxy7LAk8p/0Yl/6ccIC/s60c2xvK6VLhgISvnyfnPvQ8aFb
	/KdiDBntaVXBkDtyS+yso/HFi6tH69NkMHPR8AWGSmpSLi6UImVgAc7PKARznjUp
	b8GjSef86WNpPDG0AcpcR5ZbBblhDe5Bgme+3mHf9idWcsEibSTWjESao+UnmZD4
	nrE5ig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sebnb5bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 08:56:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc1a4c150bso3505076a91.2
        for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 00:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739523415; x=1740128215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zt82XTOmepbxt73N1eo4Gcxa2vbkGwf5dADu4EFFH+w=;
        b=faWZIs0BJmYsAgzwV/LiUjSa1epG9S32eGO2sQaXbLnten9lHHz8HHVcHtL1MBdUm5
         2D0cjeecL8IJcpCb7/nLPindRjb+NdMKWnAeLlN2EOUVteNUnWjrJIQM5M44NBn7KbcK
         zV2eo83nTm1cX/val3ugs9vOwIn1Wwbnr4TdlmEC6klgTfrTnMCRf1P2F4ExuqV7CPKC
         et038SWVWgLMgKYSvQ9iNcfus+RZzv7+tk9lMwUnzSjZxtVsLX/JLMGVTJISjX4TZkkX
         rFwfUr3mCeAjL8wVnpDY5VWd3qcsSzQzler++aEnsfHM/+keWYpXD4Hf7W4cojpXZcQF
         kCBA==
X-Forwarded-Encrypted: i=1; AJvYcCWKJ4CKb9RIv1xHJuwOhGFEaRfqsnzx5G5xgEQqLvHGMNwz5QbeY1eFHFBKqekYNJZ1MVZPp0V2agE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzngNQcbUwP/4nvpJHPcjjLb8roSzyPAuLrzlzB8kL0ys2m1b3X
	Iurw+Kpq8Umq8Mdrpny34cQE5VFwgkV9TaxnnarsniORuQIvdJb9iTdM7kIQi+Bn3sQ01LCWZbr
	AXJnja4+oftgPfUJi2y2O6e+VvVqbMh955zsXGLWI6/odP9I05WyC0y0MTZw=
X-Gm-Gg: ASbGncs4vJ0tW+c2Ib63TZNDAlTS0dFH8OUtdS6JL6Nx2Zgo7pcPtQ45NDMebDCTXuu
	9M8VDDwxgX1dC8draFoX2RzODLPUaj1twvr7EoNT9AvClwp9aoxgTh+RI0oHGpoLsUBOVTER3h6
	GltTTuZUaeTYFGHiozjQQUzRdWcpPkE6xataMuANy1tSjJoD+CPX2d9hD9VQ+0xDQZ4bCMSoh/b
	jL9PTUgzC0aTtj8sUMjr6CTBLZJT/Wwhw2Oy70cs8N+ay7+64HuX1O+A9hPwmpMTvwuHFIgUWF8
	LisrIlalMRwwHJ6+yB0Fv8mgVJWWag==
X-Received: by 2002:a05:6a00:3989:b0:729:a31:892d with SMTP id d2e1a72fcca58-7322c591baemr20039228b3a.8.1739523415565;
        Fri, 14 Feb 2025 00:56:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0xCy3CGTXSILQ1bj4llABzfBeQ7obxgJnQtk/CYwRAuzAyy2KgJQVQxxN2Sx9fbn0eu/yyw==
X-Received: by 2002:a05:6a00:3989:b0:729:a31:892d with SMTP id d2e1a72fcca58-7322c591baemr20039209b3a.8.1739523415219;
        Fri, 14 Feb 2025 00:56:55 -0800 (PST)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e438sm2728749b3a.94.2025.02.14.00.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 00:56:54 -0800 (PST)
Message-ID: <b7903b50-4213-41d5-a7d3-5dded5f38994@oss.qualcomm.com>
Date: Fri, 14 Feb 2025 14:26:51 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] usb: gadget: Set self-powered based on MaxPower and
 bmAttributes
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Korsgaard <peter@korsgaard.com>,
        Sabyrzhan Tasbolatov <snovitoll@gmail.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250204105908.2255686-1-prashanth.k@oss.qualcomm.com>
 <2025021435-campfire-vending-ae46@gregkh>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <2025021435-campfire-vending-ae46@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eXcxY-cJTItrwY9g6MQEimqok7VIbEZu
X-Proofpoint-ORIG-GUID: eXcxY-cJTItrwY9g6MQEimqok7VIbEZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 impostorscore=0 spamscore=1
 lowpriorityscore=0 clxscore=1015 mlxlogscore=188 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=1
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140063



On 14-02-25 01:32 pm, Greg Kroah-Hartman wrote:
> On Tue, Feb 04, 2025 at 04:29:08PM +0530, Prashanth K wrote:
>> Currently the USB gadget will be set as bus-powered based solely
>> on whether its bMaxPower is greater than 100mA, but this may miss
>> devices that may legitimately draw less than 100mA but still want
>> to report as bus-powered. Similarly during suspend & resume, USB
>> gadget is incorrectly marked as bus/self powered without checking
>> the bmAttributes field. Fix these by configuring the USB gadget
>> as self or bus powered based on bmAttributes, and explicitly set
>> it as bus-powered if it draws more than 100mA.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 5e5caf4fa8d3 ("usb: gadget: composite: Inform controller driver of self-powered")
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
>>  drivers/usb/gadget/composite.c | 16 +++++++++++-----
>>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> What type of "comments" are you wanting here?
> 
> For obvious reasons, I can't apply patches tagged "RFC" but I don't see
> what you are wanting us to do here.
> 
> confused,
> 
> greg k-h
Sent an RFC since I got some comments last time while changing few
things on this path, was expecting the same thing this time, Will send a v2.

Thanks,
Prashanth K


Return-Path: <linux-usb+bounces-28952-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50066BBFE45
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 03:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C51FC3AE4DA
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 01:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4A41E501C;
	Tue,  7 Oct 2025 01:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NbRT3MvC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492A11C3BF7
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 01:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759799125; cv=none; b=dXjviErHezMhz8fZx34KFXI2PhoBnl8PLgNG8t5X2fixltt24LdpKlKGX4Zu0xynk5hMa7zDQIfWnwdcuQGVB2NNm+FQyQs+TmqtSKDmRMUH6gEbODMGAsuLAr8L74FjIkt3briFL5DVXhcyboAfOMvPtyt502a9DHQXx1t1Fbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759799125; c=relaxed/simple;
	bh=bN78AEgja7FUP77gENw3DiDXom3H/G8fEsmu33m41jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtatLHC5Ls1W7GOmDGbCicZKzxo1EmRKr9EP9+VJhatafXvU4MHlormJUo71sbYpxVgVQq4UvLK8TriHyx1SEdh12M2oBxFn3Gcxc3DqUf4VapGAYGg9lJ1NRsEuub/LX7BxOBEVXnMPnxvrlnSFXY3aLraxtRgXcf4AyOymxOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NbRT3MvC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FPgxu029008
	for <linux-usb@vger.kernel.org>; Tue, 7 Oct 2025 01:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahrNSeb0NQWhBk3m/lb45NZJspf2/oAz6SdApzCbmB4=; b=NbRT3MvCpVXIy1/j
	yBsNPUnV+xpirXET0ZtQucBsmSEZN4tVhOuo63z61mDu4kqH+cS6kuXYd/c8LrhW
	wFIOpeowFn+oAGZS/C5hLi1zSd/ZXVWgcVUEyyY+ZoEcxgluOirk5YVimKmYiotb
	sHyoP65AvirMhuAHnD2DZTXNoKUGRW2cuh0IB2K+2F2SIKnwDYpBb72+wawiOhOr
	qhjdUHKuE5m1pbo0vLNzWdoOubSVjh7UkWp3oa/h9UJobxYRfT0mcXlw/mRcHP8T
	+7oSz/p0ss8iyKem9W6AKcW9aFQYSBshVXvFuTZ0kuhqVOvFNko2x13KhtiZtcVw
	SfoPgA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0ha97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 01:05:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28eb14e3cafso42970845ad.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 18:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759799121; x=1760403921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahrNSeb0NQWhBk3m/lb45NZJspf2/oAz6SdApzCbmB4=;
        b=btOLm6J5NP4DYxHpDKQhABoMOKEurq3t4mbo51NXlxsShq86v/VECa9RaSZJuwCiTG
         OHxesG7Afd161FfntJsCNt1cnVtrp/ydy2WxKEYPt95rrqLZ7+ftXMhRJmxKkCGhJKa5
         j2QKx3N9WIx3CVeiFxVdhWclang6E2IfwvJZE9dwMml1gqyPhh+mTfWOpjrJLrraevvm
         N0TsLWf/09Xdar/J8Q6UPiXzsoit86iA2qgtUJCqV6XF0XUjsIQ3tdVXzw6pNysriEL9
         1KjLaQKiBimFrqY17+tMeWQhTxDYd8WuuMLxBBvPuensFgC8L6iDeHIXv+PWwzwAd4hq
         O+xw==
X-Forwarded-Encrypted: i=1; AJvYcCXJ0Fjq8K8z9A1MUqsu2ZoAT7G+WHmz6RXWY0M56UsNB5YOOlU6h6WkZBKmg9AayQlPDTEfS3iY5ZY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwj+taD9OGp6VdPJ+WRRHPrN4cOptIirt9AZpR1RB7+Mu2CF0Y
	zV5WUS8SuEaqbQD9bhYhugFXskPN5p+9JtWT27VehaDS+t1tCHZsDLMAQ6e5C/F0pv4qYfZhxb8
	/xqQt4/96iCwVJocJEneCUEsZ3aumPSEWLq2paFmXgDxQzGtQ79avx3dTEL80oUg=
X-Gm-Gg: ASbGncs3JI7wxowePDi469ow5KP0PnnY+0NDbzBKmRQYkPOQvAp0Jk7O1oDuSLKRuqK
	80PWZJIEbRlMWhUM4KeOdbfLJEpb/MIRDXnv2tRvKFVW/PKUWLkB5Hz8zyh6rIM8EVVKXjT7xkt
	15Gcdc7huBEvBFsqxwokToVoONUalGbxZCTmDS46hXtI0B8HwL1d+tw44B5DpAUMdDoYYcq9cB1
	NuC6DAwEP7oV4Q73cd+zjAY/ywD2Hyp26OOuuVMVgq/MV57qP3c8swnrcN7EJgMHLJ54yWo3WJc
	lc66JPB4h+8rFgPMl32sdrMg64p5N3wGcnl+TJKoABmG3+Emp08QaUgE6S4gXmlSFsfzX5k9dW7
	nFJ0pg7QVOOTK
X-Received: by 2002:a17:903:1b46:b0:26a:23c7:68da with SMTP id d9443c01a7336-28e9a5bf107mr191525385ad.25.1759799121206;
        Mon, 06 Oct 2025 18:05:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK5FlqZZWAVLLYWf7xgsddH7C7vi1Z0PSmlxL52MRXH9QOeZfRWq6du/B1w3IP8YVFcHH7cQ==
X-Received: by 2002:a17:903:1b46:b0:26a:23c7:68da with SMTP id d9443c01a7336-28e9a5bf107mr191524955ad.25.1759799120730;
        Mon, 06 Oct 2025 18:05:20 -0700 (PDT)
Received: from [10.73.54.138] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099af3cf6sm13327205a12.13.2025.10.06.18.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 18:05:20 -0700 (PDT)
Message-ID: <6ed9bd6b-37a3-36a8-a347-85429670837f@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 18:05:18 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 00/10] Introduce Glymur USB support
To: Krzysztof Kozlowski <krzk@kernel.org>, krzk+dt@kernel.org,
        conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
 <a6690fbc-0b86-4725-99ca-6b4cc477b4ec@kernel.org>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <a6690fbc-0b86-4725-99ca-6b4cc477b4ec@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9824am_n6MVU5FXnQmgVoRC9JHzaqG3a
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e46752 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=Zu9LzCyC9gr4H2Ik_2AA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 9824am_n6MVU5FXnQmgVoRC9JHzaqG3a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX0M+C+/2dWJCH
 vPqCA6sxqAtLpWi2DXL5W18VClO5/rSxRNZe3/aenoUON8zG32zP/1IbCVIAjVzUKR1n6tLavDl
 k5iCQgJY4gFP1hWSRkYecfmt8A7DFldIbFGpe3KrsLWlmDULq96hulG/WxjRwVZscs8WUvGZiqY
 uK96uEQcfy7+vduXNPhqlY2Z6ydLSQ0OxbdPLRG2zpPCSyGiMWY8Bc02/7plY28mMu1zmcQa1DH
 DHTJosNH3lTgacvfgiy0xLLdWLrVsWxPzu52SixCDf1rqB2xmAtJEhSNteCH9hawBapZoVCdFqi
 FQvFmrgUk7+7YdHxdIF0/XOM1exjFkprENdrgBe25yrD57gncP7h5+5y6D0RqXS9zddB/n5pXJT
 fbsZNFgmW7KGDhrp6gVznGvzI5enyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123



On 10/6/2025 6:02 PM, Krzysztof Kozlowski wrote:
> On 07/10/2025 07:19, Wesley Cheng wrote:
>> This series enables the PHY level changes that are required to support
>> the type C based controllers and the multiport controller.  The typeC
>> ports utilize a usb43dp based QMP PHY for the SSUSB path, while using
>> the M31 eUSB2 PHY for the HSUSB path.  For the multiport controller,
>> it will utilize two QMP UNI PHYs for the SSUSB path, and two M31 eUSB2
>> PHYs for the HSUSB path.
>>
>> -----
>> Changes in v5:
>> - Moved phy-qcom-qmp-usb43-pcs-v8.h into USB specific QMP driver
>> - Fixed DT bindings for clock properties for QMP combo PHY
>>
> 
> Where are lore links? Why aren't you using b4?
> 

Sorry, I'm confused?  Lore links to what exactly?  There aren't any 
dependencies here, in case you mixed up this series with the DT one.

Thanks
Wesley Cheng


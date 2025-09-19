Return-Path: <linux-usb+bounces-28325-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5892CB892B8
	for <lists+linux-usb@lfdr.de>; Fri, 19 Sep 2025 12:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1512E4E7FE7
	for <lists+linux-usb@lfdr.de>; Fri, 19 Sep 2025 10:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256EC30ACFA;
	Fri, 19 Sep 2025 10:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZlcvrVa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2629F30AD09
	for <linux-usb@vger.kernel.org>; Fri, 19 Sep 2025 10:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758279588; cv=none; b=bZWCArPiqWxMj0RNQogEqxY4LUUR+E7Se/uQ1lHxXhH/SQgyh6czUfz/+XzbUPXXvLw2kdLJa+bhcEU5CTlgzkZ0Kgt5DUOD0HIJ8mBmmDFPBmZS2JX4JAXMQ1IxLQFZWV6N5MrElkoRfQgSDT5m2rRS1LYeEpEuH/NBQ9CuzKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758279588; c=relaxed/simple;
	bh=1bItdUy9nwAHVuE5ZulUuLChF+k11//vCgZMSzhWoes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PEM6yf5NG3+XXNCyPhUNNaId2eCVPGEi/bzcaAfKPATYK2WIcgh/D8SNVzapnBIH0+HCDRTmdAr/4jG8ZQs9vZ4N6AJr2NlLpWoUqOyE115oDQHnF1YspSjMCWKRbiDHQyM3fiIhxmOtPIgKXqhBhsNLzRzYRd6lIbGJNRe/VgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZlcvrVa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J6673x029580
	for <linux-usb@vger.kernel.org>; Fri, 19 Sep 2025 10:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7KXBgoD7KBzdJVyEVcuNjIF1T4ZJ3E8KWxPmz57V7TE=; b=PZlcvrVaaHSk3tCT
	Ri6PpLjdvuo5bXt1M0kVTyEGGYdDmV08hSuD82gJ2hEOh/8J/s1wRbO/NlRNCNYy
	Y9Rl1jlIlapd3ppXW47QFxnkpIsewLULtxUpx5yoAIwhw4ArJAzql+QmyL5BuW5b
	liYJlQHhxME3ZFBbl/3HrynMvfLa4oEIo0gFChMZUC0oR+z8S6FIczB7/u7ceVKs
	Pcpqo5Lcv5q4g9zqmN0w76DzoxZY/JVb5ZR51hw5vrGRO95DstRefUsGhhxUV2oj
	HGTH2gDMX3ZRVDSg5HzURW4zIFnO7TVbwe8qgwyVbW303uNoTU09XbVPl5gUwgAR
	VOeU8A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy123qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 19 Sep 2025 10:59:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-269a2b255aaso25376685ad.3
        for <linux-usb@vger.kernel.org>; Fri, 19 Sep 2025 03:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758279585; x=1758884385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7KXBgoD7KBzdJVyEVcuNjIF1T4ZJ3E8KWxPmz57V7TE=;
        b=D6WaSKBvr+5qUVtczYZoOMJOqPB21UJcayuArgcFU6m0yQUeUDBHNnwYmkISpRh51A
         oH4CSBeSab7P0KTu2FjYlfK973c0U4euljJI+Zhfknq7sO4K8Kul/o0Du0JKLRlKOiEL
         LHPYP2FYvVviuLxDzy6cqHa0sd90lq+Zq+z1PcZKCtnW2kYbNwgMSgsAFdopJ8qM4BmE
         kykDBLrvw6hlh46bZ+wl0hWL7kX0qUq8+5W1qfcGbCGI1L/sanGJUQhA1fwclsAtHg9D
         Wmbjb0CHgn1IWozkisKOUFllNINIYVKvrVRTt29MYkkG5AGGvR9UfroWa3J1bwXC2by3
         4cKw==
X-Forwarded-Encrypted: i=1; AJvYcCVpGYyCMTP3TKW/4icLOB+Mhqh5RuZayoinhc7mZe5Nnr46xLwuSYUnMlVR47O6CeLvKHD9etvooN0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk/NHCG771wDF4PohVOm3Z11vGBXEuSXs7JCE4LV3VyK6bXIWK
	I4HLOzPoAlGy9KZPvDaN0aPlMR6cyI1STFkwYGC5nfI/ePVz+tdbJ3DdRhzmv8BT2f1bt5yRe/V
	HOkbLOZflmsScyWX8bVXqLvuh7H66450BYKsXD8EWMbqEhUlcGPJetFNKuvc47pQ=
X-Gm-Gg: ASbGncv2cJInUj+z/cqLBOL4tNraH4AWB9dLITs9IaZ89iWciwoxsfcP0BFBnsuTYca
	Hugu7AHhLn4xYjZoyViKGCHo6D6HrASECKIHAILH32sprD8vRWbuBeH842NiDw5yPCZDNW24AH/
	SUtU3RzVB85Xl2LimXb6SI8Mn5ITSv+ZfwLojOfsmSB0JMAUUNbUGdesDWfsKtXkd6MKBa2wjBC
	Pxx/dVzo8lQgbn3EXGDTJn8lwrnP7eIqzJt+cdCF1rD2rfprUwAAhcI2yLkhM16bsK4sFG7hiqL
	W2/rLgNac46OgNfkA/9YVwyGaqwk6a86xkO1WpZcLeASGBEHUTP7ezk9kXRrpjL/mwAt
X-Received: by 2002:a17:902:f790:b0:25d:37fc:32df with SMTP id d9443c01a7336-269ba534c6cmr41731055ad.47.1758279585229;
        Fri, 19 Sep 2025 03:59:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkYsJ7nL+qMX0Ukc9BIqOQkZAm7FC+TJrSw3sQT36HAW+zTwFLwgAHDwIa7v4QBOU3/y48vA==
X-Received: by 2002:a17:902:f790:b0:25d:37fc:32df with SMTP id d9443c01a7336-269ba534c6cmr41730755ad.47.1758279584619;
        Fri, 19 Sep 2025 03:59:44 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016d9d5sm51524015ad.53.2025.09.19.03.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 03:59:43 -0700 (PDT)
Message-ID: <4d6a555d-aa27-41ba-a194-06c51d86d1dc@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 16:29:40 +0530
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
References: <20250828224852.ukelgargocektp3z@synopsys.com>
 <5b30f63a-5999-48f1-972f-93f02fcc0ec2@oss.qualcomm.com>
 <20250902234450.vdair2jjrtpmpdal@synopsys.com>
 <67329e66-2221-426b-88a4-eece06d694ec@oss.qualcomm.com>
 <20250904000003.b4j7fnucronjf6ej@synopsys.com>
 <745a2b9c-078d-45eb-97a7-3a27a4bc5191@oss.qualcomm.com>
 <20250904234409.etyz6ep3y4rfr3he@synopsys.com>
 <d805d060-be0f-4d23-ade6-683bf5ffebc6@oss.qualcomm.com>
 <20250911013631.hv4ibt3j452tbsex@synopsys.com>
 <f9e9b906-f3da-421a-b8b1-928534ad5703@oss.qualcomm.com>
 <20250912215444.egh5vdgvwbvqs3my@synopsys.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250912215444.egh5vdgvwbvqs3my@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uSjeceQ0_zIN5Hr4CJaZpm6IurCqmLuR
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cd37a2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Y9WB56IBG9BgkFqy77EA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: uSjeceQ0_zIN5Hr4CJaZpm6IurCqmLuR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyjKhqzNn90Zq
 JHrdj5uNCFyxYXF5BbSzplWKDm2ALCVH3fCB1+hMSJTKJFHSlppHln8wjPjYvY/jNZQ+lQ9wiBV
 wJU3z4CwsPtYcscusG7ep/+Iq+v/dzdC1d4WJWJORbRXoA5TabjYQlRpfWYYxlWRKfx4YRfV2ud
 dKBwtt0LqLvw6SBwWcite1GkNTVrjrpe8trrnAAdZSD4dfZrbCHWP/Q/dp/MLJ7L/iGnyz5QQ7N
 cBP/jYdDUAtBFp4YEuPaGz+QAYDkBL/4c7O9ea/ylnPg1aAeafbdSdjge8CB0OxGSEMRyEJxuUS
 NIYoCyelBUho++6X20mT66Y+SLzzB2XVbXxG93YEXfQYD1Wh5jsyAmEB+RJVWtXEb+QVnl0pMX4
 iAzx6cW1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202



On 9/13/2025 3:24 AM, Thinh Nguyen wrote:
>>> You're right. I forgot that we can't do virt_to_phys() for ioremapped
>>> resource...
>>>
>>> In that case, can we pass the dwc3 structure in the dwc3_readl/writel? I
>>> know there are many places that this change may touch, but I feel that
>>> it's easier to read than creating the new macro dwc3_readl/writel.
>>>
>>> Thanks,
>>> Thinh
>>
>> 1) Passing dwc3 structure to dwc3_readl/writel will need changes in
>> around 250 places, we can do that using 'find and replace'.
> 
> Yikes..
> 
>>
>> 2) OR we can use container_of(base, struct dwc3, regs)) to get dwc pointer,
>> this will not work in few places where we use dep->regs (~6 places). we
>> can just create a separate function dwc3_dep_readl/writel for dep->regs,
> 
> We can just update the endpoint macros to something like this:
> #define DWC3_DEPCMD(n)		(DWC3_DEP_BASE(n) + 0x0c)
> 
> so we can do this:
> 	dwc3_readl(dwc->regs, DWC3_DEPCMD(dep->number));
> 
> We will get the proper endpoint offset, and we can also remove the dep->regs.
> 
>> and get dwc3 from dep. This will have lesser number of changes, and less
>> impact on git history.
>>
>> I'm more inclined towards approach2, but fine with both approaches, let
>> me know which one suits here.
>>
>> We can use snprintf on res->start to get the HW addr and store that
>> string into dwc3. Is that fine?
>>
> 
> Option 2 sounds good.
> 
> Thanks!
> Thinh

I think we need to go ahead with approach 1 (Passing dwc3 structure to
dwc3_readl/writel), because we were wrong about the usage of
container_of(), it wouldn't work since it's a __iomem pointer.

I'm planning to break this into a 3 patch series
1. Removal of dep->regs and use dwc->regs everywhere
2. Use dwc pointer in all dwc3_readl/writel()
3. Adding the base addr in traces.

Regards,
Prashanth K


Return-Path: <linux-usb+bounces-26786-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C30B241E7
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 08:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DBD21B64466
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 06:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAAC2D73AE;
	Wed, 13 Aug 2025 06:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIhgwH/V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCE52D63E4
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 06:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755067780; cv=none; b=Uk4kWK4WJp3jocVe39FQrUiNVLRWGxeud26llBvSewTmZT/qZQpD4K0Ge7MmBWKXCmD82TMba2itUOW/RImbKXW/5Ii3HdOn/3CIj0uz1BM3bTFLBDyP3gCF5sKrUwtc4PQKXiMFqh3CL85TKDTV6pKDu2T/3KkRVFliA2nylik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755067780; c=relaxed/simple;
	bh=qyRQ1ln1JbMp75hJ0kDu7mG5tuW+40UemEalqrMf0ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fn0pgOPqymQ4enSVrAgz1XqjEKK54cJwKLs/n0f4gBvmMXBTJwutlRVeqNvEhfs0WX8Z6k9xtm9dmBEkmTkujUP2udumS0jG1wtypyMqMaxSZ6t+Tkn4v5tKLskpF5Dv976UlQrxqKzSQjHylPsMQFfkcqf23Owqonu+8mKTnOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIhgwH/V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6n2EJ031564
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 06:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HR9/XxlfJFSa5gaZ2/cVDFyshE0iTajAntKn4VZZZrQ=; b=SIhgwH/V4QenCM4C
	xkBnXsx5YwItCzp4+3qOIaosjjx5m5HxecLBrZkkJ1sms73AuEnejMljT6Yaz7Hz
	Jffl9h4V0In5Hw+OlEW3RiViJB4NDSYnE2Zdx7zOvOkOFnING5ZxHkNipJw2EE48
	VcFqHqekYQ5UmaTY2jFZf6DWazmFkkqx1d3NUdUsalfPqAbno8lzY4v9I65AqVA1
	dWAQVsQLg6QtDV+6pvSnyjBEJk5XVg5dy/NCIuhGVVvot6HHGAajLzkgN/vq8lpG
	f7pztSiJ4gs1HDfMHY6FBdme3PCFfNyqqzOThu5lCkfixN2BGNJph9CsUbDdXkf8
	F3DKUQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9svc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 06:49:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-240b9c0bddcso60454275ad.2
        for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 23:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755067775; x=1755672575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HR9/XxlfJFSa5gaZ2/cVDFyshE0iTajAntKn4VZZZrQ=;
        b=KeHi9nBO4Omk2If2ifzZa0wJqGuFghBCPzt9tDG5gp/pNkjXROSRR/L/DJDLG9sECd
         QcjWe1+0zPaGisO+1nzQ6vi7LPCNlAMk4zoPegdpd3dJnhQLhSl1ITDsIDNUOag35F12
         0VN6JjAUsx41nIm54LYlrCBuiu3KAiJwHaWS9gbtZx/6pQYoRwSwQrubilYukQl3yn1H
         ecd/jfc3OTyXwREBEe8YApdGDsfr296r7uyn35qS1NqMkvypTz3lRlSMu9aQMIegkogp
         JyPAP6alYlRFEXT5LeGWC5JHytbG1g2obFAL1T9/LYxXVsm4jjFjQSIwCqMoqU8urtu+
         aNdA==
X-Forwarded-Encrypted: i=1; AJvYcCVxGsTC0+jJB3jdBfp/sNVVHThQp/scmMg7U3JK9u6U9yMzMu7f6YBC2OJbVimi9W5CLenNPHe2gGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWwH//7CNQjO+2HmzQ7VDA82cHWqKAsJHCfHKZhdcomYkRpjOf
	RYB8gZPK11Z+IawbVvffqo3Vb4JPGNo2M3e/ye0WKFcd09PYw1kaxpSTWo7sbsHh/9tQN0AUZEI
	Gc00W1HUin2WEAaEerencYtoLNDL2kGQNVinwKOFt4TmAwrUKUf/35U4FytzZiZs=
X-Gm-Gg: ASbGnctlfq+H+pvu176NI4yH5uKarZuN24vtwjS/pfXMz5JZmy1hRRQPJjWU6l/OsDn
	QsOZWzXI6o92LMQoOCFMUC4bOJ8P3sIeVxpfHn1ZZnNUX1Sp/0iIGGRuomgxXm9S8meZkD9iSg3
	dFpgMijA5zkhepWAtyBKXboORoPmgcypQZnrpAEugYU7Ghsxs1pis6aE6CeqkfS5DWaN1F5bU0L
	9UnrIiFC6nIuTF2LmDDzATtO83+qx/aoP2NiyVqJTKzUHYAnrfVB2kehNc20KUb4f1KQuUFE4v+
	8ZaB+38egZhwd4zhiP8QktFwR/wyF5FNkURBDCRdppthVInpAjqywWGJ9aUS+iFJSscaOJI=
X-Received: by 2002:a17:902:f64f:b0:234:d431:ec6e with SMTP id d9443c01a7336-2430d0dc1c7mr30707405ad.3.1755067775102;
        Tue, 12 Aug 2025 23:49:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIOmylEZgOC3s9pxN/xlV3S8avBhHKj9sbZhpAlOD8ga+zYpIHqDLQaDRG92qcXGtFmX4+6Q==
X-Received: by 2002:a17:902:f64f:b0:234:d431:ec6e with SMTP id d9443c01a7336-2430d0dc1c7mr30707175ad.3.1755067774613;
        Tue, 12 Aug 2025 23:49:34 -0700 (PDT)
Received: from [10.92.180.108] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24300f8ca2asm33500375ad.141.2025.08.12.23.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 23:49:34 -0700 (PDT)
Message-ID: <38a8afb8-01f9-46a8-ac87-be1e4ab53136@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 12:19:30 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] usb: xhci: plat: Facilitate using autosuspend for
 xhci plat devices
To: Peter Chen <hzpeterchen@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
 <20250812055542.1588528-4-krishna.kurapati@oss.qualcomm.com>
 <CAL411-qmWLJ9vYTc+NHFYymsJ27ryge88nTc71NAnzDa7TrExg@mail.gmail.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <CAL411-qmWLJ9vYTc+NHFYymsJ27ryge88nTc71NAnzDa7TrExg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689c3580 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=iitwNcAuny6OrRLJqDIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 6e99yxwbuOqxeYR0UNIZGBZVpy0pMiCd
X-Proofpoint-ORIG-GUID: 6e99yxwbuOqxeYR0UNIZGBZVpy0pMiCd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX3W21UM701WAc
 O2D5aFWYo7SloF+XZ9ainFMbp2EBdD5pUE9HtnXb90SP0ziVhe41LsvG3TAxsVv2esYdNZCl8+o
 oLvGGJEZQ0VTrhcJVc+ov9ifVFNSbe4ZTBkEAuoE99EFcrXnd2nqOsrp3puuPFilnwIaro1wm2s
 01cNvscXyf8trIwJZsxl4+Gt/KiaLIamPktbXBdCCkg+UVdbeGaS5pfjPCen8VO9UXP5YL+bbxd
 BUNpfu/qLLCZky/ER5Qsd0zOH1xT+IQvbWyFLqVVtvFBdIA3LLXT2FM/kveCaA/UjqegXTfh7Lo
 nPL9LOLFlvXXhTobgBSiGxFQJ0sPW57ad09516XPHet0K66QhEuN4UKJzsg6vjY+b7WL8j/SwB2
 kKrK87Lg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164



On 8/13/2025 11:46 AM, Peter Chen wrote:
> On Tue, Aug 12, 2025 at 1:58 PM Krishna Kurapati
> <krishna.kurapati@oss.qualcomm.com> wrote:
>>
>> Allow autosuspend to be used by xhci plat device. For Qualcomm SoCs,
>> when in host mode, it is intended that the controller goes to suspend
>> state to save power and wait for interrupts from connected peripheral
>> to wake it up. This is particularly used in cases where a HID or Audio
>> device is connected. In such scenarios, the usb controller can enter
>> auto suspend and resume action after getting interrupts from the
>> connected device.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   drivers/usb/host/xhci-plat.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
>> index 5eb51797de32..dd57ffedcaa2 100644
>> --- a/drivers/usb/host/xhci-plat.c
>> +++ b/drivers/usb/host/xhci-plat.c
>> @@ -171,6 +171,7 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
>>                  return ret;
>>
>>          pm_runtime_set_active(&pdev->dev);
>> +       pm_runtime_use_autosuspend(&pdev->dev);
>>          pm_runtime_enable(&pdev->dev);
>>          pm_runtime_get_noresume(&pdev->dev);
>>
> 
> There is an xhci quirk XHCI_DEFAULT_PM_RUNTIME_ALLOW for it, try to use it.
> 

Hi Peter,

I see it being used only in xhci-pci.c.

In xhci-plat, I intended to only allow usage of autosuspend and let 
userspace decide whether to use it or not (echo (auto or on) > control).

Hence I only did use_autosuspend() instead of doing runtime_allow.

Regards,
Krishna,


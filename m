Return-Path: <linux-usb+bounces-26226-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D31FCB1341A
	for <lists+linux-usb@lfdr.de>; Mon, 28 Jul 2025 07:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB48A1768D0
	for <lists+linux-usb@lfdr.de>; Mon, 28 Jul 2025 05:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8672121ADAE;
	Mon, 28 Jul 2025 05:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6GN/Shq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61173218EA1
	for <linux-usb@vger.kernel.org>; Mon, 28 Jul 2025 05:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753680127; cv=none; b=EkAWH8/EpDVbk5kC3f4Nvt3aIzN5VqfdOrDeODYQ4IO1GqXSqEoQeJosah6IXtqOzoqVoSa4fiNf47MCn5CQdx8Ze7R95Lp4ApcoG4QY9NdaMGKNMapqjqPN+DOHezzJ9lWXxBbHwMOort2TFsf27bl8SXwqi0lo2geUR7nReFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753680127; c=relaxed/simple;
	bh=Zvvygo8cmThuzdFqssYldBEg/xvDHBhqBt2QHtqYmr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7Ct059PDv5yCF2eH70+HjrRDklPvchxEKMk+Rp5MYeifj8PSvB/RGPGlK4QC0CID6PD8Y7arKtPZr3uiqICXsh+GplhCUQ9jx0bCntSMtkinIOGgwC2ELP7EBDzDUUsi86TDZvW6+5gqciZSuBwy/VrQ/k/WZs4giWWPaimW2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6GN/Shq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rY67019709
	for <linux-usb@vger.kernel.org>; Mon, 28 Jul 2025 05:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0iashDcqdonuYgX5reL1ipejS0IkYuXFhOiQyjV1mw4=; b=B6GN/ShqMDW8YS49
	dsfiRGlnp4ieHIF5GnYp4Hz9wu8IslawzJ20AmThYYG1FuWS19F6B43NgY7Mp6Pi
	18ZEEf389Ga1O9p0mSKeWNPW0uw++He/5tIkVTLHwqZx/EhjRSE0nk7kQOhIEOKy
	bJpvhgAbHxf9lJwNTZdfAt/pYLf/fSb5ZZ/THKWAWwGleDm1a6e2hhGq4jYbqxp1
	k+TXJkyNq5Ueco4jGF9knL4II7GcZ9aXJE+iDwYVE3OFBCcZXLgIixK4NdqEbZRc
	kzranmJ6ay2LtqB8u52FSzO817Iz+ouWMV6APDDafa6S4OWw+QOXOi+DUVUNQskH
	zNFS0g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qk6yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 28 Jul 2025 05:22:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2356ce55d33so66815085ad.0
        for <linux-usb@vger.kernel.org>; Sun, 27 Jul 2025 22:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753680123; x=1754284923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0iashDcqdonuYgX5reL1ipejS0IkYuXFhOiQyjV1mw4=;
        b=Cg101GnCHACH234qvSrkAw72oMz168Qui30zjVDlFbS3QuIY95qf+7T0IChGguAW0r
         NYn+nzApdy6+vWZE9Qmv5+TlWZUynyhdXYN6ZyOkLJyva0uH9YaoYNBDZzz2KCpm3zlL
         wZImIo0YqoX2EaRemi97ia0brxy83pLCwmJP/vrzRJUGOtjyRQczVUIiMTj8nu1dcaxI
         Is/Gzy8ZYgaLiq/O6QB4OWTGPQfr62X0Z73FdcFeyGDjAWVvIQIFIuweUz5pX7WYggDO
         lXgRyD274Z/rgD4HUN56bXEK21K23Ziu5dHHuaa53szykg1VvRl5AcyitL41SmbWoBEI
         4fTA==
X-Forwarded-Encrypted: i=1; AJvYcCXV77qwgJnTzg9nETNb6FVAI+mWOe/4v2hQjSyfBtVb2IPW10LQEMcxRzew7jKhr+eXPBXlIcmYXT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlxBaDOf8BcRBrvgcH7vZIbIgiqJbd5U4+Y0XuHkOGydlntYqR
	Ho/MjQUjMoL5yx1/XznM+PZ0zzpEzSGY5ku1GbTWlpNZj3dLPYOt90MmXpIumVp9Weu+RiKA2ch
	WYSOr7NI1eU3bfURY88nN8Ye4XyqWpi3wJf4PhUFUP0HTt9ygOttvHYjPfrcPJeM=
X-Gm-Gg: ASbGncs4NosyPOc+XS6myolo/LLp0FLsDWoSrCft+wSniB8vCCj+rgTc3MlB90nXL6d
	NJ9VwLwycvLqIT/oNW38N7xrgfdVLgTQXkss64EZFKGqjAK6YBhgyqLGvaZAgxbGNslmOz7aVjt
	zwqOsoEcb6ihLSN2HT8ARj1nucXop4c+L5mEKaSNfR+aE6/gyiCgvNGF3DG3lbeheYlQigPIVYR
	RXLL4AsAPba25261xSEL/NRCk50ebO5QfmeugIRXdixnP1tQNbkLFUiKOL0ObkhiwluT6JRhOay
	VrEy8P47gIXZfYyIFSIlKSPESV/33emPkALdGox1fNDKxx2hL5zbV6dhEWs/Hw5Mxi4U
X-Received: by 2002:a17:902:dac5:b0:240:aba:fe3b with SMTP id d9443c01a7336-2400abb2552mr49797635ad.16.1753680123574;
        Sun, 27 Jul 2025 22:22:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4i7EeJSuO1D44ijkfE6ZA/xsHWXErw8REmKW3YdUqmY+1Q7QDXpvC4Qxp+5wiVjvcbcLZQw==
X-Received: by 2002:a17:902:dac5:b0:240:aba:fe3b with SMTP id d9443c01a7336-2400abb2552mr49797385ad.16.1753680123123;
        Sun, 27 Jul 2025 22:22:03 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24009e53876sm21357455ad.2.2025.07.27.22.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jul 2025 22:22:02 -0700 (PDT)
Message-ID: <6159dcff-f6cf-416f-9573-d8753ed58a6c@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 10:51:59 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: Add shutdown handler
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250725062158.2418961-1-prashanth.k@oss.qualcomm.com>
 <2025072542-bleep-parting-3e7a@gregkh>
 <852ff03d-84cf-42f1-a428-ec747bea835e@oss.qualcomm.com>
 <2025072512-hertz-dentist-67dc@gregkh>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <2025072512-hertz-dentist-67dc@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDAzNyBTYWx0ZWRfX9cSWi5cUEP/c
 yQklkQCNgEc/2EgsHYKNOsUlBbesN1VOJRYkazNhe8dWMjsPHPFkTDrTeyWZKJYCEZP0VOHkMpx
 GfBLbgEMzhHs5Zr9vP6zXbxJshVRAPfw7HuvRDuXioXcrXxSYd0QfyoubZGvjUkyZ3oPiUEDoah
 Th/jaea+5Pj8yQK3VDSmDyXN3Xz7uHEWJ+8LlI9g1NfBJAOKqP1JB2fYq2USgDLrNY3BjVw4RE2
 OgvdCp+xQQn1/00qm+b1U8nIC9oM9WFT3e7uFeMIG+YOhOuqu6S1ujqM/OBVUkvHU/P9Tj+rCtl
 zeDzljBK7dOi19xbEb28gl3h+vuM9u6+Tg1EG3PdkZzeqPEUaZGCM3xSEtrfWOWZ2b0BHedu3Zr
 o2wPcu4zsmVZbnTwTOwwgY1387HPTgo/kzL5qM6ah2h6U3cLSBe4eTStWfYN3KFngogc3RkG
X-Proofpoint-ORIG-GUID: twfkXmd98YeB_LoSfPope7FngXpBKcTj
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=688708fc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=MBHFPv6fxAc3HuZYMuEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: twfkXmd98YeB_LoSfPope7FngXpBKcTj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=824 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280037



On 7/25/2025 5:29 PM, Greg Kroah-Hartman wrote:
> On Fri, Jul 25, 2025 at 03:28:12PM +0530, Prashanth K wrote:
>>
>>
>> On 7/25/2025 2:18 PM, Greg Kroah-Hartman wrote:
>>> On Fri, Jul 25, 2025 at 11:51:58AM +0530, Prashanth K wrote:
>>>> Currently during system reboot, SMMU disables its translations
>>>> while devices like USB may still be actively using DMA buffers.
>>>> This can lead to NOC errors and system crashes due to invalid
>>>> memory access.
>>>>
>>>> Address this by adding a shutdown callback to dwc3-qcom, which
>>>> ensures proper teardown of UDC stack and prevents DWC3 controller
>>>> from accessing memory after SMMU translation is disabled. Reuse
>>>> the existing remove callback for this purpose.
>>>>
>>>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>>>> ---
>>>>  drivers/usb/dwc3/dwc3-qcom.c | 8 ++++++--
>>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> What commit id does this fix?  Or is this just a new feature?
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> I didn't Fixes tag because a small dilemma. This patch is rebased on top
>> of the flattening series, specifically commit 1881a32fe14d ("usb: dwc3:
>> qcom: Transition to flattened model").
>> However, I don't think that this commit caused this issue.
>>
>> Let me know if you want the Fixes tag.
> 
> If you don't need/want this backported to any stable tree, then leave it
> as-is.  Your choice.
> 

Lets not take it to stable now, because it will cause conflicts.
If we encounter any issue in future, we can manually resolve the
conflict and backport to stable.

Regards,
Prashanth K


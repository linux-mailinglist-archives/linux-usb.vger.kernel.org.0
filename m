Return-Path: <linux-usb+bounces-30184-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE0BC3E9A9
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 07:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D41418812C8
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 06:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD112D979F;
	Fri,  7 Nov 2025 06:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xzj3AJQ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZdIPuAMX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4521C16F0FE
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 06:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762496185; cv=none; b=HEjLmqVywexv7TIwbR4wH1RyJEW0L63BSxyWOmSS/3gYsqqioJ6liq9+C2u/DX7+mFVwb/Tm25gz0vUM0KHKCf1D3r7dRjRC2ew7A7Ppoy/lNQ0loI4JRmik6ZGUs1eVyqoLkrcK+11swkBiz7HGwpKD7vpNUsw72APyr4jINsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762496185; c=relaxed/simple;
	bh=yjcswEZwzmB9HoX3NdWvFeQ7kLVcTWBGiyv2LsjHAco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AqhKAsE8GRLeM7V93TJitbA+zVsXTFeAai392r68rnpJwLTvehXbyNnI1Skg6n8UD+cNY+cOV0ZLdsNRH60oyIMHaxbVlrDS2UAo1c+9sXG7cW0T8PFpHkYcut9FX8zrvR8di6y4P+xz47BnsY0FGbMJNy4zk9UkRjCPVwucDj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xzj3AJQ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZdIPuAMX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6JfD7j629531
	for <linux-usb@vger.kernel.org>; Fri, 7 Nov 2025 06:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Z/aMbQCrtSS8aEEiDv40TS1dYvs9EL/Qr6XCooByRs=; b=Xzj3AJQ2baV0zHAy
	he/qEzUZIU/2gv+QbaxNmUbEjw9fyuNtFtZmYqAfdXMbMtOABY9oA9Dys0CdkXkY
	UPszy8/cJ0WvGNzKbzQXsLaosNUHnPch4StYvdMkQBKTvqV7OW5oCMAnH0skfeUM
	AECRuLd9Q5hp20psmvsiD7CU2HBXuWKdqxFZWeGLOA9FS4OfRBc+Ab44p57XHkcu
	XazcHwbc7XRBwdce/1lAeSNY0blA/bqCLYw3710GdLk0353dOyTEU360Lx763N27
	Eb+YyBWeAFMm+SpuoNdKUvEJPR0o6gIKBDS9J2nmhUKzh/KV0raFEHf2OCasUzfG
	M9uWCA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a92231ggj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 07 Nov 2025 06:16:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5533921eb2so405672a12.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 22:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762496180; x=1763100980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Z/aMbQCrtSS8aEEiDv40TS1dYvs9EL/Qr6XCooByRs=;
        b=ZdIPuAMXRCX7rklcOZnNDIxhoy0bZmgR4H8Bf9NGzjkv+j1dz3VUcdVRl8TPBPLXPV
         joFh+h5RDeVhgWSw6GVMADPWof+Oebq9linS3oeF+po8Q16W8eJCyJ23rML7Bg+9R9ET
         GB0+WpPpeaS+mVd6rHCZ0Nheh9ZhGHrBHgs4p9hYgsCuRHyf8bbYxya9+TijZQA3loGe
         B81B3tySci3WWMzWVyf2cx+81RSqzNsY8nbVSBRmgXn0cj2HTZTGO56IaD1YDWfcc8Oz
         koXKQUWYK9TZw04dDy7QRnzp1vU7xnkLbxKf53aM8HXlHlZqMwpKb1UWthMvLVzhbXpT
         rGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762496180; x=1763100980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Z/aMbQCrtSS8aEEiDv40TS1dYvs9EL/Qr6XCooByRs=;
        b=IG4mAZEAL+I4E1t4snk4K0yy+2lNWivtJujN3j759qaMsM/REehqa8yGoUZLa/MIRc
         qlBoif/4zbYVEnREtk7iJeB14CL3yYwFup9JoHBPCZ2ueZE3ctog4GXoFsI3RNOcOQvj
         09hhOynIqK+gkIBMd+cuszleUQDbtIY/yQjHcv4WfZEnKegYVKsPYibjvvTCjkSqFU3f
         VSoEIJaoBRW/+CCej6DlE6+a3hnB3KMk4OsWe13XK7hAR4JgVCO9M5cWjTnosV4D6xjS
         5Ap78HVcGtR3zOywBOf629tyRWvFgNVh5MPo7qEUqCcAe2xFnwIRHyk83foKZRV2EI96
         PzfA==
X-Forwarded-Encrypted: i=1; AJvYcCW0E+xlRkV2B1DKHrjwR2qsc7T0mj0GSIO7HS6tzRZkGump62HSmLfM2j0WJY69pJkYJPAF4Tp1fGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdcrhfL/NFnRGB8kaUJJp0Hbtqgo+5N3CDRJS8yop6sXjXFCF+
	/ZvT3zWCkv7VLtY1ESeqj4ceaiUiM8WTb1WdVpPE7dmYa2F5Ui6dDF275dONym5lagMDYc6nNZo
	QP0O95C2lXVUUFGEBwOhOVf4NlMMu0J9MeSUt/eIvma94hHHx8IUutx8rWghoTRg=
X-Gm-Gg: ASbGncv88gVid6Q0KDGSGAvgd3TOWTo2j1KjhWBX6v+nLzjZ+WNZsbjsaGo5JsYmsPp
	6TCAeiJilv3C1X38lMNLHpxhrDxFkTTFg+i4YfBM8nd6WvQgspn64zK3roZwA6Jolppxz/+UE/m
	cHDF6TuGN7UgosleAdsbk3p58oOVan7J+nfhVZLyLVq/wpaNTF0Z4VPSLiOxGadABHEtc79ugWW
	ggx3PId1bUVnBcJJmp84p1WpasK4DshLG3Zh8Lf/6QMdzUsd6JREpuWgVsxFMBl7DPbL6LFhYcn
	RnLLfo0qXPIOIq+JsVXnkOSSaWDVVR7ZZ4f5S32Seqyd8nGF+/AAboksWFDa0VQLWT1+vfEnKAf
	8Yv4nEiO9pfYslaWyd8EGeTiQ/omJN1o=
X-Received: by 2002:a05:6a20:3d84:b0:334:a681:389c with SMTP id adf61e73a8af0-352285797edmr3580930637.15.1762496180176;
        Thu, 06 Nov 2025 22:16:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHS2I1mGnV8lWyRfPADg2PCLKjAVtlui9XQS1AJW6zt6oWeOHb9wE6cbBps1q7C5Miie69Ybw==
X-Received: by 2002:a05:6a20:3d84:b0:334:a681:389c with SMTP id adf61e73a8af0-352285797edmr3580897637.15.1762496179669;
        Thu, 06 Nov 2025 22:16:19 -0800 (PST)
Received: from [10.218.39.189] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8c83d52sm4222492a12.3.2025.11.06.22.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 22:16:19 -0800 (PST)
Message-ID: <22d15a74-f04f-413a-966f-9581739e4c5a@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:46:15 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v3] xhci: sideband: Fix race condition in sideband
 unregister
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        wesley.cheng@oss.qualcomm.com
References: <2025102948-trickery-creative-417e@gregkh>
 <20251029122436.375009-1-mathias.nyman@linux.intel.com>
 <2025102956-daunting-roping-a987@gregkh>
 <094a2124-f6c9-4510-b7ec-8df872882a7d@intel.com>
Content-Language: en-US
From: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
In-Reply-To: <094a2124-f6c9-4510-b7ec-8df872882a7d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA0NyBTYWx0ZWRfX6kuZqJKYP4v6
 1C7soxBxo4NnalqE3h8k2Dqxq5sSKhTWTgwFXQcgnxw6j+EKDnYua24hHsTd9wBVGfvh19cJ3Ta
 6HqtKfKdd+7KZ4IaKPDKyrfQ1a4tgbq8hZ2QfoMbusAGc296sPfyFn2chEb/zvyLGqZc/7slq3W
 q96sLR/a2ksMizlxttQXFGlSVSDcoQGzd0msBSxMwzuZDv0xxBRXcRPQQKbwCAmb74UEZvvPUtk
 KBOtezxzJQTZBk/LEEoyOstiEPZRmdA/SthB67W+D3J0/IXX35N3yvAf0NMxa34CG5XsgKOe942
 96xQNSVcxJL1R2TK22OTpoP/AvVZ1JwwHr3LccyhrZSZvGgWEonWbJ8NJEN/229Cocl47JSy65F
 lVTXUWB7I1PyOK9eiIooYonnNcP76w==
X-Authority-Analysis: v=2.4 cv=Csmys34D c=1 sm=1 tr=0 ts=690d8eb5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=ag1SF4gXAAAA:8 a=WhRzYBbLbkwxm1X3v78A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: Wl4HaCGsEJJteU0yTzpqjE-qY3DGne_O
X-Proofpoint-ORIG-GUID: Wl4HaCGsEJJteU0yTzpqjE-qY3DGne_O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070047



On 10/29/2025 7:22 PM, Mathias Nyman wrote:
> On 10/29/25 14:51, Greg KH wrote:
>> On Wed, Oct 29, 2025 at 02:24:35PM +0200, Mathias Nyman wrote:
>>> Uttkarsh Aggarwal observed a kernel panic during sideband un-register
>>> and found it was caused by a race condition between sideband unregister,
>>> and creating sideband interrupters.
>>> The issue occurrs when thread T1 runs uaudio_disconnect() and released
>>> sb->xhci via sideband_unregister, while thread T2 simultaneously 
>>> accessed
>>> the now-NULL sb->xhci in xhci_sideband_create_interrupter() resulting in
>>> a crash.
>>>
>>> Ensure new endpoints or interrupter can't be added to a sidenband after
>>> xhci_sideband_unregister() cleared the existing ones, and unlocked the
>>> sideband mutex.
>>> Reorganize code so that mutex is only taken and released once in
>>> xhci_sideband_unregister(), and clear sb->vdev while mutex is taken.
>>>
>>> Use mutex guards to reduce human unlock errors in code
>>>
>>> Refuse to add endpoints or interrupter if sb->vdev is not set.
>>> sb->vdev is set when sideband is created and registered.
>>>
>>> Reported-by: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
>>> Closes: https://lore.kernel.org/linux-usb/20251028080043.27760-1- 
>>> uttkarsh.aggarwal@oss.qualcomm.com
>>> Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a 
>>> secondary interrupter entity")
>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>> ---
>>
>> Looks good, thanks for respinning this.  I don't know if it fixes the
>> issue, but it looks sane :)
>>
>> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Thanks for reviewing this.
> 
> I don't have the hardware to test this myself either
> 
> Thanks
> Mathias

Hi Mathias,

I have shared the patch with our OEMs and so far, have not received any 
reports of issues from them.

Thanks
Uttkarsh


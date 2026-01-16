Return-Path: <linux-usb+bounces-32420-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 065C8D2C09A
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 06:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0488330164D4
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 05:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25314347FD9;
	Fri, 16 Jan 2026 05:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rnc6Q1DP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TUKTMoE7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EB631A041
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 05:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768541879; cv=none; b=YKgIvdbiPChnmobgdxmp6UfF7oUNfw20zmT4Vx6Kk4ubNKpqu1Y/JZv8RJPhdBPhs7dlQyOXe7v67BwVGeHNbbE6t3OugG1RiaVGAHHYxL9HMQeEZMlScXkeqEa/ZDMaJSdRrpPYH3HnOmXgDpAIkmP5DgDzC2dImebMkBXxL6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768541879; c=relaxed/simple;
	bh=l1D7gKDjsc+2HlC1zY3SCPYP2Gc0uiramKeQJCmJfYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tgsY8qlM7vb+6b+ti3dvQg+2NJgoMXYvcazJRmgo3CERenDLdmPiingTcKcihRqLntu4FKQ31iG/sLS5g8VzWhg3VA/5MuHHRQQzWdxdcCZXrBZz9Dw0T3u97XINY89zjqXbTMCJNvie1N5qWuiRGyoFWnLNwiRWPoq+LkAwCfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rnc6Q1DP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TUKTMoE7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMbvQR3759206
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 05:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hgcVbwgjE/jDelUet+w0/YS+Gw7ANcs/LZeTOXcgAZU=; b=Rnc6Q1DPggoAsbpN
	LswGTuuICDToC9QMJ4dYN6V0CMgwkgeC7ugLKmE1dBqrkljbyQ0STwABSfQEBa4R
	gpfTRj68wMOutPLs7iX3LGwsGQ5SB3nlxsBmf+HDhSWDCS1Z8oOKQ9PTklN6Daxr
	D7YH/IgRiNnG1W528p+VFmHCLk78G1scT77wkPQps6ZF4NTpQ1oUiTw1BRuYnk6W
	ASHiCrLZ3KYY6NC3gZFt3xf2lfKy0O+6VL7eUmWaGovlS1Q8l0nQ66hJd7db874T
	yiods7x0ZcPX06uUNGcEc9k3m/jOZ15LQhiHh+U5u25vxrUR/0e0q423/D++BKc2
	62If4A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96srx42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 05:37:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f2381ea85so37121315ad.0
        for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 21:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768541876; x=1769146676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgcVbwgjE/jDelUet+w0/YS+Gw7ANcs/LZeTOXcgAZU=;
        b=TUKTMoE74eiuM+AC1Pjqh2lI44OXU/4s962GhVHIZy7e/gYt4Ic4OMKYk2FA0k+fjb
         azaAmp5i06S9JvHceyxgdJ6UDXSnaXdzu455wS4iIzOigX1uNs6IVf+QgBrNaodanJ3j
         PmXuaJvMjyXtFMvVZI8TOYQcqPrwhOlS9EcMm8H621CZq4WsGMwV0Htj8wMIaW6CireQ
         xNovb7Dh+/c4HLunQEeE5JgsgfyaPUHIHrkP5fKARBnDPeyf84CnfhJokc8vG56Nn1+Y
         Tt4SzE/S2Yqz1z8w20MQaQaCDx482cjmJpHxWpA0giOMYlAONrLsOXW3TfaIJwTXCwfh
         T1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768541876; x=1769146676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgcVbwgjE/jDelUet+w0/YS+Gw7ANcs/LZeTOXcgAZU=;
        b=OKmSDErd5KE/lezO2v/D8KQZtYPTjS+rfqGdheRxwVCWm4F+7+ZbGLM7Pep+7ugV+c
         6DwFihcmfUeKEs62DNW0sWgJ6OFCmSeK5XXnk4lE3HdasZ+vRanqo51z4KqrRGaxCGJA
         NDLJNUXdK4jmrZHyN1Ch5UbBc+6V6BuvXADtr+qdQJ6zKRz9/g/5Io+NTSIDMKqSX3+6
         x50PRthhumvPs/9lgRTsUrQb+TQFHlXo9PbqSLEw58wsFRlWLHs2UvzcB3x1LIKauhZ8
         W/SOtJDk5HovTLOLoa8yjYN7gzM/dGGBaA6Bg6/jqx2ArbHgTG2eeF7J2wzJWOO/Bthg
         8niA==
X-Gm-Message-State: AOJu0YxUNvLWEkAQF/KiiZBaHOJ6qN0IyD9FNyxbfGDN6xso0Gi6GsDE
	TN2I+YYFO9/dhcv4Q7Jb044x1W10Wr54LcXO8O9P3v2X//MnaXADrYHCTjC4vAUK+DFt7UC8QuG
	qC9jOsbt4uTQ5XPkfyDPEJZIB+fON3efXCDYZsgJrxtPB7wP8XjToLkzyIKt3AP7XsMoN7zI=
X-Gm-Gg: AY/fxX7rjlG5mWKbuAmWugGy2d2KnOmJ1/YnAcPWqdQsEnFA+3puuQXYFTjG/oeaTEw
	VqrbICGkcWmI6G7ALzWcNKHNFLi1abtVw/G5NRdTVLHG29e8jm7vUzwGE4oYGQ2fFUZ39TCFfEx
	GruUf99kZAJGVW4BG0DLfHVGCDiUI1RqI/Hjpb/tP4dGNN8K2Z9IUMaebqEiQHQoR+kE8SpUAt2
	SdMhUwjeqsEEPdrAjjN7uj8jzBWoCQlTHw3e+o4NerNPbnOFhOhAZuNHtbQLAN6DVMp9JEHoe3j
	aoZXSeprPte3TD1RuItdaLh2GP6ub5F1Jw3qB9ci/swPMpXer4pK8WvYr8KLCraVQmYQoLIrsik
	K+HUJr38ICRWG7CrVcrbRy+K+MS1rcUVYd9b1bQ==
X-Received: by 2002:a17:902:f78a:b0:297:ece8:a3cb with SMTP id d9443c01a7336-2a7188a1a0dmr15923345ad.25.1768541875968;
        Thu, 15 Jan 2026 21:37:55 -0800 (PST)
X-Received: by 2002:a17:902:f78a:b0:297:ece8:a3cb with SMTP id d9443c01a7336-2a7188a1a0dmr15923265ad.25.1768541875503;
        Thu, 15 Jan 2026 21:37:55 -0800 (PST)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ab93fsm9289885ad.4.2026.01.15.21.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 21:37:55 -0800 (PST)
Message-ID: <26f7cb41-5fa0-4aca-a119-2a7510b027a0@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 11:07:52 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260114100748.2950103-1-prashanth.k@oss.qualcomm.com>
 <20260114100748.2950103-4-prashanth.k@oss.qualcomm.com>
 <2026011400-monthly-commend-f89b@gregkh>
 <20260114225441.rn3affmwuhfl2z7x@synopsys.com>
 <20260114235357.zueeylekf4lfdq4g@synopsys.com>
 <2026011500-safehouse-alphabet-3056@gregkh>
 <20260115162234.ehm7l22ahh52d4y3@synopsys.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20260115162234.ehm7l22ahh52d4y3@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OYaVzxTY c=1 sm=1 tr=0 ts=6969ceb5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=YEAFrszdLZooU7NKBt0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: IACzljXrL7rVKMqeptm76PmWlwqIPy9L
X-Proofpoint-GUID: IACzljXrL7rVKMqeptm76PmWlwqIPy9L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA0MyBTYWx0ZWRfX9H5gU1lJZqLL
 5IMDze1AXjKcjYAZC33yK45HZ5rTlvYf69zMEfD9q7q9W47f6vkVPNftH5bphKQ4rfn1rK/08SP
 Ztnr9ZJYBXDyVWTjLmsbIeojK0P2VfoxQgrRdzk1Bpm58H17GszjI9Ti7yxPssX+cnuixaSvkjo
 vj6ZxpgPOntv3dwGflORTu6WrILsPEAUV48hbfCyTRNpQfw+8vDCP8fskEXpO8hsRK3ujaiWvNU
 l5drjJw0mQq/ffVRM5OanGNW0OjDNaQ0ekRfYw6FEfuwFCFXRRh4yATud5ZdSL6DaWdc+5CsX98
 RAGRxWe+d20r58WGc9LXBoA0NKgoq3zyZDf/7gNJ+8QiPnyknyy49m+8RGc1v44hmtE3cyODWEw
 gx3tUC7xKJKXZN6OHKTJkQe9Iwa4XigSI32AGsVE9YtPw8XwKb7vDi9e0cB92Y0rqEmyPbXBnrw
 Rop6SCXpZbQe7dxJ8EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160043



On 1/15/2026 9:52 PM, Thinh Nguyen wrote:
> On Thu, Jan 15, 2026, Greg Kroah-Hartman wrote:
>> On Wed, Jan 14, 2026 at 11:54:03PM +0000, Thinh Nguyen wrote:
>>> On Wed, Jan 14, 2026, Thinh Nguyen wrote:
>>>> On Wed, Jan 14, 2026, Greg Kroah-Hartman wrote:
>>>>> On Wed, Jan 14, 2026 at 03:37:48PM +0530, Prashanth K wrote:
>>>>>> + * @address: Cached lower 32-bit base address to be used for logging.
>>>>>
>>>>> Why are 32bits enough / ok?  Why not use the full 64 that you really
>>>>> have?  What happens if you have 2 devices with just the upper 32 bits
>>>>> different?
>>>>>
>>>>> This is a resource value, so why not use the proper type for it?
>>>>>
>>>>
>>>> This is only intented to be used for logging, so I suggested to use u32.
>>>> I want to avoid treating this struct member as a phys_addr_t where it
>>>> may be misused.
>>>>
>>>> As for the reason to capture only the lower 32-bit, it's just base on
>>>> what I've seen so far. That I have not seen designs where the 2 or more
>>>> instances are placed that far apart and share the same lower 32-bit.
>>>> It's a bit nicer to shorten the address print at the start of a
>>>> tracepoint. But if it's insufficient, there's no problem with using
>>>> 64-bit.
>>>>
>>>
>>> Or we can just remove this and print the address from
>>> dwc->xhci_resources[0].start.
>>
>> I thought I asked for that a few revisions ago :)
> 
> Ah, I missed that.
> 
>>
>> I'd prefer that, instead of saving off a value that you can look up if
>> you need it.
>>
> 
> Yes, this is better.
> 
> Hi Prashanth, can we just use dwc->xhci_resources[0].start instead?
> 

While its true that we can avoid adding new variable into dwc3 struct,
using 'xhci_resources[0].start' in DWC3 core traces can be confusing for
someones reading code, since all of the traces are related to dwc3 core
and gadget.

Regards,
Prashanth K


Return-Path: <linux-usb+bounces-37083-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIB1FLaL/GleRAAAu9opvQ
	(envelope-from <linux-usb+bounces-37083-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 14:55:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A104E8904
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 14:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA04E3033502
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 12:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE3B3F1653;
	Thu,  7 May 2026 12:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nhHkahHH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ScS1hfcf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3333F0AB2
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 12:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158414; cv=none; b=UIUgU8VzaGz8A/zIw7aG9OfcYwoG3P/B284du3B2w1CBlOv3WXMrZyr2rh/fjAGH1g9b5KAbmCYbYKXLmTcGhlZK8iyZ29NxoYrSJVwICiaJkw8QaO3dC6iQJZnmx/OYHq/traQj/ikNlr5OY3gkNpPIOi8/va/Cd2tPLgYkLT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158414; c=relaxed/simple;
	bh=cXauhEjWAeS/RLvrhwl4XwFZxQ2/KcEOZKTNm+uU0jA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IdDp1VTh/P283w5WVMMpUwzJZRc0eksIo7lHSMDgB6Vea2AA8XYylZw6yJG2//D9Qr4ZJJysR9kqoANmwNnq2SZ7elCX1I09hlCL1VljrmbB3Xck3FPazev8uogApIPPLqt1e94IOG1cHjCigzu7bP8W76cVpe8eRK2BfBEBy24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nhHkahHH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ScS1hfcf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BxZ2i2734082
	for <linux-usb@vger.kernel.org>; Thu, 7 May 2026 12:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QOE1jc2HnAlLzD8BFEtDOPGvG8q48G2mx4J61w97ziM=; b=nhHkahHHYBKNGNI/
	70TSQmz0x8pZrGBH0cEr7AZNe7JPwYM7y+Cpl3MI0fcnM2GCY2LiUIynfEq3A6pQ
	gfMgUCBzuAGsSqYEtismVzuClHnLmV3478SKuETh1N+eTA1ESjxEyMCRWIqxkdOQ
	amEvYHqvyNweBv1fgzhhv1rJSfIKVsDjD0ZNuvJ0ISlGBeKFpZdojzPi3SgPrXrM
	WRVbdnb0PJzXAJCbramwJ1uNZHY6dpUl7jG92qln/7J8J5JMlrp8wmhfrzBOIl4v
	tvMz5saWPaeZLLRIerxLkUX2bG2sTms8Az/7C/L6wkFQfTT4Gr5tuspoveV5tnTE
	impkCA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tbqr5tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 12:53:32 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f6e373ba0so66419e0c.2
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 05:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778158411; x=1778763211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QOE1jc2HnAlLzD8BFEtDOPGvG8q48G2mx4J61w97ziM=;
        b=ScS1hfcfFCXG4iB0tDrZekUqKhZetixhmcyJSyNidaHYZ/HXlC323nP/3obSOukROe
         eCBjoqo8SG6Ppt8G/uQ9mHXWPbtBC7Duzy2ucktqx+x7l6Jp0qd30+8/ZhK5RORmVnY0
         M8FgS3U/lCC9DGO2oQHYmGlHFv+RGllqtYsQs18ZOArJtuwG7HsuHhCESOKPDVxiwfcD
         BcSuHJlpBcmCY4ecZuDQplFUhoz3nOGe9JC6mtC8bD8teQ60fu/iYMjyPbQRozOqfSUe
         Fc+dFFN3JYS5KxZjFSA39YdWrosGfb3qGDVN6tMSru3ZKLFMXaX867R2qn7rNwEuZgRZ
         dB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158411; x=1778763211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOE1jc2HnAlLzD8BFEtDOPGvG8q48G2mx4J61w97ziM=;
        b=UjuQkK26CP8UN3XuMVBxWJ8NFDg5qalzaClr35pyBoFYPyWqTIV+o9oRYKn7WgD7dB
         hNbTDXo5wrqfFXIqRN2SHT+Q09pwTIVtdj+xIS/kPRTKkzg/eM8cQKIuZFSAGbsWUZ/2
         Zmd1kDHQssxmskRpaBYQ2pmqudfGAc6ad/+BVZLJzkXAOSAn8M/HQ2XgOAq6fDbSR4T9
         rF8d6Mhu6CVpGaYU5eIqDQsWt3UHpQ6CiddecupuUiPAmOsfwj4lRVFgK8csv9pr5WQ/
         7rWKijDkyLr7WHaNSw0lHryLsGVBnT+HZ4tVkFBZPKDcmtErIY2k8Ic/CtgCpQHA6eT0
         ghFw==
X-Forwarded-Encrypted: i=1; AFNElJ+0F7A4jyUpYslrtevsWO+xuhQbQIp63i4mFzGey6RRM5WTMJCTvkyqu5gLp5LSemCGO/cGPQvuYwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcZ8Up0YkI/lC+F8dNbn/TTcFan8NMSp2gMz+Hu9D3ObkeDEoz
	/f0gVCXiixBnsVHNBGRK26xO+LEzCfTMGUFRwwdWaYNtcynPS0yXf7On5bB38G0E9WNOEw5ykUw
	SVgR2XLotwLW9z1o2wPqt1PlvMOu3dv5/HWTTq7zryhSQ8QoEY+ZcfOxB6wYzFZM=
X-Gm-Gg: AeBDievNURYrjYV/yXks6ExoIMyOWh4R8qi0P3wTLIafT3W6Uh3RbsJrzXC074t5cd9
	Q+NJGlte8kP3qC1UTqPt3edTS/j634CbbZ1VrBCP/bXikshx0Ty9vLoEgZGf4EDMbT5+6Te6prP
	2il1Nc4hKTE8JaaBLkJoVPLksy70m56xAgnABeJH7syDit3IH6DmVsK7w1Q1zEBacNDOnrRLm5j
	Xt3/iNasxhSNT9c/cnGVTSgIbIihAMqqHLlNFlGHK5ldY9WBtH0GEBCTT+BIvai8Zin94vKFonJ
	y4tG1ACwch5DRUYAhfVO2sGPkPF++Bo6GQ1MyaNkohn1CmZplWGVWmggrPAK+GdiIp0w08gdItZ
	4Gfi/L/UpV2sPDFkuj7XTS+1mfTYvfkleCd1hl9e34dOD4kwQXDrGqj+qBAuhZHZ2t7CDTMBMSn
	5OYHMH0SmbNw76TQ==
X-Received: by 2002:a05:6122:889a:b0:56d:a70d:7f06 with SMTP id 71dfb90a1353d-5755b0b591amr1001731e0c.0.1778158411011;
        Thu, 07 May 2026 05:53:31 -0700 (PDT)
X-Received: by 2002:a05:6122:889a:b0:56d:a70d:7f06 with SMTP id 71dfb90a1353d-5755b0b591amr1001695e0c.0.1778158405772;
        Thu, 07 May 2026 05:53:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc8351448a8sm78652466b.50.2026.05.07.05.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:53:24 -0700 (PDT)
Message-ID: <cf71a13b-dd6d-4234-89f0-42eb6ea117fc@oss.qualcomm.com>
Date: Thu, 7 May 2026 14:53:22 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: host: xhci: Allow non-Intel usb_link_tunnel_mode
 reporting
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
References: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-1-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505121404.GG6785@black.igk.intel.com>
 <02b4a4ca-c091-47b0-bae7-e38d9fa77850@oss.qualcomm.com>
 <803cc760-93f3-429e-bae3-669f86c07585@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <803cc760-93f3-429e-bae3-669f86c07585@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KLpPetVoy7CUsfWUNLEUMufyTonxzTBp
X-Authority-Analysis: v=2.4 cv=SJVykuvH c=1 sm=1 tr=0 ts=69fc8b4c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mBNud2aGWxlEBhP68noA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: KLpPetVoy7CUsfWUNLEUMufyTonxzTBp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEyOCBTYWx0ZWRfX6hb0TYlDd7MS
 29Y7k4Bmjc1ilVV8rS/k/ZNRQ1qyy3OAmmrJEEuU8Bx0XWKkSUyW/nKXhSakowRQi5g9SDb5Q6w
 aDdZhRm7eeypW86sWoUabCtfudtLrMgHXKQwBqQKSL75Qdt382KxYeglidhbwn4ncTSizZMkK0c
 i+rQKuHSjhfEVi0sbObTXHMUv19mSNyPoRNzfO+BEn7OUDKVVvEder26Eymjioqk+5el5g11CHN
 I0G3Fxf4AJ//uyq/ozcHDc9lnMvSngqRclBnisA89OMxYeXdAUcsof7gWmbp+Q8kfWZbSbciVo7
 U1tcm0Gy5cBUQ2DxdJXHF5OQA0HpsDALzTz1/pAMXJvkxw2aN54vjuN79PD2xGEP+kIVuly+YQs
 qAH7wve6sNYbNHZudo+lDb0XLzPUMbEqSJAZg+oj6M8qKDuI/DD58qzcdbDCfNgOwriaFdnt17G
 fmMLp5OKnQhsqDFdF7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070128
X-Rspamd-Queue-Id: A3A104E8904
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37083-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 2:48 PM, Mathias Nyman wrote:
> On 5/7/26 13:40, Konrad Dybcio wrote:
>> On 5/5/26 2:14 PM, Mika Westerberg wrote:
>>> Hi,
>>>
>>> On Tue, May 05, 2026 at 10:55:04AM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> The Thunderbolt framework relies on the USB core to create device links
>>>> for tunneled ports, so that the USB3 controller is only kept
>>>> runtime-resumed for the duration of the tunneling.
>>>>
>>>> Currently, retrieving that information is only possibe on Intel XHCI
>>>> hosts, through a vendor-specific capability. Extend xhci-plat to allow
>>>> plumbing a custom one.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>   drivers/usb/host/xhci-hub.c  | 4 ++--
>>>>   drivers/usb/host/xhci-plat.c | 2 ++
>>>>   drivers/usb/host/xhci-plat.h | 1 +
>>>>   drivers/usb/host/xhci.c      | 6 +++++-
>>>>   drivers/usb/host/xhci.h      | 5 ++++-
>>>>   5 files changed, 14 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
>>>> index bacd0ddd0d09..09e5da912066 100644
>>>> --- a/drivers/usb/host/xhci-hub.c
>>>> +++ b/drivers/usb/host/xhci-hub.c
>>>> @@ -750,7 +750,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
>>>>   }
>>>>     /**
>>>> - * xhci_port_is_tunneled() - Check if USB3 connection is tunneled over USB4
>>>> + * xhci_port_tunnel_mode() - Check if USB3 connection is tunneled over USB4
>>>>    * @xhci: xhci host controller
>>>>    * @port: USB3 port to be checked.
>>>>    *
>>>> @@ -764,7 +764,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
>>>>    * detecting USB3 over USB4 tunnels. USB_LINK_NATIVE or USB_LINK_TUNNELED
>>>>    * otherwise.
>>>>    */
>>>> -enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
>>>> +enum usb_link_tunnel_mode xhci_port_tunnel_mode(struct xhci_hcd *xhci,
>>>>                           struct xhci_port *port)
>>>
>>> I'm wondering if this could be:
>>>
>>> bool xhci_port_is_tunneled()
>>>
>>> becase if I understand correctly that's the only information we need e.g is
>>> it going over tunnel or not.
>>
>> It was originally introduced as a tristate enum in:
>>
>> f46a6e165197 ("usb: Add tunnel_mode parameter to usb device structure")
>>
>> but the usefulness of USB_LINK_UNKNOWN is limited to a dev_dbg() print..
>> I don't really have strong opinions either way
>>
> 
> Tunnel detection can be tried other ways if state is USB_LINK_UNKNOWN.
> 
> For example usb-acpi.c will try to create a tunnel if all the ACPI entries exists
> that indicate a tunnel, but the current xHC doesn't support tunnel detection.

Fair, I didn't consider that!

Konrad


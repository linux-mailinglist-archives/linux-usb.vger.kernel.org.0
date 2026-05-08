Return-Path: <linux-usb+bounces-37125-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIO1IrXS/Wm+jgAAu9opvQ
	(envelope-from <linux-usb+bounces-37125-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 14:10:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8364F6257
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 14:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16B6A30BB5F2
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 12:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2BD3DBD4F;
	Fri,  8 May 2026 12:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDMdW9tn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0WDce1Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C9E3890E2
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 12:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778241870; cv=none; b=Ssboa0J+sxOtfCLyZKoX1VVfPOJOfVx6+p+jcNvHAQjJxKxFg9oMQ90c9lGafnTyb58gs4cNxl8USR7oKs5JrFgLXaM8uyPAH/fHSPijZUtiFGYcKDpo3X85LuRfOmIXiK+9Zc2S6IhXzV54FOLzBGRKM8He4Ez0LJLC0I9YxKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778241870; c=relaxed/simple;
	bh=0g4NJxQGXGMaefugzTjjA0k2/gaIz+wuNaa+sxpZnKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdV+xbyUHoRQnH+Jy40pZW3ygOtByCeuHZrOd8wsIRlOUjQxCOXjBYJPImh92HDbEdEpvRRvr6NBmi6F1Ok1RUpsCsYgt4q76geso6vVK1d0Kw1PjmgWIuwD3AhIRXxqt0cWB00KUXUczj7sxEkSMjYMLB61ovI+YxBeazeWCjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDMdW9tn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0WDce1Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486K6rm1174056
	for <linux-usb@vger.kernel.org>; Fri, 8 May 2026 12:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f6s6oEYhzyzSFl+hoWkU/6LYWLTz8fzwGJHiu18Sdd8=; b=PDMdW9tnHtvg0bSR
	jlV47S98g4yql1scfZkrlWd17p1LSTQ/0OVLAOCr/2uBohB7bVWUhKq8wP8LSstP
	t4VLb3PcH2FkjxuOAlH3D2oFgZsu88BZOHHIudYZVSzcF9qPVXJRueGZ2ZMzY0kX
	N6gPjbfyalk9k0oEgCGXjvWMgWFExTI5hhD7sGnGIxbj+WXvLfXaAKVv7KskRQ7W
	MpW5sToNcznzJErDhLb+/AEP7isKsTsr29XaSKyXgazpk3m4cqQq8qRMTtXVnOk0
	bwNB84je2YSIYy4msJ7n4fcexzlM6RkLPgURPt+Nc4DAPRhVp4kdNUxoeV6sk8+X
	8gFm8A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132hasev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 12:04:28 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f777e3856so196942e0c.3
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 05:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778241867; x=1778846667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f6s6oEYhzyzSFl+hoWkU/6LYWLTz8fzwGJHiu18Sdd8=;
        b=i0WDce1YCcaUeTZde8Gil2fIo0yHjAp3t/TrhDBtkOxtbn4fjFXE3s/Pn88VVgGnTS
         D5TV74lv/IeiNVOkaWWK8RJK0998nPvvk22L+/HhKs/Eqx/LKRTvAHDe/Z/zWkZfUnEH
         ZuemoYJE7o4AqgTuXGdfUzDkIuCLmwm7v0uuScYfkA5D959FcSLGByule6VYcOPaPtPu
         FTpN/R9r7Dsu9pqEr4VLS0Xm+OwM64frrlosldPHOOtIKcAWsLVIujef1IdhQ6ZbX9gN
         1Z5LD8A0zaDa5BXF8jCGGDzp8FIBEEo3ukp/NAxnL7zE9gkqRPRk/Ac3Smeg1odZSRiO
         2EHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778241867; x=1778846667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6s6oEYhzyzSFl+hoWkU/6LYWLTz8fzwGJHiu18Sdd8=;
        b=GgboA1cnXu+NnnFOJE06XxXn2mwiXPbsfTC3kXDKC12mgo48WqM1YuGdpaJsFtxHjG
         9HVille5Ep0k4Ynw3zvKUcZ8U25pz4uKxnVJX9j58ihh+JuLlZArcm2tiytpJ9TP+/N9
         ZQcmRl3e077EeT22OFY+yegYpx1ikVdT+5KHaQQDrfHNd+CIFKvFtq4mFbANcEBbOSTE
         DI1pyUVYWxMXP0UlLGNx9nABpVETk442DKyqOAxf8n69RazP4ELHcsnSMs/TGEMK+jUK
         Ir0tFf64YcyxgL1Za3T2Wc51Jlmt4QLyz8enrPVSCCFi7URMwIl2xwhv9kjLU8Mjh5jT
         u6Aw==
X-Forwarded-Encrypted: i=1; AFNElJ8Vi5i5d3cWlhjnYpCRd4ThhDdDdXsVC+9TMDA8gabsv7vvc0+BDdBLgazSDSDVznC/KRWKnQkBh+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt4vPYJg54tK0abOm0/VTf1EBL5umAsSSvEabYVo4hIa3jLCwp
	sdxZndcMg9GZsZcGtmskJ8HkmO1+kt4hTK5SkVqSYaTNRnS4nGbX/Xa96BRUEv9tLx4UcqSFzqg
	PBCecI9apfctyrNYXQy0AVyDuTKNvrJQWkNLsTklM+QRPJo/1SYiRCZL6grQqwLe2L8Fs9wE=
X-Gm-Gg: Acq92OGkSpK8Ahrd9UEnHT1oTUI7vsCpRrPB//Mj5wlCd6RlbdD9WNbQJoeycBSLwjp
	PrgO+d2b6FBJJcMpVNc1gHc710QMOuNd9gV+ItHduoHPYTWxZaaL57S9ah00T6cAbN8MJtQX4Tw
	aX24wMUnckDYIVUoY4z+j3hqVlC5xnbErcknErPtNzPoRRaxKGPZw5eTBw1uZdbmq9R7Czr/uyb
	8A8+LehH37K+2Z65plXWDdehQv8B03ZgUa/OtV/yXvytCfuN+H8v5nNh6shS16EnDjTyfe1qahj
	dGkkRCGeYKJhbZIjkSOo9BSsrefa+fOzcsEmmW+fAIKCGY8dnWRNLObVockgwZezLLT86rdWO+z
	GKHB28hQEACXN7lXd70kCOT3qKcNWO/yzn5hSg2l9MZQViSJacRiHMT2mFIEsg4N4asuO8FJcgD
	bIyDE=
X-Received: by 2002:a05:6122:c215:b0:56f:7eee:1914 with SMTP id 71dfb90a1353d-57559508f4dmr2334584e0c.1.1778241867382;
        Fri, 08 May 2026 05:04:27 -0700 (PDT)
X-Received: by 2002:a05:6122:c215:b0:56f:7eee:1914 with SMTP id 71dfb90a1353d-57559508f4dmr2334562e0c.1.1778241866798;
        Fri, 08 May 2026 05:04:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4849dfcsm75613566b.58.2026.05.08.05.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 05:04:25 -0700 (PDT)
Message-ID: <670f9a9f-54b9-4109-986e-5071caf1dcaf@oss.qualcomm.com>
Date: Fri, 8 May 2026 14:04:23 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: dwc3: Notify XHCI core of tunneled status
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-2-4aaa6c3c14cb@oss.qualcomm.com>
 <afpyvhadqZw0xfTB@vbox>
 <1163a026-03b2-4860-a422-eb276920b4aa@oss.qualcomm.com>
 <afzP+uoUALSji95Q@hu-jackp-lv.qualcomm.com> <af0SM3C5qHc73DM8@vbox>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <af0SM3C5qHc73DM8@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyNSBTYWx0ZWRfXx9rZfPNiZRID
 1BmhxbRn3hy4E/95gkKdtb2JZJ6Gqu/YFsfK+22AkDcXdAuJxejmtW21Vhb/O1kZTE9/43pVSre
 c/XV9Ae9c0XxOJJKkR4C/cvSLmJoiNwViitjDP7+pWuJhYyCoITYvtA8iQumV1zeMwS94JXLWtn
 ngevfY2R8ZeaOyEp5Wd8d/+Rxbk/9gN1w37+1hqrGBH6VkqQNftF9W2Kd+V6Y/mu4Rcm31qaEFD
 Cj22NA/oW3FhdeNbOlC0VEnUL0l5sJfmKHDNlGZL/2JO1m3QHmVUgU3YodYxoQcUKZTWAKe2hZV
 pYUSAfA4LLVwKlS7AB68gL/JY7t+fEZ2glcTmkWYXs8bXP6VkDWIjQeP205AVPl2cXqFLelAgyn
 ZsJAForeowUszFRTM0C7YfMPv13Wi38KwYZkN3mvCQ26CEYEa2NfC+obEPfRKE3Oc0MkXLz+y5N
 A/LibRUQX0PZ0/KjAGA==
X-Proofpoint-ORIG-GUID: cf0O8kID4LVs1Mm5gIpqmjAgVZOunR3u
X-Proofpoint-GUID: cf0O8kID4LVs1Mm5gIpqmjAgVZOunR3u
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fdd14c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2Dhs2t0eLDWaZkzIpxgA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080125
X-Rspamd-Queue-Id: DB8364F6257
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37125-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 12:46 AM, Thinh Nguyen wrote:
> On Thu, May 07, 2026, Jack Pham wrote:
>> On Thu, May 07, 2026 at 12:34:50PM +0200, Konrad Dybcio wrote:
>>> On 5/7/26 1:40 AM, Thinh Nguyen wrote:
>>>> On Tue, May 05, 2026, Konrad Dybcio wrote:
>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>
>>>>> The Thunderbolt framework relies on the USB core to create device links
>>>>> for tunneled ports, so that the USB3 controller is only kept
>>>>> runtime-resumed for the duration of the tunneling. This depends on
>>>>> first knowing whether a connection is tunneled or native.
>>>>>
>>>>> Add the logic to handle that for DWC3 controllers.
>>>>>
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/usb/dwc3/core.c | 12 ++++++++++++
>>>>>  drivers/usb/dwc3/core.h | 18 ++++++++++++++++++
>>>>>  drivers/usb/dwc3/host.c | 12 ++++++++++++
>>>>>  3 files changed, 42 insertions(+)
>>>>>
>>>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>>>> index 65213896de99..7cec4911e278 100644
>>>>> --- a/drivers/usb/dwc3/core.c
>>>>> +++ b/drivers/usb/dwc3/core.c
>>>>> @@ -162,6 +162,18 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
>>>>>  }
>>>>>  EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
>>>>>  
>>>>> +enum usb_link_tunnel_mode dwc3_link_tunnel_mode(struct dwc3 *dwc, u8 port)
>>>>> +{
>>>>> +	/* Prior versions had no CIO support */
>>>>> +	if (!DWC3_VER_IS_WITHIN(DWC31, 191A, ANY))
>>>>> +		return USB_LINK_NATIVE;
>>>>> +
>>>>> +	if (dwc3_readl(dwc, DWC3_CIOCTRL(port)) & DWC3_CIOCTRL_CIO_EN)
>>>>
>>>> The CIO register block only exists if DWC1_USB31_EN_CIO is set (and
>>>> DWC_USB31_EN_USB2_ONLY is not set). In most cases, this register block
>>>> will be reserved, register read of reserved block should be 0. But we
>>>> can't guarantee that it will always be the case.
>>>
>>> That's inconvenient because..
>>>
>>> [...]
>>>
>>>> We shouldn't need to be doing this. This should be checked from the
>>>> xHCI driver. Check xHCI spec for PORTSC.TM and USB3 tunneling support
>>>> capability (section 7.11).
>>>
>>> ..I'm seeing only caps 0/1/2 (and 10 on some but not all) advertised
>>> (I ran a for-loop checking offsets 0..=255)
>>
>> Right.  That section in xHCI spec was only added in the 1.2b revision.
>> However the DWC31 IP versions that current Qualcomm USB4-capable SoCs
>> are using are 2.00a (and a customized version of 1.91a) which are only
>> compliant to xHCI 1.1 so this capability is not there, even though the
>> CIO register block exists.  So short of having the proper XHCI bit, this
>> is the next best, non-SoC specific alternative we've found that can
>> allow XHCI driver to identify when it is operating in tunnel mode.
>>
> 
> I see. If you're using 2.00a, then we can't use the xHCI's capability
> register and PORTSC.TM.
> 
> Can we match the compatible string to check for CIO capability and have
> this passed from your glue driver before accessing the CIO registers?

Hm, we currently use a shared compatible string for the USB3+4 (1.91a-xxx)
and USB2 (3.30a) hosts on the USB4-capable platforms..

Another idea would be to bail out if

!device_property_present(dev, "usb4-host-interface")

which would place the burden of making sure the DT makes sense on the
programmer (which is OK in my view)

Konrad


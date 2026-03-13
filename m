Return-Path: <linux-usb+bounces-34747-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCelGYIItGlvfwAAu9opvQ
	(envelope-from <linux-usb+bounces-34747-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 13:52:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAC32833F7
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 13:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D858327971B
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 12:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089DA38C2AB;
	Fri, 13 Mar 2026 12:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/gLbCA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QkKuNIPd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBFE372688
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773406263; cv=none; b=KAZWvkkwuRlwRTm8TsCfdPGxQ42JOHLkebto9+xjG2ys/cP1FVU7JCZ66KxgAI77NDdnxRHp6Sawrpv3sVLgBhN6ErzwYPCrYzEQMDjz4WKgNWaaEC9Q2nDl3ej3EypCCXrBXIQASyPr4DsPJXQJM+APUAUg1GSScJC8AAbngqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773406263; c=relaxed/simple;
	bh=J4wE2j1C0CwU+m4AqTI0TdWUyiuleTehv9zfq7Vqhik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTc+s95bws8u9LD6DYY5UL0EIIxpPaxwoUpZJaBBaqOd9dSqXSNzlNbMe8WyS33ocKgOH20tcjFbVCBw6/oMO0LWiQ+X2Ce8ebkbBomRGwVHzrS7kowHZFkxPAG9y0YaMwIxV4488yy55qA1yGtfNIRY7yyFwCs+JIAGRiSNsyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/gLbCA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QkKuNIPd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9TiHV1498953
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 12:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ct7QKCp/uLCcjZDRaN9aoF62KlQpTeXlak+8t4E5ZA8=; b=i/gLbCA++CKO2lzR
	jX4IbvFY0pApLF6DT8BPCKKW+EB3llBskjv+nQyrc2JsdhyuqHEAsQiBmV3WwMcH
	cHu6jvH0hCBhsniPP+U+mxgT8l5E/+tRhDzqjC+56osFonBovLRhWYK6NgC3IbHR
	alSR94mhHnFf9ZY7cBfZuGqrSSIhgVULch78ha1gbpR5emtSyZjDz3nAyHa1ONXx
	HiX/27x7RxXOgakJCq8nV5/zyfLsro3UcL5N0mcikauE68Y8r0NpYp6P+QHeNKQ/
	P3iIn+nGHm+Tmt6sulVJ66oti1WixlOM1mAr0BIQlQ32w2flW71At2jB/VgvQBbP
	def2NA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hgkqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 12:51:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899f6011df3so15286776d6.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 05:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773406260; x=1774011060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ct7QKCp/uLCcjZDRaN9aoF62KlQpTeXlak+8t4E5ZA8=;
        b=QkKuNIPdo1phwvMT1UAEBeCbVEzGmfYftbdjhk+g2ssg3jE36tF90y5PdZI6yhsLcQ
         x4hrDHz1OOneGEW2Xa1+d0QDlQYW8ocwaCCRYr+ttX73iSEUfz9234XcHSbKQL8EGW9R
         zm7YpQ9+BAl9eGHRfKncfzAivqVhqsB0QcZ+Z3kZ+4elYrJPujCs1eH6NTut7CLtLKzy
         NRgYovQ4sAHtZ07TbWBN3mYtFZLB41EXvBlVJIzB/E6EJLvQDIbXfrG4y4TiyEzMSe9z
         r21CY3zJSJIURiCQnIJW85NvrhB9tqLN+XBFhaIK+CG+O7pIyaghEI8wL1Sf6StjXsWD
         KUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773406260; x=1774011060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ct7QKCp/uLCcjZDRaN9aoF62KlQpTeXlak+8t4E5ZA8=;
        b=rUhpN7f844nmvEacKg5ylCBc9GhGb0mcTYbahLXMwO950IfhD48FeU0ho8q+u9EQoH
         AqwmZ+CP7e9YpDUCQUqlYgMM66KSSbzNTQMmp4Cist6nv6b3p15Wlwfrv+8B4S2R/5YN
         4PkqPt1ZLsjytK05ZJmJDyR1Wc459Omf4FYys6z9TbZ6MCPjy7XbpaZRj+9Iukh7QUWg
         fr128EOHwJ8Prj+mtbQq37OnWi1c+FxrNJ86SNab4hSfpvQNpenevtuFwjQULxUAimTK
         IGJrXAVHV2EgaiqfCAuDhDa6LN33oAMzFrX46pwG501gcXSQf2utAd4Gr5gSCQJVsnCe
         BkUg==
X-Forwarded-Encrypted: i=1; AJvYcCUN4nDNCQ6lWXJ28QwKkNT9l+ZifNS91fAEu8O/m6fKcToaB5PalcepAS/yZSXmwT9p4U2iYJRBLTk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+28Ukh27YSfECJmKESv3KS7Uz+fvvpdRd4BXSnvLAwFrtuoqc
	GcIwN1K8UKz0ISz2DjP7lpSn1FAXg0PCNtaABRbTBC5e/2K+YTT+3QSvEUBwtFxFivjBofjt/hL
	1Bo5VixbzQtrrZcp8M6/2c376kWikAhywclSBttQjeQOm5SElN1quH6YXuDXJfbyrcEZCnBY=
X-Gm-Gg: ATEYQzx5X/+FEyyOI+KS7WD2tecjU0tlOqj1T2ol+JEvTdMO3rvf5wqtxbIPSaqqy8S
	KCZWzmzYGtdEEj02FoLUFQYsgycmaPvN6Pw0cGgDZkXYO5iqP90AAB6PLL/cyqYO2KRZvUpYp31
	VWcw3/asCFxDm9sy8f7wiRY1VkuHPZXoOXtmL2QYwEEKa27zvHPSVxH8QA14KdPLJC/KMi1nlr9
	WjiTClXxjzBJ7sl37sFLSz3jxOoaPIsOqFZCqHrzWHqMVhQCpIWRtI9ntv91Epg4stfqvrYAzb7
	YgZaDC9h2DI3u6tXg3YFu5Dy+W1HtTpFVZ8/KgfCNRzUN1mbGSGgiBFQ6nx0AsthSJWumYhhPrE
	OtKjtL+yx60XY9V75/0Jm3Zj+vPwdIjHVlsyu9hv71NTHn3ZQQ7zD+r7iiBp11uYVgkwIvQ+Kyf
	RuzDg=
X-Received: by 2002:ac8:58c3:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-50957ca0451mr33656821cf.2.1773406260506;
        Fri, 13 Mar 2026 05:51:00 -0700 (PDT)
X-Received: by 2002:ac8:58c3:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-50957ca0451mr33656551cf.2.1773406260086;
        Fri, 13 Mar 2026 05:51:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156373888sm1487485e87.86.2026.03.13.05.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:50:58 -0700 (PDT)
Message-ID: <9c6d140c-bcdb-4f9b-8419-aac35ea27584@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:50:55 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 02/10] usb: misc: qcom_eud: add sysfs attribute for
 port selection
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
 <20260309203337.803986-3-elson.serrao@oss.qualcomm.com>
 <2026031101-cornstalk-partner-a30e@gregkh>
 <6fe7a63c-a1b3-430b-a128-0e38754d6393@oss.qualcomm.com>
 <2026031327-sugar-disfigure-8034@gregkh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2026031327-sugar-disfigure-8034@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b40835 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XanBRYeQAFQoPGH1A-sA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: CYUZtALsOHhfFkZXNZEFqedzMpemk2Kn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwMiBTYWx0ZWRfXx136vhzrpMLm
 9D3gji2DaZIQLNjE/hv5UErJmAI2YsN82jV2BRfYU6xVNv4wl3S+n80Ib8TkbtovXrnemZoE87W
 Dem5Cd+qniRnl/ZlOtthSq3sEcfJA4TrR2uMR4eEMbnDjNDabDwkD7buxuj1S0GD9g1J03bJhvJ
 5DF/ZnHoMAppjZZAJVcGagL95igNpN1lI1e+nQsQLEpVBd6YM1vmJzoyPvtsJntjQP15VU2dk89
 cYtKjjdJNtKdmoshc0pB7oNiMtz6ccviy0vEJd2Eq4Tc8zTCMMb4hdlXzHH1I+dlZuqJQmTSN0u
 2bfpF6KArNF9kqfaEnTVjoZxtLQdwmNzSjLPGYqdxMef4j2BWrgvBw7lso9k+qIDrpEqGqLQOWw
 wjew8utVk5H3ZxTsPjorarTGREvvY1zYLJZy8ocqmPBkaOeAzCvA+FKwJgbExA89sIY80gXc6JI
 57FL8RZ1JzRvZGV6odA==
X-Proofpoint-GUID: CYUZtALsOHhfFkZXNZEFqedzMpemk2Kn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34747-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BDAC32833F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 1:45 PM, Greg Kroah-Hartman wrote:
> On Fri, Mar 13, 2026 at 01:10:10PM +0100, Konrad Dybcio wrote:
>> On 3/11/26 2:16 PM, Greg Kroah-Hartman wrote:
>>> On Mon, Mar 09, 2026 at 01:33:29PM -0700, Elson Serrao wrote:
>>>> EUD can be mapped to either the primary USB port or the secondary USB port
>>>> depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
>>>> attribute to allow userspace to select which port EUD should operate on
>>>> and update the ABI documentation. This is needed for systems with dual
>>>> USB ports where EUD needs to be accessible on either port depending on the
>>>> system configuration and use case.
>>>>
>>>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>>>> ---
>>>>  Documentation/ABI/testing/sysfs-driver-eud | 16 ++++++++
>>>>  drivers/usb/misc/qcom_eud.c                | 43 ++++++++++++++++++++++
>>>>  2 files changed, 59 insertions(+)
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
>>>> index 2bab0db2d2f0..67223f73ee60 100644
>>>> --- a/Documentation/ABI/testing/sysfs-driver-eud
>>>> +++ b/Documentation/ABI/testing/sysfs-driver-eud
>>>> @@ -7,3 +7,19 @@ Description:
>>>>  		EUD based on a 1 or a 0 value. By enabling EUD,
>>>>  		the user is able to activate the mini-usb hub of
>>>>  		EUD for debug and trace capabilities.
>>>> +
>>>> +What:		/sys/bus/platform/drivers/qcom_eud/.../port
>>>> +Date:		January 2026
>>>> +Contact:	Elson Serrao <elson.serrao@oss.qualcomm.com>
>>>> +Description:
>>>> +		Selects which USB port the Embedded USB Debugger (EUD)
>>>> +		is mapped to on platforms providing multiple High-Speed
>>>> +		USB ports.
>>>> +
>>>> +		Valid values:
>>>> +		  0 - Primary USB port
>>>> +		  1 - Secondary USB port
>>>
>>> Why not use "primary" and "secondary" as values instead?  That makes
>>> this much simpler to understand.
>>
>> It's not inconceivable that future iterations of this hardware will let
>> one mux between more than two USB PHYs/ports (there are already a multitude
>> of SoCs where we have 4 or more USB controllers and >= that ports)
> 
> Great, and how will that be defined?  As a number?  Name?  Something
> else?

Perhaps it makes more sense to me, since if I look at the other
computer, the controllers are named USB0, USB1 and so on.. We follow
this naming in DT too, so it felt natural

How they end up mapping to physical connectors is of course up to the
implementer.

Ultimately, I don't mind either

Konrad


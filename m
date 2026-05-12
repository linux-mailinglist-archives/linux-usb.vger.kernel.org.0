Return-Path: <linux-usb+bounces-37320-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMJ7NHUVA2oj0QEAu9opvQ
	(envelope-from <linux-usb+bounces-37320-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 13:56:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0BF51FA16
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 13:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB45D30078B7
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 11:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D8839B95D;
	Tue, 12 May 2026 11:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUBmUFiu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXhSWYVm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8743386C1E
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778586995; cv=none; b=eVz0YtXoFxuLyPDcE/k5YMJSH36N7pZ6e2i2/TRf1lc9RgBiAxE8XrlPQ/gyhfCWWJaWdoLr0fTBMyliJomCX7Rr//YUMWCJeLAlEw3dVTN4w2MT2cyUBiG6lCoC8fgQxiQ6519QkY5zAOzX/EBAiGusZYHwkOY9YWsEiVevffk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778586995; c=relaxed/simple;
	bh=YUm+8Ltzx4T5rRAEzHyIUXAriuHfWbmH8YnFq4niC8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGWCIIyrtFpzfgQ4NMAkB/riTUwD7BArsHbyxPlNNE349QdIJtdtMajJAt9hA8hMKLufJFCQ171BgMfLgyslknfWTrns+djTl7mdspT14JsESCoqtYU2+QicbGRjSZRwMLayz8sQzzvCXgbq6fa9eztdplPgvTUPUuRShrIgQiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUBmUFiu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXhSWYVm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAio6g3444973
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 11:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZKQTQlLcAWrPsvBtOqwQggdl3TwhBx8B4atslVrTjD0=; b=mUBmUFiuZGZT4Ld6
	wsgWjiJ21vDB4leMlm/TTJ5Gq02yU2blYqj7mZ9Aq8dXFfGwbzt9MrCBdYW2paAB
	mR6/CZ2jm0fcVv1gxvXjX9Id6wbtik7/85hLfcST2RfuvHjKNcPiCgXMNsDpRuRG
	HHr5fQHhHfGX1Iv0NL+nUmy8VnMawGy6dnE3PiaKZt65n8zlZ7yTZs+VdNt2ouPv
	Rc/IyqvcnHjEcm+gL0gOsoqcmRtZhmRrRXYw4KaJ3Evd3b9xGTH7OaRZpLZOrS5L
	3Yuyx+3Ffb4fm7hMQkolRVvyU6hc9WBNzvUcW/HRRZxSM9oiv9cHh8vRW3V9Q4rj
	Ah7Nhg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0k3bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 11:56:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e429ba4dfso12820661cf.3
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 04:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778586992; x=1779191792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZKQTQlLcAWrPsvBtOqwQggdl3TwhBx8B4atslVrTjD0=;
        b=RXhSWYVmRR4v1PL0K0QzWiJphELDe3lgJm282t9wXvLR1SL4borS3OfBKPu6Eq9U5c
         Ofzg4sbF8c2UgLfu5vIq4oIbIj+6URIyQ9rbqpkT6JrAShVPtNVf5ZcbdHn7kbMC2W1K
         HkvKypcscxYs0YjpfjcM22O29b4D4/IXzZNXKsaHCxrGzAFnrlC/L2pvGQTRuUzK6Pxv
         IgObdK8BTqKWgS1RU6cARxvD7by0/LswhhArDS8A9TPtAZeQxd4TCylWIlteZlWN6A2x
         NuSWPvW1Jc4EijMpdAqzSJnaGSJ/LAGxuu8IxMGq5gSTxr7vPWKEb/ekWxeAhLtSJ5zo
         5jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778586992; x=1779191792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKQTQlLcAWrPsvBtOqwQggdl3TwhBx8B4atslVrTjD0=;
        b=Un0YXzB3AFIJXJtmRw7cyKLt7Jj81A1FK3D2MpVL3vQR2paYNOruQ4cGxjqktacZrN
         3obNz0+Dl56LeSlSCl8tzxOrWwMtpndxPvcA3C4KXHNqPqd3Yni/c5KGKiUON0pg3Qye
         wYqLG4PUDCaqaCYYbohrG8u5pGWpaMwnxPmCVoVIAEkJ3b7asUHC+FyhjJiF+mMbSaLg
         RRiTBcAsAnu/0pA6PjSf+lqvvx6Q4cqNItlihs9aqOrF4M86IZ45yjdEZBFEnyQHPY3X
         ufCrtIoM8wg+bsMSRnBZfmU2Jh3WavWS2WA06Zl8KhxmrfqiyfLYvmhV8FwuQ6e0TbBx
         FH+g==
X-Forwarded-Encrypted: i=1; AFNElJ9YIvhrrKPP5S/VfmK55qzZRfRZezqIcCdFESxzGwi86XQiL1OoEiCSb40i4xUSDOHJKPFIzuuvwKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFLqFFKmMJdEbiSqPyCgsp+4/REFuwnOIdu+D8opgdxAXy45KZ
	7SukGorRm+BhgUF4O/P+plZdNoW1AeyUfcL3owQD32EpBa/MEHldKI462lwle0XzarnurChQ1/p
	xoGLCtQtFoq+bJYuQ9AszR4/WldBQkH4LQpDNFyReJBwLzu2mHY9UjQeltIlZGk8=
X-Gm-Gg: Acq92OFHVidwnvqByWt7gKxItS4rGqKOO76+QUL5voDO8uqp/4V/bxAdb3EzOvLLcB8
	eo8buKMZOH0wO1Jfs2SVeYmy4vBBsmistwmEOCfEoWeM5VIfri6/hIf8Zmk86o6SyJYry38OEql
	lz0U990LqokWuRaVMZL3wPegckpLM57wis5Ps9M1XPIBFvNCr9YN6zXEFHUeEdnP766nw3iFrkR
	FuIXDnm4RAYW1cF0hO/vKIjFB7OrHSYu2bXEIEAtPRu2m7YpATavgvU0/85YPZt2io8M34huvBU
	H1i32sf8TN8gWdzAFe599tg4ni3JNGRVxLtCSaLzGtmGwQVuvASJcLUEKn/XC0zbCeCWOO4BeXe
	dH4bzouKCiU92D9U2Ob1GzN3NeEUTtzsJka64+FxO+llWIzJWqR1HEpr024W3cHASwxQx/Glw73
	zn/AA=
X-Received: by 2002:ac8:5748:0:b0:50f:af89:ff33 with SMTP id d75a77b69052e-514628cad42mr278166261cf.7.1778586991753;
        Tue, 12 May 2026 04:56:31 -0700 (PDT)
X-Received: by 2002:ac8:5748:0:b0:50f:af89:ff33 with SMTP id d75a77b69052e-514628cad42mr278165991cf.7.1778586991063;
        Tue, 12 May 2026 04:56:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e0d455sm5044924a12.21.2026.05.12.04.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 04:56:30 -0700 (PDT)
Message-ID: <9d8092f2-d04d-4c53-a0da-6da272d3b447@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:56:26 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: dwc3: Notify XHCI core of tunneled status
To: Sven Peter <sven@kernel.org>
Cc: Jack Pham <jack.pham@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
References: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-2-4aaa6c3c14cb@oss.qualcomm.com>
 <afpyvhadqZw0xfTB@vbox>
 <1163a026-03b2-4860-a422-eb276920b4aa@oss.qualcomm.com>
 <afzP+uoUALSji95Q@hu-jackp-lv.qualcomm.com> <af0SM3C5qHc73DM8@vbox>
 <670f9a9f-54b9-4109-986e-5071caf1dcaf@oss.qualcomm.com>
 <af5sfCOfBa7mYqPw@vbox>
 <0431f8ff-545b-4533-8bb3-d4f3d2e30032@oss.qualcomm.com>
 <551c246d-7ff6-49e5-bb14-3f49f7649e54@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <551c246d-7ff6-49e5-bb14-3f49f7649e54@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a031570 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zf3umgDPDV331GXpPwAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: h6HbssmGNNAA52HEKfKmbUQbMg7E5osR
X-Proofpoint-ORIG-GUID: h6HbssmGNNAA52HEKfKmbUQbMg7E5osR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfX0sy6tQdAG+gf
 MDap8CwLhJp77LTxjWB+qEkhNFLRHPoACO5aWinbuIIaKkkbgHY74FR+cjDyRb2V6sOANemmPkX
 P3uGX+G6dPAlQF62m1iqOup6lQ1s51JL0V/sxyJpE5HN1SN43gxdDg/ROO1GuiDwZCnr5uzePzh
 R3mhFx6TrV8JOzNezuMrAAWLyYBK5xVnoswS5/JUedEj0DA4IqrsZh2Nsjy/uGGyBaVIanRNDid
 Vs5xNDllC5NpKKmSL3LT/SWUJBKh7WIS9KexcgTwzHt5r3jcMI8poGyiXUJ0saBZTtCjoLVMKnr
 2kmdCQxfYVW2OWfm+Lj6F8pmlg7SBhvwGlZCbr37n7lBFifSoC8NK1oenMKtET64RhNbD3aneRG
 WUUal2QOy9MFgdqRcR7DRKH+jPSe6J0Vx1qe8RuldVYPe0RTZIYEnWUvBaYDxsu3GN0U/zeyClO
 4rbQflc0PVupgYlVpcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120124
X-Rspamd-Queue-Id: 6E0BF51FA16
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37320-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/11/26 8:44 PM, Sven Peter wrote:
> Hi,
> 
> On 11.05.26 11:06, Konrad Dybcio wrote:
>> On 5/9/26 1:31 AM, Thinh Nguyen wrote:
>>> On Fri, May 08, 2026, Konrad Dybcio wrote:
>>>> On 5/8/26 12:46 AM, Thinh Nguyen wrote:
>>>>> On Thu, May 07, 2026, Jack Pham wrote:
>>>>>> On Thu, May 07, 2026 at 12:34:50PM +0200, Konrad Dybcio wrote:
>>>>>>> On 5/7/26 1:40 AM, Thinh Nguyen wrote:
>>>>>>>> On Tue, May 05, 2026, Konrad Dybcio wrote:
>>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[...]

>> 4. drivers/phy/qualcomm/phy-qcom-qmp-combo.c reprograms the PHY based
>>     on typec_mux events in native cases, or to USB4/TBT mode if the router
>>     driver requests it [that last part is not yet upstream]
>> 5. [optionally] retimer drivers in between (most often Parade PS883x
>>     series via drivers/usb/typec/mux/ps883x.c), which act as an
>>     additional typec_mux/switch in the chain
>> 6. [not upstream yet] USB4 router driver consumes some typec_mux
>>     parameters (orientation, cable and partner capabilities) and sends a
>>     command to another MCU to high-speed link establishment. It also sets
>>     the aforementioned magic register.
> 
> I'm not sure if mux is the correct framework here. On Apple Silicon we also need an out-of-band notification from the PD controller to the USB4 NHI here but the NHI isn't a mux in the typec sense. And how do you ensure that 4 happens before 6 if you use the typec mux framework or does that not matter for your platform?

Some mux provider drivers (e.g. the PS883x one) call typec_mux_get/set()
explicitly, and combining that with the right of_graph things end up
working naturally (perhaps to some degree by luck?).

With the QMPPHY specifically, it already exposes a separate struct phy
for the USB3 sub-block and another one for DP. I added a third one for
USB4, which when activated, programs it into USB4 mode and de facto
blocks the driver from acting as a typec_mux (simply via an early return
from mux_set) for the duration of the USB4PHY being in use (the router
takes care of lane assignment and orientation, when active).

Making this predictable (and controllable from the router driver) was
paramount, as the device will crash if the router is attempted to be
brought online at the wrong time, since most of its clocks are derived
from the on-PHY PLL. Similarly, the suspend flows also require tight
control of the PHY's power state.


I ended up modeling the router as a mux&switch, since like I mentioned,
it needs a number of parameters that already come via these frameworks
(cable type/speed, orientation, etc.) and the drivers needs to talk to
the MCU immediately after the PHY and retimer are set up, so that only
made sense.

> Currently I use [1] and [2] in my work-in-progress tree though I'm not quite happy with it yet.

I took a look at your branch and predictably we faced some common
obstacles.. Although I'm jealous of RTKIT..

>> At a glance, 2. seems like a reasonably fitting place to set it, however:
>> * it does not have any sort of a handle to the typec_connector (it
>> only acts like a mux that sets another mux), and
>> * it may be going away in the future
>>
>> so I'd much prefer to keep this logic somewhere near where this iteration
>> of the patch does - I think it'll be useful for more implementations, as
>> I'd imagine it'd be fairly commonplace to hardwire CIOCTRL_CIO_EN and
>> another part of the pipeline that must logically be online for USB4 to
>> be useful
>>
>> +Sven, on ASi, is CIOCTRL_CIO_EN (dwc3base + (0xcd20 + ((port) * 0x30))
>> written to manually?
> 
> I don't think so, but we need a manual out-of-band notification to both PCIe, tunneled DisplayPort and USB3 once the tunnel has been brought upside the NHI (i.e. long after the typec altmode is entered) and all this has to be represented in the device tree as well.

The DP situation in our impl is.. colorful as well.
Generally I think we only need to reset the protocol adapters, which
happen to live within the router's address space, making it contained
within the TBT driver.

> DWC3 on Apple platforms is very cursed and has to be fully offline while the Type-C switches modes and must only be brought up then once the tunnel inside the NHI has already been established.

> My current WIP code uses a tbt_oob_notify for all that that I introduced and something like this in the dt to represent the connections:
> 
> /* USB4 */
> &usb4_1_acio {
>     ports {
>         #address-cells = <1>;
>         #size-cells = <0>;
> 
>         /* 1: USB4 port */
>         port@1 {
>             reg = <1>;
>             usb4_1_acio_tbt: endpoint {
>                 remote-endpoint = <&typec1_con_tbt>;
>             };
>         };
> 
>         /* 2: unused(?) USB4 port */

Any chance port2 is used for lane bonding?

>         /* 3: PCIe, TBD */
>         /* 4: USB3, TBD */
>         /* 5: DP0, TBD */
>         /* 6: DP1, TBD */
>     };
> };
> 
> Still not completely happy with that as well.
> Does PCIe tunneling also need additional OOB notifications for you?

No, simply enabling the path works, after which we get the normal hotplug
events

Konrad


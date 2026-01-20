Return-Path: <linux-usb+bounces-32556-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCbwI9kIcGlyUwAAu9opvQ
	(envelope-from <linux-usb+bounces-32556-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 23:59:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2284D625
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 23:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4D4056AEDEE
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 22:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BEBC33C1B7;
	Tue, 20 Jan 2026 22:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrsU96/g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EOa+OJwz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ED8392C3A
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 22:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768947385; cv=none; b=Y0X/KfZESbKDbq7bGKhCS2Gat9xnAakFanNUIIhCkUcPeoDXBpBUAQTBBM32MVt7azJacPr3xEx+KyfKHY2p6gKor1L6b+7zjSn+uENDug17MhsvIWW/84GLlmEAtaNoldnSymycqK0SGI1h1ZK/Ow99+qg9NLOhPMZU2WBR7yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768947385; c=relaxed/simple;
	bh=aIF2sq1G+SBDQ2SeQKoKfuTkG90GCyflJtqsoFKJ/Pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5owSXx+M+jqNUa+zXiPq2c59e9tt94qY9HMvxK3qfftDhQqSGR6GUNBm5ecxuS9UQW6rqyo/O3H/O2+MkWMX439mO3j6cKp/Z+SIoylDqLFOpqF67nTGsPFEPBvLhmUQJ9O8ghyi9vfCq8mXrEfMU+C0iFKHgMecvJVUQYGzlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrsU96/g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOa+OJwz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KL81DS877870
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 22:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	898n42PZbM7sQ/Hguy4+gqUdwRDFS04P1ZHCu2BuyGo=; b=RrsU96/gWhayivnM
	deUFLchEkp/oMi33gFSkMcPPBQNFuj1Mqb+fCywK86Drb25SkcfsxppkJ78OcDg/
	qUQsoJujFU7ikn2UrCahsehW8CBxIvtUUEeF/q5kuF8Cyh7ijgDGY+nrQgDFvofr
	Pr1D1gSFJ4Ac6NcV5WnwqbEJTW3bbwgOfgiRb2Vt00LlQCkqRuqPkP2LOkd/6i82
	xuKirjvA1DpRSbCELevPqPDLG5s7+RHDn68YGFJ+9GLEscvs1pbMWLoKWUYLwbvS
	Tpa952jkJwOfjyvsSD0+n4MfX7KE7lHVK+xqlklLkhGLEhs0C62PhiEXxzOe5e1V
	zifyOg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta42hu0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 22:16:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b0531e07e3so5442220eec.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 14:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768947380; x=1769552180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=898n42PZbM7sQ/Hguy4+gqUdwRDFS04P1ZHCu2BuyGo=;
        b=EOa+OJwzKeXjgcsw/Yu/29pcJXzM5v+G7o2KmuW70Gd4SQkVNZMU+oI7XfRZtVZetj
         vAk6xlu0Qx+WcVOHGh7zN8WLWxYT2IhJv8bmAvlPYxN/QinwBhrpBAwK1hbxHpUjOI06
         nSYLYeQe5tZjW1GCocV+v8jNJsvYa0oorKPOR9KzmiS5XGQM3ezp7l6rQv42l2jeDQsQ
         falkhXHOE1qdVf59Y/gngBzyWepD2akNDxO9pc4rjq3w+tGOf4e1Bs3YG1HO0D0V5MFa
         IeSTsSE0ERASQpasWZEzeQVWyFsN93ok0Q+utFYJHfxm5WhJVRjzZvlqqSXm0L6xzq+k
         cQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768947380; x=1769552180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=898n42PZbM7sQ/Hguy4+gqUdwRDFS04P1ZHCu2BuyGo=;
        b=f9jmxinOnHGg4VNXNW/csg/YuUX7WyL1ibecA6VBBkkt5br/dMTmTeewHxzB4pieyt
         M+mjVmfN0+sYHyiiU0eCZEhTRXCeOQekJY1vhalIY3j90/fWZCsT8O7up9x0kWhjiiqe
         jFiqnQmCqVoaM4GLFRpWXSyPLRtJIZGk78LMwMLH2nQD4d1rcY96evny1iVXXe0RNtVP
         FPbaOZJLu2SWO1clLP2D8jBvcyafQ6whlBpUmgX2Uj63w92AffPdxFlPu/2Y5b8IaRnK
         aR2sf1ezR/NI7QXZkcQAa+5POOu3cqNR/JEQ1+6wl8GibK7h9TWQK1+OC3sWT3yJpy9h
         VJ6w==
X-Forwarded-Encrypted: i=1; AJvYcCWhHf15EaYwbrjhT7bZerYGPy3xKp3a003WQDwAPBvoBYu5ZSIOSmSIIOP94+y2KNaekRLyB6ZDXfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFLpMN1mNrJhb4Mkqhtuq9p3szn2qw317VIw7JJli238T75rFJ
	tOU4UlrKrLtAd2eAph5tiHoEKHmqfVqGNGsQ/iD79MwFShz2mYKJQ2VS7gOmAfwFfTsVdVjePgN
	mTN0RmkgAbOnn4aQuP0s3iG+P+jhzYM53uMi62xnCU6AnaEgknYgcUs6PYDUSKpA=
X-Gm-Gg: AZuq6aICyhHWga/95RSLHJgSVpKApH52P9CEOtsghkAuywIz77dBDeMH4px7mYRypcx
	3HYq2Vx11VmTOvwq0qSf9vpWlCJuJu13xsJUq15uACLYvmeUC2/RfHUDSkzqWibgh0seP2NHQ78
	eCAdj+ukiIwwK7fOtlTnN/Z2cyDFbWs3OyKhr7g9kqDTfqHwjM/wEKoo5ua2hyFJRgEyyVg0foA
	4PQqr9bVCBOQC4ZknxFO4IkSJt+tAki/x5BUzJh1YQ48HzKLfYFU2KTJ1FnaLSS+uFgC5+oaQSf
	U1oZf1sw93pFWmxofWwwHu46glE1I1s4qjmuVvbvzX2PjVbVVTvZpdo14h9alibwBv8FuG1Ptzs
	XHpU+nlqajQYMwICiG1SOgu7XrRSd/YpKq+uvCVJk+jbQxvc+tYq+ASaMvTKDVmQbjTA=
X-Received: by 2002:a05:7300:1489:b0:2a4:7b58:1a25 with SMTP id 5a478bee46e88-2b6fd7905c1mr2372029eec.27.1768947380254;
        Tue, 20 Jan 2026 14:16:20 -0800 (PST)
X-Received: by 2002:a05:7300:1489:b0:2a4:7b58:1a25 with SMTP id 5a478bee46e88-2b6fd7905c1mr2372005eec.27.1768947379600;
        Tue, 20 Jan 2026 14:16:19 -0800 (PST)
Received: from [10.71.113.255] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b70d7f729bsm1680791eec.16.2026.01.20.14.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 14:16:18 -0800 (PST)
Message-ID: <5cec9127-bdc5-49d7-80e1-2ae26f81163c@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 14:16:17 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: soc: qcom: eud: Restructure to model
 multi-path hardware
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
 <20260116232106.2234978-2-elson.serrao@oss.qualcomm.com>
 <20260117-courageous-chamois-of-focus-20d5d5@quoll>
 <sfazro75vspadpe4wco7zvlalcy2wbrbdjx2wn7lyonjgw22sf@z73u67pinusx>
 <4d6ffe96-2113-42fd-97e5-42247f073aef@kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <4d6ffe96-2113-42fd-97e5-42247f073aef@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4NSBTYWx0ZWRfXzyMRqVu4fPaL
 RZCDhSglxCQEQtB7Wdr1aiMyBvvEjB/Ss8UStoFhNq6tIGmLyuoPz+Pz7oC3qB5sdulnNEsn2Sc
 l8pMq7tVQkSKK+x3craEuh1OhZibyn6OYGCcRBrNcnB4W4gRVUAo8/Iw0sBPkqWvFJrLXqmkFcB
 Gnu8B3XbeOz/aM3WgN2Ubs8xN9tAQFkKHHawPEzQktWRC+7T/gEHnnmw6zlDbjqu94SjZKoN1TY
 hvrZely6Kz/gyCK6ApfrasioiNImJnswjvQJmurf0VzOkZOl/9qiD7ybr2wYWvUFNwGrOwEtkCJ
 +8ZVRnkyHPtzRBlvWr7rNghL8iahK6VHrtYXa8g+PCKpUqyFzxNvzW/ZkaTb9g9+kO+FAegav5H
 gXWe46rfQ9KBMvOR7gJkMI4YOs8FL/NCCaX4wlObGGBU8z/zKGienHf3aqKeFIoQf/Jm7wIC6Vl
 ma/LMV2M8YXTg6wqk+g==
X-Proofpoint-GUID: N73vXPopr7nxo83kuZ1xnfztZkyWNx5s
X-Proofpoint-ORIG-GUID: N73vXPopr7nxo83kuZ1xnfztZkyWNx5s
X-Authority-Analysis: v=2.4 cv=JeSxbEKV c=1 sm=1 tr=0 ts=696ffeb5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=esL1I7lv05GZoeN1qSMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200185
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-32556-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B2284D625
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/19/2026 11:20 PM, Krzysztof Kozlowski wrote:
> On 19/01/2026 20:58, Bjorn Andersson wrote:
>> On Sat, Jan 17, 2026 at 12:57:58PM +0100, Krzysztof Kozlowski wrote:
>>> On Fri, Jan 16, 2026 at 03:20:58PM -0800, Elson Serrao wrote:
>>>> The Qualcomm Embedded USB Debugger (EUD) hardware can intercept up to
>>>> two independent High-Speed UTMI data paths, depending on the SoC
>>>> configuration. Each path operates independently with:
>>>>
>>>> - Dedicated PHY interface
>>>> - Distinct USB connector and controller associations
>>>> - Role dependent routing
>>>>
>>>> Model these hardware paths as separate eud-path nodes to accurately
>>>> represent the physical topology and add below per-path properties:
>>>>
>>>> phys: EUD exposes a High-Speed debug hub that relies on HS-PHY for its
>>>> operation. This property references the HS-PHY associated with the UTMI
>>>> path.
>>>>
>>>> usb-role-switch: Indicates that the USB port on this UTMI path supports
>>>> role switching. In device role, debug mode inserts the EUD hub into the
>>>> UTMI path. In host role, the EUD hub is bypassed and UTMI traffic flows
>>>> directly between the PHY and the USB controller.
>>>>
>>>> This change breaks backwards compatibility, but the previous binding
>>>> omitted critical resources like PHY and did not describe per-path
>>>> topology. Without these modifications EUD cannot be guaranteed to
>>>> function.
>>>
>>> It was working for 3 years, so your guarantees are just imprecise. FUD
>>> is not an argument.
>>>
>>> Qualcomm task at 2022 was to post complete bindings. These were posted
>>> and accepted. Three years later you say that previous posting was
>>> bollocks and this cannot even work?
>>>
>>
>> That is correct. The description of the hardware that was provided when
>> this was upstreamed and the binding that was accepted based on this
>> description is wrong.
>>
>> There's absolutely a value in maintainting backwards compatibility in
>> general, but is this one of those cases?
>>
>>> Nah, take responsibility of what you did in the past.
>>>
>>
>> In my view the responsible thing is to accept that we got it wrong and
>> make sure EUD is enabled end-to-end so people can actually use it.
> 
> I would expect to see what is not working. This is in mainline for three
> years, so the assumption is that it was working for these three years.
> If it wasn't, this should be described and "cannot be guaranteed to
> function" is just imprecise.
> 
Thanks, Bjorn and Krzysztof, for the feedback.

Let me clarify what I meant by “cannot be guaranteed to work”, as I agree
the phrasing can be improved to more precisely convey the intent.

The concern is not that EUD did not or could not work historically.
Rather, the issue is that the hardware description provided by the
binding does not explicitly describe ownership and control of hardware
resources that EUD depends on. As a result, correctness of EUD operation
relies on behavior outside of what is expressed in the description.

Concretely, the binding does not reference the HS-PHY. In practice,
EUD may function because the USB controller (e.g. DWC3) keeps the
PHY powered and configured.

However, this relationship is not described as a contract in the
binding. The USB controller may legitimately relinquish PHY control as
part of its own power-management or low-power transitions. The EUD
hardware is capable of operating independently, but doing so requires
EUD to have explicit control of the PHY.

The hardware specification lists the PHY as a required resource of the
EUD debug hub. Not modeling it in the binding therefore leaves the
description incomplete, because EUD resource requirements are being met
implicitly through another hardware block (USB controller) rather than
being described directly.

In addition, the hardware can expose multiple UTMI paths (dual-port
EUD), which the current binding cannot represent.

The intent of this patch is therefore to correct and tighten the
binding so that the hardware resources and topology EUD depends on are
explicitly modeled, rather than relying on side effects of USB controller.

I will update the backwards compatibility justification accordingly.

Thanks
Elson


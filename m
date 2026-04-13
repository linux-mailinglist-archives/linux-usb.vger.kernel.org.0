Return-Path: <linux-usb+bounces-36192-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLjeBBnF3Gn5VwkAu9opvQ
	(envelope-from <linux-usb+bounces-36192-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 12:27:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4713EAA0E
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 12:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B86CF301A2B7
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 10:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4C13B52EB;
	Mon, 13 Apr 2026 10:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="peQC83Le";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a9hwEAfV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBF634F48D
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 10:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075992; cv=none; b=qdQJlkv0QQ5agRLFJh6klkS3J/XxM+GvkxCEE3IXZbMPydN7A+lhNDHESCnrb1a8gfy0yPZTra465ZhbCRpbM7I+FE/55SfFt0CahQKdduxYbzxef8f4gOnaINPz6yoQz+Fd53fHYfJTY+7yswBspDWONQ5a43OIAdDRBRTO//M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075992; c=relaxed/simple;
	bh=9g9xm0d6e3UdYPyZT9dWnvnxu6qy0sa1f/KB5OFMKDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j7V+tt46qKnSM1E8Pt7sKg1ke3+bKJKPfcPeMDYxQzWuTOWAM7QmD1W0Nn9TMTU/mfcuM7m1+CTuzVd9fRi/K3Lui5MgVBc7CCVD8oV3f+rFYFbv0Y8a87gzE8IbA7eW2bfY0O4FbebEVZmU8ozZ99NQqdZNWm1BX448Pdzcybs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=peQC83Le; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9hwEAfV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D790ld479862
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 10:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	93D0c3gAvtUiPsWGltY7o+cAV8HaCq+OeVHrGhr6/7U=; b=peQC83LeqpszB92x
	2fa2U5nOhYAu6SFBZ2W4s1eNH/lV3XSLwLKSxN1sgEV2hznlBU1lmpwdMx45oqx3
	XzgwACplgNja1ySwSsazmqWKBf4psYdfZmqrZbIxhxcjrL/mC0VUSeuxCsg1SLgC
	waSi9Ef093awlAZ16BYG/d1fXqbIWAjutQL6VmUMtLcHAEiH4v1W3Zs64iWbUY1D
	2FGJMcWPXOj8P6PfhEIaLqRehOVJIj1D2EMkYMs42sI6hcIAs2bcD0CzJsASMcwf
	kQf8hlkqtpJyfZ6EGXm6qnpjgyfrmt/kWTzOnemfwvc9CgHPpolhiAdHeZT5P45+
	tF/dNw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dguuj8pxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 10:26:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8e141739794so11577785a.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 03:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776075990; x=1776680790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=93D0c3gAvtUiPsWGltY7o+cAV8HaCq+OeVHrGhr6/7U=;
        b=a9hwEAfVlbfkGHdgqet3zaf+eBZbjgAnv0l9ClzG795kE2rB07ZYGeBp1D5DjzFS0o
         5YvaHLboUsGaJGdfvBKfJAzBW/69f/fNdDqPoM7bWnb43ranIzcu1JyQ4nUYfDWi3zaf
         /WSyht4Vu3fLsLI/UAgHqeze5G7ym1zHF0c835sWVP9OpxJUej0ijrll9sidfUx7tWyt
         S0ia9qEPWQo2viQmIXwyKu3RHLjyvSMFa0LsyBTqzrWC9bAQsQec5wfcHjaQu/KvpyyT
         S8DEK5SSA3lgJlEuSbJFst9eqJC6lD8hKs0nlOi0voTRJ7K42PWJfB0qFiGJNR0+KGGF
         uhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776075990; x=1776680790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93D0c3gAvtUiPsWGltY7o+cAV8HaCq+OeVHrGhr6/7U=;
        b=RUtukKT3gi6OLCSyKcwlotpez3WcYQv0FGy43DjMsa5uq0obwG9cZi0ihtkHa/Jvln
         /Y1OXgVf3oI/YiWb3xfGY3ad925YbGXG6oHKgfH2uUGMblfhuD8zSeLtl756I1as1/J6
         jNemKjiaWLUh+ETIzCneJzCmB36tl8rXnefFjOu/VMEK+yoh+CebWJQJNfDTNkC3j7Nx
         keaF9zGSGe1+vF45MrBbuMdOgEEsGEB+zeNxffKaBuz1C0YqUS7H7D7YVvjai8TJk3zK
         dQETvt/I+vLgR4sEU6U9ufa2SOb3RpM/gOyDIURW6mveL/fCP7Q+hGWxe9Mo2Dwhu43F
         CYFg==
X-Forwarded-Encrypted: i=1; AFNElJ8KenbZdzoEM3JjaCmI3vNuRYNtYkL29jrTH7QP/E4mmXP/yVuu7oTLilUtXug50hLGlgHftlJCjaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpCBzQBcxog1+HIJpzG6YzCxwIE4UInE+aJOapUJkRZzK82VsE
	nclF1LjScy8fldX9M2QRoM3hP//UxS8liV4Ety2Ke8fVwHdthrqHRB1Lxl9f16gDt/o/eV9vbzy
	QtRa/2w0PulI6jiD68Co2+r2ZcOn7FJYOdFFstCD4sFEnr8o9+kFsjQDlYBgMhSY=
X-Gm-Gg: AeBDies2QB/P+LWxyL1bVoj2V+5jHt7YGmdFXNTrWAxcpkfwCTQsxJZB0Pqiuq1OXwa
	wAlTH2iCSR0PqbDfnnuGtJ7/QzuuPGm5x/Nzr5DnD2ieeBeYSukH9EBoEClIyFOrGDr7I55x/rR
	0cQT4RnuO8P1cvw7EkkGyurnyb7U+BLF99KdT/2j0EEnfSBN0ZHdrGtppiSWtitdktM4KOAUOX7
	xQTPSESXqcxnSg8GNEj5qTW6gRKdVf0+PjM0U9GeCqV73J3w/33Y+5qtxwEHnxRVHjA3Dn2tsUD
	nSkHvb9z1BWpA/hgC0534gj9FiEGIL4cMJsGGAKuQjxO/Qfc6xuCgL0akYymX4pPWhO2UWet55E
	2hc//KHku30dNgKpgZJyoy/b4Xlp1IpiY7TGw0V2xZazpNCxP49SseYmAzc8nF2zScxGjgPAFPL
	DtLhE=
X-Received: by 2002:a05:620a:404a:b0:8cf:df37:4f6c with SMTP id af79cd13be357-8ddebbddf54mr1219961285a.5.1776075990022;
        Mon, 13 Apr 2026 03:26:30 -0700 (PDT)
X-Received: by 2002:a05:620a:404a:b0:8cf:df37:4f6c with SMTP id af79cd13be357-8ddebbddf54mr1219958985a.5.1776075989547;
        Mon, 13 Apr 2026 03:26:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702eec8asm2370758a12.2.2026.04.13.03.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 03:26:28 -0700 (PDT)
Message-ID: <7d1b6771-6e9a-4fce-b672-ec4f31daa2f7@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 12:26:26 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: usb: qcom,dwc3: Correct MSM8994
 interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260106185012.19551-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260106185012.19551-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260106185012.19551-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEwMyBTYWx0ZWRfX/ed1bNdEUEjx
 VM3go3gLlIe1RrPo3XmxaiIYALjSefE7ACJBSN/GOIK2aaN8qR2ldzzMp2e3Rlp69dSqlizt15s
 bcIc+lmoZMWGVEnRb89MHnl91f//bqSH9tQWKeJpQeLBRTqU17TiXoryuGrJpbdpw9CHQfRHGbu
 B+fHcwOcIUzCaBY2u04rejaI4+dHNR4ujHEqrm+6hFssdLuPG7v0oJCrn/LqVdfq+XV6Zo+Mt8F
 DinB3Z7K23+2HWl3doALlXzs9gxlPtDu82/hCqVk7xW4/DPT8/c+yBZKlNSZXAiaT02+KVs/ck8
 BY5oaWc8TntUeug1QTLXEceAqnjgwo5JsNAMPbAtwCqc4cJ2PqQeEMpqGe8LVolnAktlt8f5BQs
 JtSb4N86blrYJ27OLHdv9J0a5A93wXIprTTuBhc9CK+VTOFfcBAZp8kU6TurWcrZYhmmy0nItc+
 2k/XiJwZSaqppqT3xgQ==
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=69dcc4d6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=FFvnmRk-8DjInUy4hlIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ApldpmrfhyobN7LHGabpJ0fBHYDLtUJr
X-Proofpoint-ORIG-GUID: ApldpmrfhyobN7LHGabpJ0fBHYDLtUJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130103
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-36192-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC4713EAA0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/6/26 7:50 PM, Krzysztof Kozlowski wrote:
> According to the reference manual, MSM8994 does have QUSB2 PHY and does
> not have DP/DM IRQs interrupts.  It is also logical it has the same
> constraints as similar device: MSM8996.

It may be that the following mapping is true:

USB0 (DWC3)
 DP -> MPM 49
 DM -> MPM 58
 hsphy -> GIC 133
 otg (dwc3_irq?) -> 179
 power_event -> 180
 ee1 -> GIC 131 
 ee2 -> GIC 246 (for IPA?)
 hs_phy_qgic_irq (qusb2?) -> GIC 311
 phy_id -> MPM 48

USB1 (CHIPIDEA)
 DP -> MPM 55
 DM -> MPM 54
 hsphy -> GIC 134
 async wakeup -> GIC 140
 qusb2_phy -> GIC 312

Do with that what you will.. I can add looking into this more properly
to my ever-growing TODO list (or maybe +Dmitry has a 8994 SBC?)

Konrad


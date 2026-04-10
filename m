Return-Path: <linux-usb+bounces-36145-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BAFAB4z2WmjnQgAu9opvQ
	(envelope-from <linux-usb+bounces-36145-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 19:27:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A0E3DB0A9
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 19:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F0E9301DC11
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 17:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BD73E3C51;
	Fri, 10 Apr 2026 17:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1v5e+C2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UFoS4S7i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A5E3E3C4F
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 17:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775842061; cv=none; b=Mtar0d4zI7unFypQ7LjBCoygZ/zTfw51gSHo/KqbER4j0ysZ1PKLZ+37IRuyp90kaBPeUfyBaYiZLvWKMlxLW67yZ34MofOJ8POjiHMGrvh1LrA4QB48RgaA19guyyEqiirSfGyYyERdbZpnKZr7L/Glx3zb+3IKiF2A2ksxd4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775842061; c=relaxed/simple;
	bh=IeyAHCb/x7ZLrNGXbN3ASw98xhDx98GlfZcJVTUwYm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPLBTAkcYcw6xDgyWv9RVcq6vSb4Et/nf/btJTNPRAAUzbnZ3k9elcgMMSEsnFqn4UyH3zidKcEx9/p7TdUAGJHornRxQzINg847R68KxrY5ncWKZ/483x0QhBNPoazZ4biHRN216EHuC7ntZUIgMH5akyJUBA0HxvRo4saVP74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c1v5e+C2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFoS4S7i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB0wYT438755
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 17:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmo7gNTI5BWws0lj2sr7ZllfUU+v0nf+If/Ue4uaz3g=; b=c1v5e+C2cV65qVRm
	1iLr7Hq+vfsK8SkBQbp+stajDret2RLYl3mxBhFXg8ZsWAYQNvyMy6csbWcvM9DD
	ytfh1mYf5Sac+smuiczvMJe+gL4FL2FvOVAMU0ixpQyksD3Epm5p96YZM3jr16hD
	esKnYuW7rgd9OpBa1Ou4EK/EwqDHgrttJDi70xeQ0KssI/EFVZkcnERHFrB/NNNX
	cn3fU5grP22axKHIkQ3zFDPD7rfsiJNRg54k5iBJKo2WoSbZcNceBzI9lJCOneaN
	uNbB3m7x51oTkspBW9gaQKTzeyB3cb2xzlEUNUuIoYRUy8g5ylZN9QNmwc5Smlwp
	KCGziQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9s76s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 17:27:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4bd8e77dso4142781cf.3
        for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 10:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775842059; x=1776446859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmo7gNTI5BWws0lj2sr7ZllfUU+v0nf+If/Ue4uaz3g=;
        b=UFoS4S7iA7ZE4YGAESNWbylsxUdypG5WF53K/J6kha3OTvZfLDsiEJvpqAAH6RQkI9
         CCph5Ysgmwk63CrJwXcxACtetJyoaCw8vCkLXxntsPwlLxh++0wcWgXmBHPlheWrAeiZ
         Tf9ju514QekoDpmKwJxpukGIFedxg2yIOt4A3iXm3+fuvUzwzqm7y7Gg3G1uXCo8ouy1
         GTtJWSKpmTb3Ln+PGI+aXcvXAVt5HOrVhNMTPyVQyu8Bn2Wb8cgAjtImjL2g+R5Y2u4y
         eYNeNNIR4k3rm+FIQJlTEyGKj3zlk9QeyDqgeDwAoI1F7veF4c+oMTUbtpuMRwHVeMuh
         wuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775842059; x=1776446859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmo7gNTI5BWws0lj2sr7ZllfUU+v0nf+If/Ue4uaz3g=;
        b=IY33FMFpe2ksaGRxQBOnwWmGnyynvNkTT5Jh99wDsMpy8LZYS9rK/3AS0Y81U1zQGy
         8sYijOBfDjMlPyJv3VLT6TFfJR76osI8kuxHDWJryu79Mk5FCkCXjOvk9e//VOw7ze1i
         e62Su7gc4l8wVwt80daoWUN+XXEj/JIzZQqRFGa6/VyUguAsvo0Tny+QTG7KC/pw9saB
         /7pcHXqZbaVVlLZWmEgBR3Jppx8ebRWpcQoCXX8D3xQ6hcSs3eexqTkJn6bOD/47TnHZ
         nNS4lfD/+3bfRA/gokvvoyAPL9sQ+xHHOaek0TIbKVKyFo5UR2ysPkIgVjoLUQNg5xHv
         KHbg==
X-Forwarded-Encrypted: i=1; AJvYcCWAd1Ub5qsEtyvB/2OXJjdcBh2mPe4L5AXXz7ypmYEVFRrHOkThQFbgdjwBomxOMmYmJGqWa1YyHCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YznxlGDD0ECAK3OR9sL/HF2wzD6wqekVWiWSocJa9XmRddFpeQ+
	yyjgekvPtK/BQVqD8WOY023ka/4HkYPYrkYQSGkXPn0QPrja7garIWp34/jHoDE7sz70m257QXD
	dzZ3PdgG5VbBY2nf7rCqPU5u21NU84T0vC7ys6g9va0uQlurevoXx/x2XaqHmOvw=
X-Gm-Gg: AeBDiet3U9BNfB/O56dgoCd+AoIY68tKoDBxK1gAwSykihZb60DxEhtOJSFkK/x0tyM
	kbTNvOosEtPAPOaep5QF+1ewszzLi1KRLCUUVhZMBRB+54doiuB0Mu3kYnLt1rDJz7ZkZESVGpk
	zCW7G1fd3AT3dFTk1tKgt012Uu5EVn1S2ZH3wsNelhcIz5+k8epGm0CqDUSZYldmr8YxSFFy97u
	vsGeHJh3wY+AV2ZYie+xfIiMkZyIXoc4sVpfSExZXHPo1jpR9XFpEwEuOIx7S9Wdbh+xHQtA7X3
	gFJW7jeTOBDbbohAo9sOnX3++20MjmNXA6yfOBs9pMmiztAgPaNf4B00WOKKqm8QhqpVBkhENrk
	D5QNSbtduCqZpkMwElSyaS0WpG9qcdbdEyi93RB2PrGKyPngb5/uRy4RvbR5plCYianGBVuRsHV
	BOf0Q=
X-Received: by 2002:a05:622a:351:b0:50b:5286:f757 with SMTP id d75a77b69052e-50dd5cf408emr40726931cf.4.1775842058683;
        Fri, 10 Apr 2026 10:27:38 -0700 (PDT)
X-Received: by 2002:a05:622a:351:b0:50b:5286:f757 with SMTP id d75a77b69052e-50dd5cf408emr40726371cf.4.1775842057852;
        Fri, 10 Apr 2026 10:27:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a4fsm95465666b.54.2026.04.10.10.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 10:27:37 -0700 (PDT)
Message-ID: <1f774a46-3080-4541-8573-d2a7023bbb13@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 19:27:34 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: debugfs: Don't stop reading SB registers if
 just one fails
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>,
        usb4-upstream@oss.qualcomm.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-topic-tbt_sb_debugfs-v1-1-131540e0cc2b@oss.qualcomm.com>
 <20260409120457.GH3552@black.igk.intel.com>
 <75c962d1-7ade-483b-bbc9-a6c6140fc0e9@oss.qualcomm.com>
 <20260409143203.GI3552@black.igk.intel.com>
 <7d65539f-ece6-4e7c-a13e-6b12920346fa@oss.qualcomm.com>
 <f1af27b6-e166-46b9-91d3-5e293fd6d74b@oss.qualcomm.com>
 <20260410151007.GM3552@black.igk.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410151007.GM3552@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE2MyBTYWx0ZWRfX+AE3fYJoLH9v
 2PAfhDnEQ8KNh+GcJeMmTz7x4ZDGpFWqOxn4KUWhfZqmNfwxpa36VQ5UubVDdMW3E5P+Gpb/oIu
 vqs8H34BfocC9zTNxqtdc+jDXZVf3NrjdoQVNa318DVIqUQ3uupfHUmhi4xTs662DuBmdwQFhTT
 PNH2Q2UCbrucyfQmBRFK73hPscVKhE94SIW9UupkaZ1efgrc4sWTylQ2ipA6MfP5JxRcO+xl2Wk
 /mjQTSqZDveSxjMrH1hjeSADtRinPnTU9g8Ka8xthDYwMxpxUt7Ue9AZq9qp5OMJjFrm+3sU+3z
 EjK+3BSFGkGXAhxmbwP2w9qRvNdhknLmploXgCz+guCC0vwhxfr44nI6CVkrU92/Qs+764zjvsK
 DB4LR5h6WrnI89JIdCyE4E+k8M3n71/QAaCLQn+YC47XzSC16i29vp6QbKyxQzYlf9JmpW21xz9
 IZzTtolrFv9bStBiLDA==
X-Proofpoint-GUID: sJCn8fMTAywR_KomacgbA4OMkABNao9a
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d9330b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OMFt2CSnIJmYOyjttnIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: sJCn8fMTAywR_KomacgbA4OMkABNao9a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100163
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oss.qualcomm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-36145-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65A0E3DB0A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 5:10 PM, Mika Westerberg wrote:
> On Fri, Apr 10, 2026 at 04:43:54PM +0200, Konrad Dybcio wrote:
>> On 4/10/26 4:29 PM, Konrad Dybcio wrote:
>>> On 4/9/26 4:32 PM, Mika Westerberg wrote:
>>>> On Thu, Apr 09, 2026 at 02:59:22PM +0200, Konrad Dybcio wrote:
>>>>> On 4/9/26 2:04 PM, Mika Westerberg wrote:
>>>
>>> [...]
>>>
>>>>>> I assume you have tested this on a hardware that supports this too, right?
>>>>>
>>>>> Hardware that exposes that register this does not exercise the altered
>>>>> code path.
>>>>
>>>> Well it may happen now that previously we got -EIO from some other register
>>>> and we stopped there, now this changes and we actually continue reading so
>>>> this definitely should be tested.
>>>
>>> The only register before USB4_SB_GEN4_TXFFE that isn't in-spec for
>>> both retimers in v1.0 and v2.0 is USB4_SB_LRD_TUNING (0x07). The PS8830
>>> interestingly reports all zeroes (not a bounce).
>>>
>>> The registers following USB4_SB_GEN4_TXFFE in the array are
>>> USB4_SB_VERSION and USB4_SB_DATA. The former is not accessed anywhere
>>> else in the code, at first glance. The latter is, during NVM r/w and
>>> in margining ops, which have definitely been in use for a long time.
>>>
>>> Plus both of them are the v1.0 spec. The USB4_SB_GEN4_TXFFE specifically
>>> isn't (the retimer supplement pdf lists it as Rsvd, the main spec pdf
>>> omits it in the SB register table), as it wasn't previously useful (since
>>> Gen4 came about in v2.0).
>>>
>>>
>>> I don't think there's an easy way to limit the reading of this register
>>> since the bit indicating Gen4 capability is in USB4_SB_LINK_CONF (0x0c),
>>> which is Rsvd on retimers regardless of the spec revision. A connected
>>> port could easily have higher/lower capabilities, too.
>>
>> Checked again, the USB4_SB_FW_VERSION (0x02) register's lowest 8 bytes
>> are 0/1 for retimers implementing USB4v1 and 2 for v2, so we may go this
>> path too
> 
> I also checked from Retimer 1.0 spec and there it is still "Reserved. May
> have non-zero value". Probably not good to rely on that.

In Table 4-3 below that definition, it says:

"""
Shall be set to 00h or 01h

It is recommended that this field be set to 01h.
"""

But we can revisit limiting those reads another day

Konrad


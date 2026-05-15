Return-Path: <linux-usb+bounces-37508-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NXVBbYMB2oLrAIAu9opvQ
	(envelope-from <linux-usb+bounces-37508-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 14:08:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CD554F17B
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 14:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 171E43073880
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5594847CC99;
	Fri, 15 May 2026 11:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJJieRKP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6jY3bT6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9883643636A
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 11:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844582; cv=none; b=d2wUuWSbossM0MtQqzIvZTQAJaXVzNdl2/+i4isIcA79g1vy0/IGnwsq3b1Fieh8+kBoomdafJJYhJM9WuJkj49h1JHNT2yxj4rkKhA+j7UC/b9/gc6J4CaIr/tJKkA3Ona6xavjDczuLoM243mZNvutOMuUeVlcdZuJOTOhRB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844582; c=relaxed/simple;
	bh=HL4XXTwUHCtAfy5lSSZ4iq43KCo7QdAzVeZ7SuFGm0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOGihYhkqEAzIBRGL0V4jIMy9ln/WXt3GmRJI2U+8lTUdLhxLxS0Exbz8TQfYvTT138ZA5YpeI+rBTepT0c2TJZY2UN1FS9UpO9IEa2NzDs6hqNDY9flt5SnnzmHJq7dFSiaD5nHrHWRogM81EQjs8nbHT9EVlA2HkE7oid7RAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJJieRKP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6jY3bT6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FArZ19654911
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 11:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8PBfPdN6MnnDE3OmtYSDk0xuV/x70N/ULtY8YnSOZRI=; b=oJJieRKP8dTpMse4
	Pq8uv+TXTlen43ebv+V8S7rRCnabDSqn5REqUpO4Y+Cb46uV8OZx4LfsnEC0nT9F
	zoYtfUGDUyQT4db8Cvp0i5vfidgVXVNWSBhxPJ3POQ+W/DXynVGxKIp9yZIB0txy
	keWABJJNvKNDqBwMClrKkL6UJNzOni8pyoXCNZCPOJzHc/Wf3f5DUh2BDnDQp5IG
	mOUBrAKoC7ojAVRFh6+ROMYA5phW2gHdrD3VjE/sfii609OffJL/vYv0niUXvaJJ
	CcUsWcDidDwm33giURzNXgUud/+er8FNNqm/HtMqPBeVJBrQYh4i74wf/hXSB/X4
	6t5ftA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pu3jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 11:29:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5c781193so16747951cf.0
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 04:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844580; x=1779449380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8PBfPdN6MnnDE3OmtYSDk0xuV/x70N/ULtY8YnSOZRI=;
        b=a6jY3bT6CcWzxWgF/Z5kh+AG3aAuol2PfIjOru2X0l/ILPlyYWs8mhUircb+/Alvoi
         4X3E//b8AfYX3bOMwVWh5gDufoV3lq27zdZXmhnf/HFkjdEeVsQzNNJlkuij2qBzWgwm
         VYkgnlGUdBftg7XBxrKR/NpH3czX4RrOKD53awh81H9ODEGjQE8uiAvf39jsNyuV2cEi
         nmxmDWRAlIHWlRMTsoA/7pccBoA3YIlb6R8eEc2UKfgCwWyUJLsrAojQUYiVqTSv2yO/
         33/Ty2T3zdoUdQjU5yCRSdXSayeJ1HSOsbUboFdXUmWvOAoAXS9irtXLflKBcEXAPFhd
         nmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844580; x=1779449380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PBfPdN6MnnDE3OmtYSDk0xuV/x70N/ULtY8YnSOZRI=;
        b=ILUTRAyJpXg1yIU7+Gh6qGerQoRkugXCpKMJ4NDxoTpvBK97wUxN3Hz3M4ItBw2QOt
         958NrpyDTf/KPU3JJkxZQNdp7zbnCcj2Md3xntlV054f3K/UrzsPNrNb9sBJbbY223FQ
         wdkqCZkv55L5d3L15e/EN+Mqf/Vs9DZlXj4fHRIOGwvmt4gDu96A9ikAYP+eDuxQdcb9
         K5eX6g4+nR3QtX0w/g2rtQIkthG7/bS9eoevX74YGc3QIK2FfMY0rV+iUu3h1GQHaryx
         JQP1JlxHxOQO2nbuanejKRJxvGltFb4nRYiFGELaA2kkimXgJ2rkSyfZCtJKe1DsHvt2
         LYyA==
X-Forwarded-Encrypted: i=1; AFNElJ9qA+ZGp0OkF3ld9Ygq/gCITL4BKaLif8ksvP2X76wZRyvILTEW6c/xGXK4EzlNsY+pJm/P4N0RGXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDBCt6ab2L2o+K3dDiOrRLv+gBXIJDz9VUq1vJ0RC2fpf6EFHF
	FfwRL45HhRoLiEdf/BgR2V2AI8h2D2gy4uGpXty/8O1kH9Ut3QhmDiNFCR4GvDmhHzE/wmDA7uB
	NhbHT1+8BBjtl/LHtYYgOpvyshbnJqTdnDwwEqvbETJVfJS/H+v+Hc4MLJ4TopPk=
X-Gm-Gg: Acq92OEHZJNWci7Os+wuYdEXDx+7N8xJgCCQW/ScYTmPpxB2UWuRvKykn7N/Awg4UZK
	ZLP5poksnOezV5UadFwYKhyy29Nr/Uv4C1hTUlcb9hSkHFM+23vugkJdrC3Pn5NYt4xfPcxwUaT
	Mpbhokr+g7KbQ/S2rlHZrAaO4224BqUPbKDCHQW0ke3Xic7Jp+6Fps3MT5IoiCzn4x3YQiIShTT
	zkRw3WZpQzowhAcsPZs61lhCLxUcUrJlRhoNsWiNLNh7HghtExZe30fNEggDjFZ2QY5Hjd8J5p9
	JzqcfQRKcHVUIgrjiUl+9iA7NlNsUMFdPEzCgGGzU/aPl4LJLTnToWZ3XlVygghFJI91ygWwQ1m
	ZaL38nHc5qw4K3RVfLCcrr9bnCj0J2UMXsa3eKz204JTvQHt2s77ho2rXStdjSgCeZkkmsOoPW+
	2Tuv8=
X-Received: by 2002:a05:620a:690d:b0:8f3:5b1d:ed86 with SMTP id af79cd13be357-911d1c00cccmr370339585a.8.1778844579886;
        Fri, 15 May 2026 04:29:39 -0700 (PDT)
X-Received: by 2002:a05:620a:690d:b0:8f3:5b1d:ed86 with SMTP id af79cd13be357-911d1c00cccmr370336785a.8.1778844579499;
        Fri, 15 May 2026 04:29:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311660f6bsm1874474a12.17.2026.05.15.04.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:29:38 -0700 (PDT)
Message-ID: <1d559fe3-c488-4c23-b3b8-4974eec3e38c@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:29:36 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] phy: qcom: qmp: Enable ipq5210 support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
 <20260515-usb2phy-v1-4-5f8338d466bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-usb2phy-v1-4-5f8338d466bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hSWNqx6ToEFxaiBXqITtF9HD8QUEuyTF
X-Proofpoint-ORIG-GUID: hSWNqx6ToEFxaiBXqITtF9HD8QUEuyTF
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a0703a4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7VrQj88toOM5sR0hJNsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfXwnBcSP0ajeWf
 SJ81/b5LK03GP7MGquuLnXXsjlRVKG8/Ze2KhV5tWgMOnpYpw9Dyjkl/zdh0VI+MPQnrA9tMecg
 fS821rhD6eMoyGe8eesmW5iQKjjC0uxOg0sLwfFi2lFLX1r5yUO5NW51IvgCtLisCQmIkIqKuZ3
 LxFsffWYHeJ/OOIiKV4LVfzCdZRg1d84Sci8tFiJaV88/mqnvcofXObL90vOQQ4vDAd0fFxBodO
 JS2lAzAu2MB9oXblvgyAYKlzI2zVZxtsiqnItwG5JHn0PBUL9IF7aGW6azgQIIPXlczncKK59cE
 6KW+NJfrIyh9SbOneoC3z4iuwUYCdHt6VTq2OUpEtwJWIRsayYyUAI2KadRs/T1JIiAsWZ9IjsZ
 aiqw8FNlUUjcmuuZ+JoD6Cs8WiC73BiUoif9/4ROxoHNW6IlH7ScSw7kjrjAQI2e4AA1BKSGLsH
 I5BtaWD2grmF0WrWuQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115
X-Rspamd-Queue-Id: 29CD554F17B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37508-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 12:47 PM, Varadarajan Narayanan wrote:
> Enable QMP USB3 phy support for ipq5210 SoC.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Since they seem fully compatible (also in patch 5), could we simply
use a fallback compatible?

Konrad


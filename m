Return-Path: <linux-usb+bounces-36673-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHpmJW+08WmwjgEAu9opvQ
	(envelope-from <linux-usb+bounces-36673-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 09:34:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C41649084E
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 09:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBE50302D94F
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 07:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504A239658A;
	Wed, 29 Apr 2026 07:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pIpLHBN4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+0Nhnaq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE263A4F31
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 07:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777447745; cv=none; b=I3pPuAwzMUljY1VnSHTPrhGu7tpbJmrGbFJ6CEmJjCeNKHWUo3qEksqCwDukUH72wG4Bnpk8qYORsI5diL+7LQqCELsEsFsHiEmBJwUKO7hx+bsZnAxpb5XG+9HoWJJ1XwM3evUAToC34r0v9XHSRmXliIf6qYcfXGUlKYv2JtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777447745; c=relaxed/simple;
	bh=49SErnGl4RZ8R9MFYGLdiBx7EvqkH7d4iHxEv/oRs5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AD15EZhuEI20OPvUQ4jJ2TYNcIotr9MrZMTqRw8ZNg87AvYJiJZBDCj3Ul2ne6GJl9sAgAJRqpvfYr2eXfm7VrWfF2my7MJlQWzveA4OpdHz5dZCAO/O9ZoVbk1S+6kqHMOvsR2nae9AsVH8D2iDRxoSYA4u70g3rrDxLGUUIGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pIpLHBN4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+0Nhnaq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T6CPL13385706
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 07:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZS5IKfeim46O0kOx4wtbnE1w4xKhmH/WYNeMSKk7vI=; b=pIpLHBN45STyaJvA
	lHiOwPg05MsjFjAR42LEkLxtfXCLpkPwZqi2lwdihpWRKe0lqitEXfQSBo0sJdZv
	dRKR+TdSREJLmYu+ql3Y55fHHCGPcFHZw9PHBFaaJ7x/d6QoXG7qR2sCCbksDaL8
	Qzg0Az+65C0qQ1g/nG6Ub76g+bXNaq2Rkjc6bjFoITYhgDqc331Uh5Gyv+tkK/Jk
	gqxpBfdIAcYQIiDTfyd+kFt8ogA28zYBPtcObQfEC4NPwR8lKnTFK84FkAPlc0TP
	vAxXN9N2svJduRal/ofnZ6vz741kiHD3WQ6C1wHWN4LFIo6+ySHMb0uyACD71r/0
	1SaKcQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1gabv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 07:29:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2d93379001eso30585744eec.1
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 00:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777447742; x=1778052542; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vZS5IKfeim46O0kOx4wtbnE1w4xKhmH/WYNeMSKk7vI=;
        b=H+0NhnaqquqqD/kXkWkB2Donlj12y8tpXIGe/xmFNyQun+B741W8IB8zJnxzfdn4QC
         1cnCjCU1a6vB0O5eLJ7yFQp4wmeui+DdNmruRji6UmtHTuQTSqWJdHqTgG9ku2LhoiWJ
         39YJRznZiHIiJfyw0GVrUs+s3pGZNyPKGK5ExfXw1dcEzC+Mfzfp2hmD1k38gFuSef/p
         jBxsTyRcgy+FT+tUPpD+NCV9Oea5SYDv/nvH9VXeiC9pIboG7erOhZ4shd3KAprx4heY
         1RVF6/AulZLLWQQHIjYZP26SXwdJMK0WevHmXBGQp2Ujh9Hj7NBSqC6iaTIKHrLqAjaX
         nI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777447742; x=1778052542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZS5IKfeim46O0kOx4wtbnE1w4xKhmH/WYNeMSKk7vI=;
        b=NCBOjbICTZXVMUyJ36KS7Iu29VuOimeelENWwrK404rutpDz0V8GTKpuVAZDoGm3/G
         uQl9srrYss6PYFd5K9qjxGuGY01ShrYlWyFyn7dMThqvB4MsS95RG5hjXsT9m0ZU5ah5
         fuAzyPrAk745/KJuvlJ9+n/0OIGwwyATICrby2XBgHOwXqyl7pEPZ7tyR3W/0pYRQ6YV
         LM2NxEBzKYVtKWVvYm1Opm6NAbNr5Vsbcyikky2h9TpS0KSmd3ozaR7SEHCA1hY7TdP1
         so62QL9g5vj/NUrdAMH3DRq1sYv5e2+Fia6RaEP54gY398f4DZJk18yxmOHhRHslVrBk
         FmCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SiuWHNnFNTbUlfGezgIU/IHsIvdzP4qvHkGwT1YE8tAoZuSfwSZHaQnhBG8tFdbsQlbBrJL1kO6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV6BSzoMnehV9g+r3lYcNURQ5V/FraFYprMfEm+4i9clh19zOr
	VarjxOrmoaZita/RtRY4HyxchzRk/Yo1yy+krSLrUkW2bPq0k142OYmrs0Km426F0nG5NkEYud4
	qAPD4bGOSJQM7j7Sq4bhno05iJrnaydA4PWwuaQJlH6bo4Y529++MHx8LRjBVI7c=
X-Gm-Gg: AeBDieuM6VV9Eh3l8xNTUguZ1fIwyyoKSlKHeaE45RZPvJ/9A6jmSC5VD5NdkJezmyw
	n4cBAtuZlXaxkBZe5ByzHnLKQ2nTJb4xw63SYWEDL15yC7W5pF6PRFr1kxEAlpxyiCp0o+ezWuX
	r/3lqliz/ODgxYNCaHPteU9nlxRNmDzSO9EEE82T8kxFRJrhdZq9BtB+1SFh+KiKemLxfQ4+9ZD
	LiBjyxgI9Av82BxAoOjM0eHekk5s3XVBw053TAmN23wm+7TdChQtyQxG6mrTlL4DXZJfI9Xcau0
	g8fwPG5oBVeYfZzp6WLdcMNmp6QOBJ6LW6E3BkrOFqQqNbuldZGGjGhswiumPSwhWFj/s8yFgV9
	czwEMEYop4gBk5Ne+ZDVOc8+soROAXtspRiJLzvV44pyqJfqp1V2191guRpFQU/P3uz9svRx5Wk
	Xkg2GgfeUFw8rJ
X-Received: by 2002:a05:7300:238f:b0:2de:6fac:f666 with SMTP id 5a478bee46e88-2ed0a118364mr3139727eec.27.1777447742295;
        Wed, 29 Apr 2026 00:29:02 -0700 (PDT)
X-Received: by 2002:a05:7300:238f:b0:2de:6fac:f666 with SMTP id 5a478bee46e88-2ed0a118364mr3139710eec.27.1777447741601;
        Wed, 29 Apr 2026 00:29:01 -0700 (PDT)
Received: from [10.110.80.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1bf8e281sm1158944eec.9.2026.04.29.00.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 00:29:01 -0700 (PDT)
Message-ID: <1f803f25-5f90-4f09-8634-5f27946eb295@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 00:28:59 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] phy: qualcomm: qmp-combo: Add support for Hawi SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        konrad.dybcio@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
 <20260427214217.2735240-5-ronak.raheja@oss.qualcomm.com>
 <s6ortwyjjoq6lsxjjykbbshg2rczchtol4ntmxipcrsqufvsby@whwxtlnn74id>
Content-Language: en-US
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
In-Reply-To: <s6ortwyjjoq6lsxjjykbbshg2rczchtol4ntmxipcrsqufvsby@whwxtlnn74id>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f1b33f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XcaHRVNlpVRLYJM2DHQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3MyBTYWx0ZWRfX4MCdYd+iG1TY
 IHFwveBWGAWy13R8hEy5B0ye9qk3txuQp6LFqbdzP6KSE2mRXJ5N8bny2VQYCkTfJ2mIBKduI2p
 J/MQE8xSUn3LifxMcjU4M5DRipzUIYvfL75Z5dsRfe4/+JzjTdUeO9oPmwBulUxguLnlxM3IVBw
 cdNXRKdLfI7nQ4sJI/kwiyaXxJNTbcnFYHIfwsAXPb0me8CWvD/P2BC2CTAfOyBJWDOVwdyQsXi
 Gu1KCKFhMtqOA9MQ9tFH3BYzpqOKXeYaoiYQkmfF28KTrhBHhMUVHUSbsQIdCdU5neMvmXiHzxf
 U8DPGGQKX3CmMqFZ3WWWzAnsou5XMupdxviQCTPLsc32LtoJ+weyQdz2nbbiHyqQ2giiuDWWLCV
 cFeLpA5f3YR+smNQi+UMSjfV8j9JWM8DPuYzOR/ysMcrq2W65d9BuwOYmskdEggApMpcd08D+F3
 SEImEAg0rHWNyZfAPvw==
X-Proofpoint-GUID: h7wxqeMb9TqYKeMzkmIDnu-JNfy3qFYK
X-Proofpoint-ORIG-GUID: h7wxqeMb9TqYKeMzkmIDnu-JNfy3qFYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290073
X-Rspamd-Queue-Id: 3C41649084E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36673-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/28/2026 4:40 AM, Dmitry Baryshkov wrote:
> On Mon, Apr 27, 2026 at 02:42:17PM -0700, Ronak Raheja wrote:
>> Add support for the USB3-DP combo PHY found on Hawi platform.
>>
>> The QMP PHY for Hawi uses QSERDES V10 register layouts. Add the required
>> PHY sequences from the hardware programming guide and new V10 register
>> header files. Also add a new v10 offset structure to incorporate the new
>> COM AON register module.
> 
> Was this tested with the DP too or did you test only the USB part?
> 

Only USB was tested. DP support will be added in a follow-up patch
once the MDSS nodes are ready for Hawi.

>>
>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 231 +++++++++++++++++-
>>  .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
>>  .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
>>  .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
>>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
>>  .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
>>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
>>  drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
>>  9 files changed, 506 insertions(+), 4 deletions(-)
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h
>>
>> @@ -2198,6 +2368,7 @@ struct qmp_combo_offsets {
>>  	u16 dp_txa;
>>  	u16 dp_txb;
>>  	u16 dp_dp_phy;
>> +	u16 aon_toggle;
> 
> Are there (or will there) be any other regs? Is it just one-register
> space?
> 

The COM AON block has 3 registers: USB3_AON_TOGGLE_ENABLE (0x00),
DP_AON_TOGGLE_ENABLE (0x04), and DUMMY_STATUS (0x08). Only the first
two are currently used.

>>  };
>>  
>>  struct qmp_phy_cfg {
>> @@ -2705,6 +2895,27 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
>>  	.regs			= qmp_v6_n4_usb3phy_regs_layout,
>>  };
>>  
>> +static const struct qmp_phy_cfg hawi_usb3dpphy_cfg = {
>> +	.offsets		= &qmp_combo_offsets_v10,
>> +
>> +	.serdes_tbl		= hawi_usb3_serdes_tbl,
>> +	.serdes_tbl_num		= ARRAY_SIZE(hawi_usb3_serdes_tbl),
>> +	.tx_tbl			= hawi_usb3_tx_tbl,
>> +	.tx_tbl_num		= ARRAY_SIZE(hawi_usb3_tx_tbl),
>> +	.rx_tbl			= hawi_usb3_rx_tbl,
>> +	.rx_tbl_num		= ARRAY_SIZE(hawi_usb3_rx_tbl),
>> +	.pcs_tbl		= hawi_usb3_pcs_tbl,
>> +	.pcs_tbl_num		= ARRAY_SIZE(hawi_usb3_pcs_tbl),
>> +	.pcs_usb_tbl		= hawi_usb3_pcs_usb_tbl,
>> +	.pcs_usb_tbl_num	= ARRAY_SIZE(hawi_usb3_pcs_usb_tbl),
>> +
>> +	.regs			= qmp_v10_usb3phy_regs_layout,
>> +	.reset_list		= msm8996_usb3phy_reset_l,
>> +	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
>> +	.vreg_list		= qmp_phy_vreg_l,
>> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> 
> No DP counterpart and no mention of it in the commit message.
> 

The DP configuration will be added in a follow-up patch once the MDSS
nodes are ready for Hawi.

Thanks,
Ronak

>> +};
>> +
>>  static const struct qmp_phy_cfg sm6350_usb3dpphy_cfg = {
>>  	.offsets		= &qmp_combo_offsets_v3,
>>  
> 



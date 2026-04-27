Return-Path: <linux-usb+bounces-36536-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOUaCQRC72nk/QAAu9opvQ
	(envelope-from <linux-usb+bounces-36536-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 13:01:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0842B47168E
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 13:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17EA430197EE
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAA93B636B;
	Mon, 27 Apr 2026 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6WcaYDw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCt98REn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA6B3B6343
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777287573; cv=none; b=HBSRB3P2blVY1ygbKHkZJuLSr34V7QfK8UCBUw+CtV36XD49TGAkH/WVvwXE6tTm294Rz+qPVszAIgETod6wiSEjEdaRH5eNUSTSwxBvWj++JvF3bm9UjpRWYoiao9En2GMPDdHBRMh9lk1ysPPi2J13ObAYq8AerdA83gqoD4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777287573; c=relaxed/simple;
	bh=gksHzhz6jM2JMwAGb5E1ibHl4HAsMdO3XrDOeDM6+Ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HfLZ51oClyNdse6I5DxhRCtvv5QRZVJG8aac5fK6DsIErv4+cDvAswlDbEWWXl5fPR/f1XrMezG/bncKMahWd1Ucy1NqS1rqrKSwvgmfCQ4gV93kAV5+VVz33FZUwv8726+otR2Hy+x/6XYKF4YQHDjeX/kzHm6E5F+JDWZyleA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6WcaYDw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCt98REn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBQ41501470
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 10:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VkU+JJl/K8cKkgwkX7d5IDmAB4GLCezaNEtXZjr23fQ=; b=n6WcaYDwHAdycMlj
	sROINfH6SEgOcy1eR4owin/qzupXJxsjr2Le+YObTLfIvlflBSMn9nv+LSlM6Vq8
	8zaeEks3hMvrWqbf79nUAuqNb8BYJtcNqrZ5EvxM5ZNDX3JLZFvX4TQZkmL5klpr
	5ZL7bCWtMj8tpZS19VCaPUTqS1bMXU9gKzpogAVPlRT9sxmePd36abpWFDe2p1ws
	HHnDPq+reu2EPATvvgmJtPyxASDiiYPanBjGQVNLpPoTmewyHZVkma5M7mq7+X7e
	EXgnZUxpkUYnkC3PaId3HgT6wr4hMSEG7pVB+vQc0N0ZcXa0k98NrLRkO1Z1WkIB
	cjCjXA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrnr5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 10:59:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aa9fe6b6bcso11587146d6.3
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 03:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777287570; x=1777892370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VkU+JJl/K8cKkgwkX7d5IDmAB4GLCezaNEtXZjr23fQ=;
        b=eCt98REn9uB+lCzds0/vI02+4c8dFUL7/H6/cprc2H1JNkSJ5EQscNabONy+34o4qb
         Ug8k7XOzF87NdR8L6I3mDY6GcVRmRayHliGy2ob7hEWLQ1NtEtJGRxAniyvG0YNP7/cY
         trC9z5hIn4jokcpCHnOrsw45iR+CXR/RJVKZQa1uMGnCj9GMuukqalJp3zyBiYE7sY4Q
         MpJpqZo41SWE20xsPFmLAJj9n1wJ18xT64XF4WEwhsGp1IOzQ+M5BLrTkxD3kXq/19cJ
         aTGRPNjsthe4i3D4rcutnprb1qOnvJspVF119L1934g80ZlTdFm7FL14mqem/V6vD7we
         yZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777287570; x=1777892370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkU+JJl/K8cKkgwkX7d5IDmAB4GLCezaNEtXZjr23fQ=;
        b=Q4YuGTFTCke2RlzThDdTwXyw8Lp+f1r4o7YT02FNNNo+5PtbSCO0h7wTY94O7F1JGP
         1V6+LPfBLtqatsxJlEfMBo0X+4cexdEnw2mMmShmF5UH6SFGm5O4i99STvY0UC1NB4ia
         SYsczLLEXXHzsEm91ELpL4I0rWtBYq7OR42m3Nr+te0UNv9LVGht+5gGTO3cZu6jVXqw
         cBAuae53kMdyoDF/eJ+K3X6LMx1FgPt0tnIeBfdlQIPQXVMeixqatLVdrg4lLBxpj46F
         EoDZD/Lt4EjDUHZN68aBpvOfsLwRbJai/OcVJZni4LjxMnosZBR1ZfcGU2kLFeC9DNJW
         2hlA==
X-Forwarded-Encrypted: i=1; AFNElJ/lzhyA3SNynoVZGsWNP/uBvbvOiKl4oDYZiUNCV5KX5YIbBhHmPieQk3cMrffXle345AK87vqCK34=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWCP1DHVXguAtz0eyRGYxYY7Vox6x82jBznQejWUvW3tEDzfvX
	zp1t7PqImfnCxiqESZi1tRcI/kKRPxe6gMH9B4wXd7s9sLjzDXLSK91wEBaKQjrGCCI3Uxgdve6
	AY7XRWRSI0QT8vwBn3t7+9ddHvRzgjpIL33Z9L0cyyeVK7V4fjAznmaFrUX9pE5XVbQCM+vQ=
X-Gm-Gg: AeBDieuSmfijuftfhIaVoEacJfGgVijTNbplz8nDse/tKgZRfxE4Jwi8nQDvgxHK8ya
	Oem1bhJ9j6aEV76lPQOo/HM6lzVakLcHU8yZ1nq75qiA88CVZi0xw0WIS93hgnJPZladngVXAG/
	sDeiooB2TGWLqAU4R8n6eTEl/T4s/5PI2g3UB9e4wJ0sW3DZHwT1I2icHOrdYg1JV5HL+/4C8ib
	8J0C8X1ZOjdczFt3Ii4eS3CTeB1OZfVI/OlacYP+I+vDsgpUuXhHZXanb0Bjr4xN3mKS31lcbpB
	irRt/Ffxk3IYn/B/k+Syp9TlG3zWLR7Vd/7sVaFyB/hB9++VCUbpnRn73oy5oFPlPUFAggp3T+p
	Lqz60u1tFOy+m8BTaqMz271YE4hU2N3rBL3n1epjKYsoyWBOq2BS+bzY385rhxJasGlglkv9fu6
	53JuWC2FgFC/rMCw==
X-Received: by 2002:ad4:5b85:0:b0:8ac:b9e7:a95d with SMTP id 6a1803df08f44-8b0281482dcmr450411506d6.6.1777287569767;
        Mon, 27 Apr 2026 03:59:29 -0700 (PDT)
X-Received: by 2002:ad4:5b85:0:b0:8ac:b9e7:a95d with SMTP id 6a1803df08f44-8b0281482dcmr450411246d6.6.1777287569240;
        Mon, 27 Apr 2026 03:59:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bf00sm1082130366b.33.2026.04.27.03.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:59:28 -0700 (PDT)
Message-ID: <ba3674ab-fdba-4211-9634-610e10802270@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:59:25 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] phy: qualcomm: qmp-combo: Add support for Hawi SoC
To: Ronak Raheja <ronak.raheja@oss.qualcomm.com>, vkoul@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        wesley.cheng@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
 <20260425070002.348733-5-ronak.raheja@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260425070002.348733-5-ronak.raheja@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExNiBTYWx0ZWRfX6WqLxXokRM80
 Q+kh7qu79nyQ62hPPfzcImRiI9QmR3QasCIICVeib99kLPzoo381103mk8eXiyfxLU1ILwrO/du
 U6TjvR5AYb6rrdB65FBrFlKPgkvBxx5puqlx4mjp6WEMOEDxkDvIVeNq9xHsnQOlzIqDKteo4Tt
 1bmELRfe87D/vUzfrjgx2unhT368ROwXyhvhBn/jbXPl94m61MTZ4HA0hscKTLaKXzqj3z5Lmu/
 azbZnvL7hiPBbwEUg05tdRrr24n5lgC+7yeTgxilE07NrrRmsoc5mcn+KuB61fKwYbQS0DcCNL8
 f2kyT5twZqml9SeThZB7HtFEXf5up53ed70G0FlS4mhmhSQgyXw0weIykTBOif2ypn/LiTkOTaP
 /KPnztxeAhPK2aIOVsLOOjt54hfnSE0pCDq5gGsWxBxl+lMox7P5eqwm76bUo5v1qy6TEA8FjqW
 mydRpu7l+t9bhbRK/Sw==
X-Proofpoint-ORIG-GUID: NFb_5zZ_UDekGBDUnsBturSyxNNFbbI9
X-Proofpoint-GUID: NFb_5zZ_UDekGBDUnsBturSyxNNFbbI9
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ef4192 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1tJ3z92Lny5kRZNiqYQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270116
X-Rspamd-Queue-Id: 0842B47168E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36536-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/25/26 9:00 AM, Ronak Raheja wrote:
> Add support for the USB3-DP combo PHY found on Hawi platform.
> 
> The QMP PHY for Hawi uses QSERDES V10 register layouts. Add the required
> PHY sequences from the hardware programming guide and new V10 register
> header files. Also add a new v10 offset structure to incorporate the new
> COM AON register module.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> ---

[...]

> +	QMP_PHY_INIT_CFG(QSERDES_V10_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x27),
> +
> +	QMP_PHY_INIT_CFG(QSERDES_V10_RX_SIGDET_ENABLES, 0x0c),

nit: stray \n above

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


Return-Path: <linux-usb+bounces-36624-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LFuHvai8GlAWgEAu9opvQ
	(envelope-from <linux-usb+bounces-36624-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 14:07:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E594848DE
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 14:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B132D31D1B87
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 11:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEB43B2FD6;
	Tue, 28 Apr 2026 11:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i3PpFV6e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DXwp6Tsu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B51B3AF642
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376463; cv=none; b=ger3IbAE8e8Xq9u6dlN4KTWsBhuqUR6d0poXk36zEom/GgsUPmnwJchnD4ZgtkzJXtJ+1bZRm6rvVF2nckg3AuMclnzXdmGxbz0XIjlpFvvaPMDD8YZMkuTnlg4LdW8bDTbA90P6/yzv4zlr1i70QNr42/8ilL/1FucIWSHdbi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376463; c=relaxed/simple;
	bh=eW0LAkJt7c+5A+uqdJpHBrRAxyHFIfhww3+Djvafb4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ol22E4Rn0uD0SGwe0w7EySfc+qv9Ld1cYJ48aipJ5AX6s5FUSWsBwoYdXO3Qr1m+mrn+V30dIDzWtcaO+dwNDVPCqOGcG6ZFPyQxcf9+5MGtH9F+owxP8IAE4z27lPFIsXP15AF1SoPCyg6pvHNYlrqQdHZc5H7rKZD1R5J1eno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i3PpFV6e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DXwp6Tsu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA8RbE1329478
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 11:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LvoV2Ov1kpFw2uDF2NI6469G
	ftqDuPAXFKdWzhpFPuk=; b=i3PpFV6ekzQiMByIbNp9zdUbr7G7ATFlOiwHGPml
	2pKxFE/jzRqhrhx2KjI4JjgmD0Dv8Z8xRlMiXG5/UdjwHFjIoaC4u/pDcz5v1mli
	DdM3yxlL5rK5SWH5hEQPAZpCQmGRrF3RACX1/hoeLd/hfU3ddHxM586IZ19uq16L
	+blZ4bXv84DuAjffcqco8HqdgW0t67hts6veCq4qZTXqnL0TyZBopD27NxEh7nRe
	ptxXHU5bRKsE3Rgf4buyCJZ+ULikPfEb21SGGPvv4wyvY/ssdniaeMuz0SquYJsJ
	KCX+ThPQbU7SMEJUBOPq41JqRro/ST13poDPcOS8syzwjA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhahn1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 11:41:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d1c2289so240264551cf.2
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 04:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777376459; x=1777981259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LvoV2Ov1kpFw2uDF2NI6469GftqDuPAXFKdWzhpFPuk=;
        b=DXwp6TsujIytwelZYE3Y+n0oHqgaXG+2+qqetE+ot3U2AXrzQnvpdrhYNrNi1TM/0e
         aLi0mbJAnT1wOZkmJKfa8xVhLfntkoNVCLMkbEkv/7I1FyowhSVwCBJlFYVWERv92CZN
         jcy+Ip9aXr3V0ubV7+FENA1fSwqGSVDnk55Xrh/mFivLb2A6iW//9IKqbGr5gcdgl8hr
         YfzVTr3Ixw5T85bRBfpGPau5c2gGERbarUPDxPSdmr8geZmWx34IEKytXMUUflXyscgz
         yeDKt2vCad1Riif/RPubPN1K0Hi+nTlpC+ip2fGWns43b40K0YtCXCUWIErpR9/866tj
         Gb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376459; x=1777981259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvoV2Ov1kpFw2uDF2NI6469GftqDuPAXFKdWzhpFPuk=;
        b=R1L2Sf/dmzBqkvwaDfegehEMXTNkQZzjrpBQGIm5BrF17+fwpWBoIC51xtb9Wljfs5
         6uGgKBPLyaQkpd/ba47Jh8H4SYOaCjXWLbmafsNVWepBBir8Epil2L08WKrrwlgoujB8
         Kq66jjJsXoRvu8oJlFF6Sm4+P6oedAXP3Q1PLyjN3BkdzpQ70uP2+pw5nOtVctfXnj3p
         4L0vCiZRtMgUNuVSiXcsmR8jjvpsen2g63MH0Hs9wX2ghfvIgnK6259dpZ5unGXQ0Fas
         oHZPs7tljKRMqCE4eYE/gjq6BWitAEhhxhde156g9mMpOiQs+PGF71/MTt695XG2bLg+
         e+IA==
X-Forwarded-Encrypted: i=1; AFNElJ+ivVaGOYNycMTdWOgIH+sk9LjwiPZ/A09qEXEskTJ5+S5Q4OJyYkVhdzIiC/1LCCtTKJcBCLrH0kM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzz/5TJba9N1g+Yb+rIR3aIdnQ7U9ZqKX1MHAhfqyudfLMh4My
	6VC1YLOIu/MXX69h7qdL3GlYT4YP8zVBzHYQ8q8JfNKy6aOlrqBKRZR3ZVRz4WPPWa3F3dt+n8i
	b3mWIgEBJojMZt4kW74VfkHpL0Mx+eV7z5mQVKX3Lu1dOGFAustpRvAaMenRPpoM=
X-Gm-Gg: AeBDies9C+814D71sbB0eNDZJWRg9o92xdwv03xx7kEE2ycNDBzteR5qJx0l2Hmk33i
	+oORZE5yAHodl8Hrf6m2hGNfe/DYhL+2PgRXJNXN8Mo9tboRlGzqd1hHAY8HO1pbp/4+7HJp6xg
	W8Em5MeY9hx0RIWJmqRJzj7A7OHw5EvJN1ik6evoPDj0kRKYiPX07SBMPiJjhETRbmZaZ3qAjSN
	spU+H5eozkq+MbO0G4m7+sQS4o1M6cc9XNANYhsnJHu8hzyHe5P8jAu+k91CzNTNHxaV4Db2qzf
	CO+KPDf0haoNKxc0CdqMK/jFq6/CKHBXft1SQBilVG/s76nexyw/habQaSgwt6mj81CKClcZQW/
	Hp5d/W+TwRM5zKmAf7uDuD1nXTCG/VJXP/yALYZGch3w0Fli4wiirou/ph9PHxcY/y7g3ze+QdD
	nZhzEHgG3Dc50GHTrNvg/aaK9WcCS6dLio3Dg7eLrux+5Olw==
X-Received: by 2002:a05:622a:15c7:b0:50f:ca25:fb48 with SMTP id d75a77b69052e-5100e1ea5b9mr35845661cf.55.1777376459040;
        Tue, 28 Apr 2026 04:40:59 -0700 (PDT)
X-Received: by 2002:a05:622a:15c7:b0:50f:ca25:fb48 with SMTP id d75a77b69052e-5100e1ea5b9mr35844401cf.55.1777376457975;
        Tue, 28 Apr 2026 04:40:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7462ca617sm567782e87.5.2026.04.28.04.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:40:56 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:40:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Cc: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        konrad.dybcio@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] phy: qualcomm: qmp-combo: Add support for Hawi SoC
Message-ID: <s6ortwyjjoq6lsxjjykbbshg2rczchtol4ntmxipcrsqufvsby@whwxtlnn74id>
References: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
 <20260427214217.2735240-5-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427214217.2735240-5-ronak.raheja@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNyBTYWx0ZWRfX7+AXibb6RKh8
 fkNtOo0oIjEI1Ecvc7JQRV8zhb821INVPaOtkQRwboqDsYesH2YT4eeTxFe3iFI5Ur3MqOen8TL
 IeYpZtTNx2HIC6LU4jJbLYRb5yty2Y7GYWDDQ31TRRo++sJmKcqug7M8ElovjagA/eOXk3RitM5
 QveBTNmxox+wKKFIzYREwP+1481H/UQnqQeUFiMIPn/3iacVqtYRKnQyExlZ9n5Q1G0020JeMNB
 LtgUwTqQJQOvXKlJo5jlga2bKnFDfQ667Vbgt/wPLaNwqMMSL3IOsodS/uKJnmas0YVg6wngF/r
 5OgFlKm1uFKCZpQlgMWaZSe66YHXWTT/TXNuq+qwb2UBJZrOP8zOBMjSGlGK8fT2jzdKdnhNoqC
 4WPp4V1fmBkVBxT0M9ztTRTpRqutuBorSKu/ZlhlaLBXc5cS6S9iCRisQXxE7mnzPQm4gzYvURh
 zf6kGYbaxkRXfmtZlFA==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f09ccc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=REwqGe_ukdr-d6Ko48MA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: OGBUZkyLG7HBOK3sIdPIuPULqDV7XKpY
X-Proofpoint-ORIG-GUID: OGBUZkyLG7HBOK3sIdPIuPULqDV7XKpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280107
X-Rspamd-Queue-Id: E1E594848DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36624-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, Apr 27, 2026 at 02:42:17PM -0700, Ronak Raheja wrote:
> Add support for the USB3-DP combo PHY found on Hawi platform.
> 
> The QMP PHY for Hawi uses QSERDES V10 register layouts. Add the required
> PHY sequences from the hardware programming guide and new V10 register
> header files. Also add a new v10 offset structure to incorporate the new
> COM AON register module.

Was this tested with the DP too or did you test only the USB part?

> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 231 +++++++++++++++++-
>  .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
>  .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
>  .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
>  .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
>  9 files changed, 506 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h
> 
> @@ -2198,6 +2368,7 @@ struct qmp_combo_offsets {
>  	u16 dp_txa;
>  	u16 dp_txb;
>  	u16 dp_dp_phy;
> +	u16 aon_toggle;

Are there (or will there) be any other regs? Is it just one-register
space?

>  };
>  
>  struct qmp_phy_cfg {
> @@ -2705,6 +2895,27 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
>  	.regs			= qmp_v6_n4_usb3phy_regs_layout,
>  };
>  
> +static const struct qmp_phy_cfg hawi_usb3dpphy_cfg = {
> +	.offsets		= &qmp_combo_offsets_v10,
> +
> +	.serdes_tbl		= hawi_usb3_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(hawi_usb3_serdes_tbl),
> +	.tx_tbl			= hawi_usb3_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(hawi_usb3_tx_tbl),
> +	.rx_tbl			= hawi_usb3_rx_tbl,
> +	.rx_tbl_num		= ARRAY_SIZE(hawi_usb3_rx_tbl),
> +	.pcs_tbl		= hawi_usb3_pcs_tbl,
> +	.pcs_tbl_num		= ARRAY_SIZE(hawi_usb3_pcs_tbl),
> +	.pcs_usb_tbl		= hawi_usb3_pcs_usb_tbl,
> +	.pcs_usb_tbl_num	= ARRAY_SIZE(hawi_usb3_pcs_usb_tbl),
> +
> +	.regs			= qmp_v10_usb3phy_regs_layout,
> +	.reset_list		= msm8996_usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),

No DP counterpart and no mention of it in the commit message.

> +};
> +
>  static const struct qmp_phy_cfg sm6350_usb3dpphy_cfg = {
>  	.offsets		= &qmp_combo_offsets_v3,
>  

-- 
With best wishes
Dmitry


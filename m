Return-Path: <linux-usb+bounces-27019-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D59B2C177
	for <lists+linux-usb@lfdr.de>; Tue, 19 Aug 2025 13:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DD113A8236
	for <lists+linux-usb@lfdr.de>; Tue, 19 Aug 2025 11:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D17932C323;
	Tue, 19 Aug 2025 11:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwveoB+w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98331E4AB
	for <linux-usb@vger.kernel.org>; Tue, 19 Aug 2025 11:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604068; cv=none; b=tjzkuWBvtdQ/NlLe7xZ261FgZdtyyNLzyS96j5mG1Xhr0wJoGiwa/Sa5HdRpRXYpUmYLabOalnxAlL7iWD/LmscG6MSEnQqarAg5c38wghewjAO7hwbncKFztC6wpY6VVQ0ed7xxHkRYiu7DfLh+/VNKrEyiIkLQg9eGiEhbdpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604068; c=relaxed/simple;
	bh=a21opQrx6FtgjxLAH8msEDeK1LTD9NhoP7uXufEvrZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCJztKYuvoG67z+Vq70vaHOeXUvomf6R9qmUjYjH1QgevUxFPN5LRTvZnmfQsV4G1GAnmKrFtNF5qC6JsbUdeD9lu8KO5t6JD6NXnDwYF+iMqLyFVgT5Sr386vFF0XdPaNtpzUQgOfjdNr9R0AsuycvQhYd1+2SR6OdmpZRPkoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwveoB+w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90ZHD029801
	for <linux-usb@vger.kernel.org>; Tue, 19 Aug 2025 11:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eTLV4pbAiALqLWMe9z9+F23m
	6/Z57HSatoPEldwbxjY=; b=BwveoB+we/C98knvJ4KJIE+TpFVSfbPzdCUk6T1e
	sS9viKkbTE8osTL7y8p/imthlQwonXoE95UXx68uVipXP4QGdCJwmP9YyQ8Ujhlw
	b0UJrSEinRKtJN5+MSG80XO3u6cmKIcl8BKDHsnwkYcwW+bouG2zuf4joQ/v1t7Y
	H6gJk/ydtNvtMcvLulX3Pfb03SW4mj2hE1qFpD0NWuVPwhab9OAYfMh5d/leUHE7
	e7JzUB0jjgUR+lqT6Gpc9ZiXvd4HYafno5PloaWMhVPp9rnESCkebPRYwgT6zxlI
	ABcj1gErNhi3Uzg5uNZrgd4GIuU0JnH1YOxELZAKcB+oVA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mg8va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 19 Aug 2025 11:47:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109bd3fa0so59276171cf.2
        for <linux-usb@vger.kernel.org>; Tue, 19 Aug 2025 04:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604065; x=1756208865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTLV4pbAiALqLWMe9z9+F23m6/Z57HSatoPEldwbxjY=;
        b=Tji+/B3o4DvJZHDACAFngzadb/HzYzwGUXQ2X7e35VPVJbTnNuT+ZBY1OYE5oJXUNO
         GEyCGcey0QbVcr53X961OgzQVQAAl42zBAdHm2ARcf2f0n29YhA1k5N4uhIbWZMET4FL
         iq9nZKX2aJDhoSOmGYK95ohPbXFRlyPdSBXVXsM6F0wMs3UhRBGXnTUe/vZV76yfxtNr
         MJX6SntTAluAPRsqsqJGwtRmywDpPE68tktH/QbHlPizoiq1rOQAPs1CQMxB+R2y1PNR
         uGOH+s6zyF6JHfWTpoSvak2oRG0ctEQo5ZuyplYVDOtLrcWxUME2RGKq48aYfl7oi8Am
         mC/g==
X-Forwarded-Encrypted: i=1; AJvYcCW0CkNLLcFaGnVB7G/ctfQBN6jFiUTah9EDZNHFTlcSkNNHoZZ2Uq3kdgxfWdGbjHdQ2zv6Jb5lat0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN/ScDIC+Xi2bUePNw7O59F40zvZi6XQQbSdfBbVMgViA4EiWp
	TtFeyXBKPUdH55wX+jDNiQ7awQl064u0gn0CPc6H2fb0fehzmrabt5AYgwhuk+682AHTpkK9rLB
	TpdVoo2kxNlLbHWFeZanJ+kadBDQxZHNC646AJInLWeBXyGBAjTyfEOGlJXk0cew=
X-Gm-Gg: ASbGncuKEHemZgBMRIPAFYk4KaG3fYlEp+zWa27t5735miySFBTgzCViqxgKgzxLhbN
	ItCSVtRQheA8iU+UTlUZP46QTCIAW76qB1Q0VANrj8inwrdJYTIx78EYl3kiQiFHfoYdGjbYrD1
	NR/Ga+q0hCrXG9cYPxrsv5UTp0y37lPDTPIvE06xZCGk2DRghrnFAGK+b6jhuSE4wwQvXVoDgex
	SUqomYHm/cXKn3uG9EbrKegYYShHXInIQ6S3ACozOyMGU0WkaKtM5CJMyn/tFqhZtsMJXx/mX6T
	JvnUAMxxFx5KyB1ubwEGhbGNiz5XP2WCUT8Zvq7JYjjLA7seNrU4j6x57LUQQ5h2XYlEjjCSZT7
	KgFsYPboodpr3EBfwNaoURR++C4JjcyMsypTuaMtfqJ7O2TcVnEKo
X-Received: by 2002:a05:622a:4896:b0:4af:41b9:f66a with SMTP id d75a77b69052e-4b286d32b7cmr27661371cf.26.1755604064614;
        Tue, 19 Aug 2025 04:47:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUsM+R5H5wwSDp0LniUfNSxIvrGeWb7sj9B7rqdTJ3m7dL4JTwfKGIh+GVqeo5+ljeA2NF+A==
X-Received: by 2002:a05:622a:4896:b0:4af:41b9:f66a with SMTP id d75a77b69052e-4b286d32b7cmr27661081cf.26.1755604064113;
        Tue, 19 Aug 2025 04:47:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3ff916sm2047292e87.131.2025.08.19.04.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:47:43 -0700 (PDT)
Date: Tue, 19 Aug 2025 14:47:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: use kcalloc() instead of
 kzalloc()
Message-ID: <x2fao6hlzdis6pqucfqwrjtv7xr274cdkjpz2jhz7iglbpcbei@y3dxedn2diwf>
References: <20250819090125.540682-1-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819090125.540682-1-rongqianfeng@vivo.com>
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a46462 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8 a=KBxqgXywe9IIF68hBIUA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: fdIIlZepEf4qETyrJQXjg0gsoWxWGVFU
X-Proofpoint-GUID: fdIIlZepEf4qETyrJQXjg0gsoWxWGVFU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX6BT9XHAauMah
 Oq3rE2zrF+fBbPkAmrdOZd2j2d8v9dv7u6l0cvSC2bmShDtALMJK4suO1omTf9daj3Dj89q9aGu
 yQCc8ozovl3gPRVJ+P9kXOUrjT2aO13Dw7aOmfEDptirq3q7DuZHOpv61QlmQo9/yIK00Y56Ad4
 OGBRJlt0gatzNV4kQZ2+1P4TzqXoZ9/k50v3FcFvtCaVPPOK/+e+Kj76ScQaH7A1Dbzgudadx8Z
 +FrXH5p5l53oCrVJB7ZuwXmAEU7JjonLWAuvA+tb4MPkElotcVdciUwWogV8WOtnhpCBvfv51IV
 kznEnRT7+MPreJ+iGk+xF0TXP7sx68kIu2+XuMiJ361oicjWA88WNtDeKMCV2a5zIKcKRVqd3SA
 HALeQ02k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042

On Tue, Aug 19, 2025 at 05:01:24PM +0800, Qianfeng Rong wrote:
> Replace devm_kzalloc() with devm_kcalloc() in qcom_pmic_typec_pdphy_probe()
> and qcom_pmic_typec_port_probe() for safer memory allocation with built-in
> overflow protection.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 +-
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


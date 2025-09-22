Return-Path: <linux-usb+bounces-28461-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 08818B8FE29
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 11:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF8887A4B32
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 09:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB612F9990;
	Mon, 22 Sep 2025 09:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qq4XOYHG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D29213E9C
	for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 09:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758535127; cv=none; b=me0iKxuqxiykDSDG+0zzNQubyrS3siRrvaPUSyQABsV4RDHA8B2MnlooI3EmJB24oSMkoFhRwLaQH7yNxRmLbmEp+3fWZVJBGivvpdtVYULyLRlcljVmv7L69TkCPPzu1zWGJPEHkpaWMkapzCZt0RX7ZbCWW/mhQu9jE0/Fowg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758535127; c=relaxed/simple;
	bh=AsvAAT2u46FqG4eX0py+EYfURRCs48I+UGQOiRi3pRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIAuQOpwcjZm7LKG9EJkerMyLN42Ai51IaLuBoPA+JMza5XX8LLigykLq+QtAaZkK7EVvYppQ4+5rqmop73DXL2duDqh9Xca7V2ng2InIIGLOx9XQMNmjP6PMXobR6PKUWcYngGampH9CODPaQWcxGap28hvsgk4UD8ZLADIs7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qq4XOYHG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M9126Y015017
	for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 09:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IW9nZTpAUTWb9o/++g/7GLgt
	nAqVsaz6ptGNBZO+z5Y=; b=Qq4XOYHGcj5UjpfNhhWI+pS57JToMKI3A3wZj8UI
	e8VxbtMbKQqcnO3vgHJjiI1PtRXRLcdpXP8THPDyHLUVRfVFCnbLkmNwHpu89D86
	Tmx+/g5eHlLvK5Y+fdgcwQV9Hd0yvJ9Dm2vPkwNP6Eb3iblyKwO533H97yiCsNT5
	DjFscqzWPziW45E7jsvjglu4Eh0VVhx833W3X1UJFtZy7TbNCNrv0zXds+vCOiF0
	6OVB6ZsjxP+3gY5A2r3OnsuUzzWhe2z6In7YHB8EI9fzhifCEfeBHGnDJHLgswT3
	4DVBAqOwZYt0Rmw69CVPr681jEzwGz1pS0tM9EmEUndu8g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kkhmccb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 09:58:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4cdde949741so8520371cf.1
        for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 02:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535124; x=1759139924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IW9nZTpAUTWb9o/++g/7GLgtnAqVsaz6ptGNBZO+z5Y=;
        b=qJxXFw3Yky8Yawd16YiWR+lZ2RCIBomqSIGk4K5IPb7yXunPd9zNs6FjYMhpec8sMO
         VW6c2RnrpJG/bkW8QrMGLghMTyLEDiY9xu9si3WVoTyphk7K1QHgsszLlyd4tY4zeFRK
         e0/R7c+TxVhIIg+Ksc0U0qGpNAUo/TSdqylG9n7+CdIlEJTz+C4HCp/baunuv5ZpUsbw
         2ARObeId9g/flvnvqa+O1+YhYNpwd6BcoQytYtiNHsfHNfdHnvVJb7C1QJU0NmePAzTh
         ND70CMDtHnyOxSCLcRjS9IzqtrMHfiWfnkncisoqkm1QM+8TQW5eMqg38e0J4Ggj0bcM
         bvQg==
X-Forwarded-Encrypted: i=1; AJvYcCXYypyEmvCSiSePaRX+oKvnGDqKHGOuPjQJrqVNxKA8KjkZUhIV3Rm7G8NCWYHbckBZWyJQz04vg3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YykBT/DHjK6LmUKV9rzfbmYqaNA1HNeZAxVW6IrT1BGo71BakjJ
	ZI5NurC5Jxd9948DJvU/jgD5BAgQYecnsb6fktnD0iIQo/RuWTbzlAhwgRaHdNaNlZ5h3j1gqq5
	QFXbsQkp1wsnUTI+jxinBWCibu1NagTy2V4xFwKPOsWStrU5xWSiWzVHzd8z2ikM=
X-Gm-Gg: ASbGncuHy9nuSWBz8uJxeCBAOkhlXMlFoRS7qa4AgWlmhmCwnkb+M0D1pFQvopjXQDn
	n9T8XcGBwNAsmtlBAySoUJpLukTdfKRF8UBWsWX/a7cmPWs5daJZwaV2+2LW6bFFrasLkb3oYfj
	hpq7mXA5EM9MzRHx46rfYh/oI89nw/2asuKgJA9InaZMsyF0nVnExja7XCBPGICwiNd+90Ebkdp
	Dkbfv/EKySE4wIoh72+jlA5h1HXu3OLENnV297I2PqdXw3wuSD8O5KNVXdjpbZEnZFDw5nf2dJk
	s8wZ8yJZqoTLrzvRNE0wlPrGAx61juQjQnTzbEcsgkhDHyjGhZT0ETkJ/wn0qCiM5luYrpR7PQL
	32VmK07wpBtvhL99t0wek5Xxpc6tG11q5czGJG5qJNOyPyzUNpP1L
X-Received: by 2002:a05:622a:5c17:b0:4b0:edba:5a47 with SMTP id d75a77b69052e-4c073e88e08mr153124851cf.53.1758535124049;
        Mon, 22 Sep 2025 02:58:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZrkbJMOE8oi3lEYxkgH7mxWyV4vRf+Ti294a6hd808l4xFyp1mQDl/IreW2vbGpM6xLJBJA==
X-Received: by 2002:a05:622a:5c17:b0:4b0:edba:5a47 with SMTP id d75a77b69052e-4c073e88e08mr153124541cf.53.1758535123374;
        Mon, 22 Sep 2025 02:58:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f44b29sm3181298e87.24.2025.09.22.02.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:58:42 -0700 (PDT)
Date: Mon, 22 Sep 2025 12:58:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yubing Zhang <yubing.zhang@rock-chips.com>,
        Frank Wang <frank.wang@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Amit Sunil Dhamne <amitsd@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 3/7] phy: rockchip: phy-rockchip-typec: Add
 typec_mux/typec_switch support
Message-ID: <75xs2vy4pt7c6qtc4tmk6j7jdh6hdmbz73pkbv5e2ndid2gj63@nla3q6qdb43h>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-4-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922012039.323-4-kernel@airkyi.com>
X-Proofpoint-ORIG-GUID: Zkc9uHzxhpIQox0X56x_H1zsU94IPvjZ
X-Proofpoint-GUID: Zkc9uHzxhpIQox0X56x_H1zsU94IPvjZ
X-Authority-Analysis: v=2.4 cv=JMo7s9Kb c=1 sm=1 tr=0 ts=68d11dd5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=E19HVUzDLkS-Nl9glC0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfX1U7LN7BAI6mO
 C2XlTZvKGzeiH3pQYQvi0YEHcTRoo1J4Ll9313mrugPBHlOMkyAWPIcraMKyuPqP1qH45S3p+Ng
 dGZeetUZBiWkBy9wDOoXQNlYkcxlTj01zqXqJVhDn6xABTGsiEHrgFea4oABHY8i5f9w1cxpVED
 jJC0bek4999f4AvkUvQQlnjsPAyKtUkj0sd6hpGeFJfRorldHRLAi705tByn53EDKC7uL/zYK6I
 NulAWpE0FxM1xaZ7JYDfJ+FUj8WscArNz4efO63nKlHTP30ZDdlbFWXtxLs1+X2R5L7HcISC8Hn
 t6XFOfpPYk4s6c3RcYlC0M4tWNAbxn/j4PtqriTpBTbrNryaJwMB9tHkP9PO63AB3nF9of6f8lV
 XaSHTMZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200022

On Mon, Sep 22, 2025 at 09:20:35AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> This patch add support for Type-C Port Controller Manager. Each PHY
> will register typec_mux and typec_switch when external Type-C
> controller is present. Type-C events are handled by TCPM without
> extcon.
> 
> The extcon device should still be supported.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v4:
> - Remove notify DP HPD state by USB/DP PHY.
> 
> (no changes since v3)
> 
> Changes in v2:
> - Fix compile error when CONFIG_TYPEC is not enabled.
> - Notify DP HPD state by USB/DP PHY.
> 
>  drivers/phy/rockchip/phy-rockchip-typec.c | 365 +++++++++++++++++++++-
>  1 file changed, 349 insertions(+), 16 deletions(-)
> 
> @@ -850,6 +998,72 @@ static int tcphy_get_mode(struct rockchip_typec_phy *tcphy)
>  	return mode;
>  }
>  
> +#if IS_ENABLED(CONFIG_TYPEC)
> +static int tcphy_orien_sw_set(struct typec_switch_dev *sw,
> +			      enum typec_orientation orien)
> +{
> +	struct rockchip_typec_phy *tcphy = typec_switch_get_drvdata(sw);
> +
> +	mutex_lock(&tcphy->lock);
> +
> +	if (orien == TYPEC_ORIENTATION_NONE) {
> +		tcphy->new_mode = MODE_DISCONNECT;
> +		goto unlock_ret;
> +	}
> +
> +	tcphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
> +	tcphy->new_mode = MODE_DFP_USB;

I don't think it is correct. Orientation defines only the cable (plug)
orientation. You should be getting the mux events for the mode
selection.

> +
> +unlock_ret:
> +	mutex_unlock(&tcphy->lock);
> +	return 0;
> +}
> +
> +static void udphy_orien_switch_unregister(void *data)
> +{
> +	struct rockchip_typec_phy *tcphy = data;
> +
> +	typec_switch_unregister(tcphy->sw);
> +}
> +

-- 
With best wishes
Dmitry


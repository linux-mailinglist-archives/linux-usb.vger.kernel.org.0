Return-Path: <linux-usb+bounces-28822-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BC3BAE556
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 20:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC4C61680FF
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 18:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCB3279780;
	Tue, 30 Sep 2025 18:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfTmvrZJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09270258EDE
	for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 18:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759257825; cv=none; b=iHtDx4msS2wtnXGDHa0Jl5rzTDZxDjXW30NytY3cHOe3QwO7istYekuJ0/EgEFtifiZz4r4xIfFc9V2MoEYyH6YJ1jlVOcw2CiYrXGAksjPzbUNMRggAenEHEAFvx3T+LE2jDsbq3pabK2JCAbcDNHVcImkjluWW398x5Ge9mXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759257825; c=relaxed/simple;
	bh=FjCaxSo0gdGhvu7zeLMnYLhnP7QBFHb9v99tTue3MwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5556UUJU7nFcrwLq3qbS/vMzPRFSIL6jMKb4uUM9Ad6ovaTOriBS2+ZvDnFCU7L7X3MGGy/WK9y1LIOEyGRYME6YxdiF7ZAHEVefsCa9P5KVe1uRV8u9qDqPdSQ/kimEbZ7qnzJWbIupJL8h3R41Ipn4O80MFs7Z125l/PVNy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfTmvrZJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBa0Dd027376
	for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 18:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yGmiFBtk8zoxCM+T4HUw6+ZD
	+jra215LvynAxpP5vgk=; b=bfTmvrZJra+/oQZi7uhdBmbERNSFcTLqisqpazM1
	wiudlbDafBQKYQ6pepOJctTKpmrQZLScq2Ie2N7USskXBRMWD61lwlErIgXOMJN1
	qmq79ohKTxUDoPGobDLWT5bGi+/L34X/W9bxBGDsNwKUp93UaBDrvGqMjJxwddVv
	twZAAp/AyQzDTi9fCjHWxV2d2jpJzcZmPHSum5dzsj1p5zNaGphdjbtvdj3uGbsl
	syJVbQRAxIaMzySx/jd27fn8v+vpXiG3HM7OTe6rWRUwrdTQbojn/tGpr7OocZTK
	QsbqQ25r2ltFmYQHFm4C318tKfN+YNZeJSWJg4psEJRt3A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851j2cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 18:43:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4de53348322so172507991cf.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 11:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759257822; x=1759862622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGmiFBtk8zoxCM+T4HUw6+ZD+jra215LvynAxpP5vgk=;
        b=Q09hE5EbhfRCHr9Po6Fgcj4loyeyyCopNf90jLAHNVJDNqQQp8mVQBbcZuqsuhybab
         yPetolsz+tvuzIdXX4U/FLy/9oktB3LDnB15iPItmYnmIrp14bT3Dr98ouS2GlkLjLpZ
         KpxAipWwM+TCESsGUCaTszURlua8nZynuBPVi7P2K7ec+N85EyFaiBkQNOJYqNAbPm0B
         JbtIZsVhV9gZTucjxGfw8A/4+21B020PXGtWdJtOx0m4/cR32g9+1piwmHcIbGH00kFx
         6ZxutIhESys+W33o2PrgMNO3AaimrXTQdq6QTwlIeUUfK87q77ayUt77T3X0xK2Q5RXh
         fmWA==
X-Forwarded-Encrypted: i=1; AJvYcCUS664nUV3AHY3a1hk/zrrKY5uCapP8dlVvjUIV0kEXbcBLUL8Ej9lYuohRkVovpeH8F0UVmE0Al2U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0TftFVwco2NyaNiPxUq/EynLtjH7W7rtsKOGoNKaMfOUtPc5D
	ZNboj3dreZSnhv4F/V4yBVOUPk07gzQYb6nFV+H6J3Gcy5UhamY+TICL3qVWeAUu6r4MY4s1Xp0
	RR4yxy/TptW4BOqAPAS3+Wfh6jSJ12z0XUqL72Yh4WoAPpOlBPCUWpEChdnuwMqs=
X-Gm-Gg: ASbGnctodInfVBTJOFY1KZzJrBQzKolkwOimGV7f7W3FrNZ3hIEZ3ojRGJABeBN9jXF
	WXJqc91wITd3R/YKo3GlSDbGICTjJtazrwaOnRvkQjRgL7+pNbuyofQCxmdyj5lImM6flKS827z
	a4PJI3fDWCrJVPXiKqwDOaNHKlfW406uMdAb29UdKcgLEMQqQnIGvmKlc3M8cJkQ+U3luOAeDlM
	n+wYTNJSZFW2nQY18tweF6HaiojajuBtUsrmOkz78ZUqsZf+xfk2swG4CLARU3xcRStXv3aOIYx
	Y5GN6423+eptoy7LVgwYe8DeO3FamLBAo6n/6ElbX16Rck0ezNw8OKHNiZxW/HnJTuVBiAwoz6p
	XBnpP7czllBOYzeol/k74x8z69SgYE2sNJwOf+7Mt6cwYWLhHbcaM5+Ml7A==
X-Received: by 2002:a05:622a:2c9:b0:4b6:38f8:4edf with SMTP id d75a77b69052e-4e41ca1b2d1mr8343081cf.29.1759257821828;
        Tue, 30 Sep 2025 11:43:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVoTpyYZEYD5BDhL/ibzffyH63whEH/5BJy4dUuRPx4WpG/DtAm/AZa0wD/E68tizX2uBZjA==
X-Received: by 2002:a05:622a:2c9:b0:4b6:38f8:4edf with SMTP id d75a77b69052e-4e41ca1b2d1mr8342591cf.29.1759257821234;
        Tue, 30 Sep 2025 11:43:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831665791esm5232132e87.82.2025.09.30.11.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 11:43:39 -0700 (PDT)
Date: Tue, 30 Sep 2025 21:43:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Romain Gantois <romain.gantois@bootlin.com>, Li Jun <jun.li@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: switch: split out ports definition
Message-ID: <vwlshz5li23xlthn5delxwxdsdci5nc22iey3xih4qf5uhbory@clskdsy64xpx>
References: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dc24df cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=OOCT3r6X_P3o6Jl0E7UA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfXxIQS/F3oBBiD
 8soEzug2krjxXtIpa5NsEuv480OEdyS52nOtUybGAFifiEcjNzHelb8UU4OBoOptb+eEyxkycmC
 2lWzElnjd6sZi0QtIgYJRFyofMTK3x0ioGvapWTF1Uh9O5sgx5xfWWNA1u7mAVfxkmF0KEcrWKj
 IEEdr6INfAQU2kQG/zRQfe2ZQTEIzmhVlS/2MMPyH7FGr9Y8DFbz5id8p5lDvcGz316cXXdP+Fe
 /4fqIgnz20sf91uSlyfvcuck8VOcMYsH1ikiwNSEc1ApYPtcwb833yqY22NOnw74kLC6+CpeZGC
 9X4CbsW20Bwg2JtrZz071MNCjSSQj87FI35rr0KkFxDMcejOsbOvoqibTPMxzBw4fQ8hnhH/kph
 m+C2FbNOIZi/nG4DgnBKQWD54t7zVg==
X-Proofpoint-ORIG-GUID: dn_aOsTXAMbkIV9TAGyH8zukN6M5_Smi
X-Proofpoint-GUID: dn_aOsTXAMbkIV9TAGyH8zukN6M5_Smi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On Tue, Sep 30, 2025 at 07:17:21PM +0200, Neil Armstrong wrote:
> The ports definition currently defined in the usb-switch.yaml
> fits standards devices which are either recipient of altmode
> muxing and orientation switching events or an element of the
> USB Super Speed data lanes.
> 
> This doesn't necessarely fit combo PHYs like the Qualcomm
> USB3/DP Combo which has a different ports representation.
> 
> Move the ports definition to a separate usb-switch-ports.yaml
> and reference it next to the usb-switch.yaml, except for
> the Qualcomm USB3/DP Combo PHY bindings.

Isn't it easier to make QMP PHY use $ref for port nodes instead of allOf
and keep ports definitions inside the usb-switch schema?

> 
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/all/175462129176.394940.16810637795278334342.robh@kernel.org/
> Fixes: 3bad7fe22796 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/phy/fsl,imx8mq-usb-phy.yaml           |  4 +-
>  .../bindings/phy/samsung,usb3-drd-phy.yaml         |  4 +-
>  .../devicetree/bindings/usb/fcs,fsa4480.yaml       |  1 +
>  .../devicetree/bindings/usb/gpio-sbu-mux.yaml      |  1 +
>  .../devicetree/bindings/usb/nxp,ptn36502.yaml      |  1 +
>  .../devicetree/bindings/usb/onnn,nb7vpq904m.yaml   |  1 +
>  .../devicetree/bindings/usb/parade,ps8830.yaml     |  1 +
>  .../bindings/usb/qcom,wcd939x-usbss.yaml           |  1 +
>  .../devicetree/bindings/usb/ti,tusb1046.yaml       |  1 +
>  .../devicetree/bindings/usb/usb-switch-ports.yaml  | 68 ++++++++++++++++++++++
>  .../devicetree/bindings/usb/usb-switch.yaml        | 52 -----------------
>  11 files changed, 81 insertions(+), 54 deletions(-)
> 

-- 
With best wishes
Dmitry


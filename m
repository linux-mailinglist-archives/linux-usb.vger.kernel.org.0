Return-Path: <linux-usb+bounces-29165-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19698BCF883
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 18:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29F09189896E
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 16:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEF1241695;
	Sat, 11 Oct 2025 16:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFtwP9Uf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B5219E81F
	for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760201834; cv=none; b=TWnvBayi9K+YKWznsNx7HrAwzzjR1hkGNnd8Lw5ko9105BwlP5/yFl/tMflCTpTJ20PZ/SwO/8CLmiwiCnnjgNjRGntwpjRTiKA/JEqtDizQO4Wv2AGpQ8YO1+a2DuxLUi50UXRnUF3f0Wo9QolpJ7jZynyinbx7+4gs6sxCi3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760201834; c=relaxed/simple;
	bh=ubZ5obP2S7YNyso0NYRC7HlWeEc/ItiPs3nfk4GVzyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=am41hkzdt8SVJ4NJwpIpD2afKsnWqqSXjaYeoeS7i4e3xCZBvVSX3h32eMkjFyIRO5GTLcQluguGFCJlSVQi63R/C55viHX827qUqupguK+aq5U1hHuAZEB/TCUZffX4t7YTaYD8Tn5/dDUW7e2ZC0Z+vdl8t+kzO8GnWPXtsz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CFtwP9Uf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59B4eEYF004758
	for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 16:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xy1TDfM9Hn+Ss3qcAnJ0/lo5
	9/hSSLBS4fspMrOt/L4=; b=CFtwP9UfiZHiCGMUOw1deU4fP4xpIF+oTXGJDPPE
	tIL89PvjLtTf/YbkszSYepRnEDxvkn3PVliVw4u4TAkGO3LUgC/Q9jdUNZLTdGwo
	gmqHB9xnY0fbHRymvvggtm+gwEPtfxmvem0N1+J5zGWuk/yAZ8j913d3wv9kfqCu
	znuNTU5DIfxEgKNV/JyFbG1dm0iQ8kEDixgK4WteCdzXVvJp/OSPlJHWMT3v+R9/
	ROSpe+5KfOguZ+K4VVqtIUghzCUQklTR8lLvDJ5jbRIERbz+7G+oGIRc8RvjdGJl
	wqvtgyUzuJ6JXTrmQZv4RdlrXbiRL+GtUJw8xbEOEC6jEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfru3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 16:57:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8589058c59bso2538370785a.2
        for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 09:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760201830; x=1760806630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy1TDfM9Hn+Ss3qcAnJ0/lo59/hSSLBS4fspMrOt/L4=;
        b=eBj6Bk5NqXT9KCBOXuUeWS73yKAE39k0BCmI3ylcdCvmnMEbXRRzeqK5u/150GZSC7
         ZGbjzIV13g1LgtNUiPE86kWDgxPxg3C3pMyNc4YrwQUWsZniejKgvax0JrE9roDs7hoG
         GE4+iU24MMbP7az4e25DRUGRaOhjAHJAomt4Yg4jycBe8kygMjiq9uAVbpgqOEfqmAeG
         P0gVdVGiU+FCfSO4nihcDMr7el5ZypG0oYWdK3omBf0aEjwqjwvGWsV43JaAtJIvIL7M
         25dedJuvu2H9aIK+98cvbAiHMA5G1bFrtBRnAfKyaxJQW3AfkUjE2efmuGLGRakbGJdM
         ChsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkGi6KbdpjJpB6rS/p8J4waERBuEZcJCschjjO/3m7eqcao6+rJKLqAaAYL3eHln9ZqfR7psOJTDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpkF1CqnvodznHTyFEmD1YPE+oSPSnqqoB6PI0N8VjKWnVGbYD
	Cz+hCpQS26exgbwu+DQ+sLxHwdrq00VazSFecgqkWf95q1YgtKBAkQdIQI87YbRpk1rnqa7B9W0
	dpwoNoTW82fRv9OgTFNzOEePdipIK835ZpJ4srJMmvhir+Nl+Q2904sow+uZsxYI=
X-Gm-Gg: ASbGnct0tWAoQAtZpE0eU8mZp1g7JDEvd8dfsrnEQ/ax+o+lclDO/pGPYDvYCrYJlaz
	YvUWTUApPQKrrzupS5JV37Bf4izswgMRaAv6S5bqyJA1swvdahjaHq0pS+GrMyS5d4otdJ+AQEI
	TN975p4sBuI7HX1H7+zpnItzqkotHNcc9hVqWWTg1WbVhsi6RU1V9Zw+KEb2yC/VDQG57rnPXOx
	b1R4XLtuIdf0Jojf2q7LW6wHCxmtWoRTQ//bly2Yxwpu3Jzr4JT0EFzFlClHbRGSlO/ZBUSgHKD
	6LF9937HX2Dys00TbiSxQSPaAwZ3+oSKxwayMYDfQGpHo2ySynm+VvyqB5FQ19LzDJhlSBnZ8J7
	ghJ344FgO7IefAZ63wI9snY+Nis7NkbJFfnR1hnTmfGtI4KCx7eTV
X-Received: by 2002:a05:620a:7116:b0:85f:82c1:c8b1 with SMTP id af79cd13be357-883525c06e8mr1943888785a.46.1760201830214;
        Sat, 11 Oct 2025 09:57:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkyWtOfdJ+0TNDoUMTrOlJySqi8eotm+EQmXbUDmQfKpz1vM/MTeAx4339cLuXyfh1vmmWVQ==
X-Received: by 2002:a05:620a:7116:b0:85f:82c1:c8b1 with SMTP id af79cd13be357-883525c06e8mr1943885685a.46.1760201829687;
        Sat, 11 Oct 2025 09:57:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088577f2csm2081972e87.107.2025.10.11.09.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 09:57:08 -0700 (PDT)
Date: Sat, 11 Oct 2025 19:57:06 +0300
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
Subject: Re: [PATCH v5 3/8] phy: rockchip: phy-rockchip-typec: Add
 typec_mux/typec_switch support
Message-ID: <xbblw4jfte7re2pyroanvzqv4ddwhxbgcui5ubpnw7rwuo4s4d@gkph7jqzf33o>
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-4-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011033233.97-4-kernel@airkyi.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX8Q3qhvtU7He7
 AH4PzPbH47qhsXb43qyBhJnM04pwLg8lzF+LK0CoW+UOAyh2bHT4PDpysraGRZ5BtcLii3I+HTN
 c2JC11wE5Uz1d6LxROXGOWsiqihOP8cKfVexD/ke4qsONoF4jKp2EC3YLgCN7ARcpEYWa6d/jj+
 gGqA31/Rc2djAu9wnAj/Yugji9BNc1t1zPUwkfmwKx/97r3/PQ73B3sqTzqL9WtQL+9Bc/am05f
 yyz5ph3jj0jFLMXNqFuP+TLQ7xvIpF4RwmJEu3wE7qlHnpd4Kf2m4Y51AOcaYOEmkt87LLl1eVx
 KSAYyM3+vLlftBnqUhUwaee8+Mtfn1OGj7Sy9gOzvYL0kv85leuiCza+ckoL5NhTLAAU2gXs2y+
 hCj1+TqVjeiUtk/bT9lqDMIBOGKX7w==
X-Proofpoint-GUID: 8Gl4SpTq3avflah13o4QlRoTIXzs39JA
X-Proofpoint-ORIG-GUID: 8Gl4SpTq3avflah13o4QlRoTIXzs39JA
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ea8c67 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s8YR1HE3AAAA:8 a=MMthkAsgp7NQWkXk_3cA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

On Sat, Oct 11, 2025 at 11:32:28AM +0800, Chaoyi Chen wrote:
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
> (no changes since v5)
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

Carrying over unanswered(!) comment from the previous series:

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

> @@ -1037,6 +1251,89 @@ static const struct phy_ops rockchip_dp_phy_ops = {
>  	.owner		= THIS_MODULE,
>  };
>  
> +#if IS_ENABLED(CONFIG_TYPEC)
> +static int tcphy_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
> +{
> +	struct rockchip_typec_phy *tcphy = typec_mux_get_drvdata(mux);
> +	struct typec_displayport_data *data;
> +	int hpd = 0;
> +
> +	mutex_lock(&tcphy->lock);
> +
> +	switch (state->mode) {
> +	case TYPEC_STATE_SAFE:
> +		fallthrough;
> +	case TYPEC_STATE_USB:
> +		tcphy->new_mode = MODE_DFP_USB;
> +		phy_set_bus_width(tcphy->phys[TYPEC_PHY_DP], 0);
> +		break;
> +	case TYPEC_DP_STATE_C:
> +	case TYPEC_DP_STATE_E:

You need to check that altmode->svid is DP before checking for these
modes.

> +		tcphy->new_mode = MODE_DFP_DP;
> +		data = state->data;
> +		hpd = !!(data->status & DP_STATUS_HPD_STATE);
> +		phy_set_bus_width(tcphy->phys[TYPEC_PHY_DP], hpd ? 4 : 0);
> +		break;
> +	case TYPEC_DP_STATE_D:
> +		tcphy->new_mode = MODE_DFP_DP | MODE_DFP_USB;
> +		data = state->data;
> +		hpd = !!(data->status & DP_STATUS_HPD_STATE);
> +		phy_set_bus_width(tcphy->phys[TYPEC_PHY_DP], hpd ? 2 : 0);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	mutex_unlock(&tcphy->lock);
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry


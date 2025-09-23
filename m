Return-Path: <linux-usb+bounces-28496-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE41B93CD2
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 03:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D60AF1908050
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 01:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA5E1E25E3;
	Tue, 23 Sep 2025 01:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/oAUNwa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5A81DDA09
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 01:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758589972; cv=none; b=byg92Es4HWrh96tcWsjuI4KccNgD8EjzwMOLZCelH+DSVDFy+b1/IfCHixuKQZHpsNh6SpGExYrj1ygC4dxJMlYLGmQbJUnHAxLDN/zMukRhyFAlzcEPQL9LNvtVe3hb4CLIGIFaABABxLkDHCfcGmwo8hs1MGAP3rltQaHDqDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758589972; c=relaxed/simple;
	bh=0Ihn6jNs2bz0gPnWRWoUy+eYodJySBQGgVbqI3AoN+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewfqCu2QseAEjSlOF6ePw3ZWcBb24oWPb1n7Chd8CuLmSHhSMPBHbJX1eZ03sp79eRD2tHvrZGnvlDdSzXoiFOwE3fjAGgc3TPT/WldSHy5q6rVpeG1JRN1Sjpp+6D6FjDj/xeXjKX8pVqXpJulBeP3nAv7RqSDOaTtfc78gI+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/oAUNwa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MHZaV2008623
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 01:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sbAxWvwCeekeeUM4VZkkynWu
	aVVhVwplkcn9qevbOkU=; b=Y/oAUNwanp/8i/Q+2VUyIl68/RpkkET7mLx3+P4v
	ljJWg2/qAV1rTymX99LujG9ghxuiGxKTAdekIxKBy8L8K1KWfdO8wn1CcZvrWGwt
	a/I+r9PwxlfokT1t5hOa0UTGWfaoUMQLP0pwFy5CouAf4k+9MFfw7B2PFofQl2XK
	1CNh90y2zrTCQIgz9CkBiSerl+oBa1oI2rgy+EldK2cX6WLu40ZSD6t78MkU6zs/
	jf5tSPTeVf6WZm9V1RqwZDBBsR1ZW2wkMI0BZcPgp3nAwZJzEPgwxsMFzorBO4bL
	H6zExalqgFFFjjE4Un3U1OP4DQEDAh4yGLt+hmzi7xv34Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bb07h262-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 01:12:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-792f273fd58so89141616d6.0
        for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 18:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758589969; x=1759194769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbAxWvwCeekeeUM4VZkkynWuaVVhVwplkcn9qevbOkU=;
        b=DLDvV0RYKnZUaxgTeVa9Ww0FCH5HomcU8NKzP6iXhXsS5mwdmAPlZqht5+TDP9Qv66
         hCmt563FNy+HI6z0FiQwdap1r1Y3vTH88qy5LJWKUoOlAMU3QdyMQom/n33cxeFOZRLY
         Ksba92IStBOCYKdUbfGRbY/rdDQuiWOG40JgD+hBMcyjHjDVNAa3RfdguuNml4akResj
         bZmfVQI/iaOG9ZPA5Wh+h3Mv/q/SVyb7wXTMMI2qGJsCZaLYwjZ92uu0jOvibX/uRCOU
         147l+UnL9SA+FO5N9tRpcpsPqAXkipd1sB72itGZ+5HsAshDxY9ZbAqIAM3NiVhGuytg
         2Qcw==
X-Forwarded-Encrypted: i=1; AJvYcCXmN2uoNlYFTUAOq7yT7NroOCg4ZYUDaCJ0n2G43kXbSP6QprG/UdqCNwiOGfbQqEutIPThGnnrdjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgjPzUGv+ogbvEhHKeoHjIyCt/u3Soy/va/SCJ/oR8ARJfYmis
	kJ+dd/0uLWMHOKk0vNC4JlhC9jU4yOWj2JITTDpfa0K7i10eStJWnRfDwuJ332gQKTha0mkW0OW
	1wWI3CRjA5300ZWWCgYCW24Bp19rhVLheqz25TzWFjn8eZRHg5Kb53PUE9xivgm4=
X-Gm-Gg: ASbGnctDCv5B3kyENP8C2pz3L42MwaloFxJP0Gh5U5/x8zjLaGPE4IAaME2Ws7ZdiGo
	4M1r/S9fnKnsu5bFsxKFdJw13wfjTCUybVs6sa4QGdg9j+/aqCX2NEfhxtLbYVGdHC7W6eKcxIc
	hqpeiN7jffBjFcEv9511WBdoYvXRcPbRBz1Z/9ayJPiVa3bulf8KexTg7fg8nhsXnlEn+A+VdGB
	b/NUicgJ3SghWUdd/C63OHPtVNGos2krVgc75+fq40ImMoImvus5W0iVjvRc5TyxCp+nAw2rODv
	k9proj+UnjQN6Eav3q8ZKST++wR+LhO7W+mtoGHvHPSKW6GBeKsSTNJFLZbV9zUMlxAQny8FX1f
	LT2oEqhHn2C+sdTSmjbodXOfud7zRCq+QLgivpFEojAq7MUla9AQ8
X-Received: by 2002:a05:6214:4114:b0:784:bd2b:abbf with SMTP id 6a1803df08f44-7e705012f87mr8722806d6.24.1758589968762;
        Mon, 22 Sep 2025 18:12:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiSggGDRCsPU6/BaBSgPAIZ5+GwGUc8VAqZE9Y5TXkhtP0zAelL39yGsfxtACdIf0BhfPDXQ==
X-Received: by 2002:a05:6214:4114:b0:784:bd2b:abbf with SMTP id 6a1803df08f44-7e705012f87mr8722576d6.24.1758589968268;
        Mon, 22 Sep 2025 18:12:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57a8b1ed5c4sm2579538e87.138.2025.09.22.18.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 18:12:47 -0700 (PDT)
Date: Tue, 23 Sep 2025 04:12:45 +0300
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
Subject: Re: [PATCH v4 2/7] dt-bindings: phy: rockchip: rk3399-typec-phy:
 Support mode-switch
Message-ID: <eb6ogrepo5acwcj5gpdolxxyg3xrx7kz6zrbizzseqyavvitfd@cnzurelqeh4t>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-3-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922012039.323-3-kernel@airkyi.com>
X-Authority-Analysis: v=2.4 cv=HJnDFptv c=1 sm=1 tr=0 ts=68d1f412 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=KKAkSRfTAAAA:8 a=s_Y808Q6mXF3CJQU57wA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8r6vzTTUxVSSsRVZjU7yPx627advbaAz
X-Proofpoint-GUID: 8r6vzTTUxVSSsRVZjU7yPx627advbaAz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE3MiBTYWx0ZWRfX7QvT0IxCX9Ep
 1BLrxAeUyp3Ur5SCpcq46pMwmD1sKPjm7Ai67iYF3wbHAZFjuZWXeQ2enyLfok4seZVRiLJuuTh
 d1WoQ3/W5bh92yLGhx/3nWTWwfOz0pxL2rNPF/OCEp88haj9C9loGWJbTbAV+XpahT6scqjZ3xD
 xGL3w6eLYH9tr0FsLphSJprWg4QeKeddKTCK7HpN3zYclsiH275vSTu4Cch92BpGdcs65UHszFp
 q10/vUUntnL271JpurMrynnZMN63NEiYIiRK9r6FYyl3GeNQKZi2a2rvMX6EF7lNlDjiJvDt+pJ
 o3VKjjYlhfTG/PDHRRFin/8HCQaxy40NVRsIlCC8ri3u11Xbs9rU544EBdjyQRTY8M49GUgABcA
 iIFtBokN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220172

On Mon, Sep 22, 2025 at 09:20:34AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The RK3399 SoC integrates two USB/DP combo PHYs, each of which
> supports software-configurable pin mapping and DisplayPort lane
> assignment. These capabilities enable the PHY itself to handle both
> mode switching and orientation switching, based on the Type-C plug
> orientation and USB PD negotiation results.
> 
> While an external Type-C controller is still required to detect cable
> attachment and report USB PD events, the actual mode and orientation
> switching is performed internally by the PHY through software
> configuration. This allows the PHY to act as a Type-C multiplexer for
> both data role and DP altmode configuration.
> 
> To reflect this hardware design, this patch introduces a new
> "mode-switch" property for the dp-port node in the device tree bindings.
> This property indicates that the connected PHY is capable of handling
> Type-C mode switching itself.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v4:
> - Remove "|" in description.
> 
> Changes in v3:
> - Add more descriptions to clarify the role of the PHY in switching.
> 
> Changes in v2:
> - Reuse dp-port/usb3-port in rk3399-typec-phy binding.
> 
>  .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> index 91c011f68cd0..83ebcde096ea 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
> @@ -51,6 +51,12 @@ properties:
>        '#phy-cells':
>          const: 0
>  
> +      mode-switch:

Having the mode-switch here is a bit strange. I think the whole PHY
device should be an orientation-switch and mode-switch. Otherwise it
feels weird to me.

> +        description:
> +          Indicates the PHY can handle altmode switching. In this case,
> +          requires an external USB Type-C controller to report USB PD message.
> +        type: boolean
> +
>        port:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: Connection to USB Type-C connector
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry


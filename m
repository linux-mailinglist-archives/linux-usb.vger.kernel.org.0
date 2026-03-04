Return-Path: <linux-usb+bounces-34029-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOgzGArGqGmAxAAAu9opvQ
	(envelope-from <linux-usb+bounces-34029-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 00:53:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 203FF2092E0
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 00:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 438003052AD9
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 23:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010F0390C8F;
	Wed,  4 Mar 2026 23:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHnTZhnF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsK7qQ8l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE09B37B01F
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 23:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668420; cv=none; b=LAlTfYOdCcc20AchXG3ouGfIhGkijfWmIiWi+FKTgKoW/3LYtAk9/74D5g0PnHasXw2vZVmSGsk6mfc6i4eTeZ3Yqnn4XwUSjjGeijsmi0Q0ViziTZhIySLrEL/Wg/ENAUMZl7aI3FWOsVePPguQIz5ZK2VtKz8ivRJ/Lqta3MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668420; c=relaxed/simple;
	bh=hM0fx+PufUG+eR0kIJ1dr4h1ANr/zb80CpZtG5LPG3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DH6DjdPSSLf7v4BoX/3WDAwj6JOA0YI0WN50x1MXbhk3r5xajl2fmuFFuhiDPxEtN28MQfozOd1nSO5LoVzC1ZY1xvZ17dKlaSE+qgxKd55xKSfHs9FE2xXqCDr49gJHIB27g3RcBlxoJ+bEajSnoBcjZDZNrUZYNYLuDNYdzAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHnTZhnF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsK7qQ8l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHjno2611984
	for <linux-usb@vger.kernel.org>; Wed, 4 Mar 2026 23:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V50tlCURGOSWEpUNVC/f5JBG
	lAu9WVw1+uCs3+cXy8Q=; b=bHnTZhnFYn/tiIi8J4ULThpsgbab7UrmgW5OOJJi
	m7XwaAv8gzL5i/PPJCFmKWpARNfKhBWcj2eQ98Jty0ias+PktBjqdKCkXAPaELNj
	a0Gl+BUEEowrMPAKllx/ORmbxKvdbnv06gsWNMRC4vNwMWDRsN+/Umbybcd+e88B
	r/+5sfU/Jr5rGByjhLIWV29LUZnpLgy3RQf4wS6C8MkG2aHm4Hpng0Hc/lXMymq8
	+xAymHfPQW0I/zSIuwudwEu/Xyt9EGrksONWTgra0NIIeQgGca3xHZntcQ/B1uyx
	S9yybI9F7OtwJgszxO8ID4FgfjHXJVcqqpvfDRNL7lu1yA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0w91td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 23:53:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb390a0c4eso4707329085a.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 15:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668417; x=1773273217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V50tlCURGOSWEpUNVC/f5JBGlAu9WVw1+uCs3+cXy8Q=;
        b=BsK7qQ8lpgf4MccOs8W7P4/DhshR1Te1sl3mDVTFek6FHBU+SP+YnG91rAsMrSiBqI
         9ZI/l49Go+6X2HLBzEJuQUMqPhS0X21IMF5frdw7o6p9+WiUwihLtOucPB4UwcVB7gR1
         /TDtEKV+6eRrKNTjJVjUEslUBQ5NnWU/e9vVl9ATl97WjFl5qiYxpUVMnoDmE3yXf8Fl
         yGu1qjp72SH1jaPwdnfGvB4t6p8C23m19vvnRxN28ms3opiktg9gf7H+SBz7N5rm2EmS
         oZFO6InnfnmC0OlubIJXakoZV9aFBjmrxoeKGbrYw3Fk8nbvhs8RM2xp5cTA7BfjB0Ug
         XpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668417; x=1773273217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V50tlCURGOSWEpUNVC/f5JBGlAu9WVw1+uCs3+cXy8Q=;
        b=cf66RQ3rdYzx04twQRVtRHNjqQRalxnwOnruiOwUnZv4cJ/yQzazaALQzuYAHaht2j
         n+mQ2HysPy8IZUbVEqzFKd5Ya+t2n3bleZvW7td3atdnv1cIHp7c64uFMLtTc/nuQI0f
         dwvw4o7GvqGo8R/duvIfz2VpY9ynYhZgi7fp2Nl0H22bYmQTgamC/4D8prIYgOpFunbw
         Y3mG47NgRre30yAVcxAqgdAVQOuJ9tcANQXKSn+InFaGXFeLBOM1Wcs1s1xHk6bvPw5K
         aifTCB4zbwFoWg6UGq4ta4Kx2avfMsj2AHQk+wBlZesiueFG+weKXxLtjMoQCcZoP8yu
         RHsw==
X-Forwarded-Encrypted: i=1; AJvYcCWNnCrvkHY6ak9b76PwBJYidpcWmE3iY/ex8HCrskY/Pxa2C9ht5yWef+xDDerACvZFYWwMsmW1wFI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8OerBO2Ynshsxs0m94YnoSynAmTwIyby1193BrW5Zc+dHSjGV
	q+II/c+cmfrHBdmNMRaodQ9dbeFRB6G1wBBkQrXn6GLSDwATc7jyTaur1sYZxpus/m9+XR/C6yR
	uc5kcNcSKnAybkpQ+A3Iffz4enDGvN2v83up7AI2YV0YJHeqiTFq44yCOPKeEwp4=
X-Gm-Gg: ATEYQzyp8c12ikhihSal9uR5lFsz9+2wBAPFfHr5v278ZzuKDzdhkIZdAaJRbw4xSs/
	Vqvkgs82Xor5L7khUN4WkoqVe1EesINZ365Iu7E9i0FSH/DcSxOy5xV2Gruq8Zppk+V44wsv9UH
	0pW172q8Px5lwO5Ays7j1GcWsjld5YZqupLD/LJNga3dPLMK+3cOrwoiRtOWQjtmSw+GHNzNiLs
	v9xalrp41xq06YyP08V33G6M5QDNMa+MdZefI6y8udInPdg6s2wY+Xcp9WlG8AEgS8jHaQlRlYq
	lnMCxo1tVXXk+tlL6lGotJ5mxAejyPM1iMNf3nfWUnurMH0YPnZK9DIiGRMDU6erWM0sODHJJkc
	HNSHmGv8wDqzBGx7v2T3bJAu2xsjEtSr7k+D//w2edq6MdJ6ddPzsZr0YmUeYU2rGyMa2aZVlpm
	u/IAwnZnNr/j8pkARdH8zIUuh6bNt4j1LxGCE=
X-Received: by 2002:a05:620a:3727:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8cd5afa6707mr498608185a.59.1772668417053;
        Wed, 04 Mar 2026 15:53:37 -0800 (PST)
X-Received: by 2002:a05:620a:3727:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8cd5afa6707mr498604985a.59.1772668416537;
        Wed, 04 Mar 2026 15:53:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1296993a0sm933837e87.31.2026.03.04.15.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:53:35 -0800 (PST)
Date: Thu, 5 Mar 2026 01:53:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH phy-next 11/22] drm/msm/dp: remove debugging prints with
 internal struct phy state
Message-ID: <esbforcln7bi4e5enmgwqj7d63usdyoobxyo3hwd4paou56aoc@kjlizz3ubksd>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-12-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-12-vladimir.oltean@nxp.com>
X-Proofpoint-GUID: yxsY3dI2QkEJ7pA6gEna4_erSnlstxaT
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a8c602 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=3ogKHO_BN1K2bhpmqR8A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=ST-jHhOKWsTCqRlWije3:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5NiBTYWx0ZWRfX1fjDqMP6aO9B
 Xseg3sOpyLpcGSHxJ6W+34q7wolOv6y7jUP8cL9xFG6q0RUf5hRaOJgcycofqxMXPYMo9AaPdU6
 z234KtHTG0R+L2ytfs9PtB3AovROyfE1rffALFChBx4NeRMAdrKM24g+rc0b4fApfkWR1i3bo6N
 LOIkcg/pRn1Ct7oviJezCcUh/FmSJxmuNlV2nJ8ZWkBNDa+iZJY5QHvWgAeDfMULbpQ49/YGqsP
 4xAOdz6etyBRXXuW4ILSgdVilUmhL3eJwdF59bRqua3n9NapV4HJmgdJSjiIo6fjNvbOB2ZbKub
 wpo3SVmxDJq3SgVBGnqFzFANaVQHednnIZNnZ5NxZGGZ3bb9hByZhPE9QoDS/22+9lJ2ic6i3TV
 Miv2f8C79MGLL4QDJAVUD4AitQvUz5YkMn75/Y/0OR1eXppSDH4A4Pl/OWCu0TM2MylcSp5criP
 2e/PcYpAunUFD6rXPxw==
X-Proofpoint-ORIG-GUID: yxsY3dI2QkEJ7pA6gEna4_erSnlstxaT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040196
X-Rspamd-Queue-Id: 203FF2092E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34029-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,poorly.run:email,oss.qualcomm.com:dkim,nxp.com:email,somainline.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 07:57:24PM +0200, Vladimir Oltean wrote:
> These do not provide much value, and will become hard to maintain once
> the Generic PHY framework starts hiding the contents of struct phy from
> consumers.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


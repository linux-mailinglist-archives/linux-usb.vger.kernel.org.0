Return-Path: <linux-usb+bounces-37790-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGLHNLioDWox1QUAu9opvQ
	(envelope-from <linux-usb+bounces-37790-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 14:27:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0132858DA27
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 14:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C1DD13016DB1
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 12:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596223DCDA0;
	Wed, 20 May 2026 12:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEL3c5Pj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tdg5TV4e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCAF3A451F
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 12:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280016; cv=none; b=TG2wTuOWaLZCKnWv+ip16e14PgEcNKxnvxj2M2Dc700kSxlX+3ZeAifXNm+UNeGOVnwQiiKjF5GYAhGp9eY3TR/XSLJi5BLU+C7IuPz2YmV468LmABXhg/+M6FiCUm+ErjiIc8KZcby6MMPko+RrURP09Vmj25MxP2odUyw9Ego=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280016; c=relaxed/simple;
	bh=DwsYZ/L59gK2frARM4OpTutCsqwpRRPxIu26xmMRpGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAkfsZJzH0zKaMa0HDFujk2+KH7FbnnaUy6hh2KwIB6nubxzKV1BEB3xqatP+rXqd6+njk6T4JDJLnToStFVU/nbMeC9w+YB/Y08d5G4nwq8GN5lbfNAZlodLfb4xiE6vIdupEaP8aFK/KpeDE2GfPzdy6YGOvEhj6IRR2gmKRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEL3c5Pj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tdg5TV4e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZq4H3085785
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 12:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R2TeQqks38QIoyDMGjnlHZik
	TcCtv1Rua8ztzIrSGMs=; b=IEL3c5PjqWlF+XsnVNBCelp1TMrAsAl6meLx5Fpo
	Qr75sMcTLEqvMdOoHpU+OYtP9rhIOv8nIPX2wfHkYe4nimwsj6eonlhLInzGyoGl
	oVbmLIkw1KIBlyCCv2dRGadc3GEqceUukay8kCYuJCqZoEdQWqv7JKh3rokRh08w
	Uw9B+rDuloBd2LhhoKtrHOmBshYeaAUnYl5ZUQrOOdDMV4niA2Ik+YRqg/JSVkE3
	E569Mg7PhhYWhMWuS8uuPG91zGmYPDzSEjVVfHeVMZ/bqIpFWEmQfMJzWK0Y5oxS
	Hh9rAA455ZRtUUTKQxNd6bvmZcDtMzG4mGTNObVxK1Q1SQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f05un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 12:26:54 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95cfe3d4c16so9544581241.3
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 05:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779280013; x=1779884813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R2TeQqks38QIoyDMGjnlHZikTcCtv1Rua8ztzIrSGMs=;
        b=Tdg5TV4eAeEyrSF2FR1YNb7YlOtRqI8Ig2L/WkOfKMVdkxrAg9IQGEVCEgM8h/v8AR
         JdH+fkm+wPy/NMKltC6BXgxQG71sqR6TsDls6VW97b+2bvDylWVPZuDso8Q4R05NKDz6
         aEINzkwe7EhcrvCFSWCL036buA+7JXSBpsERJPDaRRqupdLWNiCGqAF+DjStVGMXR9lZ
         +R05f7IjJpWVWsM6hT7tt90IAb+W6tynhrQneZ1sUbcijTyn0fzZHEl99Dgus4CrGZSi
         ihzutamSMxraqucW+BhPsFx3s3L17WeHCn1hgOczzk1lTCSEQi+D4Ylr7qbo2+//eT8x
         S6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280013; x=1779884813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2TeQqks38QIoyDMGjnlHZikTcCtv1Rua8ztzIrSGMs=;
        b=mXLdJt4hrh9Xl5aij7j3gRseuIEuYXNCMXFnETPTzaBhNv6smnjw6Q8tenxbEY0pOR
         w0pUaeaA73TG/8iU/RTLTUpOePVswRVRPLdZcydJIhl3UiIQ6X6XtQzj5RWAnYo8D/da
         jYdp/QcmBkT3VDtuqKrWrov4KmG4UjrHecZWSTFCEBrXakayTBEB8dZOHDN/AuUjduYd
         od5KfjOBFuNX35pyfEJUVeVTrhfy5RRCrmD6/i1soRIiKCqaKonSJp8Ux/KTStKq8AOD
         2cAnUDuIYSAQWec+Mx6vNle6IOqc4PD0zpx6tTvHJ56+bAAbtejDhFC4Wut1ZHtH4x6r
         Sc8g==
X-Forwarded-Encrypted: i=1; AFNElJ/f6FtstnL1u4QXqaYsN9chdJOInfSzLAide/merl7LzIKLeV6Bl8tTso8q26O95/j9sWnZWmGgP6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YySYrjsktkpsx/3WCO+1L3SMKzSQmklNqy5ubK4NFgsBqBZxiLy
	U8PHudjNqL8kGOL4PBGO5CXfvqNEGavLcFSzk8w0vl0A/duDzKM//sYlXqyx1+d9ey8WlHlvV+n
	+ZbwTcuOh4LMLP7mmAALxFHeSdBmo7/dYUUnpK+v6TSmZhMYajxdRJzH6DIWFu2w=
X-Gm-Gg: Acq92OHZqo4fVGf31zElPcKB0xaiqOEg7XoND1ScJXsVbyYjVBmPl1rQX+ra3+mBTFa
	QGnfoYPImjjNQBEEYO2EAKtFNmZh5wy3nENb4XOsChWT+7up1Ufo+gsswFu/bUAULgBr9CcQP7S
	n7lNnhepVixqJ+onnS6hN2ELU1ibRsUeK7c0t/14BT9VjtvY5GnT6zSPNzXG4TcFSH/iHvvs4G4
	EoMvqqfSXkAcgdNQn+DMGRhjMn3BtmByngL3du/RCewhXWhx/kFVAc2+cxrTMZ4pWFJi6mLpU/y
	cU+SLXLgTxwkvFxzzxyigRHzRpB5hBd7j854iMjsBV3zzukoPeFr5fFvl/LVQ7whf7Rd1rAkTz+
	t2tisJKPPkzWyiu1fEUA62iRCKbrIEbnrlyt/vM4faMgr+J3xxGUOI/8UxKBGXu2fLwAvm0xTR3
	UF3x8aVUBresNkurpIxpUS4R7h5aGTFgG6iwk=
X-Received: by 2002:a05:6102:5e86:b0:633:d7ec:153c with SMTP id ada2fe7eead31-63a3c801ffemr13878897137.3.1779280013363;
        Wed, 20 May 2026 05:26:53 -0700 (PDT)
X-Received: by 2002:a05:6102:5e86:b0:633:d7ec:153c with SMTP id ada2fe7eead31-63a3c801ffemr13878848137.3.1779280012801;
        Wed, 20 May 2026 05:26:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a7a0sm4868217e87.24.2026.05.20.05.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:26:51 -0700 (PDT)
Date: Wed, 20 May 2026 15:26:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Message-ID: <vvlw4f6xo7krq3xoyxuoaa3tecrgduw5qlujp3qf3zzibzjesv@demhqzadavql>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
 <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0da88e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=6jUhzznPuw0D9V4-6sIA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: bize6OUwrgLrPzQram8D2OTnBP1Aq_OV
X-Proofpoint-ORIG-GUID: bize6OUwrgLrPzQram8D2OTnBP1Aq_OV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMCBTYWx0ZWRfX43sS3Ev0FSxG
 Hwrw6m+7d9F6ffUbCLRBBvjJQLcHOzG9B3TjCy5aLuWpjjZ80eLIrKJhnnutX3/G+2TpJIIseBE
 suo4u60eQE3NrGac+6/fGPy74GsBirVJhNtBiGMkQyWGw/Xh96P1j7/4PsLY7ixkWKhqI7c2ZRh
 5oymGdro44n/sdJA3Vih19KiaEIAVt9Pcu1PkqRdRzOpiltHB6xaMcbkimtwH2V1Eo97dK4ciCO
 6MIQ2iS8HWoP3a/gsM0Bz4L5T4Ezf51PTm9TjUyBo1Hc/3XgmqnGv2a//+Hspt8PS6Qs5qmeWJV
 u+hmnRh+CT7GI0zt4tUU6ceBKSCsb073hibYZ96M89rU3xqNC1UhHMBhRQjNG4gbk6CkK1Kk8dY
 fH8QMwNcKc0N43109GQsWq84OG9n3k/dQ6pFkjekbMYQ3O/+TrVdcsEnbtNlFMs6uX5u57CQF67
 mjymLO4SkqBMMmOVINA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200120
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37790-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0132858DA27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 09:23:21PM +0300, Dmitry Baryshkov wrote:
> The DisplayPort standard defines a special kind of events called IRQ.
> These events are used to notify DP Source about the events on the Sink
> side. It is extremely important for DP MST handling, where the MST
> events are reported through this IRQ.
> 
> In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> events are ported through the bits in the AltMode VDOs.
> 
> Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> events to the DisplayPort Sink drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_connector.c          |  5 ++++-
>  drivers/usb/typec/altmodes/displayport.c | 15 +++++++++++----
>  include/drm/drm_connector.h              | 19 ++++++++++++++++++-
>  3 files changed, 33 insertions(+), 6 deletions(-)

Greg, Heikki, would you please ack merging this through the drm tree?

> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 47dc53c4a738..edee9daccd51 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -3510,6 +3510,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>   * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
>   * @connector_fwnode: fwnode_handle to report the event on
>   * @status: hot plug detect logical state
> + * @extra_status: additional information provided by the sink without changing
> + * the HPD state (or in addition to such a change).
>   *
>   * On some hardware a hotplug event notification may come from outside the display
>   * driver / device. An example of this is some USB Type-C setups where the hardware
> @@ -3520,7 +3522,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>   * a drm_connector reference through calling drm_connector_find_by_fwnode().
>   */
>  void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> -				     enum drm_connector_status status)
> +				     enum drm_connector_status status,
> +				     enum drm_connector_status_extra extra_status)
>  {
>  	struct drm_connector *connector;
>  
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 35d9c3086990..7182a8e2e710 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -189,7 +189,9 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  	} else {
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
>  						hpd ? connector_status_connected :
> -						      connector_status_disconnected);
> +						      connector_status_disconnected,
> +						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
> +								   DRM_CONNECTOR_NO_EXTRA_STATUS);
>  		dp->hpd = hpd;
>  		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
>  		if (hpd && irq_hpd) {
> @@ -212,7 +214,10 @@ static int dp_altmode_configured(struct dp_altmode *dp)
>  	 */
>  	if (dp->pending_hpd) {
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> -						connector_status_connected);
> +						connector_status_connected,
> +						dp->pending_irq_hpd ?
> +						DRM_CONNECTOR_DP_IRQ_HPD :
> +						DRM_CONNECTOR_NO_EXTRA_STATUS);
>  		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
>  		dp->pending_hpd = false;
>  		if (dp->pending_irq_hpd) {
> @@ -397,7 +402,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
>  			dp->data.conf = 0;
>  			if (dp->hpd) {
>  				drm_connector_oob_hotplug_event(dp->connector_fwnode,
> -								connector_status_disconnected);
> +								connector_status_disconnected,
> +								DRM_CONNECTOR_NO_EXTRA_STATUS);
>  				dp->hpd = false;
>  				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
>  			}
> @@ -827,7 +833,8 @@ void dp_altmode_remove(struct typec_altmode *alt)
>  
>  	if (dp->connector_fwnode) {
>  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> -						connector_status_disconnected);
> +						connector_status_disconnected,
> +						DRM_CONNECTOR_NO_EXTRA_STATUS);
>  
>  		fwnode_handle_put(dp->connector_fwnode);
>  	}
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index f83f28cae207..e05197e970d3 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -91,6 +91,22 @@ enum drm_connector_status {
>  	connector_status_unknown = 3,
>  };
>  
> +/**
> + * enum drm_connector_status_extra - additional events sent by the sink /
> + * display together or in replacement of the HPD status changes.
> + */
> +enum drm_connector_status_extra {
> +	/**
> +	 * @DRM_CONNECTOR_NO_EXTRA_STATUS: No additional status reported.
> +	 */
> +	DRM_CONNECTOR_NO_EXTRA_STATUS,
> +	/**
> +	 * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
> +	 * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
> +	 */
> +	DRM_CONNECTOR_DP_IRQ_HPD,
> +};
> +
>  /**
>   * enum drm_connector_registration_state - userspace registration status for
>   * a &drm_connector
> @@ -2521,7 +2537,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
>  }
>  
>  void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> -				     enum drm_connector_status status);
> +				     enum drm_connector_status status,
> +				     enum drm_connector_status_extra extra_status);
>  const char *drm_get_connector_type_name(unsigned int connector_type);
>  const char *drm_get_connector_status_name(enum drm_connector_status status);
>  const char *drm_get_subpixel_order_name(enum subpixel_order order);
> 
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry


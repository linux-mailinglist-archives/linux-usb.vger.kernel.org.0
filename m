Return-Path: <linux-usb+bounces-36299-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB4DByq14mls9QAAu9opvQ
	(envelope-from <linux-usb+bounces-36299-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 00:33:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6542341EEA1
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 00:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 812F6301BAD6
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 22:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17293559E1;
	Fri, 17 Apr 2026 22:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXzhYDK1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWhi0eg7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77060199E89
	for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 22:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776465186; cv=none; b=fEEolCqN5SLPS5zXWV0sbdLUPi14NHRSvpPt9uV2qrhcBrUhjByf1TiQgyNns55N/yOwuR7L1iA1jddPisxL0nZiP+5yK/FLRM7pMbTACN7Vch+IPAH+AzHGzWdJwJ/A8Sook3yCK3F0JSQca01+xcch0X9bzQKrQ7eLwc9rukc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776465186; c=relaxed/simple;
	bh=wQZ0tTDHn84PyiX63k+ZH3JgZB05PqVX2G32NuUG7FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAHu4sGlKE3rnaORAvezXOkQGVkpWkWQJ4arLQ+TuZ7iZ8Ng4MTgA0JVXo1HJzGYDSPqnspmp+sLQHkf/R5+DnggldVsuAjZ5kRZqBva7+DXmXigtKQ8WdcdWlT8V92X/Xr8xjkow8XL4QFWKR4dWdRjMrqLz+9gw0a2ZK7lk1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXzhYDK1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWhi0eg7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HGML4I3190037
	for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 22:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TSEGKQzB1WAe4mG6RsOQMGtv
	hysGI/AKv3U5JbVIAVQ=; b=oXzhYDK1rSLLAp2XIHAVvLo4AVqqKnlswar189HN
	e+rnzd4BME96QgsFztG5BU63Zk4j9KXEQIVcmjKW62Fgday+sRMm+JAzN6ghiRE3
	qGy7XqnmhAb+dW6JF6f8mBCHJhY6uOzwvjvwHmQ2fvZThDOhhdt5pHzfFGvSFGk0
	S2+qFTh9QuNk9UzDeBYPyuGuCTkFUKp+RFM7tLZIN4r1X7e8M318vOz97z/C4u1h
	aUSUQedy+DVpgc6grFsf6oIw83sKg8qamfYAzbPTY3uivt3TAVkJvqtDjR0q0oQn
	DVCMtAKCPXWR2gl8TLA/hrybVLumaootglztDdTC2Vp1OA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkravgygn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 22:33:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d1c2289so28470101cf.2
        for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 15:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776465183; x=1777069983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TSEGKQzB1WAe4mG6RsOQMGtvhysGI/AKv3U5JbVIAVQ=;
        b=QWhi0eg7jDYF4yDvLvxC280010QInaaqrFQwOirZE5PAAZ73LbE14R+VUvPKqaCs6H
         5M7ts3ZhFMLHLZkqQXobKMbO5Op8VVMSq+JNwrB45AO2t/Kc8DaMdbOMyNrOszHynaUz
         6bkPA2YzqhnIO6t4dcsuunIzJLmlphh3s/Pl+/qE6XLfQTlU5qhjVX6pvMaOq8Zo68eG
         AlwysDWO10dCyBrPHy1yNRU4d2ehKSP4PsMFQQWPP6mZJFLI9ymoPGe9Vj/AztXSUItN
         He+evh2I4GGpAmtqC6nx1228v/+swKyGBHe55cUaYzgbloNR/6JcEXdhfXAXx+yG9Wu3
         AinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776465183; x=1777069983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSEGKQzB1WAe4mG6RsOQMGtvhysGI/AKv3U5JbVIAVQ=;
        b=NG+UcYnJv5LlusTzVBdOsBLUsjMvF+m1Pgo5yi5Dz8l7AXCod+je7M7gRInSgkkpXH
         x0NYOPcR/upKqmDjg/SE8KSE62wXmGlzzyhYEVNVIXbiWA4Xs6F48ft+8xgLdtm8WYjO
         Wy2CZuL7iFXi3Ms9yzSz8nbXWAepcVBp4Pe1F4q27XVgiINXtYRs3ewyufikOpIHkASQ
         xSxvu3ILaauXxsvPv+2W7fMBEMi8cjXq2olRLXQUAg1+mnlkk8PP4njTqob8IMxkGoBY
         ybF3XZPqo20i6+3gywahiCiLBJ+qW2qGUHRPiAiJ1IIdAYwE6yeDaI+PQlnxRr0z9m3T
         ot3g==
X-Forwarded-Encrypted: i=1; AFNElJ9GMLCqV69TKwNFtK5TcRCqMHZ09B5LC62II+ny3oDbvdJZ3pL628ZSEkbNaZewQqAFU/ay3XvpCc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK+8ebjCIqLrunaBL9tW4kb1/Sy+/pOju2GlT283i8W3CuVnQ/
	s0r2WA6fvDYeCROyscfpNBUH7lH2L/7W8ewTD7IpIIa9lSx1OfwgHBewsUHISTAGaHQyPjk4iyk
	lWI8kMc4yTetN58WouK3Etha6JZufeJmodl9A0szi/5dEpLuRYaaVgtEvOKgE4nI=
X-Gm-Gg: AeBDieu9onGUTt9K5i1wIDhXYiUGusvsy4U37Od+6O1XHpos6mzxDPMGziZGtW5rFom
	+guqOlBnFzrhpgrOfE4OmHm05RrbQLpo+pK9d88IBzFTE9O0Y4g3mPxEXQih94M1rh8M3jFF3oa
	PUdoUSMN3Lu0H7UXXf4xSJ76u1l94b7MGuC38PN97WPWCLIYGsdgO9zPQvnd8QvaLFQO6OicMKr
	wqkQy6iXoRwnYvVe6a91YyriJWPRbvGDwbxZEjal89RwJcJAqjOcCgLDB0eFlLE+dk3dTOFJ7Ls
	h70Q562WA2T9GrshPOqLrklmUSF6jLaib8XPeV77vY1/HBuXQGCi6pJQz4eMB2hDS00knIgEtFO
	8LnHXFpHtqkPSK1erPfmRE+KgGZpPQVEC+k8idv4lQfaOK2dIpX6cH4Cf6a9effK5Trllg3t+2h
	LWa2YiDi3cdr0EdUGRS5CWx5O35q7CCClj2/h3F4V+Y8YiEA==
X-Received: by 2002:a05:622a:345:b0:50d:82ca:7c9c with SMTP id d75a77b69052e-50e3693d29amr70717801cf.14.1776465182683;
        Fri, 17 Apr 2026 15:33:02 -0700 (PDT)
X-Received: by 2002:a05:622a:345:b0:50d:82ca:7c9c with SMTP id d75a77b69052e-50e3693d29amr70717191cf.14.1776465182179;
        Fri, 17 Apr 2026 15:33:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc297sm770798e87.18.2026.04.17.15.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 15:33:01 -0700 (PDT)
Date: Sat, 18 Apr 2026 01:32:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Message-ID: <6z572fdjkvjqvedifwvotgdy4lcrifiqvkjpnutousjqc6764r@zepfzkqy2kbu>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
 <20260416-hpd-irq-events-v1-1-1ab1f1cfb2b2@oss.qualcomm.com>
 <51b7c44e-36c9-461f-983a-eaa86eeb8cfd@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51b7c44e-36c9-461f-983a-eaa86eeb8cfd@ideasonboard.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIyNiBTYWx0ZWRfX346GqsN3bJXP
 0vgFWsnchLE9m/tjkMa7JpmS+LZ6XRDpHG7sfMo688itbB7P0So5YYs+irb4bomUcB6UTPwRGyC
 kHB8IkT5FKoh2M8/iMhQ9x1rMkv0uW3Jk+QEP5hjoE/lBTHMUSVQwS51gZHIZGyRODwPNAZjD+T
 /D2OFJ5/QfZOsI0BMq/glkdlzv0x6KEpU974frtLxGu0LP0czK4lKrrYCmaVTWttNzgTl2D76Ji
 +kqsLZZnaSNkkAWM75QXWIol8IWFHXgU0fuLjtXX6QHf6KIgkBuHfpLNCI5bXRg1vWBdFvDOoRu
 vCn02Li/zAPwKYpl/oOpSCUaT89EXOw5o79/8LIr3psHaJvk73BUSj8Qe7CjY3VaXFHYBGfqpkR
 xKsfYNb4mvGX9L0JyuIXcey1VOMM2bgxRz71e6LeHbTU2BxKF1p+5pPM/ntwKxaoAP3TDayd+gN
 1GdFva0Y+Az23gF6s3Q==
X-Proofpoint-ORIG-GUID: 52i20vgBB9uGsB2Egw4sJutKISTTyWxn
X-Authority-Analysis: v=2.4 cv=PIA/P/qC c=1 sm=1 tr=0 ts=69e2b51f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VTJl8P6_mujMtk0GPeUA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 52i20vgBB9uGsB2Egw4sJutKISTTyWxn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170226
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36299-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.infradead.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 6542341EEA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 11:10:03AM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 16/04/2026 02:22, Dmitry Baryshkov wrote:
> > The DisplayPort standard defines a special kind of events called IRQ.
> > These events are used to notify DP Source about the events on the Sink
> > side. It is extremely important for DP MST handling, where the MST
> > events are reported through this IRQ.
> > 
> > In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> > events are ported through the bits in the AltMode VDOs.
> > 
> > Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> > events to the DisplayPort Sink drivers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/drm_connector.c          |  4 +++-
> >   drivers/usb/typec/altmodes/displayport.c | 12 ++++++++----
> >   include/drm/drm_connector.h              |  3 ++-
> >   3 files changed, 13 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 47dc53c4a738..5fdacbd84bd7 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -3510,6 +3510,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >    * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> >    * @connector_fwnode: fwnode_handle to report the event on
> >    * @status: hot plug detect logical state
> > + * @irq_hpd: HPD pulse detected
> >    *
> >    * On some hardware a hotplug event notification may come from outside the display
> >    * driver / device. An example of this is some USB Type-C setups where the hardware
> > @@ -3520,7 +3521,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >    * a drm_connector reference through calling drm_connector_find_by_fwnode().
> >    */
> >   void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > -				     enum drm_connector_status status)
> > +				     enum drm_connector_status status,
> > +				     bool irq_hpd)
> I find the "IRQ HPD" naming always confusing, even if I'm somewhat familiar
> with DP, but if someone has mainly worked on HDMI, I'm sure it's even worse.
> 
> Can we define this a bit more precisely? Is 'irq_hpd' only for displayport?
> If so, perhaps 'dp_irq_hpd' or 'displayport_irq_hpd'. I might even call it
> 'dp_hpd_pulse', but maybe that's not good as the spec talks about HPD pulse
> for both short and long ones (although in the kernel doc you just write "HPD
> pulse")... The kernel doc could be expanded a bit to make it clear what this
> flag indicates.

I attempted to stay away from defining a DP-specific flag, keeping it
generic enough. HDMI is pretty close (IMO) to requiring separate flag in
Linux. Likewise I'd rather not use "pulse". The DP AltMode defines a bit
in the VDO rather than a pulse.

Anyway, if irq_hpd doesn't sound precise enough, what about "bool
extra_irq"? This would convey that this is the extra hpd-related IRQ,
but it would also be obvious that it's not related to the HPD pin
itself.


-- 
With best wishes
Dmitry


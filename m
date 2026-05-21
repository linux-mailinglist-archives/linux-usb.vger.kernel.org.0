Return-Path: <linux-usb+bounces-37874-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIhmC6L2DmoSDwYAu9opvQ
	(envelope-from <linux-usb+bounces-37874-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 14:12:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3206C5A494E
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 14:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E8003070483
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A923CCFAA;
	Thu, 21 May 2026 12:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESUcJTqf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qd3TkkJI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131153CC330
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365120; cv=none; b=Dq7cBRqnADfrJj+O0kl4nqsbp8ZBl+o0+r/mIZD7La0abe8vR0XAbf1/kSjAJV3AvGKLqAa8Ju1+Hqo5QRPLLIx6EMItVJdR1DrQOyUmP7pjDEjjmOKEakxnqCA3lurUEw0o6xhjvNk8EuIiK+KC7r/48X3F9eZTrh9EQy+54MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365120; c=relaxed/simple;
	bh=aDJZ/psOnxlQoTunQ0xGwmeeVaVR0FDflrKKkbX0p2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5qVWp0M8ZefX1Hwt9Top1mjLR6vMm9N9//k2n9dgjHwH9axPZJ6TfCnqMPv6BZMDb1xMg2OtQNgNv4n7aSVflwFzsrbfP04lvXTcbmarpD1MhAfILOY6Q9ZVr6Dv/Y3TYP4LqrjcTdUNOKe3yYBKsSuC6sfjRnqh0DBCrlO0Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESUcJTqf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qd3TkkJI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99xfH2632696
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 12:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pGY+j87eohBlWubIX+vUu3zL
	xCM+uB8O9JAB1ecXkdM=; b=ESUcJTqfqAtQySEKLKp7KIRCaL9t+erTOvTDfYVG
	fOBbLyDU9ErXoWLj4r4aG9s0cSsb8zoRyM1JEXHKMO58+5AlNlIqYhVm4fJDnyg1
	cl2sJsIct0JQnB6xtZiA/nkLgshpE2ZJ2d8TMb2iE+jiPVc88/YLy+/uMALyWJcO
	EFiCMzn/yB2f4Oj7+vhyZdRM7OScqDwli9yLV5lCf6V/2L0HFXQP/129g+4Vwob2
	zmgClDrJK6DrYqqGGbrsnUTeIGoXHc4aGqrFVjT2e248jtLQepcXVGsiUmf9Vdb9
	yl1pamahY+nuPtJOIFtAZJqeEnapAvzxGfzSceLlDVUI8g==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8cvnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 12:05:17 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-43a55fd90faso6607490fac.1
        for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779365116; x=1779969916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pGY+j87eohBlWubIX+vUu3zLxCM+uB8O9JAB1ecXkdM=;
        b=Qd3TkkJIRKzZHlPVpj0MUejLYH5IWGx6iDlpJkwRRQOhmUSRaeqMjY03/QXxoyKyay
         1ob05LXFRaORTHTNIVHh8Vk2wj8Ttw8Y7vkKNzq3mGFiJPBGp8T53w3FaXnElizmYU9S
         OWG22ux9FLelOrYGCIX1cGDNO19BZBBTS18jdgCy9ZPNnjZpA/GbnoNSPulu08bEXTfx
         /5our+DCWxdfQ6NzbEqm0wIsPLguVG8b8a8Xs+D5XXwWuWqJCTDH6uCCdgPNc4ZoZb2u
         yVufo/uwmDyvYolgor/vKchEtuYnpavvR7sqhj02WutSF3ltJSi1AI+Tjg+SVQOWaoOp
         Eoxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365116; x=1779969916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGY+j87eohBlWubIX+vUu3zLxCM+uB8O9JAB1ecXkdM=;
        b=khq5mMfyGDwKmeT5eOrS6qISgy+HuFthEr/LbbqSR+vmMZg/In59MV+WRNxSVYdapQ
         HCxkBNQNi/zbF46RZ+PqQjEgjS2zip3TDcW6avWH0yf7W58CpCUalB7Pv1tKQb4oCSca
         2m1pr2WJ8bS+G1OzENJ8GyvG4U86jm2vK68l4gu3ZamSBrzBtqF6aJIHjWMSAzdFEfG3
         MI+LiY7RwBzKlK3NKQCx68gvPcZScMBlDIgX6sLgU9zvIbR/J7Lp5oS/cU0jRXyNRfat
         2XUrmZzR26q892UxGdSGs46h6HjJM2iD5O1gg0VJIVY/PIHlQzMGn+0OXr4T5MISRlSt
         WRCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MZFoWdQaVi+tFgqQIVSZJaMXOWj7cg/mBtLw8Ts0OFMNeZpUyq/hxnGU8soqBPFztTd8aN56PNyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YznZCCdFKDb+avELFSfb+Jy/oUmCY7k+eJTQx9/TBs71YXow15p
	Iu8J3npZtdKfQyrBtm1v8jvB9/UAOn5AMf1C7psISrXQwlWt+DbzE4J/+ihJzK2NgRQySccD9bA
	LrqZZYJ9lTOH6rpsq+GOIexpXmIJeWt6fbevKy20pEcCSU6WseU7AP4WuKuOOv1w=
X-Gm-Gg: Acq92OGMUF5N2kzGSulFSh9+WvpMOCCsFeX6DCDmpQuCUc35b6fIi3YJTqYbt51FV8w
	eXpaMScGux1Q9noIK5ypyrkI1F8dN0rdsc2uoZUU/ieTJ+IhAIuSP9Z/kYfBhVvxcsihru3tgrF
	mfRdJaEzxg7kb9xmY/pvcpGyvKR8w2bjGTLpG1nWNJs2SaEytM3Wboab9kZPl9ktfOW9wccfLrb
	6gRcCVA79VDm91UuwQTeuepb/fc2Nf8u+DOVAnja2qA77Rq4roosLGuRf+8Q+vzYFZXZjxZ46+u
	JCYVe0exXKQwWjJcnoQKCulgHBdeJI8wNbm1zm0Of11GQJXRsWcISjnPl2iqfrkcdWPjVaReOGV
	WQPogqeRDgCufjYbSiSjTjp1OMbtxYpeQHvtig9HvUwLDAOBSNtUkxEftrZo6/D0ocicnyoXJz8
	y+L0VyVzQudteB1JiW8PbaP0UOiX6o9XPhaJA=
X-Received: by 2002:a05:6820:1348:b0:69b:bf80:2db5 with SMTP id 006d021491bc7-69d6ef409f7mr999575eaf.52.1779365116324;
        Thu, 21 May 2026 05:05:16 -0700 (PDT)
X-Received: by 2002:a05:6820:1348:b0:69b:bf80:2db5 with SMTP id 006d021491bc7-69d6ef409f7mr999560eaf.52.1779365115873;
        Thu, 21 May 2026 05:05:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395d0a107afsm2201901fa.16.2026.05.21.05.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:05:14 -0700 (PDT)
Date: Thu, 21 May 2026 15:05:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Message-ID: <vpd5hyote5wspmlpad64kf5peoy5g7wv6c7xjn6ammcmjtai7r@q2tarmr5aoqn>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
 <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
 <20260521-funny-astonishing-mackerel-cc5a01@penduick>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-funny-astonishing-mackerel-cc5a01@penduick>
X-Proofpoint-ORIG-GUID: naiLGa5RoPXkz3jiOin-DJWUdl2-RMxK
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0ef4fd cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=mRF-X4ptvIx_UuOgb7IA:9 a=CjuIK1q_8ugA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMCBTYWx0ZWRfXxfLYnm0rDg/Z
 UhFOORi8gokwGgPUjanvG7xWOhKh5KBrAmXG/6NdBnLc4nictJ5EwuiiiW2XQ5sICzVr3wV42iZ
 FsFa5Zz3UVgSc9ruOSU19Fi86Ub6dDX3Tsm31FNmRJR2H74f03OORt7oDd1myt5E238hbmTGBfc
 R4Zzfa1C12PbCCQ8Sp/JNCQ1EtvRB38VamX+3PGkg4KT6GHZjMaAUFEDT0pu4V5KUVBFIJSwx9U
 mbfcWkiclKhSJMnhgZmSefWBxdwVaLTtlV1443U/Q/QeZq43uN9DRxgk11XroramEtc3vLFvDTy
 OtPmomWjL7LC599H/tb+S1b7lE2lkGBuWKENkEH/4vYzJvvaGVdFqvIVXAI8QPJaYHKPLCjHujx
 j1IlV4yi4oryUnAsEwllczv7mQEZxDD3+YO/K4WU4DDsRgyfNdZn0C486H4arYcVBBZmjTdhHaV
 HWiqpfJmyjZ9qemrSew==
X-Proofpoint-GUID: naiLGa5RoPXkz3jiOin-DJWUdl2-RMxK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210120
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
	TAGGED_FROM(0.00)[bounces-37874-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 3206C5A494E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 09:47:29AM +0200, Maxime Ripard wrote:
> On Wed, May 13, 2026 at 09:23:21PM +0300, Dmitry Baryshkov wrote:
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
> >  drivers/gpu/drm/drm_connector.c          |  5 ++++-
> >  drivers/usb/typec/altmodes/displayport.c | 15 +++++++++++----
> >  include/drm/drm_connector.h              | 19 ++++++++++++++++++-
> >  3 files changed, 33 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 47dc53c4a738..edee9daccd51 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -3510,6 +3510,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >   * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> >   * @connector_fwnode: fwnode_handle to report the event on
> >   * @status: hot plug detect logical state
> > + * @extra_status: additional information provided by the sink without changing
> > + * the HPD state (or in addition to such a change).
> >   *
> >   * On some hardware a hotplug event notification may come from outside the display
> >   * driver / device. An example of this is some USB Type-C setups where the hardware
> > @@ -3520,7 +3522,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >   * a drm_connector reference through calling drm_connector_find_by_fwnode().
> >   */
> >  void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > -				     enum drm_connector_status status)
> > +				     enum drm_connector_status status,
> > +				     enum drm_connector_status_extra extra_status)
> >  {
> >  	struct drm_connector *connector;
> >  
> > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> > index 35d9c3086990..7182a8e2e710 100644
> > --- a/drivers/usb/typec/altmodes/displayport.c
> > +++ b/drivers/usb/typec/altmodes/displayport.c
> > @@ -189,7 +189,9 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
> >  	} else {
> >  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> >  						hpd ? connector_status_connected :
> > -						      connector_status_disconnected);
> > +						      connector_status_disconnected,
> > +						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
> > +								   DRM_CONNECTOR_NO_EXTRA_STATUS);
> 
> Since the extra status itself, and what the options mean, are DP specific, do we really want to
> extend drm_connector_oob_hotplug_event()? I think I'd prefer to have a DP specific variant, with its
> own set of parameters.

I can try arguing that drm_connector_oob_hotplug_event() is DP-specific,
there are no other users for it, only the DP AltMode driver.

Anyway, do you just mean new API here or new API and a new connector
callback?

-- 
With best wishes
Dmitry


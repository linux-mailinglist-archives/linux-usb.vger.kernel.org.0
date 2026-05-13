Return-Path: <linux-usb+bounces-37417-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODG+IyTCBGp7NgIAu9opvQ
	(envelope-from <linux-usb+bounces-37417-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 20:25:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE02538E57
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 20:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 232063019D0E
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC063AC0DD;
	Wed, 13 May 2026 18:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L926dWnb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJjem3Ly"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CD43A8736
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 18:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696649; cv=none; b=QDEQ0CX3EWxwlAFgppfYv5wjeaak2gykP1QSvVdewRa2qYC4yqeefBPjLjFKQTMHukWfoR4e0RCxuYPNOrAy+PtjQA3uOdh5syCAWnXo8K8B+BIAeKJxWzzQG4ArqyUsCZo0bpBBZN+lD1kvHyO/yP5KND77VfzzknE3ZdguPzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696649; c=relaxed/simple;
	bh=+/ILvBuGhqekKhSlkO02babbVbDbrJeHq8l4XOhAwlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XSL5P/RPpht1uiXnxLb9/wKEzTraNDBa/dH8V+AxN6d06evyWSSTSZLtZYrgcC5dOt5Jrhek3dRDNHi16kP43/MMHDoWjJNSl6dGlALwT311we2ze8xeTecnOFbfrVezLY734RF940WqR1HOsyMXtSfJcpOjk0XdzEnXv/pi1DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L926dWnb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJjem3Ly; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF3pfF3474757
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 18:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=; b=L926dWnbrlNFEaqp
	srzRYuP0cO0M8CQROQviJ240OwfSEfGfQkjbDWjadxTXeUGNt9JYCz2eOPBXiVMi
	reTJ/PRQJ9I7gmqRo3iKPD6xxNuzJSjsU5HEUsQFY6Vl9KFE4wO14tlNEUuyvvp9
	BV1Q8J/d+hIcdRBvj5Vwf6AwCWTcEQBgR3qPxVBpRg7PbOWMYZaSgsZJh7w+1yJP
	juhymAF7rJU1/fKM7YlysCzzyUCQMC1mZua8c9pmeUD6fi4mdDcceyHTwYp2x1yc
	x+g+3i7jbjZ3Lsljj7CqG7gPLkFr0h8+ay6DFmGE3wnZyULseJ2QoxdDEd920u5L
	ODmvYg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p41a8ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 18:24:01 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-636fce7dc8dso1504234137.2
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 11:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696641; x=1779301441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=;
        b=YJjem3LyQP+H5R5nLnq1osNsQsfvEGNpYAsJWdbx0fTbacft8DO/BUssuor22Hyza6
         W7XqfanT5zWJrPgNyEJB/1jxb6CyB2iHLW7KFM+KpTlUk5DKzV7s/zIusRbpQ3PKodg/
         5XWcj9zzw2bf9KfyilX4FKDTjQeB39/3tT9ZqHd41uigC1TKyElWBJQpftb8/uyEOeqf
         8qT2WnwJad+Qz1QPJS5uBemkbAvdMQWwBPAbkut+dDAhr6tkF7tYtEUdk+vITrnnPWGW
         htsstJjxB4Wx3kCeFlVgo7V73dnoxgjJAQbrxwZzB5PzCUEZDZ458of3l1HXwa6/eoR2
         7iWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696641; x=1779301441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sZrnMsT7jt/4L++ru9IvAvxyFjbRkLz2gfqjnGiw80s=;
        b=OERGimSk3bWGE1RcFG6rqrJERCDaYRss8ESSAZiA3ugX0HJPOTOpMA4qBwvPFXvgiC
         OivCE+HvLlzl7bnbtq7+AH7EsbH/UhOfnLsjzQZZkdQ7za1YoRusnrTGD0ZcNWU3ukUC
         GQKvzKPI6W+frdreGbIxAKtB1+x+42TESL6QcwpHO6oc1SJpY/JRT9ObSg9b3tfDleo4
         TwCC0Mm1dhYj6OnvUCoJKw9Y4d5o2Lav/a9XqU40mPymN+LDacWCWQCtidHQ47mw0UK/
         RZOfBSzayuLLbmLvPHXSXJ5zSHw7u1gb3QUf25OGAfTkBtsrUuMtOyNVn83AAavMv4wN
         msPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9VMHqYvuyr6vFbCUfk/YfJDf2CmvRp2djuoUya4a6N8CT26mVy3rDGKiSjbusSmmKbWqy8v3FybZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEN/g4W2TGxU1/gQoPMdWvnNM2a2TLPfSp4S6Nc7Pq/O5jDIni
	I98XXAa9/OhxzdBRD9kTKOyPLVPDHWUSjjOl0cvXHAGmeKV+aB2rtBAZe2Ec1VQSiVRwHbxSo95
	l/2Xb5cAW3i/Q6ktxMPnvbMh1hXr5yfhlu5/wJmb85pEs5mGbkBAPvxK4kAp3F74=
X-Gm-Gg: Acq92OFpqB0Nwm2NTYUvQ9+eYJ8Sh2ga1hZ+M3EjHJ7vfY9ZVdQk/domSwCKzokfBYq
	bB2SVCrPltS41gGhOTsvwPPuKMQADiseQqifHKWteqT6T4KopyqkNtjPpX0qioeWi21e9WOg1jc
	OdvHxtzE2eKsqEdbMBQsyfgYOoeL2LaT66g5kt6BFcdn/MxTsuVU5qFRSWsunQ6H1yI56qMP6AH
	Q2YBn8KnUvNSgkYSBuZObRrMdBUq5ERUjI2Cv9VCaQjdL3dghT8ThUq/1waN/bMOq1Vwp2Vtmxm
	fxuUjO/nOuNr9N9TA+1PDb1WAGyWAZL1bJIs95PXVQGuQqkoKR+d/8fJhVwIPPj2SsCvGBY1rny
	c3zugk0BV5HzX/z8ikJn+R/SmeTYXyPqRx1oIHM1xv6JKGKAKgQR9PU8Mn4i8HP3B8ZYmuUHVLL
	6YHRmppHwvkRUToPe7hGPA/Adj4p+Z/vT3XZ8=
X-Received: by 2002:a05:6102:3754:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-63771e93dd2mr2536229137.12.1778696640924;
        Wed, 13 May 2026 11:24:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3754:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-63771e93dd2mr2536205137.12.1778696640430;
        Wed, 13 May 2026 11:24:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:23:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:23:24 +0300
Subject: [PATCH RESEND v3 4/6] drm/msm: dp: handle the IRQ_HPD events
 reported by USB-C
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-hpd-irq-events-v3-4-086857017f16@oss.qualcomm.com>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
In-Reply-To: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=891;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+/ILvBuGhqekKhSlkO02babbVbDbrJeHq8l4XOhAwlU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMG0abAwQqrwNKrmGMKndnLCYyJA6PXn23RVR
 jIy1b2VxsmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBtAAKCRCLPIo+Aiko
 1dGPCACNGtpqzbvMTWs5X5vG8ECac3Hmh2yf8eM0hhFimdemipY/3p1uE7tZ1kfXqE9pDI1tP49
 wqoR6jikFqcgnRZ8SpkPDt3z2v8IjbTYJObqopxYBFmBaUt9lrvfMYHjf1IRxPBi0juVhtyKqEE
 I3psZD5FRUZi9u7VKDzuMV4vqUQitc9UgMQYvFPmPG/qomdvVXZJgCwlMUaSCY9/5RHsT3TNKC9
 JQNkKOHh+ORyA8ZutxDUNr1WX70N0HMl6YY7t91D4ZYk7vBzHYUOcRa5mm3GvAXPnywKP3vMquG
 6lyEjDNfEPjnhsGq8tO/gH5cybCBy0/PqZe1OxCjHZf+ALPU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a04c1c1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=3ML_fINe3tzxlWvVV4AA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX5GkQw6rssXu5
 RH8NPNXp4SEGs62/JhYYhZD8kKepzjtVP2s4WSxsXLNtZTr3cICnupKJymXLDsti98qq0QaCBLN
 PLepgzSP6AjF0Ji5QpvlexQyWf0J/OQ4O1B8HT6r+kXk8veN3inMvUFP3UJY/ksvR21km5hK90l
 P2UlC//jOQ4NBAtw/+LkCONlaPNM0jJr7zHL3Gm56EBMMAgK75gSzTuJ4KEnA98AbCBSdEvHbHo
 ixC5SdAS+o9hwTz7ucPh5PzDb816GRrriZbvEfi5lPT1nthOpIIEVWfaxnOwESYGUuBXAtSUkNL
 YEvXgI2/cynpluEUzsGgah3vphZq4Wzwzj0kU5UzWM+ncb9QOuMiQoBWS/udhoYJXRA89Hutd3w
 uUYe2KPlCrx57Aa/v4WXkxiCbey2chlbPFdE4K6rtGSdTQ9mCWEyM+V/CAiWTcHuAPmhuEuQwbX
 21Q/ZMIHdn76ISuPbCA==
X-Proofpoint-GUID: _mYARtzJBdiO0ouCVaCwi9OaHoD9Ewez
X-Proofpoint-ORIG-GUID: _mYARtzJBdiO0ouCVaCwi9OaHoD9Ewez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130183
X-Rspamd-Queue-Id: 2BE02538E57
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37417-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7a0623fdbd8e..8df579bb320a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1800,4 +1800,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
 	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
 		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+
+	if (extra_status == DRM_CONNECTOR_DP_IRQ_HPD)
+		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
 }

-- 
2.47.3



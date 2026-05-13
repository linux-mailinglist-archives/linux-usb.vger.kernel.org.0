Return-Path: <linux-usb+bounces-37415-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLHmJkDDBGoxNwIAu9opvQ
	(envelope-from <linux-usb+bounces-37415-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 20:30:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAEE538F6D
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 20:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D793A304F038
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE6C3A7829;
	Wed, 13 May 2026 18:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZN3X5zQq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGt+tb5g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71D03A75A0
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 18:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696644; cv=none; b=bTpawiqRDGrwhIGpkijrZGGECZJ7saoI2DHvihHdRyOgF+FesogqnDWnMHbZtseZ38hN+zg3DqUBb6vqhoJLelc3pEMoyXo4iiSHl79g72b70gDwhFvyYLAeWusitIL67KrjOLTuoqXbX8alIiqNktNbBycQNEAwtKxQRFEDnVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696644; c=relaxed/simple;
	bh=2ND7iJgLsvG3cprXNomvoKMU6TvVGvnMNqba7Eqodcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yj0/wQaXvo2cCtBKsNEZlbItBgQkLepTj3Ec16ayPcWZ8gCsvBAXWQG8soPhW8gJGYND8ojLhrM/wv01Uv2+YnKn9Li7LJ76MIdckww3bHk/OWxDca2IdbVDY4avvgJEPA4mOOKrcsDeC0gCFcGNmUmRHPHYFyqAQMBrSl5C1Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZN3X5zQq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGt+tb5g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DH0duQ3430250
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 18:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u03qL5j/ar0CqHZjl/YYwUnYIpVEFmw6U1ix4HLrmMQ=; b=ZN3X5zQq82m9ph1P
	6DK7N9XOMtvv+DpVX8n2YXVdtRAOXtyfCO7JRs51nFJiHCV5yLl/t54OFCaFnhLg
	U8FX7oBM6A8wJ5kl+NO5FeHdxulglXb0CH4Woib6U9PgbhAYWLj8Rj0U6FniejFw
	FX+Q2Avi0wc2dNvvTsEOEZES1bJ2WKho3MZ5u55ADSTNZKymyjA8/QHmuhlq7n9s
	hf2qHUgq8TuEZar1JoOUnqckaw8qNsFOYJAje3C6TImZFr250pmNL6Is0fecaJPB
	xRnKQXwRUk/w1VROpXrhey5pTrwD5rXboPCwFNrA7gEK0nt0k+KVF0HHvwoU8ePV
	ATyR0Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmchuk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 18:23:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6374098885eso2205992137.3
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 11:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696638; x=1779301438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u03qL5j/ar0CqHZjl/YYwUnYIpVEFmw6U1ix4HLrmMQ=;
        b=TGt+tb5gUrRNqUI20GnCPUJaf07fCLPXallzZOroCF/qm55JNrz95GGQ5PVJwml1cV
         sf9jGj0T7Yb49/1ekaA3WbESy7+M5JqM2WhapPRaWvcVLvAVtaEIDQZqsAFAN2n6qX99
         V49DDbPI2ALD5/XHEx/rYExCCrpyw80vrMf9L7lkuKtAG+MZA44+F98pIO7c233TnE5m
         D3ewvmWfnPXRrQRz87vn8m1tsOWyeDAasBeceKm5XsBGBXH22g+gKZrnCzUha5dP3TJL
         wCvL5PeFZKsT9s/dxmGS1v10ohxNvUXT3DpnqqF3CTr2wf7KyaKCYLpldGfEa7Fes7dy
         511Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696638; x=1779301438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u03qL5j/ar0CqHZjl/YYwUnYIpVEFmw6U1ix4HLrmMQ=;
        b=k4iNQip1Bu++V95PXPP+mveJ8MP7Mg1+YSthwFKNGChkLx/GNK1G8Qvgx5CvrSWvK/
         sQ+PksJBHlQ+S5+M92otVj/77Tn97YU/ddM4bifiVoxwxYqKjH42Tk35rddn7fh2Uiat
         m8IXvN/CqMwwaqZlayV8bTs+JHz41bv+5sCKESy8mMUYtycEUIAsdXTmp6C/jlgSEFDd
         XcL9F9fC9wN2j0y0Sx9csuA68yO0e1tfeEA9TdpvnYJPDLlm8j4YxJ0kVEeFC7jGYhBF
         Elv7DunWSHqutcAKBdkFJl1u6vbvy4yVYhjvMxC/ecin+aezXcuIaWRoVT2oX5XXV+27
         +dGA==
X-Forwarded-Encrypted: i=1; AFNElJ9wghPljPAQGCVpGOewx7Ol5bxqmwOLMowMJp3Sa8AYRJtGRGq8n8nZjt7MGng31MFrYv8MOmeqsuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSzQJsbHUFAI9u41SH1GNCQPKkwA5R0QFf4EpE5uT60WhRczKA
	9K0xQYR3DP/B3bv7kKvVgiClI0lQpcoXeKeQaA37HYKdYVY6Y+rD3oOpGuVPSIhaPxk18uRPNf2
	iMDbZCZ8UyhMCzxSwNwW2gnwn5KycUY3eMmGONRZKidcrEipZInMDUpbPO7LuC84=
X-Gm-Gg: Acq92OHyJjCen3G4NXsHvFsj8stDyGepXG4aLLJ1dmFu5r6EsbSKKD3KaLg81Fbohsn
	t2UwjbkUerIS5482/0x1jFNSPK0zI7ShSI59eMv3VbYArU8nS/gK8f1POyth5d0blzE0I18UtYH
	v7zoT1dRfjVWDVFwgZjUa9mDCDYER2hYmqWEa0DC4KOLldEk6WQOYmfH8VvgeCDHlnZFYpj29nG
	/jD+vWRh0LUTELJnMqd0PnmS9BI5zn32xlR9fm5VSb1IOaJUiuecltewcgvXpa9L1AC+SPqnrTH
	1zlZhGAydrpb//JLM2IfrQ0zETvAw8MDOt1Q+0oke570KpjOXfosk3itJ53JEtjN7FxW+sX316L
	yuAAPAHb6OpOXfI6r/QxS+lG1iUK2he27qzjqVM/lkxOkJXp117KaAyRpl5yJqB9dJ/oPYkuSgX
	4CUQRxl9403xepNxo8V6yNkyRZ7gdNhFXqCmikA96fBRoI3w==
X-Received: by 2002:a05:6102:6883:b0:610:db51:6f3d with SMTP id ada2fe7eead31-63773e1c1b1mr2855688137.12.1778696638011;
        Wed, 13 May 2026 11:23:58 -0700 (PDT)
X-Received: by 2002:a05:6102:6883:b0:610:db51:6f3d with SMTP id ada2fe7eead31-63773e1c1b1mr2855644137.12.1778696637357;
        Wed, 13 May 2026 11:23:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:23:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:23:23 +0300
Subject: [PATCH RESEND v3 3/6] drm/bridge: aux-hpd: let drivers pass
 IRQ_HPD events
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-hpd-irq-events-v3-3-086857017f16@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7164;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2ND7iJgLsvG3cprXNomvoKMU6TvVGvnMNqba7Eqodcs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMG0S88LTfrlotDPFQ6SiDe7cKoRp0xcJ9JmS
 hADUx0XTxKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBtAAKCRCLPIo+Aiko
 1WMbB/4/R94r4TBQje4rZ53xfXGO4Acm+KRv+31SpUJ/7Tjp/EDS2WzFK37ZW2rnye18vgrbURD
 v0F98QIrEG77Y9vJyBOwFZbTNZhVRv7TcZtBMGMJlZ/+pXt8B2VAbOUxw1QWXIyGDX9GeZa5jfS
 D3cDLDS9/4Ve8xRkNOruvYI7qS7A5NgKyyuuEbBx1X4Lluk+MhmpFB1K0OIdfBQapFX8aThp+7Q
 pXS/R2pbKujWHBIbiUBpkpD1+cm2FlJSWRWNDL1m78nL14CDGijDtsPgg4BiDs+8ePOdhYdZvPj
 ZNGXJ2ejI1x2LrIWizu8+UEQkZgB5NQpSJ0LX65iK4l88rRq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: neMTUQ0HGKT-qTie0hD4SuCmGkP9uxO_
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04c1be cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=zEMOeRQCFk_hQCPR_I0A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfXzffII26u52Vc
 fWUSvIZIIucgbfkK/2U6VwpScUZk5pnNTW7cS5cb+g2G6CBYxd/FzO297kJRtsldyVoloJThrZl
 ZFF1qZljEEgz84O17+9jxFt0V/+4Zct2+V6uTi97H5TZ1FS7nHbujuIeQtJdN7Xl926+fJ4kS22
 7oczMe8QnMTITQsMKAt8aiJBSJL3GmUUuIOi+JQRNrgyJ+OmE0iTQRJhDTMaloc5QHEFMnRX7Zm
 6AFCVkX8k/19c4XpcwE7kP/t11L4yNBY9E+u66WT48ir4LaYbnbyxI3rwJQsRaerh3+NOgSvuk3
 0LGnQrxDvxKqRxov7Xz8/RtOXqZyobYgv79SchA7rb0H/ybevJh3FmIz23BCdFroD8v6BB619y2
 q7QyctR4/dDntRd94bSS887l/WKjSWZbbWWSbt9enWXFfNEwvYipwCalQsrc8JuwrI0Oh/HUabZ
 E1e6eHtj1/5HsLkKARA==
X-Proofpoint-ORIG-GUID: neMTUQ0HGKT-qTie0hD4SuCmGkP9uxO_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130183
X-Rspamd-Queue-Id: 2EAEE538F6D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37415-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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

Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
events to the DisplayPort drivers.

The drm_aux_hpd_bridge_notify() is keps to ease merging of the series,
preventing extra cross-tree merges. It will be removed once all
drivers are converted. The drm_bridge_hpd_notify() function is kept for
the driver which only care about the connector status and will always
pass false as the irq_hpd event.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 11 +++++++----
 drivers/gpu/drm/drm_bridge.c            | 17 ++++++++++-------
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 include/drm/drm_bridge.h                | 22 ++++++++++++++++++++--
 4 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index f02a38a2638a..0e2f0b046121 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -136,16 +136,19 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
 /**
- * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * drm_aux_hpd_bridge_notify_extra - notify hot plug detection events
  * @dev: device created for the HPD bridge
  * @status: output connection status
+ * @extra_status: extra status bits like DRM_CONNECTOR_DP_IRQ_HPD
  *
  * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
  * detection events for bridges created via drm_dp_hpd_bridge_register().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
@@ -153,9 +156,9 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 	if (!data)
 		return;
 
-	drm_bridge_hpd_notify(&data->bridge, status);
+	drm_bridge_hpd_notify_extra(&data->bridge, status, extra_status);
 }
-EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify_extra);
 
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c8c3301cd936..09c3f5954ade 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1495,25 +1495,28 @@ void drm_bridge_hpd_disable(struct drm_bridge *bridge)
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
 
 /**
- * drm_bridge_hpd_notify - notify hot plug detection events
+ * drm_bridge_hpd_notify_extra - notify hot plug detection and sink IRQ events
  * @bridge: bridge control structure
  * @status: output connection status
+ * @extra_status: additional status recorded by the sink
  *
  * Bridge drivers shall call this function to report hot plug events when they
- * detect a change in the output status, when hot plug detection has been
- * enabled by drm_bridge_hpd_enable().
+ * detect a change in the output status or when the sink has reported extra HPD
+ * status events (like the IRQ_HPD in case of the DisplayPort), when hot plug
+ * detection has been enabled by drm_bridge_hpd_enable().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status)
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status)
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+		bridge->hpd_cb(bridge->hpd_data, status, extra_status);
 	mutex_unlock(&bridge->hpd_mutex);
 }
-EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
 
 #ifdef CONFIG_OF
 /**
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..f9a86886b0df 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,7 +25,9 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_status_extra extra_status);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,9 +46,16 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
-static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+static inline void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+						   enum drm_connector_status status,
+						   enum drm_connector_status_extra extra_status)
 {
 }
 #endif
 
+static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+	drm_aux_hpd_bridge_notify_extra(dev, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3e4672fbd7a8..2cf604cf02db 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1556,8 +1556,26 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 				      enum drm_connector_status_extra extra_status),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
-void drm_bridge_hpd_notify(struct drm_bridge *bridge,
-			   enum drm_connector_status status);
+void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
+				 enum drm_connector_status status,
+				 enum drm_connector_status_extra extra_status);
+
+/**
+ * drm_bridge_hpd_notify - notify hot plug detection events
+ * @bridge: bridge control structure
+ * @status: output connection status
+ *
+ * Bridge drivers shall call this function to report hot plug events when they
+ * detect a change in the output status, when hot plug detection has been
+ * enabled by drm_bridge_hpd_enable().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+static inline void drm_bridge_hpd_notify(struct drm_bridge *bridge,
+					 enum drm_connector_status status)
+{
+	drm_bridge_hpd_notify_extra(bridge, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
 
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 bool drm_bridge_is_panel(const struct drm_bridge *bridge);

-- 
2.47.3



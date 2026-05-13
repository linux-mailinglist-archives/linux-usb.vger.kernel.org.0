Return-Path: <linux-usb+bounces-37416-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKg1GVDDBGoxNwIAu9opvQ
	(envelope-from <linux-usb+bounces-37416-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 20:30:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B20538F7D
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 20:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7595E3059F9E
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA443ABD88;
	Wed, 13 May 2026 18:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adOOFUnq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFXtuUcY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18623A874D
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 18:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696647; cv=none; b=cKoIGds5zGXTM+QVso0LXrwx+06FOrpoQaSUKc27aR/VE+I+q08kwKiwJl95LIz7xVnGr+y8Xnh4fk7LCAvi9aAi/XckFh8PpU8cd6OVqUIV/enkhjJvskYYMRkMi7RveEHeCU07psMdZwr4GtWjZbibsEx2C9vjh6TP+H40gGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696647; c=relaxed/simple;
	bh=g2eHBnhqeprT5L86a/SxcLn20kIiQiAhlBDTRdUq0LE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oPajMqIFsQZwen6nm0JG0mm1N93xnrMvSQxrDc9EWOByeEujDVlSzvRdthyWHfpsiNu3Xl5qTmjuZjznFOHDXU8H+rcu2q9meHhHvZm2kD3pR777H3jGqxnApT25TG85ORkgty1i2x8q0LScHx1zncWSyxi2r7ScbpRMY2V0OZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adOOFUnq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFXtuUcY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DH6Ivg3430151
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 18:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=; b=adOOFUnqD/cK+eQt
	lzJ7pMMU0fq91KwakaSBkYOagBIE6/8cH83nWlAgh3JSK+ZkPY4lAYueqom0Oa9f
	wc0pEl0e0UaS0c+Kynn1xjQhLjmV7cdGToDW1gWuSiqaiuWP4AmvLFddcO31vAPI
	WxptBTOrewx+2AHw1RuIc5ZHyq9RjarZWhCQo7wYpRN/X2Jy3TUYWOAnur1+AhRP
	8/4VE+NdttnJicMKGweDNaMHGF0o0bkdvpC0g0eExp34w0X2Tt7qclAjhSXjw2ih
	g1GEQyi5cDWpRFm3VROExFq1gsIisJCw1lhQn4ZCAxW+/hJapsL2ANbARxN8JZyS
	XyYgDA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmchukt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 18:24:03 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6312af70ad0so6728177137.1
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 11:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696642; x=1779301442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=IFXtuUcYPeWGgjNjROMjx6IBXzDIsWZHS2Ers5moFmma97za1NNSNY8TdJEqa/5PSD
         Z4axORee5pnfd1wXCpv8rs4b0g6yT1+S6fRlrvxgZHr6Loe0nRBRXe03akJ9XkShu7cu
         +a8ygrfhiLOeOwKVTZh0MhYuWNOXDsMN68KkjaxosF35sjI/gxe/dt0/UX8NaVR/mPTs
         iW3dU6jhJIMscFmbEZgeQCdRJiRGXMKCZHm6rV/VHsNDU/kL3lO/8xb2pD3p0B/7BsZV
         LmKL52UCXi5TgePY8TKvf8NlKeOR4ceB4jKl3PfeE+p6/m6DsDTy0jtkolGbU33V2FwJ
         Krww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696642; x=1779301442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=Rb2ICzmKp5+hZqaqMBO0DEsSrum/+xtXfiTinJT/zKw9NXjBQaDXdIyiDDjPbdlraV
         Gowr7PE9sdlb8EqsBnCuOhGzWUMUBAYW0icFcIJ/jSxCUe6QG3EIZKqvnOlSRQ/lB+jM
         oxmWZYR7QYNuonVulGJf8R28gn2/ioG/kBDg1yvxpS5wF8qjoZFYj3XCNixnaMle/B4a
         LghZ5rjFLUQ4URLcCUJ8J6rqxbcoN15gZtO9T8lJSKdDfzPtuiEgprIlLFnuTaFl7xAw
         tlwX1oaTR8GCK/9zSJzRZW8TN1uJGYaoqGWvHinMVA5M5+yw2uHsz+IisrskySpNNv4o
         KuUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Mo2XEdFMpPGly16CLPzE7l6glau5vKIDBUnlT5/rkSCsXouzs38DpumhK7lu32PFjFNBHdxAC3Y8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaicxV79R3d3R9k2R9Hzz6pw5IjYua0/KtJJ3AsPEJiOjFWnTc
	2Clu8DiSEr8ZcLLkZqweNJNZy/wthbtf8d9x1H/Z06W+XVnkUl1tYXZsmhDltJDdxEWvNPnpHKc
	kGFeRF/4mNb29QKqIzdTZV2W+fUDC3OF8N42HLlSbdc4DUIoprbG52wp1sar/kio=
X-Gm-Gg: Acq92OGVKUAvm/mtDnRBmWF58LqlFf57EeoTrFgj9kpCRPqQI6rr2cdOW/4HbCmd28w
	n+cjX6OxUEo6opCpjolIoUaS6s83jY28ktMmBl8Mvob27Zrp4lgb+vSeKCVYdvItGzEADwFd1jE
	Bdi0psy3TGrBoWL2njJG3OFVEwHHGHIgWOrt91acaQgQJIrGuZgccZIMomRlhL4HgZpsGHahg6S
	9akQgT8WYMptzjSMSdBir5rV7+Rp3gr3IBkNeF/DqMoOr+zbTwQYQOacQ+veUqNo00RgGhegK1o
	e7xyUquGD47FLazsw4FlFj3TN8+1nJydb7Wsy+/fbyY6PcD57DYIrqe04ZG/U1LKS0o1PpzF2GU
	BmEwkpzqfPyhuHs/TNf+jbHIaFf3s+HzxrVeqwe7hUqbyWt5GbC2XGcDBDMkMfSFaYyD9+tkBXX
	D08ue7xK2lPPgyZB3vrg74atqPqqC/vwCmRrw=
X-Received: by 2002:a05:6102:2927:b0:62f:31d9:7bf with SMTP id ada2fe7eead31-637754eace2mr2861772137.17.1778696642517;
        Wed, 13 May 2026 11:24:02 -0700 (PDT)
X-Received: by 2002:a05:6102:2927:b0:62f:31d9:7bf with SMTP id ada2fe7eead31-637754eace2mr2861750137.17.1778696642033;
        Wed, 13 May 2026 11:24:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:24:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:23:25 +0300
Subject: [PATCH RESEND v3 5/6] soc: qcom: pmic-glink-altmode: pass down
 HPD_IRQ events
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-hpd-irq-events-v3-5-086857017f16@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=g2eHBnhqeprT5L86a/SxcLn20kIiQiAhlBDTRdUq0LE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMG0drlwCbTuEWcWCuHk7pQDuuarVA3oztNqH
 T7Bd2hVw3KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBtAAKCRCLPIo+Aiko
 1RL7B/4jgrhGIEZynL+WT5KesqjMHxOK4WlzF0fcjJVPHChMLdUytHaxmufdMqTgSy0mcUbDBn9
 6q+vvyQ6qYt0ElA3eZFhzZswAyCgcR8e4VTK8o8hpdhNHHqN0OnWTYPFN2SHs8+2VNdnQpl3rl6
 nMO0qA5XZZ0N0MW59OPPIDbL7bNNmFqUKmIe2WCRfvquF0In8ReMbRiQJj7LkMVsU4X/WUHvw1c
 D8V8E3vb27NV4op4UtcX7LQjtY/tpC3kuvEBz1k0eDC+LlEa/A9pzrNHGsDflhVd9anRh7OF2dP
 6y+RL8SzW1ovqNGn+6AgKDUbs46tJjRUUkfsmEfNEOEnsmEN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: KQ38pxjC0WwGt9kDul97wHJvtoq6_J7m
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04c1c3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=QzDdqdBtNhq9Kz3vvWgA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX/O1mTz6VHoY9
 GupgGbrne3R/3TAMK3OIvz7o7j5C5sf9NV1HqGkx42OKbvJRuOo4gPLmNa15Sj3NsmSJpkxPzeo
 jxTtob8VjZU02ejfzXB/tjfbWrWsekNS7nO+sI5bplIfkYHnd17V6PYuGDh7qYqIk95mGf9dFww
 xhtEE1RvhjYIRqCE0h1onr2QPqf4BsQtpRd71B9u8enM5ndXpb1AJ96c0eviU2KXBcSyiZwX8em
 Qyw0YssNs6+1aDq7SAx8jFyzK0FA4b67wL7v6K+/LTBmXVqOZH7ay9f/gfj7SRtHtvHrSg6GfDr
 hwkr/43Ulu2u+HLOSC1PixCiQBW7oUfIeyOHz9gidBuhVWR0Ld8ppdNIlofVdLqZhWpEyHSEVn/
 0q/wYsjX91pn80tgZ/YgLkldzzF5xt90z9cOZ5kHFMEDzHW8rlYAZT9ckw7qAOIBLFMhJjGU9Hh
 DsMUIP1XoJbR6pQwTsA==
X-Proofpoint-ORIG-GUID: KQ38pxjC0WwGt9kDul97wHJvtoq6_J7m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130183
X-Rspamd-Queue-Id: D1B20538F7D
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
	TAGGED_FROM(0.00)[bounces-37416-lists,linux-usb=lfdr.de];
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

Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
the DisplayPort driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..946eb20b8f83 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,7 +373,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3



Return-Path: <linux-usb+bounces-36353-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPHpNDRe5mnPvQEAu9opvQ
	(envelope-from <linux-usb+bounces-36353-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 19:11:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5381B430ACA
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 19:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DE15349ED46
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 15:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39289336896;
	Mon, 20 Apr 2026 15:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FtpjgyQZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="di2ZGOvw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9450D332635
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 15:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699116; cv=none; b=e5gdtwb8H3LTtWowlJ0ZAgr41fH5+JEwPfDB7Js1TdK9QLfd2zQikbIsvowf0kmISOU+xmuyScYVYCgPpkPWpQhkaJOQvuyIpIEHrEj14ppCvShYdjK7ZNo2nFHNXs6087x8Ko1Deg10hhNtUEJFjNQZaB1yJTnFcK6rT9rjTRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699116; c=relaxed/simple;
	bh=g2eHBnhqeprT5L86a/SxcLn20kIiQiAhlBDTRdUq0LE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P3wepIZ1i986dWSd04AuWiuGH7N3jMhyJEh3weqZZhbRAiAaOnO4xsil8SBcoHgSow4PP27IL1I1O35qUWl5kh9UOID5ZjvcaDCSRNmkzzrBfon58guz86kp3MWoJ8FrjN89IkQjWpxfg5KRov9JM2w+OCpHjo/r/iW39gGA6v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FtpjgyQZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=di2ZGOvw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFHtcI2281695
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 15:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=; b=FtpjgyQZHS7PWmHX
	SuFii37KrFCQGP1LI4OU4yqebryV5Sdp6N0joKTBHIOOB8hPymm+uyqRdH+Tm97r
	+EBhBi1g1DCY6m8agqOGgBCv/Qa7DME6E4+WpcWLasxMExe//m6f1R6+R3lkGCg5
	voui14+vXjyZQwGiTCfOXeX92zt6jC9TdC6bhjcKwkWNSLDdBPCSbRPKO3grnW61
	R3IWg//h+uFyX9BrgTFnNiTrs/ANd6XGcbhtb61siLp8IgbkBKxNqs86qDk6RhUW
	XaPVVErtMPx5PZpqCXWqAoIpuco5vY6w7caepoLq9Ivz37pNr02hqoEy1yzdef97
	yvJd7g==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh599e5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 15:31:53 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-471618e2082so2144517b6e.1
        for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 08:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699112; x=1777303912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=di2ZGOvw/U8Rnvn3ChIAoJEfeqm2hBDrMtxrjb8vWkDtqi0YMZXnaXWcHueWUFPVXc
         ekfz1ULgha58o2u8Eg/F0fLbArvGnsgEhMaTQlBgke8d56h68UCs4P2YqSvOOSOrheE3
         bASUEp0g+OmMIkUdU/46VHm/cQxwAcpgZr/gsdV6UyNV1ZmKuskwe8g8NxbCZdjg/NE6
         WmH9tpEzTZeMiStZto8EnXUyIg6tNop/zvzSbEBM0ahKn7InjdaqoNiGe7eZmISFek2W
         Btp9Kp3uVjU422Pe6pyqNOPbg6hykiDO3wlwLsBWs/73/TlDMva0f/4mFDY/uasXgRkN
         /PyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699112; x=1777303912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MbKgvVuxEIwEzMcmEacPjVXRL9Yz3CCmKCNgvBxdDkI=;
        b=SdR/A22maet9R33GRhw80/o5yPEVEUzdgYtHUIQXqiMYF3AIq5sVlmDZbDCWo+Y7yW
         TtXfYftRBD/MG4TzH5fMrw3/u/XkjDetpiV5uexRvKTRc+rngJDePNeBeyXL3sTHyWuU
         FAEcwTXmvnoLmJ+75gChAE1ZImAolz03i9tSg7VDVw9ouoTb9WmmpnIQj+7M9xvp8emI
         mGPVjEu4N0MJl4nkCQJd4Ad9OecamhxjCQHbd/QFifgMHK19weiNkPCvs2gtlsgxYyat
         mTaB4qS/oFQp5b3MAsBMTti9QQASskIbxpwrJJb6uO7FMnyrZrV5a83mOSzyx3eqlEwT
         MWUg==
X-Forwarded-Encrypted: i=1; AFNElJ9eIj+dUkUDm8RtdVGna0OKVc4wqDCZdpnQPezVr0auKH1XkwpwVpztq1cPPEOOO0XXW7pPGBSKiTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz3SS3wB9hYjIVsc25UUsVa31a34E1K806hV6QweRdUMRpH5rz
	4kcTo7WE8ok15Zp63+kmrQnONFAU9OfNKgx6hbyhexXiV6VWcao3l8SBUfx2B8QgaT7uuZj4Ze4
	OrGWsobp0MMjnZOzkOi/F7dEG6Ja88YaSLo4kPZXE/AaaIeLwHqtTKDq+QS6+enw=
X-Gm-Gg: AeBDieve6LUF7QFOvz3M36yQIt5r4sRxVBDX6PL8za12EoMFpNykRo4TAf3MHj/lbJk
	GOUt7QDU0osA6Ufjhjgk5Qjy/sBVOB25IWuxdfDi8Dac0bcO1eFhm6WVU7Y3i5d1+ThScKUseHz
	38hKjM4beYB9dAZN8iO93ua+YgxinvKdBKaFHt7PsMOThyolJM7l4877/h/rdABxN5JKacFdq6w
	cXuuGmtGQy/7EFgNUTDqrxJwlOj+bj2GWwd3giI6IIhtg+K7MiuNbf9dFruSqD8kzB7huBUm/cs
	XRqRCyvMjqEZ2j3DSRsVPgNeu+jDR/xLMKtQAceTFhwHyiGVWhoGOgI7DJklk+Aj/s7sa5O5PCv
	ZbCwgBYcTCwMhhQ6dI427PC9rcbifNWna21xLJ/xEdBI9l2liULRbw660RHkkGO8a4cbO89qc4U
	n7btwrRhcbzqO6pMK3Rsp85OqrJgL/z77r1tBxi7Q+sLDULw==
X-Received: by 2002:a05:6808:2223:b0:467:16e4:d276 with SMTP id 5614622812f47-4799c818433mr7486833b6e.3.1776699112130;
        Mon, 20 Apr 2026 08:31:52 -0700 (PDT)
X-Received: by 2002:a05:6808:2223:b0:467:16e4:d276 with SMTP id 5614622812f47-4799c818433mr7486766b6e.3.1776699111336;
        Mon, 20 Apr 2026 08:31:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc31dsm3071171e87.22.2026.04.20.08.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:31:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 18:31:43 +0300
Subject: [PATCH v2 5/6] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-hpd-irq-events-v2-5-402ffe27e9e9@oss.qualcomm.com>
References: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
In-Reply-To: <20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=g2eHBnhqeprT5L86a/SxcLn20kIiQiAhlBDTRdUq0LE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp5kbc08iYjB4Uag0ka8zVax5tTnA3IFY+usHE2
 EDoi9ciSAyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeZG3AAKCRCLPIo+Aiko
 1Vt4B/wNiW+YWqmfm+8Rmhnz7THsToqY8cu5mLfFy7IsLit6vS2wLSP/yBCekylhcTV6irXUM8P
 42VEGhqz/Ymuv4uS+YoIB5ejPO9MLGk0vVkfMOIy2Hni+pR7i8owtJvna+wF3TP9/BgaM6gzw5r
 9VgXLqpTSqAWk6UDwvnI4WVZx69ueHd9x+giIKzmS2XWlnronU3X4nEw1nj6M8ixGQARP/0lGiH
 U2cXh7bRCqlzc3NP4rjYbyWpEnFGUWNk2KQ1MwH8MFIqVQjkH0ydOc585da12iuEC7ikpiCOx1D
 3or91Wxi6twREDMlpKWS8i9MNs8T8zzR635ByxjwU5RWoNn7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: NtQ7A_TUjfM8Q-kRekSHr3O9DFqMHfMg
X-Proofpoint-GUID: NtQ7A_TUjfM8Q-kRekSHr3O9DFqMHfMg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MSBTYWx0ZWRfX13EDCbjpJ+NS
 5etXaBkz6OGmlWURHAzqlYWWIIiZflKWtOYhuD6lTG+VQK/Rt0fwLaO2l7KBLtTU+RUuN9SoRt5
 isy0Qq5LkzmJSOkEXlAT526SGC1x41/5JTycq0MyJEWKaVNU2/4fNim38B0QVTWV9itIJXsKaD+
 pPFo+RhNGUUdZBS/uMETaa/u1+4p0PDvfqaSw55Hw/7Ld06VL2F5Usax5A5Cr1XGYoS88zKey5P
 o9HpvpHrHt8Sf967NgoXdSsbTghU/xLa3DfTP+QwirR6ahO12FO1xibvD3DZwcBlLo155piEisF
 5JQI78ot1CTLP7WbGO24aEageRw4MzudgI6TLb6SKK1Uvj9pjBuWjoEOyowJn2gTjjP727xr17E
 YtG2fyJ124eagVvPXnVmYqZe7psimtlyN4JvwAU4puIeu126WlYaFBISYTAuG8lFOZZfG7xTfPk
 f6SjXo/i+r1J0MztCNg==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e646e9 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=QzDdqdBtNhq9Kz3vvWgA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200151
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36353-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 5381B430ACA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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



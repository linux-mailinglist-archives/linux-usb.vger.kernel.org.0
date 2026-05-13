Return-Path: <linux-usb+bounces-37418-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLNQOFrDBGoxNwIAu9opvQ
	(envelope-from <linux-usb+bounces-37418-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 20:30:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E45538F85
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 20:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 666BB3067B95
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC683ACA43;
	Wed, 13 May 2026 18:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xs5+o8is";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LU7w4Wn3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E183AB26B
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 18:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696651; cv=none; b=sQ7KKfOJN3zr+5vjABg1ugKTcqvPkDP6lTqQn7sr4JQ+zWqZAwvkNgQs4sSXjJ6EknXGHLyi5QksIYW6RuZEPHaF04FO/5a0h4r8/NZDnPPuXhn9/ht8ysAcDacSMW70gky3v4+XGZe9XwXx1PKbJsoqWdtSixMpMqlroArYoNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696651; c=relaxed/simple;
	bh=mxGolAt7ROQ681cKNciUMVefMdiRDsSwC5zox5THv9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBG8TH3EjqjXaBXU6Nvro1OECQuakoVq3OH66AsIArPxGPoYkRlsD3J20XWv2nkAsQU5+AOgFeqMPDOschlevAbFqbad8wLxGksN/ATfXU7cehFoqcMwW1CMR0LaSZvxIO8gextoaHGwswsum2KF8i65PX2XMv8l1LBmtrxLH+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xs5+o8is; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LU7w4Wn3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DH5xuf1393026
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 18:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=; b=Xs5+o8is26i9TDoz
	y3y7X36LjlcrVNTHGo46xIwoGiWfsMdLrS54s/66GDd4akyYZMGQR05NxojrB/R+
	x/9om5EnZ9cPMwmqjxdXO1GVzf+uLhKU5CcYtgZP3w1wETTy2UpkHnSCy0lTgFNF
	ha1pCTN8J/of06OBBF50O1zZWQNiYO0LjxltuBQ4cad3lD3n9Lbl5sffy0vcEfCL
	IoOHFVq8f5zOfv2bTths8NCpQ2GK04suj0VD8Xy6mhDvF5bNx4+W9zSZqTgl2C2M
	hBBxbdFwO6cc+uphD7iBz/MXTLPdYOgJZa1BHoEcpYdI1axmH16oOGw+BayBf7hp
	B5Hjqw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k26329k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 18:24:05 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-631289505b8so3501012137.0
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 11:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778696644; x=1779301444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
        b=LU7w4Wn3JpPmuk6OJsWPwCVXJHIYsBwXtaVof1zgNph3fj6zwL5Cwhi0ZEP//TJGT6
         r+Ix1NuxkqszSrHcgfSIYI0SF9XvPyvUf4n2AigtcNn2Ac+Rq8vvp11oCkntRyb/QlGU
         LjqvpZlBdussjNxovCZMjnwEMOqbbkXn2NIJtZ+xB94xj6qkd/tocXjT+5us1wiJmPpa
         UI+N/Hm5sFqeLcNjZTgz2iYF2I+GNRuqMLCBKtZ2O8UgZgnJSyDRuyziY3BiISPoCIMg
         7XCotHnJQReNNSwsNDhfM93oU+VW6X6CT3kzM8kU4DZHYu7X5aqMOStEzNA1cB6OKJ3C
         Gx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696644; x=1779301444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=li1QTXDLKUg9Sb2Wzb5S3vgbZrLxrrKq59N8rWxZa0g=;
        b=gQ8pJQv2Az9KgGfRyP56LJVMbK0PmOlUowz676kWQHDDmen/5Xz3uDVigHtHESCAhW
         E25G4zW8IjG4Si2ClT+V5sM1vnux36FJAygKbuczApEwrYLOZyJgDsNbgoJ7O0Y864Ex
         0KoW/eOBYaPOMoSz9qL3xgNVdnYMAJ6IVQbw+dvWRz9E2svkx9rQKXsZUcPQ1d59zT/K
         Dz449s4I7Bd/DXP8ZekrqGQDtgGPamtj72WcnXepAsBcFlYQicLHeKr/lwMGUUP3vq4/
         f2hLsqqWXt85Zo3tmb8Q6kDU3vkad/D0HbSYjebxQ3knMnDuF0kCdT2LOBpp7Fi7vH5M
         U1QA==
X-Forwarded-Encrypted: i=1; AFNElJ97u25Sw03y3XGiwi9nHUcqOqbvT5ckNx68QxvNYxlOi5KORcYZb/e9yqZy4kKuy27TO1BPEccNocw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEv09ppzLRhIyeNUAYSQB/FKqipbz3fA+EZlnh/rh5K6jDUdyx
	w3ZSzdo7cB+50mCjrjezcMfmpqm9AcvKp8e5/ZqtcMPGaBDiLC09YXvbIN+oYRbPoyVMU+pyHWe
	AxfHxDYfX1kx3HDkvCt6ECEKUSxYrxkR895GwW7SaMxRC60BM45b9fQzMYu76umQ=
X-Gm-Gg: Acq92OGYfTKFkx6oxOuKaS2TxShy0rlaM3NlbanqY2psDqnADhsmfgOFl3/pSCxPz93
	Hul9eGPjCN2kaNbGBCtvx5fir3rZhupEjSrL1fHAwuPZbXN3kVJYJNuEP2glTgKiEiE6qthTg7A
	KJ6Sz0W6d2LH8+DtPa5EA4sRTEH9mRdZ/Qkx9XpGO8pNrJ0iqoY5SDe/aJo04Dg7i71HQrEpuao
	1wwn4K8m+weix5fwqrhqdiYLH+Yff4chSORXuXO6o8VfPWDPHL5aBTVeB2ev2yVIg18IIzEiQDW
	pwqGqnLU0jFEIVjCTsf6UsY05m/264sx/xH37es4fAIuPFpButY/xTxzAl2Zy5rtWliq524rrBV
	FcSnuGRdUJD2Bnt2cA5Li74qoJ00eF9JxD4Zemo0VjHh9ZEAMTA9quFIJE2r2nOMi69nCkY6Hdl
	mJbNRaWtrWLlEzVK/cUgwBEspIpqopDi8MLh4M8kkcPR3fQA==
X-Received: by 2002:a05:6102:4a95:b0:631:2a80:e492 with SMTP id ada2fe7eead31-63774777cf0mr2754216137.30.1778696644195;
        Wed, 13 May 2026 11:24:04 -0700 (PDT)
X-Received: by 2002:a05:6102:4a95:b0:631:2a80:e492 with SMTP id ada2fe7eead31-63774777cf0mr2754191137.30.1778696643647;
        Wed, 13 May 2026 11:24:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d1f6sm4212851e87.23.2026.05.13.11.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:24:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 21:23:26 +0300
Subject: [PATCH RESEND v3 6/6] usb: typec: ucsi: huawei-gaokun: pass down
 HPD_IRQ events
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-hpd-irq-events-v3-6-086857017f16@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mxGolAt7ROQ681cKNciUMVefMdiRDsSwC5zox5THv9w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBMG0hilhJ2gGkZQQxe/0GBPH0fFPTqqZlimMt
 5EPtgQGMWaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagTBtAAKCRCLPIo+Aiko
 1UfqB/sEB1F2WFxCMTR2F1PIB/yP08QefwUon51gJHLQXhYRVsVZgMzGsE56RR40iDFtt0PCNNR
 e8/bhQUFNOGrzI8yy7h2fUumtwY6WquWhqqhJdrMaos/EEi0wqo92efWacjzI8ohK4UFbJt5bjN
 ffYm9hQw7mZu7rzFKn0nk5m4neMOewWtG2qMy4tDxV+FcYWNWYNdbOIiroBSVTXPvibDr1zfc6B
 lWhGMFxqUSjlgv/QMEhFapwgacJOv8N956Zein+/YYHUDvNrrMCD25WxF9YwwoRqVq6nRJacaJq
 0UUW8vbtRRRMty0+1dZCHZVxEpa+Qw3X4pIkBQ/WmrrFhFvO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a04c1c5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=xNxaoOyMFJLcTYWjjPMA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4MyBTYWx0ZWRfX9xdkc53i9qjF
 eQ8Zzq58HaCmUzUeOV867+edmF+vHQMx1rSu/mTeRNfAN0O5VA7EpMyUfnxRjP5YS499GAkl3P+
 duijN0Gwf3VYif4OW4X7vupi7s4tlDSTWbdu8rfn2E/EXkJx1PNlhHDI5wrikvnfo7swrBD953q
 8hC1UOalTBxbmnj90bw9t//Ft9T8M/mnN+WhwWa5dsMnuJRavwIBJn+8zpATuOlyvr++JOtGOpL
 3B7PgAp/nxnvfKhof7XZkAfT5x0Hg7NmkFMHrfxgQNNqUr8SJHta2hJc6uH5OWKUQ5Bm1Otoeb5
 O+Cs80eUFjSmKDoCyTW76VRHgCifWBIVyKZpfCGk0+RpWe91fkPGY6ga27Skg+HvarUZBsOIdmt
 6+jFTx6Va8QIutb8BJTY0JOqZbk+NB03T9NaEDCWu5fmQD/rigRL1kqGd3nldLre9OG0yDaoThe
 rPNok8/aaa1nox0SqUQ==
X-Proofpoint-ORIG-GUID: 5ctLcNsPrs3wDqik4yYC_JhMC_i4or6E
X-Proofpoint-GUID: 5ctLcNsPrs3wDqik4yYC_JhMC_i4or6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130183
X-Rspamd-Queue-Id: 57E45538F85
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37418-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,intel.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index ca749fde49bd..5e3f887ecbd8 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -299,10 +299,13 @@ static void gaokun_ucsi_handle_altmode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_extra(&port->bridge->dev,
+						port->hpd_state ?
+						connector_status_connected :
+						connector_status_disconnected,
+						port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3



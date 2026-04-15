Return-Path: <linux-usb+bounces-36266-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ARLOr0e4GkPcwAAu9opvQ
	(envelope-from <linux-usb+bounces-36266-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 01:26:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45468408EC2
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2026 01:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F26CA31A5EF7
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 23:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D81393DF5;
	Wed, 15 Apr 2026 23:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dy+HDyD8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9Ii9cnU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61643947B1
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 23:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776295380; cv=none; b=XWfPbuZ0CVmM5Wfud8wXEZ4zwMBVi6NjkE9f4IeE7Fr+dZSTFpLtJ2MR6UPsGztPN3U5weZZ/GJitdF6d3ASidt5tebHqs0JqaFhl1M7FjUGlFHLnXjaEcZhbQTq1buJ/nsViDvnpCN51Oiq4E03lM3ZnJPDlW3xcyEwZewwmBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776295380; c=relaxed/simple;
	bh=DMjriJDCdMjopTDai5VHPDfHuDEfFaw+9gvGTyDPhTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SADiMZmDQOU31yHg07Mj2Bq/oPtX0Z2dcgQPjKtEYlmf3w9ZMajpfxtoxeFvFsp5TkQiRGxrc3y/ELRFBOH5q1a5h08+/TEj446GtRej5podRnGU0FZ3c8EFP5ZbPJ0K8dTp36ceRhUT2olrEGDKxVq5gDZKCx+EtK4Y7dp4bJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dy+HDyD8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9Ii9cnU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FELhYn2972370
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 23:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vr30iwIqmebM7hvnEfidMs2EUAZWyrOGgpsLJ6GZ70Q=; b=dy+HDyD8rosMW30L
	FUNS2GM/lG+f/jTnHznm8IJHSBbRKc8RhizcSnMXCOajnDCwPJ/IKZK3lnQYIZiR
	5VKDEhgK4DHJVakIozsfYZg7KlcCwAMoGQOmkhSGBjTFSmCtWANSVh5S2uR937Qs
	H0E459ajMWPkg3SVX2V0hyqHbN+cuo+/M2f7gOfIlX9gb4gOjGTiTivjV/7Yp08h
	F8AQkM8ppWipV88ZV6NJ/dxUwcEez1dQlF9I1+cOieWmHaPGJZj2fhGu6Ty/ESU1
	0i2Ir6mBYMoWn4ekLksWwE/zbLXb7CbdULcLrzuFhEX1qItdysCZyXaSC8yRLZ6b
	MXl3cQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj74gaxck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 23:22:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb706313beso323245985a.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 16:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776295373; x=1776900173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vr30iwIqmebM7hvnEfidMs2EUAZWyrOGgpsLJ6GZ70Q=;
        b=f9Ii9cnUW8HjhwUOUbk0C/OCfIxPDp7uQp3c79YJeFK+p66USXvaxKaOF3m/ywewSn
         kYT6CQ7Y1hiLdqHEx1WEXDBmQDNSjHKka02Cwu3PiRK3+n+UMpji7eitD1sCc3auntHw
         s77v8jWdfcwzT/tuXdkk7fou43CQB0SBFrnMD5TfetmZxCYPZEzktIfSlxV+s3gNkRGu
         KxqRDRTMR9qOAl5OuvBcQxCkRW47i+W1+hdgdTGeNbhCWTN2SSifEsOH/FoDzjEPz1V6
         vwDUCyC3RZwku2n1xV2Hg/yCcF7GkzSrB05wmZ4NHuwhVIYiG+XQjeIKlWlbJLcABWmT
         YIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295373; x=1776900173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vr30iwIqmebM7hvnEfidMs2EUAZWyrOGgpsLJ6GZ70Q=;
        b=WyBwnroPm0emyM7EHBOxMq+JizzJ9Y8uNl4sh1+V/Ly2CMx6gd2LmKwQ38JoU3MoDu
         oz1/7vKIwVN1VDK5tODGygG4SNsgJ1gDGtBJfBb9sUn3Vubp7Wtt8ymMHhMMfkJ7tV0c
         YxDunRRynJUC2kAxmqkcmJ8W8+kxQgUlIagGMns/ktMONYQCEFoboJdYDu/rR4uB9C7A
         kHxVIZlVSsZS0iEJk5XRQPYGVSt//ilGrpnuRM3dZwJg2Joc0ofYAYDtRqLueJjM2CNy
         FX9GoNWN2clLb29XH5sQHyxk/Y1iutAW6f2FZOqpj2uRMztfx5zfmgwQP2ACTJvZ8MCc
         wP8g==
X-Forwarded-Encrypted: i=1; AFNElJ8Wl6f3V0abztTw2UOpG1B5YP6eegF6GsEwXEuO+Xs84Vxa3KUaOVMi59W2Xl2RAVXM4/yOlPEcbGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd4qJiQnmQgKUdtlGmb/bqoOg5yebHRdIzja89CbzgorHJ94Ur
	LQqcxX0z9vLWcyWTwLuM5Jlxo1kJml/R6odBD69mKoFlo0QGej7/hg3BbCF/a2cP2jIA5Ax1Z2M
	0ZTEEy1uXJ6aFc5Hz+kSC5KtStuRgCcR/OeoaPzwOFJwR9n4NJo74s9SDHJwTZ5M=
X-Gm-Gg: AeBDietfB+nwQfxdAGxFgDIEqXRBeXPWjZIx6xo6Z7vGQ0co2vDo0VEr+dP/ZxKDBcH
	kI6Xz8uvw6D/c/JpLDtmTr4+i/SV+pPOJy7Bc2Jc+k5LGSgbQ48ZdWNNeWztC78hYo+xyawuky7
	4nuBuazYuRPTTkdDNjzN/qxhOmP9oRI095nFEyb19E1ypGU9uMgIiLLggznWCqzP2ERZ1wT+rhY
	W0qKeaMRLPrKj2C5YE5qHC9kzaHnAghtj2mb/8gprqhIJ/UR+8LsUBzkfFWYfBxcFsd0OBxsjbK
	R0+O50ipeUq/F5vcwsZsyAv2pd3owvFY8JKWp0VM1Sswo93xdmUeczfKpt+9vO3Uaqjp6CnjqXP
	R5bJOJ+yV6H2MUGEQRheSRpvQJzFbEpPe7S5lwEXsxwj98icW7arD22GUBFUOxf9bVUpi+25IZn
	pd7ap3yIECeWF+tnqANXejn0NSC+lc8Ya8Z3XO5bPwFROAxQ==
X-Received: by 2002:ac8:588c:0:b0:50d:9e36:f961 with SMTP id d75a77b69052e-50dd5ad88b2mr362529701cf.20.1776295372980;
        Wed, 15 Apr 2026 16:22:52 -0700 (PDT)
X-Received: by 2002:ac8:588c:0:b0:50d:9e36:f961 with SMTP id d75a77b69052e-50dd5ad88b2mr362528991cf.20.1776295372491;
        Wed, 15 Apr 2026 16:22:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272852sm817054e87.10.2026.04.15.16.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:22:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:22:36 +0300
Subject: [PATCH 5/6] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-hpd-irq-events-v1-5-1ab1f1cfb2b2@oss.qualcomm.com>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DMjriJDCdMjopTDai5VHPDfHuDEfFaw+9gvGTyDPhTQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp4B25RIprvup1/Ku4C5KowC01NBQ8O5kpPwx4h
 eobWONDt92JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaeAduQAKCRCLPIo+Aiko
 1QO1B/0SHnYn7panRBTo1IS+8Cr8do8q3/z8CG8T6fTAgUXlq7xy/zOnHoCF42M0ieXTyV7YQ/z
 cQnWdqx+Erjt/bwe0xRuejxplCDVdRnwoqJWlkTQa3RRpVC3Pv1J3HETUgH9dQxAe2InJ5RdKbp
 I2lxInSBYOdMD30sbJs2NfKL+tcRKO3hy5lap1+JKBCjWzIKj4juaEgZcxleBs1mdIhAWgzZGUD
 nLFhYljjrwhvhv6dvi+IXD9E5I1faQmchJFUq7tjgSod3CPzjUL4byQJIpqrpRZRYM4mlUzY81g
 41iEJM/GZIAKEMqXIyPiU2UPMeuXPR6g4go3iwvPkEoI4Fmr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDIxOSBTYWx0ZWRfXwnJyPqOrg2VI
 SSypcjEGwgguhEqtlgObrNMFy6LNYmLjrkAdb7AWf9ORz2/wWYnWd+44U+YyjaKkQ/QCDLdJS3p
 SxFXxTG2H2+HXq8oNLxEVNP1qy4BNLI1fysFN0fV/Ve5XjdNDO5dt2AI0R6VKZqM1iUnVvvmFcY
 2f207IFS6rmkmgXttGOryeSCdEltzAaY57AeXNvPKBm+Ao4NLS427+I6/5J7jRXfTrbF1SH1DIr
 t/ZYHptpuuqXv1flLRPqs7s1/AtY/2xkzbxcWRw7FaS1btz7haBz5ydiB+zlE0fPiRE/sBcx8NL
 pnuoaTl23C/faMc0AH8xHpkp1uLtcV8UMKaZdOlLMvG9RFHk6ErOdI3mcz2EWQiyrEHq4iGOK3t
 hu2lAIicmR/1JW5lK9sPUGg5qSg1st0IqNU23RD0tb0ZT/YyMiPYjS7YASI3Tkz2ZmIkTt+n4nd
 n2G5A+hUqAx2zPawi7w==
X-Proofpoint-ORIG-GUID: juHeZOh--kvtgol_MYKgIN_3TXQPaFqw
X-Authority-Analysis: v=2.4 cv=ZIfnX37b c=1 sm=1 tr=0 ts=69e01dcd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=5qjnEABnMYrc5H2CFY0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: juHeZOh--kvtgol_MYKgIN_3TXQPaFqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150219
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36266-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 45468408EC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
the DisplayPort driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..618dce748316 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -373,7 +373,9 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_with_irq(&alt_port->bridge->dev,
+						   conn_status,
+						   alt_port->hpd_irq);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3



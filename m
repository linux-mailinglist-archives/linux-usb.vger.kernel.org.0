Return-Path: <linux-usb+bounces-31959-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60428CF8823
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 14:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DCC1130194E1
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 13:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DBF33122B;
	Tue,  6 Jan 2026 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6tNmjFz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N1/Gom8T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE38331208
	for <linux-usb@vger.kernel.org>; Tue,  6 Jan 2026 13:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706037; cv=none; b=jbsy0VTok9Layfc9ffAUj4lIPvwXKKfFn/fXp6EsdwUXt5RBiEgZhl2A5Snnw6N3ybEZz+7fMCSaAux020tCi4P+Igj8RWYOnW02H+hTqb3qw7aLxTBJ0v1iUJt4Jutg+P1GXm64lHQ8MPF7V8BXNxkyxA482T3H+I69V7M0ZNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706037; c=relaxed/simple;
	bh=OvLbrYXTT4RmqAha/2v12s2lEPC5o9EKBYGwVR1szEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hVMTVrzM6pvjGIaod24XcDJPH8MqVLPGh8iwJbIULjm69p/nC1lk1LK+DdYb9VOK8g5vilA1/eoqP4Va1zV+MSXszD1d4nfc5gNZA75MKK0cAsVX3nWI1NLnblbCZHGURSorLA/X3SozdhgdLOmim1SfMRLIDVzP3L/xDpiRToE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6tNmjFz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N1/Gom8T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606BFB8A2684702
	for <linux-usb@vger.kernel.org>; Tue, 6 Jan 2026 13:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xNd34w3mlkKLbEf/7Og/daGQCH4vuBuGujg
	m5MxqEjA=; b=F6tNmjFzoky6UuQK/GTnqYYuxKvbgIcsNAj4laJsp1J9KCaplDH
	i8NFUN4x5x2bfEVNqBKj/VVoAYD0jM5RwtZs3Daj4HwVO3i3LjtS3Fl/oM2GvAVh
	H8TEfP9XXFG9KpAGXt1ZLFqfbI1Pgu7sbfY+9w/I0DkedcIyaD1avMndyOqDf2ie
	Ew47Q0u33Ylu6WLiwe97UNbJTvpzUU6o+YvBz17qga8t5l+LpnZ6nM+osNSdB5OA
	1f4gb1nU1u1zhhdBhc8gkVctVr66JUnZMdSXpQGyhBd83JGuazV4HayIp9YpRvra
	/7PdpO8TDGL9xZGHHShJGhok/uh5r9tElLw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgty5hh77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 13:27:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4ab58098eso26236151cf.1
        for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 05:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767706032; x=1768310832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNd34w3mlkKLbEf/7Og/daGQCH4vuBuGujgm5MxqEjA=;
        b=N1/Gom8Tl9moMKvMhsoIALOXJaszubMPwDQ8QIhrglXaKSyVB64KsOogjalULtXQEg
         y8pCbmb0cD2gp06OtcP00ZyEnMp7tXStRmSVj+ZskGj2Dd3ZpzXBAKkaPCvIrUF/Sak0
         dnJ8fqc9ONODJHvxU+Itbbb6w6tC5TGUSrjmaa6eyEUQq7cK9b+ySd1Z23OPukhT5A5l
         4SIHpv71BJVzzROPEvqEUggRf5zfKrbPBncE034Woj3G8ChFGR7jGPF+L+702/qyl7hA
         5SzUYpVbVBT8JBxU+VUy3isafBxk/OwOqEJ+Jgphv6eZQ92Q0sGht+hh+fBlhiENpQkE
         mPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767706032; x=1768310832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNd34w3mlkKLbEf/7Og/daGQCH4vuBuGujgm5MxqEjA=;
        b=v5uxo2zsJzyUPs+QLh+yXcnWY7b6YbBdL2DmmR0bfHvvFTdrwfKLd1U2ZqEYnkWdF1
         Kv0ArTAjC9CMFfqXBqd1YgC2D9izMtreFcE1nssEUagQ6YKPZYRa7JaskXaSe/TNrL30
         vKi4FOf+tsVGmKfg1Fcm9tcqzHYXKIEa3uuOWy84S4BO/VNC21vUcmHviInh6vF0r/ze
         DkXfhD4Ae4DTo0Qp2m0vzX6UJ55YOXBBto5xgMl4bP8iEfS1snGAx9V5ZWsCWg0cxeWc
         xx59W+c/R7ZTXSalw5hltl/CW637EEfLd7yCGFu6WntneujF/zXJPVVYKUUvHHN12QuS
         ONdQ==
X-Gm-Message-State: AOJu0Yyx0IERndGA3GRvJStl8mdw0v2l72uHZXkiZQ+4niTFGeDUEz2d
	5NEogroXRQNytiAsV6oqip1USPyg7WbwSEvYhT5FA35Z5UGt8pIv3OSR0CXxH4FV4xm+75vU9wd
	WTanMvvGhe9RWIGKVy3Icq1Yvt2d6aRnrfhji+4rrI6QP4vmrC0zQ8is9xVG7e40=
X-Gm-Gg: AY/fxX5MSJr3JQpDXVma1xANp+Q3Tb+XKqLOlHgk+97xZCv7AyaFY4yYI+rkrTNTttu
	f3tn6JsE2o6xQkYQfpQYi1r3v8mT6g5pRq7J+bTiaY3FA1i05hTpCFFT3UPzLGdgVExzEIN4RBi
	Is5/6c2GF6+rgaOlZkRD853Ve5FoRJbGMKOLaQ3Jhw9ayKEphFzUOfraPvyc/F/6O92//W9Aa/M
	CcK/YmCxtS+gJTWNvq1rbiiV81pNRoBGHPHbIKijadKvQRplJ7R2biKwVoYvBOT0h8YbFjMOSRu
	71NG7cK2+4e+hROU6NPWigbRSkJG3OxTm4bV8vh5l1YHoBEt3CPEgboBWAxB8B94OIHgUZA8BDF
	b8iiSPIr2GeHeWpy/EsotkFCfQuPLXU5ttnh16rU=
X-Received: by 2002:a05:622a:98d:b0:4ee:418a:73d0 with SMTP id d75a77b69052e-4ffa77e3a12mr39338811cf.64.1767706031938;
        Tue, 06 Jan 2026 05:27:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8l0nGBKIqvct7e+1AzA5i+uOUbzKfzQFuUGUo4oghUtn1DibnT1unu2N/c2UF0LvbRCruFQ==
X-Received: by 2002:a05:622a:98d:b0:4ee:418a:73d0 with SMTP id d75a77b69052e-4ffa77e3a12mr39338541cf.64.1767706031444;
        Tue, 06 Jan 2026 05:27:11 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3980:9f91:8651:f23b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e180csm4295173f8f.10.2026.01.06.05.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:27:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] USB: host: drop unneeded dependency on OF_GPIO
Date: Tue,  6 Jan 2026 14:27:05 +0100
Message-ID: <20260106132706.45433-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDExNyBTYWx0ZWRfX9J/eAN4S1r6t
 20QF6UmClAPddoEL9s3ar07J5J+5po6UTJ7eAwUxXq2B2DU4sa6ipPa6P/m1WBv5alSSjY7jpeo
 4HJNCmRntfxDWnJVCdQfCyH3aXl8TzV8hrUBWtgjzplOvr/dASV3/8egbzrIfkV27uLYUK4vxK7
 cHOkBiNbIEQQ6awQomHebtEbAOu1xXkEs3HmNE1UOsoV6DnVbQkvu/LHBrvAT4v/6iIn5dnbP5W
 AOGs25irAcpzdeFujVgJLaiswZvoMQrjvuH5GHgEjyJqnRWWyIyhh1BYMiQvc7BduxjqI+nkSic
 meupIlsCsfvniQ3XWm6/5GrmAaB0mm44PW8sD+02u5+UO929WCydfsUy8aBC0TANtt1ApnoRs0m
 +LPzgAmuf60jaYKIDlbDxNuPXPOJMGGF664ogNxXpucvJXxXFMHYpoH7L6id53Ujeycru/PNRtK
 n/F4+3WN6NwLj0zKJYg==
X-Authority-Analysis: v=2.4 cv=Rfidyltv c=1 sm=1 tr=0 ts=695d0db0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=E12GCBLx4UJpuGj252QA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: lsRjv597PWRiN6soHQUj_kpRkXOQQnZi
X-Proofpoint-ORIG-GUID: lsRjv597PWRiN6soHQUj_kpRkXOQQnZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060117

The fhci-hcd driver does not really depend on any symbols controlled by
the OF_GPIO switch. It was probably added by accident so remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/usb/host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index c4f17ce5c77b..1859373be303 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -616,7 +616,7 @@ config USB_UHCI_ASPEED
 
 config USB_FHCI_HCD
 	tristate "Freescale QE USB Host Controller support"
-	depends on OF_GPIO && QE_GPIO && QUICC_ENGINE
+	depends on QE_GPIO && QUICC_ENGINE
 	select FSL_GTM
 	select QE_USB
 	help
-- 
2.47.3



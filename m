Return-Path: <linux-usb+bounces-24972-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 211BCAE2B07
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jun 2025 20:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7538D3A3FB2
	for <lists+linux-usb@lfdr.de>; Sat, 21 Jun 2025 18:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D48826FA56;
	Sat, 21 Jun 2025 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATLg8MMT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372635FB95
	for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 18:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529658; cv=none; b=ZJ4GooVYGWQ4HAZWUf2oI1vIXRbA16MCi7VWa504g5wOolULSww0QYKWEHfI+HaG1xFlmCRKvxl7Dn85MAVPzq4fzy+nPMQRfJtcN8K9jcNqnIflDDUsITeSaIcdZunn+02nAjg5A04nqQAd4ZmUjjUG4/d2kZQm5YVZAqBzUjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529658; c=relaxed/simple;
	bh=NC+6CTFgMLHdg6+g9HBcQz357cKtQj1mOKzQB55FZWY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V7REkzEQmBbPxeHLnL9grBdotD9zMBCNBZK91blN8y97ntTf13qgkuUqN2PaIk6061xtt9Q+LFZh+MYvTirXPeyy3vTpW+/H+VjRokXKSHx40+xCXNUtptZ4CWv8E3ziJtyaUy87PZ/Yuvb8tjaIHQ6iMlcgzzOJCgLsvarpL0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATLg8MMT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LCMNkT005644
	for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 18:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hAdBnAWfYHpwDRvHbFjfO3
	Wq7C/rufDq65LmjSJW3fQ=; b=ATLg8MMTVIUMiJHrj7DwfuaTtO5ROoueIRdoXj
	/TFIlcvjfkY5+xwXKPSOX61R9iY6+3mfMP56dvleeSMNU+Jt50Aa/XKpW0olKy/H
	XY/C7tW64cXHxjaxnOnOQ4Po8tCkukn4KTEYWTb2CmsdmqjUGt4SVmmQ0z+HKisC
	8erR5ByCjAZIguCZStnab58WEhK+sdEx7tJtsdwyW83L8Ill6zOnHzu0tONZqwXD
	VZsT/IJbQ+n6K4/y3uKI2Pa4cZ8m/hTlkTLP11nElhgsXO+jGkrkTgt6U5loWduM
	kw8J3nHJnOoe1Db6OllVNRy3cVbtKNq1k9DZRlLqKy/RI07g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dp64gw5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 18:14:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caee988153so466506685a.1
        for <linux-usb@vger.kernel.org>; Sat, 21 Jun 2025 11:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529654; x=1751134454;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAdBnAWfYHpwDRvHbFjfO3Wq7C/rufDq65LmjSJW3fQ=;
        b=Xh/OLOztOXcvPJGQSxAOlToaGEre/6F6aX/HePA2oWkuPS38XvEOo2qpjKzfFOo/8f
         UINpSDKTAFM/BCl0O52iPszvB7l5vlKz47V3CoOYGyFbJZ/Np7Ze4rM8IfVFHxbbl2gJ
         DV9D4ieupJ/Gg5AE7nKqGAEZHG0JEG/6m+0bBXJdz9mIQMDRFVl2Pr60yvSmdeoAGYO6
         v+nU2vcdL8EEUgEQRx+eADIDpJ90U8zYHYEZGLD0/rC+OCrJbyVUo02QN+1f85b8eWGE
         R/tE993/0Tdy8AhUcC0VghdvIxTeqMp8V1L67nG6kbwqIoV8/2t5YqoKgor7P3GtjHgb
         P99w==
X-Gm-Message-State: AOJu0YwVPZaxtKKglHWohV5HV659dPqyJKXbn9P1y/Ipy2v7uizbcrhs
	l1MegNm3pa6ng3EtP1bqz2YmvrQ38nks2S8u+Y7RDh9uiZeflM7IIJqrFVoHeNL5sdHLx/RBswN
	XwycDF31wsMo1opv1gn4g1gLcR4YZAscXk2jIrjXSNJAN5JutPhYfN8Rm/3zPRus=
X-Gm-Gg: ASbGncuSjQOUSAqtrJT0sbdgiA1QgrDk1uMiZj0/QIGiZH3lZk8YBx9uE/mRWJf9Rk1
	Siqk21oISgD5euxFXv5bi2ZStLC03cNbM5vz+nG6GwC5z6LpB11UcIWR8wPmnbPgzPKvalsnmjM
	T1XHMmIFcWLaSejXomWIg+FibXQBx43fkjQtwwyHFkkYlJmXfRBfQ3xa8+G3q77MURmoIURzEUl
	eFrZYjh16QXBwjUkB/eNsH2jF+/F375VjgGN0Ra7x3VbWuldYPuyhF/00EF30bxOIPYujdMErAo
	UVzEWClu4gTbNbaWLMA4AMxaFdZ1m16Uk+ljXuQ2O5GwzycPhlMYWEhtjF7XRGXLutBjvM1rNRv
	vqoTpA0uKxVSfTHzPTXbf7NFci2n+0rTpQ8Y=
X-Received: by 2002:a05:620a:f10:b0:7ce:ed86:3c53 with SMTP id af79cd13be357-7d3f9915ea6mr894898985a.29.1750529653755;
        Sat, 21 Jun 2025 11:14:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh/g8hREMqWKz0vNE/ALaXmeIFavld/Ji1sFTgDR73nzP4ito7bDNyvb0IHP/cPqQq22K+EQ==
X-Received: by 2002:a05:620a:f10:b0:7ce:ed86:3c53 with SMTP id af79cd13be357-7d3f9915ea6mr894895785a.29.1750529653328;
        Sat, 21 Jun 2025 11:14:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/8] usb: typec: ucsi: yoga-c630: enable DisplayPort
 support
Date: Sat, 21 Jun 2025 21:12:55 +0300
Message-Id: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACf2VmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyND3WQzYwPd0uTiTN00Q1NTg6TEZNNkQ3MloPqCotS0zAqwWdGxtbU
 AdcC+uVsAAAA=
X-Change-ID: 20250621-c630-ucsi-f1550bac5c17
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NC+6CTFgMLHdg6+g9HBcQz357cKtQj1mOKzQB55FZWY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZy5+91uni4dIEvWlsETyokE+iLrZe3p2SWk
 r2J2MUuLPGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cgAKCRCLPIo+Aiko
 1ZFSB/sGqadIrErakavmv4ZFhj5lCWmrgf2rD3td8keECibDmPBJBiL6pHfkwduDARAEGUEUA45
 Fwe4X6zv5j/But4gkNkVk7W7wn7fWvtJ0yAA8psRi5Yrq48sHosoaTxKJYopz02YAtP763lvulb
 3drpzCTQog63ygqEMtuxFH3b96LzVW4dq1NVAMp7RuMDcAw1W2SFKifx7AMtwPrrZ2o2Y3NPOmk
 EgI5LPccSfiwPhEqNF8m1/kWfC30xCRw8qBTn/EK2fFts05xBr9C41ZeWGLgp56NSIrsX1tzGFG
 dhFLG4mHfjtsF0hTaoIRA3KWUcP31Tf4MTrh6Xx5RtrjTnNb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: XOolShRPXX08YtOYTL16MjP3605aEeSg
X-Authority-Analysis: v=2.4 cv=dPOmmPZb c=1 sm=1 tr=0 ts=6856f677 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=LFE4Rb7r-JuClWV4lGUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: XOolShRPXX08YtOYTL16MjP3605aEeSg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX9gv7GJDAhMVI
 wQ7ET5KRbrqdvROaaYAI1UPx4mqa09F/EtlRqMFTSnuV78ueDPs1UjTg+B3ZEXgMR2nApxFYN40
 RN8R7V9HgwoDwcsTT5tJtbJf1CtJkhsnbDXKV04SCXYn98TjeOKIpf4stAztx5RtHpGR6OB3l+1
 gwNSo4RjxdHsXcm7rhGbGqT4KWF/RzVtOiHN/n5c3kfytZEyaWbBSMh0y/O1LNibDYrpMjKdCLl
 Rn+q6KQhZ/ICWLNKOarNUU23wZskvKUR8obj8O4IK6FC5Tp3eZujSqWbZniN/5lZb1QUHChkVv5
 auBuaJJ40DdzBIe1h3mJcDh+RCkH9qNIEIjf8Mvs8JspDTmuO3CqyI2y6MXj67+vceHghEMBMOH
 La1Q6PDY01AaVMkOxgtt5eCpsIqFEjehB79jggvlbXPwiItdugw3HjqfkIIxyYFZrjB2G4ru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=541
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210115

On Lenovo Yoga C630 laptop the EC implements UCSI support. However in
order to properly handle DisplayPort AltMode events it requires
additional support. Implement several workarounds, fixing issues with
AltMode UCSI commands and also handle out-of-bound DisplayPort hotplug
events.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (8):
      usb: typec: ucsi: yoga-c630: fix error and remove paths
      usb: typec: ucsi: add recipient arg to update_altmodes() callback
      usb: typec: ucsi: yoga-c630: remove duplicate AltModes
      usb: typec: ucsi: yoga-c630: remove extra AltModes for port 1
      usb: typec: ucsi: yoga-c630: fake AltModes for port 0
      usb: typec: ucsi: yoga-c630: correct response for GET_CURRENT_CAM
      usb: typec: ucsi: yoga-c630: handle USB / HPD messages to set port orientation
      usb: typec: ucsi: yoga-c630: register DRM HPD bridge

 drivers/usb/typec/ucsi/Kconfig          |   1 +
 drivers/usb/typec/ucsi/ucsi.c           |   5 +-
 drivers/usb/typec/ucsi/ucsi.h           |   4 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c       |   4 +
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 176 +++++++++++++++++++++++++++++++-
 5 files changed, 182 insertions(+), 8 deletions(-)
---
base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
change-id: 20250621-c630-ucsi-f1550bac5c17

Best regards,
-- 
With best wishes
Dmitry



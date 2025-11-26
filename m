Return-Path: <linux-usb+bounces-30950-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB6FC89082
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 10:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 620C73B0EB1
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 09:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3968628DB76;
	Wed, 26 Nov 2025 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8dRJe9l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PamDVdKD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282B62DE71A
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 09:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150123; cv=none; b=aqCdEmkUNLs/vrSHl0Vfidzmi+YpDPW0pNcjl++c5R8XaFUM/7qXH3jy2kJ/d1LtzJ4xTqOJM9s6sTJkTV/fxujc1xCxXVb1XHvyGdiuA1maFG1DW91fgXX7CyPKX84weT5mgRABxqmgnwksINQEDUsFfrrbyHHw5vEcinlGBW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150123; c=relaxed/simple;
	bh=9IfJm9cYFgvTTHHW71T5NZliI4pprXGXeW+8D2Wr7t8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dYcpeMUsMN55DjQfEFmcxshDHEWUG7fzNktDA+Fi0xg2DwFH9tupLao1AhLrIfxgSIh++1bzYwRqKiGXmngvPeFnbqVGle4oWWfmFS1SIevjrgcjI2DHR2RnCTeA0pehMJHM4SzYSJI+puLGZCLESPgdvOXRNzXG1Xe8CaCQG1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8dRJe9l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PamDVdKD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ8thgE1522159
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 09:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kbs0K887OX5uGgjudk2p0d
	FLEi8N6+nMPFNSw+qTSoo=; b=J8dRJe9lzn6eHkGXG918s8NV/UMbe1IIRWSZJw
	Z9aUb1+AICF8tix4ogZ+JC4oGWMc/82h4tWJm9vStR7JVI6XGeVVuP5aaPxP/xXg
	5HW/uILkJwnVYl4Kqd3359QMIkUBrSSLdmcDAZvwru1lLKJCyYoOW1TZ4E5/+MGQ
	6UJDBxrZS5bGlZJWV+kFg9+bBMwELIeXsJZCwkQWxgDzvVhYma6sZ1epQ0NvH+7R
	5aTtl1zvZAZ9kClh0XeFwGzviyhy4fxmjiEgIkPZIEH1XAZR2IFp652U2wmoNQAk
	urcVjagxhhWc4dPYiw5LJP/wIXT+Blbs2IhbveuN7/gbCVlg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anxfk05jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 09:42:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88239fa9ec9so176232286d6.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 01:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150120; x=1764754920; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kbs0K887OX5uGgjudk2p0dFLEi8N6+nMPFNSw+qTSoo=;
        b=PamDVdKDwVk3cN9xmMlaxHQ8VOdSMnulX7t8qDDam4d04Fwh7krKW67U4X/yeCMUY/
         2Iu3P2Q4QZ7sR8DRxYD26Wj5Zh0GBHAuj/ivTE8ifm0di78NZFX9LTMPwA21a27HtZwy
         Gpy+OntJMcxZwA5ozpi29dfiSKiLDpvF7piHbIgbAS17FzRVMlIVoz43gRxLKaPAQ2+S
         vCzMr6cwvD0qatOiFtYoIIxPdUNSyXq24gVNOaBqKEVisNatZ1X/sEYG7pdOj7KuMkz8
         YW7M9+FVONxx5K8Ga+Z+ZR/n7V++ycnqqynTn9+dwWMeEmpnQU6iQIv1BQqOSGcWu9qx
         M48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150120; x=1764754920;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbs0K887OX5uGgjudk2p0dFLEi8N6+nMPFNSw+qTSoo=;
        b=uFpHr8Uxo5RVghKs1Y/KrS8ihDsqmgqeqVECoO4SjANf1t0hvqE2mp/TpLd7GmiWjW
         Z7UjUQb5dElWEpOghYIf3codPZeHBGMxqoLuYyuUzmWbjRYc5tGSyrmva+pmdbyyhDo7
         sevRlo+PJE7wuL1NZh5uOZoLS6LlOhZCbO8eCCGLnMBLtcig2WJJ/IxCwyDmam2mhCem
         9plYiY9NMQzcOS+iXKwlS7gmNFEWTzttdshjsB7bHqszjq3PW4goc2zWF0u07XEWh0Mh
         J061V0Dq5/fiNBf1jowYsIiKgfgi2VM4j3LiI1Ois3+pPXNbVtZAiosEB/R/CgveD045
         txsA==
X-Forwarded-Encrypted: i=1; AJvYcCUTZ4oP8NkYRIfD5rN3tPdvz4homEEhq4cdOMk9Dd+jbye3NXfFJhjGUjYPI9RZwcJ7kIrIzuNvC1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YydlhzRfzE5EwI+GO3ocOQ4rSZ4BdFHb5Cr8qe/1wBCctGYugD+
	rB/wE/h4Xehj6sC3Kn7p7ZilgkI9WttF1XFuXZ2Bnx/Rm7ji5ghwuga1w30Ge37HxYbEe2PS2W6
	i912yQhkInH2+E7WYfZ90GFWQU6sH+cbwfzLv0NTrMIcOJBlGKpGMHu/jEsUFjZw=
X-Gm-Gg: ASbGnctIsUE6uwcdGiPhvCy7ekYZ410z/OQbweVlzsc2wbiabd2f+drrQSOmIh+/e7u
	P8Adw4FtbYeZ2E31jTNBMy/e/zp1PEHaGdqOEwP4LspdnvXLyDZ0wX5LABwsjT8ytT6eCnb2hDz
	TPRF2RaRmmx6ygYg8s5bdU8X1sYJOEtuc9PjimL27+qVVarJ2xthwp9ZeSAHBrBnl4KHwPWJEAi
	GS+BhVo/D3DeQB21fY//Q4Q64jSV+qDfP42qSBvNDxX6qtkYi+BNoTOj8F2TDxUXqBr0o/zBfyf
	GldjVuscmVmjTuKak8Iz8amkS5iVTCmGgWt7DndhN+kytmSBRt97gvRO8V30zJMMgF8d7A7cJNI
	O5AsI9qSPQbSF7TxyeS+z4MouT4Cnq5DTqU3f8hkyw+N2J5sjOW2IFA/xQtC3dPsQNASGFWid0z
	ZOLXRBr+i5hZLSsZkccjVHLNA=
X-Received: by 2002:ad4:5742:0:b0:87c:2bb6:741 with SMTP id 6a1803df08f44-8847c4d3134mr303253166d6.29.1764150120252;
        Wed, 26 Nov 2025 01:42:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFescXHmeszXPvqF6uHwOtWeRvko/NiK0Q9+a14yaOdIdRFsZA4aE12LTU3tyOg2jLDYVUQBw==
X-Received: by 2002:ad4:5742:0:b0:87c:2bb6:741 with SMTP id 6a1803df08f44-8847c4d3134mr303252766d6.29.1764150119733;
        Wed, 26 Nov 2025 01:41:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbee86sm5772682e87.49.2025.11.26.01.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:41:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RFC 0/2] drm: bridge: anx7625: implement Type-C support
Date: Wed, 26 Nov 2025 11:41:55 +0200
Message-Id: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPLJmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyMz3cS8CnMzI1PdksqC1GRdA/MUE1PTNBMj45REJaCegqLUtMwKsHn
 RSkFuzkqxtbUA9lTgy2QAAAA=
X-Change-ID: 20251126-anx7625-typec-07d455f423da
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9IfJm9cYFgvTTHHW71T5NZliI4pprXGXeW+8D2Wr7t8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpJstm5Ty0nmzhElMKy3AXnsm67WGRTrj0T+FWW
 Fwf3DYNTj6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaSbLZgAKCRCLPIo+Aiko
 1TOzB/9iQBc8sfWSr3SeuIBtpJzY4hArGlzfPYv6wcfxXfWUttOaDJdiWr8VMSEJg/aI+tRzS/W
 JQtJVrL5KOUWwlp2yUpLKdyxW2snz/tRas6oxkZRyGN2EkXSnA2UT7FMPlH2QBmsVWG8SQVAj/G
 J5zs26Evk5Z2YGFqcjsP4t0F2Pbhivljh6KSld/brEb88TDdufVxy90sYq80T0eFe9amG5LNsqX
 0EWyOoCalN0tYrNUN6JdQfdcICeh6Bz4koMDIsriIb2dvp2Fy911Hf8LiZaErlJCqRU5ZyZVf/R
 BogeQeVYpP3ENJvr9TbkIfCMkmzgyPenDVCQH1nXeDf/HiiI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 50Y1CuWzl2grMnd2BNM4oGDExanAGOEk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX5l8w+bX+a/j6
 aHDuawJWN1KFwkVzqIzuSJYdcueu0C+RCWN/Y7AFM/z9gamLY88TqvXca2btcMwd6cTPpO12wI6
 pwve6bx/kSjxXraF6pa7+1x7bApf3WVc1tVDbe3U+451MYewwuhzo7X5x7rytiCF13S35uRYQkA
 Jpnk2gtiu+7bmZdFx6dySyUFQChcUO9l/z2ZNwN9SYepHLyuBM7r046EPTnIRHBtBd7ae5r5wL1
 dHr1yFkPVp78Lw70aOm9ywdbdq4qnaot51OSac5hgs30b5CYwA0DeLC14nZbcE+ABZ70Uiw1PeG
 zosP98edCOtB3n+vrOkRrhilXe5wr4RP+kl42IKRXFUZ6N2rYeme5nyq7V6NYFLWE0W0d5giK1b
 9kfrHXdC1J/xt/wtBLMZz0cwdMk7fg==
X-Authority-Analysis: v=2.4 cv=H4LWAuYi c=1 sm=1 tr=0 ts=6926cb69 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lTOfhhQ1OH7yEsO6ukYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 50Y1CuWzl2grMnd2BNM4oGDExanAGOEk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260079

ANX7625 can be used to mux converted video stream with the USB signals
on a Type-C connector. Provide minimal Type-C support necessary for
ANX7625 to register the Type-C port device and properly respond to data
/ power role events from the Type-C partner.

Notes:
- I'm not 100% happy having Type-C code in the DRM subtree. Should I use
  AUX device and to move Type-C-related code to drivers/usb/typec?

- Current code doesn't register a Type-C partner device. Would it be
  okay or should it be registered?

- The code to change data / power roles from the device isn't a part of
  the series, I'll include it once we settle on the first two items.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      dt-bindings: drm/bridge: anx7625: describe Type-C connector
      drm: bridge: anx7625: implement minimal Type-C support

 .../bindings/display/bridge/analogix,anx7625.yaml  |  98 ++++++++++++-
 drivers/gpu/drm/bridge/analogix/Kconfig            |   1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 163 ++++++++++++++++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  21 ++-
 4 files changed, 272 insertions(+), 11 deletions(-)
---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251126-anx7625-typec-07d455f423da

Best regards,
-- 
With best wishes
Dmitry



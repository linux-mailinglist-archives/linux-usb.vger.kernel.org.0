Return-Path: <linux-usb+bounces-28634-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FE6B9CF14
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D69F1328107
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 00:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CE12DCC13;
	Thu, 25 Sep 2025 00:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jG0gFhdT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342B92D9EEF
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758761562; cv=none; b=QNBWaGNhQv2zsBnIKaE8oLIwBsgxBrEykWcyBAzzY/DNNhkGKlUTL15D08BndIf/seNfy+P0WrJeA78ihMr/lXnJuIK+ZfHfnaqdfz0M5b4v0ezXN25jUdYHM04sGypgfoBQrLAbBhHpAAWn4Oe1Y174arZG6x+YKJxihaBC76A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758761562; c=relaxed/simple;
	bh=hda2Xd4Mz5OnSn10548Jx0ge0zF0dKZ+ZJ+uSDZXASE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iOWDyT9amTyToA/0740MWSZwYumLBHrzd72fMrJ+jOnQm9Ib76b7ki9F2sBUa2PT2TmTFgcmKMzbb8fqFi1fiaski3LAAUxq0KOH5JckjXmKVCg6MK003Z6aW139Z2pcpiLwcSuEffvdnyplu8WsAA5BnKMKPTNGtERT30jnYAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jG0gFhdT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODNVE7025099
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DQ/0YD5xMRw
	3lWfka6oyOcJAqHz+tEBt1EbVwdyanDU=; b=jG0gFhdT1ZR4yFW1qAdyqzM5cwE
	23kn9L+vW4x5gSgFe4Y7tl1FAvNV2bIZFbJ9qDbY4VSLxRhdeVzCMTrscGjVqWGH
	d68AcVYKAFRltB4xOeSokbcpZ9mduO4i0PDQLFfDcl1ooXjQrN2edb7uuLnhtStP
	zFLeOY6g0GLT5NH0CgjaUOXXTCjUzIkzDFOUczUcE2lXkRfj8a1ys0S6qRimOQEY
	sfn9lQUEjuTqSxIAqbf6mu1BMSj1Jz8wH8GbMqyrb1tkqnHA8P2GF0DtS0cWhiBY
	HEpCx1stZyN7QZEKULDZaDVW9ztT7APV2tq0/W9DTpP1/mf3fIuJm79M09w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyexhq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-268149e1c28so3808905ad.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 17:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758761559; x=1759366359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQ/0YD5xMRw3lWfka6oyOcJAqHz+tEBt1EbVwdyanDU=;
        b=Yx9viM87Ewk5BNC9KXjQc47KMlUfuCwG4qQ8ZAUMuRWRaqimhoF+FH177NXGmCLCmv
         NJWvWqi9J0w41o5atha86p4Hp5xZg2TL5xN2/3BxUgW00IxY4O9ccSwaC3Ferdj5nGfT
         H/OctvS/2YsHHq+pwMFs8SsBNK0W9qZdrSwYEYPOfEzlPOkchZ5ZkMUmrk/PFM6iuGx+
         kTQYGdfg+0Ap0zl6uANYrfRRUYGLtTwQ6TVEVb8wTNV32ZMcMs/yMgJwUU2gtLvDoiCr
         yyBE7AI0LmHGDtoa4HYM2hPpwIYyUvxN1SZWQ54qw5VhBc+JQ+8v+1UBYyllTwop6H2W
         B6dA==
X-Forwarded-Encrypted: i=1; AJvYcCXcIjCoTLm02oPeMjXWLbdd8C9nEZxDsQNVH1JJmy6DkCqmxK9Kk0j0fkCk+9ogFocZal0Ose8DBM8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz57EnIImiI/ilDv4BjaT0PLdO0IugVLcs97fzIZD6AMSIC/hKs
	H/sNcchkhMZxdoNpAd24aW8rBuygBDrAnD4Q31hC5ks2mwvH3gmZ3yGrrtZ811DWCsjADaBuNou
	EYhE3nQe71s4fG2NTL088xPGKQ0msSg+unKl748H8WOaKQzp+GV8zG8S6XRRglwI=
X-Gm-Gg: ASbGnctZF5P98rfO0oHsw+lBICwEVIKxJK/1pvsvnsR0Fax4pocVtSDsqJGcRPXwTlu
	e0zrrSf7SnGBJA71xraeNo0kwxuAEK0zZcpXQKfxDNLJJQZSnlEAZnhO7vEAxzUASoCuiI6ipsD
	i5YLm+/0Tbsd8cW7dvJEDJC8JeT0UMQzJVUM9dpQiLNsOeCRvgK8/YOANEm9gsO/UEJUg3XaNaL
	H8qhiWUvpXzArJf/eqf+u+smWwvoaXEc9NWhQhWp/npWjMQ9nf5imfHer2snkJz+sKvVkdH/XUX
	7bcl+Jf3f2jAg0nwa4Y63dJjWkEl6B01+XdWAI26iFLnVPP1lJoX/DQBVOcqwvKYARkInM/mZXT
	1s7ucdVuc45jktiRH
X-Received: by 2002:a17:903:234f:b0:276:76e1:2e87 with SMTP id d9443c01a7336-27ed4a4979amr14745695ad.44.1758761559479;
        Wed, 24 Sep 2025 17:52:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0jZvBnlaKAnoEHEDtefVGK6gSjoyOxioVO1pqTLEeDQPqNMOS8vsAsk+dAfSSAhP0dvVSfg==
X-Received: by 2002:a17:903:234f:b0:276:76e1:2e87 with SMTP id d9443c01a7336-27ed4a4979amr14745545ad.44.1758761559093;
        Wed, 24 Sep 2025 17:52:39 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm5238105ad.135.2025.09.24.17.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:52:38 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v2 05/10] dt-bindings: phy: qcom,snps-eusb2-repeater: Add SMB2370 compatible
Date: Wed, 24 Sep 2025 17:52:23 -0700
Message-Id: <20250925005228.4035927-6-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: q0FLMEp6IfuzPir_XIQC8nois4VhaGUr
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d49258 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9ZGL9VZrYHwIVTkvpzsA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX4UAHo04/s1KA
 5+XJmZMhTgVIMYiZf70nyoirmFc4CAaR6DQypvelO/wKExtUdb1Kv4DCwsPdlodNj89cSPVLVY+
 1eHet19rgQjYAdALxz30U0obC5ArzZ/zbh0sE6WedmjLg9K7iRHjAq3bvSQls14Zx3BzfhBYcUG
 eJwBtrvMYnvTHtYr0TudX3IyXE+mugHm+upPzGWSdxpycG3vf2Bw8iOiakYE2/0d36uMytiFNP8
 2vxKjelns4yLX0AZ2elo71Ret22X5dSCypGQ2N7zbfLdidz5F/9NdDVnaNFrITB7zpscRU+w/ks
 UoQ8+r4+IGj6PNWYHlo7NMudOU0Lo78DqxFxi7lM+agWHM4xWiJsBayUbglSQpgN3MSzogEMRMM
 06Uyd04C
X-Proofpoint-ORIG-GUID: q0FLMEp6IfuzPir_XIQC8nois4VhaGUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Add the compatible string for identifying a SMB2370 USB repeater device.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 5bf0d6c9c025..0f015a4c2342 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,pm8550b-eusb2-repeater
           - qcom,pmiv0104-eusb2-repeater
           - qcom,smb2360-eusb2-repeater
+          - qcom,smb2370-eusb2-repeater
 
   reg:
     maxItems: 1


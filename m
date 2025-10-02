Return-Path: <linux-usb+bounces-28873-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B232ABB4B0C
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 19:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B92B3A58A9
	for <lists+linux-usb@lfdr.de>; Thu,  2 Oct 2025 17:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D9E274B44;
	Thu,  2 Oct 2025 17:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKcz0PIY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DF0274B27
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 17:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425958; cv=none; b=slqHKcFm0z3l1bNGxGfvuW8qHAv/goFlGGNl0UA1lwTc6Y8lzJvGaT7pcbx9/EhMyRvExOfDIVvhMeRviD28yfazdM+HVKs/tmmynKTOflPsH5BsWAZ2esN9JecrLvs7XxMOIdw2r1HD1vDFvzcFu5ij/lMqDx0U3pKgE2x7beo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425958; c=relaxed/simple;
	bh=RwbCoddsvhqFNIlVCzJxf3Z4gIZGCQR3H9/+B5Bcmqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YIIdlldVqVfrxjTcdhYuqoUrqCJ3bWYgskn5mLFBg6LFiz8MpeBWPBBA1txcYEEa7CV2JjefQLh65WnghQDTQOxD7p2Aq04NoH1T/c9jn9Tm1xQxtosDcI8S6aLK6oceg+UWquwyp1V2mCVDet7xj7r0529KuKHWza2SUh6lq3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKcz0PIY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5928pDJg031946
	for <linux-usb@vger.kernel.org>; Thu, 2 Oct 2025 17:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lkXBb6Qn3Fp
	d39i3QFA9/nCHMSToieZ6LJfRkx2X6fU=; b=cKcz0PIY397I+UiGgwq0i2pKg0w
	0cxZv1HcNxe4OWYw7zh0D6pOIJieQRD5SOg5C5begmrFIcFy1yH4vTvVv8TfM6Zs
	Z3N4Q+EyI5mD3ZvigNGtikL0qm8LZJ/yepmtuR0HIcgqLHAn8a1Y9FjgUdYx3yoU
	t2NZUCv0u6QGsv8XcNBTQX3Evgn1JZV3UzDwMgR+XogYrTVQMoDkJO0QHeESKKgQ
	1mFXURXtfg1perbjxEUmFfnPKWWtNubWzm5bkDaMWADR5YxrUginh3ExWM+A50jL
	j8CPWBqjBXYRKybf5CvFneuGhDu5yzUgAYcX5i24txY9ajrpoMU22/3uVvA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x60n9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 02 Oct 2025 17:25:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78108268ea3so2310841b3a.1
        for <linux-usb@vger.kernel.org>; Thu, 02 Oct 2025 10:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425954; x=1760030754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkXBb6Qn3Fpd39i3QFA9/nCHMSToieZ6LJfRkx2X6fU=;
        b=UnIaSYdLP25LF82PpN1UGTDu9QCyJ7NJOb7zaYH/p22jxhqHYxwSF6SCmRc71jrOT1
         H+elzp469HcV3SS9Lh1nne5F6HQaaawsieNmY6LZHxnVY6SB00Ri1fe6huudYcoIkw/a
         vBNGjo2gGFfKjYJ2UJ5gI8/ryMcoUsAfvzsb9eoktNrBmwmly75WffXJJ/oAXZG+8HEb
         pYDuCeuCy285/OoIus8fTcvc9a5BGIqZaUtp/SGCAfx/6JVtf0MZ2NLJCNSln/3iczYD
         CCYTYNhicAagVINGytXJ20M7VL9pl6Rp5SJVYTtiocEQn26i0ne4ui3pz9QJUWgrXr6P
         ZbyQ==
X-Gm-Message-State: AOJu0Yxp2jSosioDMousc3lOUzX7hjtEvlBO3x4xxz2dvZ8z5lyBWx/o
	kS7nXEMVbxIfkZ2hsHjbHAxzGIt6ojjbMLKEE90AN4KqtTswi09Ha5/K3ykS+BUrUYr4MKr5Wbw
	x4NehlJKkSx8B/Gz6glUcn8WC+iGGstIz5lX6DLhrMMk8NfYqoVU6Z1Z5qkMLjo4=
X-Gm-Gg: ASbGnctVjOrmY3zDmxIfjb+wrDCAYgFozeP1y3IdpEA9UiivSvKztijyHuaq95KErX3
	aHc2mM68efoZJGiiNCqibGvIYLi6gxeSi1QiUkgsLjzBWcCsdOp5B9r6+mLSPyYhHllBbkE01Z4
	p/mlEm5ygW6e5vI4jyn9EIlPJ6VF3TI7U7OQ0COr/UgCKdMYmvVeBCvnjd1qNUdaEDuowgzRJCy
	j61yXZS1Khj0zMxuN/MY7n/z5MJnMWkaEdk7Xf+w3dzTkeXcMTQwWowMzgd9DfK4CQtehI2yN3y
	4wvaQfhODODfQfEUk3S47imjCewsSIPPaGql545E438QlqsAjfSSOyU7fYI3gYtq7Kj/sl6VY/9
	bHzVQb9I=
X-Received: by 2002:a05:6a20:7d9e:b0:243:78a:82cc with SMTP id adf61e73a8af0-32b61d9e0b3mr278968637.25.1759425953831;
        Thu, 02 Oct 2025 10:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWExLSIWzbs+KwqVHiI050o0naTRJriHcJSbvWTXSI/V99qkoY2m4Mo76h/bhlOiZHgo0Ihg==
X-Received: by 2002:a05:6a20:7d9e:b0:243:78a:82cc with SMTP id adf61e73a8af0-32b61d9e0b3mr278946637.25.1759425953373;
        Thu, 02 Oct 2025 10:25:53 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f5b6e9sm2387423a12.40.2025.10.02.10.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:25:53 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: usb: ti,hd3ss3220: Add support for VBUS based on ID state
Date: Thu,  2 Oct 2025 22:55:38 +0530
Message-Id: <20251002172539.586538-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002172539.586538-1-krishna.kurapati@oss.qualcomm.com>
References: <20251002172539.586538-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: I_UpZyKjqRDarb_Xa9hFgY5GEYwKC2Uw
X-Proofpoint-ORIG-GUID: I_UpZyKjqRDarb_Xa9hFgY5GEYwKC2Uw
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68deb5a3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=UO34u3PHWDRxg_ly3EkA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX7qYjMIJdSGXA
 UghxAhhf+/v4UPtHUlmuUddmXIF8FAJk3puyHzq/x6J7rVIJTZHCFgaSRJi43VTXjc0epcb7WFZ
 KkMrnjuRBtyK79a2yf0xm5BTN2/zZudVE5Wi51ARUzltNXdy8tYsXyJFqfZUcVsK2RfBRkNBVH4
 8h9LCoOLmFRTsXni/MWouuA6ezTCvDVzdjNemMKzPpdZzj0CAFa4lUIlh60Pu8UNPo5oVbmmItu
 kqS6fPBoMpEJYwzMKo4IdBx4+hGl/w5uVCEcDCTKB1DqqWXBbOEo3HGI563sMSf9wnnS+97fpyR
 fTkHXF22yZKnrYNVH/oODBXTGuzamjGlEMeSwvO1Pn2edeHcdBG7+mVmvwlMTMa8H6tb1jNV2ZF
 5glhv/DDNPfDtY0qknzIGvYtRFPLCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

Update the bindings to support reading ID state and VBUS, as per the
HD3SS3220 data sheet. The ID pin is kept high if VBUS is not at VSafe0V and
asserted low once VBUS is at VSafe0V, enforcing the Type-C requirement that
VBUS must be at VSafe0V before re-enabling VBUS.

Add id-gpios property to describe the input gpio for USB ID pin and vbus-
supply property to describe the regulator for USB VBUS.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/ti,hd3ss3220.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
index bec1c8047bc0..c869eece39a7 100644
--- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
@@ -25,6 +25,19 @@ properties:
   interrupts:
     maxItems: 1
 
+  id-gpios:
+    description:
+      An input gpio for USB ID pin. Upon detecting a UFP device, HD3SS3220
+      will keep ID pin high if VBUS is not at VSafe0V. Once VBUS is at VSafe0V,
+      the HD3SS3220 will assert ID pin low. This is done to enforce Type-C
+      requirement that VBUS must be at VSafe0V before re-enabling VBUS.
+
+    maxItems: 1
+
+  vbus-supply:
+    description: A phandle to the regulator for USB VBUS if needed when host
+      mode or dual role mode is supported.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: OF graph bindings (specified in bindings/graph.txt) that model
-- 
2.34.1



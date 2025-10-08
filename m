Return-Path: <linux-usb+bounces-29046-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F0948BC6392
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 19:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D8A4F4EFB55
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 17:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9FA2C08BD;
	Wed,  8 Oct 2025 17:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UrTYU9gM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8169D2C08BA
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 17:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759946294; cv=none; b=sDBXtt6Jj8DpQXVMZemX5+EKAjpPLuaMXEuBAy5cmFcD2Y5OQuRQyweXwNhqUI6b7hGT7X9oGeyAYyyjIahstbtg6Mg5pZX6bdskXa9VGtfGO9IcvxMsa0d9gE1LAVvBrwRStN1DbT33+xVoUHVKYFXN+7/S3dX33Kphbe0gS/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759946294; c=relaxed/simple;
	bh=RwbCoddsvhqFNIlVCzJxf3Z4gIZGCQR3H9/+B5Bcmqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Puhhrzmo2Yfzr23bi/YfKaNqC36kqLr12C9E+ICc0007CSLi2k3stYSXmjurG3+RqPBVzkQEC+UJmopP5J1BwfkLdtDTMVS10QpIu6q3xFTI+tnCVWvtQG6HeAkcVB6EKnAbM3qyu9jYuYaWYU5/8N22fDoxYtgV3MN1nXcDyRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UrTYU9gM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598HAi6B001502
	for <linux-usb@vger.kernel.org>; Wed, 8 Oct 2025 17:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lkXBb6Qn3Fp
	d39i3QFA9/nCHMSToieZ6LJfRkx2X6fU=; b=UrTYU9gMwhzoCZ0leukHxOSXnlD
	+N+JtvPzPyw3LUMV/AWQnfIocKToaqxsPNMHkWjmKoypks3x3+QbBXVBDylArxNa
	L8o09pWj4pU+fBC0pZRBUqeqEwynZtL5fOePtd+vFzUG8pTX+YqKafjWK7I3H22a
	iHNK2pjlSfZCnIfzsHIHlJtstXFqp2uzhZO1mgfIcNjbKQXNVKSA+dFncUwJaoHe
	zj/bmJ350SKPT7modw7R/O7+OnhmQtADAeZpKckVRe0cTf7ytC5IlBLMNJsQFpEj
	WWeZQ7GzyqNv8dH0TzUXUeXgSOoO9okoc7HyJk/hi1oql4PgEJ93OKaTTVg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kg4ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 17:58:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b57c2371182so28879a12.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 10:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759946291; x=1760551091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkXBb6Qn3Fpd39i3QFA9/nCHMSToieZ6LJfRkx2X6fU=;
        b=jltKKcbXXbtZNcQxAtzMWCnuFgTH50YYxDPqaq7U5qYKXxEVQuWcSw77mkd3mnJcdF
         yiNfR7a9ddGaK3jps+xoPIsI1XfkKsqv7uSwqZSoSvYFCQru/zg5TO4oOv5CSR/UmPyl
         BLs2Bqn1JsJantQRaa+yj4PLkwKLQs+ehanxIWh13H2Vy5+9c+twC/ykgStfZbOtQn8a
         X5hkgD8Kb6MH9XyMT+DIils22Bd92qwVkJgOZdM5h15lSFZ5qPGKjERvJpSpEC7NWgv2
         mN/KqiJdSYyD27+EZe5eTCSPwBvJycMxVRfwhwofQlvszNTNeuCua+9SW6qtbzb7OHS5
         dyzQ==
X-Gm-Message-State: AOJu0Yx5je+YEw85Ap7/dJHNdg1yK/UWZBnlBYqwX4dtajedTcWGPh+v
	a8H2Q87ma6ENPref+TtYzqzUGmr2VjCBg0JuCwwcSBbP8vO07JYt3wac6jtpDo2d5pd+bfg0p9i
	XjErE2fLT269qOz4um2eH1sJN0LushB8BsdCNohJe8Jv+yLJ+euoog/Zgi4BF3Kg=
X-Gm-Gg: ASbGnctLJhTa1633W2Q/26DmTh3k8Jo0OOCJtDwJC7+tWzyDLxa/doJf8QWj17bDqbV
	JVeqPVo8WQjcuDz9W6sqZierGxeX5a7ejvDPzEdasLe/jUadbVnlnEpkBxbK3w0LhyYViNJhkic
	bFgheq5E+fu2ZSoG6J8kBqRh9p2oSrZ1b+i4Afry1kzZtjO7/1TGsMWqyXZoMQOA+67kBlvpIvL
	hQMAYMFHGF55tqLPZMKRYE9v2anYll0P/pY80hfi504B+ZLwkzN1U56PmBpkFfZMvzIwROKDvy6
	FeYW3LQ37cG9DsFR9jorXP1tMb/sletKlyMewGoBQqDLQreXOfu5armwGG8buVwugv+pFq/k/aK
	AuUyhQGc=
X-Received: by 2002:a17:90b:3b4d:b0:329:f630:6c3 with SMTP id 98e67ed59e1d1-33b513757fcmr6324301a91.20.1759946290569;
        Wed, 08 Oct 2025 10:58:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZfxPRPNsG1loVsGvZmZ7cdfpqeKee74VvwcmYy9NZBEdDSgHq7Srl1DuZFX9pBYhri/nv2A==
X-Received: by 2002:a17:90b:3b4d:b0:329:f630:6c3 with SMTP id 98e67ed59e1d1-33b513757fcmr6324262a91.20.1759946290123;
        Wed, 08 Oct 2025 10:58:10 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b529f51b5sm1275726a91.7.2025.10.08.10.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 10:58:09 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: usb: ti,hd3ss3220: Add support for VBUS based on ID state
Date: Wed,  8 Oct 2025 23:27:49 +0530
Message-Id: <20251008175750.1770454-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008175750.1770454-1-krishna.kurapati@oss.qualcomm.com>
References: <20251008175750.1770454-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e6a633 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=UO34u3PHWDRxg_ly3EkA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: c60pCnIfeUKVBcPdKgYKup8y7PJb-0og
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXz92901MpXg4C
 Hue0KxRjWI0oMzlhzUR2O9AySIkreaMMcqkHavsJShhraPywMpEwaBguz8YxI/4SD/bHUiimGNH
 uUlFC/8kXAH1EjDre5JIrZIsX8GwUIls4QLE/6jdDjHIZBZ2lzMinMXX2/aJKAVKf824Q3mZFT1
 s6EJ3CKzhYx7Ib85qYy4vw2tgGum7SWGbPsgyxmkvtzReXKWMCEUtdKhZ2EFRXwKOPV5r9HX3Ku
 aNFgKGp56hbGvd31shkdPn1K1D3Bg4wbpkIoG3MztFArTszaoq61uLXywQQ1TdrDnycY8CP7CQf
 A4U/p8DP5XQXF37vnF78XEJjOBoWjJgOf4UhtOlkpeml20yAZo3dbVEHwV5O44UG3/9bVBIUbG5
 GoChZPfbfWjAh/jHtH1+ybVNVNpcqQ==
X-Proofpoint-ORIG-GUID: c60pCnIfeUKVBcPdKgYKup8y7PJb-0og
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

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



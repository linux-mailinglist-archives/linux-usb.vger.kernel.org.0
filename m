Return-Path: <linux-usb+bounces-29630-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A73DC07B4A
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 20:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15C251C44298
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 18:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCA634888A;
	Fri, 24 Oct 2025 18:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3Q96RL3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6F834846A
	for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 18:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761329937; cv=none; b=ICP9/V9+3owqgf38N+t7IvvkgKoWOPXklA5+QnCIJK4tKq5Hp7w36bPQnFP1i4sg907c4aesIbEwm6K5QoOWiAcbWHQOZMxKMcqoyCkmIWYQILK0FUHFHX47SZLlJZg8kv/SihSRZxGgzOzJl3azhfzBDzCYSorAUYWNqJ9Zffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761329937; c=relaxed/simple;
	bh=6LDCzDAorQ1rdxr458tviaygajHjm49tspDBIZwnE5M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KMTNvGPLaxT2gHU7VvReUCsLbqGS+ZZQXTIootJNfreeyC9E3/wjWeW/kvRVxyy55Z8vdcAQ1hSAHdgFVkJD66l1c9JkrfMcXVbMR4aJ4kWU2RwwYjwaBnhuZIWHz5heKWwKxX1kt8u2/W/IGXmSPdLoWxXSUDZw/wAZej1hAq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3Q96RL3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OIA2eH029277
	for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 18:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pfNn+iLNbzS
	vPfiCGkJrd9fqTPoz6zfOgZ+31wHMCWk=; b=U3Q96RL3t7dGVLwFclEVlwj2lz/
	k+v8zwf1oiDCekiNHf5bY5vK3+HHWLsmQaOiT3s2e1sKph3pFRcPNijXvOmkyldc
	8EKraDbGOHPVc4o6b54UyMKfMU10dxpWepK5ubrTQEg7iLOM8TzCK60k0pEMtfEM
	OUlxglspG/h1iNQuVgJg6RRbt41r9FGqRfcjBsRC5bin1FHDHcDGvh8cBDi8DXKz
	W7aJNJlczEfC5Jr8yyp3XToDVQfkiGZ8xyR5liJ9ABmKmyprqH4bC9WA09wEDvn8
	K9mQ6d4YOIUMzwrM1TeZGxcg+cfMNJju8lKeltlFdW98e81C6dk+mNYlotA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qpvwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 18:18:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6cf50cbd2cso1831894a12.3
        for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 11:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761329934; x=1761934734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfNn+iLNbzSvPfiCGkJrd9fqTPoz6zfOgZ+31wHMCWk=;
        b=s3HuHF7m0V14OQgTavtxEiASzp0bJQ04BW/r6xJ7n6Zl7lOKCzVxu4ekgbkK7ZvI3P
         4aGtcPN+NvRZD3zYKq9xo6WoqLrftf8PkMqJVvePONMkKE/WpZUhXpZUYGmLA4CUSmO/
         bxwuhASTBvFQcDmZs+r4bLyFPzznNyGqUIr2eWCau6633+TFUU1+D+FJ6dHTQEFSHhfE
         PgeC0sAqx2VGT6ihdX2kpNUbh7zAHY7g9wdS6ml2PtjdfuXZ8/t9ahv1MiqNJDBlSu+S
         whRf1UlQZKHFdgOqsqwQg+G059Oq7/+5Qrc92ukW0eTXlTFqWCE0I3KTTlvY2xJQ8afW
         ssPQ==
X-Gm-Message-State: AOJu0YyvBACX7b0qHAcGf+2TGmetokbGJjGPjq3cKZN+8mGj9Ov527vc
	nbhhNrxX+C4unuE8c2IDrfKLiAFucYFPeF/mbNQfLRQXMhpyNPuBeFZpoBWnJx/ZnpVuDrexWCz
	aSK53YFCSWG1Jy7uMIvSnQ7SUs/gJqDKjOlg4hcHYWw6Nl3ReAp+kkO4njVbELFc=
X-Gm-Gg: ASbGncsL+YfK+hOiuJcDVd8A8tdUVOf4B2xRf66JdX096geQsNLbOktQyYLnrU8xFg/
	+DQchp1NPG0eweW+TcC5rOO6ieZdwJQr2cihTLofXWVA1SXG4VK1HoaXcKUAQY+Lysp7NcwdnQh
	caoVVN7aO+UbYjKyb4kACt38Q3+WsEAPs1YQbOS6gchhV+gQEZj6ygsxryPqjc1mWNwpL3Ic3rF
	3Vf0ROlIixE+cswlu7os/grV/hj/vbSGEpdWeIeu2/NCZKIHFgpISF97zc3Axz4GQsHvoTkov8U
	h+Ub+GEAUI3zpgNBlAhdv/eDkmaRH74NWMKRu7jcWtsEfNv8HsMEQpo643X1P3Q9fpiCdLaQmy3
	uQlCL7OHpxioOjH4Vjah2g5lSRdZpkAWUKijI
X-Received: by 2002:a17:903:2305:b0:290:ab25:2986 with SMTP id d9443c01a7336-2948ba3e9b3mr47364195ad.48.1761329934100;
        Fri, 24 Oct 2025 11:18:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELcCDpHEgvvYzQ0bQxFdSUCPv3oQqtjRlEyx2hfO6qfAnTDcaIuKb/rUMuhz6fYiteMAdjEw==
X-Received: by 2002:a17:903:2305:b0:290:ab25:2986 with SMTP id d9443c01a7336-2948ba3e9b3mr47363965ad.48.1761329933695;
        Fri, 24 Oct 2025 11:18:53 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dfd0405sm62398045ad.66.2025.10.24.11.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 11:18:53 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: usb: ti,hd3ss3220: Add support for VBUS based on ID state
Date: Fri, 24 Oct 2025 23:48:31 +0530
Message-Id: <20251024181832.2744502-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024181832.2744502-1-krishna.kurapati@oss.qualcomm.com>
References: <20251024181832.2744502-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX4LuEd9hC1GUA
 22ZacqB0Wj5txLRYtgncS8ldpAuHBR4zv2h2Haka8mxc9gzLr3iI2XSpGY8nFo+ZYdK15Gl4/s9
 8wVNJV0W7SSKK/9aB4/F3PQK2tch9OcDr4hK3npyXBd6YO+NQ2QeaA87z/KZHwHa7C92AruKUdZ
 OZZUmuRgC2G2slb9vZz0rpA4J47BsbXageO5viAuG7pdJ7SErDPQSJuvDoQED80Qb89lcl8xj99
 JseLLqBXvsX7QYmJLwp0JjzlBmEZUk55dimpj8IrS1Rq7/ghBO4+AVMlXCsjW5WDZQxICCQQTDZ
 5hy62tRMCQaTbLKRTLTYHA2fsa60YS+VVlQpr6e4WVAW/pzpxUQW6SBIUnrSmIXtnrF3svJtBlL
 2HtjIyLvAYcu0NZtkCQRn7VIZZ3Blg==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fbc30f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=UO34u3PHWDRxg_ly3EkA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: AlJKkZl7C08AeTPXwLI6uMuRCz9uuVTW
X-Proofpoint-ORIG-GUID: AlJKkZl7C08AeTPXwLI6uMuRCz9uuVTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

Update the bindings to support reading ID state and VBUS, as per the
HD3SS3220 data sheet. The ID pin is kept high if VBUS is not at VSafe0V and
asserted low once VBUS is at VSafe0V, enforcing the Type-C requirement that
VBUS must be at VSafe0V before re-enabling VBUS.

Add id-gpios property to describe the input gpio for USB ID pin.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
index bec1c8047bc0..06099e93c6c3 100644
--- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
@@ -25,6 +25,14 @@ properties:
   interrupts:
     maxItems: 1
 
+  id-gpios:
+    description:
+      An input gpio for USB ID pin. Upon detecting a UFP device, HD3SS3220
+      will keep ID pin high if VBUS is not at VSafe0V. Once VBUS is at VSafe0V,
+      the HD3SS3220 will assert ID pin low. This is done to enforce Type-C
+      requirement that VBUS must be at VSafe0V before re-enabling VBUS.
+    maxItems: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: OF graph bindings (specified in bindings/graph.txt) that model
-- 
2.34.1



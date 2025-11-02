Return-Path: <linux-usb+bounces-29981-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3302C292D4
	for <lists+linux-usb@lfdr.de>; Sun, 02 Nov 2025 17:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81F4C3AE4C0
	for <lists+linux-usb@lfdr.de>; Sun,  2 Nov 2025 16:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE2B2D979C;
	Sun,  2 Nov 2025 16:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouQCr/7p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z39OL/wa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D816B2D94A0
	for <linux-usb@vger.kernel.org>; Sun,  2 Nov 2025 16:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762102115; cv=none; b=Mf+npB0x7ucIIvJdcdRWfqynfgaszkzKwNzb4AKB/OmJo60fCmM8UTeLFyEQQ72BaElqdUz8H42DANBr4Qf1VXUB7ZfkdHBTWZYVXQI5h5J2mbhQk46Itadau1rt/UlEAfQwuVWaRIsBSr01xXQx7EZ9yD+AvsAvv9t9f070mHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762102115; c=relaxed/simple;
	bh=TpiTxJW1Bz3YKEyohqJFyPy/4FKxAmL8LRUVMUuk+JM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H3dAmWV886qI4jKF9CVdhxE1kpCJOTaCb9Viu8FAXwHpSgzJh6sp39RBUbzh2BOukS6IpAZwZzKZKqi/ZxTuHPQzRGafrI+4tZFNzQ53nqdfpxE77HytzA5XnBGRkLEBkG1RN5DoA4qnzqP7F9B6JOL7+OMzGsZbEl0+mjZFc3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouQCr/7p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z39OL/wa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2GfwQj653073
	for <linux-usb@vger.kernel.org>; Sun, 2 Nov 2025 16:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JBOvaCbH4Qv
	gqPmGhscoPlHjn3V3P8Ah+9WTpPAoTAQ=; b=ouQCr/7ptlEWiywzxOCJq5SUrv2
	yRj/HFJaVwVFkaAAKLHSTDcRSi9bmpwCrIDtmTL4I2pOWMJAChOyMPBYjJ9v8ELc
	Yo36c1sTnYnUbnNScTZvYEg7X70Zsbh8T910nEJJt3NNWPcswUWnJdE1Ofh5MoWW
	2eKQjmGFbqPH0ICLACifhgqAqwBhg2yXyOc8hFOMRlZOhVCUMbjpAA6IQDc9V7Hm
	eyRmFp9MUeBW6DTwm+S9fZvuJJfS+e6mvodKZw14qomDJCT/EaXil0jkfM7C5gDW
	YDIyRccCP+BbWZMC1JH7saRVw2J3bAp2XAGN2DBm0JtDA0J2hY6vHQbL+iQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a595rtehd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 02 Nov 2025 16:48:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33bbbb41a84so8332390a91.1
        for <linux-usb@vger.kernel.org>; Sun, 02 Nov 2025 08:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762102112; x=1762706912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBOvaCbH4QvgqPmGhscoPlHjn3V3P8Ah+9WTpPAoTAQ=;
        b=Z39OL/wafRLvmAbdAPLS2jRBLchnB7p0yXimurE7tvTeyFult9GdKmFfLg4+TpscLF
         R6FhvLm6uRNXp7tyXwxrKWiHZPm2hJg0ipz37LfkZJOzfRzUEDAFZ4g28rwQhTbW1L6p
         JEJnaxgfOLPMDWFjn9YwH805wgaYhtiD4P2m44iq3SZss+Z9sGNTUFvYCjyn07+fQQAe
         3rn7TW6VMk2Q2p2mnHsNzDUW5xV7Uz+q8f7KzTU4ahZGxBEYnPWk7WlMrQFiL4kj8Z3F
         IKDluo7j87FrZqYxeipLp6wLKwjg1P8M7iE5ENXAvDzYDKMiIe549TMHHC0tpicFCAxG
         zv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762102112; x=1762706912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBOvaCbH4QvgqPmGhscoPlHjn3V3P8Ah+9WTpPAoTAQ=;
        b=C/HDe0trJ3stj04M0Tijwt+j2OnIww8RNjBk/OVp4lvE19p0wE+XAkDd4xhUc1gRpW
         5b2ix/5M5bUyO6fWueRmsA5TswtNYNHKaEU+1UMJkrVbbPDny6fjZABAYxJw3KcwQehA
         pNSyI9OMymgTzFTSch83xqoynzE67fo+O2Esg6SSSDdLGnIP/n7xxViu57zaEWx8MWbb
         rzn8IjIhP989/rHNOHwGZs/d55OTdfLEZFhYPpCYixgA5xuunCy05IIcbn/uZcp4rJRK
         HTMLnFZqhIqf3iNo2+llTpA81DgTBQmRJboA63fxnwnGER1XxONcAYilZDDlpasWxYsj
         bryw==
X-Gm-Message-State: AOJu0YzDZc/FChwvXUYFdmG2YthcgjWkqpEeW5+B4ihX3YRhq9EiVxGa
	zNxFxsUJjLneb/73f3j0iGYeDvFngZKBoHazSrpIRD+vQyw5atBxYxeIKp+0ijNE3vo83oytToA
	9jqOS9MR7IwmRLEXpMBD+0AaxsvA5sv4RZ31/zeRfZM+Ri3DMGSEmSxjLuAIAxJ8=
X-Gm-Gg: ASbGncuekG3u8jdvLjAXLHfwxNE8vrZczfhrHpoL3pcnA56j7yZqQWzonDGZS9Hf4TG
	K7xVrGku5MpFDH/fNG0mDTdeD8Fe8DuanltQ0PlmYlSk6L+12giS/sUegEHvjTvQ96opOYE4i1C
	4spUGYNIxfgVtAdOgyX14Gz+kzbrO3/wMklg60l2QiNkfCzC8MvbPS//zNnoUZJZQRmdCIgGhnF
	5eJ63A7qTPSEfmL2/etV3FBJmtpesN6ceWyV+0iRSawcLSQb0xveW5NQ8DsPmj+lt7uHfbClHfK
	FHRBlIfIaepS97lxnPA2XeTlmT29s0LImcWXhGylQlGjUqx8UWRrZpYqK+lbidGkiMhNlz9r3sd
	ZMDJEyFgs8fZQCypqqPp5fYCy/5iQZ5CsvV0X
X-Received: by 2002:a17:90b:2cc6:b0:32e:7bbc:bf13 with SMTP id 98e67ed59e1d1-34083088f88mr13211497a91.34.1762102112393;
        Sun, 02 Nov 2025 08:48:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEML+rLFkUQskJw5HVlAhpdyqKOC52Uv4UQprVOYlNSEbl5x1DeFwYSHp4i0sTovR3MvbEruQ==
X-Received: by 2002:a17:90b:2cc6:b0:32e:7bbc:bf13 with SMTP id 98e67ed59e1d1-34083088f88mr13211473a91.34.1762102111882;
        Sun, 02 Nov 2025 08:48:31 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bda55f74sm7708125a12.19.2025.11.02.08.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 08:48:31 -0800 (PST)
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
Subject: [PATCH v6 1/2] dt-bindings: usb: ti,hd3ss3220: Add support for VBUS based on ID state
Date: Sun,  2 Nov 2025 22:18:18 +0530
Message-Id: <20251102164819.2798754-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251102164819.2798754-1-krishna.kurapati@oss.qualcomm.com>
References: <20251102164819.2798754-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: f8NZrp4gbnlk1HI19n7OJX55r6rCFLw0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE1NiBTYWx0ZWRfX3AJc3Q7LQyWT
 88GOYF4GZNVkr6l92wryA54XbDieu2PHHtyn+W/0/v2sZGP05uKJ66BUv6VkmoXZnpP8IUv/IfG
 xZi6d+hA+7qVNQID4Ph9ehePkIqUqk5OIPUtqDZuF+aDW3F2XnoHchJQuXHKLoFjHl7fwF8DTST
 zvr0QZAxQ6RHC3dti9VhuYc/Xa+7K7aRN7LqQ4IaRSsQu+9vPpQDE36GOGdsmW/0jV/EIHfdARM
 UgQe6S0EOoChE87gBw/IZeLnTI/JKounowxXAmy760vnkQw4oJYQ0wUrDqbq/2It8DmmoAZe7Nn
 8VM8P2l85nv9R64ispf4Lv2R6DIaK5hY9ZVkV+MMYD0v3zvGX+2NKlpnDgqYrQ3DOrLiQfiMn1l
 1aFj2wS30Nuf0+iwoTNoF1BmEe8BFg==
X-Proofpoint-ORIG-GUID: f8NZrp4gbnlk1HI19n7OJX55r6rCFLw0
X-Authority-Analysis: v=2.4 cv=XYeEDY55 c=1 sm=1 tr=0 ts=69078b61 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UO34u3PHWDRxg_ly3EkA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020156

Update the bindings to support reading ID state and VBUS, as per the
HD3SS3220 data sheet. The ID pin is kept high if VBUS is not at VSafe0V and
asserted low once VBUS is at VSafe0V, enforcing the Type-C requirement that
VBUS must be at VSafe0V before re-enabling VBUS.

Add id-gpios property to describe the input gpio for USB ID pin.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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



Return-Path: <linux-usb+bounces-30951-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C084BC890A0
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 10:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5E348356474
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 09:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF01831D725;
	Wed, 26 Nov 2025 09:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvatAegm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GqmQ9gyy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1238B2E88BB
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 09:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150125; cv=none; b=S5i2pGUE2FjfZU4bDt1WEllA5XnOLI1puPe3OIZuIL+MYknHtiIQD7RSrCLnw+y6fFEFVhdh56tnHPnnTh9FIDpaLDGcnZlIjf6vvvUM48dxys85f3xrIpTqccHURbS933fcVRUr2JjKKLwHuOzX5lbH/k7LSgPf6w+x7ghxK6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150125; c=relaxed/simple;
	bh=PEszj94UmZrlOqu8kjPM06p3g5SyuWzzyqxwFEqmxnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Va6JtPfHaKDbreDpeSv1rHZENFmkhz8HCK6+Dwyz8NjLuxN50on0kb7EbS1QNVSuSYBoY7140qdYAv0s0Y61BkQdCJb1tEYb04cP6raSpIWu+B8VQZ1lsL0TeF+dermI0XA++1+BkNgxDBE/G3Rp01rZKNGsa1EG8X1/s2KXSqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvatAegm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GqmQ9gyy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ92Lrt4047385
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 09:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JJkgW/Uvf1cq5FzERoTioInV4MshvX7rg+ISf0Tc/jQ=; b=hvatAegm9j/RX6Wb
	97zkFE09DunLqK1t7gU6iYvloVe5Ml9F2QWtLhtFnYDB2IBlb31w7poF+mnU231e
	dELddOLh/IL9w0I6Gh+OFVVg3xjQU3GgVeME3S5q/44AAU8REbWCD9629NndApVx
	1Y0CNp9WyXSgus9IwXaUJU3WRPW0YAWEe5pHIXF1JZ+vbglIE7kbi/qowgilgMTl
	ny8ER5JuJKFm865XlXfJUA94SuC6M/18GYL1RFYVrxj0saEzEmguyzSIc4ytJMg8
	fwlW6CWWOHRdqS+DRXrhA7H9J7//Oyr4amSjgqeYG2LGjhV7J+lFEm59+3HsvqMZ
	WUqlIQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2nhft1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 09:42:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8823c1345c0so72072906d6.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 01:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150121; x=1764754921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJkgW/Uvf1cq5FzERoTioInV4MshvX7rg+ISf0Tc/jQ=;
        b=GqmQ9gyy4VNoMjB7EFY30BTzfwJZhmmSkX8obFD6Ssba1nlz3tQaCBBlJLMVwEjUar
         ft0ukgr3HY/ahVDHqSP13/wFpuwpICWEKPOPJJCl77NBUjelZK5FYHGNCM4+uE9bBWDe
         6jMn7Kzsl5EVxjQqzLFZTyf5Om5mx3qbVK7We9c8oSeQtH+bdCvjRBag3I6kRtTJnZQy
         ziPvoyNa3y8y8RXK7d6Fn7flruFlxLBZMdRTKxhYGHHtNhju8tELKJSVhitH2lBlr3Zz
         WVBDP9WGIwBWsBT4ICEOqDOE5GFqp2FY9Ibcl0N9BOd8wY7OYJUK1NXPfPUjd7Tf/lD9
         Dxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150121; x=1764754921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JJkgW/Uvf1cq5FzERoTioInV4MshvX7rg+ISf0Tc/jQ=;
        b=C4RffEV8Vb8L7k4/o4duDDHJ4cKs/azcjL/tePEdmdLcF/AVXV3Ic4pdFtlBpm9GXe
         qGv64PncQmVb6h+m2RgUvOQoZo/HQMsS7MOSGhq9QtOtmtPKAbrrje/U6lholSgzyNlL
         sPSyqX49zNyCV1YmKYbMzFweRQiJ7Y9Wv1pmv+CZtCa9na4xizDL9Q2TN+1J1utWheEe
         8/M+4Rwxc2wSdnqsO0rDV9Uvi+wPqoXlNG76O0p4A7DLRDL9eg8VklV26YaXK5mHLoDF
         xITvWSzhuMy07bH49WPbqN2tZRekNVfxyqHjJOhuAyAP0SWiR7oltqM4odffp81dahKV
         0oPg==
X-Forwarded-Encrypted: i=1; AJvYcCWdPNfxWsFRkHy75LEsrqTl5y3gg2pUSKwjj1CAlfkLL9qjgMBY7N7CFajnZg7+25Kcr23rbuyJ2/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIzW1O98sH0NtbeXp/kGH2z8wWZvH12mXz6AhCDhMVsSSEuPIi
	4EKnFSK2eLF/UrQwcHuNFAQsXEbin51aljE+6GZydEmMIq+/0VpiijFgiBoaoVIU6HItLtmr8b7
	v/vAnGcyBHYd1dpFu1LOhgfOiJFwKYPwVPt4q8OfDx1rGf1hRluYEhFIY3FKdnos=
X-Gm-Gg: ASbGncuDq9vZdOvA0VvzaFvMIvn4PT9DxUfy9ka1aaI093Ep71AlVHhd6lQkmgjIzIr
	9eSvuY+ff+z+iw4nSPdaeoO7qjbMJO0QVpkS2I5+23tE9YWXmYYJd9pJX6WsiPQygernRzPY3oX
	9X625cgeUyK9JzqXE1qiW/sy9sp0BU5B/BOEyfh4kix0SkBI4VS26hdMDKFJiF0+xRRCXsPTHLA
	hqGXYY7CxAjoeUIPp8MG+/Uw5IiwnI+HWNZyFT4GGTQ+/xFAXQ4mmhWfjYlSphbKSTCXtnvVArP
	VkOrLXa0FJ0RiP2nxMDywoAGlPm+q8JN9f3loXpCfAIZpvjXfdc2HiQgyuNaPSJ3BDxsG0de9wL
	WIUiIjWPwEzBKcTb9pMibIm6yZQNS8Dpst4v680FoInnosDOFfeoaUnh+sXmRanJibL7Uh3Ugou
	SIWklA8ODF6NZN/R+MXQps07w=
X-Received: by 2002:a05:6214:519b:b0:87c:1ec5:841e with SMTP id 6a1803df08f44-8863ae886e8mr90713736d6.8.1764150121369;
        Wed, 26 Nov 2025 01:42:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGC5djSElZsKO3EDcFcfPi617QMf6JHLy+ZCw0r27LCZYcjpxFAaKu0JzF2v/wVweu3a2cxyw==
X-Received: by 2002:a05:6214:519b:b0:87c:1ec5:841e with SMTP id 6a1803df08f44-8863ae886e8mr90713396d6.8.1764150120843;
        Wed, 26 Nov 2025 01:42:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbee86sm5772682e87.49.2025.11.26.01.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:42:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 11:41:56 +0200
Subject: [PATCH RFC 1/2] dt-bindings: drm/bridge: anx7625: describe Type-C
 connector
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-anx7625-typec-v1-1-22b30f846a88@oss.qualcomm.com>
References: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
In-Reply-To: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3940;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PEszj94UmZrlOqu8kjPM06p3g5SyuWzzyqxwFEqmxnw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6ba6bRssQeqcj6b7rLaCO0L60k8JJpme8ViR2pz+4pj2
 lqn9nJ0MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAicQLs/91fFodYy9e11jF1
 KErtCsku5Vxiv1rDWCuvctlD9XzT1kSH82Zi+RKPHrWKLY8T4ZONnSn8Jbdx54HV7rrdjxTvnii
 4s20V440Tj3ex/L50S3kmt7Lr/MpvWzp2StUZJsh7HO7gffLQiX+V18kLzxzmqiyoKqrUkP1cMX
 uP42/Nsu5LUobxWu/KVIs/lmc6rPzfIb7u+ZrpmmeNf6zXjy81VzzZvyjXjynmRb9xrtafe/t2P
 uJeUnVxW+pl5tQYzi2BgR9UrrntkJz9a/WeX87LJ6tO9Ve7oHpngdWZW7/WystdUGzQnJFlz9hY
 VmbqG55u/dN/9edwx18lXh0+1UWVdlc3h8xeybiqhjcZAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=6926cb6a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eOiPeOEgsxahVY17qz8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: ZTctMq9KC_uFlv2uBKAhxpk0NgAbj2zv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX73JiCWO02IIg
 IX2i/3GiptpYhnE3nBSYn/KarOOZ35uzngDjuHB+IJg8InJXjcsr7JOIypmTgceiIYEM4qcDnOd
 05CY7S7pLlAX+xBstdCEZfupXJyEH1YpY0nIsVR8HSgVEXQQxXXjlVKOHWeRJlK3Eandqe3dTHT
 Uh5iOqvLq0OLstrWMUvAoPiDmCm2sPHQpGEf663GQION8z0XbaPRZtIOzN1RhZfUT201DO4ub5+
 UtbiLa4Wdt/ZPhY8eUUAar2b1fm9PIUNnaM+6Ile0XTg6sWDkAIatCVC6QKcCymzGus1xbZLN/z
 fOhllfWiC2ys11STV9hOShmuLvIDyC7TItuwKNiyI/x54WdUTILuvvC0HPzCeKZvZSdNGAgo8ED
 c2IQ+K6vG0maOxkKNpltGlJflbQafg==
X-Proofpoint-ORIG-GUID: ZTctMq9KC_uFlv2uBKAhxpk0NgAbj2zv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260079

ANX7625 can be used to mux converted video stream with the USB signals
on a Type-C connector. Describe the optional connector subnode, make it
exclusive with the AUX bus and port@1 as it is impossible to have both
eDP panel and USB-C connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/bridge/analogix,anx7625.yaml  | 98 +++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index a1ed1004651b9a8c13474d8a3cda153a4ae6d210..6ad466952c02dbba0b1dd9b7de11e56514a438e1 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -85,6 +85,11 @@ properties:
   aux-bus:
     $ref: /schemas/display/dp-aux-bus.yaml#
 
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -117,7 +122,6 @@ properties:
 
     required:
       - port@0
-      - port@1
 
 required:
   - compatible
@@ -127,6 +131,28 @@ required:
   - vdd33-supply
   - ports
 
+allOf:
+  - if:
+      required:
+        - aux-bus
+        - connector
+    then:
+      false
+
+  - if:
+      required:
+        - connector
+    then:
+      properties:
+        ports:
+          properties:
+            port@1: false
+    else:
+      properties:
+        ports:
+          required:
+            - port@1
+
 additionalProperties: false
 
 examples:
@@ -185,3 +211,73 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        encoder@58 {
+            compatible = "analogix,anx7625";
+            reg = <0x58>;
+            enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+            vdd10-supply = <&pp1000_mipibrdg>;
+            vdd18-supply = <&pp1800_mipibrdg>;
+            vdd33-supply = <&pp3300_mipibrdg>;
+            analogix,audio-enable;
+            analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
+            analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
+
+            connector {
+                compatible = "usb-c-connector";
+                power-role = "dual";
+                data-role = "dual";
+                vbus-supply = <&vbus_reg>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_ss>;
+                        };
+                    };
+
+                    port@2 {
+                        reg = <2>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_sbu>;
+                        };
+                    };
+                };
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&mipi_dsi>;
+                        bus-type = <7>;
+                        data-lanes = <0 1 2 3>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.47.3



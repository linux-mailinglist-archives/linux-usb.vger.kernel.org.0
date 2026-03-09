Return-Path: <linux-usb+bounces-34357-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HP5AOL4ur2mWPQIAu9opvQ
	(envelope-from <linux-usb+bounces-34357-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 21:34:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5097A240DA3
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 21:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7709030677A2
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 20:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB7436BCF2;
	Mon,  9 Mar 2026 20:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjPS25cO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="euZEayw4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3317E27B343
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 20:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088423; cv=none; b=j4+hj+FqqXuKEx1WIAw0yIYJazCqDo5Xa9W8/myMDO/CnVog+FaK6MiMyE1r60oCFcfZ3fcHXQR7A2UKxvf0M7BNoXWNb7iFtks9dSykN86Hkq77cqR45u07k7o1qyHaaQIRm5d2aKFrhoAHI5qsvUBrz3XxAt2XlEjB9qMGGYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088423; c=relaxed/simple;
	bh=aCDVTUxh9JogQ1hy2Lkd6pHJ7gHWpePVPTc1pZmzoL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MnThBEgTsqqMTBTu/I18dgLS2ZtV3ZggBbBWiO01EHMu9kkqKFB0qb0e+miwNJ/FwNmcfSrsX8SWtS5cwM2nXOAn0pEWf4fHw/jbinawpCojPPhrZCKqq0ZA/Txx5qtAwns4UJdQTHYcnivErpg4ssB+PxOQ8J1sXHtDuGnJY4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjPS25cO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=euZEayw4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBmAH859614
	for <linux-usb@vger.kernel.org>; Mon, 9 Mar 2026 20:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Pn8uTGxSK3j
	IfZEqYoCdq5gvAWFHg5kvAAHa3xK37G4=; b=JjPS25cOSsYrrBx669DzL7wnJ+B
	b6xgQ7WlB+CRk7mwwuD6Gh+rdyA8kES0OHsC9w5w2yylFlvkx5UbAACtq03KBSZI
	nG7gev9sAjeZ+BeYrkz7xwyoThpVWTJqSR3NArHypAdgmsKdADETEe8NPpOCFnn7
	de8qP9vXvudVzJ3PeRkjpnnzltH/1Eo7y7zr9WkdrIAIjz3de0UmDzSKHnsRJviG
	lS6ebhndz6gHzlpCMCMZ27sm9ZNu5/UTX7j615wy1hk2NJs+XAsCuo0+BWwa07uD
	+z3pD4vJqBEqJnKZ0zSqBIZZLkrHhJj1dF3oUGPCCT4JLZBy2DuAEZlxyLQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbsa65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 20:33:41 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d74211ff80so7073802a34.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 13:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088420; x=1773693220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pn8uTGxSK3jIfZEqYoCdq5gvAWFHg5kvAAHa3xK37G4=;
        b=euZEayw4xsITrHPMBN5vaso+cnQxhOvPKjVwU6i4/d1MxkWm2zCS6iUVAOFXG8935B
         nYCLdt5BDQiJ1pac55rHoroADe6/FA5L7hF9Ipv8fBkDiIvQhHUaGDNjoet4Lyw5ilPY
         DmTQEW7RQK6amyfddeFN2kDbOQNCXidB49LTsXnPfLtaEp0urCWXQGAZudZ3P/wfIJE5
         BL2XvdpWiwjHMK7X6Ygs8QocZSX2T/j1ad9ogT+XZF66GypED36GRYObia0R9UscJbDx
         Jq6t5YnyvjPZWfpzbWobiZas2dbj/GYlgKdmCpPAUBd7iA9ipmR7uzV0BTcWR9MyoJS4
         /Rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088420; x=1773693220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pn8uTGxSK3jIfZEqYoCdq5gvAWFHg5kvAAHa3xK37G4=;
        b=RwJrY1Fym/4HPjhJXfaz1uRj6nsP0W7POjA4rpv4K6UQ9xSAXqYkmrgPr7lOBQeBWW
         ZIvAd6ojMn4RvOClkE1YIvEwnh7wqznVNq8MgHzWZcbduhBRo0QVkJMHb9aqjex2+GbW
         HxPv5OSo4ioKMh2/LAEzAASYbbaQCb0V6rHLcyuy2S5yUjbOssX44p2VDwhzdvJrgIcU
         FVDDVOF/OPV96MB4ctEjLHXltfvYYc010/ajDJeLnszWYqwe0/o/Xh/Di40DaX0viJ+h
         4TdzvR8C9ZH06qsAudyDLqlTj7CFuvU+0ht7xFNdY3IP4ylC2CmEIhSbzVcx6cURhrDJ
         98gg==
X-Forwarded-Encrypted: i=1; AJvYcCW/8B64Pqh0csPS+L9JaKhfGgishULGgc7LQ8OsTD9zJbyHln7/6BaPfIep9Y46FeRzdLESMYRBTyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhmtRZv8TU19DL1Nu7TPINML/K6ZxVyCPnFEauMTmNWcpi+lBO
	d8m/1KNuUO4RIqqO35upw1H65mw5gcd4rD925WwxkmqzxPv5dmLZ3oSBquSOpUHNtrl9Mn0l7xk
	Ga23eg6h5qBt7qw8lmcyxd9WdAijDq+5menjmQ8gaVVHDt3ZAzbr7Er1YhllcnUA=
X-Gm-Gg: ATEYQzyBeFcGFmt+e2V3AJsGV2pAUf3BrRawqoRIycZl8YMVXEX8LN/3oxeI3onAViu
	xoU+1YALM9g+99vGTHttTj+NpMkUoDDMmjm+ZjGL3cCMSvTPvQVQ3O5z9jt4HkCY8hOaSf/Cc1+
	P0C1ex/3R1koD3wqKXmguwAcngfBcTJZfzGzOW99ucAp0Wvg4D2SH7NBVF/B9MlVoQXFfJmluH6
	DyA1Lg6EtmvSwc2PJ0TpgbMKHBlxyjyWYcx386wokQEGxFE2J6DH/lVmyMZIUWjxnfKmaPnOe9C
	It8pzHWXN8Oa7VDe2ZhqBoM/TfV0Zd+xtnyrNV9jeEGnM2zbEL7Jy7xXzpn6vURM7FUyFg9KU0d
	Zu6UQpdRNokrtqB1T0nAPX5mwLodcS9FDo4Art0ukhQs0wNsUb3i6IZERg9Qc61aZT402p5DiyX
	w=
X-Received: by 2002:a05:6830:6001:b0:7cf:db31:1b7d with SMTP id 46e09a7af769-7d726e75a8dmr7897573a34.5.1773088420556;
        Mon, 09 Mar 2026 13:33:40 -0700 (PDT)
X-Received: by 2002:a05:6830:6001:b0:7cf:db31:1b7d with SMTP id 46e09a7af769-7d726e75a8dmr7897560a34.5.1773088420207;
        Mon, 09 Mar 2026 13:33:40 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d74885b5a4sm3036494a34.23.2026.03.09.13.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:33:39 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 01/10] dt-bindings: soc: qcom: eud: Add support for dual-port configuration
Date: Mon,  9 Mar 2026 13:33:28 -0700
Message-Id: <20260309203337.803986-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
References: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af2ea5 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=COdb67ocejTnp4Lj0MIA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfX6Qg4Rurc73Y3
 F6UmIPOKpe3vYi4RYvbROTNQER8SzRctS0o9tAKHA+vEkSMy3C+g2rONheRKEmvFW7oP5S7PxWz
 M3puTdOhXC98s2XrHj+eDGaffZ/9W0Cw9fsC4kNAo+OTe9cBbmkYNEV1nqceyRYlnBOKph64dW0
 DRzHW98El3Q+X7UdLZoVS7wj81wdl8k5tlKf4YkSQJSIgL0br+S/BZsSPSLYBO/xXCTk5uIkdJN
 fdh63jZI0EL8X3S8yp5yNr3eL3pl08RP2Z8uaUIJstL84m3cIsasuDHiU/Ia2Diq2grbCXWLgZU
 1h6Aahqqc0wbhBvQX3cdTyDGP79LEr6cbK4KLv+942/IMllBtOMIC6gvRHA4TsotWagJv8BmzBK
 3mDg8t3HylyJnh6hP/bkuZX6PsopByJmrSrZY7kIDN562p9VB99XobfQCpOHORhkC5kbRpNQW3A
 rjITdSx0OnyMIPjF6Ig==
X-Proofpoint-GUID: MjduF1KTvXnGnm5i8aS9VWgoly9tsPgN
X-Proofpoint-ORIG-GUID: MjduF1KTvXnGnm5i8aS9VWgoly9tsPgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090182
X-Rspamd-Queue-Id: 5097A240DA3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34357-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.0:email,0.0.0.3:email,0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

EUD hardware supports debugging on up to two USB ports depending on the
SoC configuration. Debugging can be selected on either the primary or
secondary USB port as controlled by the EUD_PORT_SELECT register.

Extend the binding to support dual-port configurations by adding port@2
and port@3 for secondary USB controller and Type-C connector connections.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..af89b9e0be6f 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -32,18 +32,27 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description:
-      These ports is to be attached to the endpoint of the DWC3 controller node
-      and type C connector node. The controller has the "usb-role-switch"
-      property.
+      These ports attach to endpoints of DWC3 controller nodes and Type-C
+      connector nodes. The controller has the "usb-role-switch" property.
+      EUD supports up to 2 USB ports. For single-port configurations, use
+      port@0 and port@1. For dual-port configurations, use all four ports.
 
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
-        description: This port is to be attached to the DWC3 controller.
+        description: This port is to be attached to the primary DWC3 controller.
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
-        description: This port is to be attached to the type C connector.
+        description: This port is to be attached to the primary Type-C connector.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: This port is to be attached to the secondary DWC3 controller.
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: This port is to be attached to the secondary Type-C connector.
 
 required:
   - compatible
-- 
2.34.1


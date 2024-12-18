Return-Path: <linux-usb+bounces-18604-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1219F5C12
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 02:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 782B01885F0E
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 01:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F7535970;
	Wed, 18 Dec 2024 01:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lqIzR60r";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MwV86SjJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD441442F;
	Wed, 18 Dec 2024 01:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734484094; cv=none; b=Alzrvd0Ps4bBxl1CdwrKNzn4OWQ3DRtdxDqJDcMWYTb4ezZqCYUG7d6Nb73cMFcSFGWzjueSKPCJUBrHeHH1b4dI+McNjBAMy9l4kScXEp2GK/zFOphulmH3t2umQ/Ge1mbW99kjHjMeNpJ0YVC0hRa29yxrVbmXEGiIUZ/yabs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734484094; c=relaxed/simple;
	bh=YV2GDi6HJB/xXpGXbNKMNNL+e4m9QAPcbZ/DUUOjOp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=g1dlNhoVVuRWtB8I9xYSGNciWEnTqxbnfNqh7VF/nAboQVY8mcnERn7TYp+8NY9jsxDHvz0NeM2aCEabNx7pSYbnXlFY/1lcQ8zRR4lwwBfeN+MVs8xQ0S/QFnTwO2JCGqhDSvxpZrGJQyeAUDH13QvQ193bGqOql8mcqRfHz9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lqIzR60r; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MwV86SjJ; arc=none smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHNKqaO029637;
	Tue, 17 Dec 2024 17:07:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	pfptdkimsnps; bh=2OvxhAx6uTU0jpi85RJHOBV3hyVzEH7LFoXF3t1oIAs=; b=
	lqIzR60rsBwd7Q4G2Nyq/LEtciUbNicG9eeL3/c/sBAEKkXO343D+aJ9oSAAVHoU
	jPU9FbGUizwJDwzf5ZVhPftqd9tVSgcJWBIm/UsF0B9kC50FSBAb6iVfagpxJLEC
	U8xG6Sx/rPkl2+r9CJeWjmlthzgPnK25S41GTWD+PMJ6MNZqtk+E9zetDgV6WEb1
	V+lPolwhqhs+pXmIwhe2aDjVUFMEWzaPYtECQhBWcoJwfnnJDXq9HO4nuMAoMxDm
	MSiTasYwtnF7Cz24iRaW37yxTYIJqFVegoQ/L/jCb1sBCNBMVixzZfLDbRzB5WdE
	zY0qf9D2tGJ+nrEMIA2C3w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43kjw20bwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1734484075; bh=YV2GDi6HJB/xXpGXbNKMNNL+e4m9QAPcbZ/DUUOjOp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MwV86SjJJoxlb05CGZYwbQYUG0xBByUhx28pvEBHcNo4G1UlpRKB5BXoPRbBkQHY/
	 17JzL+GxTGD9yJxRiWXMz3hT7HMatviHL7KuthU2twY7UfwcoC+2I9uQOMr+KcyRiG
	 DXRROjX5C9DPgaZb0qzGhKxtZ3W44oTsRAxuFQNUOqibKowZuQOk7KcjwhBSLrsLXm
	 0O/me2rd3OEqvpmU3Q/13lcW83HZqFhDhryA8rknkPq5yv1wtxR4ughezlMlNr8URo
	 fbqxZWGvbWjs3a++OlgF0E+/ge1eUHd8GYXKktQXoBxBg2HXoSlzJkkwFAz+38cyeB
	 fY0QSJ/2DwS5w==
Received: from mailhost.synopsys.com (eudc-mailhost2.synopsys.com [10.213.161.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 07F69401F2;
	Wed, 18 Dec 2024 01:07:53 +0000 (UTC)
Received: from stormcs515.internal.synopsys.com (stormcs515.eudc.maas.synopsys.com [10.212.40.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 5C7FCC0F8E;
	Wed, 18 Dec 2024 01:07:52 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: "Miao.Zhu" <Miao.Zhu@synopsys.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, xu.yang_2@nxp.com,
        andre.draszik@linaro.org, dan.carpenter@linaro.org,
        emanuele.ghidoli@toradex.com, heikki.krogerus@linux.intel.com,
        m.felsch@pengutronix.de, rdbabiera@google.com,
        u.kleine-koenig@baylibre.com, conor+dt@kernel.org, jun.li@nxp.com
Cc: "Miao.Zhu" <Miao.Zhu@synopsys.com>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Jianheng.Zhang@synopsys.com, James.Li1@synopsys.com,
        Martin.McKenny@synopsys.com
Subject: [PATCH v2 2/2] dt-bindings: usb: ptn5110: add TCPC properties
Date: Wed, 18 Dec 2024 02:07:18 +0100
Message-Id: <20241218010718.224530-3-miao@synopsys.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20241218010718.224530-1-miao@synopsys.com>
References: <20241202054314.k6dt7uhnv2kavea4@hippo>
 <20241218010718.224530-1-miao@synopsys.com>
X-Proofpoint-GUID: 5z2rQroU2U8VVCPzUiqKbvjhj5k2h7BY
X-Authority-Analysis: v=2.4 cv=HYHuTjE8 c=1 sm=1 tr=0 ts=6762206b cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=RZcAm9yDv7YA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=Vg_MG39u6yjrUJLUqe0A:9 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: 5z2rQroU2U8VVCPzUiqKbvjhj5k2h7BY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=989 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412180005
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The TCPCI driver has flags to configure its protperties but
no way to enable these flags yet. Add these flags into DT
so that the driver can be compatible with TCPCI  Spec R2 V1.0.

Signed-off-by: Miao.Zhu <miao@synopsys.com>
---
V1 -> V2: no changes
---
 Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
index 65a8632..c31ec7e 100644
--- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
+++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
@@ -21,6 +21,11 @@ properties:
   interrupts:
     maxItems: 1
 
+  TX_BUF_BYTE_x_hidden: true
+  RX_BUF_BYTE_x_hidden: true
+  auto_discharge_disconnect: true
+  vbus_vsafe0v: true
+
   connector:
     type: object
     $ref: /schemas/connector/usb-connector.yaml#
-- 
2.9.3



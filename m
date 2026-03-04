Return-Path: <linux-usb+bounces-33959-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN+hHqz+p2nUnAAAu9opvQ
	(envelope-from <linux-usb+bounces-33959-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 10:43:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DBC1FDC76
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 10:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BBFB930420A7
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 09:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2840739B974;
	Wed,  4 Mar 2026 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="lwf8qXq8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9956336DA12;
	Wed,  4 Mar 2026 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772617383; cv=none; b=M39/ZqxCJhKFSaM/jpxkCxrzzNjoLNrDgxvze2dmNtIWHkhGNfK9yX3JDcST3+hQs4q5Glayw8zL8acJ+3wg+gMsuv5JVIL510X2KRtKBiQ2hZSdQqp9e1gd4Ig5wHp5Vt8QP9oMa2DMOyKJgZPSDvfClccEI4jf4GPDrwI0D3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772617383; c=relaxed/simple;
	bh=yNNivodlTIieW/Vd3vihN5C8kuvtirtl4pr8GWh/M90=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=tUhsNxve1KjaO2b4+CQrsqzih5qGOiaGA7U2sRo2qpUvkR0WZC9h60kJC66c0GU4Thp+VbFIicuZ4du4j00ZLZNi0m453Im5jl9lNHWTqBRAEbos2O+Ld6E1T6qz+q9Z2jCvNM2/g4pMWB0bXiACwv7HB+nDKyIfUjdnBlE67MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=lwf8qXq8; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1772617353;
	bh=Js8LohQ5FKnKhCP/1X+pjHvtWvmL3//jFEdtasdSj/c=;
	h=From:To:Subject:Date:Message-Id;
	b=lwf8qXq8cWxcBLOvbGNzseBUtJB9tTf2CdQDEAP0+7AA0eRB1Nox0ipkSULDbovkl
	 Senr5zwkgsuOrKFYHgzFWi54cTGDc797mTUSYMs97aAhXtAzpAG8boAbfPSCUigk40
	 iKxvxscvIWb8U9jf6HCfoxiSyv/V0wZjmE7p3Sns=
X-QQ-mid: esmtpsz11t1772617346t06159e3c
X-QQ-Originating-IP: nbNoMgw+sJlbtFbTwzXrCmqsHBTzGYwt94vd+Sw6pgk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 17:42:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5088075739087231184
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Hugh Cole-Baker <sigmaris@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v15 3/9] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Wed,  4 Mar 2026 17:41:46 +0800
Message-Id: <20260304094152.92-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260304094152.92-1-kernel@airkyi.com>
References: <20260304094152.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Nu7meyJZV74I8XuhR8TLd5rhoqztOBQ3SrKiyZiosZiV7ibcJ29VlVdZ
	Uodw4QxeSoptIdULBJc5hNwvT1qTbHVCVBMiPnL5ORKVq8RtfdA8QyFKjclAFoU8hqWlVbx
	vl39LqE4DCsVqxA8z7QIXVGUmPAsexJ81djZrM8oGJY1kzJKorW+ptvp9bbHh3RnNUkThWN
	Kty3S3Byl8+7PPC8Bu5LZT0u1RwjtsyPTtrubWfGub4u8BSqq1+bKSAEpeZDLD7LQ7LTfKf
	tKalh+yrPnerjzswBeKjjseJoOaiNCmBXy7wxc0tSrcIMxW9VRyUxfFUatiHtWkx+gg+8iB
	98+sKfGP+mu2LVjI6O1aK5Fk+1Bt+8OspU/xigcGODSKApNZKLLBZGvGSpNY2HNGL5hiyFx
	11zgN6ZhVgeA4FdRK2IOKQ+f+oKoC0D3au/oH53ldz1YT+wafVkPzcqSSFXV4kk6RBRR/3M
	DVsTwSeSG/CGqVqZgD7QEjqDsZrcOnGn1Hw2yjQwyi5AqgxqO89ogFjxV903WAg7352ZUl3
	W+AdWIeU1SWg+qmgcXbg2PzGlL5iG1Z8wUGv2UfQ3cME/CEvCQEe6BssSOhSVJxWrlbUSLc
	Qo/nYzS0w68BCnzG/ZPdyuGXRhB/eUqy0EwfPQKkAK2yEQ6O7hzy1YpeQR5wWOXxBZXouKO
	EVf/6Xcmuc/OZQIv3Ke3tJ8VnvbPWgsk55LGvmDP4h3Rrno1dGFLduyKxQX6EibdHHJqc0J
	XAxo17kFITkoVnsupR3tkqpP5gOTEyxtElMk3KH08kOKi3P0P2CRqXm293LEL2YeiVsV+2H
	aNIxryAgLe6Y44wZxP7qsg4Ocj3qUHqaEdQwulvXJ56ANYHMCbGTHes3Eaf/kHkDs0qrEBZ
	y3MMPHYhPuDk9rvfI49R+wRPr0yd0KVOjY8AzlulQ1yYl/CZaHbhnPJxXNBaNsxmHzKxWjq
	xqtfY0gB63zNdoRdzGTSfvZ3iGueNHYfyrQP9Xen01kexxU5JZZ6RqRU4/KqezMEAb5IbeX
	n166nCSpXGZMPW4cnvcC1a0WE/l70=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 61DBC1FDC76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[airkyi.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[airkyi.com:s=altu2504];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33959-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[40];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,linuxfoundation.org,oss.qualcomm.com,gmail.com,bootlin.com,kernel.org,sntech.de,rock-chips.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,suse.de,ffwll.ch,google.com,manjaro.org,cknow.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[airkyi.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kernel@airkyi.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[airkyi.com:dkim,airkyi.com:mid,rock-chips.com:email,linaro.org:email]
X-Rspamd-Action: no action

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The RK3399 SoC integrates two USB/DP combo PHYs, each of which
supports software-configurable pin mapping and DisplayPort lane
assignment. These capabilities enable the PHY itself to handle both
mode switching and orientation switching, based on the Type-C plug
orientation and USB PD negotiation results.

While an external Type-C controller is still required to detect cable
attachment and report USB PD events, the actual mode and orientation
switching is performed internally by the PHY through software
configuration. This allows the PHY to act as a Type-C multiplexer for
both data role and DP altmode configuration.

To reflect this hardware design, this patch introduces a new
"mode-switch" property for the dp-port node in the device tree bindings.
This property indicates that the connected PHY is capable of handling
Type-C mode switching itself.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

(no changes since v5)

Changes in v4:
- Remove "|" in description.

Changes in v3:
- Add more descriptions to clarify the role of the PHY in switching.

Changes in v2:
- Reuse dp-port/usb3-port in rk3399-typec-phy binding.
---

 .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
index 91c011f68cd0..83ebcde096ea 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
@@ -51,6 +51,12 @@ properties:
       '#phy-cells':
         const: 0
 
+      mode-switch:
+        description:
+          Indicates the PHY can handle altmode switching. In this case,
+          requires an external USB Type-C controller to report USB PD message.
+        type: boolean
+
       port:
         $ref: /schemas/graph.yaml#/properties/port
         description: Connection to USB Type-C connector
-- 
2.51.1



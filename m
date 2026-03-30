Return-Path: <linux-usb+bounces-35683-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPERIfiQymlV+AUAu9opvQ
	(envelope-from <linux-usb+bounces-35683-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 17:04:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DBD35D69F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 17:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05B6E30138C8
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 15:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9766D338925;
	Mon, 30 Mar 2026 15:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+wzTzLJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4A1334C05
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882978; cv=none; b=DQZ1fhIWnzy612OoKUiX4sA5ZkVNyiCXAaCOdgxuFAtYQaIuRAEmSulPp9oUZsOPz1wRUbjgDq0YYa4q+sDkQCZ6o0hxP3SInAvxpmAYs6OpKtZbJ5nyp0WtAF26AjuH3jQ0l6ToeXZHyIls7hbmGjth8MJ3u7JyAxP7hqQ1xx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882978; c=relaxed/simple;
	bh=mYXIm1WLt8UpzUiZmsLBr44Fjyc4CuwjsMIhWi+IAuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dwOesRw4x/T4VJKgV5bSXQ90rHnQYITYyK23GNeY2UyNwoNr28RGEE1Dg2G72m0zHNA2U6akiYJvZWvA3mvBDRSV41Zh6513G6hr0vv2z/W4iU1zFKD7CeAWCaXSM3IvdvcemFmtr+G7MklRw+ft5V7sg91vOcXSfbn3nss1Lfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+wzTzLJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fda2a389so37364305e9.1
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 08:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774882975; x=1775487775; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IefxdwdaNENTe3ijrHdpPLezHBD/mzIOjWzh1r0qkT8=;
        b=M+wzTzLJDUcIHwuwWo2OB/1VQWgS31Ny/QOuzZJVgpsnO6iINGDzHAs1LJkTAz6EOv
         0JDnpKceNG9isCwBmzkqJQTcqvl9WJeJIc/W1lTcN9lK8fA9tfFIkGNFwkfRiqi2xgcd
         7hARSWb4w/VGZXvazzcC+x4n8mkMJ81X1JwzMTqxsIDPgyXsqXj9Vkoakatp5NTgZIFm
         GWIZ9utuk7wGGUuva4j5mVKHEXMvp0VSPa7z/yHrNXBqMBSjlEdjivOtnBzebeFCU9sy
         xHvw2xN2phZBLj7+k35/JBRf1wLZcfwuLtWcX/H18onTDy/RaN5xZkA4L3BjrupBNMP6
         y/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882975; x=1775487775;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IefxdwdaNENTe3ijrHdpPLezHBD/mzIOjWzh1r0qkT8=;
        b=TxkcIUgO8iEFB/Yqp9KhyNcB3LIcdK9NqGWYR+/iZkbsrPmY5GnJDJFgkitc9OLvWX
         812duNLx5GXIiJrOHyysPy4zuk2Act2J3Ueof+PODKextAMX0PzTopyiaSxGcgguoQf4
         yPOx5/w5OugXRtnAG3dk0QEP943uJ0YdTzkPhDcMyrWijH7RCXjUyaTkhhMPhtlNA/q+
         8YeYlgpDb/IwZZE5AGGbnKeRUCQALo/GpaXVrQWGVBpIphhW1tt8MGciNWZlNok5Tcao
         HNNwvuNuk+L/LoegG7C6Qy+2iTsc4NK+cYvaipFlgIVV3Nikag8oh1xcABTva/Nx6Ulj
         b0Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVxKT12PoR5Zg+OAuNUyB8Xfi4Nxf+ugDbFdCRJ0t2nfvO9ksk3sXhPHrULR9rhydrjwn0pJoNFSgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFP1m2VPQXOSRIPbQ7Yn8T+ZieBWHL2vn35NEhZjV2GykRebGv
	xaTFNTWn99YUEvBu4bySL1NDGuz/0ftFLDDkKAMritFt/MNHErIErZPamdaHMg==
X-Gm-Gg: ATEYQzzsSdaxbkomWqDEMWFMkfaVMRCfwBTX1h8FVhpxM5K/4UjFzBr7x/ldDKI+Ptk
	GCdfIOpNuHgC93pEmKn0fNxPRUaEGP7kJrB8HMvfzknoHhUlZ/L2G8EUN0CZyO+Is2vXt/SqNcY
	nlBHPCwBB5ujC6txAP/3TGH8m4VSGn2N4+xSF6xhEHR48E1/MCPtCQIf9QLzWCDfjoBfxhUbv1O
	D00/PFyUJG0WzR4u4NgNa4hVDcNUki/VhXRLOf4w0jY0k+tt3qAveEZt3yA8P87uwpaA3CSRg4d
	FnCYavGuec83Nmdp3zSa8JJkjpFXKzgOXkwM3iNyYTm5lYxnht6EC5EyfNLP5TSy87+dV8ak/1i
	i+QG3GH/s3rId9zpkDV9QjQNq2RE8blZ7nxOv34LJC1B9MTfFdaI4qpc2m0FyrW+HjpE57g2lj+
	tF35hNqq81INQqg7csOAEEmM8Rj18Xj4j45f6xIg7hyWMBD0+Y4iZy
X-Received: by 2002:a05:600c:4e15:b0:485:2ce2:4c8a with SMTP id 5b1f17b1804b1-48727d67a21mr205698365e9.1.1774882974762;
        Mon, 30 Mar 2026 08:02:54 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm18711796f8f.29.2026.03.30.08.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:02:53 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 30 Mar 2026 17:02:42 +0200
Subject: [PATCH] usb: core: avoid double use of 'usb3-phy'
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-usb-avoid-usb3-phy-double-use-v1-1-d2113aecb535@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ5AMBBA0avIrE1SHVFcRSzQwSSi0oYQcXdl9
 9/m3xDYCweokxs8HxLErRFZmsAwd+vEKDYatNKFIl3hHnrsDif2K8JtvtC6vV84mtFwXpVkSBk
 aID42z6Oc/79pn+cFd3WL428AAAA=
X-Change-ID: 20260329-usb-avoid-usb3-phy-double-use-7e498373073c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Stanley Chang <stanley_chang@realtek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,bootlin.com,gmail.com,vger.kernel.org,lists.infradead.org];
	URIBL_MULTI_FAIL(0.00)[sin.lore.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35683-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j4g8y7@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 93DBD35D69F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 53a2d95df836 ("usb: core: add phy notify connect and disconnect")
causes double use of the 'usb3-phy' in certain cases.

Since that commit, if a generic PHY named 'usb3-phy' is specified in
the device tree, that is getting added to the 'phy_roothub' list of the
secondary HCD by the usb_phy_roothub_alloc_usb3_phy() function. However,
that PHY is getting added also to the primary HCD's 'phy_roothub' list
by usb_phy_roothub_alloc() if there is no generic PHY specified with
'usb2-phy' name.

This causes that the usb_add_hcd() function executes each phy operations
twice on the 'usb3-phy'. Once when the primary HCD is added, then once
again when the secondary HCD is added.

The issue affects the Marvell Armada 3700 platform at least, where a
custom name is used for the USB2 PHY:

  $ git grep 'phy-names.*usb3' arch/arm64/boot/dts/marvell/armada-37xx.dtsi | tr '\t' ' '
  arch/arm64/boot/dts/marvell/armada-37xx.dtsi:    phy-names = "usb3-phy", "usb2-utmi-otg-phy";

Extend the usb_phy_roothub_alloc_usb3_phy() function to skip adding the
'usb3-phy' to the 'phy_roothub' list of the secondary HCD when 'usb2-phy'
is not specified in the device tree to avoid the double use.

Fixes: 53a2d95df836 ("usb: core: add phy notify connect and disconnect")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/usb/core/phy.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
index 4bba1c2757406a35bf19eb7984a2807212374d18..4d966cc9cdc9510147041df7875ad9e48a9ea3af 100644
--- a/drivers/usb/core/phy.c
+++ b/drivers/usb/core/phy.c
@@ -114,7 +114,7 @@ EXPORT_SYMBOL_GPL(usb_phy_roothub_alloc);
 struct usb_phy_roothub *usb_phy_roothub_alloc_usb3_phy(struct device *dev)
 {
 	struct usb_phy_roothub *phy_roothub;
-	int num_phys;
+	int num_phys, usb2_phy_index;
 
 	if (!IS_ENABLED(CONFIG_GENERIC_PHY))
 		return NULL;
@@ -124,6 +124,16 @@ struct usb_phy_roothub *usb_phy_roothub_alloc_usb3_phy(struct device *dev)
 	if (num_phys <= 0)
 		return NULL;
 
+	/*
+	 * If 'usb2-phy' is not present, usb_phy_roothub_alloc() added
+	 * all PHYs to the primary HCD's phy_roothub already, so skip
+	 * adding 'usb3-phy' here to avoid double use of that.
+	 */
+	usb2_phy_index = of_property_match_string(dev->of_node, "phy-names",
+						  "usb2-phy");
+	if (usb2_phy_index < 0)
+		return NULL;
+
 	phy_roothub = devm_kzalloc(dev, sizeof(*phy_roothub), GFP_KERNEL);
 	if (!phy_roothub)
 		return ERR_PTR(-ENOMEM);

---
base-commit: f50200dd44125e445a6164e88c217472fa79cdbc
change-id: 20260329-usb-avoid-usb3-phy-double-use-7e498373073c

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>



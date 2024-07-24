Return-Path: <linux-usb+bounces-12374-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C79693AFC7
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2024 12:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C429284022
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2024 10:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0AFB1C6A3;
	Wed, 24 Jul 2024 10:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SxWDYYx6"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB9484A3B
	for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2024 10:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721816646; cv=none; b=WY23AQ8RKdqQldhQRXFDo+lOOL2SMhiQZLrXJVk4it3WSsYJIe0GKgudyAnJ1e9FQeEOQQsqpTIKJ+IR73KiccQgFdkvnLdtEazworb0J16dAcWR8LsZOfHJzLfaZrvvQ/3K54wFfp4yP5juKKy6gCs3/UgztaQ5P3V4v5C20cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721816646; c=relaxed/simple;
	bh=+pBnIWMLOKdXHIqiDIJoSbZQoavTxP0uZ5tx5cA7toY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MLohHyI5P2dfHJyEmNHXo4X0QSpUGjPGVnFbX/CAiDNOcYvUA+H1IDg8XFH0YZWPjo3tgztRpfIMYavGCIVe51Xf6CBQm4Sn1tyNsuxJs4RoZUJjDII22tIdWi70YS2W56/C7cXOaTZDWmu36bwMNHfFLxK+gWLLxcL0XaQvSOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SxWDYYx6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721816643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I19PCaLYW4eNdzXEUWKvva5Wbni2AmhEFpSQbjbJzUI=;
	b=SxWDYYx6aHEh5Qkqgw/nCRqf8jZS8wkHVH7LVOHz8AifoPTS+1bVhpOwNlVATgTRnHSK+F
	C3gj6U1lszMzXj+Gp1OOh5fkaE/lytaM12q8sx2KARsyRUJrxO+XXjC+Mvix/gpGc46tt+
	ZC7jp0rz9eaNYFVuIDHfXvuIUXNMK98=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-371-Qva8zKSxO8eZ132Y-ET1CA-1; Wed,
 24 Jul 2024 06:24:00 -0400
X-MC-Unique: Qva8zKSxO8eZ132Y-ET1CA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E7BE1955F3B;
	Wed, 24 Jul 2024 10:23:58 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.143])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 580801955D44;
	Wed, 24 Jul 2024 10:23:52 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: woojung.huh@microchip.com,
	UNGLinuxDriver@microchip.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy module
Date: Wed, 24 Jul 2024 12:23:44 +0200
Message-ID: <20240724102349.430078-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

The related module for the phy is loaded dynamically depending on the
current hardware. In order to keep this behavior and have the phy modules
available from initramfs, add a 'weak' dependency with the phy modules to
allow user tools, like dracut, get this information.

Include micrel phy module because it is the hardware that I have. Other
possible phy modules can be added later.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/usb/lan78xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 8adf77e3557e..c3945aebf94e 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -5074,3 +5074,4 @@ module_usb_driver(lan78xx_driver);
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL");
+MODULE_WEAKDEP("micrel");
-- 
2.45.2



Return-Path: <linux-usb+bounces-34625-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ME4ZMen4sWl7HQAAu9opvQ
	(envelope-from <linux-usb+bounces-34625-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 00:21:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EDA26B550
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 00:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C1583007659
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 23:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8693A5442;
	Wed, 11 Mar 2026 23:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HU46iou7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970C527A476
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 23:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773271264; cv=none; b=cdSfB9Mv409PEdWVsDQkDkf4/TM80N9UmhhPTfI8PFgnBnt2M3DM7fn0Qdm+ETqzXZkVLa+YjBzkq4y2jCeTzSErP8EXvtqIyDLU2DV7EpzoGJE4SU52yDuLwhJxkZNM5POCZay3bJ29xw3GnyVVhCMVZxcF2gNIoto3U33xvDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773271264; c=relaxed/simple;
	bh=Tw+2EyKUb9agQ6zKe0hRUqwC5xleuQDNBz4yJ156L+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DduQrIs+v7drWorQkDdAVCCY3LueD1boUnFYD1TrEbnOJnZa8QzXj+m3e8FEW+82Ups+9qGPMcTaArjynUYgwyrg0iJxirG2eJPT/BWVDurrYPXSBE8/0xza8NKJBNczmCzynwQMVdz30xlysjuWkXDqHceuKpPuql4UN9PYdRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HU46iou7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so5866415ad.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 16:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773271261; x=1773876061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DkMgiVq7K2oqvd5LIg0pWuilh6oqSCCM4UC7aP9hpy0=;
        b=HU46iou7qqulew9Q1YNo/BcYfAGpODphqmgtC5t/K0mmMKgTjEJoGpWpt0v6t9Nxy4
         TtuBwT4Mkkp1MNoEL+JiKgMaOL/tL94B/G1NIAPxw1xeFfFul2XJCmki2RlCR9qYbxqn
         51kP1Qig+NqiJ17E2eqe7x9xarT1WF2FALLVepJN80zAi+vDA0NVkB42T8HdNX+gId0+
         enmI/LVl50M1T7wY/fozGxGq8a2/0NPBEFIcRAu9f9cmWRnUUvymtAloy6hPkUT9b3eV
         avYiw2b/Ezbpl0h2W9S32WbBKJDJWQ/qotJzFqn5QpH13pRrPFxUNQVchToGvCg9jEDU
         8oHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773271261; x=1773876061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkMgiVq7K2oqvd5LIg0pWuilh6oqSCCM4UC7aP9hpy0=;
        b=AXsXxwAXHe68uSxSgrJ4e8NaLywKatrWd91HqVj6SwA7afwdXx64O8FN1WqtPFl4bV
         i48WO6gzDlewpp78lnVq4+T56XYuvvgG731gHLf0E910qgFjFqs2jTA3n8M3ikEJeZQ7
         qBRzI+CHzZfQ93Qjc2dpdjv8jmBhwl1v7Vj4NA/ttQerNDi4NEVxoYSHfNTcZF7qaVLQ
         etuKmrk9hX9IFa35ga2tnY1W2JcEqlIUbKecyxvRSJVss0Ef5DLIrI2FehizKBUlYJVV
         yVSpBBC45zWMCGAtDVTjzJJRVH6bHxNG7tLtZT3kxKu8o14q5c2IK72PdQs4JLBQvaK+
         aPoQ==
X-Gm-Message-State: AOJu0YzvSxNQxwQcmTdLU8IhwzcSf+YjpHxCQ7XX/BUD3WRek8G60dQr
	Y614nwkQYvLFD6sNf9BGTZi1WTVGXTkWrmbf/Srs0Wsa9t0mbpdbBufm1GxeXrzQ
X-Gm-Gg: ATEYQzyqIa1/AcNpNCc2+0lbQgbo9CSEAIXOR5wYRrOCs8zEjvscopdncUtR2rQu+b4
	4KZ4+SBcvPK1pxRBiVEkF0tAG2LgebAKfQytik34kRpsa5ggchJFqoOq2f4t2L8I1SULohHN9Uc
	jG48rGV/KPCOONTcx4Vfi3MUyCL6IDXOtMxvL4TloSaJzPaNWhP0QzFcY7zIQ0eCGxH3nEgOrO0
	CH/DfqXp1S8mElXi/CIxwlbHn6QFCF8gRHsC/K10jBEyAieL3JEN3E4qo5UiWezqhM7ujeMSUpv
	YDjyDRUK2t35CvkgdlfD3GmAGwIb6/Z6eDpH9MIcTPMPUy41BKZKuVp9pisPg4+FPY2Axj7wjOn
	sKLqqDvR9GOyIT2P8w+19me3xuPa4AY7dBmCK60aMMrRHDpYkszGt895ULJ4DVVPMjcC2P5Bchk
	Y138Kc/ojfK6abK1br9ep3CG512ALP50GG2PnCuVU8eH8wJYoNsOlI0WrmiiwxDVpQSRIDy5bgB
	7jEMxEZ4tBUjweF43EPtdinZGGHh6NXwrOs
X-Received: by 2002:a17:902:f651:b0:2aa:e6fa:2f6c with SMTP id d9443c01a7336-2aeae7d8961mr41552345ad.24.1773271261277;
        Wed, 11 Mar 2026 16:21:01 -0700 (PDT)
Received: from ryzen (c-76-21-102-177.hsd1.ca.comcast.net. [76.21.102.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae261082sm46883805ad.41.2026.03.11.16.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:21:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] usb: renesas_usbhs: use kzalloc_flex
Date: Wed, 11 Mar 2026 16:20:43 -0700
Message-ID: <20260311232043.18025-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34625-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 48EDA26B550
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Removes one allocation and one free by using a flexible array member.

Also added __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/renesas_usbhs/mod_gadget.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 1539e8e6901d..0c7fe109d5c7 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -40,7 +40,6 @@ struct usbhsg_gpriv {
 	struct usb_gadget	 gadget;
 	struct usbhs_mod	 mod;
 
-	struct usbhsg_uep	*uep;
 	int			 uep_size;
 
 	struct usb_gadget_driver	*driver;
@@ -53,6 +52,7 @@ struct usbhsg_gpriv {
 #define USBHSG_STATUS_WEDGE		(1 << 2)
 #define USBHSG_STATUS_SELF_POWERED	(1 << 3)
 #define USBHSG_STATUS_SOFT_CONNECT	(1 << 4)
+	struct usbhsg_uep	uep[] __counted_by(uep_size);
 };
 
 struct usbhsg_recip_handle {
@@ -1084,15 +1084,11 @@ int usbhs_mod_gadget_probe(struct usbhs_priv *priv)
 	int i;
 	int ret;
 
-	gpriv = kzalloc_obj(struct usbhsg_gpriv);
+	gpriv = kzalloc_flex(*gpriv, uep, pipe_size);
 	if (!gpriv)
 		return -ENOMEM;
 
-	uep = kzalloc_objs(struct usbhsg_uep, pipe_size);
-	if (!uep) {
-		ret = -ENOMEM;
-		goto usbhs_mod_gadget_probe_err_gpriv;
-	}
+	gpriv->uep_size	= pipe_size;
 
 	gpriv->transceiver = devm_usb_get_phy(dev, USB_PHY_TYPE_UNDEFINED);
 	dev_info(dev, "%stransceiver found\n",
@@ -1115,8 +1111,6 @@ int usbhs_mod_gadget_probe(struct usbhs_priv *priv)
 	gpriv->mod.name		= "gadget";
 	gpriv->mod.start	= usbhsg_start;
 	gpriv->mod.stop		= usbhsg_stop;
-	gpriv->uep		= uep;
-	gpriv->uep_size		= pipe_size;
 	usbhsg_status_init(gpriv);
 
 	/*
@@ -1175,9 +1169,6 @@ int usbhs_mod_gadget_probe(struct usbhs_priv *priv)
 	return 0;
 
 err_add_udc:
-	kfree(gpriv->uep);
-
-usbhs_mod_gadget_probe_err_gpriv:
 	kfree(gpriv);
 
 	return ret;
@@ -1189,6 +1180,5 @@ void usbhs_mod_gadget_remove(struct usbhs_priv *priv)
 
 	usb_del_gadget_udc(&gpriv->gadget);
 
-	kfree(gpriv->uep);
 	kfree(gpriv);
 }
-- 
2.53.0



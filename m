Return-Path: <linux-usb+bounces-35953-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKP/EMNB0Gk45QYAu9opvQ
	(envelope-from <linux-usb+bounces-35953-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 00:40:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAE4398CED
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 00:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF61830EA48E
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 22:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDB531B810;
	Fri,  3 Apr 2026 22:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bcf4gW2Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AC53242DF
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 22:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255659; cv=none; b=HbWCysmc8Ek+TVdGS+9AwgANCLBl1gS/3+kRYFVSp2mcCkBk+lcqilJI/0DfNZKPbZrJfDsSkEYWLDppVjz5Ig2GFJnlKK8DDvp6fRgGCmgf9SoIaOJYh6sllwqSGvVrU/NljgPRuQ3Tk429omXqxB8/fQ91Ji0yeprLZdKbc04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255659; c=relaxed/simple;
	bh=/mbVbHwfU1OPBxftQbuqd+p4EqiF4kncyA8GPaZAnDY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p/5NITcjUkZkkBX9IYARTJJeq20V1EqWvVOeVmQpmGkaFpSXaZ/ZehJfajFcsxPfFYWQDKtgkXVsNS2tCBPR7IQPU1VnAKxBhYG4yY0KtsybprV0r4lMQ7KBXnFXVx7umH9B2HwHcPDZyMq0T4H2LhaSSq+pqfgij/jUrfqY2IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bcf4gW2Y; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-127133794b6so3488971c88.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 15:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775255657; x=1775860457; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrqOiGLmU/TqfB7pUyMSAKDJK17fNSdE4/EVerFbIPk=;
        b=bcf4gW2YzKjTFTFi3Js576rXSU2aZmnzntcXv59oJVJayLzLe2KorOzEztV8W1KmG+
         9YxTQ4/fENlJJpE22L2QGSwnbLMKebP122W4dJ2UnTUT3Y/NJrjlU7U8LvLlYOMQz0u3
         6CBkW2DS3Xd6A7zI4P5xBmTVNgXb8w+MrhisZ/ZcmaAS5Perhh/hDP9RM9TlS5JOor3B
         UtJKmzDEnPpNBlHHy0JDJYXS12dQ7sAs6eMCjmqau+nxLdmSaz4AguUnZMjC4eZT/Pqt
         sdj2JIqGoN8Qbf0n1JPDq51xHqBZCyUL1smpAZMiCeB75Nd4HkOKLkI6oq5z6Q1pNZBs
         lFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255657; x=1775860457;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UrqOiGLmU/TqfB7pUyMSAKDJK17fNSdE4/EVerFbIPk=;
        b=sqY1RhSJJV0ORm45qklRMW7tPei8onOVRWuAcDI2R6AH1J0rk2RjC8BUr4uBgD0Mpm
         P8mUBBofhpKXTiNvlwEWssWlCOVA6mwyk/JV6f2rHRWrRdwvvdZpa7Gju03kCD6xNAlv
         SE1X3X5TA6UTSbFom2oUAdumfW8Zv8G0R5DhEsM4d/0Go3c/86i7WkVwl8mfJXMhF4J7
         E3DXfHRoT/xP+jFD4drC6HGhQBV61WtaPM+6XKbIjAHFxgsetBKulUOXwg87a7slxVzd
         Y8GVgtDNvX+tjEErYsc+zqU2K7gLhboMQS9nT5X53SKUO6GWgXoSEbBW3v63grY5bryW
         e7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH2wcPqNstIvlA7LVXLkWp0pYxqSE6+PeBhp+oqGELJf6kjceWFGYll70ubq9qB3qS04FHh/lj3IE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqyVyTQ0nj0ZAxH5qIYxPSPWYcP9YuOENoSHYtfE5Q/XPJTXIo
	sZiJemdPwMyhJqH3Z3e54Hu5Q7e1SBtIcJ+wook74+oQmyD7sG1WTgDFcV1EUrE1mckCnLTKkrI
	apK4Qqg==
X-Received: from dlae26.prod.google.com ([2002:a05:701b:231a:b0:12a:6b88:b9c5])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:43a8:b0:11b:9b98:aa4b
 with SMTP id a92af1059eb24-12bfb6ec461mr2298676c88.6.1775255657105; Fri, 03
 Apr 2026 15:34:17 -0700 (PDT)
Date: Fri,  3 Apr 2026 22:33:26 +0000
In-Reply-To: <20260403223357.1896403-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260403223357.1896403-1-jthies@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260403223357.1896403-2-jthies@google.com>
Subject: [PATCH v1 1/2] dt-bindings: chrome: Add cros-ec-ucsi compatibility to
 typec binding
From: Jameson Thies <jthies@google.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	abhishekpandit@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, akuchynski@chromium.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35953-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jthies@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: DDAE4398CED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Chrome OS devices with discrete power delivery controllers (PDCs) allow
the host to read port status and control port behavior through a USB
Type-C Connector System Software (UCSI) interface with the embedded
controller (EC). This uses a separate interface driver than other
Chrome OS devices with a Type-C port manager in the EC FW. Those use
a host command interface supported by cros-ec-typec. Add a cros-ec-ucsi
compatibility string to the existing cros-ec-typec binding.

Additionally, update maintainer list to reflect cros-ec-ucsi and
cros-ec-typec driver maintainers.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 .../bindings/chrome/google,cros-ec-typec.yaml | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.=
yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
index 9f9816fbecbc..fd1a459879bd 100644
--- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
@@ -8,17 +8,28 @@ title: Google Chrome OS EC(Embedded Controller) Type C po=
rt driver.
=20
 maintainers:
   - Benson Leung <bleung@chromium.org>
-  - Prashant Malani <pmalani@chromium.org>
+  - Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
+  - Andrei Kuchynski <akuchynski@chromium.org>
+  - =C5=81ukasz Bartosik <ukaszb@chromium.org>
+  - Jameson Thies <jthies@google.com>
=20
 description:
   Chrome OS devices have an Embedded Controller(EC) which has access to
   Type C port state. This node is intended to allow the host to read and
-  control the Type C ports. The node for this device should be under a
-  cros-ec node like google,cros-ec-spi.
+  control the Type C ports. This binding is compatible with both the
+  cros-ec-typec and cros-ec-ucsi drivers. The cros-ec-typec driver
+  supports the host command interface used by the Chrome OS EC with a
+  built-in Type-C port manager and external Type-C Port Controller
+  (TCPC). The cros-ec-ucsi driver supports the USB Type-C Connector
+  System Software (UCSI) interface used by the Chrome OS EC when the
+  platform has a separate power delivery controller (PDC). The node for
+  this device should be under a cros-ec node like google,cros-ec-spi.
=20
 properties:
   compatible:
-    const: google,cros-ec-typec
+    enum:
+      - google,cros-ec-typec
+      - google,cros-ec-ucsi
=20
   '#address-cells':
     const: 1
--=20
2.53.0.1213.gd9a14994de-goog



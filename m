Return-Path: <linux-usb+bounces-34835-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIn+JAc0t2mSNwEAu9opvQ
	(envelope-from <linux-usb+bounces-34835-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 23:34:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DD5292DCA
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 23:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED2A43006699
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 22:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067CA37D11C;
	Sun, 15 Mar 2026 22:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b="b5T4Vr2R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2268364045
	for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 22:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773614080; cv=none; b=dW0jKxhxLQlIJ0JzBsfZt/e9VsEnLmnbBY5geSygiW2ybXmvl+Gx/xi7IFKbmI65uiwk4L6Ef/HwFRlElOQpLJYznjOXYQ8p2Aicd+V8xkhFgAHL6uOiwzA+tE+uNll3q7dNKZfep9AOWZfgprj1sgJLOAM28PxmvbEkp4jeDe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773614080; c=relaxed/simple;
	bh=hAz0ibag7bUIPe9VwHZNmnJA1+qUWoSc81esR02kZZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZXPcZkSjxF6Pe6tYE8+70flB3hJOJWXXXrXl73xXExPE8YJ/DafDw5CT52ytPlKRd/XUYCx0ihrSYbZRXv6RwJkS7c3bXXxICwPb3BqvSAZ8cA1XdVT7T22hAE6O6WTtPs62zSX2IQdZxK5JQC0Bt1RNe0Es0oxHbo2i+yLbAH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b=b5T4Vr2R; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so42564135e9.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 15:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20230601.gappssmtp.com; s=20230601; t=1773614076; x=1774218876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kHszhjlpTaqduGutGNkiYLzruvsG77pTCC6OqoYXjFk=;
        b=b5T4Vr2ROEW3JVNgBX2qE3mraXLC5mTdwRXgZT/QNTHfWw9SIqEf4bALcAuJmqeVLh
         YKUHMljQjXPZt2h+hx1FaBr8WXDV3gQYzaGvJeIW1OlnitYuChSaUd60Yixf8+KT70qP
         NAQB01pyQRwUReX58LCCpYusEHDsyfxZlU3WPsxB6bkhn1ZT50fZPCUMp/KLMm34LhER
         yikItIEbdkYgy4f/09kp/dmrojvjWH5d3I9xiQzUhvDLSy6XJfB/nbcMm/kbQePUhgKg
         71/nPm91X1j305yU7phbk+xGm2W5U2Z9BmPrvedE0zAw4zcvF9+zE5BomsJXvDrlNuve
         v3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773614076; x=1774218876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHszhjlpTaqduGutGNkiYLzruvsG77pTCC6OqoYXjFk=;
        b=QG1qYR6ge/Br1HQuWyAQ8CQU1k06rWX8Jq+19FM4o+7RNGdggTZssn/NEmMbsmDoY+
         fKyoB30HwzGiZ6tPo/1PkmyqbGpXrabIktHH865JofZ9cR1Dn2DXB0I8xuYaD1/x3SDJ
         uByGQd/vXOFFnp/WzBO37xeJ2HzOd7nRFhCWay2W2P7gvTFV+PiSxEK4VJcTbKLPW3yq
         G78y1tle0EzCAuKMrs6PABqOJUUad2Q742vZ6OzW7wApJeSfXZUo4zrQWL4O+ocorUlR
         Mp22oboSUwTJ3InxIotT2os4G11V/ba+nB4LXEVc1TOmsc6qz22pR8RtljHcoKi85GT0
         dh4w==
X-Gm-Message-State: AOJu0YyhxytK3YEo+RlhAYX4d0Mnn2V2WA+08Y7hN2DebD5maRHIH8k+
	RLSbXIRKIRez5VufCOX6VJU6j+WJXPLGZKvjGD8f9xPuYOIKhnL2CQH64Nnf1jubA3Fl6S/byZ5
	hSKE=
X-Gm-Gg: ATEYQzxEpkLUg2SZMmxHpKnhyNxoQuPPw3qfkODnL2fDmwA/p2Hie9kfET72+VPUQsm
	c7qsp89kreGL0Y7Fvud1lJYz1OZDHtZhFk5Ot8QqHYy5+uniMfGMcxGsxb1WSLBkNC/6dYKIWa9
	x8qzxfe5GTvNXUhRD0ua4oYbiAXZc07ItDrgFJ8Dm+3uKUv3VqobO44Yin0czTD2jLuUjZi8yDL
	c7ll/ZrUIpIvjVtZxkN1fZ4o97LoER+nxpTtFeckSYaB3AqOi/HoqV8dwNVJcRzZ4nc3VZsdM9D
	HCo2mJl0BAUZLyME2DxfRNPLv+duvIpoMM7BIxcSRbT8MaV7cgn8mqsTbFdpiwOpHo27rYad9VM
	x1nLilh7o0cmT2S8JjpUkrg+PszZB2qFjgYKWnxDHv2l+31ldeFEOhhj7PCMg7hwOIyj25OH97Q
	Q0Roy7I+iooX/HuV5e84KRAjTTx4DzvFALx3kxPZ+kWzeSzktoNLs=
X-Received: by 2002:a05:600c:4f8f:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-48556711c6cmr203900915e9.30.1773614075520;
        Sun, 15 Mar 2026 15:34:35 -0700 (PDT)
Received: from starbook ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556433b94sm76294215e9.11.2026.03.15.15.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 15:34:34 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: core: allow ACPI-managed hard-wired ports to power off
Date: Sun, 15 Mar 2026 22:34:33 +0000
Message-ID: <20260315223433.23452-1-sean@starlabs.systems>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[starlabs-systems.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[starlabs.systems : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34835-lists,linux-usb=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[sean@starlabs.systems,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[starlabs-systems.20230601.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73DD5292DCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

USB core only relaxes the default PM_QOS_FLAG_NO_POWER_OFF policy when
an upstream hub reports switchable port power. That misses internal
ports whose power is managed by platform firmware instead of the USB
hub descriptor.

Allow the port-poweroff policy to be exposed for hard-wired ports with
an ACPI-managed power resource. The existing runtime PM path still
requires the child usage count to drop and remote wakeup to be clear
before it will power the port down.

This lets internal devices such as CNVi Bluetooth use the existing USB
ACPI runtime power path even when the root hub reports no USB-standard
port power switching.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/usb/core/port.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index f54198171b6a..6445d05a33be 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -21,6 +21,20 @@ static int usb_port_block_power_off;
 
 static const struct attribute_group *port_dev_group[];
 
+static bool usb_port_allow_power_off(struct usb_device *hdev,
+				     struct usb_hub *hub,
+				     struct usb_port *port_dev)
+{
+	if (hub_is_port_power_switchable(hub))
+		return true;
+
+	if (!IS_ENABLED(CONFIG_ACPI))
+		return false;
+
+	return port_dev->connect_type == USB_PORT_CONNECT_TYPE_HARD_WIRED &&
+	       usb_acpi_power_manageable(hdev, port_dev->portnum - 1);
+}
+
 static ssize_t early_stop_show(struct device *dev,
 			    struct device_attribute *attr, char *buf)
 {
@@ -805,10 +819,10 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	device_enable_async_suspend(&port_dev->dev);
 
 	/*
-	 * Keep hidden the ability to enable port-poweroff if the hub
-	 * does not support power switching.
+	 * Keep hidden the ability to enable port-poweroff if neither the
+	 * USB hub nor platform firmware can manage downstream port power.
 	 */
-	if (!hub_is_port_power_switchable(hub))
+	if (!usb_port_allow_power_off(hdev, hub, port_dev))
 		return 0;
 
 	/* Attempt to let userspace take over the policy. */
-- 
2.51.0



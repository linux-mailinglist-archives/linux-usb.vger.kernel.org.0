Return-Path: <linux-usb+bounces-33792-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INpTES3hoWlcwgQAu9opvQ
	(envelope-from <linux-usb+bounces-33792-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 19:23:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5251BBF2E
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 19:23:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D3F53054345
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 18:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD03374730;
	Fri, 27 Feb 2026 18:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqlYLwD6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8743603EA
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 18:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772216607; cv=none; b=KG4aQqIe/Onwh9NSRE/7OToyjMnRG88lhG8V9PhqoTBO4vSKFSN252vgt176SpW0mGpl2pGmc5z3QBghr+Eiw/m72GXrYO+Oy9nthG+gpfmuYMn50kmiA3yXwAkTAg3dBwNBqDQUDriyl0Hl9e0OHouBPFnRROdu9yB5JRVX55A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772216607; c=relaxed/simple;
	bh=lxCoA2uvMLy2TxnZo+jKDxVDjVgoo7OUvqvrpC4Rcls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hbp6bTgFTQCudm+mwAbDudY8TX3lRMCQqtQPudEzdzMaxqHtzSt61IFj7GvciHlbCPx+cbK9NpSlaOt41DghkmPo4d+EJZ6tN6a7yCcftDn4u8baAkxIokGZo9U1HLY7rY6j1Tfy+GfZn5fSYwwopGVA82P2lHchPznVx4Ijg/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqlYLwD6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ad9f2ee29aso14673715ad.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 10:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772216605; x=1772821405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KWo54tPqkdRAAogk0aSIsm6ksATm/ufoE9BN+ZmicHI=;
        b=EqlYLwD6FbKmM/e7G4TZyFIJlpTAOem7ceL0HRA8vDYByX0ZMVIDGRgdKiAh/F4IH7
         zojf3rbxW/3zbr7+Wfbnb/mC5qD+ER8kq68Fg2AZgTeyRoRaoMQjRsd3yXAg2Whmw3BI
         /3pfXLoaQy4MtNkE5ggeJG3dM0byksRigRtdVXLoQZAJSjF/jRs8F7e+wCNEQzMfIU5K
         jvlYjKNJeg1EyS8fd/KopG8tF5abzuxpuPuuLsIBtgf0dN9AcwWSeh0CKG6E/TVh6Zbd
         3EGRAazA6drU2zQ2kYlsMPSfXL6uob1KKdI32At9tb6nqRYtrZ98wMuI94uaXoHK2+kp
         Z35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772216605; x=1772821405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWo54tPqkdRAAogk0aSIsm6ksATm/ufoE9BN+ZmicHI=;
        b=F3VE8cJE0McYpFyAKpM+xeV0tYSZTpd4/AEaDw6xEzMu8d1arIQn+6CQ51/OV3ZO9F
         GDfZAoIPc3du5bGHxv591Q5tKrT7BrIgOxxMDFAxgtmp6BIOVmjH5DiUYkeCw+Wicg09
         VEL8hssP7ufN6GsnEjTXBk41F6bhcZ+yFc4Mp3R0zllvn9GkDQQKLtbgxt4X0/CWfucG
         hVbK0ETGDPGhL16lOSe13QuVS6JqT17w3HRyZRfq9xj3ffmzT8giA81AzAexyNp4hmga
         cf9GO0Wfo07Kg/mIK6080k8lw2ap22G5vDYABx2B/gxaXrswTMt8BXJ807fwKDYYgItf
         yWIA==
X-Gm-Message-State: AOJu0YwG6JIc71gwZoVGGD4CVeRzr92NdRgcXUAsHA5FxIIHYQYhFpuO
	49VOfxPEhHY6lYdVeEP/L1NiZCW+IUoq74aBp7u14xu6UXtldz8KBz9F
X-Gm-Gg: ATEYQzxPpGM4E4v2LEx1mC/EftjwE/pm6X+QA/r3XcU/Zbe6u7lUw6lFwI4IlUG9ZsA
	iRm9GTpikUQJxlkJVY+eIBUJRBf950UL2LOLZow3opSKkWPyrNbPb9bwSoFZyy04FrHg/3Gzpeg
	DCb9cXGQ1VrdM93tNy3gpk2YTHtTcVCfG7QAlu59i1iDwkA+QaE8PB8k80ksP5zlftabVU49aW3
	s1JxnYtoOV1uY+onuCDZovIpXNEB1nI31C/ZeCbaUD0C451sLFG3G/tk8IHh4buUDwD+8g+qqWR
	IqSAwFh4CWZ5R/WzQRy9VzuRbB09Ohjl8s/73yoGk938XxvWxYpgQDT/i5rZhD9nJmHBpw00PGR
	9PnsqEOtizJQGZ3ZiqQmx2M7LcPkTO0HM8IO5XYbGczMEOWyTzSLC82ZzVEq0D2gjijFR9LZpJ5
	KUvJRbR8uEowRhN9zyNMNRDYBBxM9KJ6TRVsrZZcHQBwfkDZlckk3mF16YpQxqiXyV3MtNcm4=
X-Received: by 2002:a17:903:4b07:b0:2ad:ad0f:bbbe with SMTP id d9443c01a7336-2ae2e4b0a5dmr42459345ad.29.1772216604753;
        Fri, 27 Feb 2026 10:23:24 -0800 (PST)
Received: from HRD-WDG8GDY3.roa.hexagonmetrology.com ([49.43.203.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b03ffsm81774985ad.1.2026.02.27.10.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:23:23 -0800 (PST)
From: Venkata Swamy Kassa <venkatswamy7@gmail.com>
X-Google-Original-From: Venkata Swamy Kassa <venkata.swamy.kassa@hexagon.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Venkata Swamy Kassa <venkata.swamy.kassa@hexagon.com>
Subject: [PATCH] usb: typec: hd3ss3220: Add sysfs attribute for USB role state
Date: Fri, 27 Feb 2026 18:23:16 +0000
Message-ID: <20260227182316.761518-1-venkata.swamy.kassa@hexagon.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33792-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkatswamy7@gmail.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,hexagon.com:mid,hexagon.com:email]
X-Rspamd-Queue-Id: 3A5251BBF2E
X-Rspamd-Action: no action

The HD3SS3220 driver correctly detects USB Type-C cable attach/detach
events and propagates the role to the USB controller. However, there is
no way for userspace to query the current role state (device/host/none).

This becomes problematic when using udev rules to trigger scripts on
role changes. The driver generates kobject change events, but the event
itself doesn't contain the role information. Userspace needs to read
the current state to determine the appropriate action.

Add a 'usb_role' sysfs attribute that exposes the current USB role as
a string ("device", "host", or "none"). Also ensure sysfs_notify() and
kobject_uevent() are called when the role changes, enabling userspace
applications to poll() on the sysfs file or receive udev events.

This is useful for systems that need to:
- Start/stop USB gadget functions based on cable connection
- Switch between host and device modes dynamically
- Monitor USB Type-C port state from userspace

Signed-off-by: Venkata Swamy Kassa <venkata.swamy.kassa@hexagon.com>
---
 drivers/usb/typec/hd3ss3220.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 14a25e4cb034..92c118609e20 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -56,6 +56,28 @@ struct hd3ss3220 {
 	bool poll;
 };
 
+/*
+ * Sysfs attribute to show current USB role (device/host/none)
+ */
+static ssize_t usb_role_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct hd3ss3220 *hd3ss3220 = dev_get_drvdata(dev);
+	const char *role_str = usb_role_string(hd3ss3220->role_state);
+
+	return sysfs_emit(buf, "%s\n", role_str);
+}
+static DEVICE_ATTR_RO(usb_role);
+
+static struct attribute *hd3ss3220_attrs[] = {
+	&dev_attr_usb_role.attr,
+	NULL
+};
+
+static const struct attribute_group hd3ss3220_attr_group = {
+	.attrs = hd3ss3220_attrs,
+};
+
 static int hd3ss3220_set_power_opmode(struct hd3ss3220 *hd3ss3220, enum typec_pwr_opmode power_opmode)
 {
 	int current_mode;
@@ -172,6 +194,10 @@ static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
 	}
 
 	hd3ss3220->role_state = role_state;
+
+	/* Notify userspace of usb_role change */
+	sysfs_notify(&hd3ss3220->dev->kobj, NULL, "usb_role");
+	kobject_uevent(&hd3ss3220->dev->kobj, KOBJ_CHANGE);
 }
 
 static void output_poll_execute(struct work_struct *work)
@@ -310,6 +336,12 @@ static int hd3ss3220_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto err_unreg_port;
 
+	ret = devm_device_add_group(&client->dev, &hd3ss3220_attr_group);
+	if (ret) {
+		dev_err(&client->dev, "Failed to create sysfs attributes: %d\n", ret);
+		goto err_unreg_port;
+	}
+
 	hd3ss3220_set_role(hd3ss3220);
 	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL, &data);
 	if (ret < 0)
-- 
2.34.1



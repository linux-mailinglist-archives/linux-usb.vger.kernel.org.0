Return-Path: <linux-usb+bounces-33793-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOmFAJDhoWmHwwQAu9opvQ
	(envelope-from <linux-usb+bounces-33793-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 19:25:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 746041BBF65
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 19:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83661300EC8A
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 18:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C48F37B3EF;
	Fri, 27 Feb 2026 18:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iycdcgnA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDEA37755B
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 18:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772216708; cv=none; b=sriCgWo6layj1FsAehXKJ9QnjFc5KqP9f8ZMZqqXxlXDwZh1jgcwRvjYIDCq+45B3mjOWUq3KHIXFxiZ9MfybtZ0uhKcinNVpuOhpkiV0KPsYcVg0id+dgj4LBd/3MQkY/58dK6DMFM/lbYJWTJp1dGn7UPHP+vcmcg9UAg4eAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772216708; c=relaxed/simple;
	bh=lxCoA2uvMLy2TxnZo+jKDxVDjVgoo7OUvqvrpC4Rcls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U+OzuyYbBsfkwA4UfZjGf1rxgr94sTYhpYhsgN+SEgFKzCsIqsRg9IAWqmqp4e0os8WOl5A0spnYwjr+sGEEUy1yRPqr+NnTAKjCom1W/V623D+UPdfLEN0YCay9Y1IV5zwnvU5ljy+Fh8AFnhITtHW/R4zSdZ/rzQufw1c1o0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iycdcgnA; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad9a9be502so16203075ad.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 10:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772216702; x=1772821502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KWo54tPqkdRAAogk0aSIsm6ksATm/ufoE9BN+ZmicHI=;
        b=iycdcgnAacKGMz1He3tf4L9FKZthxVnymZk/EgfIQeq1kNw0SzpMwzncsIWiVrW9Ld
         sNpy65P+9mIaZAju9iL/SJVWvnEyuBSTc7LmqFTiyX6sT0yzSkm0MkqGZJx09EXFxlk2
         rpT8pY1ARsK94u2oZ+rBkUmeI4MK2K4461WWUpGnlaBL8Uda+bpsSk4rWLZ1Ky9D8rFy
         YKrQ8uqfKA4Zp+1bXFUTZeIMApHJNXvz5ZpFRHFGqKyRpx0tx+s+XUqFaG/zuXLQMJYF
         nlevDhEfFmpcUIXXWqdT5Jh4UjsCjtvYVlQTlk1eU9Jb6Gh0C4QTiMBf3lWVcybBg9vx
         IBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772216702; x=1772821502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWo54tPqkdRAAogk0aSIsm6ksATm/ufoE9BN+ZmicHI=;
        b=Z42nH9f5A/kpnWk6MZ5U2RIz0S/MOwEfMgvwagsBXL0AZnTRL0YrRUS+EcaE985Kmz
         PA4olEyBL5qkM8jjG++lxclGyNqYGG3NC7ybMfB9eRzfu3al50IzT4hYRDZHDiSDJtZr
         TzJNwODGzDUzW0DoKMeA242EuWaIIsbDALrNhxupopJtif0IBX3WZWzH4aOCEpKkE4iQ
         YOBoO98EyqXIremtEj0FhyN5SuQLFdvotpWN09v+3aBieCHXEzydei1HjYwhjwyaj4Ld
         RLS7UtErfhvcYjW0rQPtGdbdiEn3bVr5+81NMXUfs7gtroRBjuU7RE3jv2+PND5YkRYX
         t2dw==
X-Gm-Message-State: AOJu0YyHPEEN4padoAXNaiP65B5Z8/ZOl4pMY3zBsAppTAyLRzrySs8J
	oXP5e1SWAeKfIURaMIMHHhxRKJ/yC6xiAJ3+T1Rew2SfJpqheqHjwMiCPMGQAwUA
X-Gm-Gg: ATEYQzxb6HL7TcZ/Jhqv1Ekf9t9RzIgdwlhYQdE5JCGB6jibWE86W3/2VhkU9pK22E5
	bzEzfZeIjrBrErLoB9zmrgPOEoOzKTLvRnTF9ZdyaScQ+0FRsR8OHjyD9ZNExhk3vDZw7DBjyWQ
	aV6wPz/vzH7L/fKqY7/Uis+YF/NqEv//JNIiYYHO9TG0FB10oJwvFaWc7T8C6TPg+sJ5S7GF7A0
	/007QuZcUDyHd4e867AJcwRGzdsJHH1AWZcPPO7b9dRGjY9+EgdC3dAPbETbZOAI2I7Yw+i7W8t
	JJt9m4Tje7r9Ygq98wwYi8JOVQqSd7KmXAy3JqXkE23gWNjjkMcmBs/eWjzI1Hlw2RRSbIlt39O
	NF0nNIOXsLliro7g21Vsm9vHvoe31Y6s7wXNnWJtroWSrI+2loYs7o6wKnHxZ8IjvaXYKWu/U24
	D0W2BiD07iqD415AJEhf5PX0UNMnOZcDOOZTZm/mtI8Q+w7XGsZCUeKKKAuldy+BWjpOFC69F2O
	kw8WY+BJQ==
X-Received: by 2002:a17:903:196b:b0:2ae:38d3:a6f1 with SMTP id d9443c01a7336-2ae38d3a70emr5176005ad.45.1772216701513;
        Fri, 27 Feb 2026 10:25:01 -0800 (PST)
Received: from HRD-WDG8GDY3.roa.hexagonmetrology.com ([49.43.203.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912fe1040sm3541975a91.4.2026.02.27.10.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:25:01 -0800 (PST)
From: Venkata Swamy Kassa <venkatswamy7@gmail.com>
X-Google-Original-From: Venkata Swamy Kassa <venkata.swamy.kassa@hexagon.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Venkata Swamy Kassa <venkata.swamy.kassa@hexagon.com>
Subject: [PATCH] usb: typec: hd3ss3220: Add sysfs attribute for USB role state
Date: Fri, 27 Feb 2026 18:24:54 +0000
Message-ID: <20260227182454.761925-1-venkata.swamy.kassa@hexagon.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33793-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,hexagon.com:mid,hexagon.com:email]
X-Rspamd-Queue-Id: 746041BBF65
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



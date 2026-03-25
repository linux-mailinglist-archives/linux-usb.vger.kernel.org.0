Return-Path: <linux-usb+bounces-35423-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGtVIARJw2lnpwQAu9opvQ
	(envelope-from <linux-usb+bounces-35423-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 03:31:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD58D31EB5E
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 03:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FE9F30F087A
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 02:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7A2288517;
	Wed, 25 Mar 2026 02:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ddJ+K32D"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0708282F2F;
	Wed, 25 Mar 2026 02:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774405619; cv=none; b=nJcJ3/+CdkrayYRRrUQ+Mjbmuaee9FX7RY1HQkd5oS+DHTZzRRQV+c4L2Ckh/Qswu/MFqQPhuXHATiO2b31BXpmWMoxj2t05q3ZnxHSfupYwjfn0b1hz2A2eNNH750k3AcgzJzB9FmeQ9l3RD3MdAOoJ6neR/OOBUmBPBuOSBu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774405619; c=relaxed/simple;
	bh=04Qt1XFl8CS/Tja7EKgiunOT9xUgNw6CACKg3kX8N1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HzDneZ57EO3UpX88Mny8wlYC42GWrvJgrZl3tmvCjZtiu9Ak9PXR92neYUnpsm3+9CewbohQY20WGTpQOSqq3DimJSJbn/tv5eutWGOVVLyOXzqCkTyhXUV2IuzUycNH01FDBMQGlP6+oOEVVAbfOsKyQllKItm/NRIb/e7n318=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ddJ+K32D; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vr
	xoW9LHof4n2DhXHns+4S3kI/SB8/jTDG958HcUzjo=; b=ddJ+K32DuWSHciMCug
	hfuN8U+Topq+7+Pxq4YoQroyJ/0YIVYKP4ChUxDZCC1+diDycd/xwiCZB+IzMNiP
	3QnGukMz8nHJaE7DTAEoGEEeP2DMQKQfDGkMGxbTeOHLZUimfdfPtgDKhjeUS82B
	C/h/fU7PqyFCzoyPhIdUUAFy0=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDn7+ncR8NpdiIXXQ--.32248S2;
	Wed, 25 Mar 2026 10:26:37 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: skhan@linuxfoundation.org
Cc: gregkh@linuxfoundation.org,
	i@zenithal.me,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	valentina.manea.m@gmail.com,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH v2] usbip: tools: Add usbip host driver availability check
Date: Wed, 25 Mar 2026 10:26:34 +0800
Message-Id: <20260325022634.279624-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <29c03d8b-c73b-4393-95ff-bbf5c31df86e@linuxfoundation.org>
References: <29c03d8b-c73b-4393-95ff-bbf5c31df86e@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDn7+ncR8NpdiIXXQ--.32248S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF4ruF4rZw1fWFyrGryDWrg_yoW8tryrpF
	WUJFW0krW8WFs3XwsFqF1fAFWUKanrXrWFgr1rJw1rWr47Z3W2g3sxtFnYkw4xGa15XwnF
	gFsIqrWDGFyUJw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jog4fUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC0R1UAGnDR92O+AAA3e
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zenithal.me,vger.kernel.org,gmail.com,kylinos.cn];
	TAGGED_FROM(0.00)[bounces-35423-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[min_halo@163.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinos.cn:email]
X-Rspamd-Queue-Id: DD58D31EB5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

Currently, usbip_generic_driver_open() doesn't verify that the required
kernel module (usbip-host or usbip-vudc) is actually loaded.
The function returns success even when no driver is present,
leading to usbipd daemon run success without driver loaded.

So add a check function to ensure usbip host driver has been loaded.

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
Changes in v2:
- Use system calls directly instead of checking sysfs dir.

 tools/usb/usbip/libsrc/usbip_device_driver.c | 7 +++++--
 tools/usb/usbip/libsrc/usbip_host_driver.c   | 8 ++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
index 927a151fa9aa..45ab647ef241 100644
--- a/tools/usb/usbip/libsrc/usbip_device_driver.c
+++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
@@ -136,10 +136,13 @@ static int usbip_device_driver_open(struct usbip_host_driver *hdriver)
 	hdriver->ndevs = 0;
 	INIT_LIST_HEAD(&hdriver->edev_list);
 
-	ret = usbip_generic_driver_open(hdriver);
-	if (ret)
+	if (system("/sbin/lsmod | grep -q usbip_vudc")){
 		err("please load " USBIP_CORE_MOD_NAME ".ko and "
 		    USBIP_DEVICE_DRV_NAME ".ko!");
+		return -1;
+	}
+
+	ret = usbip_generic_driver_open(hdriver);
 
 	return ret;
 }
diff --git a/tools/usb/usbip/libsrc/usbip_host_driver.c b/tools/usb/usbip/libsrc/usbip_host_driver.c
index 573e73ec36bd..f0ac941d4f6e 100644
--- a/tools/usb/usbip/libsrc/usbip_host_driver.c
+++ b/tools/usb/usbip/libsrc/usbip_host_driver.c
@@ -31,10 +31,14 @@ static int usbip_host_driver_open(struct usbip_host_driver *hdriver)
 	hdriver->ndevs = 0;
 	INIT_LIST_HEAD(&hdriver->edev_list);
 
-	ret = usbip_generic_driver_open(hdriver);
-	if (ret)
+	if (system("/sbin/lsmod | grep -q usbip_host")){
 		err("please load " USBIP_CORE_MOD_NAME ".ko and "
 		    USBIP_HOST_DRV_NAME ".ko!");
+		return -1;
+	}
+
+	ret = usbip_generic_driver_open(hdriver);
+
 	return ret;
 }
 
-- 
2.34.1



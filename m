Return-Path: <linux-usb+bounces-36258-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFNoDQzh32kzZwAAu9opvQ
	(envelope-from <linux-usb+bounces-36258-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 21:03:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FC5407447
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 21:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 378CF302447B
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 19:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811573845D1;
	Wed, 15 Apr 2026 19:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqnXHjLf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79DC311C32
	for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 19:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776279810; cv=none; b=RoMkJ1P1+1gDDJPCriMwT909ajyIGxKc6Debvcm3ZcmYMi/olF/03KJ9j2UrGOgWlkTMNbHodJ0rURSCCZR91baenKgDVZgjX3M/7wSfIVDxbNKDtXMKlsao9vIxnpmLLkQGMZ4lolXVql6s9knYoJjy2Kt2269l1z+1HHJ/RmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776279810; c=relaxed/simple;
	bh=9UFC+iDWRtJNrO7vNXJjscF75KHcs20tnIoUObrAcx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UHs5tLRjEa6JLZ+WfM3DULe6ZGC3F9aWuCdMr8l/RDd+IpPYyf7OTueqFcnMMG0uWVdgKyqgGR4u3FBdgXiDxN6/18KRkkAWogUPeKhpWlWcBlyjgFsxsRNq4qlGRlFY8sFWvc7njVGRGZ6bi98jw3ndxwSgL6D5BrWX5TkS93c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqnXHjLf; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f206f2b54so1926470b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2026 12:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776279808; x=1776884608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2uvy87bgL4dIY+61I0JGqZLh1grbMWSFcGN37dMr2Ck=;
        b=dqnXHjLfjZFiXWVlhWWpzGHUvRpf0Zzkf1WUXCWIXXZsYgYarAI1PMB2UVDSgj7fIj
         r3KquMtuR/uDWyUqqKJmPRBhoCDQjtUOCsGAK87Q0wCj3iLMLbgk3fUIKNtEHkdyCt2I
         okJU+A99EN/xAZpRhsvmQ+DmsRu/iZuc1np8r9v5ANrup04EWC7/9u6Cdv8r8k3jQZTX
         NQl+/jkdBerwZimZ94EGlFiNZygJ5UYlWk+YdhKPGFDSdedegLXcsQcQyCD/XAO+GyOc
         +n2a5QhkMdRY/o7PfgLDoPOiR9y9UFj3exVj3yUPaUHOzOQhAaZi/lh8FtkaJ4oOI/aU
         ho2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776279808; x=1776884608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uvy87bgL4dIY+61I0JGqZLh1grbMWSFcGN37dMr2Ck=;
        b=IHZ8OTtO8/QM5WLOxwtEd1w/hqaoiI0z2InffEPZfkymC9REpSQWRVCASAAtZ2/MPb
         D/9zkEUZI7zW0MnI0VyPj7qAkcZEonhqRik+isEPm2K9xIRgYCW0M8MD87hCvZbcJAH3
         3NZh/iy4HqVfVolW60+IQP/qb1SVNMzpHg1er+c5hyWk72n4+QA9Jy70vxscadniUVOu
         5zjvhwlNtH+ibRWB08H66k5wa6hemWn/jkzUrj8Lm2vMqQ2tFWx/Lf/eWbMAzjyGcirD
         /CcfxgcCaU4fCF7KhiDv5dD4raj5d9f8EAUv+a1rYIw++a/MkiEx1gzm09QW7RN4OMyB
         cTjw==
X-Forwarded-Encrypted: i=1; AFNElJ/8mCTp3XTvyU0pj/wxW2h3GT8Xg6hXBqSZShbW9KEknbzeC/ZS/e8vLtj7dA+MMMAJ/Ed3yHpMrpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvJHXGop+2qAx6z42wXgvK6UyEo2HI+yCwpYBNlgVTzQd0/bdX
	J+tyyV68NDt46phi2IP6GnFNA0Qn2G89BFx7h745g0fm2to0/kTgh4KK
X-Gm-Gg: AeBDiesMk00d5DdVyvXywNgBSU+98Pj7ojIemEVFGg21xOFaSCjMbCvCfDGZPUfSzNI
	1v/a28lbg4u3RSUz3tCo4C7Z5RUcLYAURjo4WIBh6ihazSTmCHLUhFEEGm1W8YIQzWbG+PnzTDp
	e2moTeFH+LgzYsKy9O0Ok1TjDorTXL/8uIeS13PYqjqlZg5UIZZtCqA6baGXvfOHxQqsjds6EvX
	wJ3AUmZN04Q05aEyUk7eow87by+V/3ivHRKqEihsLsnmzC7hnTCg5vkYXOwjr6IANCAAtwqF4QG
	h3M6zUmQ0tK7XjJPjtxy0qLkDSZ96NeaqT+gyG0ozmuJrZBfFDzVqcSj4+h4r3mqEp5PAG0JnFo
	gczmuBu1SnqLxbis/dnaEsoRPJev9oJItGSgyXB5Tj8vo/Ug7XTH8i866v8cQNU1aGogT7DjCsB
	YyM4YHSkPnCvkybLQ95csPlQ2vSF9k/9BtBHY=
X-Received: by 2002:a05:6a00:bd91:b0:829:73f4:6ff with SMTP id d2e1a72fcca58-82f0c2b44a4mr22867066b3a.37.1776279808216;
        Wed, 15 Apr 2026 12:03:28 -0700 (PDT)
Received: from lgs.. ([2409:893d:1171:10e2:93ee:194:b07d:a9b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6f52d45asm1736491b3a.38.2026.04.15.12.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 12:03:27 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Kees Cook <kees@kernel.org>,
	David Brownell <david-b@pacbell.net>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] usb: sl811_cs: fix failed platform device registration cleanup
Date: Thu, 16 Apr 2026 03:03:18 +0800
Message-ID: <20260415190318.3812066-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-36258-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com,kernel.org,pacbell.net,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A4FC5407447
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When platform_device_register() fails in sl811_hc_init(), the embedded
struct device in platform_dev has already been initialized by
device_initialize(), but the failure path returns the error without
dropping the device reference for the current platform device:

  sl811_hc_init()
    -> platform_device_register(&platform_dev)
       -> device_initialize(&platform_dev.dev)
       -> setup_pdev_dma_masks(&platform_dev)
       -> platform_device_add(&platform_dev)

This leads to a reference leak when platform_device_register() fails.

Manual review also shows that sl811_hc_init() sets platform_dev.dev.parent
before calling platform_device_register(), but does not clear it on
failure. As a result, later calls may incorrectly see the device as busy.

Fix this by calling platform_device_put() and clearing
platform_dev.dev.parent when platform_device_register() fails. Also make
sl811_cs_release() only unregister the platform device when it belongs
to the current pcmcia device.

The reference leak was identified by a static analysis tool I developed
and confirmed by manual review.

Fixes: c6de2b64eb575 ("[PATCH] USB: add sl811_cs support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/host/sl811_cs.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/sl811_cs.c b/drivers/usb/host/sl811_cs.c
index ada91ca33f65..096f5fff0bfb 100644
--- a/drivers/usb/host/sl811_cs.c
+++ b/drivers/usb/host/sl811_cs.c
@@ -90,6 +90,8 @@ static struct platform_device platform_dev = {
 static int sl811_hc_init(struct device *parent, resource_size_t base_addr,
 			 int irq)
 {
+	int ret;
+
 	if (platform_dev.dev.parent)
 		return -EBUSY;
 	platform_dev.dev.parent = parent;
@@ -108,7 +110,13 @@ static int sl811_hc_init(struct device *parent, resource_size_t base_addr,
 	 * by referencing "sl811h_driver".
 	 */
 	platform_dev.name = sl811h_driver.driver.name;
-	return platform_device_register(&platform_dev);
+	ret = platform_device_register(&platform_dev);
+	if (ret) {
+		platform_device_put(&platform_dev);
+		platform_dev.dev.parent = NULL;
+	}
+
+	return ret;
 }
 
 /*====================================================================*/
@@ -128,7 +136,10 @@ static void sl811_cs_release(struct pcmcia_device * link)
 	dev_dbg(&link->dev, "sl811_cs_release\n");
 
 	pcmcia_disable_device(link);
-	platform_device_unregister(&platform_dev);
+	if (platform_dev.dev.parent == &link->dev)
+		platform_device_unregister(&platform_dev);
+	platform_dev.dev.parent = NULL;
+
 }
 
 static int sl811_cs_config_check(struct pcmcia_device *p_dev, void *priv_data)
-- 
2.43.0



Return-Path: <linux-usb+bounces-35726-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKvyBye5y2kpKAYAu9opvQ
	(envelope-from <linux-usb+bounces-35726-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 14:08:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E3436946D
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 14:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E34C3020E8D
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 12:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96AA83E120D;
	Tue, 31 Mar 2026 12:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d79A97gy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7E23DCDAA
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 12:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774958715; cv=none; b=g1JKIRaCEQVIjK54iOYWiYoqBmhfLgEsXjVDhgKTGrBQ8S1WrmoVt2lmIXvkWLxCSXeaLw+1FJ8zdrOlrCBIcTsZxHsTAj4OhrRsy37PWYpdRJVS6YgZ3zaCCtJ34Kj3Yzh//Pg+K23I8txKUk7ZOVf4ZgGG8/QyQU1XvIT3Q6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774958715; c=relaxed/simple;
	bh=ia7h4p67UEQUtPZfWYb4Ik04ZWfUakxg9RgGPtRX/ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FbqW7/N5aHA32VVMlDy53nN6Yl6PleeBepHhgR4PL9fNsTd+2KMThJ22JLSwOMsJogX50Qlc2NDTo8DWD3lwPUe/ZdfsOtJlCPfdoPv+Bn2sAvDRKFWaYYOL5gRKVgo1ULBwnrDtu8UJK1WikJDaf4D86Q0VSJH8ipTFiHk4oo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d79A97gy; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82cd5c07f93so433515b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774958713; x=1775563513; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tu9a4Adax7+yOHrEWhhw2scAdrJVzHoTEdbFqoH4Fk8=;
        b=d79A97gy9DtitG8NGxeHykP7RqSlknTIzGQdXxkY/TZSJDjxgKDYEX8jXf+U7SsUSI
         Kh5uMVq6QXsUrQd2ey1tda+xV3iRFsXlVY1zqc/Z2QHFYTIfQ4S7IxCGKbn1b2b0rvk4
         nyxaYnf3zcqZnikf/SJcmK9p3J3JNysFc6JVwDBST42yj3SWNZfL1uZfIZV6TE5WURYB
         bBvF5hAMr8fzuYPnkCVahVjKsA6bUvOMaOsaaYA9ZIRyytdbEWL3Yn0uI3JdqOBjs9+1
         CU0ZM8F8rzConuOn30/f6r+0hU5ZyQQFaEW2pg5D+L9YnhK9s6LezR3TnEH+Hc2aUzDx
         E2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774958713; x=1775563513;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tu9a4Adax7+yOHrEWhhw2scAdrJVzHoTEdbFqoH4Fk8=;
        b=lCUzsLGe7f26zS8Kqh1WbBJvH+GSoClcnsi5eeho8FMnM8qBqKyKcQrLAyGDtl8oof
         ruWniYEqnANf0hugY8yyi20v5NFJoRUShtSScC9QQt3mmjXDM2+88MVwhYaOm6ZWDRrk
         lRz0O200JkVgywm0KrP+DgjWBy5n7njvTtZ0jRlLXx4UcUhPSPeLcRUxj2sKXa5e5EUI
         EXVLzXfoqu5vlcYLaCJNcz+OmP9h9ki9fYhgg2AjDafQIeeMCJxFdqI+dl6sVaPgq4Dg
         5zpcBEJda9ZTPOSaZuiq5TVRET3N1j7qCj0DYWwkHT1pHVOwlHH/W/KIQBOVmhDpwZXP
         2uuA==
X-Gm-Message-State: AOJu0YzcNhV522bwqlAEkIYAl8GJddgsiELIq+IxmccQyEcBKB4fL/56
	QUsVefEXMQId02zuBmtXgOyFCONAtvho4usdqibmU9fHhV+Hw47+2QA9vKI41Eyl
X-Gm-Gg: ATEYQzyn+ig/JeVGCza/wLnX+WsVCHTmLoelAe96UdsYrNjWKUD5J742/qWX2pJfzZy
	gVyQrbl2EeCs7+7CMjJ0AwyS04c+x6eAqMUgXXFyPuD9d0aNsaaxPfE9Od/LPGCHCmqoDR/t2H1
	SKPrAt36zaDGDhm2nE/sxXFYYW1qRt3zoTyRFv1rc9gr5E/X7QEJ0hvQElJ7/Z4Goadz6vHiGBh
	LLUkP6KqfeODMMbRKHRD6uanXu0cNTt+nLJ08CbHUwKJPih8I7P8w0WgPXNCgFdq4CzBvzDkRZG
	h2lYVqdQSIWCWYbNnw3/dunjsAlwAtJSWv86S1OvqS7X/fNopImpPRlLfRuNd3XRh4EI1Z9vpZy
	8y3LRQ+B9adGY1tq2YbmlWrirMJyc0RO6MpMKv/4Dm3ypG4uOVEyVej3TdU3laih4C+oDE2OHE4
	2441gTTIK/ZyMPOP2RBMhV5sO70OhOziYoX8kj
X-Received: by 2002:a05:6a00:bc0b:b0:829:780d:99c9 with SMTP id d2e1a72fcca58-82c95ee0be5mr15416283b3a.26.1774958713286;
        Tue, 31 Mar 2026 05:05:13 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca84646d3sm9597238b3a.15.2026.03.31.05.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 05:05:12 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 31 Mar 2026 20:05:08 +0800
Subject: [PATCH v2] usb: misc: usbio: Fix URB memory leak on submit failure
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-usbio-v2-1-d8c48dad9463@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHO4y2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDY2MD3dLipMx83RRzg1RD02RL80TzRCWg2oKi1LTMCrA50bG1tQB/WZR
 lVwAAAA==
X-Change-ID: 20260330-usbio-d70e15c97a7a
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774958711; l=1600;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=ia7h4p67UEQUtPZfWYb4Ik04ZWfUakxg9RgGPtRX/ro=;
 b=hXOsVv00klRxTwDjK/Ks72O6xtWlxtetGtuMzANyIVzYeiZe3M9u1LZ6ZHWfiOAhkXEruq426
 6Ya+hifJql7C6iKstPHrpWIPaf6vzrl5ADTQafSjAe/1NMB7VhLN6pU
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35726-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 88E3436946D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When usb_submit_urb() fails in usbio_probe(), the previously allocated
URB is never freed, causing a memory leak.

Fix this by jumping to err_free_urb label to properly release the URB
on the error path.

Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Fix Oliver's comment.
- Link to v1: https://lore.kernel.org/lkml/20260330-usbio-v1-1-7141b6dc612a@gmail.com
---
 drivers/usb/misc/usbio.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
index 2e68d48a2cc0..02d1e0760f0c 100644
--- a/drivers/usb/misc/usbio.c
+++ b/drivers/usb/misc/usbio.c
@@ -614,8 +614,10 @@ static int usbio_probe(struct usb_interface *intf, const struct usb_device_id *i
 	usb_fill_bulk_urb(usbio->urb, udev, usbio->rx_pipe, usbio->rxbuf,
 			  usbio->rxbuf_len, usbio_bulk_recv, usbio);
 	ret = usb_submit_urb(usbio->urb, GFP_KERNEL);
-	if (ret)
-		return dev_err_probe(dev, ret, "Submitting usb urb\n");
+	if (ret) {
+		dev_err_probe(dev, ret, "Submitting usb urb\n");
+		goto err_free_urb;
+	}
 
 	mutex_lock(&usbio->ctrl_mutex);
 
@@ -663,6 +665,7 @@ static int usbio_probe(struct usb_interface *intf, const struct usb_device_id *i
 err_unlock:
 	mutex_unlock(&usbio->ctrl_mutex);
 	usb_kill_urb(usbio->urb);
+err_free_urb:
 	usb_free_urb(usbio->urb);
 
 	return ret;

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260330-usbio-d70e15c97a7a

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>



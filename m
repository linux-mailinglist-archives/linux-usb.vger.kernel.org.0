Return-Path: <linux-usb+bounces-32572-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPgnDOhjcGkVXwAAu9opvQ
	(envelope-from <linux-usb+bounces-32572-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 06:28:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CA11051836
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 06:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4784342C9D7
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 05:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74623D525D;
	Wed, 21 Jan 2026 05:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2reOrOv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D3C3BFE4D
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 05:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768973274; cv=none; b=iuDX8ibiz0KMYgKikX6arRd9PSDPx/myWG8mZglwThQuCYueE5RBBpP8oS/WO0nKUTNOYndMr7Kv5ZiOBIeW41nB7S+OrS33jEqrFOhNUBC130Zw/0o5789JDGBHFJCz+/iANdKbHcHs/ONuGlgyl8yoc9hNAz1LKZ/i9fGJUng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768973274; c=relaxed/simple;
	bh=4+qGIBYQiQgwnyRyeazcR24Uq0nZOk1tznx+Iw9+aZk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Cc7lnYUZnYOfICQOZWhSORzS3OwSJHdRmWQPEgjNf20moyub5/4dKBWt+EsJ7B+zFfJ2T1WVNfOOphC9DwQcRo0KWB5s6O/dMjQ3aA2AVpauS0S0ZQTFpGm9pMPND3buM9eRTxyOLMcyX7ypyCGKBvvdqVZ/dfAuEZxjZoDCL2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2reOrOv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso43377385e9.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 21:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768973271; x=1769578071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qIheEWlWP7khFkpwzE1LVxSC8InQJjkFPFcM+Ug8BTY=;
        b=H2reOrOvSquxwzOjwW9c0TPzrue7Zs6dYnC9c2LA6K34gUALQmC6TsYP4i6zF2a3y0
         u9QNKzLghhprpFijd68zU9TgWRRhVUSptrIOnIb82wmxHVwwbMI5Jw50nVfxT9k6UMB8
         b9PHE/gKAA2RpT09s60a3zYaG4ROsvkJwrZox1eaQsbGsXgeBesxcobkah0KAVJ/3W87
         gRSOZqHQV/LdBG6yarIFaSU0VPjY3j06NXMIL7K4M3+wh7CW1XSQCaa+9EgUOmG2EqY4
         Igi0lZSWyLFes4WJzo9qBm+u2CyhmeYAbGi6nDgBkRpI+3+7/h78B0I7mFmXjnUZbfwI
         EMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768973271; x=1769578071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIheEWlWP7khFkpwzE1LVxSC8InQJjkFPFcM+Ug8BTY=;
        b=MBM6SUgWVoxJYlB8CKRhXC1j/+kULFZOA9IlOpqG6Xhkvwez0wdJRY7uJ7lHVNy2Nh
         A2jF9CZQOazk+IDZLv0NfxeVGj6zvpgEBTIFSJl/W6TNHce7tHoEKOGO1CelhEjrB2Eu
         FaB88eYbkBNBmTdPFOoqcqHKd5qGFLGKWBhwNZH5poFw4J9/dTSWxk43OcRWpocx3WxQ
         NWn3wNHpjldVKtebZxXu+gAVK54QRVrTwihtuicUpSDfHrDyux2ZbQR35+yZ1qsO4zDQ
         olGO0sMx5AcQol59g8occM2DNd7paqn6/XX9UDoefxP9Sb8eSzanWCwXuCUOQdxIPf3E
         Gj5A==
X-Forwarded-Encrypted: i=1; AJvYcCUfYFjnA+WJOAiJ9lyY3kfCPThMB+Oig33FmkDcur754y/QSvIiaO7x0KzqFrZkvpRicbdO/gmjT14=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1KUwkaTNQK3kh3+PP95UDF/qbXx9vHzTV/QABzWu3VgDqTt/l
	hlAtZ0kMzzNdxcJvKt/Snm2sHyqc1aVsnwea6uDDYZPhN+kZHVnsDYFY
X-Gm-Gg: AZuq6aLreLCOi9bkBtRpp910hyCPCuZcHFBtWNuQx8Rkqo0pwl2H3B6OepLszo58eqB
	du1fR6gZJUnk9/ghz1dqjxao8b8h65e0b5wyxytZuTDl00XUB3RkYqZgIlpOY+7J8A1VsqAs11w
	2yRkKLp8kSagyeX7TR4wot6H71vb0YfAcLpeYySrkA0fg/7QoewOhi4Zf16nfR5x7lRwib3wbgV
	hYnGvUwqFfMc4z96iH27wsmGbaYthichIMsAe2UNo/YWlfssJKvu1LKmGNhi2ZS/0NGHvUGsZmL
	tUiCZ6wgmyncHJU9NKEOCdfep+INsagTBZNXsOIMOhIqAqJmwN6pz/XWQFfgEZrdc6ZSLBIH8TZ
	sWkgu9ZWIWpUbcCXzKZEJ1p1ynjc4iDqhMtBf+MQe/wREKTCKQoi2V11hY/v6C58E4y4Q5Xy3pQ
	uAcs0nY0t3PUQFCdDrU4byqYSKSw3pRWU20F3PPDnr
X-Received: by 2002:a05:600c:1914:b0:47e:e72b:1fce with SMTP id 5b1f17b1804b1-4801e35868emr206208905e9.37.1768973270340;
        Tue, 20 Jan 2026 21:27:50 -0800 (PST)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992201csm34580052f8f.2.2026.01.20.21.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 21:27:49 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed rescan
Date: Wed, 21 Jan 2026 13:27:44 +0800
Message-ID: <20260121052744.233517-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : No valid SPF, DKIM not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32572-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US]
X-Rspamd-Queue-Id: CA11051836
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PCIe devices behind Thunderbolt tunnels may fail to enumerate when
spurious hotplug events prevent pciehp from detecting link-up.

Root cause:

Spurious unplug events occur immediately after tunnel activation:

  [  932.438] thunderbolt: acking hot unplug event on 702:2
  [  932.852] thunderbolt: PCIe Up path activation complete
  [  932.855] thunderbolt: hotplug event for upstream port 702:2
            (unplug: 0)
  [  932.855] thunderbolt: hotplug event for upstream port 702:2
            (unplug: 1)

These events disrupt pciehp timing, causing device enumeration to fail
~70% of the time on affected hardware. Manual PCI rescan succeeds,
proving devices are present and functional on the bus.

Solution:

Schedule delayed work (300ms) after tunnel activation to:
1. Check if pciehp successfully enumerated devices (device count increased)
2. If not, trigger pci_rescan_bus() to discover devices manually
3. Log results for observability

The delayed work approach is non-blocking and only rescans when actually
needed, avoiding overhead on systems where pciehp works correctly.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
Logs: https://people.canonical.com/~acelan/bugs/tbt_storage/
merged.out.bad: Plugged-in TBT storage, but eventually fails to enumerate
merged.out.good: Plugged-in TBT storage, and successfully enumerates
merged.out.patched: Plugged-in TBT storage, it should fail without this
                    patch, but it works now
---
 drivers/thunderbolt/tb.c | 95 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 293fc9f258a5c..1cfc9a265c453 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_data/x86/apple.h>
+#include <linux/pci.h>

 #include "tb.h"
 #include "tb_regs.h"
@@ -18,6 +19,7 @@

 #define TB_TIMEOUT		100	/* ms */
 #define TB_RELEASE_BW_TIMEOUT	10000	/* ms */
+#define TB_PCIEHP_ENUMERATION_DELAY 300	/* ms */

 /*
  * How many time bandwidth allocation request from graphics driver is
@@ -83,6 +85,16 @@ struct tb_hotplug_event {
 	int retry;
 };

+/* Delayed work to verify PCIe enumeration after tunnel activation */
+struct tb_pci_rescan_work {
+	struct delayed_work work;
+	struct tb *tb;
+	struct pci_bus *bus;
+	int devices_before;
+	u64 route;
+	u8 port;
+};
+
 static void tb_scan_port(struct tb_port *port);
 static void tb_handle_hotplug(struct work_struct *work);
 static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port,
@@ -90,6 +102,60 @@ static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port,
 static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 port,
 					  int retry, unsigned long delay);

+static void tb_pci_rescan_work_fn(struct work_struct *work)
+{
+	struct tb_pci_rescan_work *rescan_work =
+		container_of(work, typeof(*rescan_work), work.work);
+	struct tb *tb = rescan_work->tb;
+	struct pci_bus *bus = rescan_work->bus;
+	int devices_after = 0;
+	struct pci_dev *dev;
+	struct tb_switch *sw;
+	struct tb_port *port;
+
+	mutex_lock(&tb->lock);
+
+	sw = tb_switch_find_by_route(tb, rescan_work->route);
+	if (!sw) {
+		tb_dbg(tb, "Switch at route %llx disappeared, skipping rescan\n",
+		       rescan_work->route);
+		goto out_unlock;
+	}
+
+	port = &sw->ports[rescan_work->port];
+
+	pci_lock_rescan_remove();
+	for_each_pci_dev(dev)
+		devices_after++;
+	pci_unlock_rescan_remove();
+
+	if (devices_after > rescan_work->devices_before) {
+		tb_port_dbg(port, "pciehp enumerated %d new device(s)\n",
+			    devices_after - rescan_work->devices_before);
+	} else {
+		tb_port_info(port, "pciehp failed to enumerate devices, triggering rescan\n");
+
+		pci_lock_rescan_remove();
+		pci_rescan_bus(bus);
+
+		devices_after = 0;
+		for_each_pci_dev(dev)
+			devices_after++;
+		pci_unlock_rescan_remove();
+
+		if (devices_after > rescan_work->devices_before)
+			tb_port_info(port, "rescan found %d new device(s)\n",
+				     devices_after - rescan_work->devices_before);
+		else
+			tb_port_warn(port, "no devices found even after rescan\n");
+	}
+
+	tb_switch_put(sw);
+out_unlock:
+	mutex_unlock(&tb->lock);
+	kfree(rescan_work);
+}
+
 static void tb_queue_hotplug(struct tb *tb, u64 route, u8 port, bool unplug)
 {
 	struct tb_hotplug_event *ev;
@@ -2400,6 +2466,35 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 		tb_sw_warn(sw, "failed to connect xHCI\n");

 	list_add_tail(&tunnel->list, &tcm->tunnel_list);
+
+	/* Verify pciehp enumeration; trigger rescan if needed */
+	if (tb->nhi && tb->nhi->pdev && tb->nhi->pdev->bus) {
+		struct pci_bus *bus = tb->nhi->pdev->bus;
+		struct pci_bus *scan_bus = bus->parent ? bus->parent : bus;
+		struct tb_pci_rescan_work *rescan_work;
+		struct pci_dev *dev;
+		int devices_before = 0;
+
+		pci_lock_rescan_remove();
+		for_each_pci_dev(dev)
+			devices_before++;
+		pci_unlock_rescan_remove();
+
+		rescan_work = kmalloc_obj(rescan_work, GFP_KERNEL);
+		if (!rescan_work)
+			return 0;
+
+		rescan_work->tb = tb;
+		rescan_work->bus = scan_bus;
+		rescan_work->devices_before = devices_before;
+		rescan_work->route = tb_route(sw);
+		rescan_work->port = up->port;
+
+		INIT_DELAYED_WORK(&rescan_work->work, tb_pci_rescan_work_fn);
+		queue_delayed_work(tb->wq, &rescan_work->work,
+				   msecs_to_jiffies(TB_PCIEHP_ENUMERATION_DELAY));
+	}
+
 	return 0;
 }

--
2.51.0



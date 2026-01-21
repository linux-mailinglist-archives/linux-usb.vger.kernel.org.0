Return-Path: <linux-usb+bounces-32575-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CRzLpNtcGkVXwAAu9opvQ
	(envelope-from <linux-usb+bounces-32575-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 07:09:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A6E51E62
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 07:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6A9FB426F79
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 06:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B90D43C05C;
	Wed, 21 Jan 2026 06:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4Xq/O/Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33AA2DE71B
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 06:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768975748; cv=none; b=cHmrdeYvSU2bP5QWdkdT4I9yRAxI+nLFjHwQHTikMh7WjV1OU0xKjVLK/dsPMW9yH56CZdq8v/lQ0RecbVarXkha/MQwakEREg6eHqG3iLZ0k8lsTao3SZRunWraK/oEPqKF7CVjF3BCIb+jbSCV/YXNjX5BFa/6vaYYU6Blawc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768975748; c=relaxed/simple;
	bh=ggqOxQ+04DchXWqW64trK+O9ihGAYkkljmwiZ9snQMo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=OGToc9Wokb6oaZ8D0gSAQdc+NO/M+6vbRY7bUaBoY4dOs/Nw4LNiMvShEPZaKmpzZnS8FjDu3ZQEOlf6CY3Lwbz7A0xynEZ6EWLlh4wzW7cGKU+lSxG9lVvYEJ3MfBOgoriH9aPEwJWxUCYpaDrOCj47eCpTwi43fvtMdf2lxJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4Xq/O/Q; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so4935444f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 22:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768975743; x=1769580543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hIoIuTeKvMzAiFV5gAIrAc6+7LNMHy4t9dDGrPfdKH0=;
        b=Q4Xq/O/QCoBBSjqVRXpfJ22rwd3i/9b2iXAFTXrj6CA51nLct91CyYPVepCkaiHtwT
         g94VP0RithyiiXHRuc3cBDv+1BqWdzGnXjl7tJOOxrhOt6r1rCtNT6wx8J/DCleItKYB
         ds/i7T1T0uJy3x3aTOniqE4/1i905jH43LABIEDurfiXtgnhNNH+saeZjNGqHt8KYWhu
         ebWAv6As+M26nw50hULrW0Y+7RKuhH+e975VoTpOQEIX4oovqiHEThIGYtPCccjuT+fU
         +GUsYB3cH1f5GkM3arKtZ1YtPxotq7n+unCFI2zPuP2z4p9D5FtUGMKxV5dVRUlJaHy1
         mNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768975743; x=1769580543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIoIuTeKvMzAiFV5gAIrAc6+7LNMHy4t9dDGrPfdKH0=;
        b=Js1+o6Q/cZl9fqCAhP7v96HkORTszQQnThkSnknJ0xzJi5Ml/XhB1PsrOCcuvifE8T
         CnPyHcHqLcuBvVqV1KwaCpGyCPKd2gXbdE8Lq22KhPtpvTK9lHP+kfcooHfxFQHqgiqj
         mBYmEKojuVMPc5n0EtlPoEVPuPuMDecUpq2vXA7yLxU5fSUcuJHhmCk/v8yo08WwYhAR
         Vc2pQesjxsYsMxrRqm6ysR7UiE2MaOo49BlsVItPRuc1JsrWdJdIe3ltWzsdWLjdxcfK
         UCEu3c4jXC6J/1jlpe25EO7fZnXVaxJVSotFAb154vsJ19pshHOYEl2SeJYTt3III1Vs
         Yo2A==
X-Forwarded-Encrypted: i=1; AJvYcCVa7KrP3bGjO2OooEg2A0jHo/A6iRNXaKdLR0E3khE62wS8OCJ+zBJJaHjfrBQ3dugkbtkNz7uukmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBkx6ws0LS3vqu8XQV+DD8KvpYTZdKHeAPt7Iia1usjol1UXcL
	caKiHOyq/Qw39G4dQimZbsZ2Y1RZt8qkejlXM9mmG1lyd0SiI0MJrTb+
X-Gm-Gg: AZuq6aJSsalRUE2tEhDBEutWPnrmGOW7Lnwl4uuzd3sSRwmFGjIat6fhltzXY7QJETh
	XSDQjc5frWwgmYWC+yEZBsI84Fc7GS+tDH4z9VMsJDX2L/+xYLw0IDAet2hJ2i/uvkSLbP43/dy
	6RLqz8oSZwEJ6wyNlypaeojLNPx0fBmJUAXSv/bDbJ6GJmzKYJC5p5gO+Lle6OC3fFrJVJPGz7J
	NsE8X6MMZfb/6HoQsIwAN86LQLOHrl4ncdVKKthhs3UF+lGTc+B82EExgHXLeFear3CDVOqEJHc
	EHzj/d3LUwYHADnONDKUEN9o6OyiGnFMTCl8mLoWBvR9wct/lnsjLYMM7NGfozCxCbndG2IU8wz
	67tyiHiTH7mmwmwSP2U4gvJpXGOJ31D7cSE16Hfduhew4gvxi67Qws0HL40Wv19RNG5tb1EqA3V
	S0hrc1VxLsIkxmO7X0jfkFqdclpuOfMuHdiZj7qxgHmweRPiKi7WY=
X-Received: by 2002:a5d:4652:0:b0:435:97fc:6f1c with SMTP id ffacd0b85a97d-43597fc6f6emr2466754f8f.25.1768975742480;
        Tue, 20 Jan 2026 22:09:02 -0800 (PST)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921da2sm34071988f8f.1.2026.01.20.22.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 22:09:01 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] thunderbolt: Fix PCIe device enumeration with delayed rescan
Date: Wed, 21 Jan 2026 14:08:57 +0800
Message-ID: <20260121060857.237777-1-acelan.kao@canonical.com>
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
	TAGGED_FROM(0.00)[bounces-32575-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,canonical.com:email,canonical.com:mid,canonical.com:url];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US]
X-Rspamd-Queue-Id: 62A6E51E62
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
index 293fc9f258a5c..a3761be6eeea4 100644
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
+		rescan_work = kmalloc(sizeof(*rescan_work), GFP_KERNEL);
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



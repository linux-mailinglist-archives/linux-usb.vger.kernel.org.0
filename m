Return-Path: <linux-usb+bounces-38080-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPOeLh2UFmpUngcAu9opvQ
	(envelope-from <linux-usb+bounces-38080-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 08:50:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2185DFFD2
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 08:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0F00301BEC8
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 06:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067253B5314;
	Wed, 27 May 2026 06:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="PPQOkH4c"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2581A3B4EB0
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 06:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779864594; cv=none; b=thax2KS0THD8I3QnY/LHzSNKjIUhPmeXYGL8wIF+tF9+rH7leJzZU9B68FkkUvguj62X5NB99JjXZxYBr0wnjqhDP0YzNY/dAtwmJOJqwy1rg5bEqJn9Bt6q3MozcjKuuDb4vPS202Wsb9bMQbobzkZkDRmCBII25cfdz7UjdMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779864594; c=relaxed/simple;
	bh=2eE85DAOOzZkxQWu0AgDKUBoWCkafUlWcRaJYyt8LOo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ELjZ5+nJuek2TstWJiUe2pWDgKT5hI5slnlBni8hMS1PUmGDw0F6byFTvQEyO6nWeQ81Ijzs0MkyWuZzHUN+sOTo/VggxrhGyAmna/cjGPiCXzaTQv85D5yEUWT3NUSLu6utu5tYS4ennXunmJJekmymFWx/kf1nfyoX5INnBpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=PPQOkH4c; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 994D13F971
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 06:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1779864099;
	bh=YnIU/WDlLavcpBXaBFNNf33TA4YXxB62T7YSUrvnnZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=PPQOkH4cv+4b+ZQ8qN+jdXFBo0BvVAyB2XWoqM3b6aLrG1iO+5O3himCQ/VPpLbdz
	 d2Gws4w6XDkignW5QpHd3VScZ8pE0bWSiWKaZMqc2lRH9NQaHYnxUIs/YmjMVGbskv
	 L03jQqHABfbI7L2Bbsi5Gf1moRe8s65XJ2HUscYebcRtePZuvbcMErKS9lYZOIhE9w
	 suMV/7ICUfN0UFGG3s5Wwqu5JYQ038B1FneqdZ5F+eoeLMLPxPEp2avbmNbeznP0al
	 jJnDos+omv3VMU2bow4EHdQl6lVIfuwCAdhsd8RBeJAM2forlaJSgesXZOICGKCA/7
	 VPwQEzYBpZXXydU6LH86pdO79Lk+j73XayMEPqZUzJs/Hzpzb2ZET7T3iws6MA1Dxq
	 GpSvuvIJ1LGUmP7knw+1XQYbOCCNgZKYsYT9vvpIOsosukD2UB0+rxXmVQ5hinR6qU
	 OppLQ0ZnXD5Rkw+jazw3fZUANg8HoPJrJizQLml11aa4NO5IKbgwaqu6NOSBtnd4mf
	 QcLwUNJTKOd9Uj3SNKY/gn2C8T7x5rOrJ93wfK/+MD1D9ig8o8wJLL8E222u2EzVvB
	 ZDr00QQdo9Iz3qBQ+PvErLrD91uOl0JosXqQkADg6O/jv/1qjQJc72i6YI9BK4Y4Km
	 04wsoHrXmgdIPZSBbCQtoQMc=
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2be9fa93a52so13028595ad.2
        for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 23:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779864098; x=1780468898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YnIU/WDlLavcpBXaBFNNf33TA4YXxB62T7YSUrvnnZ4=;
        b=DoEQe+aapbWu/K8kWFN6mBeTuWBp1aOp5/Fbt2wUdP0pfzZGz+42IZbfk601blv0gl
         MrjR4f+0cyLrsM0eUH55VqhEsdREbBynDCCaj6GqM4nZrdQK5YaSSMUegNsXoYOlSHzA
         fNVCxzTEdK67c2ualRr5xUJZNG8C459B5rb5IOw769JDSR4xMybYZ+D7iIa78TFyXl2q
         bAjBKO///NDYk53ZAOa74IyywG9ZdXZWBn0BUfCyyK76/6aEhNVe9uaya862wjBFSVIY
         QXtjkQceFufUmyhyYSo7gzngvt2qRozYL3ztos8EguQwe44rZlWPYwgRx8L6ffEn+Z8I
         HLEA==
X-Forwarded-Encrypted: i=1; AFNElJ/mfwQfg0I3IMy2bJvenKhXNIC65aH/jN1NZ5vyhTnTwc+nvWJ4FnN3SmoyK9VJ/EbyzZykchXMuTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSxq0iQMGafUj5KVtZGewpamv0BdKAzc3EdOmsOWn2hSFX8KKl
	55Fzw5dpLHwf5+UnR0bSyWvpEO+SGqmDZaly3oobfV0Ppg0aiMwTiso9B5w1xlsqpTwyNEI+OtW
	vdn8kv6pk2ULtgQX1aZiBmZZ2wdzgeeOu+qBfO76tgO6LMxt6mk4r0WEzLM2LHgtXqFw9lZCxRN
	8DNQ==
X-Gm-Gg: Acq92OGm11FWPfGWWt04WV/4SspTwgdd5L/APHojmC45GAxdyjcxKQh6DpRhGQseifB
	Svt6ZsQryEpqsjRA7q+oKdo5KAXSV0c98sF128unfSeQZOxAsKepe5GIL+nT4Zy2u7lvtdWT2rY
	vsJMWOyx6aiskHcPN2bXNJ3l5FSj3nXauaEV51TTl4KvLyZSrwI/4/0lOMbxSbmUVtYv+WKMfzj
	x4HdYeZAs4Xy03XNqtr99YWKBxrBRl7rCjGctoZYId7QxbOrxbNj9ORcrzwkhC06OrooOJB2Ffj
	cf2CtIuYZh2YMKFhl0MiJGXa+mqYZV03KvSAQQvWzWP9Ysj4VKXyBEF45PV1x9swYL21xic0kuE
	yiv+30QpXU/KI7aQvYy8e6kIX8CtEBXllckMNjIFVKJqVOWu/u4kskKedDVqrMLYyXWOW5taFo3
	8G4F0nE6mearxd2sGz0uoItU5FdskBy0+Uu9Lpnh0Y83P/81Ilp4WyZHujeWYz4amCySxUatSEZ
	/3Wc3uYpM4GyEvYPis=
X-Received: by 2002:a17:902:d581:b0:2b0:606b:6fc5 with SMTP id d9443c01a7336-2beb066e847mr145240575ad.3.1779864098138;
        Tue, 26 May 2026 23:41:38 -0700 (PDT)
X-Received: by 2002:a17:902:d581:b0:2b0:606b:6fc5 with SMTP id d9443c01a7336-2beb066e847mr145240405ad.3.1779864097720;
        Tue, 26 May 2026 23:41:37 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-658f-4fd7-7372-71f3-d446.dynamic-ip6.hinet.net. [2001:b011:2008:658f:4fd7:7372:71f3:d446])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58fef85sm141361335ad.75.2026.05.26.23.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 23:41:37 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: mika.westerberg@linux.intel.com
Cc: andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] thunderbolt: Defer DP tunnel teardown until display driver is ready
Date: Wed, 27 May 2026 14:41:21 +0800
Message-Id: <20260527064121.173952-2-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527064121.173952-1-an.wu@canonical.com>
References: <20260527064121.173952-1-an.wu@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38080-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[an.wu@canonical.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[canonical.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:email,canonical.com:mid,canonical.com:dkim]
X-Rspamd-Queue-Id: 3D2185DFFD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the Thunderbolt driver loads early (e.g., from initramfs)
and discovers a BIOS-established DisplayPort tunnel, it starts
asynchronous DPRX polling which checks if the GPU driver has
read DPCD from the connected monitor within a 12-second timeout
(TB_DPRX_TIMEOUT).

On systems with Full Disk Encryption (FDE/LUKS), the GPU driver
(i915, xe, amdgpu, etc.) resides on the encrypted root filesystem
and cannot load until the user enters the passphrase. This creates
a driver load ordering issue where the DPRX timeout fires before
the GPU driver has had a chance to initialize, causing the
Thunderbolt driver to permanently tear down the DP tunnel and
remove the DP IN adapter from available resources. Recovery
requires a physical re-plug of the dock.

Fix this by deferring the DP tunnel teardown when no PCI display
driver has bound yet. Register a PCI bus notifier that watches
for display class (PCI_BASE_CLASS_DISPLAY) driver bind events.
When the DPRX timeout fires:

 - If no display driver is bound: tear down the tunnel but keep
   the DP IN adapter in the available resources list, allowing
   a retry.
 - If a display driver is already bound: proceed with the
   existing behavior of permanently removing the DP IN resource.

When a display driver eventually binds, the notifier triggers a
DP tunnel retry via a scheduled work item, re-establishing the
connection.

This approach requires no changes to GPU drivers and handles all
GPU vendors (Intel, AMD, NVIDIA) through the generic PCI base
class check (0x03xx covers VGA, XGA, 3D, and other display
controllers). It also handles the FDE case gracefully since the
defer and retry can span an unbounded passphrase wait.

Tested on Dell Pro Max 14 MC14250 with Dell SD25TB5 Thunderbolt
5 Dock and LUKS full disk encryption. Simulated a 58-second
delay between TB and GPU driver loading -- display came up
successfully after display driver bound.

Signed-off-by: ChunAn Wu <an.wu@canonical.com>
---
 drivers/thunderbolt/tb.c | 96 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 88 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 95d84612e06e..48e0b540fbec 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -62,6 +62,9 @@ MODULE_PARM_DESC(asym_threshold,
  * @remove_work: Work used to remove any unplugged routers after
  *		 runtime resume
  * @groups: Bandwidth groups used in this domain.
+ * @pci_nb: PCI bus notifier to detect when a display driver binds
+ * @display_bound: Set when a PCI display driver has bound
+ * @display_retry_work: Work to retry DP tunneling after display driver binds
  */
 struct tb_cm {
 	struct list_head tunnel_list;
@@ -69,6 +72,9 @@ struct tb_cm {
 	bool hotplug_active;
 	struct delayed_work remove_work;
 	struct tb_bandwidth_group groups[MAX_GROUPS];
+	struct notifier_block pci_nb;
+	bool display_bound;
+	struct work_struct display_retry_work;
 };
 
 static inline struct tb *tcm_to_tb(struct tb_cm *tcm)
@@ -1914,6 +1920,58 @@ static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
 	return NULL;
 }
 
+static void tb_tunnel_dp(struct tb *tb);
+
+/*
+ * Check if any PCI display class (0x03xx) device has a driver bound.
+ * Used to decide whether to defer DPRX polling at boot.
+ */
+static bool tb_is_display_driver_bound(void)
+{
+	struct pci_dev *pdev = NULL;
+
+	while ((pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev))) {
+		if (pdev->driver) {
+			pci_dev_put(pdev);
+			return true;
+		}
+	}
+	return false;
+}
+
+static void tb_display_retry_work_fn(struct work_struct *work)
+{
+	struct tb_cm *tcm = container_of(work, struct tb_cm, display_retry_work);
+	struct tb *tb = tcm_to_tb(tcm);
+
+	mutex_lock(&tb->lock);
+	tb_dbg(tb, "display driver bound, retrying DP tunneling\n");
+	tb_tunnel_dp(tb);
+	mutex_unlock(&tb->lock);
+}
+
+static int tb_pci_notifier_fn(struct notifier_block *nb, unsigned long action,
+			      void *data)
+{
+	struct tb_cm *tcm = container_of(nb, struct tb_cm, pci_nb);
+	struct device *dev = data;
+	struct pci_dev *pdev;
+
+	if (action != BUS_NOTIFY_BOUND_DRIVER)
+		return NOTIFY_OK;
+
+	pdev = to_pci_dev(dev);
+	if ((pdev->class >> 16) != PCI_BASE_CLASS_DISPLAY)
+		return NOTIFY_OK;
+
+	if (!tcm->display_bound) {
+		tcm->display_bound = true;
+		schedule_work(&tcm->display_retry_work);
+	}
+
+	return NOTIFY_OK;
+}
+
 static void tb_dp_tunnel_active(struct tb_tunnel *tunnel, void *data)
 {
 	struct tb_port *in = tunnel->src_port;
@@ -1955,6 +2013,7 @@ static void tb_dp_tunnel_active(struct tb_tunnel *tunnel, void *data)
 		}
 	} else {
 		struct tb_port *in = tunnel->src_port;
+		struct tb_cm *tcm = tb_priv(tb);
 
 		/*
 		 * This tunnel failed to establish. This means DPRX
@@ -1963,16 +2022,26 @@ static void tb_dp_tunnel_active(struct tb_tunnel *tunnel, void *data)
 		 * loaded or not all DP cables where connected to the
 		 * discrete router.
 		 *
-		 * In both cases we remove the DP IN adapter from the
-		 * available resources as it is not usable. This will
-		 * also tear down the tunnel and try to re-use the
-		 * released DP OUT.
+		 * If no display driver has bound yet (common during boot
+		 * with FDE/LUKS where the GPU driver loads late from
+		 * the encrypted root filesystem), tear down the tunnel
+		 * but keep the DP IN resource available. The PCI bus
+		 * notifier will trigger a retry once a display driver
+		 * binds.
 		 *
-		 * It will be added back only if there is hotplug for
-		 * the DP IN again.
+		 * Otherwise, remove the DP IN adapter from available
+		 * resources as it is not usable. It will be added back
+		 * only if there is hotplug for the DP IN again.
 		 */
-		tb_tunnel_warn(tunnel, "not active, tearing down\n");
-		tb_dp_resource_unavailable(tb, in, "DPRX negotiation failed");
+		if (!tcm->display_bound && !tb_is_display_driver_bound()) {
+			tb_tunnel_warn(tunnel,
+				       "not active, deferring until display driver loads\n");
+			tb_deactivate_and_free_tunnel(tunnel);
+		} else {
+			tb_tunnel_warn(tunnel, "not active, tearing down\n");
+			tb_dp_resource_unavailable(tb, in,
+						   "DPRX negotiation failed");
+		}
 	}
 	mutex_unlock(&tb->lock);
 
@@ -2984,6 +3053,9 @@ static void tb_deinit(struct tb *tb)
 	struct tb_cm *tcm = tb_priv(tb);
 	int i;
 
+	bus_unregister_notifier(&pci_bus_type, &tcm->pci_nb);
+	cancel_work_sync(&tcm->display_retry_work);
+
 	/* Cancel all the release bandwidth workers */
 	for (i = 0; i < ARRAY_SIZE(tcm->groups); i++)
 		cancel_delayed_work_sync(&tcm->groups[i].release_work);
@@ -3410,8 +3482,16 @@ struct tb *tb_probe(struct tb_nhi *nhi)
 	INIT_LIST_HEAD(&tcm->tunnel_list);
 	INIT_LIST_HEAD(&tcm->dp_resources);
 	INIT_DELAYED_WORK(&tcm->remove_work, tb_remove_work);
+	INIT_WORK(&tcm->display_retry_work, tb_display_retry_work_fn);
 	tb_init_bandwidth_groups(tcm);
 
+	/* Check if a display driver is already bound (e.g. hotplug after boot) */
+	tcm->display_bound = tb_is_display_driver_bound();
+
+	/* Watch for display driver binding to defer DPRX until GPU is ready */
+	tcm->pci_nb.notifier_call = tb_pci_notifier_fn;
+	bus_register_notifier(&pci_bus_type, &tcm->pci_nb);
+
 	tb_dbg(tb, "using software connection manager\n");
 
 	/*
-- 
2.34.1



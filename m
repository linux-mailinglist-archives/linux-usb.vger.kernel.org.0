Return-Path: <linux-usb+bounces-38082-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFpGAueYFmrmngcAu9opvQ
	(envelope-from <linux-usb+bounces-38082-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 09:10:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B27805E03FF
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 09:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCEE2303D561
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 07:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E313B83F0;
	Wed, 27 May 2026 07:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="sQGFJN7p"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCEB3B8124
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 07:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779865659; cv=none; b=Z+fxZmp1P3OsAsKBR5Xv5kpudS/jifaqaIqLgUqY8lyDURBpfcPQpVX7kMkmcae+OgTqeQXevMtss0Q7/1fzZNjvuAbyhMixr/rGlAocD2wehpItT5WMRVXA7NoK0jb6sVj8A4E3xrJDPu6p5j9+Kgr5AvELn2gUxmVw7EDnvVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779865659; c=relaxed/simple;
	bh=2eE85DAOOzZkxQWu0AgDKUBoWCkafUlWcRaJYyt8LOo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uhYzpCaEZW6HAH9sZYEBs94jqWBzXo2bemNH1vaW5ef4/5Amqd6BaH+sU/NWMh71C4v7eb7x0/nKlRYs1e+mEPdth5WdIEgQ1O5P8FOs7+ULNjEsifAs8IBOPIvXbvY7m/9SolqK1fF42vmDqBIB25dE3jc8skYUX0f4TxBaj/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=sQGFJN7p; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D187D3F7B0
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 07:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1779865654;
	bh=YnIU/WDlLavcpBXaBFNNf33TA4YXxB62T7YSUrvnnZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=sQGFJN7pTrSNC43jhr8dii206BGGBBDJam1z3thC0CdYLdH/VRmw/wa1wYNPImNUT
	 mtFIS1Y49TUJyrdLe4HgVmH4kNyMZYT5uDVgdFGh6IJsKxgpycT0Ud6FieJ+GD0PHG
	 aVLcc04hgj6bpcb0VPYj5b5WE3JtED9WrbmVSdhMBhGOdREC8zBy1GULwuvxwl9P2v
	 i0U7lUz1doxXJb/ec9H78HecrL1G9Iwl2L8q/aKsK7VOuFuggh4V3bddJBMrAcZOog
	 y2ZMx0k/8CLTFeKO9CYVHxZN5dZO55r9eLwGLnNIoWPhlkcDQ6aGeNBq/GH2p1dw77
	 2cuTuqLyGcBUKpSTC+ecrYoar5ueYDk8UP8uy5n0eDUso85k3/q7AeJlFVnomkZy8R
	 6fpGp0XYb55agZ5SSMRPM+ANi3/yi4G/e4PElzmqM0veqEATiTf/SyFb0O3Gc6cUp2
	 XVb+Tbvcy58OewdM3m8fdtcdztb43U59PVy0NHQmYOsexu8z9DxCdVxSOcFtzfojfN
	 9ds8KfBtxpsMhzSQJhLFn4ugv+AG9SawsJFcSZYKjxZntQ3FCqWXKq9Q+rqIwicMCS
	 medh7jDMPKJXxa2TXMnYdJmGaGiLXbfXFU8d1rpLyWVA0mKaeYEmPyKQEpDnvsRKl8
	 +UTVz7uiq27JgRqpHM1uSDVk=
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baad4ffa63so28790915ad.1
        for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 00:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779865653; x=1780470453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YnIU/WDlLavcpBXaBFNNf33TA4YXxB62T7YSUrvnnZ4=;
        b=EzUeFvAtem+2nVGE7p8FzEYsxLC4tLSnEVGpasXdTXJ9PaBpmqgrltUryb+SSI5tMN
         8H2Zi3o/peUGG4x2UcQXxuRPsiaBCIMcHX1iqTBKo+0/KmK+T50/sfv27Ts4qR/wXaq4
         o8/4vk7IhriLc4lwF4JdSJqNW8IDNsiKdJ3CrhPybNq2vv9QUF4dKF9DGaANpFy9hxk2
         QA2p9ZCR8gMgs22Es1NSoB9P/DaM76uOrNCIYNkgSebF+L6c9evtl+S81U5TuEHp6gpH
         uW56a8RqY1X5n0+Ar/yQ4azBpJi6+cAzFt6nv3BJ9FrqCU1DXpFRtDWQKx23hhoDOLPW
         YBEw==
X-Forwarded-Encrypted: i=1; AFNElJ9dP1/BivLHOtP/ydoClhlSqb0LNj7T863PuB2ZBY+U3q4TS9Zz1ckSwTYIrKxGyp16b0sF/YVmpLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKK2/m3oYHS5wNZwc8/KTRqmuCNYrKCKLzvEJCzBfoW8qZ/p0c
	paLrsKQhv9/jKiGVRoIeBLYyetW3G6ea3V8Aq+/Z7BnN+4+FWN9Y4mX7FKC2JJfIotXEzgt9CaH
	4x6xzbo5GS/tYEqMXDbI11HRv3JDW+yPj1tzscF30WCjZzlL9EoR9zUascyMdyGBOCUyxdhqCd+
	m9Jpwtw/0ebg==
X-Gm-Gg: Acq92OHAqbeuqY/c1ZH/lBaRazRCEP7180HxGJpkXwPb8WcmCaibtxL+kfvSII3Ffb4
	skDAOZBRLYWz92rKSKkA4LKZICeMUMmrqT6dwmJ+xypk5oQ0OiB7p4TGBe+J+BoYQ8/pu/ZuEUa
	Vhm0dW7luvSzD3an3jsd3zyglTtKHV4RbTbG6o47/uk0bwPzduWIElrihfJu5C6ckrBEryD+bjt
	+UMaQr/U6/TuaBUSTWRDKIMevyIasNGng+od0OsglPHnEfjwoNln31LXTTK8hF4dI/EieHH3/DV
	JDLXYNzeQzg3Lx7UcJg53oZNiJsfFX2xMxC+lw+OX/DRt6v1NGo6F3dQa6cT4NY8a5oIyg0D+HR
	CfDvs43KPU+AKNWQ5G5oj9+LxYkzexIIn7KUStHjdnMfCN6R5tSjeLM+o0kRKTHPoEN0FUEs9fl
	8KbC5T1Bhag26m5jUg2MZkCEFN/GBUi68bQJITJSlChXVeBkSUH+BRyK8ngI8c1jChq22IGLaY8
	0HaMT4NEpl5se7cy/I=
X-Received: by 2002:a17:903:110d:b0:2ae:6220:1539 with SMTP id d9443c01a7336-2beb06697b1mr128604965ad.6.1779865653327;
        Wed, 27 May 2026 00:07:33 -0700 (PDT)
X-Received: by 2002:a17:903:110d:b0:2ae:6220:1539 with SMTP id d9443c01a7336-2beb06697b1mr128604865ad.6.1779865652940;
        Wed, 27 May 2026 00:07:32 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-658f-4fd7-7372-71f3-d446.dynamic-ip6.hinet.net. [2001:b011:2008:658f:4fd7:7372:71f3:d446])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm184029595ad.6.2026.05.27.00.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 00:07:32 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: mika.westerberg@linux.intel.com
Cc: andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] thunderbolt: Defer DP tunnel teardown until display driver is ready
Date: Wed, 27 May 2026 15:06:30 +0800
Message-Id: <20260527070630.175538-2-an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527070630.175538-1-an.wu@canonical.com>
References: <20260527070630.175538-1-an.wu@canonical.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38082-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,canonical.com:email,canonical.com:mid,canonical.com:dkim]
X-Rspamd-Queue-Id: B27805E03FF
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



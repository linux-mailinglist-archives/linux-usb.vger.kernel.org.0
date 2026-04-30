Return-Path: <linux-usb+bounces-36737-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDF6BJkF82nawgEAu9opvQ
	(envelope-from <linux-usb+bounces-36737-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 09:32:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7605D49EA67
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 09:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E345A302B238
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 07:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FB23B7B64;
	Thu, 30 Apr 2026 07:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLrQ88So"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5133B8BC3
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 07:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534323; cv=none; b=jRpoJvvaxT1QHG94yW1NfUtx2g6j4DBXfC1gKKUkMO9qLMdGNsXximoHRJwGRZl5CEya5e/Zz1PYszhcJtm7NPZXGqiiAzCzHQu3ON5qQmDY77VBeYgEZbAe+GCOdTvg/6LqFIzslFvhQFvEIv87qTknAvwbJ3Y/7gwmz+ut1Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534323; c=relaxed/simple;
	bh=7RsouvFjpj5GmxVRn+glZzUg1LkRrQtIaq/9AwVnpB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DuKVFHi6CFUWGDL/pbmzyNXnnQflBdLXn+ezqmxypTj7OiFNK+j6l2D2AGs64xD9lz9N/3u3aswhP/a/VnidU2wmnJ4bppWtP2Cd1l28wQ6fLYpUkq8nbTyCxy/6d0uOVAOZMBGzzCCd4uoAOXsuXaaoeFM0XCoAAoGPurqyIDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLrQ88So; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8acb3daf2aaso10201816d6.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 00:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777534319; x=1778139119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3I8n1sOfvbTqiIP+WwNqLVTCh1bELZRbLWAtaqgXdo=;
        b=NLrQ88So8ydyQX19AVBlU9Cq9K46dMnBfgkxS43QThcmwYN6KL5Q9vbPbumLSnZFia
         WjOrspjfsl0ZU9DylKCKz+9LBsCHcKYwuI1MWD5JYw8Uw4iRCcrnCcj7urlz0K56+SLi
         HQSFiafVxk2o5gH2LW6ikReMtzzJa6S3oGn8ADeVcLYXpX+rpduz3Fe4fDm6sZO+30MR
         +6K7/kJAPyZZQG6eSxM6oFZO3G9ZPa9AOy5SlBbIqcKNlZmhJJlI9rGs5gkKuiIeda06
         46TPUaTS7WkOBpymgOHkY5y+MzCP3xQeQtAsG1/KFmjq9yY8XU+wLqz7dfiSjeL0T8nN
         YG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534319; x=1778139119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3I8n1sOfvbTqiIP+WwNqLVTCh1bELZRbLWAtaqgXdo=;
        b=OkODtvJMsF32QH0HMUdBt19gZU1Gcdx/x0HbIZeFlzWCL/zO247HlCv1ynnVmkf8UR
         lERVEurhM31tOD6X67lRgs2upkqAFNoK4xZGVnLcWJAbs1rSBRxLRPdSdlqkcTZdQE+P
         3Lp+alg0wNPEODlPSi4sLT9Ma13oR9uN0k+KUugX2aja6KMWeHo63ixikkXVVwe+ZqTH
         P7Gb8ucdaSHbuKc+jlTjJOImJjwAxPSSKx3azqEeYtByk8QIYqf1z1xLeW9M485ed8Fc
         6mGTifMhA7Zto8hEulBtcPINWEzagvanXBKWrlFNi8XF46bMJqpjnRajE9LLUwCpooU0
         4kRw==
X-Gm-Message-State: AOJu0YxgsOWZtcldUebiC7icEKOZ/ta/KK1b0ehTJHA9Q/VgELzknLyV
	I/FyFQE2k1sJazdD2728DRUG01GAsJCnOvjPQj8yOnGhyettPeOgKp4n
X-Gm-Gg: AeBDiesXsAuX0R2U/VIBBzdaijGoBKIs5NEeTE2JIPzXfIViFlidRb+YpxmS51JDtl7
	hzbbGVl9QQ4Hka29ApRY+rUJd/DLgAzeP7dmuH+w+Xaf9ae6htTHt1/ngK8VQeyR60OuACdDIXm
	zRuJh+29ny9TWIZkFpyMYBgo+RcxjcUj9glvdQ8Z8VuGEy5ZWzK0a3PKkv7udz+DC4CtK4s94e9
	M5GwZtU2h2Sxs7yld6y6F6B4lw0xtvSRJXItKgcbRrpFVt/9L5ikGZ2C13D27aNOp+NhVp0Jz3s
	RmktVplmYf7++IgKWuE9btEWtAjw7WlElDMNxGzglOXvfTBQUmkQ61+a1uHoaXB0tPIz4OP9vOR
	9eOGFPKgKVyaksZqUB+NEJ6z+gkOdUdqt6d8E38Ynn5Uu7HRiIsaTnUBEyKbK5PV3h+JeOydQOU
	zuwjJQLGfYxbTgPnfD
X-Received: by 2002:ad4:5d4d:0:b0:8ac:a097:2810 with SMTP id 6a1803df08f44-8b3fece79a6mr23335726d6.27.1777534319165;
        Thu, 30 Apr 2026 00:31:59 -0700 (PDT)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ff323874sm11583506d6.12.2026.04.30.00.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:31:57 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] thunderbolt: Retry DP tunnel setup on DPRX negotiation failure
Date: Thu, 30 Apr 2026 15:31:43 +0800
Message-ID: <20260430073145.331419-2-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430073145.331419-1-acelan.kao@canonical.com>
References: <20260430073145.331419-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7605D49EA67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36737-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:mid,canonical.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[]

On USB4 v2 routers the Host Router Reset (HRR) performed during
nhi_probe() destroys all BIOS-established tunnels. When the driver
re-creates the DP tunnel after hotplug re-discovery, DPRX negotiation
may fail because the graphics driver is not yet ready.

Currently the driver permanently removes the DP IN adapter from the
available resources on the first DPRX failure, leaving the external
display blank until the next reboot.

Fix this by retrying the DP tunnel setup up to 3 times with a 5-second
delay between attempts, giving the graphics driver time to initialize.
The retry counter is reset on success and on suspend.

Cc: linux-usb@vger.kernel.org
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

---
 drivers/thunderbolt/tb.c | 63 +++++++++++++++++++++++++++++++++-------
 1 file changed, 52 insertions(+), 11 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c69c323e6952a..19052cac078a2 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -25,6 +25,15 @@
  */
 #define TB_BW_ALLOC_RETRIES	3
 
+/*
+ * Number of retries for DP tunnel DPRX negotiation if it fails during
+ * boot. This commonly happens on USB4 v2 routers where Host Router
+ * Reset (HRR) destroys BIOS-established tunnels and the Thunderbolt
+ * driver re-creates them before the graphics driver is ready.
+ */
+#define TB_DP_ACTIVATE_RETRIES	3
+#define TB_DP_ACTIVATE_DELAY	5000	/* ms */
+
 /*
  * Minimum bandwidth (in Mb/s) that is needed in the single transmitter/receiver
  * direction. This is 40G - 10% guard band bandwidth.
@@ -59,6 +68,8 @@ MODULE_PARM_DESC(asym_threshold,
  *		    after cfg has been paused.
  * @remove_work: Work used to remove any unplugged routers after
  *		 runtime resume
+ * @dp_retry_work: Work used to retry DP tunnel setup after DPRX failure
+ * @dp_retries: Number of remaining DP tunnel activation retries
  * @groups: Bandwidth groups used in this domain.
  */
 struct tb_cm {
@@ -66,6 +77,8 @@ struct tb_cm {
 	struct list_head dp_resources;
 	bool hotplug_active;
 	struct delayed_work remove_work;
+	struct delayed_work dp_retry_work;
+	int dp_retries;
 	struct tb_bandwidth_group groups[MAX_GROUPS];
 };
 
@@ -1903,11 +1916,25 @@ static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
 	return NULL;
 }
 
+static void tb_tunnel_dp(struct tb *tb);
+
+static void tb_dp_retry_work_fn(struct work_struct *work)
+{
+	struct tb_cm *tcm = container_of(work, struct tb_cm,
+					 dp_retry_work.work);
+	struct tb *tb = tcm_to_tb(tcm);
+
+	mutex_lock(&tb->lock);
+	tb_tunnel_dp(tb);
+	mutex_unlock(&tb->lock);
+}
+
 static void tb_dp_tunnel_active(struct tb_tunnel *tunnel, void *data)
 {
 	struct tb_port *in = tunnel->src_port;
 	struct tb_port *out = tunnel->dst_port;
 	struct tb *tb = data;
+	struct tb_cm *tcm = tb_priv(tb);
 
 	mutex_lock(&tb->lock);
 	if (tb_tunnel_is_active(tunnel)) {
@@ -1915,6 +1942,8 @@ static void tb_dp_tunnel_active(struct tb_tunnel *tunnel, void *data)
 
 		tb_tunnel_dbg(tunnel, "DPRX capabilities read completed\n");
 
+		tcm->dp_retries = 0;
+
 		/* If fail reading tunnel's consumed bandwidth, tear it down */
 		ret = tb_tunnel_consumed_bandwidth(tunnel, &consumed_up,
 						   &consumed_down);
@@ -1943,8 +1972,6 @@ static void tb_dp_tunnel_active(struct tb_tunnel *tunnel, void *data)
 			tb_increase_tmu_accuracy(tunnel);
 		}
 	} else {
-		struct tb_port *in = tunnel->src_port;
-
 		/*
 		 * This tunnel failed to establish. This means DPRX
 		 * negotiation most likely did not complete which
@@ -1952,16 +1979,26 @@ static void tb_dp_tunnel_active(struct tb_tunnel *tunnel, void *data)
 		 * loaded or not all DP cables where connected to the
 		 * discrete router.
 		 *
-		 * In both cases we remove the DP IN adapter from the
-		 * available resources as it is not usable. This will
-		 * also tear down the tunnel and try to re-use the
-		 * released DP OUT.
-		 *
-		 * It will be added back only if there is hotplug for
-		 * the DP IN again.
+		 * On USB4 v2 routers Host Router Reset (HRR) at boot
+		 * destroys BIOS-established tunnels and the driver
+		 * re-creates them before the graphics driver is ready.
+		 * Retry a few times to allow the graphics driver to
+		 * come up.
 		 */
-		tb_tunnel_warn(tunnel, "not active, tearing down\n");
-		tb_dp_resource_unavailable(tb, in, "DPRX negotiation failed");
+		if (tcm->dp_retries < TB_DP_ACTIVATE_RETRIES) {
+			tcm->dp_retries++;
+			tb_tunnel_warn(tunnel,
+				       "not active, retrying in %d ms (attempt %d/%d)\n",
+				       TB_DP_ACTIVATE_DELAY, tcm->dp_retries,
+				       TB_DP_ACTIVATE_RETRIES);
+			tb_deactivate_and_free_tunnel(tunnel);
+			queue_delayed_work(tb->wq, &tcm->dp_retry_work,
+					   msecs_to_jiffies(TB_DP_ACTIVATE_DELAY));
+		} else {
+			tb_tunnel_warn(tunnel, "not active, tearing down\n");
+			tb_dp_resource_unavailable(tb, in,
+						   "DPRX negotiation failed");
+		}
 	}
 	mutex_unlock(&tb->lock);
 
@@ -2937,6 +2974,7 @@ static void tb_stop(struct tb *tb)
 	struct tb_tunnel *n;
 
 	cancel_delayed_work(&tcm->remove_work);
+	cancel_delayed_work(&tcm->dp_retry_work);
 	/* tunnels are only present after everything has been initialized */
 	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list) {
 		/*
@@ -3073,6 +3111,8 @@ static int tb_suspend_noirq(struct tb *tb)
 	tb_switch_exit_redrive(tb->root_switch);
 	tb_switch_suspend(tb->root_switch, false);
 	tcm->hotplug_active = false; /* signal tb_handle_hotplug to quit */
+	cancel_delayed_work(&tcm->dp_retry_work);
+	tcm->dp_retries = 0;
 	tb_dbg(tb, "suspend finished\n");
 
 	return 0;
@@ -3383,6 +3423,7 @@ struct tb *tb_probe(struct tb_nhi *nhi)
 	INIT_LIST_HEAD(&tcm->tunnel_list);
 	INIT_LIST_HEAD(&tcm->dp_resources);
 	INIT_DELAYED_WORK(&tcm->remove_work, tb_remove_work);
+	INIT_DELAYED_WORK(&tcm->dp_retry_work, tb_dp_retry_work_fn);
 	tb_init_bandwidth_groups(tcm);
 
 	tb_dbg(tb, "using software connection manager\n");
-- 
2.53.0



Return-Path: <linux-usb+bounces-36195-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJr+GZ3N3GmcWQkAu9opvQ
	(envelope-from <linux-usb+bounces-36195-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 13:03:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C87183EB0F2
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 13:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 641D130842BC
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 10:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF393BD25E;
	Mon, 13 Apr 2026 10:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4DerSQo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BCA3BBA17;
	Mon, 13 Apr 2026 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776077689; cv=none; b=EKbO7KUoyrDCL9L4pi0YcT4hi/jhiCEmwdd1QwNimZ472JtI/jWuuFnSuAErF7bJS04c9RgjvYAVw4Nnps74qTGORKYsoBOvXdMQrCqO7uKYiWpaawhGmK9bUiY1hsnYkBRNqTjeLBybtJPSXYaGEmHxjDurt8jEUvLxNTlnVmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776077689; c=relaxed/simple;
	bh=tX4u6rxbcVu/rAM/mkVY2j6k9GiJM0gD5Ng8E6Hlbw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=D6EtJrq38ve0xS1FaLYo8WLGvueVI+bEm2exgwuUUqzGVrvrJJHyT7mvbLo1hdeASiPqrIDwDtD8tz7s3IaHesC47aXtSxJVv0yZkeUwm+P4buwyq59C4mNAWTmFPYvXCs+DpFu0p90KXfJTlWZoCIj+RUwzmpjh/6n6BmkXELo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4DerSQo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A491C116C6;
	Mon, 13 Apr 2026 10:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776077688;
	bh=tX4u6rxbcVu/rAM/mkVY2j6k9GiJM0gD5Ng8E6Hlbw4=;
	h=From:Date:Subject:To:Cc:From;
	b=g4DerSQoE+xU7TCJsiEbyA8diSbmyb9hXE+5nhtXkdemlwkx1bNhvQ+xT2xb+loqL
	 h8C3nW1m+TNkF1H7mfGmqRBxg+q1rLROEjgqV5+to+6VCmUN0gWT+AD/lNelRh2TTf
	 Xcj2AgXkoWNGrn40CSWE7ZcBilrZzVDWGbpbPDjcYoxKBWX436hrhbeCltg4uiFMM+
	 9ZsmQE24u5pEhCi5h4z2c3S/OVfJ2LE6Fi6I39o/oCUKWtJ/t+ThBuDSgDrDgbIuKs
	 HTV1Dn+08vI3YhaPFvk/qxPiUaqHdte3O25a4wGBosrTGddEOXtGMths2EQyrexyZt
	 sLvM0GgxYwu7g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 13 Apr 2026 12:54:41 +0200
Subject: [PATCH RFC] thunderbolt: Skip reading Rsvd SB registers on
 older-gen hardware
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260413-topic-usb4_limit_sb_reads-v1-1-778a6eb37f7b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBPSTKirRIjlVAP94VgE0d2Tl
 t/ivQcYAyFDkz0Q8CKmfUuQeQbD7LYJBflkUIUyhZaliPtBgzi513ahlaLl3gZ0nkVtKvTKVEo
 7Cak/Ao50/++2e98P8e455msAAAA=
X-Change-ID: 20260413-topic-usb4_limit_sb_reads-965ed26524a1
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gil Fine <gil.fine@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776077686; l=6832;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=JqZtxxzdSp46InCA8Lfoqox15T4kvjuOcXmda7SPX6k=;
 b=iCufOgEfJ1odnwi9DO/kbhRLPVY1i6hfaeEPHyg82/tTaCZA46KkK5FN4gpBrhs1g3VDfsGQY
 FtCetBWcdydDC6rPycb6DbBHvkgHVwSFxqvf+9GF6O2dr8bhHB2WETL
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36195-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,intel.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: C87183EB0F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Linux TBT subsystem supports hardware aligned with the latest
USB4 v2.0 specification. In some places though, it assumes registers
only defined in that specification version (previously marked as
Reserved) are always accessible.

Every version of the spec states:

"""
Unless specified otherwise, the Connection Manager shall not write a
register with a value that is marked as “Rsvd”. Writing a register with
a value that is marked as “Rsvd” results in undefined behavior.
"""

The effective list of SB registers that need this guarding currently
exclusively contains ones that aren't used outside the debugfs dump
logic, so just add the required checks there.

Fixes: 54e418106c76 ("thunderbolt: Add debugfs interface")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/debugfs.c | 20 ++++++++++++--------
 drivers/thunderbolt/retimer.c | 11 ++++++++++-
 drivers/thunderbolt/sb_regs.h | 11 ++++++-----
 drivers/thunderbolt/tb.h      |  2 ++
 4 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 042f6a0d0f7f..b74685bcd2a8 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -67,6 +67,7 @@ enum usb4_margin_cap_time_indp {
 struct sb_reg {
 	unsigned int reg;
 	unsigned int size;
+	u8 min_spec_ver;
 };
 
 #define SB_MAX_SIZE		64
@@ -75,9 +76,9 @@ struct sb_reg {
 static const struct sb_reg port_sb_regs[] = {
 	{ USB4_SB_VENDOR_ID, 4 },
 	{ USB4_SB_PRODUCT_ID, 4 },
-	{ USB4_SB_DEBUG_CONF, 4 },
-	{ USB4_SB_DEBUG, 54 },
-	{ USB4_SB_LRD_TUNING, 4 },
+	{ USB4_SB_DEBUG_CONF, 4, .min_spec_ver = 2 },
+	{ USB4_SB_DEBUG, 54, .min_spec_ver = 2 },
+	{ USB4_SB_LRD_TUNING, 4, .min_spec_ver = 2 },
 	{ USB4_SB_OPCODE, 4 },
 	{ USB4_SB_METADATA, 4 },
 	{ USB4_SB_LINK_CONF, 3 },
@@ -92,11 +93,11 @@ static const struct sb_reg retimer_sb_regs[] = {
 	{ USB4_SB_VENDOR_ID, 4 },
 	{ USB4_SB_PRODUCT_ID, 4 },
 	{ USB4_SB_FW_VERSION, 4 },
-	{ USB4_SB_LRD_TUNING, 4 },
+	{ USB4_SB_LRD_TUNING, 4, .min_spec_ver = 2 },
 	{ USB4_SB_OPCODE, 4 },
 	{ USB4_SB_METADATA, 4 },
 	{ USB4_SB_GEN23_TXFFE, 4 },
-	{ USB4_SB_GEN4_TXFFE, 4 },
+	{ USB4_SB_GEN4_TXFFE, 4, .min_spec_ver = 2 },
 	{ USB4_SB_VERSION, 4 },
 	{ USB4_SB_DATA, 64 },
 };
@@ -2347,7 +2348,7 @@ DEBUGFS_ATTR_RW(counters);
 
 static int sb_regs_show(struct tb_port *port, const struct sb_reg *sb_regs,
 			size_t size, enum usb4_sb_target target, u8 index,
-			struct seq_file *s)
+			u8 spec_version, struct seq_file *s)
 {
 	int ret, i;
 
@@ -2358,6 +2359,9 @@ static int sb_regs_show(struct tb_port *port, const struct sb_reg *sb_regs,
 		u8 data[64];
 		int j;
 
+		if (regs->min_spec_ver > spec_version)
+			continue;
+
 		memset(data, 0, sizeof(data));
 		ret = usb4_port_sb_read(port, target, index, regs->reg, data,
 					regs->size);
@@ -2388,7 +2392,7 @@ static int port_sb_regs_show(struct seq_file *s, void *not_used)
 	}
 
 	ret = sb_regs_show(port, port_sb_regs, ARRAY_SIZE(port_sb_regs),
-			   USB4_SB_TARGET_ROUTER, 0, s);
+			   USB4_SB_TARGET_ROUTER, 0, port->config.thunderbolt_version, s);
 
 	mutex_unlock(&tb->lock);
 out_rpm_put:
@@ -2503,7 +2507,7 @@ static int retimer_sb_regs_show(struct seq_file *s, void *not_used)
 	}
 
 	ret = sb_regs_show(rt->port, retimer_sb_regs, ARRAY_SIZE(retimer_sb_regs),
-			   USB4_SB_TARGET_RETIMER, rt->index, s);
+			   USB4_SB_TARGET_RETIMER, rt->index, rt->spec_version, s);
 
 	mutex_unlock(&tb->lock);
 out_rpm_put:
diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index b1e8d9d6454d..b27a34fe83ea 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -389,8 +389,8 @@ const struct device_type tb_retimer_type = {
 static int tb_retimer_add(struct tb_port *port, u8 index, u32 auth_status,
 			  bool on_board)
 {
+	u32 vendor, device, version;
 	struct tb_retimer *rt;
-	u32 vendor, device;
 	int ret;
 
 	ret = usb4_port_sb_read(port, USB4_SB_TARGET_RETIMER, index,
@@ -409,6 +409,14 @@ static int tb_retimer_add(struct tb_port *port, u8 index, u32 auth_status,
 		return ret;
 	}
 
+	ret = usb4_port_sb_read(port, USB4_SB_TARGET_RETIMER, index,
+				USB4_SB_FW_VERSION, &version, sizeof(version));
+	if (ret) {
+		if (ret != -ENODEV)
+			tb_port_warn(port, "failed read retimer Version: %d\n", ret);
+		return ret;
+	}
+
 
 	rt = kzalloc_obj(*rt);
 	if (!rt)
@@ -417,6 +425,7 @@ static int tb_retimer_add(struct tb_port *port, u8 index, u32 auth_status,
 	rt->index = index;
 	rt->vendor = vendor;
 	rt->device = device;
+	rt->spec_version = FIELD_GET(USB4_SB_FW_VERSION_VERSION, version);
 	rt->auth_status = auth_status;
 	rt->port = port;
 	rt->tb = port->sw->tb;
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index 5391502a4b87..a9c2d22ff69f 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -12,10 +12,11 @@
 
 #define USB4_SB_VENDOR_ID			0x00
 #define USB4_SB_PRODUCT_ID			0x01
-#define USB4_SB_FW_VERSION			0x02
-#define USB4_SB_DEBUG_CONF			0x05
-#define USB4_SB_DEBUG				0x06
-#define USB4_SB_LRD_TUNING			0x07
+#define USB4_SB_FW_VERSION			0x02 /* Retimer-only */
+#define USB4_SB_FW_VERSION_VERSION		GENMASK(7, 0)
+#define USB4_SB_DEBUG_CONF			0x05 /* Port-only, USB4 v2.0 */
+#define USB4_SB_DEBUG				0x06 /* Port-only, USB4 v2.0 */
+#define USB4_SB_LRD_TUNING			0x07 /* USB4 v2.0 */
 #define USB4_SB_OPCODE				0x08
 
 enum usb4_sb_opcode {
@@ -42,7 +43,7 @@ enum usb4_sb_opcode {
 #define USB4_SB_METADATA_NVM_AUTH_WRITE_MASK	GENMASK(5, 0)
 #define USB4_SB_LINK_CONF			0x0c
 #define USB4_SB_GEN23_TXFFE			0x0d
-#define USB4_SB_GEN4_TXFFE			0x0e
+#define USB4_SB_GEN4_TXFFE			0x0e /* USB4 v2.0 */
 #define USB4_SB_VERSION				0x0f
 #define USB4_SB_DATA				0x12
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 217c3114bec8..7eba058e9c2b 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -335,6 +335,7 @@ struct usb4_port {
  * @no_nvm_upgrade: Prevent NVM upgrade of this retimer
  * @auth_status: Status of last NVM authentication
  * @margining: Pointer to margining structure if enabled
+ * @spec_version: The implemented USB4 Retimer Specification version
  */
 struct tb_retimer {
 	struct device dev;
@@ -346,6 +347,7 @@ struct tb_retimer {
 	struct tb_nvm *nvm;
 	bool no_nvm_upgrade;
 	u32 auth_status;
+	u8 spec_version;
 #ifdef CONFIG_USB4_DEBUGFS_MARGINING
 	struct tb_margining *margining;
 #endif

---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260413-topic-usb4_limit_sb_reads-965ed26524a1

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>



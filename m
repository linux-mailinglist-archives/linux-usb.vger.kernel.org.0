Return-Path: <linux-usb+bounces-18375-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6639EC700
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 09:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E3B118896D1
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 08:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C551A1D7E4E;
	Wed, 11 Dec 2024 08:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSs0T76O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369DB1CF5CE
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 08:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905416; cv=none; b=UI7cOqMEQMPtYzdM0DGuXCbVqAqDkIZOpQvIzpOGjeHGpCpYAjCpcJR2N/os9P/k3I2DlO+kKkSxsxK8TFa2twBNagSI7OogNNuhRcJ/7q6WXHyA43CNtUcnCNqOsUN5ykgRGMid/srqm8VSX9BCVQ/6dKkDcOJMmRgBV0yUv4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905416; c=relaxed/simple;
	bh=+N/WC/ka2mohxUctmk3SUZF9JmmLFkiB7tKK54derfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y1MGjYK0OgRf89FPRkV/0O4HzT1/aIjZ0YgqobrBN8NBl+/oOKIxcFgvZGbPnFZi3vF/c2GVMWSOUkzCJerju550ufZ+5/lXiXn1rBT4LLCGty8TOATE9DR8fby5QrFNhxYr/Y33MOGl8A9d0TRC8E8pZ5DuotlZuKizj/Yg8tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSs0T76O; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733905414; x=1765441414;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+N/WC/ka2mohxUctmk3SUZF9JmmLFkiB7tKK54derfU=;
  b=hSs0T76O7hXvn8CwA32YxSyK+A6rPqpZ1KYZ6fUkw7nXpcuU42K6DP6u
   i8yS9r7aT2RUol2gtvgrF5BjakXLdmzwjENM7RgOTRupleu/cADwWBi3W
   chigRssiqp0DA67bYJvGQ1gTuyuVcZHHC7KytWyyH9YzB2l269N9n0dua
   1Mvvn2m6BJqjKVSkf/dyJ7rX2Dj7bBkCbBxFzq9TtXytQcpTMTK/VQYLy
   XKM0qzxUjEwvE7PBEQ7eQzPUSx6By+HoqFcHHBBfJkLC4QwhFCpFjkMqM
   HfcJvH13Svfvlks0UON5FKejmi702wvH+B8o+ydSfXsZ+AFOur6csjf06
   Q==;
X-CSE-ConnectionGUID: KOik1Dm+Q1aRa9FfiJc8Jw==
X-CSE-MsgGUID: Y4cbhqoESLK7WWeCetNluQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33594482"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="33594482"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 00:23:34 -0800
X-CSE-ConnectionGUID: b+RhmgvATa6K0KVJY7ChZw==
X-CSE-MsgGUID: eOaKZBzKRr2ECTCqeXwQIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="95547357"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 11 Dec 2024 00:23:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 84E5B192; Wed, 11 Dec 2024 10:23:30 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: debugfs: Add write capability to path config space
Date: Wed, 11 Dec 2024 10:23:30 +0200
Message-ID: <20241211082330.2294196-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gil Fine <gil.fine@linux.intel.com>

Currently debugfs interface allows writing of router, adapter and
counters config spaces but not for paths. However, it can be useful
during debugging to modify path config space so for this reason add this
support to the debugfs interface as well.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 65 +++++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 10 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index a1d0d8a33f20..fa61127b2c47 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -168,6 +168,13 @@ static bool parse_line(char **line, u32 *offs, u32 *val, int short_fmt_len,
 	 * offset relative_offset cap_id vs_cap_id value\n
 	 * v[0]   v[1]            v[2]   v[3]      v[4]
 	 *
+	 * For Path configuration space:
+	 * Short format is: offset value\n
+	 *		    v[0]   v[1]
+	 * Long format as produced from the read side:
+	 * offset relative_offset in_hop_id value\n
+	 * v[0]   v[1]            v[2]      v[3]
+	 *
 	 * For Counter configuration space:
 	 * Short format is: offset\n
 	 *		    v[0]
@@ -191,14 +198,33 @@ static bool parse_line(char **line, u32 *offs, u32 *val, int short_fmt_len,
 }
 
 #if IS_ENABLED(CONFIG_USB4_DEBUGFS_WRITE)
+/*
+ * Path registers need to be written in double word pairs and they both must be
+ * read before written. This writes one double word in patch config space
+ * following the spec flow.
+ */
+static int path_write_one(struct tb_port *port, u32 val, u32 offset)
+{
+	u32 index = offset % PATH_LEN;
+	u32 offs = offset - index;
+	u32 data[PATH_LEN];
+	int ret;
+
+	ret = tb_port_read(port, data, TB_CFG_HOPS, offs, PATH_LEN);
+	if (ret)
+		return ret;
+	data[index] = val;
+	return tb_port_write(port, data, TB_CFG_HOPS, offs, PATH_LEN);
+}
+
 static ssize_t regs_write(struct tb_switch *sw, struct tb_port *port,
-			  const char __user *user_buf, size_t count,
-			  loff_t *ppos)
+			  enum tb_cfg_space space, const char __user *user_buf,
+			  size_t count, loff_t *ppos)
 {
+	int long_fmt_len, ret = 0;
 	struct tb *tb = sw->tb;
 	char *line, *buf;
 	u32 val, offset;
-	int ret = 0;
 
 	buf = validate_and_copy_from_user(user_buf, &count);
 	if (IS_ERR(buf))
@@ -214,12 +240,21 @@ static ssize_t regs_write(struct tb_switch *sw, struct tb_port *port,
 	/* User did hardware changes behind the driver's back */
 	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
 
+	if (space == TB_CFG_HOPS)
+		long_fmt_len = 4;
+	else
+		long_fmt_len = 5;
+
 	line = buf;
-	while (parse_line(&line, &offset, &val, 2, 5)) {
-		if (port)
-			ret = tb_port_write(port, &val, TB_CFG_PORT, offset, 1);
-		else
+	while (parse_line(&line, &offset, &val, 2, long_fmt_len)) {
+		if (port) {
+			if (space == TB_CFG_HOPS)
+				ret = path_write_one(port, val, offset);
+			else
+				ret = tb_port_write(port, &val, space, offset, 1);
+		} else {
 			ret = tb_sw_write(sw, &val, TB_CFG_SWITCH, offset, 1);
+		}
 		if (ret)
 			break;
 	}
@@ -240,7 +275,16 @@ static ssize_t port_regs_write(struct file *file, const char __user *user_buf,
 	struct seq_file *s = file->private_data;
 	struct tb_port *port = s->private;
 
-	return regs_write(port->sw, port, user_buf, count, ppos);
+	return regs_write(port->sw, port, TB_CFG_PORT, user_buf, count, ppos);
+}
+
+static ssize_t path_write(struct file *file, const char __user *user_buf,
+			  size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct tb_port *port = s->private;
+
+	return regs_write(port->sw, port, TB_CFG_HOPS, user_buf, count, ppos);
 }
 
 static ssize_t switch_regs_write(struct file *file, const char __user *user_buf,
@@ -249,7 +293,7 @@ static ssize_t switch_regs_write(struct file *file, const char __user *user_buf,
 	struct seq_file *s = file->private_data;
 	struct tb_switch *sw = s->private;
 
-	return regs_write(sw, NULL, user_buf, count, ppos);
+	return regs_write(sw, NULL, TB_CFG_SWITCH, user_buf, count, ppos);
 }
 
 static bool parse_sb_line(char **line, u8 *reg, u8 *data, size_t data_size,
@@ -401,6 +445,7 @@ static ssize_t retimer_sb_regs_write(struct file *file,
 #define DEBUGFS_MODE		0600
 #else
 #define port_regs_write		NULL
+#define path_write		NULL
 #define switch_regs_write	NULL
 #define port_sb_regs_write	NULL
 #define retimer_sb_regs_write	NULL
@@ -2243,7 +2288,7 @@ static int path_show(struct seq_file *s, void *not_used)
 
 	return ret;
 }
-DEBUGFS_ATTR_RO(path);
+DEBUGFS_ATTR_RW(path);
 
 static int counter_set_regs_show(struct tb_port *port, struct seq_file *s,
 				 int counter)
-- 
2.45.2



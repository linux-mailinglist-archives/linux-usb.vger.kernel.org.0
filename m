Return-Path: <linux-usb+bounces-27844-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C5FB50A87
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 03:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03CF13AAC45
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 01:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602B42264B8;
	Wed, 10 Sep 2025 01:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0rXDOvU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1BD2033A
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 01:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757469116; cv=none; b=lGpQrR9zU4e73LpqrQ8nWlSVMcl+I8UPaJ+mSFb3eOEiFIfjppSraAzc11w2NBkRhiIpvXwZau2Ob6sfdDxT0pBOrih3GNgGgBRmNi1xumOYs0kcZp5gbp52pFFg0Z5/9QJo3a6Fp8u+CgydzUZ4Lu0dlce60VwFOY9wnWLh+pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757469116; c=relaxed/simple;
	bh=w6rdtuq+lFm9ApxulQgR7Grt9TF76PbwUWlVTky4aHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fB3Kj0RfHjqSoFeGKO7KOXKgNfA+HSJnuS83Ato1msnY3K0x3xMS5zFk1lUT+YgB9M3PbCjr4MYusEKPdRjDMuxpGwH1SwMap2Q/g1C+1NTkKcYsHYSL48iqOhJFeaP8Ub2PVtPfF8xkioVhN3OPbXWASyho23PsX0Fj0bTdvvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0rXDOvU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757469116; x=1789005116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w6rdtuq+lFm9ApxulQgR7Grt9TF76PbwUWlVTky4aHs=;
  b=V0rXDOvUw0wgZJSUyqd6r/9Vkxwex+dSe7vepNpztDzmNVHQMoABVpvW
   A3yK9TwLqdkUV9IqplyZcf18gco1QEJNZ4wFqPXODuKFCUhoLW4nmLPJr
   t6YnJdx3O3WaTGbtAJiW85JZ7n4QypJ+qyOaAqbZj9lf3ORp/yTqCY9ay
   1rXjSE5Uf5eJ+NsLTWyFBlu4jh3coFNlE2azF9ReSmfqz+FtbSW9SASYa
   X26VFuMGHy0sCrg596C5Q54gNjx19sw0EpLjy8buKx9kt9dmx2fYEhsLI
   SzmfHwQ1iqYAnA1YW/SWUt00W/55UJ7aQ9XG3CEZ9UCgWIbNe+oAYykf1
   w==;
X-CSE-ConnectionGUID: M2pDwnSERa+7CnVG8Qh4tg==
X-CSE-MsgGUID: siMfJ4ppTGeqBqCDgE91QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59692226"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59692226"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 18:51:54 -0700
X-CSE-ConnectionGUID: NAjOHyfzR9uSRTK+Ig8MEQ==
X-CSE-MsgGUID: dxaJ0RruTsG39aA2MyoOUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="174039177"
Received: from clke07vm102.fm.intel.com (HELO clke07vm102.amr.corp.intel.com) ([10.80.128.226])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2025 18:51:53 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	heikki.krogerus@linux.intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH v4 3/4] usb: typec: ucsi: Enable debugfs for message_out data structure
Date: Tue,  9 Sep 2025 18:52:06 -0700
Message-ID: <1746700c747e0be20af39abb0fe8d4f4dd54262a.1757374784.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757374784.git.pooja.katiyar@intel.com>
References: <cover.1757374784.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add debugfs entry for writing message_out data structure to handle
UCSI 2.1 and 3.0 commands through debugfs interface.

Users writing to the message_out debugfs file should ensure the input
data adheres to the following format:
1. Input must be a non-empty valid hexadecimal string.
2. Input length of hexadecimal string must not exceed 256 bytes of
   length to be in alignment with the message out data structure size
   as per the UCSI specification v2.1.
3. If the input string length is odd, then user needs to prepend a
   '0' to the first character for proper hex conversion.

Below are examples of valid hex strings. Note that these values are
just examples. The exact values depend on specific command use case.

        #echo 1A2B3C4D > message_out
        #echo 01234567 > message_out

Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
Changelog v4:
- Fixed build errors reported by kernel test robot.
- Added changelogs.

Changelog v3:
- Updated debugfs message_out write handler to use message_out fields in
  UCSI structure.

Changelog v2:
- No changes.

 drivers/usb/typec/ucsi/debugfs.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 4bf3a8f65a4e..0693acf04c37 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -109,6 +109,30 @@ static int ucsi_vbus_volt_show(struct seq_file *m, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(ucsi_vbus_volt);
 
+static ssize_t ucsi_message_out_write(struct file *file,
+				      const char __user *data, size_t count, loff_t *ppos)
+{
+	struct ucsi *ucsi = file->private_data;
+	int ret;
+
+	char *buf __free(kfree) = memdup_user_nul(data, count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	ucsi->message_out_size = min(count / 2, UCSI_MAX_MESSAGE_OUT_LENGTH);
+	ret = hex2bin(ucsi->message_out, buf, ucsi->message_out_size);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static const struct file_operations ucsi_message_out_fops = {
+	.open = simple_open,
+	.write = ucsi_message_out_write,
+	.llseek = generic_file_llseek,
+};
+
 void ucsi_debugfs_register(struct ucsi *ucsi)
 {
 	ucsi->debugfs = kzalloc(sizeof(*ucsi->debugfs), GFP_KERNEL);
@@ -121,6 +145,8 @@ void ucsi_debugfs_register(struct ucsi *ucsi)
 	debugfs_create_file("peak_current", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_peak_curr_fops);
 	debugfs_create_file("avg_current", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_avg_curr_fops);
 	debugfs_create_file("vbus_voltage", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_vbus_volt_fops);
+	debugfs_create_file("message_out", 0200, ucsi->debugfs->dentry, ucsi,
+			    &ucsi_message_out_fops);
 }
 
 void ucsi_debugfs_unregister(struct ucsi *ucsi)
-- 
2.43.0



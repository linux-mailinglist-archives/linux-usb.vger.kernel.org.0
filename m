Return-Path: <linux-usb+bounces-15693-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 468F2990021
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 11:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0642B2464E
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 09:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E472156F4C;
	Fri,  4 Oct 2024 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMMj0ZXB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FB915687D
	for <linux-usb@vger.kernel.org>; Fri,  4 Oct 2024 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034914; cv=none; b=EZozWnVB8tq8mWYSueBR7Yj2PLgYRjvPQgkfJ6rTgBK/yx2f3M6H/W/+A0IYSuhMsFGyYD91VyCoilMb3/fkSpMQT9vWLQXKWGQcR5N6uUZuApVK8Rw6ysHwzGOzZqZGn2cxkw2GoupqBuQXX4akGu0grcU/HAI/mgA5adRj3lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034914; c=relaxed/simple;
	bh=F/KtxLelD2a2yvZbdLpUiROMDzTXww3flya3Kt/tXfA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P6dY6alKjyXr7Cz63toih+9hot7TGpxPMjqJc0l0fIhHHa+Niv17VKH/6Imh1gQvTKaHMrhzg8obVjX5259ZqP9uTku/BfUjyqRAURbR5QYZOjIgpu/XPcnnK5ME2ItiWl7lcsgdWD2C7p7FSqLFb/EDX6Gf+/rZN+RohrdzTgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMMj0ZXB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034913; x=1759570913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F/KtxLelD2a2yvZbdLpUiROMDzTXww3flya3Kt/tXfA=;
  b=dMMj0ZXBuqatvmip9he/9XeB6cb2eI3Jr3eEktuobjahbc/SusG62VnP
   BALbFZdJ7n2414fXI1nMljuCsIr3DgTq6pK01gjXs0MM9OAuPtCsQyRJh
   kmVlJaipR4hhyaXauiTqzNC++LwrTw5bHg/jDUj0WUvkwqrz9eCi44hM+
   nKL3l1GuffTfxEvZPCf24H/BTrdeA1XSsgGKbCJ6fGK+BKfD5KG/sY23f
   O4NAZMahBXieq+HhCdVTu1V86Xt5y8yMNMO71ItlVSR1YEh6aJWAMXf74
   Z4cBGFMz2lDz9mAX2CTPaQPu79aC1JDs/htMBmjOLIvNurrldRFZDWWye
   A==;
X-CSE-ConnectionGUID: c8iDkCz8RhuTgqiA7FbRdw==
X-CSE-MsgGUID: k4VqW/G9Q5u/wmh5Wd1q4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27136213"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27136213"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:52 -0700
X-CSE-ConnectionGUID: HS5sbEAASSWj0KGH6m56JA==
X-CSE-MsgGUID: m/NTlGjbST26ue+95RNxUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="105492101"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:50 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 16CB4120CED;
	Fri,  4 Oct 2024 12:41:45 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoj-000TgG-0F;
	Fri, 04 Oct 2024 12:41:45 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 43/51] thunderbolt: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:45 +0300
Message-Id: <20241004094145.114082-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c   | 22 +++++++++++-----------
 drivers/thunderbolt/domain.c    |  4 ++--
 drivers/thunderbolt/icm.c       | 14 +++++++-------
 drivers/thunderbolt/nhi.c       |  2 +-
 drivers/thunderbolt/retimer.c   |  4 ++--
 drivers/thunderbolt/switch.c    |  6 +++---
 drivers/thunderbolt/tb.c        | 18 +++++++++---------
 drivers/thunderbolt/usb4_port.c |  4 ++--
 8 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 350310bd0fee..c9dbd7e8c3b6 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -209,7 +209,7 @@ static ssize_t regs_write(struct tb_switch *sw, struct tb_port *port,
 
 out:
 	pm_runtime_mark_last_busy(&sw->dev);
-	pm_runtime_put_autosuspend(&sw->dev);
+	__pm_runtime_put_autosuspend(&sw->dev);
 	free_page((unsigned long)buf);
 
 	return ret < 0 ? ret : count;
@@ -341,7 +341,7 @@ static ssize_t port_sb_regs_write(struct file *file, const char __user *user_buf
 	mutex_unlock(&tb->lock);
 out:
 	pm_runtime_mark_last_busy(&sw->dev);
-	pm_runtime_put_autosuspend(&sw->dev);
+	__pm_runtime_put_autosuspend(&sw->dev);
 	free_page((unsigned long)buf);
 
 	return ret < 0 ? ret : count;
@@ -374,7 +374,7 @@ static ssize_t retimer_sb_regs_write(struct file *file,
 	mutex_unlock(&tb->lock);
 out:
 	pm_runtime_mark_last_busy(&rt->dev);
-	pm_runtime_put_autosuspend(&rt->dev);
+	__pm_runtime_put_autosuspend(&rt->dev);
 	free_page((unsigned long)buf);
 
 	return ret < 0 ? ret : count;
@@ -1113,7 +1113,7 @@ static int margining_run_write(void *data, u64 val)
 	mutex_unlock(&tb->lock);
 out_rpm_put:
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return ret;
 }
@@ -1647,7 +1647,7 @@ static ssize_t counters_write(struct file *file, const char __user *user_buf,
 
 out:
 	pm_runtime_mark_last_busy(&sw->dev);
-	pm_runtime_put_autosuspend(&sw->dev);
+	__pm_runtime_put_autosuspend(&sw->dev);
 	free_page((unsigned long)buf);
 
 	return ret < 0 ? ret : count;
@@ -1842,7 +1842,7 @@ static int port_regs_show(struct seq_file *s, void *not_used)
 	mutex_unlock(&tb->lock);
 out_rpm_put:
 	pm_runtime_mark_last_busy(&sw->dev);
-	pm_runtime_put_autosuspend(&sw->dev);
+	__pm_runtime_put_autosuspend(&sw->dev);
 
 	return ret;
 }
@@ -1946,7 +1946,7 @@ static int switch_regs_show(struct seq_file *s, void *not_used)
 	mutex_unlock(&tb->lock);
 out_rpm_put:
 	pm_runtime_mark_last_busy(&sw->dev);
-	pm_runtime_put_autosuspend(&sw->dev);
+	__pm_runtime_put_autosuspend(&sw->dev);
 
 	return ret;
 }
@@ -2007,7 +2007,7 @@ static int path_show(struct seq_file *s, void *not_used)
 	mutex_unlock(&tb->lock);
 out_rpm_put:
 	pm_runtime_mark_last_busy(&sw->dev);
-	pm_runtime_put_autosuspend(&sw->dev);
+	__pm_runtime_put_autosuspend(&sw->dev);
 
 	return ret;
 }
@@ -2061,7 +2061,7 @@ static int counters_show(struct seq_file *s, void *not_used)
 
 out:
 	pm_runtime_mark_last_busy(&sw->dev);
-	pm_runtime_put_autosuspend(&sw->dev);
+	__pm_runtime_put_autosuspend(&sw->dev);
 
 	return ret;
 }
@@ -2115,7 +2115,7 @@ static int port_sb_regs_show(struct seq_file *s, void *not_used)
 	mutex_unlock(&tb->lock);
 out_rpm_put:
 	pm_runtime_mark_last_busy(&sw->dev);
-	pm_runtime_put_autosuspend(&sw->dev);
+	__pm_runtime_put_autosuspend(&sw->dev);
 
 	return ret;
 }
@@ -2228,7 +2228,7 @@ static int retimer_sb_regs_show(struct seq_file *s, void *not_used)
 	mutex_unlock(&tb->lock);
 out_rpm_put:
 	pm_runtime_mark_last_busy(&rt->dev);
-	pm_runtime_put_autosuspend(&rt->dev);
+	__pm_runtime_put_autosuspend(&rt->dev);
 
 	return ret;
 }
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 144d0232a70c..a9106881f822 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -151,7 +151,7 @@ static ssize_t boot_acl_show(struct device *dev, struct device_attribute *attr,
 
 out:
 	pm_runtime_mark_last_busy(&tb->dev);
-	pm_runtime_put_autosuspend(&tb->dev);
+	__pm_runtime_put_autosuspend(&tb->dev);
 	kfree(uuids);
 
 	return ret;
@@ -223,7 +223,7 @@ static ssize_t boot_acl_store(struct device *dev, struct device_attribute *attr,
 
 err_rpm_put:
 	pm_runtime_mark_last_busy(&tb->dev);
-	pm_runtime_put_autosuspend(&tb->dev);
+	__pm_runtime_put_autosuspend(&tb->dev);
 err_free_acl:
 	kfree(acl);
 err_free_str:
diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 7859bccc592d..3ed8703316ba 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -367,7 +367,7 @@ static void icm_veto_end(struct tb *tb)
 		icm->veto = false;
 		/* Allow the domain suspend now */
 		pm_runtime_mark_last_busy(&tb->dev);
-		pm_runtime_put_autosuspend(&tb->dev);
+		__pm_runtime_put_autosuspend(&tb->dev);
 	}
 }
 
@@ -697,7 +697,7 @@ static void add_xdomain(struct tb_switch *sw, u64 route,
 
 out:
 	pm_runtime_mark_last_busy(&sw->dev);
-	pm_runtime_put_autosuspend(&sw->dev);
+	__pm_runtime_put_autosuspend(&sw->dev);
 }
 
 static void update_xdomain(struct tb_xdomain *xd, u64 route, u8 link)
@@ -859,7 +859,7 @@ icm_fr_device_connected(struct tb *tb, const struct icm_pkg_header *hdr)
 	}
 
 	pm_runtime_mark_last_busy(&parent_sw->dev);
-	pm_runtime_put_autosuspend(&parent_sw->dev);
+	__pm_runtime_put_autosuspend(&parent_sw->dev);
 
 	tb_switch_put(parent_sw);
 }
@@ -893,7 +893,7 @@ icm_fr_device_disconnected(struct tb *tb, const struct icm_pkg_header *hdr)
 	remove_switch(sw);
 
 	pm_runtime_mark_last_busy(sw->dev.parent);
-	pm_runtime_put_autosuspend(sw->dev.parent);
+	__pm_runtime_put_autosuspend(sw->dev.parent);
 
 	tb_switch_put(sw);
 }
@@ -1285,7 +1285,7 @@ __icm_tr_device_connected(struct tb *tb, const struct icm_pkg_header *hdr,
 	}
 
 	pm_runtime_mark_last_busy(&parent_sw->dev);
-	pm_runtime_put_autosuspend(&parent_sw->dev);
+	__pm_runtime_put_autosuspend(&parent_sw->dev);
 
 	tb_switch_put(parent_sw);
 }
@@ -1316,7 +1316,7 @@ icm_tr_device_disconnected(struct tb *tb, const struct icm_pkg_header *hdr)
 	remove_switch(sw);
 
 	pm_runtime_mark_last_busy(sw->dev.parent);
-	pm_runtime_put_autosuspend(sw->dev.parent);
+	__pm_runtime_put_autosuspend(sw->dev.parent);
 
 	tb_switch_put(sw);
 }
@@ -2045,7 +2045,7 @@ static void remove_unplugged_switch(struct tb_switch *sw)
 	tb_switch_remove(sw);
 
 	pm_runtime_mark_last_busy(parent);
-	pm_runtime_put_autosuspend(parent);
+	__pm_runtime_put_autosuspend(parent);
 
 	put_device(parent);
 }
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 7af2642b97cb..d46fab8a7a33 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1408,7 +1408,7 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pm_runtime_allow(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, TB_AUTOSUSPEND_DELAY);
 	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
+	__pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
 }
diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 721319329afa..3818f0bb2512 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -54,7 +54,7 @@ static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 
 out:
 	pm_runtime_mark_last_busy(&rt->dev);
-	pm_runtime_put_autosuspend(&rt->dev);
+	__pm_runtime_put_autosuspend(&rt->dev);
 
 	return ret;
 }
@@ -304,7 +304,7 @@ static ssize_t nvm_authenticate_store(struct device *dev,
 	mutex_unlock(&rt->tb->lock);
 exit_rpm:
 	pm_runtime_mark_last_busy(&rt->dev);
-	pm_runtime_put_autosuspend(&rt->dev);
+	__pm_runtime_put_autosuspend(&rt->dev);
 
 	if (ret)
 		return ret;
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 6a2116cbb06f..126e8ddd26f4 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -319,7 +319,7 @@ static int nvm_read(void *priv, unsigned int offset, void *val, size_t bytes)
 
 out:
 	pm_runtime_mark_last_busy(&sw->dev);
-	pm_runtime_put_autosuspend(&sw->dev);
+	__pm_runtime_put_autosuspend(&sw->dev);
 
 	return ret;
 }
@@ -1847,7 +1847,7 @@ static ssize_t authorized_store(struct device *dev,
 	pm_runtime_get_sync(&sw->dev);
 	ret = tb_switch_set_authorized(sw, val);
 	pm_runtime_mark_last_busy(&sw->dev);
-	pm_runtime_put_autosuspend(&sw->dev);
+	__pm_runtime_put_autosuspend(&sw->dev);
 
 	return ret ? ret : count;
 }
@@ -2079,7 +2079,7 @@ static ssize_t nvm_authenticate_sysfs(struct device *dev, const char *buf,
 	mutex_unlock(&sw->tb->lock);
 exit_rpm:
 	pm_runtime_mark_last_busy(&sw->dev);
-	pm_runtime_put_autosuspend(&sw->dev);
+	__pm_runtime_put_autosuspend(&sw->dev);
 
 	return ret;
 }
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 10e719dd837c..7a1d80ce3666 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1217,7 +1217,7 @@ static void tb_scan_switch(struct tb_switch *sw)
 		tb_scan_port(port);
 
 	pm_runtime_mark_last_busy(&sw->dev);
-	pm_runtime_put_autosuspend(&sw->dev);
+	__pm_runtime_put_autosuspend(&sw->dev);
 }
 
 /*
@@ -1349,7 +1349,7 @@ static void tb_scan_port(struct tb_port *port)
 out_rpm_put:
 	if (port->usb4) {
 		pm_runtime_mark_last_busy(&port->usb4->dev);
-		pm_runtime_put_autosuspend(&port->usb4->dev);
+		__pm_runtime_put_autosuspend(&port->usb4->dev);
 	}
 }
 
@@ -1674,9 +1674,9 @@ static void tb_deactivate_and_free_tunnel(struct tb_tunnel *tunnel)
 		tb_configure_sym(tb, src_port, dst_port, true);
 		/* Now we can allow the domain to runtime suspend again */
 		pm_runtime_mark_last_busy(&dst_port->sw->dev);
-		pm_runtime_put_autosuspend(&dst_port->sw->dev);
+		__pm_runtime_put_autosuspend(&dst_port->sw->dev);
 		pm_runtime_mark_last_busy(&src_port->sw->dev);
-		pm_runtime_put_autosuspend(&src_port->sw->dev);
+		__pm_runtime_put_autosuspend(&src_port->sw->dev);
 		fallthrough;
 
 	case TB_TUNNEL_USB3:
@@ -1932,9 +1932,9 @@ static bool tb_tunnel_one_dp(struct tb *tb, struct tb_port *in,
 	tb_switch_dealloc_dp_resource(in->sw, in);
 err_rpm_put:
 	pm_runtime_mark_last_busy(&out->sw->dev);
-	pm_runtime_put_autosuspend(&out->sw->dev);
+	__pm_runtime_put_autosuspend(&out->sw->dev);
 	pm_runtime_mark_last_busy(&in->sw->dev);
-	pm_runtime_put_autosuspend(&in->sw->dev);
+	__pm_runtime_put_autosuspend(&in->sw->dev);
 
 	return false;
 }
@@ -2364,7 +2364,7 @@ static void tb_handle_hotplug(struct work_struct *work)
 	}
 
 	pm_runtime_mark_last_busy(&sw->dev);
-	pm_runtime_put_autosuspend(&sw->dev);
+	__pm_runtime_put_autosuspend(&sw->dev);
 
 put_sw:
 	tb_switch_put(sw);
@@ -2372,7 +2372,7 @@ static void tb_handle_hotplug(struct work_struct *work)
 	mutex_unlock(&tb->lock);
 
 	pm_runtime_mark_last_busy(&tb->dev);
-	pm_runtime_put_autosuspend(&tb->dev);
+	__pm_runtime_put_autosuspend(&tb->dev);
 
 	kfree(ev);
 }
@@ -2673,7 +2673,7 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 	mutex_unlock(&tb->lock);
 
 	pm_runtime_mark_last_busy(&tb->dev);
-	pm_runtime_put_autosuspend(&tb->dev);
+	__pm_runtime_put_autosuspend(&tb->dev);
 
 	kfree(ev);
 }
diff --git a/drivers/thunderbolt/usb4_port.c b/drivers/thunderbolt/usb4_port.c
index 5150879888ca..9b71ec355cd5 100644
--- a/drivers/thunderbolt/usb4_port.c
+++ b/drivers/thunderbolt/usb4_port.c
@@ -158,7 +158,7 @@ static ssize_t offline_store(struct device *dev,
 	mutex_unlock(&tb->lock);
 out_rpm:
 	pm_runtime_mark_last_busy(&usb4->dev);
-	pm_runtime_put_autosuspend(&usb4->dev);
+	__pm_runtime_put_autosuspend(&usb4->dev);
 
 	return ret ? ret : count;
 }
@@ -200,7 +200,7 @@ static ssize_t rescan_store(struct device *dev,
 	mutex_unlock(&tb->lock);
 out_rpm:
 	pm_runtime_mark_last_busy(&usb4->dev);
-	pm_runtime_put_autosuspend(&usb4->dev);
+	__pm_runtime_put_autosuspend(&usb4->dev);
 
 	return ret ? ret : count;
 }
-- 
2.39.5



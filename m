Return-Path: <linux-usb+bounces-31642-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84904CD1216
	for <lists+linux-usb@lfdr.de>; Fri, 19 Dec 2025 18:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36E9E303ACA5
	for <lists+linux-usb@lfdr.de>; Fri, 19 Dec 2025 17:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238B433C522;
	Fri, 19 Dec 2025 17:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="e7g0HYFb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61D233BBA3;
	Fri, 19 Dec 2025 17:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766165126; cv=none; b=O3Y/6qKSAsvJOXNqK2lqIl9HpL6j3rc24sjeyQzGpiKhJHPG4/I9sE3cxUssm98in4gBMAAqEkczhkZLDLY3k+Nrna3aRxeJr/xR3PdU/0WkXelqCV3ndNxGiQr/U8FReUQxjFgBNHiJfy7P6cxeuZekkWHX2oxABabQuWjF/m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766165126; c=relaxed/simple;
	bh=P4wyN4sXu4qpnGUTF1wVGAh9dbpb4b17hrMy39eNbJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XexywMXh77ILYAkoC+S6yv/nBsGdf1UQHvaflL9OV8hXwQOuZP7er2oKInLmJh3JB/JzWfbllifq/LMK4BehuedWhAOTpJQebmd9FHc3Zh/ntMV+Qz+ho7s2t/uE2UEnnavm+qvfl0ZuGEY9QFAW/1Kj6HDhI6mKuYS25wbsfFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=e7g0HYFb; arc=none smtp.client-ip=80.12.242.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id We5ev3fgv4T6dWe5ev4qxr; Fri, 19 Dec 2025 18:16:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1766164591;
	bh=16fiDFAEma/YNPCGnky1v786VZfgiqaGFU+bhEZDTUk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=e7g0HYFb+S9JCCLZcSdXdSkZ1WtlwWEcv7Vkxe63IEKmA4R5WgRw4BDroIIawkf6z
	 UZcbqI+eFsEWnA7Fv1Nx9rAt3mNDSPA+3wklUxsEAaGNZy0a4o3TsP+MUlSTsNokkt
	 w5KdpflCeimOOZN1m0uAlrNpumVjBcjj6bvljvOZQZ2pjy8R6NlNsSrL8EIOeCaFo4
	 6RVmvlk7vcesl7218VJbRymS7FTVpR4yPasBjqOHP/1ZqkPKTFoM4+WHBfa92Cz6ll
	 4NPKvTcOMBFd0GIikb89FKXsV/uQnH8+BLyjKLG6rYHAGeDQlPkNajvTSlN5Bf7W8P
	 VGVpUpalG6IVw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 19 Dec 2025 18:16:31 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: Constify struct configfs_item_operations and configfs_group_operations
Date: Fri, 19 Dec 2025 18:16:15 +0100
Message-ID: <49cec1cb84425f854de80b6d69b53a5a3cda8189.1766164523.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct configfs_item_operations' and 'configfs_group_operations' are not
modified in these drivers.

Constifying these structures moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  65061	  20968	    256	  86285	  1510d	drivers/usb/gadget/configfs.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  66181	  19848	    256	  86285	  1510d	drivers/usb/gadget/configfs.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This change is possible since commits f2f36500a63b and f7f78098690d.
---
 drivers/usb/gadget/configfs.c                 | 24 ++++++-------
 drivers/usb/gadget/function/f_acm.c           |  2 +-
 drivers/usb/gadget/function/f_fs.c            |  2 +-
 drivers/usb/gadget/function/f_hid.c           |  2 +-
 drivers/usb/gadget/function/f_loopback.c      |  2 +-
 drivers/usb/gadget/function/f_mass_storage.c  |  6 ++--
 drivers/usb/gadget/function/f_midi.c          |  2 +-
 drivers/usb/gadget/function/f_midi2.c         | 10 +++---
 drivers/usb/gadget/function/f_obex.c          |  2 +-
 drivers/usb/gadget/function/f_phonet.c        |  2 +-
 drivers/usb/gadget/function/f_printer.c       |  2 +-
 drivers/usb/gadget/function/f_serial.c        |  2 +-
 drivers/usb/gadget/function/f_sourcesink.c    |  2 +-
 drivers/usb/gadget/function/f_tcm.c           |  2 +-
 drivers/usb/gadget/function/f_uac1.c          |  2 +-
 drivers/usb/gadget/function/f_uac1_legacy.c   |  2 +-
 drivers/usb/gadget/function/f_uac2.c          |  2 +-
 .../usb/gadget/function/u_ether_configfs.h    |  2 +-
 drivers/usb/gadget/function/uvc_configfs.c    | 36 +++++++++----------
 include/linux/usb/gadget_configfs.h           |  4 +--
 20 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 6bcac85c5550..acef1c6f199c 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -409,7 +409,7 @@ static void gadget_info_attr_release(struct config_item *item)
 	kfree(gi);
 }
 
-static struct configfs_item_operations gadget_root_item_ops = {
+static const struct configfs_item_operations gadget_root_item_ops = {
 	.release                = gadget_info_attr_release,
 };
 
@@ -514,7 +514,7 @@ static void config_usb_cfg_unlink(
 	WARN(1, "Unable to locate function to unbind\n");
 }
 
-static struct configfs_item_operations gadget_config_item_ops = {
+static const struct configfs_item_operations gadget_config_item_ops = {
 	.release                = gadget_config_attr_release,
 	.allow_link             = config_usb_cfg_link,
 	.drop_link              = config_usb_cfg_unlink,
@@ -663,7 +663,7 @@ static void function_drop(
 	config_item_put(item);
 }
 
-static struct configfs_group_operations functions_ops = {
+static const struct configfs_group_operations functions_ops = {
 	.make_group     = &function_make,
 	.drop_item      = &function_drop,
 };
@@ -766,7 +766,7 @@ static void config_desc_drop(
 	config_item_put(item);
 }
 
-static struct configfs_group_operations config_desc_ops = {
+static const struct configfs_group_operations config_desc_ops = {
 	.make_group     = &config_desc_make,
 	.drop_item      = &config_desc_drop,
 };
@@ -799,7 +799,7 @@ static void gadget_language_attr_release(struct config_item *item)
 	kfree(gs);
 }
 
-static struct configfs_item_operations gadget_language_langid_item_ops = {
+static const struct configfs_item_operations gadget_language_langid_item_ops = {
 	.release                = gadget_language_attr_release,
 };
 
@@ -852,7 +852,7 @@ static void gadget_string_release(struct config_item *item)
 	kfree(string);
 }
 
-static struct configfs_item_operations gadget_string_item_ops = {
+static const struct configfs_item_operations gadget_string_item_ops = {
 	.release	= gadget_string_release,
 };
 
@@ -901,7 +901,7 @@ static void gadget_language_string_drop(struct config_group *group,
 		string->usb_string.id = i++;
 }
 
-static struct configfs_group_operations gadget_language_langid_group_ops = {
+static const struct configfs_group_operations gadget_language_langid_group_ops = {
 	.make_item		= gadget_language_string_make,
 	.drop_item		= gadget_language_string_drop,
 };
@@ -960,7 +960,7 @@ static void gadget_language_drop(struct config_group *group,
 	config_item_put(item);
 }
 
-static struct configfs_group_operations gadget_language_group_ops = {
+static const struct configfs_group_operations gadget_language_group_ops = {
 	.make_group     = &gadget_language_make,
 	.drop_item      = &gadget_language_drop,
 };
@@ -1266,7 +1266,7 @@ static void os_desc_unlink(struct config_item *os_desc_ci,
 	mutex_unlock(&gi->lock);
 }
 
-static struct configfs_item_operations os_desc_ops = {
+static const struct configfs_item_operations os_desc_ops = {
 	.allow_link		= os_desc_link,
 	.drop_link		= os_desc_unlink,
 };
@@ -1391,7 +1391,7 @@ static void usb_os_desc_ext_prop_release(struct config_item *item)
 	kfree(ext_prop); /* frees a whole chunk */
 }
 
-static struct configfs_item_operations ext_prop_ops = {
+static const struct configfs_item_operations ext_prop_ops = {
 	.release		= usb_os_desc_ext_prop_release,
 };
 
@@ -1456,7 +1456,7 @@ static void ext_prop_drop(struct config_group *group, struct config_item *item)
 	config_item_put(item);
 }
 
-static struct configfs_group_operations interf_grp_ops = {
+static const struct configfs_group_operations interf_grp_ops = {
 	.make_item	= &ext_prop_make,
 	.drop_item	= &ext_prop_drop,
 };
@@ -2061,7 +2061,7 @@ static void gadgets_drop(struct config_group *group, struct config_item *item)
 	config_item_put(item);
 }
 
-static struct configfs_group_operations gadgets_ops = {
+static const struct configfs_group_operations gadgets_ops = {
 	.make_group     = &gadgets_make,
 	.drop_item      = &gadgets_drop,
 };
diff --git a/drivers/usb/gadget/function/f_acm.c b/drivers/usb/gadget/function/f_acm.c
index 106046e17c4e..0ad857f1f325 100644
--- a/drivers/usb/gadget/function/f_acm.c
+++ b/drivers/usb/gadget/function/f_acm.c
@@ -793,7 +793,7 @@ static void acm_attr_release(struct config_item *item)
 	usb_put_function_instance(&opts->func_inst);
 }
 
-static struct configfs_item_operations acm_item_ops = {
+static const struct configfs_item_operations acm_item_ops = {
 	.release                = acm_attr_release,
 };
 
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 05c6750702b6..6a0a4d870865 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -4004,7 +4004,7 @@ static void ffs_attr_release(struct config_item *item)
 	usb_put_function_instance(&opts->func_inst);
 }
 
-static struct configfs_item_operations ffs_item_ops = {
+static const struct configfs_item_operations ffs_item_ops = {
 	.release	= ffs_attr_release,
 };
 
diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 3ddfd4f66f0b..bee0d0458ff7 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -1328,7 +1328,7 @@ static void hid_attr_release(struct config_item *item)
 	usb_put_function_instance(&opts->func_inst);
 }
 
-static struct configfs_item_operations hidg_item_ops = {
+static const struct configfs_item_operations hidg_item_ops = {
 	.release	= hid_attr_release,
 };
 
diff --git a/drivers/usb/gadget/function/f_loopback.c b/drivers/usb/gadget/function/f_loopback.c
index 49b009a7d5d7..39862e236837 100644
--- a/drivers/usb/gadget/function/f_loopback.c
+++ b/drivers/usb/gadget/function/f_loopback.c
@@ -464,7 +464,7 @@ static void lb_attr_release(struct config_item *item)
 	usb_put_function_instance(&lb_opts->func_inst);
 }
 
-static struct configfs_item_operations lb_item_ops = {
+static const struct configfs_item_operations lb_item_ops = {
 	.release		= lb_attr_release,
 };
 
diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 94d478b6bcd3..5c3f34a2f35c 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -3153,7 +3153,7 @@ static void fsg_lun_attr_release(struct config_item *item)
 	kfree(lun_opts);
 }
 
-static struct configfs_item_operations fsg_lun_item_ops = {
+static const struct configfs_item_operations fsg_lun_item_ops = {
 	.release		= fsg_lun_attr_release,
 };
 
@@ -3369,7 +3369,7 @@ static void fsg_attr_release(struct config_item *item)
 	usb_put_function_instance(&opts->func_inst);
 }
 
-static struct configfs_item_operations fsg_item_ops = {
+static const struct configfs_item_operations fsg_item_ops = {
 	.release		= fsg_attr_release,
 };
 
@@ -3462,7 +3462,7 @@ static struct configfs_attribute *fsg_attrs[] = {
 	NULL,
 };
 
-static struct configfs_group_operations fsg_group_ops = {
+static const struct configfs_group_operations fsg_group_ops = {
 	.make_group	= fsg_lun_make,
 	.drop_item	= fsg_lun_drop,
 };
diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index da82598fcef8..9a93604b49d9 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -1086,7 +1086,7 @@ static void midi_attr_release(struct config_item *item)
 	usb_put_function_instance(&opts->func_inst);
 }
 
-static struct configfs_item_operations midi_item_ops = {
+static const struct configfs_item_operations midi_item_ops = {
 	.release	= midi_attr_release,
 };
 
diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
index de16b02d857e..95ec87bed3ee 100644
--- a/drivers/usb/gadget/function/f_midi2.c
+++ b/drivers/usb/gadget/function/f_midi2.c
@@ -2316,7 +2316,7 @@ static void f_midi2_block_opts_release(struct config_item *item)
 	kfree(opts);
 }
 
-static struct configfs_item_operations f_midi2_block_item_ops = {
+static const struct configfs_item_operations f_midi2_block_item_ops = {
 	.release	= f_midi2_block_opts_release,
 };
 
@@ -2479,11 +2479,11 @@ static void f_midi2_ep_opts_release(struct config_item *item)
 	kfree(opts);
 }
 
-static struct configfs_item_operations f_midi2_ep_item_ops = {
+static const struct configfs_item_operations f_midi2_ep_item_ops = {
 	.release	= f_midi2_ep_opts_release,
 };
 
-static struct configfs_group_operations f_midi2_ep_group_ops = {
+static const struct configfs_group_operations f_midi2_ep_group_ops = {
 	.make_group	= f_midi2_opts_block_make,
 	.drop_item	= f_midi2_opts_block_drop,
 };
@@ -2618,11 +2618,11 @@ static void f_midi2_opts_release(struct config_item *item)
 	usb_put_function_instance(&opts->func_inst);
 }
 
-static struct configfs_item_operations f_midi2_item_ops = {
+static const struct configfs_item_operations f_midi2_item_ops = {
 	.release	= f_midi2_opts_release,
 };
 
-static struct configfs_group_operations f_midi2_group_ops = {
+static const struct configfs_group_operations f_midi2_group_ops = {
 	.make_group	= f_midi2_opts_ep_make,
 	.drop_item	= f_midi2_opts_ep_drop,
 };
diff --git a/drivers/usb/gadget/function/f_obex.c b/drivers/usb/gadget/function/f_obex.c
index 1305e2326cdf..6d498f63183e 100644
--- a/drivers/usb/gadget/function/f_obex.c
+++ b/drivers/usb/gadget/function/f_obex.c
@@ -390,7 +390,7 @@ static void obex_attr_release(struct config_item *item)
 	usb_put_function_instance(&opts->func_inst);
 }
 
-static struct configfs_item_operations obex_item_ops = {
+static const struct configfs_item_operations obex_item_ops = {
 	.release	= obex_attr_release,
 };
 
diff --git a/drivers/usb/gadget/function/f_phonet.c b/drivers/usb/gadget/function/f_phonet.c
index 0aa9e8224cae..d644d5495fdc 100644
--- a/drivers/usb/gadget/function/f_phonet.c
+++ b/drivers/usb/gadget/function/f_phonet.c
@@ -585,7 +585,7 @@ static void phonet_attr_release(struct config_item *item)
 	usb_put_function_instance(&opts->func_inst);
 }
 
-static struct configfs_item_operations phonet_item_ops = {
+static const struct configfs_item_operations phonet_item_ops = {
 	.release		= phonet_attr_release,
 };
 
diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index d295ade8fa67..b2fa2b56c37e 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -1220,7 +1220,7 @@ static void printer_attr_release(struct config_item *item)
 	usb_put_function_instance(&opts->func_inst);
 }
 
-static struct configfs_item_operations printer_item_ops = {
+static const struct configfs_item_operations printer_item_ops = {
 	.release	= printer_attr_release,
 };
 
diff --git a/drivers/usb/gadget/function/f_serial.c b/drivers/usb/gadget/function/f_serial.c
index 0f266bc067f5..e6b412e0e045 100644
--- a/drivers/usb/gadget/function/f_serial.c
+++ b/drivers/usb/gadget/function/f_serial.c
@@ -260,7 +260,7 @@ static void serial_attr_release(struct config_item *item)
 	usb_put_function_instance(&opts->func_inst);
 }
 
-static struct configfs_item_operations serial_item_ops = {
+static const struct configfs_item_operations serial_item_ops = {
 	.release	= serial_attr_release,
 };
 
diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
index ec5fd25020fd..44c644877d3d 100644
--- a/drivers/usb/gadget/function/f_sourcesink.c
+++ b/drivers/usb/gadget/function/f_sourcesink.c
@@ -882,7 +882,7 @@ static void ss_attr_release(struct config_item *item)
 	usb_put_function_instance(&ss_opts->func_inst);
 }
 
-static struct configfs_item_operations ss_item_ops = {
+static const struct configfs_item_operations ss_item_ops = {
 	.release		= ss_attr_release,
 };
 
diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 6e8804f04baa..92f90592004e 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -2446,7 +2446,7 @@ static void tcm_attr_release(struct config_item *item)
 	usb_put_function_instance(&opts->func_inst);
 }
 
-static struct configfs_item_operations tcm_item_ops = {
+static const struct configfs_item_operations tcm_item_ops = {
 	.release		= tcm_attr_release,
 };
 
diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 9da9fb4e1239..efe9f270b02d 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1512,7 +1512,7 @@ static void f_uac1_attr_release(struct config_item *item)
 	usb_put_function_instance(&opts->func_inst);
 }
 
-static struct configfs_item_operations f_uac1_item_ops = {
+static const struct configfs_item_operations f_uac1_item_ops = {
 	.release	= f_uac1_attr_release,
 };
 
diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 49cf5aae90ca..8fc452b4b39a 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -812,7 +812,7 @@ static void f_uac1_attr_release(struct config_item *item)
 	usb_put_function_instance(&opts->func_inst);
 }
 
-static struct configfs_item_operations f_uac1_item_ops = {
+static const struct configfs_item_operations f_uac1_item_ops = {
 	.release	= f_uac1_attr_release,
 };
 
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index dd252ff2fb4e..98f0f50dc7a8 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -1874,7 +1874,7 @@ static void f_uac2_attr_release(struct config_item *item)
 	usb_put_function_instance(&opts->func_inst);
 }
 
-static struct configfs_item_operations f_uac2_item_ops = {
+static const struct configfs_item_operations f_uac2_item_ops = {
 	.release	= f_uac2_attr_release,
 };
 
diff --git a/drivers/usb/gadget/function/u_ether_configfs.h b/drivers/usb/gadget/function/u_ether_configfs.h
index f558c3139ebe..51f0d79e5eca 100644
--- a/drivers/usb/gadget/function/u_ether_configfs.h
+++ b/drivers/usb/gadget/function/u_ether_configfs.h
@@ -21,7 +21,7 @@
 		usb_put_function_instance(&opts->func_inst);		\
 	}								\
 									\
-	static struct configfs_item_operations _f_##_item_ops = {	\
+	static const struct configfs_item_operations _f_##_item_ops = {	\
 		.release	= _f_##_attr_release,			\
 	}
 
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index a4a2d3dcb0d6..2e74816b9faf 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -127,7 +127,7 @@ static void uvcg_config_item_release(struct config_item *item)
 	kfree(group);
 }
 
-static struct configfs_item_operations uvcg_config_item_ops = {
+static const struct configfs_item_operations uvcg_config_item_ops = {
 	.release	= uvcg_config_item_release,
 };
 
@@ -284,7 +284,7 @@ static struct config_item *uvcg_control_header_make(struct config_group *group,
 	return &h->item;
 }
 
-static struct configfs_group_operations uvcg_control_header_grp_ops = {
+static const struct configfs_group_operations uvcg_control_header_grp_ops = {
 	.make_item		= uvcg_control_header_make,
 };
 
@@ -1232,7 +1232,7 @@ static void uvcg_extension_drop_link(struct config_item *src, struct config_item
 	mutex_unlock(su_mutex);
 }
 
-static struct configfs_item_operations uvcg_extension_item_ops = {
+static const struct configfs_item_operations uvcg_extension_item_ops = {
 	.release	= uvcg_extension_release,
 	.allow_link	= uvcg_extension_allow_link,
 	.drop_link	= uvcg_extension_drop_link,
@@ -1297,7 +1297,7 @@ static struct config_item *uvcg_extension_make(struct config_group *group, const
 	return &xu->item;
 }
 
-static struct configfs_group_operations uvcg_extensions_grp_ops = {
+static const struct configfs_group_operations uvcg_extensions_grp_ops = {
 	.make_item	= uvcg_extension_make,
 	.drop_item	= uvcg_extension_drop,
 };
@@ -1413,7 +1413,7 @@ static void uvcg_control_class_drop_link(struct config_item *src,
 	mutex_unlock(su_mutex);
 }
 
-static struct configfs_item_operations uvcg_control_class_item_ops = {
+static const struct configfs_item_operations uvcg_control_class_item_ops = {
 	.release	= uvcg_config_item_release,
 	.allow_link	= uvcg_control_class_allow_link,
 	.drop_link	= uvcg_control_class_drop_link,
@@ -1663,7 +1663,7 @@ static void uvcg_format_drop_link(struct config_item *src, struct config_item *t
 	mutex_unlock(su_mutex);
 }
 
-static struct configfs_item_operations uvcg_format_item_operations = {
+static const struct configfs_item_operations uvcg_format_item_operations = {
 	.release	= uvcg_config_item_release,
 	.allow_link	= uvcg_format_allow_link,
 	.drop_link	= uvcg_format_drop_link,
@@ -1839,7 +1839,7 @@ static void uvcg_streaming_header_drop_link(struct config_item *src,
 	mutex_unlock(su_mutex);
 }
 
-static struct configfs_item_operations uvcg_streaming_header_item_ops = {
+static const struct configfs_item_operations uvcg_streaming_header_item_ops = {
 	.release	= uvcg_config_item_release,
 	.allow_link	= uvcg_streaming_header_allow_link,
 	.drop_link	= uvcg_streaming_header_drop_link,
@@ -1913,7 +1913,7 @@ static struct config_item
 	return &h->item;
 }
 
-static struct configfs_group_operations uvcg_streaming_header_grp_ops = {
+static const struct configfs_group_operations uvcg_streaming_header_grp_ops = {
 	.make_item		= uvcg_streaming_header_make,
 };
 
@@ -2260,7 +2260,7 @@ static void uvcg_format_set_indices(struct config_group *fmt)
  * streaming/uncompressed/<NAME>
  */
 
-static struct configfs_group_operations uvcg_uncompressed_group_ops = {
+static const struct configfs_group_operations uvcg_uncompressed_group_ops = {
 	.make_item		= uvcg_frame_make,
 	.drop_item		= uvcg_frame_drop,
 };
@@ -2507,7 +2507,7 @@ static struct config_group *uvcg_uncompressed_make(struct config_group *group,
 	return &h->fmt.group;
 }
 
-static struct configfs_group_operations uvcg_uncompressed_grp_ops = {
+static const struct configfs_group_operations uvcg_uncompressed_grp_ops = {
 	.make_group		= uvcg_uncompressed_make,
 };
 
@@ -2524,7 +2524,7 @@ static const struct uvcg_config_group_type uvcg_uncompressed_grp_type = {
  * streaming/mjpeg/<NAME>
  */
 
-static struct configfs_group_operations uvcg_mjpeg_group_ops = {
+static const struct configfs_group_operations uvcg_mjpeg_group_ops = {
 	.make_item		= uvcg_frame_make,
 	.drop_item		= uvcg_frame_drop,
 };
@@ -2697,7 +2697,7 @@ static struct config_group *uvcg_mjpeg_make(struct config_group *group,
 	return &h->fmt.group;
 }
 
-static struct configfs_group_operations uvcg_mjpeg_grp_ops = {
+static const struct configfs_group_operations uvcg_mjpeg_grp_ops = {
 	.make_group		= uvcg_mjpeg_make,
 };
 
@@ -2714,7 +2714,7 @@ static const struct uvcg_config_group_type uvcg_mjpeg_grp_type = {
  * streaming/framebased/<NAME>
  */
 
-static struct configfs_group_operations uvcg_framebased_group_ops = {
+static const struct configfs_group_operations uvcg_framebased_group_ops = {
 	.make_item              = uvcg_frame_make,
 	.drop_item              = uvcg_frame_drop,
 };
@@ -2952,7 +2952,7 @@ static struct config_group *uvcg_framebased_make(struct config_group *group,
 	return &h->fmt.group;
 }
 
-static struct configfs_group_operations uvcg_framebased_grp_ops = {
+static const struct configfs_group_operations uvcg_framebased_grp_ops = {
 	.make_group             = uvcg_framebased_make,
 };
 
@@ -3055,7 +3055,7 @@ static void uvcg_color_matching_release(struct config_item *item)
 	kfree(color_match);
 }
 
-static struct configfs_item_operations uvcg_color_matching_item_ops = {
+static const struct configfs_item_operations uvcg_color_matching_item_ops = {
 	.release	= uvcg_color_matching_release,
 };
 
@@ -3088,7 +3088,7 @@ static struct config_group *uvcg_color_matching_make(struct config_group *group,
 	return &color_match->group;
 }
 
-static struct configfs_group_operations uvcg_color_matching_grp_group_ops = {
+static const struct configfs_group_operations uvcg_color_matching_grp_group_ops = {
 	.make_group	= uvcg_color_matching_make,
 };
 
@@ -3529,7 +3529,7 @@ static void uvcg_streaming_class_drop_link(struct config_item *src,
 	mutex_unlock(su_mutex);
 }
 
-static struct configfs_item_operations uvcg_streaming_class_item_ops = {
+static const struct configfs_item_operations uvcg_streaming_class_item_ops = {
 	.release	= uvcg_config_item_release,
 	.allow_link	= uvcg_streaming_class_allow_link,
 	.drop_link	= uvcg_streaming_class_drop_link,
@@ -3697,7 +3697,7 @@ static void uvc_func_drop_link(struct config_item *src, struct config_item *tgt)
 	mutex_unlock(&opts->lock);
 }
 
-static struct configfs_item_operations uvc_func_item_ops = {
+static const struct configfs_item_operations uvc_func_item_ops = {
 	.release	= uvc_func_item_release,
 	.allow_link	= uvc_func_allow_link,
 	.drop_link	= uvc_func_drop_link,
diff --git a/include/linux/usb/gadget_configfs.h b/include/linux/usb/gadget_configfs.h
index 6b5d6838f865..23c1091e88c0 100644
--- a/include/linux/usb/gadget_configfs.h
+++ b/include/linux/usb/gadget_configfs.h
@@ -30,7 +30,7 @@ static ssize_t __struct##_##__name##_show(struct config_item *item, char *page)
 	CONFIGFS_ATTR(struct_name##_, _name)
 
 #define USB_CONFIG_STRING_RW_OPS(struct_in)				\
-static struct configfs_item_operations struct_in##_langid_item_ops = {	\
+static const struct configfs_item_operations struct_in##_langid_item_ops = {	\
 	.release                = struct_in##_attr_release,		\
 };									\
 									\
@@ -86,7 +86,7 @@ static void struct_in##_strings_drop(					\
 	config_item_put(item);						\
 }									\
 									\
-static struct configfs_group_operations struct_in##_strings_ops = {	\
+static const struct configfs_group_operations struct_in##_strings_ops = {	\
 	.make_group     = &struct_in##_strings_make,			\
 	.drop_item      = &struct_in##_strings_drop,			\
 };									\
-- 
2.52.0



Return-Path: <linux-usb+bounces-15698-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C53D2990326
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 14:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78D3928346A
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 12:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE931D432D;
	Fri,  4 Oct 2024 12:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Lxb7EDHf"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F161FAA
	for <linux-usb@vger.kernel.org>; Fri,  4 Oct 2024 12:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728045477; cv=none; b=Zz1MNaoo36cERh1hOnBFoVXsxKnKa0Qq0lJUTjLW8vj+1Z997BR5KcYFvR98VS7C0XRkJEdpm5kow2Sf8iyOVPEUG9dca2KiafcTKUoxCCXPQF1k5uiw2ex1vW7DBvUxo/9mRey1oVulWIjXonHlwrTRxGmpTULfztbR9C1HXIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728045477; c=relaxed/simple;
	bh=cBThrvn7cUpqvBpHMZdHj4wqW8U2af6g7bHp1BCzVrg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o58Wg43ctPHlUi5uZiKuV/RApUOS1wgw8LVl3ycpUMmZwn+mfR8WS+DH/HgX7abyf0vIalXIfIFzYkPIBCLgRIV/ILEOliJn9xrl0U9iy67sro+QwAi4RlnNqy4jgrPKqRq2SeW5nobVqCmeqe2sZ1lAqiRW+M2YSoPCeuWRDvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Lxb7EDHf; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=uUeD04e+m0NiIp0aVnMQuYhHmOwr4AhKfU0daa/SHNc=; b=Lxb7EDHfqqdbMHpTiXptHO2Yuk
	WWVa7FMyeQbZ3wXMxGdVTPZF0a+FxrjXO+/jzPyCcAiPgPNOdZT0e5kaeGDutTAcUdii0ysTv6GiE
	QwkOxVenNe0+Sc/qVlcg98niyacPCNPubeczYhdwkRUXUzSNZ+b0Wau0s0qs7TdnC0c7xMV2r4YVy
	VB3Q7PQtsgDBX79YjI4sRqmFnsjgPXeqPxcPgvfn+OMCZ4Nl8hz/TVbTJ1vdg5x5tHT3eMrYD9a7y
	Agt9z12QoO/7xej/Y6DkgaEb7Oo30suMn1ryXW58TUghggthMQPv7Gvt2VDn4rhvzGbgmtjZJ9E7n
	9ZjaZxUA==;
Received: from 179-125-71-238-dinamico.pombonet.net.br ([179.125.71.238] helo=quatroqueijos.lan)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1swhZ3-004pgT-Tq; Fri, 04 Oct 2024 14:37:46 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	kernel-dev@igalia.com,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH] usb: typec: altmode should keep reference to parent
Date: Fri,  4 Oct 2024 09:37:38 -0300
Message-Id: <20241004123738.2964524-1-cascardo@igalia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The altmode device release refers to its parent device, but without keeping
a reference to it.

When registering the altmode, get a reference to the parent and put it in
the release function.

Before this fix, when using CONFIG_DEBUG_KOBJECT_RELEASE, we see issues
like this:

[   43.572860] kobject: 'port0.0' (ffff8880057ba008): kobject_release, parent 0000000000000000 (delayed 3000)
[   43.573532] kobject: 'port0.1' (ffff8880057bd008): kobject_release, parent 0000000000000000 (delayed 1000)
[   43.574407] kobject: 'port0' (ffff8880057b9008): kobject_release, parent 0000000000000000 (delayed 3000)
[   43.575059] kobject: 'port1.0' (ffff8880057ca008): kobject_release, parent 0000000000000000 (delayed 4000)
[   43.575908] kobject: 'port1.1' (ffff8880057c9008): kobject_release, parent 0000000000000000 (delayed 4000)
[   43.576908] kobject: 'typec' (ffff8880062dbc00): kobject_release, parent 0000000000000000 (delayed 4000)
[   43.577769] kobject: 'port1' (ffff8880057bf008): kobject_release, parent 0000000000000000 (delayed 3000)
[   46.612867] ==================================================================
[   46.613402] BUG: KASAN: slab-use-after-free in typec_altmode_release+0x38/0x129
[   46.614003] Read of size 8 at addr ffff8880057b9118 by task kworker/2:1/48
[   46.614538]
[   46.614668] CPU: 2 UID: 0 PID: 48 Comm: kworker/2:1 Not tainted 6.12.0-rc1-00138-gedbae730ad31 #535
[   46.615391] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1 04/01/2014
[   46.616042] Workqueue: events kobject_delayed_cleanup
[   46.616446] Call Trace:
[   46.616648]  <TASK>
[   46.616820]  dump_stack_lvl+0x5b/0x7c
[   46.617112]  ? typec_altmode_release+0x38/0x129
[   46.617470]  print_report+0x14c/0x49e
[   46.617769]  ? rcu_read_unlock_sched+0x56/0x69
[   46.618117]  ? __virt_addr_valid+0x19a/0x1ab
[   46.618456]  ? kmem_cache_debug_flags+0xc/0x1d
[   46.618807]  ? typec_altmode_release+0x38/0x129
[   46.619161]  kasan_report+0x8d/0xb4
[   46.619447]  ? typec_altmode_release+0x38/0x129
[   46.619809]  ? process_scheduled_works+0x3cb/0x85f
[   46.620185]  typec_altmode_release+0x38/0x129
[   46.620537]  ? process_scheduled_works+0x3cb/0x85f
[   46.620907]  device_release+0xaf/0xf2
[   46.621206]  kobject_delayed_cleanup+0x13b/0x17a
[   46.621584]  process_scheduled_works+0x4f6/0x85f
[   46.621955]  ? __pfx_process_scheduled_works+0x10/0x10
[   46.622353]  ? hlock_class+0x31/0x9a
[   46.622647]  ? lock_acquired+0x361/0x3c3
[   46.622956]  ? move_linked_works+0x46/0x7d
[   46.623277]  worker_thread+0x1ce/0x291
[   46.623582]  ? __kthread_parkme+0xc8/0xdf
[   46.623900]  ? __pfx_worker_thread+0x10/0x10
[   46.624236]  kthread+0x17e/0x190
[   46.624501]  ? kthread+0xfb/0x190
[   46.624756]  ? __pfx_kthread+0x10/0x10
[   46.625015]  ret_from_fork+0x20/0x40
[   46.625268]  ? __pfx_kthread+0x10/0x10
[   46.625532]  ret_from_fork_asm+0x1a/0x30
[   46.625805]  </TASK>
[   46.625953]
[   46.626056] Allocated by task 678:
[   46.626287]  kasan_save_stack+0x24/0x44
[   46.626555]  kasan_save_track+0x14/0x2d
[   46.626811]  __kasan_kmalloc+0x3f/0x4d
[   46.627049]  __kmalloc_noprof+0x1bf/0x1f0
[   46.627362]  typec_register_port+0x23/0x491
[   46.627698]  cros_typec_probe+0x634/0xbb6
[   46.628026]  platform_probe+0x47/0x8c
[   46.628311]  really_probe+0x20a/0x47d
[   46.628605]  device_driver_attach+0x39/0x72
[   46.628940]  bind_store+0x87/0xd7
[   46.629213]  kernfs_fop_write_iter+0x1aa/0x218
[   46.629574]  vfs_write+0x1d6/0x29b
[   46.629856]  ksys_write+0xcd/0x13b
[   46.630128]  do_syscall_64+0xd4/0x139
[   46.630420]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   46.630820]
[   46.630946] Freed by task 48:
[   46.631182]  kasan_save_stack+0x24/0x44
[   46.631493]  kasan_save_track+0x14/0x2d
[   46.631799]  kasan_save_free_info+0x3f/0x4d
[   46.632144]  __kasan_slab_free+0x37/0x45
[   46.632474]  kfree+0x1d4/0x252
[   46.632725]  device_release+0xaf/0xf2
[   46.633017]  kobject_delayed_cleanup+0x13b/0x17a
[   46.633388]  process_scheduled_works+0x4f6/0x85f
[   46.633764]  worker_thread+0x1ce/0x291
[   46.634065]  kthread+0x17e/0x190
[   46.634324]  ret_from_fork+0x20/0x40
[   46.634621]  ret_from_fork_asm+0x1a/0x30

Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 drivers/usb/typec/class.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9262fcd4144f..d61b4c74648d 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -519,6 +519,7 @@ static void typec_altmode_release(struct device *dev)
 		typec_altmode_put_partner(alt);
 
 	altmode_id_remove(alt->adev.dev.parent, alt->id);
+	put_device(alt->adev.dev.parent);
 	kfree(alt);
 }
 
@@ -568,6 +569,8 @@ typec_register_altmode(struct device *parent,
 	alt->adev.dev.type = &typec_altmode_dev_type;
 	dev_set_name(&alt->adev.dev, "%s.%u", dev_name(parent), id);
 
+	get_device(alt->adev.dev.parent);
+
 	/* Link partners and plugs with the ports */
 	if (!is_port)
 		typec_altmode_set_partner(alt);
-- 
2.34.1



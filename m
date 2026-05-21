Return-Path: <linux-usb+bounces-37903-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yByYCqpBD2qcIQYAu9opvQ
	(envelope-from <linux-usb+bounces-37903-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 19:32:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF3B5AA4E1
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 19:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CE3931433B4
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 17:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320863D1704;
	Thu, 21 May 2026 17:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eFgFV26H"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4673539D6DB
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 17:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779383243; cv=none; b=tM/1a7hoKdFGqdKSTQ4RcmUez3QLOakj+AgqvO7iLAPrJ0eLSdweYCood5/WLSt4ihXW/txmcOmo2NyEsN8tTNbss0m4yVKnZOg2g3uZq2xuABVFWPggYqV3WHX8eZmPqwbvjXNfuQ1RpT0hVFuGqX8R51wDZqcWYlbfQz5LDM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779383243; c=relaxed/simple;
	bh=J8ekiN3JgDf+MC2ZlcZsrTKMI2atYXb5vvMNrtZvEps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I7/IGEASTVa0725Jbuum8JNyLHT0Fwzcol6L173EX00kLiuWCp2af3fpr4aRl76v8OvghZBKYlpnfO0cR2lDGxexZwNLUV6ORApe+x94Rq2dr/znS5KGgaU3PsshQC3MaMQOBU2de8tLouIgVKL/yCAoZ7rgZ64tCCLDjEJ9Zqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eFgFV26H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779383241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5k93cxL33c192mtzgkefm7W9jXNxxW2yYuZyA4gu/gM=;
	b=eFgFV26HJSjks/PbOm6O9Crhxn+UNGZjVB0TQi+ToSSmF+GoGUyspuxLnxnJejCIEp20xV
	r1+Hm7NvYM/huXVJ8wcVusIr00e4UIAIu3fXFHLcOogPAILdmyHEoEQNCVLHYlJDzzLxzX
	V1Di62lFnGufkHp8N6v6YvmusZbP10E=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-8-vF0XIlPTqyU3H-0h7u5A-1; Thu,
 21 May 2026 13:07:17 -0400
X-MC-Unique: 8-vF0XIlPTqyU3H-0h7u5A-1
X-Mimecast-MFC-AGG-ID: 8-vF0XIlPTqyU3H-0h7u5A_1779383235
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AE62A195605E;
	Thu, 21 May 2026 17:07:15 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.80.218])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 49D24300019F;
	Thu, 21 May 2026 17:07:14 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Kuen-Han Tsai <khtsai@google.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vratislav Bendel <vbendel@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH] usb: hub: Make usb_hub_wq type depend on isolcpus/nohz_full setting
Date: Thu, 21 May 2026 13:06:59 -0400
Message-ID: <20260521170659.984284-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37903-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[longman@redhat.com,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7CF3B5AA4E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A Red Hat customer reports a kernel stability problem where hung tasks
are reported with occasional kernel panics. Analysis of the core dump
indicates that USB work items are running on isolcpus+nohz_full cores
competing with RT-class tasks running on those core while holding
usb_hub device mutex transitively blocking other kworkers waiting for
the same mutex leading to hung_task reports.

As the usb_hub_wq uses the WQ_PERCPU flag, it will run the work items on
the same CPU that queues them. For many use cases, it is a more efficient
setup leading to higher throughput as it reduces cacheline bouncing.

It is a different story if the system needs to run latency sensitive RT
workload on dedicated isolated CPUs. Having the kworkers processing work
items on the same set of isolated CPUs will likely break the low latency
requirements of the RT tasks. As the RT tasks have higher priority,
not much CPU time will be left running the kworkers to process work
items which, in turn, will block other tasks that have dependency on
the completion of those work items. In this case, using a WQ_UNBOUND
workqueue to avoid running on isolated CPUs will be more beneficial.

One solution to get the best of both worlds is to make the workqueue
type depending on whether the "isolcpus" or "nohz_full" boot command
line options have been specified. If at least one of those options are
present, usb_hub_wq will be created as an unbound workqueue. Otherwise,
it will remain as a percpu workqueue.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 drivers/usb/core/hub.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 24960ba9caa9..f79e5edd627a 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -33,6 +33,7 @@
 #include <linux/random.h>
 #include <linux/pm_qos.h>
 #include <linux/kobject.h>
+#include <linux/sched/isolation.h>
 
 #include <linux/bitfield.h>
 #include <linux/uaccess.h>
@@ -6066,6 +6067,8 @@ static struct usb_driver hub_driver = {
 
 int usb_hub_init(void)
 {
+	unsigned int wq_flags;
+
 	if (usb_register(&hub_driver) < 0) {
 		printk(KERN_ERR "%s: can't register hub driver\n",
 			usbcore_name);
@@ -6077,8 +6080,17 @@ int usb_hub_init(void)
 	 * USB-PERSIST port handover. Otherwise it might see that a full-speed
 	 * device was gone before the EHCI controller had handed its port
 	 * over to the companion full-speed controller.
+	 *
+	 * Create WQ_UNBOUND workqueue instead of WQ_PERCPU if either isolcpus
+	 * or nohz_full boot option is specified.
 	 */
-	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE | WQ_PERCPU, 0);
+	if (housekeeping_enabled(HK_TYPE_DOMAIN) ||
+	    housekeeping_enabled(HK_TYPE_KERNEL_NOISE))
+		wq_flags = WQ_UNBOUND;
+	else
+		wq_flags = WQ_PERCPU;
+
+	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE | wq_flags, 0);
 	if (hub_wq)
 		return 0;
 
-- 
2.54.0



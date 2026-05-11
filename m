Return-Path: <linux-usb+bounces-37248-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEE1Mk+vAWrXiAEAu9opvQ
	(envelope-from <linux-usb+bounces-37248-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 12:28:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E31050BE45
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 12:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AE6E302FE8C
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 10:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C033D8106;
	Mon, 11 May 2026 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YV/vv8wp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624BD3D7D6A
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 10:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495276; cv=none; b=A9+2Xl2TvU+fujvirv9lSyMlBx4ewMEBiDpBI/tUKbkwe90nN8ZZrPxhd4al7F83fwp2bgh0JhE78qzE9fcjiQySkOLylkHWB7hKTohw0SEOyOZviq5TeJYTRURxZ0hQyFUdzMlr7UgfwdQLBozrGoCJ94aPk8a4Q0ZmVNlzwcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495276; c=relaxed/simple;
	bh=X96G24pY5hCErV8JAZCiu1U+z1SXayz6lAeLWA14lRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzG3omaTKigwk4YHfi5UEz1zviMIJ7wwLk0v2pWWJR6pmOXPp+SS0sOSSf/T1+MEbdDP11LP1lH4OjLIm5bemE+268puliKG826uDDYCuPR/XseHmCXOtZ/xGqwE2aknwBkYx8q/9UkZ40N9ijqXiEQcV+yrVFJm3Beb4SKPNio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YV/vv8wp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778495275; x=1810031275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X96G24pY5hCErV8JAZCiu1U+z1SXayz6lAeLWA14lRE=;
  b=YV/vv8wpRzjtICCvxiJzLJekxuwDBysnhO6bZiTLgn4Wh+jFpCgrdvnt
   d3+VvZC2qaxI6pN2kMfoB094vq/OAnPitPyjG0RaRkVHi5TDsx57Z2TAF
   ltQlzS6bMhINQQLRjWbgcsgOHUTg+0c8RuWoTSDFd8Ni8D0FatwuH99ei
   wjAoUSKd9E+EypQc3ZXF2d+ErkHjZpRA1FwqeP8B9xM6FbXYgX/zsdoA1
   RbXecUxlapwbG3BVl4YtNEaIYg9DaWyLueW3L0PiXfu5pBjRwws+aWxaV
   idNu25xaygzlKpelhpHxcTPj/fP/fL7bSAViIz+uwhbA9DzIoAyCvERi4
   g==;
X-CSE-ConnectionGUID: R7x9TvObTjmqB1ZEeMngUQ==
X-CSE-MsgGUID: hpFfLWaiRVylLoX4PPYNTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79099692"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79099692"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 03:27:53 -0700
X-CSE-ConnectionGUID: lpI1tpwASF6LGT6Of+LFSg==
X-CSE-MsgGUID: +IfnNWp/SiinG+vmcrk6Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="234752252"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 11 May 2026 03:27:49 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A1A98A2; Mon, 11 May 2026 12:27:44 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 07/10] thunderbolt: Add tb_ring_flush()
Date: Mon, 11 May 2026 12:27:41 +0200
Message-ID: <20260511102744.1867485-8-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
References: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8E31050BE45
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com,lunn.ch,lwn.net,linuxfoundation.org,davemloft.net,google.com,kernel.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37248-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

This allows the caller to wait for the ring to be empty. We are going to
need this in the upcoming userspace tunneling support.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c   | 28 ++++++++++++++++++++++++++++
 include/linux/thunderbolt.h |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 13009246e617..a0a789bfb680 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -325,6 +325,8 @@ static void ring_work(struct work_struct *work)
 		if (frame->callback)
 			frame->callback(ring, frame, canceled);
 	}
+
+	wake_up(&ring->wait);
 }
 
 int __tb_ring_enqueue(struct tb_ring *ring, struct ring_frame *frame)
@@ -601,6 +603,7 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	INIT_LIST_HEAD(&ring->queue);
 	INIT_LIST_HEAD(&ring->in_flight);
 	INIT_WORK(&ring->work, ring_work);
+	init_waitqueue_head(&ring->wait);
 
 	ring->nhi = nhi;
 	ring->hop = hop;
@@ -760,6 +763,31 @@ void tb_ring_start(struct tb_ring *ring)
 }
 EXPORT_SYMBOL_GPL(tb_ring_start);
 
+static bool tb_ring_empty(struct tb_ring *ring)
+{
+	guard(spinlock_irqsave)(&ring->lock);
+	return list_empty(&ring->in_flight);
+}
+
+/**
+ * tb_ring_flush() - Waits for a ring to be empty
+ * @ring: Ring to wait
+ * @timeout_msec: Timeout in ms how long to wait.
+ *
+ * This can be called before stopping a ring to make sure all the frames
+ * submitted prior have been completed.
+ *
+ * Return: %true if the ring is empty now, %false otherwise.
+ */
+bool tb_ring_flush(struct tb_ring *ring, unsigned int timeout_msec)
+{
+	if (!wait_event_timeout(ring->wait, tb_ring_empty(ring),
+				msecs_to_jiffies(timeout_msec)))
+		return false;
+	return tb_ring_empty(ring);
+}
+EXPORT_SYMBOL_GPL(tb_ring_flush);
+
 /**
  * tb_ring_stop() - shutdown a ring
  * @ring: Ring to stop
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 9df8a356396f..9c5cb5e4f23d 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -556,6 +556,7 @@ struct tb_nhi {
  * @poll_data: Data passed to @start_poll
  * @interval_nsec: Interval counter if interrupt throttling is to be
  *		   used with this ring (in ns)
+ * @wait: Used to signal that the ring may be empty now
  */
 struct tb_ring {
 	spinlock_t lock;
@@ -580,6 +581,7 @@ struct tb_ring {
 	void (*start_poll)(void *data);
 	void *poll_data;
 	unsigned int interval_nsec;
+	wait_queue_head_t wait;
 };
 
 /* Leave ring interrupt enabled on suspend */
@@ -653,6 +655,7 @@ struct tb_ring *tb_ring_alloc_rx(struct tb_nhi *nhi, int hop, int size,
 				 u16 sof_mask, u16 eof_mask,
 				 void (*start_poll)(void *), void *poll_data);
 void tb_ring_start(struct tb_ring *ring);
+bool tb_ring_flush(struct tb_ring *ring, unsigned int timeout_msec);
 void tb_ring_stop(struct tb_ring *ring);
 void tb_ring_free(struct tb_ring *ring);
 
-- 
2.50.1



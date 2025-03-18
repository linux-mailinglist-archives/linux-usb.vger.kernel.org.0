Return-Path: <linux-usb+bounces-21851-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EE0A677A0
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 16:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A745C3A944E
	for <lists+linux-usb@lfdr.de>; Tue, 18 Mar 2025 15:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424C120E703;
	Tue, 18 Mar 2025 15:22:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD1620DD7B
	for <linux-usb@vger.kernel.org>; Tue, 18 Mar 2025 15:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742311355; cv=none; b=IpcunRF9Fr3itpp9veUHEYNYkPb7SpWtvEAE624s5YAyBmo258VsoJUIOsa9lAerelJUt6Slcjuqq7bXKBXHPYA1sSsE4snOpIp8sQrXQBY/tD18foMYzckk53+oVrh1f61/dtwmHpJ4d1UbKRH/MNpa/BNGNLv6dm3uP3hQSl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742311355; c=relaxed/simple;
	bh=yftSaW5pqEifSQdDtqgmLKWgEtLSoM4i36ne/OesOl4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lDY6sA9rqGI2IZS29XvbfxDPNL4JDUcgix+VAEY2VEDLqwzyrfb0ofAM8bHqoooKWPrvBoFEKkZ0zHp9zUVto4Q5nhS7ujUky/KqZZ4B7G713R8coVqf9jz+nt48OuJcggWUbXEExksZ8UMbmDUkd3aEGocXFrHcsAeWePvPwT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BA56442D2;
	Tue, 18 Mar 2025 15:22:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@dell.be.48ers.dk>)
	id 1tuYls-001O81-0B;
	Tue, 18 Mar 2025 16:22:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	john@keeping.me.uk
Cc: Peter Korsgaard <peter@korsgaard.com>
Subject: [PATCH] usb: gadget: f_hid: wake up readers on disable/unbind
Date: Tue, 18 Mar 2025 16:22:07 +0100
Message-Id: <20250318152207.330997-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeevieevtefhleetleeuledvffeivefgvddtiedvteeugffftddvueffveehgeffudenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvkhhosehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhhnheskhgvvghpihhnghdrmhgvrdhukhdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhm
X-GND-Sasl: peter@korsgaard.com

Similar to how it is done in the write path.

Add a disabled flag to track the function state and use it to exit the read
loops to ensure no readers get stuck when the function is disabled/unbound,
protecting against corruption when the waitq and spinlocks are reinitialized
in hidg_bind().

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 drivers/usb/gadget/function/f_hid.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 740311c4fa249..1bc40fc0ccf77 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -75,6 +75,7 @@ struct f_hidg {
 	/* recv report */
 	spinlock_t			read_spinlock;
 	wait_queue_head_t		read_queue;
+	bool				disabled;
 	/* recv report - interrupt out only (use_out_ep == 1) */
 	struct list_head		completed_out_req;
 	unsigned int			qlen;
@@ -329,7 +330,7 @@ static ssize_t f_hidg_intout_read(struct file *file, char __user *buffer,
 
 	spin_lock_irqsave(&hidg->read_spinlock, flags);
 
-#define READ_COND_INTOUT (!list_empty(&hidg->completed_out_req))
+#define READ_COND_INTOUT (!list_empty(&hidg->completed_out_req) || hidg->disabled)
 
 	/* wait for at least one buffer to complete */
 	while (!READ_COND_INTOUT) {
@@ -343,6 +344,11 @@ static ssize_t f_hidg_intout_read(struct file *file, char __user *buffer,
 		spin_lock_irqsave(&hidg->read_spinlock, flags);
 	}
 
+	if (hidg->disabled) {
+		spin_unlock_irqrestore(&hidg->read_spinlock, flags);
+		return -ESHUTDOWN;
+	}
+
 	/* pick the first one */
 	list = list_first_entry(&hidg->completed_out_req,
 				struct f_hidg_req_list, list);
@@ -387,7 +393,7 @@ static ssize_t f_hidg_intout_read(struct file *file, char __user *buffer,
 	return count;
 }
 
-#define READ_COND_SSREPORT (hidg->set_report_buf != NULL)
+#define READ_COND_SSREPORT (hidg->set_report_buf != NULL || hidg->disabled)
 
 static ssize_t f_hidg_ssreport_read(struct file *file, char __user *buffer,
 				    size_t count, loff_t *ptr)
@@ -1012,6 +1018,11 @@ static void hidg_disable(struct usb_function *f)
 	}
 	spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
 
+	spin_lock_irqsave(&hidg->read_spinlock, flags);
+	hidg->disabled = true;
+	spin_unlock_irqrestore(&hidg->read_spinlock, flags);
+	wake_up(&hidg->read_queue);
+
 	spin_lock_irqsave(&hidg->write_spinlock, flags);
 	if (!hidg->write_pending) {
 		free_ep_req(hidg->in_ep, hidg->req);
@@ -1097,6 +1108,10 @@ static int hidg_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 		}
 	}
 
+	spin_lock_irqsave(&hidg->read_spinlock, flags);
+	hidg->disabled = false;
+	spin_unlock_irqrestore(&hidg->read_spinlock, flags);
+
 	if (hidg->in_ep != NULL) {
 		spin_lock_irqsave(&hidg->write_spinlock, flags);
 		hidg->req = req_in;
-- 
2.39.5



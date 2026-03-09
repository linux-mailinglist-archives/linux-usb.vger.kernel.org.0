Return-Path: <linux-usb+bounces-34297-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDuLD2q4rmlIIQIAu9opvQ
	(envelope-from <linux-usb+bounces-34297-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 13:09:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FED2387BB
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 13:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4E8D305BFF5
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 12:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2937D3A7846;
	Mon,  9 Mar 2026 12:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EPep4LD9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43143A7837
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 12:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057920; cv=none; b=oEG8Jn+zwjefv89BCF1yrnj2wj/JgjaAiAV7ICR39ZZ6jg7KStd/8Qt5pQ/yDav05rkP39ukt0sQxuyFDXENK2RdI2A9bVbTY52D+IsnpK5aQJxlBQUAbGw6CBQDNez1wT+pMUpBFSA7y9VXEQF/M5LKsPTqbBEmoQsh7vf1CYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057920; c=relaxed/simple;
	bh=5/YxhynNP5OtTJz20C93GRmdTUgl+LzpEZyjUYK3nk0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Mksdq+MzasWNpBJLUJE80gwgtxXIZefocgl99S2xyFKCDN+O6nMmukft21lPSBFrxBwPystMNvgfhDF6Gg4Ah9UE7LIxuZLAT/k+5//Z/YK9rfmu0BDY4uMbXJ2rPXSj/Mx6IQCiJ0q+mx6XkNXKvmCdwn9+31Oc8O9hieVXg2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EPep4LD9; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ae4af66f40so88379605ad.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 05:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773057918; x=1773662718; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Up+QEdUkj26uFbINRayYsiYrdHXv4LEpi2MdfDCCm0k=;
        b=EPep4LD9GhZSsD3Q8MOWfGAIpU3WV8tkKqdylJ2Cd57Mgto1hLrbfHtPav2X7m0o/N
         oT+KNtaYMSP5O/ki9FdPBSRm/3+CBDZKdmzy/wQHN7X/QLNVDlpeOVfak+lUB38+tsuh
         iVWv2CtJdqsp76ynMHKMcUUP9mIplM3Ws565TbPFQO1rzLiCmjuQ/TbHeMCs5cTCeeN2
         54hI4DmylCfQ8SB/cBOGaIJAxXvbRNFyZd/fGG3lc16yH9e3hEahvo81TfGkFrxhU066
         v4SUhXUcXtClGEDx4f7O7tNl94D42Dm6tXnrZHCOWNic8kmCrbwjNGMncF3uUMT1twBU
         z6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773057918; x=1773662718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Up+QEdUkj26uFbINRayYsiYrdHXv4LEpi2MdfDCCm0k=;
        b=VJdaHIyiK85nB/H3LivDzhiqA2g/5spIrdkgwmFlZFzQj/Mz10bMHTUHCx3vaSYxIe
         TTsR/8zGY/aMEul2pBV5hL1mHW74IZoPnNF+gBpA1RvwIM6ci+ANbnGkCF4cpASO5p8H
         WILHleVYJxWwThoj18VmegDomATs1pKRMLmRBHCJMfxhyMtlQNMXtm4wg4yTcy+p4Uw5
         XOMvqfEe2mtMWPk4KmjEy/wmPG/ys5l9mGyteNujknk+kWxasMNmJZjUS5ll87QPNUFz
         88z2UUpa1xMOMM5Nf7Y2r9sTiJDzh83MQVOEVtsU25Wwdzjm+SmufHsuYfYfOlP+UiBp
         6R0g==
X-Forwarded-Encrypted: i=1; AJvYcCVTuzEIGHe6+7j6Uk9mV58gA4oON1Lv5lO731aIUEyHEs57ibpHBacyki7ox5oZBPuxJlnoxexzA7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF3um/PAy+VXgGhnm+b6Sh5js57bE4ZRRYckeKcww886LkRMlw
	Ic+X3IZACrkjrQIsiL0ZSGbi/A5lBo+nHgP3xeu0fduHDV7iOEn+GKLTDV68RVi4hhBfP+JmhiE
	7VjQrFg==
X-Received: from plbmi14.prod.google.com ([2002:a17:902:fcce:b0:2ae:8189:6d82])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:f87:b0:2ae:44f4:1678
 with SMTP id d9443c01a7336-2ae824b83e7mr102046305ad.57.1773057917958; Mon, 09
 Mar 2026 05:05:17 -0700 (PDT)
Date: Mon, 09 Mar 2026 20:04:46 +0800
In-Reply-To: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773057914; l=5610;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=5/YxhynNP5OtTJz20C93GRmdTUgl+LzpEZyjUYK3nk0=; b=x/I92mmzRMq+qRpeXxxEasVw5ga1d/zxTzpfK55lfaMSKWuCUqkBCVOhOqywT8qiyfBDrtl4E
 F1m+KinqSkaCYgpIQUtHQQnlG1GXqwuQt2ZK/eqT8VE9RK6tm2jMhez
X-Mailer: b4 0.14.3
Message-ID: <20260309-f-ncm-revert-v2-1-ea2afbc7d9b2@google.com>
Subject: [PATCH v2 1/7] Revert "usb: gadget: f_ncm: Fix atomic context locking issue"
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Heidelberg <david@ixit.cz>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Jon Hunter <jonathanh@nvidia.com>, LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: D2FED2387BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34297-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khtsai@google.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.929];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ixit.cz:email]
X-Rspamd-Action: no action

This reverts commit 0d6c8144ca4d93253de952a5ea0028c19ed7ab68.

This commit is being reverted as part of a series-wide revert.

By deferring the net_device allocation to the bind() phase, a single
function instance will spawn multiple network devices if it is symlinked
to multiple USB configurations.

This causes regressions for userspace tools (like the postmarketOS DHCP
daemon) that rely on reading the interface name (e.g., "usb0") from
configfs. Currently, configfs returns the template "usb%d", causing the
userspace network setup to fail.

Crucially, because this patch breaks the 1:1 mapping between the
function instance and the network device, this naming issue cannot
simply be patched. Configfs only exposes a single 'ifname' attribute per
instance, making it impossible to accurately report the actual interface
name when multiple underlying network devices can exist for that single
instance.

All configurations tied to the same function instance are meant to share
a single network device. Revert this change to restore the 1:1 mapping
by allocating the network device at the instance level (alloc_inst).

Reported-by: David Heidelberg <david@ixit.cz>
Closes: https://lore.kernel.org/linux-usb/70b558ea-a12e-4170-9b8e-c951131249af@ixit.cz/
Fixes: 56a512a9b410 ("usb: gadget: f_ncm: align net_device lifecycle with bind/unbind")
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/f_ncm.c            | 29 +++++++++++++++-----------
 drivers/usb/gadget/function/u_ether_configfs.h | 11 +++++++++-
 drivers/usb/gadget/function/u_ncm.h            |  1 +
 3 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 4da19864d70b..14fc7dce6f39 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -58,7 +58,6 @@ struct f_ncm {
 	u8				notify_state;
 	atomic_t			notify_count;
 	bool				is_open;
-	bool				is_connected;
 
 	const struct ndp_parser_opts	*parser_opts;
 	bool				is_crc;
@@ -865,6 +864,7 @@ static int ncm_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 static int ncm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 {
 	struct f_ncm		*ncm = func_to_ncm(f);
+	struct f_ncm_opts	*opts = func_to_ncm_opts(f);
 	struct usb_composite_dev *cdev = f->config->cdev;
 
 	/* Control interface has only altsetting 0 */
@@ -887,12 +887,13 @@ static int ncm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 		if (alt > 1)
 			goto fail;
 
-		if (ncm->is_connected) {
-			DBG(cdev, "reset ncm\n");
-			ncm->is_connected = false;
-			gether_disconnect(&ncm->port);
-			ncm_reset_values(ncm);
-		}
+		scoped_guard(mutex, &opts->lock)
+			if (opts->net) {
+				DBG(cdev, "reset ncm\n");
+				opts->net = NULL;
+				gether_disconnect(&ncm->port);
+				ncm_reset_values(ncm);
+			}
 
 		/*
 		 * CDC Network only sends data in non-default altsettings.
@@ -925,7 +926,8 @@ static int ncm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 			net = gether_connect(&ncm->port);
 			if (IS_ERR(net))
 				return PTR_ERR(net);
-			ncm->is_connected = true;
+			scoped_guard(mutex, &opts->lock)
+				opts->net = net;
 		}
 
 		spin_lock(&ncm->lock);
@@ -1372,14 +1374,16 @@ static int ncm_unwrap_ntb(struct gether *port,
 static void ncm_disable(struct usb_function *f)
 {
 	struct f_ncm		*ncm = func_to_ncm(f);
+	struct f_ncm_opts	*opts = func_to_ncm_opts(f);
 	struct usb_composite_dev *cdev = f->config->cdev;
 
 	DBG(cdev, "ncm deactivated\n");
 
-	if (ncm->is_connected) {
-		ncm->is_connected = false;
-		gether_disconnect(&ncm->port);
-	}
+	scoped_guard(mutex, &opts->lock)
+		if (opts->net) {
+			opts->net = NULL;
+			gether_disconnect(&ncm->port);
+		}
 
 	if (ncm->notify->enabled) {
 		usb_ep_disable(ncm->notify);
@@ -1683,6 +1687,7 @@ static struct usb_function_instance *ncm_alloc_inst(void)
 	if (!opts)
 		return ERR_PTR(-ENOMEM);
 
+	opts->net = NULL;
 	opts->ncm_os_desc.ext_compat_id = opts->ncm_ext_compat_id;
 	gether_setup_opts_default(&opts->net_opts, "usb");
 
diff --git a/drivers/usb/gadget/function/u_ether_configfs.h b/drivers/usb/gadget/function/u_ether_configfs.h
index 25d8fb05b598..217990a266b2 100644
--- a/drivers/usb/gadget/function/u_ether_configfs.h
+++ b/drivers/usb/gadget/function/u_ether_configfs.h
@@ -327,9 +327,18 @@ out:									\
 					      char *page)			\
 	{									\
 		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
+		const char *name;						\
 										\
 		guard(mutex)(&opts->lock);					\
-		return sysfs_emit(page, "%s\n", opts->net_opts.name);		\
+		rtnl_lock();							\
+		if (opts->net_opts.ifname_set)					\
+			name = opts->net_opts.name;				\
+		else if (opts->net)						\
+			name = netdev_name(opts->net);				\
+		else								\
+			name = "(inactive net_device)";				\
+		rtnl_unlock();							\
+		return sysfs_emit(page, "%s\n", name);				\
 	}									\
 										\
 	static ssize_t _f_##_opts_ifname_store(struct config_item *item,	\
diff --git a/drivers/usb/gadget/function/u_ncm.h b/drivers/usb/gadget/function/u_ncm.h
index 6d7538855744..d99330fe31e8 100644
--- a/drivers/usb/gadget/function/u_ncm.h
+++ b/drivers/usb/gadget/function/u_ncm.h
@@ -19,6 +19,7 @@
 
 struct f_ncm_opts {
 	struct usb_function_instance	func_inst;
+	struct net_device		*net;
 
 	struct gether_opts		net_opts;
 	struct config_group		*ncm_interf_group;

-- 
2.53.0.473.g4a7958ca14-goog



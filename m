Return-Path: <linux-usb+bounces-33539-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKCyGhHGmWmfWgMAu9opvQ
	(envelope-from <linux-usb+bounces-33539-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 21 Feb 2026 15:49:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AA716D0F2
	for <lists+linux-usb@lfdr.de>; Sat, 21 Feb 2026 15:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F9A0302BDC8
	for <lists+linux-usb@lfdr.de>; Sat, 21 Feb 2026 14:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022711F5834;
	Sat, 21 Feb 2026 14:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YBiYcnZ3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B28199FAC
	for <linux-usb@vger.kernel.org>; Sat, 21 Feb 2026 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771685335; cv=none; b=loOfOm8nedE27CiUDU9hndYP4DnmPCsmaH+9Zem1yJA9/TtLQmrk1/LsspsxQcgNl785kZR7/SsHxfg0qURp/6epvgoRJxMYZ7X7v28W5C5vUVwBRJRTtUrgrDvoOl+OyNfNQWO8ry/TFs3ND2lhBoCm1U1PkC8CAaiv9541cK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771685335; c=relaxed/simple;
	bh=c6Au8SEnwAzozh8LgOHPKTcZtSKVQWswj+SVzNT6OAA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fN3IxBnSthaJgkrqM0baCVUdw+LgBt8W4e7/yVNo3WD05mCrQ/KuK6EjzNWEpmIjxwsvjE7j4g9GjN04aVCqkIgKty/74/ZKaTdAQVup6ayt3fVeQo+t1usBLAxI0BoDEC8wyLlRF3mDCBMp3apdG1PxEWz0S0fJiL6/XWntCcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YBiYcnZ3; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8243fc3fe8eso11579759b3a.1
        for <linux-usb@vger.kernel.org>; Sat, 21 Feb 2026 06:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771685333; x=1772290133; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cxLkydTf9614aLgaebvByTpNLFxiZkbf4oPlXDhy8+A=;
        b=YBiYcnZ3mg08MKlVRA5+U/aZfvAfRMvfmUJO8MRDSQiw3PsskjIdRGx9qklIYQX7Oh
         dvRFcZfN+r0i1ZsbK+IXOJfoxeO91qihyFDfyKFDoD8/V2PZvElXdnLhJ7kcxUnapTxQ
         UxRk15XnaexOr0MKuMhGK1kJ/ullzh8lfMhLq6bTlGqr8Rq4XibviuIQa7QkjvVNb2Ek
         uIZPbMXqVfiqTIryzlMgbbNjUTXc4LAo0Oe/QEm2j9cZual0FLY4s5/IMCe5GPPmCD8o
         s7B+Onpi+yNY1HNxKAGNcQ9kwH9x/1LZLyeTO53+rVOjgoRTMIM8tpGa0vseTjnycYNq
         aWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771685333; x=1772290133;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxLkydTf9614aLgaebvByTpNLFxiZkbf4oPlXDhy8+A=;
        b=HhXVEvYPhmxowvLUju2h+2gTKo8WZAW/grg1L+4R249qLOZDCdO9OC/rikQK7Sqq+R
         VVSPcPR/BNQHkwWqUzzHeGZ8esKlwoMTFE6HyY0ZpiLhtZWXgQ8GKRqm3DVJh9aY8qH8
         0kNa5u2oUNMNtjS42AYkml/9S8YY2XWVeugyCAKbJULZevyZcgguoXh5IBdXWFza9Dsf
         AuE3pdPtd1Xma0R3Cqo58yChtOanVZ1jsSmDOLwZNQwuvb8Ae5NQM90Ui9+m2PYpMel0
         DHDhMhYV7UghWmNJnaDqRT9u+7ID0QLgsGsPUuM+oaOWA2DKm8PjXf0Y979CK+fdwILc
         YJBg==
X-Gm-Message-State: AOJu0Yw8GMLNm8C1zDPQHaj+Xq70+bH8l1HpMZROAFm4DvApzFOL0Lsg
	VMCExpJIIrMmDBjlHHAuKOhO5J21Dv583sN+vpKrdUUHHpaSxcxB9dsOLEl44B7LHhxx33OxuYs
	133ZCvA==
X-Received: from pfbhc21.prod.google.com ([2002:a05:6a00:6515:b0:824:afd9:57a7])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d03:b0:821:849a:a65b
 with SMTP id d2e1a72fcca58-826daa80907mr2857476b3a.60.1771685333359; Sat, 21
 Feb 2026 06:48:53 -0800 (PST)
Date: Sat, 21 Feb 2026 22:48:16 +0800
In-Reply-To: <20260221-legacy-ncm-v2-0-dfb891d76507@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260221-legacy-ncm-v2-0-dfb891d76507@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771685327; l=5279;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=c6Au8SEnwAzozh8LgOHPKTcZtSKVQWswj+SVzNT6OAA=; b=YOSnht4KhONMB0BJZGT/GYeKGKddU5XYhRqFS6YIejyzJ5CHov7R00f4isUByNRmtdeWbhlT3
 baQ3+R+PRZrBInHf404WhAITE4IiTHLpZlkepsZNVeMAG7yj8r8Owxt
X-Mailer: b4 0.14.2
Message-ID: <20260221-legacy-ncm-v2-2-dfb891d76507@google.com>
Subject: [PATCH v2 2/2] usb: gadget: f_ncm: Fix atomic context locking issue
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@kernel.org
Content-Type: text/plain; charset="utf-8"
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33539-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khtsai@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E5AA716D0F2
X-Rspamd-Action: no action

The ncm_set_alt function was holding a mutex to protect against races
with configfs, which invokes the might-sleep function inside an atomic
context.

Remove the struct net_device pointer from the f_ncm_opts structure to
eliminate the contention. The connection state is now managed by a new
boolean flag to preserve the use-after-free fix from
commit 6334b8e4553c ("usb: gadget: f_ncm: Fix UAF ncm object at re-bind
after usb ep transport error").

BUG: sleeping function called from invalid context
Call Trace:
 dump_stack_lvl+0x83/0xc0
 dump_stack+0x14/0x16
 __might_resched+0x389/0x4c0
 __might_sleep+0x8e/0x100
 ...
 __mutex_lock+0x6f/0x1740
 ...
 ncm_set_alt+0x209/0xa40
 set_config+0x6b6/0xb40
 composite_setup+0x734/0x2b40
 ...

Fixes: 56a512a9b410 ("usb: gadget: f_ncm: align net_device lifecycle with bind/unbind")
Cc: stable@kernel.org
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/f_ncm.c            | 29 +++++++++++---------------
 drivers/usb/gadget/function/u_ether_configfs.h | 11 +---------
 drivers/usb/gadget/function/u_ncm.h            |  1 -
 3 files changed, 13 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index e23adc132f8865f6bbce6c88c8b5f3f06110faaa..6f074b85eebcf93a67e0fbc3b0fecaf702286f83 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -58,6 +58,7 @@ struct f_ncm {
 	u8				notify_state;
 	atomic_t			notify_count;
 	bool				is_open;
+	bool				is_connected;
 
 	const struct ndp_parser_opts	*parser_opts;
 	bool				is_crc;
@@ -864,7 +865,6 @@ static int ncm_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 static int ncm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 {
 	struct f_ncm		*ncm = func_to_ncm(f);
-	struct f_ncm_opts	*opts = func_to_ncm_opts(f);
 	struct usb_composite_dev *cdev = f->config->cdev;
 
 	/* Control interface has only altsetting 0 */
@@ -887,13 +887,12 @@ static int ncm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 		if (alt > 1)
 			goto fail;
 
-		scoped_guard(mutex, &opts->lock)
-			if (opts->net) {
-				DBG(cdev, "reset ncm\n");
-				opts->net = NULL;
-				gether_disconnect(&ncm->port);
-				ncm_reset_values(ncm);
-			}
+		if (ncm->is_connected) {
+			DBG(cdev, "reset ncm\n");
+			ncm->is_connected = false;
+			gether_disconnect(&ncm->port);
+			ncm_reset_values(ncm);
+		}
 
 		/*
 		 * CDC Network only sends data in non-default altsettings.
@@ -926,8 +925,7 @@ static int ncm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 			net = gether_connect(&ncm->port);
 			if (IS_ERR(net))
 				return PTR_ERR(net);
-			scoped_guard(mutex, &opts->lock)
-				opts->net = net;
+			ncm->is_connected = true;
 		}
 
 		spin_lock(&ncm->lock);
@@ -1374,16 +1372,14 @@ static int ncm_unwrap_ntb(struct gether *port,
 static void ncm_disable(struct usb_function *f)
 {
 	struct f_ncm		*ncm = func_to_ncm(f);
-	struct f_ncm_opts	*opts = func_to_ncm_opts(f);
 	struct usb_composite_dev *cdev = f->config->cdev;
 
 	DBG(cdev, "ncm deactivated\n");
 
-	scoped_guard(mutex, &opts->lock)
-		if (opts->net) {
-			opts->net = NULL;
-			gether_disconnect(&ncm->port);
-		}
+	if (ncm->is_connected) {
+		ncm->is_connected = false;
+		gether_disconnect(&ncm->port);
+	}
 
 	if (ncm->notify->enabled) {
 		usb_ep_disable(ncm->notify);
@@ -1687,7 +1683,6 @@ static struct usb_function_instance *ncm_alloc_inst(void)
 	if (!opts)
 		return ERR_PTR(-ENOMEM);
 
-	opts->net = NULL;
 	opts->ncm_os_desc.ext_compat_id = opts->ncm_ext_compat_id;
 	gether_setup_opts_default(&opts->net_opts, "usb");
 
diff --git a/drivers/usb/gadget/function/u_ether_configfs.h b/drivers/usb/gadget/function/u_ether_configfs.h
index 217990a266b2f6528d7bf8537a77214c538f681a..25d8fb05b598d68268cf849f260b435f9c52337c 100644
--- a/drivers/usb/gadget/function/u_ether_configfs.h
+++ b/drivers/usb/gadget/function/u_ether_configfs.h
@@ -327,18 +327,9 @@ out:									\
 					      char *page)			\
 	{									\
 		struct f_##_f_##_opts *opts = to_f_##_f_##_opts(item);		\
-		const char *name;						\
 										\
 		guard(mutex)(&opts->lock);					\
-		rtnl_lock();							\
-		if (opts->net_opts.ifname_set)					\
-			name = opts->net_opts.name;				\
-		else if (opts->net)						\
-			name = netdev_name(opts->net);				\
-		else								\
-			name = "(inactive net_device)";				\
-		rtnl_unlock();							\
-		return sysfs_emit(page, "%s\n", name);				\
+		return sysfs_emit(page, "%s\n", opts->net_opts.name);		\
 	}									\
 										\
 	static ssize_t _f_##_opts_ifname_store(struct config_item *item,	\
diff --git a/drivers/usb/gadget/function/u_ncm.h b/drivers/usb/gadget/function/u_ncm.h
index d99330fe31e880f636615774d212062952c31e43..6d75388557448e7acebf2401f8da48105f740e2f 100644
--- a/drivers/usb/gadget/function/u_ncm.h
+++ b/drivers/usb/gadget/function/u_ncm.h
@@ -19,7 +19,6 @@
 
 struct f_ncm_opts {
 	struct usb_function_instance	func_inst;
-	struct net_device		*net;
 
 	struct gether_opts		net_opts;
 	struct config_group		*ncm_interf_group;

-- 
2.53.0.345.g96ddfc5eaa-goog



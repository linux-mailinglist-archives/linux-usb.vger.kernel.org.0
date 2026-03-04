Return-Path: <linux-usb+bounces-33938-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ46EC/bp2kRkQAAu9opvQ
	(envelope-from <linux-usb+bounces-33938-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 08:11:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 980C31FB67F
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 08:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFE813059A8C
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 07:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5118A37DEAC;
	Wed,  4 Mar 2026 07:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MrPDbLTu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA19E31D362
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 07:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772608281; cv=none; b=Rme0Tpahyv2RQ75l96baUl4EB+PfKLzaMpxLbJ9IJm2442usHu3CKF8MNqV+7Tu+cJCXXf4FQ+neONk+I9EwLS7YBhWrvlpL4GqevMchbmPaquF5EJs+PdeXskM4EccHvmTIHgfB/8baL8zjIy556/LTh7eZZzxobJ3WTWu+lGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772608281; c=relaxed/simple;
	bh=5/YxhynNP5OtTJz20C93GRmdTUgl+LzpEZyjUYK3nk0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WQ3YPiOCADGXGzl1NTkWooVmDDWt6yvJKhwsQF6bfHY3zdagDukky8KKNYe2tlvJioyP0swLUXSoPiui6Hjh/ZByaldjnYUJ48MmLwaY0RS09x88XyDY1IwdjT5aLSWeC9ftbbi4Ues3sYcG30+ciXFbsGzfcTwlu/I2Cuni3tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MrPDbLTu; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3598d4b19deso12508746a91.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2026 23:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772608280; x=1773213080; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Up+QEdUkj26uFbINRayYsiYrdHXv4LEpi2MdfDCCm0k=;
        b=MrPDbLTu3Od2JI0eCagz3AROGG5NDiONyCd9oD+f+ThQuE1E7RT7/WMFibmuTmsfVI
         Skr9/7VkTvmaMd0z4IhJtze9YrTRi5cUPhgDWJSY4RTV/31l8R9hCJ1nldlbYkR7Xlqi
         vfes3x3/4cGzCXSvZ7NqAyi6BIvURngdW6jR4Rk4DqwqyDGSi8TQ8rQcpoKtFMiz7+1d
         LNeN2jwZyeH8oZ229H9GkCYjErin0ksPLRy4Fm5webs5TJwRUaIjLyb4VMRbPARUXoUW
         y9cvGrmIiXXIffa7nemQUDfL2Yzviza36UDscwTgJuv5Cay8PtboJdUviqdN+aUR7Dr0
         OEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772608280; x=1773213080;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Up+QEdUkj26uFbINRayYsiYrdHXv4LEpi2MdfDCCm0k=;
        b=iaXgtHv4tsiGPl/hLkj5+yeC29gWRSjjbAEHyO7SvrB/g3/PiHPKFUY9MLif9aH9DQ
         m+SxqA6y5khwHbNvoG8FZGcgPFqzEFt0f4JlQ29JMKZv9ZLzZlPZnWfPOpm487cszNU9
         rrTm7tZQAQ0EahSSb7ZOgSWoV88yySIGPSuLCSI1bbR1idLuUl9tYBY6CduaeOrk9NKI
         3u0ri9MfgYLCqcsPGqranrez0TCyUu7vHve9xdTRuWXWwjJn+56y+FVGhqMAmeu33+fA
         4s2Q4W0u13Zmh2iUn/B7X5ph1HOHj8E1iWTzuK3KlEVA+f9cErR4QTQZJ8YdYbHja7ZT
         JQ9w==
X-Forwarded-Encrypted: i=1; AJvYcCVe6BoQ1sMM6mJB17BlXRulgbTvwZYUB5ddKljJq3tBmmzsDHQgokRxb6Yi5LczB/wN4HNKQgvY8is=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5YZ5umpDY/KTvW0jbL7+0lCgsrB/R85BSigaoghYhltE3/Npx
	sIKTX7Bq+mYMPW/sQXLcMR8dncyvgD2wmysdhcsk7lv+Z8QLcAqXHDw7iatTmfmvJwG6WLYD68n
	v6wrxFQ==
X-Received: from pgbfq8.prod.google.com ([2002:a05:6a02:2988:b0:bd9:a349:94b7])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:193:b0:389:8f3f:50d0
 with SMTP id adf61e73a8af0-3982e2a9a32mr1160280637.60.1772608279770; Tue, 03
 Mar 2026 23:11:19 -0800 (PST)
Date: Wed, 04 Mar 2026 15:10:53 +0800
In-Reply-To: <20260304-f-ncm-revert-v1-0-57c9157b58af@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260304-f-ncm-revert-v1-0-57c9157b58af@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772608275; l=5610;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=5/YxhynNP5OtTJz20C93GRmdTUgl+LzpEZyjUYK3nk0=; b=g4C1E6KH+LgB1Ro27j6zzmbqqjEt0rfvWsfWQ/nU8Ll9m8RXZ+bVYGYXZtTZsqJM38o68qQKF
 qwthj3ewpm9CV9/mpOuV+SY/T7pYtn9Qwt53b+SjJJ9dhqWgLIFErmy
X-Mailer: b4 0.14.3
Message-ID: <20260304-f-ncm-revert-v1-1-57c9157b58af@google.com>
Subject: [PATCH 1/6] Revert "usb: gadget: f_ncm: Fix atomic context locking issue"
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Heidelberg <david@ixit.cz>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 980C31FB67F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33938-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
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



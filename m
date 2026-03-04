Return-Path: <linux-usb+bounces-33939-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICfwIkjbp2kRkQAAu9opvQ
	(envelope-from <linux-usb+bounces-33939-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 08:12:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 131871FB68D
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 08:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6628E30B0795
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 07:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325A5361DA7;
	Wed,  4 Mar 2026 07:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GdVf0lcz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8125237F009
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 07:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772608283; cv=none; b=Q1BGNqyV8ujkVvwNJ2wg4P9ZJydD78r5NCrQMuKCMoRdtKXygn8ufWSEAS1oLpkIXZCf+2XikBFPvIoILxwDo9eBu746zJgDQYXkAqvKGKdnU5rZaw+b3Ol2TUVfhVPBnicShOQ+BnKZ6iJd97ry0jooO/8e8GYACuRkWi5/NGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772608283; c=relaxed/simple;
	bh=hrijtfqfOvg8LYhTu0Jxjjl8F1NDkkXHNxjFaW5iGQQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lnbCBFrgWks/pzdJTm+FZ7DdAC/h3Ge1slbnGTu/kJHX1aEK0937BHfk90XlvBxGsilhkRjJZqNCfgc3+RfKLi7GF2e890aIxa4UTkSxs/onXybdyr0gfYBs6204S4nenGkyRU1qYP77gTD5bv+YT793W9J4iuRH/fCVjnIAxPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GdVf0lcz; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-35984ef203bso3369856a91.3
        for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2026 23:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772608282; x=1773213082; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TwK794DdqJYSdG6zV72tobi0ALWgKSn0ri9Q6Cr47G8=;
        b=GdVf0lcz4ZXnQefK6pSzMPqvxcZKxDQKV8OO5YlhJAx3CgYr2y7sLa6YlxUJ4606co
         1wX9divv6nXK+avHSX+KNDE2A4TjMvYZB7lSyc8/wK4kyMhXU1g3OcAWKPk+q1gFNQde
         wvbkXMbjP8KysGl4Y9Yhrkf0nfuyWPZeDmiA8VcOwGlGPYdkrgiCIMkb+tHjqk50m5wO
         nthch9+LrFxMUiyx8zQTKaQCWtI/aHvW1CgzAE2g8KJSY901TgS3cieRshqsupSf2SRE
         /cxaVASh2ByMV986NXByIl2am5vnEj0Gow6Gng04edFOryHUXH0xhYyRG8PuEv67MfxL
         UM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772608282; x=1773213082;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TwK794DdqJYSdG6zV72tobi0ALWgKSn0ri9Q6Cr47G8=;
        b=ceJTZ6VvAGuXo/18ZBw2Ipiij4G3GB3cMYxBCZKLfC/rzDPoAa0vONL6YfjEWQ0NqX
         Ew0XY4szrTmN8r2yipakiJCKS+1+Aj4QDGHtsdyr7Jgrj+uGPoQH93Gxulz5uZYAvA6B
         t2eyMuwjW5KC9tLFjNPOhxrf+YyPIYEzrMHjrdaYNMIbtI0MnRZgqmFCP36nY3Xz6Gmw
         jFvq1FEWIdqHGdXK2CesLs7t6y27OQJbSIt577nkdEPTFgH7UaUpP7N4uBmMl/1rCx3I
         PGrg56IPu5lN9+iYoPp79SjLNI23cT5NdJu2k+1XU0eNGc7G/Z8rEcs2UTueLWA5EMve
         kdfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSWSZtnJcot0jydTibbCWBzTJE5G0LwYmkTUTPM3qPFfqWEj6cMSl3uSNAuFTMC/18hR19fbj8PyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhOvWfcKv2p+SiXPnFnEFuWIKddKJy0x2J9Z5rLjyT57Vaalx/
	cm7fwrXFgLvZLjpHfDca5gHfMp+YfrQPzhU66nxlNmmzzu6rtQYI4E8MwOzokFH3B4Hr7K7vLMv
	yLmU6Kw==
X-Received: from pjbkk5.prod.google.com ([2002:a17:90b:4a05:b0:359:8cf1:f842])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:248e:b0:359:8988:38d3
 with SMTP id 98e67ed59e1d1-359a69aaee9mr712744a91.7.1772608281833; Tue, 03
 Mar 2026 23:11:21 -0800 (PST)
Date: Wed, 04 Mar 2026 15:10:54 +0800
In-Reply-To: <20260304-f-ncm-revert-v1-0-57c9157b58af@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260304-f-ncm-revert-v1-0-57c9157b58af@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772608275; l=3085;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=hrijtfqfOvg8LYhTu0Jxjjl8F1NDkkXHNxjFaW5iGQQ=; b=I5serfzCRE4lgyQ1EMVkv67HSaRK+bPt792Rb5otlWT6cJjSx5JjNfYLAFShLPeiRtzyHXilt
 s3XXSojIHNlAEwWa4csBB6ACUZB9iztZ3jWwrROQxuSPG2/puNqORdm
X-Mailer: b4 0.14.3
Message-ID: <20260304-f-ncm-revert-v1-2-57c9157b58af@google.com>
Subject: [PATCH 2/6] Revert "usb: legacy: ncm: Fix NPE in gncm_bind"
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Heidelberg <david@ixit.cz>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 131871FB68D
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
	TAGGED_FROM(0.00)[bounces-33939-lists,linux-usb=lfdr.de];
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

This reverts commit fde0634ad9856b3943a2d1a8cc8de174a63ac840.

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
 drivers/usb/gadget/legacy/ncm.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/legacy/ncm.c b/drivers/usb/gadget/legacy/ncm.c
index e8d565534053..0f1b45e3abd1 100644
--- a/drivers/usb/gadget/legacy/ncm.c
+++ b/drivers/usb/gadget/legacy/ncm.c
@@ -15,10 +15,8 @@
 /* #define DEBUG */
 /* #define VERBOSE_DEBUG */
 
-#include <linux/hex.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/string.h>
 #include <linux/usb/composite.h>
 
 #include "u_ether.h"
@@ -131,7 +129,6 @@ static int gncm_bind(struct usb_composite_dev *cdev)
 	struct usb_gadget	*gadget = cdev->gadget;
 	struct f_ncm_opts	*ncm_opts;
 	int			status;
-	u8			mac[ETH_ALEN];
 
 	f_ncm_inst = usb_get_function_instance("ncm");
 	if (IS_ERR(f_ncm_inst))
@@ -139,15 +136,11 @@ static int gncm_bind(struct usb_composite_dev *cdev)
 
 	ncm_opts = container_of(f_ncm_inst, struct f_ncm_opts, func_inst);
 
-	ncm_opts->net_opts.qmult = qmult;
-	if (host_addr && mac_pton(host_addr, mac)) {
-		memcpy(&ncm_opts->net_opts.host_mac, mac, ETH_ALEN);
+	gether_set_qmult(ncm_opts->net, qmult);
+	if (!gether_set_host_addr(ncm_opts->net, host_addr))
 		pr_info("using host ethernet address: %s", host_addr);
-	}
-	if (dev_addr && mac_pton(dev_addr, mac)) {
-		memcpy(&ncm_opts->net_opts.dev_mac, mac, ETH_ALEN);
+	if (!gether_set_dev_addr(ncm_opts->net, dev_addr))
 		pr_info("using self ethernet address: %s", dev_addr);
-	}
 
 	/* Allocate string descriptor numbers ... note that string
 	 * contents can be overridden by the composite_dev glue.

-- 
2.53.0.473.g4a7958ca14-goog



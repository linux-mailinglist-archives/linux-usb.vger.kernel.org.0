Return-Path: <linux-usb+bounces-33360-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dC8CFrEdkGlwWQEAu9opvQ
	(envelope-from <linux-usb+bounces-33360-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Feb 2026 08:01:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B5B13B45B
	for <lists+linux-usb@lfdr.de>; Sat, 14 Feb 2026 08:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1684C30247D9
	for <lists+linux-usb@lfdr.de>; Sat, 14 Feb 2026 07:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500BD27FD43;
	Sat, 14 Feb 2026 07:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y4lrz9af"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DAD72627
	for <linux-usb@vger.kernel.org>; Sat, 14 Feb 2026 07:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771052458; cv=none; b=IEjvOLOcvrYKRqMut3QbZTAXlElC80I69liCyswnX6KNM5ekC9q3w1D9G11oXmWLr7D9LfQY51+uAir0H3+oKJ/7fYt8UCxnSLRDxSPUC6lRZ55TDoJx7wE3BKAKXLb4BnoH6oC7u04ZIjWRU7Hz4bqJWsrchKcgGe0zh+Vfb/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771052458; c=relaxed/simple;
	bh=AnbT0U37D83jSLu4Un+2F+/QkXprltoeWqgd9K5QuJk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=tuF676FTIkBs1GMqte3jQzhpNba6xq0bKMTBwh2IdL/WgdDNRt8XznxywtOaQkrxX0ciEy1g8NDTI5cYUw0TjBwdLPKbD//f0TBIZ28VsBRaN241+2hJCcroUvGdYpeeeM7QqoTalA2Wc4pmcToqjfI7GrEaCkTFJGROayPgfrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y4lrz9af; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2aad5fec175so53023095ad.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Feb 2026 23:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771052457; x=1771657257; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OC/cAc5yXN5JpYjUFx0KpLCrFKcXhoVWogme4uCdNzM=;
        b=y4lrz9af5xRl45/4fjAglGlp61YsbFb5lRnNwBGxAh6zRupPhuwGH5/ixlD1F9gVUJ
         +2Ms5x4K6695J+TIDijr+RA4LEoa/JjvNL1XSoqUrh5ubEy+OZ+dOVKpTcoEPVF3eHS4
         XGsB7f0o5oQ3hewWd0+hQIuzhhyYttnNV/lDo6xylCax5smvR/o9pqZQJfvlcHCU1yQt
         JmzqDh20SbDBvtXfLiuP3upwLcSfO/sQdY7ZM9eHChwhHEtf8DxGEwtVTH5HImBT90o/
         XuZolB1/f/3+MYJELhMQc4Oli2mSGMWWxbj1ZrdbkDzUk7NF3k1qbaPGEs2HqcGXGfw8
         MdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771052457; x=1771657257;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OC/cAc5yXN5JpYjUFx0KpLCrFKcXhoVWogme4uCdNzM=;
        b=NHLIuUW6Dezj8vJxSWLVTHw//IvnnF9iAEpSkODH772LsFtbxrgGt61t4P3iuNCTvN
         A+myvX+xx0JZyk3cleZHolZEYlJpeovRqqfU/4TEE1XA339+so23voTwkvklF2E9zjW8
         mBALs7mirbngEMWuXoigtaWw5I+lgbUHCoxHvZvSSr9QP92ezhZ/TfhEfbO8SZ8pcgj2
         5xi4405ze41QQFl/owXYwT10Yx680KXqwNLzUDjFsqKglJYPW1kIuC5YU9/I+hZi6VQt
         yeHIY30LtV4/hlx225WqStCWE0wrPKeygKgkj8mLIzRyDslPH2fzYRuEeHiB+vfqTH+n
         Yfvw==
X-Gm-Message-State: AOJu0Yy3O/Lmd/M5mzkhwT7iKGJwJxulXT4zvKb24MuqjjYOUr1GsGyU
	M+8PUfZX6KOKpdX60QCfeNg4oA9zLTlva2WTBuKUTOKcS8sHCbIVBhkEnf2I4y2uUjwQEcReqTM
	N2cZt+w==
X-Received: from plbmi8.prod.google.com ([2002:a17:902:fcc8:b0:29f:1bbb:de14])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19c5:b0:2a9:30d4:2b07
 with SMTP id d9443c01a7336-2ab5059ae3dmr45737075ad.32.1771052456782; Fri, 13
 Feb 2026 23:00:56 -0800 (PST)
Date: Sat, 14 Feb 2026 15:00:40 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJcdkGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0MT3ZzU9MTkSt285Fxdi2QDA0MjS9MkYxNjJaCGgqLUtMwKsGHRSkF uzkqxtbUACtTaTGEAAAA=
X-Change-Id: 20260214-legacy-ncm-8c001295b343
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771052455; l=4352;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=AnbT0U37D83jSLu4Un+2F+/QkXprltoeWqgd9K5QuJk=; b=3jt7gPvU+q6C4Zmo1wUqkp9chImkiK7dDJk8sAcoSdn6aBE7U3MKD6hzVwvyapVFksQbzXETk
 BTfuUtIvH/JAtfYWwOKb8nlWVxcFaF+k2G6GOGWi4Fhoclj8l/1SOJk
X-Mailer: b4 0.14.2
Message-ID: <20260214-legacy-ncm-v1-1-139c5bcc6636@google.com>
Subject: [PATCH RFC] usb: legacy: ncm: Fix potential NPE in gncm_bind
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33360-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khtsai@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A5B5B13B45B
X-Rspamd-Action: no action

Commit 56a512a9b410 ("usb: gadget: f_ncm: align net_device lifecycle
with bind/unbind") deferred the allocation of the net_device. This
change can lead to a NULL pointer dereference in the legacy NCM driver
as it attempts to access the net_device before it's fully initialized.

Store the provided qmult, host_addr, and dev_addr into the struct
ncm_opts->net_opts during gncm_bind(). These values will be properly
applied to the net_device when it is allocated and configured later in
the binding process by the NCM function driver.

Fixes: 56a512a9b410 ("usb: gadget: f_ncm: align net_device lifecycle with bind/unbind")
Cc: stable@kernel.org
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
Hi Greg,

I have been working on a series of changes to align the net_device
lifecycle with the bind/unbind process across various USB gadget 
function drivers. The goal is to solve the long-standing "lifetime
mismatch" problem where the network interface could outlive its parent
gadget device, leading to dangling symbolic links.

Recently, Commit 56a512a9b410 ("usb: gadget: f_ncm: align net_device
lifecycle with bind/unbind") was accepted to address this for the NCM
driver. However, during the process of adapting this same architecture
to f_subset, f_eem, f_ecm, and f_rndis, I discovered that this approach
regresses the legacy NCM driver (g_ncm).

Specifically, the legacy driver attempts to access the net_device during
its own binding process before the NCM function driver has been fully
bound. This can result in a NULL pointer dereference.

I am submitting the following patch as a fix for the g_ncm regression by
caching the configuration (qmult, host_addr, dev_addr) in opts_net until
the network device is ready. Please note that while I have verified the
logic and ensured the code builds, I do not have the physical hardware
required to perform a full functional test with the legacy g_ncm driver.

Beyond this specific fix, I would like to request the guidance on how to
proceed with the remaining network function drivers:

1. Deprecation: Can we consider the legacy drivers obsolete?  If so,
  we could prioritize the lifecycle fix for the configfs framework.

2. Compatibility: Should we continue to adapt the lifecycle concept to
  all drivers while strictly maintaining backward compatibility for 
  legacy function drivers?

I would appreciate your feedback on the preferred direction before I
proceed with the patchsets for the other USB function drivers.
---
 drivers/usb/gadget/legacy/ncm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/legacy/ncm.c b/drivers/usb/gadget/legacy/ncm.c
index 0f1b45e3abd1a1ead7b2776be10a2a5747960136..bf00f9d76a5323b298869b4210c5bf99b1ab7f9c 100644
--- a/drivers/usb/gadget/legacy/ncm.c
+++ b/drivers/usb/gadget/legacy/ncm.c
@@ -15,8 +15,10 @@
 /* #define DEBUG */
 /* #define VERBOSE_DEBUG */
 
+#include <linux/hex.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/string.h>
 #include <linux/usb/composite.h>
 
 #include "u_ether.h"
@@ -129,6 +131,7 @@ static int gncm_bind(struct usb_composite_dev *cdev)
 	struct usb_gadget	*gadget = cdev->gadget;
 	struct f_ncm_opts	*ncm_opts;
 	int			status;
+	u8			mac[ETH_ALEN];
 
 	f_ncm_inst = usb_get_function_instance("ncm");
 	if (IS_ERR(f_ncm_inst))
@@ -136,11 +139,15 @@ static int gncm_bind(struct usb_composite_dev *cdev)
 
 	ncm_opts = container_of(f_ncm_inst, struct f_ncm_opts, func_inst);
 
-	gether_set_qmult(ncm_opts->net, qmult);
-	if (!gether_set_host_addr(ncm_opts->net, host_addr))
+	ncm_opts->net_opts.qmult = qmult;
+	if (mac_pton(host_addr, mac)) {
+		memcpy(&ncm_opts->net_opts.host_mac, mac, ETH_ALEN);
 		pr_info("using host ethernet address: %s", host_addr);
-	if (!gether_set_dev_addr(ncm_opts->net, dev_addr))
+	}
+	if (mac_pton(dev_addr, mac)) {
+		memcpy(&ncm_opts->net_opts.dev_mac, mac, ETH_ALEN);
 		pr_info("using self ethernet address: %s", dev_addr);
+	}
 
 	/* Allocate string descriptor numbers ... note that string
 	 * contents can be overridden by the composite_dev glue.

---
base-commit: da87d45b195148d670ab995367d52aa9e8a9a1fa
change-id: 20260214-legacy-ncm-8c001295b343

Best regards,
-- 
Kuen-Han Tsai <khtsai@google.com>



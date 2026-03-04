Return-Path: <linux-usb+bounces-33941-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAoMF3nbp2kRkQAAu9opvQ
	(envelope-from <linux-usb+bounces-33941-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 08:12:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B77561FB6B4
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 08:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5C1330EC842
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 07:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8733C37B02B;
	Wed,  4 Mar 2026 07:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cQo5Hacn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E6337F8B2
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 07:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772608289; cv=none; b=VdO0DBTMCYolro0ZUBfJm3XBwK/fIjxFYZX4txgZ0S16MWlvILxIrlpFw3qEQ9m7DlBaIVu+rAtT6iIVy+ceO/Q3CvECoVOFgQ/PyTpKqcR3xQgMEwbAqiJeks8nquYBqTUz11qZDDbLx1XSIak2mwiEzGus1E+C1WeggUtrq3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772608289; c=relaxed/simple;
	bh=CGO0VfQC6nWNWzuPE6zNy8nqRc46IAy8DWObfpSsHuI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n+mkC8rONhhsBfOKVswceDm/zQvvH0gdXvpxZw4Q7/1rtfJxHup8ND7EX+xaMMGJdtMNFh3QE1HEJXbOH0wKy61cILoeNPrTNma585NJcSfvex4W7c87rV12WkzY49OH3YdlJps3TaDZE8o6k0qQlAPZ8s4FvB0sYG7EmbJgd4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cQo5Hacn; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82740488112so16128919b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2026 23:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772608286; x=1773213086; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QMXsEKlWRclFBEv0xYibqErY/p3FsrhNFarJ+RqhwzI=;
        b=cQo5Hacnt6ZzNcHOr8W9ZBhh8oDCcUQNYhWRaNTb/HGjIKTg2rOZkkeXUz0cgVMl/h
         VsCnkeuSof5esSqgqKBJNnC0GioUbsl6SMHJf53QFhF4v7zT2RCnAjQpqGaYsq2vSkPX
         MluvcskRc6U3CLhqDMv8jbjdAs5Luzsaq62iV39OjBmLDu/rTx4WV4VQBE2Hgm3mcfXZ
         D8KHAHrT51l6wXKPa2uJ5pnpDR7FUr6yhStj2DigvdB1Sp5sA6M99jEbjCFzpEJV/Q/h
         vQkGev4mUUGYHGuJQF4MFiPtHa4TSsN6CRmYFk1kSdtSgYCeN9qAUbbhwbldWSSfcJbg
         uZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772608286; x=1773213086;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMXsEKlWRclFBEv0xYibqErY/p3FsrhNFarJ+RqhwzI=;
        b=H5NXCgn5cNlzTiB8utnMklaz7wKKmiA0ZOSduTZoEE8S/7gRtPMx9fiylJ/cT2xvKy
         l8nLWeXFV9YaF6674Zw4t+0EQY4nkeijPh3ok27WEUo8cowZBxJfTJC5SzXQmdSCoZC6
         KveCjUiSuYKd7pEjxmonn8mXWrZky3QmR1eUrrWDsmHKqmmE+f8R+Ct62+N6SvNdXYko
         WLn7Ra5g19j9u/DczIo7CrL5X1eS3YnMNVFrgd3XGNRVvI4BHVkft+o+y1NyGsQuXFKO
         vjyWWzlXLC3XNrotsamkQXXmcBW2Poe+5XSGZKALrTEUGFxLlrPhymdXcDonG/u6IYei
         bTYA==
X-Forwarded-Encrypted: i=1; AJvYcCVYAOwRY1gurfgx7xLhv1BbC7B/IVC+MUODnJXNsC0AngcWRwc0FdRC2Ov/PsysKY1q0xlGWQbH7WM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJXWyvcVVCr73JWhcEdV+3pp+3uIO2rGbrNo2shJPOoxSiFlA8
	URId0DceD8Ky9Ly0+leNR/pqpuRR1ZA+nVMtaVMWCG4XU/wy2/Cs51ak1HLfHIrKrlelpiQGD3d
	yTfgNRg==
X-Received: from pfbeg26.prod.google.com ([2002:a05:6a00:801a:b0:827:1746:d143])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1407:b0:827:4372:dd15
 with SMTP id d2e1a72fcca58-82972c6bcf1mr1196817b3a.40.1772608285814; Tue, 03
 Mar 2026 23:11:25 -0800 (PST)
Date: Wed, 04 Mar 2026 15:10:56 +0800
In-Reply-To: <20260304-f-ncm-revert-v1-0-57c9157b58af@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260304-f-ncm-revert-v1-0-57c9157b58af@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772608275; l=3155;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=CGO0VfQC6nWNWzuPE6zNy8nqRc46IAy8DWObfpSsHuI=; b=jO1UL/EGG5ELG8XF3Gtcfb0vrHo+J0K8ptP+j/cvNWgHW/xcPSgC8Hl/GMAHxCoCuYDvQ/EtK
 xdszOmeBI9mAQbYLlmzCsMa/fZRPhKkoPMJbERjpLLHPenBePCS0ikm
X-Mailer: b4 0.14.3
Message-ID: <20260304-f-ncm-revert-v1-4-57c9157b58af@google.com>
Subject: [PATCH 4/6] Revert "usb: gadget: u_ether: Add auto-cleanup helper for
 freeing net_device"
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Heidelberg <david@ixit.cz>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: B77561FB6B4
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
	TAGGED_FROM(0.00)[bounces-33941-lists,linux-usb=lfdr.de];
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

This reverts commit 0c0981126b99288ed354d3d414c8a5fd42ac9e25.

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
 drivers/usb/gadget/function/u_ether.c | 15 ---------------
 drivers/usb/gadget/function/u_ether.h |  2 --
 2 files changed, 17 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 338f6e2a85a9..15685b2f8887 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -1126,21 +1126,6 @@ void gether_cleanup(struct eth_dev *dev)
 }
 EXPORT_SYMBOL_GPL(gether_cleanup);
 
-void gether_unregister_free_netdev(struct net_device *net)
-{
-	if (!net)
-		return;
-
-	struct eth_dev *dev = netdev_priv(net);
-
-	if (net->reg_state == NETREG_REGISTERED) {
-		unregister_netdev(net);
-		flush_work(&dev->work);
-	}
-	free_netdev(net);
-}
-EXPORT_SYMBOL_GPL(gether_unregister_free_netdev);
-
 /**
  * gether_connect - notify network layer that USB link is active
  * @link: the USB link, set up with endpoints, descriptors matching
diff --git a/drivers/usb/gadget/function/u_ether.h b/drivers/usb/gadget/function/u_ether.h
index a212a8ec5eb1..63a0240df4d7 100644
--- a/drivers/usb/gadget/function/u_ether.h
+++ b/drivers/usb/gadget/function/u_ether.h
@@ -283,8 +283,6 @@ int gether_get_ifname(struct net_device *net, char *name, int len);
 int gether_set_ifname(struct net_device *net, const char *name, int len);
 
 void gether_cleanup(struct eth_dev *dev);
-void gether_unregister_free_netdev(struct net_device *net);
-DEFINE_FREE(free_gether_netdev, struct net_device *, gether_unregister_free_netdev(_T));
 
 void gether_setup_opts_default(struct gether_opts *opts, const char *name);
 void gether_apply_opts(struct net_device *net, struct gether_opts *opts);

-- 
2.53.0.473.g4a7958ca14-goog



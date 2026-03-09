Return-Path: <linux-usb+bounces-34300-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HPPGcS3rmnMIAIAu9opvQ
	(envelope-from <linux-usb+bounces-34300-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 13:06:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D61DA2386C5
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 13:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6A14303A49A
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 12:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17C83A785D;
	Mon,  9 Mar 2026 12:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u4isXG5Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAEF3A7F7A
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 12:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057926; cv=none; b=UjQyeDOPFrIfD8hRs5Cnu7OOY52wIQGVLud4Sfx97ZBfJRGGbxGTHPlDhsqSSn9btw2/q6NASOtfPberxCFroxU3AXIMenQ2ysFK7Uu9P2o18IlToARGx5DXco9oHuownn1ov16liG3zRKR7fYrsd4+jo362fWKfv3o7S+5T25w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057926; c=relaxed/simple;
	bh=CGO0VfQC6nWNWzuPE6zNy8nqRc46IAy8DWObfpSsHuI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T7SK+XlIY+gOTAjHLNx53rp20qZY2WfMtuXAUAjehBa/IiIW8cQSl+9ZKtI9dcfmnx+47FLcP+iKZri4yC6YbQ4wvcf3tRcyLaTLipWLlGdtA1asjBYi2UUb6EVW+dCHzwZpiiGfXyneqBDQs/BCS9/Ny7T8vzN5bpCvemHrwgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u4isXG5Z; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ae467f128fso79963495ad.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 05:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773057924; x=1773662724; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QMXsEKlWRclFBEv0xYibqErY/p3FsrhNFarJ+RqhwzI=;
        b=u4isXG5Ze6QNNq4KCvsy+FSloKVpNVB/n8TUHRQZAbLcdt+6alphdR0+7TOqOhB0BQ
         0cn82h22dWUfcaWnzp3Ivn/CPGnHmUxffucpGq7KK5+gZzS0cplluFroTOD9q7z6E/f1
         cz4Qo9fohpWmPsupU589OLE28fFIZylaPu0X+qVfOV/ePJNp6MWVpzwZ/0deAbJQpnrS
         GPA/bweU30WOJMGlAJU5f+x/aoyOMRHb1KTjFjMcpZi9DSmiz5IB86fT2zFNh8mD8B4R
         iGfaVng066TiPMrjJAujqeTOMsjzJeryKgkqYKPYdx4o55rVT8tw8c7SfPV6/a2OkBuk
         JVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773057924; x=1773662724;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMXsEKlWRclFBEv0xYibqErY/p3FsrhNFarJ+RqhwzI=;
        b=pdkFhTb64p7K65pG6qmSyaup1W5j/FJGBx6ogdCx0Dqcn0rPt5x0wDLqCof+mxAZWd
         SHs90rVVZl20nQC0uWWEQlbOgrTDstMh80j8tOzP2MIYRffT8nTPd9XWrHuHrvZWu7OF
         WNvIXefPtP7czJ9XEUxl3E4phskfGVhBIq4kTn/TZ5WSQsx91pk+xDYWCWkgJYOiqJEi
         j3netF6oH+SUuz3nNh7BP3NnodDmEFW/YoUt8fk7KRe8zx3Q5cum63eRefqz2q6gOW4G
         V8MGaMqh79BNMzJKoBNUV/+W6XVmSQYKbnY557r3/jd0fgWMHAZVT6NycavHPEvaCS33
         DA5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhO64b4Bn5NxVzLhP97LI2fSZPMuyCBSOUgiywwqp6/V9MBTeb6M59mNSkoLiJsZyZtEY/jaVsh8w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx01KcEoOVOr7PR3QSP/2fb8UZN3mjhOezrInYxpW095uNemB/n
	HLM0rqowXtlJhYSLlwyeeV0Zm0NaEfHxI1+xC9oV+yBnG9x4UVhVF3j7SrmUWj31TTim6yrZOjf
	4aFii2w==
X-Received: from ploh7.prod.google.com ([2002:a17:902:f707:b0:2ae:69d3:5b9d])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f70f:b0:2ae:4409:5993
 with SMTP id d9443c01a7336-2ae82566029mr113712635ad.55.1773057923863; Mon, 09
 Mar 2026 05:05:23 -0700 (PDT)
Date: Mon, 09 Mar 2026 20:04:49 +0800
In-Reply-To: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773057914; l=3155;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=CGO0VfQC6nWNWzuPE6zNy8nqRc46IAy8DWObfpSsHuI=; b=/M9ZIevcQVfuTs7LJ/pfq4hvrqTG4FI4H71uy/WOxzWy2i1cI8s+nYuaWQf7oRmEINKFx0aDn
 Cbcx3+38AEODyn3K85GlNH10cLMepyezAH4S45tCesESKniS2fgXN1N
X-Mailer: b4 0.14.3
Message-ID: <20260309-f-ncm-revert-v2-4-ea2afbc7d9b2@google.com>
Subject: [PATCH v2 4/7] Revert "usb: gadget: u_ether: Add auto-cleanup helper
 for freeing net_device"
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Heidelberg <david@ixit.cz>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Jon Hunter <jonathanh@nvidia.com>, LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: D61DA2386C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34300-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.928];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ixit.cz:email]
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



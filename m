Return-Path: <linux-usb+bounces-33942-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PD/Nofbp2kRkQAAu9opvQ
	(envelope-from <linux-usb+bounces-33942-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 08:13:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A2B1FB6CA
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 08:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 516683001494
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 07:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388CE37F8C7;
	Wed,  4 Mar 2026 07:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="meu+fw15"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C7537EFFA
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 07:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772608289; cv=none; b=WqXqTQ1uTWf+c0pdYrKNfawHeyu6FrpEU7lfmbXsDNhen/EaZNDk7go6pBnOcFnzLoIVf2bs7nnJCaQZLsCR6E62641Rsx10Kh/53+d0KwuqKfqjlnOAaM+rBmjUy5pERfitfi7eA7lXQUaAWYStYw/Q3H2CqtBZgQLISivryIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772608289; c=relaxed/simple;
	bh=VjRaSPsUVE+x/Xi7XlDdoEy4TQXTYs9VwSowe6Il3dE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rdAZXLkrUbcUlBxnHZY3Y8jHoBUtcXg8iyj/6rp4H/06xiHwQxYlRfRAHyN0GyGCjWpGLwmBJvxnMflD7rZhRbqjhT2P/ynvLbwwUdkKMIOtIAvcg28TVqep+lzBNl6IEoCYAM6pqC88ps4haVA3oZ3b+U9v/qhR9NCEyJZOZsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=meu+fw15; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35979a03106so3883572a91.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2026 23:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772608288; x=1773213088; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ABqRA1fkx2Iasdc5RcVowDEiALyuzvn89TbSr3zsxLo=;
        b=meu+fw15IOUmVHUtGr/8FJtXmeWeDnXvLHLUNJVrGvhZFR5dQQUtkPIiBurTJDzJr1
         IT6t0lBF+BA2Tk626CCAfx8y6/p5T1sxRLch6UT+7q0jT9pTbP3sd6M+XRSaDBvgxcZt
         4E8dyiRVbDtN6VEro81UHXdttZD+Wk6icCtmCqgRyJp0iNTp2t/UnXvKAlgcq6/gk6u6
         h2qJk/f/8JdLz+o/aEydpIvizMFJwdE8IjTQk2q9EGEMJNcKyqGn/ZIVS59fJQXPEFKz
         DbBJXVTtR1bMQjulxct4IvxHO958emg6bsHBzBfxhrPiGUF0ZkV4APOsHPQjusL7X79y
         Wsqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772608288; x=1773213088;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABqRA1fkx2Iasdc5RcVowDEiALyuzvn89TbSr3zsxLo=;
        b=rtiFlr2L7TCIdYgYQ2Dtmbvk3wjzqUEej/qEz7TfcMF5GJ1PLWl72bwDxQ2zGt2ca5
         irv6ckoUmL442RfQr9z62LO+iMl0aOm/A+txtAtkn/I0No7ZsLObQxCpRiWPFl74hFAt
         IJUUzcN1xomMBplXFgJHH+UkRNfW8982GalNhXwn/uJdlS5L+GWpSULHxeERU5+GdjKx
         qrsk2gIyZDelZTjfPCmSKTMIUkqnpuag2/JqYXVhUzTlBRpKKThKoqPNgHfMabMXKQ0B
         k8QznMWoSaoi1QE3zlV1Us/l+RCTjgm1mWObHWOS2tmt4QrbVvix7lbrHsK2zmeQ+khH
         6BAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyjf/IXbR6ee2u0Eo7zgzPShhALry1QvqnULpW6lbcLR+GolUfFejNwtbloEE9+7ymI4vkD999qkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxzC7RG+LvplRjQOg0xaI5t6xscAly5f7mVLgbxrT4IdQm9IiW
	obk7PwTHG74ttPnY5OGPaqEE089HS3FHyYGGEtXG9kCdw5U613pxJuiyqSCiZy0SN5Y/jA94hvs
	7Ur1DFw==
X-Received: from pjbqb9.prod.google.com ([2002:a17:90b:2809:b0:34c:fbee:f264])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c08:b0:34e:63c1:4a08
 with SMTP id 98e67ed59e1d1-359a6a3d351mr1043777a91.20.1772608287803; Tue, 03
 Mar 2026 23:11:27 -0800 (PST)
Date: Wed, 04 Mar 2026 15:10:57 +0800
In-Reply-To: <20260304-f-ncm-revert-v1-0-57c9157b58af@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260304-f-ncm-revert-v1-0-57c9157b58af@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772608275; l=2006;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=VjRaSPsUVE+x/Xi7XlDdoEy4TQXTYs9VwSowe6Il3dE=; b=pJZFknIy24tS5KJDQEopYNQRXWsddLGd1VE5BBECEtLIwn1SKJ44tqLj+6ss2j5SPAszQK6T8
 SJ+c3gfepyHBP/VtLSU2xfqnWpAEYBoKKKjhOfYs4HaFIZG/+g3uam4
X-Mailer: b4 0.14.3
Message-ID: <20260304-f-ncm-revert-v1-5-57c9157b58af@google.com>
Subject: [PATCH 5/6] Revert "usb: gadget: u_ether: use <linux/hex.h> header file"
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Heidelberg <david@ixit.cz>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 22A2B1FB6CA
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
	TAGGED_FROM(0.00)[bounces-33942-lists,linux-usb=lfdr.de];
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

This reverts commit 7a7930c0f934fb0c46de6e7ca08e14e11df35dd6.

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
 drivers/usb/gadget/function/u_ether_configfs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_ether_configfs.h b/drivers/usb/gadget/function/u_ether_configfs.h
index 217990a266b2..39d3a261496d 100644
--- a/drivers/usb/gadget/function/u_ether_configfs.h
+++ b/drivers/usb/gadget/function/u_ether_configfs.h
@@ -14,7 +14,6 @@
 #define __U_ETHER_CONFIGFS_H
 
 #include <linux/cleanup.h>
-#include <linux/hex.h>
 #include <linux/if_ether.h>
 #include <linux/mutex.h>
 #include <linux/netdevice.h>

-- 
2.53.0.473.g4a7958ca14-goog



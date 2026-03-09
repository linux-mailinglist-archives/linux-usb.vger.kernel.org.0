Return-Path: <linux-usb+bounces-34301-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMQmFDm4rmlIIQIAu9opvQ
	(envelope-from <linux-usb+bounces-34301-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 13:08:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E884F238764
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 13:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46C233054319
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 12:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40813AE1A5;
	Mon,  9 Mar 2026 12:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mtlORqIy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A073A9D99
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 12:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057930; cv=none; b=A1dZarZiwd0U0lSR0vukp1pPKhM7wieD5TUcZr9SIApbexmlVJdNBqAPM2cmbkNK6SPHWO6rK51T08ee7R/FSqvnckrqh+Nzn/pbHpRvSlNiPWN7mugBRMlo5B71Iib6Us67/dHU6ux36D/1gKNS1kfP7iR8Gd7bA4p9+IsRYQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057930; c=relaxed/simple;
	bh=VjRaSPsUVE+x/Xi7XlDdoEy4TQXTYs9VwSowe6Il3dE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r0kVEFLmPjK4z3jJWBXlY/Tyqvdb5LsYZleOhkd2Fsi8VIif31w5zeCzJjW691G5hnhkEz7Tph1e30i0Xjucr9e/ar5R8Y10LRKnk2IEbJIe3gxlzqM99kmVPtSpoAqJ6d9FRTaxVkcb/x0GbXY60PFRxbjvZoEqD4hC8YtHkKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mtlORqIy; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-35641c14663so11867031a91.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 05:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773057926; x=1773662726; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ABqRA1fkx2Iasdc5RcVowDEiALyuzvn89TbSr3zsxLo=;
        b=mtlORqIydu3tyjgEfy7K++xJQi49Mg0jhI0yUW4yYgPtVCcS6hbx80qktKkOxVUtGz
         5VUUafIDUkCZWBtFyJvWRc2iRzuwQPiy74s+nckd1cr7mB4rdOlUOHAKNGIvEdRH86PQ
         siu8Ho3TDo9JacVYFdz3IsEY941gAA+gjha5L0rQdjpViZQOJOHk7K8QS2f0mQIkTioF
         Sq+ctyXRxwJmBQX9aFl8NzC5D4CvVMJAhXTJcfp/QH9qWbi/5OYhcxARYbTTtS6vaaue
         yNL5LTBbu3sfPuKG1+FQ7olKGwdWL+oGHSP8KEBbpDXT4aa1a5ILt2+Gej6hCecmeoJ3
         5oPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773057926; x=1773662726;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABqRA1fkx2Iasdc5RcVowDEiALyuzvn89TbSr3zsxLo=;
        b=bzMbdeImDLWspspdPnUMET86mTAYl+41JV0T+Qjo6J43lWM/cKvcFKjcLpIrjgtpff
         e0sGWbEmQ+SHN3UHNtT61uOpuwIG/zoqrPZqqu1o4ch3CYXSgzIIfRHCd9OVs3QaUBhd
         l/da4w2XKJjqSqsHjj+JRwD7c3GTYruTJjQiuhHT6jd9LdxKppMEoJHhoXNNWE9zaSO4
         /F6c/YA27YLo0ztmJScuWFfQ1upiwFgJi5UFBuPSSR6f+WBhkqBOZPrp79ZkUBZmAnGM
         APrn3WjZeidwx/mCLENS4SGCKuIJtcgm58ZOuWPrJOqNXtgDDVkBQpKuvzDCZDcYrSH5
         umJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw96S12f4d7FDw/OJtuADzIIXVzXiFhHyQlKAG6w0YskiPIKYPLroPplIy91oxbVDyFfSQrR0jcpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRxZr8lzGKH/ih2pJKEHuIG5NyX+0gWkQCGeibBLSKhNaJmr60
	N12ng1xYPg7cZMwT2wr/+hX3f6w5YmSm20Yj4DvaQyUN21cRbfpBwIYtOIkvjFeQ7AZZotve9RO
	YuHYjZA==
X-Received: from plbkh13.prod.google.com ([2002:a17:903:64d:b0:2ae:6338:73bd])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf08:b0:2ae:4e20:9d05
 with SMTP id d9443c01a7336-2ae824dd318mr105187195ad.35.1773057925753; Mon, 09
 Mar 2026 05:05:25 -0700 (PDT)
Date: Mon, 09 Mar 2026 20:04:50 +0800
In-Reply-To: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773057914; l=2006;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=VjRaSPsUVE+x/Xi7XlDdoEy4TQXTYs9VwSowe6Il3dE=; b=eZH/YwaVqvhmkVfOaxIxfPQzVR1AH6vNtrWh1DD/LMuzoOAP4fCC+EE+cDPDdFgPpbK2hPNjR
 QCyHGW32ZULCZsHrLKMD7bwqa3JUv1CqztgOwj6EU41N3fGkEFxdl8V
X-Mailer: b4 0.14.3
Message-ID: <20260309-f-ncm-revert-v2-5-ea2afbc7d9b2@google.com>
Subject: [PATCH v2 5/7] Revert "usb: gadget: u_ether: use <linux/hex.h> header file"
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Heidelberg <david@ixit.cz>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Jon Hunter <jonathanh@nvidia.com>, LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: E884F238764
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
	TAGGED_FROM(0.00)[bounces-34301-lists,linux-usb=lfdr.de];
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



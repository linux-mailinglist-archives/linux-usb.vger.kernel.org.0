Return-Path: <linux-usb+bounces-9736-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF78E8B1611
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 00:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FD8EB22A0B
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 22:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61F216C423;
	Wed, 24 Apr 2024 22:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TTqljTBu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A289D13AD0D
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 22:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713997247; cv=none; b=qj3IJKw7PCufjmMdWxgpSiynYM0r0rJw7hid3263fLS98efjnqcrxDHb+NALXkHvnub51LfPD93e4xX2yUqyxKl4TM0ULGNP1uYDeGRilchXbvIw0ERDdnrU9D8nHK2V9rLXT+g7X9cAiTJs3+kCPxfQgTUKKolylARTgLu6U9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713997247; c=relaxed/simple;
	bh=ebYqO7GXWSEDMoYvAZV1Mh/KGym33Q5KfBsiemCirWg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ijkmMv+eMk+R8l+vYx02mVJEMXk/wIZIhkRIC9YKCBHLLEczCXm6a687s5feN2Tp+INYfaRqLyBcy1Qf0M3fh3+t7eKf/4DLkntgAAjrvp9IvxH6cKIDBRVeTlyH8G2yqqHhf43lLcwtyv++msZF3w8AyZIb6vqMEE2+uTie3mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TTqljTBu; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-de5520c25f0so774106276.0
        for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 15:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713997244; x=1714602044; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yxmru3ZVzAAhEnel9IbClqgMoLU12bmNSmOWrzHiz+Q=;
        b=TTqljTBu+JQaF1ojMdJNZgejO1P9I3P9ZnVAU3n3NW9QY7U96oshfEDZ/9Nlql2KTb
         yZ2HjXUnLujyjU1amzXo7qaqrG4a8SvhN/OEan4qrJme47Nsu1O7eD0uH1+ldONVNyVw
         HMHrQ8VJBEKODLewtqQbjNwRcqkUeT2Ht3JwHLcjJw6nDJ+Ws6yl0eFN4GnIQZp3FuaJ
         hwzZZ/pzXbtFZZ53dI/BzcSTRHnYqzKAhwR9fIytZxT7EuokSU8W3X8tlqr8Jp4rxCl6
         lnEGc27tpa5b60Kquxw9edENGSXbcprZznRVVOVFyxXShtefeKXA4AgV74plYN2e2+Si
         WWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713997244; x=1714602044;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yxmru3ZVzAAhEnel9IbClqgMoLU12bmNSmOWrzHiz+Q=;
        b=uebsXHESPdlYeXOrjG+8jP5ZGa8b3X98LkwQf7NoKFySRiNChmVWslbrMPyWlyt5wU
         BSakJCDeEhVrdKm2PscldQMCS5Kc/gu/shjOZUegxk2x0DB6fNFTM2BL+Pxu8m62uEnT
         008Bf8V+AVxBIhPX165tR0U7HuGSlAYVmGIL9DK4pviS4bnVJW3KJr+BstwFPS6pwkWc
         3sOWotCH51XjGfvy7yrlxq/5ucqz5sntruzo1y6WWnEJ3ELHjG7nxL/HJEA6dVPN3f9Z
         ifYy18Q3OdMaStlHziBm9IJdbbQEsj6fVP7w7mWkG5TzYobiZWK1k1LSm8wNLSI+Rk86
         bCYw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ6JhiW2rp7c7HOUwGoOtLXUDuMnHZtKDSgUCWIexk/5yrE+JhVZLSXdUek2ja7nV43QtYbMYbDjVq/ZtvkIXgqkFKtUXdJFSW
X-Gm-Message-State: AOJu0YwLzytEFzTaeJ4MxEMdMXmhkVUXBzcLBb0nJtgiEMJWRCdZkjx+
	Nk0VlOon+mDRki+9GJwR4hsDVrG5zghSNJxBBmiybA25xIcjM0vSHyHa82kJLyaDCIpKpB9yosW
	y9w==
X-Google-Smtp-Source: AGHT+IHSugBrrG6XMw6EQmr4US6xbkxlgV0bs5M3BAIbsK4KlXdIL4FSWqUTZ4+tDfgz+kefXC1Nnaxoc/o=
X-Received: from amitsd-gti.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:827])
 (user=amitsd job=sendgmr) by 2002:a05:6902:701:b0:de4:64c4:d90c with SMTP id
 k1-20020a056902070100b00de464c4d90cmr397847ybt.12.1713997243709; Wed, 24 Apr
 2024 15:20:43 -0700 (PDT)
Date: Wed, 24 Apr 2024 15:20:36 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240424222040.1798922-1-amitsd@google.com>
Subject: [PATCH v1] usb: typec: tcpm: unregister existing source caps before re-registration
From: Amit Sunil Dhamne <amitsd@google.com>
To: badhri@google.com
Cc: rdbabiera@google.com, Amit Sunil Dhamne <amitsd@google.com>, linux-usb@vger.kernel.org, 
	stable@vger.kernel.org, kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Check and unregister existing source caps in tcpm_register_source_caps
function before registering new ones. This change fixes following
warning when port partner resends source caps after negotiating PD contract
for the purpose of re-negotiation.

[  343.135030][  T151] sysfs: cannot create duplicate filename '/devices/virtual/usb_power_delivery/pd1/source-capabilities'
[  343.135071][  T151] Call trace:
[  343.135076][  T151]  dump_backtrace+0xe8/0x108
[  343.135099][  T151]  show_stack+0x18/0x24
[  343.135106][  T151]  dump_stack_lvl+0x50/0x6c
[  343.135119][  T151]  dump_stack+0x18/0x24
[  343.135126][  T151]  sysfs_create_dir_ns+0xe0/0x140
[  343.135137][  T151]  kobject_add_internal+0x228/0x424
[  343.135146][  T151]  kobject_add+0x94/0x10c
[  343.135152][  T151]  device_add+0x1b0/0x4c0
[  343.135187][  T151]  device_register+0x20/0x34
[  343.135195][  T151]  usb_power_delivery_register_capabilities+0x90/0x20c
[  343.135209][  T151]  tcpm_pd_rx_handler+0x9f0/0x15b8
[  343.135216][  T151]  kthread_worker_fn+0x11c/0x260
[  343.135227][  T151]  kthread+0x114/0x1bc
[  343.135235][  T151]  ret_from_fork+0x10/0x20
[  343.135265][  T151] kobject: kobject_add_internal failed for source-capabilities with -EEXIST, don't try to register things with the same name in the same directory.

Fixes: 8203d26905ee ("usb: typec: tcpm: Register USB Power Delivery Capabilities")
Cc: linux-usb@vger.kernel.org
Cc: stable@vger.kernel.org
Cc: kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index ab6ed6111ed0..d8eb89f4f0c3 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2996,7 +2996,7 @@ static int tcpm_register_source_caps(struct tcpm_port *port)
 {
 	struct usb_power_delivery_desc desc = { port->negotiated_rev };
 	struct usb_power_delivery_capabilities_desc caps = { };
-	struct usb_power_delivery_capabilities *cap;
+	struct usb_power_delivery_capabilities *cap = port->partner_source_caps;
 
 	if (!port->partner_pd)
 		port->partner_pd = usb_power_delivery_register(NULL, &desc);
@@ -3006,6 +3006,9 @@ static int tcpm_register_source_caps(struct tcpm_port *port)
 	memcpy(caps.pdo, port->source_caps, sizeof(u32) * port->nr_source_caps);
 	caps.role = TYPEC_SOURCE;
 
+	if (cap)
+		usb_power_delivery_unregister_capabilities(cap);
+
 	cap = usb_power_delivery_register_capabilities(port->partner_pd, &caps);
 	if (IS_ERR(cap))
 		return PTR_ERR(cap);

base-commit: 0d31ea587709216d88183fe4ca0c8aba5e0205b8
-- 
2.44.0.769.g3c40516874-goog



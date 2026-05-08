Return-Path: <linux-usb+bounces-37135-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ2bKJX2/Wn5lAAAu9opvQ
	(envelope-from <linux-usb+bounces-37135-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 16:43:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 228C84F7F31
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 16:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C89830A85C3
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 14:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9551D3F54D2;
	Fri,  8 May 2026 14:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PgUcPMbh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864AD3F20E0
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 14:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778251144; cv=none; b=rDemIkDqNIPb9JEGQI+xeibBiWvZ1zkepxfoE1Inw7/6dHnu7gcTQQY97wyDh9H8MsleTJEc6J2XivzmHian/QttzVFX+aQn3bzlZb6ssFJAJVDZeZCs/UyTDfthnHagn/Gt+S9GE0Wp0CIpB3sG7DL2lsxj6KybZmjdvPSGGZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778251144; c=relaxed/simple;
	bh=T10SQhavWcGG/lNEtXVc25anuJk1a7moR7XrgnhDye0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UW5w/r9p8Xb7YtT9ap82Z73fEu9xNaCvCwi5CWobQRz+O2OhdZaWQRuCwXM+AZLlssSs7sBPBJ1OwiE9fujDKmen3Rt4bX2if9HiKwlEqhuqLElcG77TL9aIZsdRk4u826pYR42RzhNlbSh0f4POz5dig0sSovedrvrAjXRrkNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PgUcPMbh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488d2079582so23048395e9.2
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778251141; x=1778855941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uW2iRmBjQmuAIZiFC4eEW7XkRDLNs8lq/COhCGovlN0=;
        b=PgUcPMbhhj8LJ8Ivc5Tx6DboDjU08YprQlVelBlLGeXsLpLIG05yBBPruieNM/0E/H
         +oibNjS13f4oQZXp7BMJhMY5Z5XsV7pf7mwwNeR6M/ibAskj0J8RrCln/KshLXp0gxbm
         t7kgBPF12BCY+cArMXhlcfj0SqGb8Hfdxd9U6G2B0qsHwffzFPFnqyhtgANhKUNDJIBS
         nDXdHDuV+uakqcKpdSHDOa9iMP3OJOXlD9difXIdd2jZZ5k4xONFf6iwtuXweEICDx0I
         29F8VxMNlPjM5JHekjd466OD8cDdvZgCscBzK1NH2uma7/Pb6q5OLucXthvQX8TgwV5J
         wR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251141; x=1778855941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uW2iRmBjQmuAIZiFC4eEW7XkRDLNs8lq/COhCGovlN0=;
        b=fpfJhZqTpfqNSHcwx3+vqKa2IpzM9Pu6rNmZpup2IYb3SvM3tHP6i9ZueUhk708LOf
         kddCHY3xlQBM/iPoD9wm82tRWxUqVv8WiSPHs1eN18JHYOm0S2o2LCaWtMRnIWWvNnkF
         PMUpVu7lYVFil8bMU+WaLJ57QdEkOh77W4q76G1NkVJN93MwPtnureTcPg/WH/tlVyqb
         s4yQinI5WtBU58QctZkG+sHHT53XUnB878Rlvp2AKH/vHkwMEy9BVBpfUgmI9sGhXgVy
         AHmP7ZdVpIkUNHkR/FzXqicL5ZU96s/owBEW8RDyXEutIsK8SCpxWoUwx92Ec0lUSaJE
         EU1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+wOWgTgPIpkVvVgJ30YldTDmsEqJE6YaXMiKWwa2jPHrUyZhYqUkPMmb3ztWL4F662gJGb0rC0Bqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdkLFMUQBQ6MJk1elOcqxf5c8HC0zLi6P8WNgrmD8fkymAZEQ3
	j25i9MEpRYJvV9xnPjYoNwgN5cpMTxFdNaV1AxAWTmzwI/IlfZPx7maCHSGMh9W/7OnrTRwr5W2
	IcRZGMJE=
X-Gm-Gg: AeBDiesuom2+VbSFlH1gGr696i5QlomNzM7RsdtUIWDHQbddTRnfKh/Z1lUJ9l4FT41
	Y/Jsu6H2fG5VZ/Sp9pBZ62s56MB3a1SRhyvXYe3DQ4aaE0wKbHgtGaAjz/iBgMwdWcfmn/pGECU
	liiVgdZVTTeqnrFW/m1Wu3x79firZvu6sJMPlpvK2aIrJ15qiEQMxz5O4A6kD6yL0PqVW3asiZB
	OlbgoushCMret193RAB/YXwu2umJgJT5OCR06bmW0iws7h2vKGET4LzGyjjmAc2PV/w5Pppnstb
	gie4cTnY9nWZLpGdBjzNxbp7KG0u1f76dKdTFBQNaA4HnhuZBq0Zuh1x/0AMDJ0gfXUolnmw8kw
	zF3bolwFp8uj5jG7pt7kQCk/IFj0pnUt2xz5ZFtPX/ZwUak+OWJ9PZ2F+WiHoey0O70RFp6bwrS
	SXAbGizxt/g4rSOmBCuoDTqmWLz3FQaMywXM3lOXZCZeqbPxs=
X-Received: by 2002:a05:600c:35d2:b0:487:4eb:d125 with SMTP id 5b1f17b1804b1-48e51e15589mr216236425e9.9.1778251140846;
        Fri, 08 May 2026 07:39:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dc09678sm610135e9.0.2026.05.08.07.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 07:39:00 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [RFC PATCH v2] usb: typec: ucsi: Move long delayed work on system_dfl_long_wq
Date: Fri,  8 May 2026 16:38:53 +0200
Message-ID: <20260508143853.330151-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 228C84F7F31
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-37135-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim]
X-Rspamd-Action: no action

Currently the code enqueue work items using {queue|mod}_delayed_work(),
using system_long_wq. This workqueue should be used when long works are
expected and it is a per-cpu workqueue.

The function(s) end up calling __queue_delayed_work(), which set a global
timer that could fire anywhere, enqueuing the work where the timer fired.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Long work shouldn't stick to a single
CPU.

Recently, a new unbound workqueue specific for long running work has
been added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

Since the workqueue work doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change
system_long_wq with system_dfl_long_wq so that the work may benefit from
scheduler task placement.

Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
Changes in v2:
- Fixed a wrong change regarding system_long_wq used by queue_work() instead of queue_delayed_work()

Link to v1: https://lore.kernel.org/all/20260507142726.331206-1-marco.crivellari@suse.com/


 drivers/usb/typec/ucsi/ucsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5b7ad9e99cb9..20fb1fbc5a7a 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1985,7 +1985,7 @@ static void ucsi_init_work(struct work_struct *work)
 			return;
 		}
 
-		queue_delayed_work(system_long_wq, &ucsi->work,
+		queue_delayed_work(system_dfl_long_wq, &ucsi->work,
 				   UCSI_ROLE_SWITCH_INTERVAL);
 	}
 }
@@ -2109,7 +2109,7 @@ int ucsi_register(struct ucsi *ucsi)
 		UCSI_BCD_GET_MINOR(ucsi->version),
 		UCSI_BCD_GET_SUBMINOR(ucsi->version));
 
-	queue_delayed_work(system_long_wq, &ucsi->work, 0);
+	queue_delayed_work(system_dfl_long_wq, &ucsi->work, 0);
 
 	ucsi_debugfs_register(ucsi);
 	return 0;
-- 
2.53.0



Return-Path: <linux-usb+bounces-37088-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGLCJJOh/Gn2SAAAu9opvQ
	(envelope-from <linux-usb+bounces-37088-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 16:28:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAAE4EA2AA
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 16:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AB77303AF3B
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 14:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3653FB074;
	Thu,  7 May 2026 14:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FH2zI9I2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81CC363C5A
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164058; cv=none; b=jQ7XjPCvYmeDudzZ8IHKvaMcSi8jtr4+KlDNFYcgHouPd2fCLSJKnwnR6BBhyhs2tUD88lDa3btzLpQM9YxTDpliD/UyFuBdYKp+Rhzp+rWnZNg85VgIIqfvtNkeNgmmdkE5nei4DnXVwlWC7fUJJU8CBWoUxsgKflt/Ib26UH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164058; c=relaxed/simple;
	bh=kK5/eqAKskXLgUxGX//o6DmJtwnWfZhzhzL8kiMs058=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZNJZ7p7UaDyaxXMKpFYL6eh/n7TTrSPgpadAPAMoqfK/CIQNzcn52fqBpR+ew1ycRKhWW31SlgR4jon4rIYkFIL9IenOCfgWcJMXfmmeSEX4m3sE0DbAcK4CDDQNREk0nP5/FQfYR47QnJcQwxfe4Fflz/GCaiQQ2kYuEODw3W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FH2zI9I2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-453903ee4adso456264f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 07:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778164055; x=1778768855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssrhn9EPf35gFMhcF+CjH4mHClEML1PAb3aIpGxQ7uI=;
        b=FH2zI9I2phsXUi3z8u+les7krmG489h3nX2TSKE5/cmIBgkHQv0fLTDW9LbYwnJJmI
         KPq/jkosvx7LJxvwBNSH9pjlZ9ClntgBljqBwmpzuiCV0pm41agxv7VaMQ2XNhJil0Uu
         wDLknLYR4/4tZep36oipLD4lm0EXfSln48lTGfCYPg9+QqNzyHk9+/2fWg9srh2+2Vlq
         R8chSK1slnjMzTSlhdp0S/eIy2gerUCnqML70ipPOKJef9hRMITNNyLkhDpWr44Jl750
         Iqxa70LdVL3SD/JbenUF8wQi2yHqiwdcLE+Yk0HvP5s99eHQ0+tJVzAGkB/Y9BVubLCz
         wvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778164055; x=1778768855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssrhn9EPf35gFMhcF+CjH4mHClEML1PAb3aIpGxQ7uI=;
        b=ERxtJE9CLIMeu9IUNSAO6A//mjtQDc780a7qhFgUxRPnBDbStsiR8g18RwgrSAV22w
         i7PLCIdS9a2Nu3aVmwavpaeutL8i9abuHHdmdXe1P378w8jGDUnoRQlfJ+RYBAuegv4i
         hmkcSHO1MZUGoGFKYneqiiys5dGdQ2q7jpavYWBQAnkn2tifEKOcjzvggoV4BkrvOAMp
         k56glkSIYIBvrmKBrUF4i+XNUPDvrAuX0Nif2tdZ8MeD/oxgTdXpqJWXZgf3aIpjpCG3
         8dazVbKcYooHrJqVUeknEuvLDfCv7AwpQyZ4I9TkMHUH6umjsEztwx0PF38Qyf6GAxxu
         Fv+g==
X-Forwarded-Encrypted: i=1; AFNElJ+6MDFN4GnbHXnYHpLUulqAOQ6waYRrIrjFhmjzguKgh+JqJY2PSI6BxJ2DMX05R/lwC8ftIrYNFMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGmGXgWrGBA8jfrFIMJSUxTti4EqUdM5dcsLVo2UNBmu+Xx//q
	bUDwSd1mxjGV+ypD82m8iYCw3+pJlt2mRVGk7cmcmpnSie6jVzr7s9RY/zFH2Zi+1Bw=
X-Gm-Gg: AeBDieueQ/okbjhxv1ufqFh2YgtYN0OwR4yA0K+iLiVR+s41sAnRLKGpI/yE9JY0QhD
	XbIwV0FXDPYGsWx8iu4ODoAXZ/K37TghrvMq5dTrEEP4gj9W+ir/fHF0uXTvczS1fFsUY7BEj6d
	7A7IEs3qBevD1+a2SdbhKlV00oP6m8cLAYSguIhknVdUj7l9c/4oyCAOJErTNnD8mDZ9Ilz9ntQ
	kcUx9H3nWh5PgzlDxeFEDtjKsjvBBrOushQzaaf6lH2AvUAQYTpr2mUMtRwCcB+tQgFTnvMZYBw
	CpAU7+XfYeKy6WuqlmGxRE7FIJ5ebpgI9FLV6/sLULCgxeOgGzjP3hL5HNlxIXSZX96mzNiHb/d
	VYS1x0+3lih8BOnEaqMzP+GPXEw2rl3uUtNsOpmCsgaQ28bidovGvjZ8cxfDqoKCE0PruqMFAQH
	BFPmCpr8toZ80eNbuGUUvncoPPPzvN1k+fANcELvKhK5gTop/vtxv3hY+to213JYoGyRq8
X-Received: by 2002:a05:6000:2310:b0:43d:773d:7908 with SMTP id ffacd0b85a97d-4515d3dc438mr13491746f8f.32.1778164054933;
        Thu, 07 May 2026 07:27:34 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03d4csm21268234f8f.22.2026.05.07.07.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:27:34 -0700 (PDT)
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
Subject: [RFC PATCH] usb: typec: ucsi: Move long delayed work on system_dfl_long_wq
Date: Thu,  7 May 2026 16:27:26 +0200
Message-ID: <20260507142726.331206-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0AAAE4EA2AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-37088-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
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
 drivers/usb/typec/ucsi/ucsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5b7ad9e99cb9..2a0bfec3e43f 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1965,7 +1965,7 @@ static void ucsi_resume_work(struct work_struct *work)
 int ucsi_resume(struct ucsi *ucsi)
 {
 	if (ucsi->connector)
-		queue_work(system_long_wq, &ucsi->resume_work);
+		queue_work(system_dfl_long_wq, &ucsi->resume_work);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ucsi_resume);
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



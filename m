Return-Path: <linux-usb+bounces-38002-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INaJFvr+E2quIQcAu9opvQ
	(envelope-from <linux-usb+bounces-38002-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 09:49:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1E15C743A
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 09:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 604FE30157D2
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 07:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCAF3D413F;
	Mon, 25 May 2026 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="U22LdwxA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427303A7F4D
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 07:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779695350; cv=none; b=X9whQI9SFZxTVGEm8XL6oRtIUEn8qZNI8O3hHKO5RMwBBuFHESgdekZG7t1PJdTnmxmHcnPocR4+HSrBRbmAEWTTxRuPRttzjUrrIh1iLUYblkbvUMmbytaxmtDfMAyNqwpDvBnTguuyNWLUgwcWQZBRJqrvsVvxIVB912GXroQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779695350; c=relaxed/simple;
	bh=XB4lqGI4TSEKr7HutwRFVw+O4V68/BzJkILYBSzPNW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sv0xG+Q4cL4qdu0/Qewry7QtH9jfsF4MI7TrVRJ9Y/3M4t0cGE49TPcX2VvGUMsetwjlRnaFzq0XimmdTaxSPWZF1o+LsV0CkV+gvv1hGjxWFtdzlIY5dBbHK4zp8QokGt5SFlWjcpDc7CKidfl8cQkN+v+JUr4DLmZ+FFTX51A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=U22LdwxA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so25656325e9.2
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 00:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779695345; x=1780300145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rBc62St65Dxp5xby2IpAADwN9N0qAgn4Yir0PPkerBE=;
        b=U22LdwxAKxJVv94f5JZt/EDTQZSqkGq8zKgLxvJgmeMRjjxhVdy6PW28UmhNmhlTMi
         02yfPA3fevh/4B9lu1/Qn7uk2FsUZns3l3JpPXdnvrlUSTKHqg9eXn8SmEed13uVYeyt
         1Pxigc4QPurnk8M5Km1LNlXAhtkEbUq+KjyEMU8Bilr8DPgP0DHgeAX5eR9Vo0siGfsd
         w53xwEvY86ctHftfC/TSs6DB+L1RaJ8/Pco8hiVMkh5I6gdSL9gRqSheKjbc0QDs72pH
         6xg8WSUNnK4Gr8VR6fu+mfBJxFKoZyf4GsF5yO99VKiQYzR0A9wxWwzyOadysCwNf8Y7
         MwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779695345; x=1780300145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBc62St65Dxp5xby2IpAADwN9N0qAgn4Yir0PPkerBE=;
        b=LF0KWGTp8fuvbgbkn68cRUQ743NhzcQY24Kn395xrAeekpZmyozjxPbgInezlm+M9e
         KpF/OSHi0+UOIldbuxifw/jKbpEe8GD3eWaVTAFY2ZP8evPMht88bKbutY0YcHX03T3Q
         Jk9hhLrKpd8SpPSOxMXRN3FxN6q0AnbRq+FzvXSCOvzqMVhQlxI6qiRLbk6IFR322gED
         HP5nYyq+IlGx2DrrwWCSxKTeZ7xalw2pMppaptTio2Gk4EuwOk74pi7Hxn3zdmRkOyHD
         8WT/Ss3Tz1FGu22qvcduTCTPpAbHYvOD9g48/DmOu/BXjojzJttxU4qihhwJ5KU79DXo
         U3fQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nEQ+/alsgciPjM/+ldrGO/XJ6wu902bzYI1PnEOtPfvQMQeWujTZIUrZJ6al/TX6KwptGc9JPAnE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv94TSlRuonli05kl+MXhW3HA0dHqoOPI0Jvuk+axSYSoxqf+1
	CkeYrXTIB2GximWcGmAW1vkI9sq3bFBzGKv/t/cBGPchWk+sVRf1BQGWpFJbW981tyo=
X-Gm-Gg: Acq92OH+zQ+SReNvptkd2N4UDKJlq2/V3vAQE2E6YPmSwzvBtGfK/eTHSy/9j/UQ1Yt
	nDrAD6MDiNo+NxlfCNuQtC6Y3zR5cG3BUFyZK8ujjj8remppB4g2to/q3Kbv+FWZiaDVW/Dmhn9
	0dhxQNgZhZ7ykLY1jESUziP90Fv00nLclagCy6bCYy+UNr9wI8WAPzwDkrxpBcaxSOpCpRnwNnd
	J9MViW/S1N1YL9TBSaPypdlMGVM0nb/4O51W8PN57bQjpqiGWbUltT3CcTvymnpZoFs3HOK3ay3
	zGtWl3VTkY8/J4u1yJ7NkBhAsGKtFFYvwGM3GXca7fYTM4JbB1DeT4OFyXwESE1KuJsI+3ORF9d
	fbaiJ4bfKS4N9VBo1dT8yNnhbIZVbD5RV5qQT+EuRO4TzpAClqDs7leFE8ut/CHBHSpfApvMkZM
	1drKTXxH8CVU+/PVrFb/FgaJv/KrH1zr8/laavsY59Eeuqxw1AM5Gyl/yTqg==
X-Received: by 2002:a05:600c:5298:b0:490:778:4fec with SMTP id 5b1f17b1804b1-490428e02d3mr224369285e9.33.1779695345627;
        Mon, 25 May 2026 00:49:05 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm227032725e9.3.2026.05.25.00.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 00:49:05 -0700 (PDT)
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
Subject: [PATCH v3] usb: typec: ucsi: Move long delayed work on system_dfl_long_wq
Date: Mon, 25 May 2026 09:48:57 +0200
Message-ID: <20260525074857.30816-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-38002-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CF1E15C743A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes in v3:
- Removed RFC prefix from patch subject

Link to v2: https://lore.kernel.org/all/20260508143853.330151-1-marco.crivellari@suse.com/

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
2.54.0



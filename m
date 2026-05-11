Return-Path: <linux-usb+bounces-37236-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GaoGialAWpKhAEAu9opvQ
	(envelope-from <linux-usb+bounces-37236-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 11:45:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA90B50B33A
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 11:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 032E431431DD
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589113C5DBF;
	Mon, 11 May 2026 09:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f++Qg5V0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D123C1984
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491745; cv=none; b=QjI6GSZryoezzwGL56EROZZ3xTip5907+BhpNy5D+cQLI2EMwtRPgGC8AWw0t9Hh40kaT6kFatrXazYeysWt8Hhwf8Lds/B7550g6UsVhdPtYu/1a600KuN1W49sx3kz2TiRpPi+eeEGA0djSQeAHWfRdHr79/5tYKRdGr5n448=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491745; c=relaxed/simple;
	bh=U1Qm+KKl/AIGh2iSPba1dZ6yy/KwN/3PNFvd/VeLMtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A2pvtFMg1kDuW9Tgpe62y41PhzOh9dCyRd8qLs4uaHIrbMqJ+i3LWCSYO1sgI7e+ognhkNVpJOb/wtCjeYKgkMWM/aOtHHkYAa89ia86hOBeuXHd8PFrLYJ0B40IkjBis4hwaW5My5yQ0LJtlZSsFj1KbmsifdPyy+cFAYxq+jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f++Qg5V0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0046078so33686985e9.1
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 02:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778491742; x=1779096542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WV7rblNQ4jpJXwaDYZZ+KkXDw9KuCi4SHEk0BK4A9w4=;
        b=f++Qg5V0Wa1M9jxmceTSJGnCMQCwiMTXauhhz3REkASP1M7pHZnUf1lpED40lrVUDz
         vfbVbY0YIGxYHj1ojW3Mdrn4fJ49BkYjFt4MPyP7R+pwnTl3KXYOUjs/YzHL3gaaJq3D
         3WVAEJxUGTFLtGs3ZR8EU3kAMuw7BRJRHptjH+F43AEIXMDj+asejKAYDzOUxScBlHSy
         RzL3uelkk9oOVx93cK8A1ljtwJv7keIhBwfXpADRgI5earenD4wg4/3CYqSGXxCDGaeh
         cP90k9zTI86DliGWT+NMSrpLk9RR96ewWLwWqDMsq1XwtJ27PqJSnOzzSD4IfdEMImsC
         axWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491742; x=1779096542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WV7rblNQ4jpJXwaDYZZ+KkXDw9KuCi4SHEk0BK4A9w4=;
        b=lRJBr9ww9LFdHbPtvQSnh/BjdXwG+1bFW9dcNB6KDVqi0i0CWMwEez5Bw3Finm3pco
         11gnvWYS4NesNLr8drdwyA9f9O0l49eclXcQCFUs/Gjv+DWm2v9IlSyyRRQSZo5DnbBd
         1i/cObZrdpCsovSA5vUjewZSJ5a5iks580oEXQoJA25MRZp0G9jv8UN9jAXIznq7qLQH
         cnZwDpKFAJeIkuI9ybk2KjOmmShhWyCLyaJV4iaaIGukgtvbIwF+xaUI3bpxJai/43Ez
         eHRQ5p8da9unqO3mS6qE5vJYFtZBAA4/HHh+4ssobbMO5HyckOGH+rYkfM/So8DxId44
         CuDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/XvYs7tP+64v0MPFxui4w9vcISrlKYz3qtX4UUStuZ9FbGyLiQdcdYLpNG6+TpwVEBELiyk4glnG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfNhd/rhvH+nAe4QWHCnALX5L8JoZ7cjWm7hFxft9oC74/tzgY
	+CMpdlSHCGlX4HCHOcUTYCHg3oSJ+Ub9Vgfgkcr6dHbfOG+GFrg8xrIbmsXbJlqVal4=
X-Gm-Gg: Acq92OG8QpwrRyJot3uUc38uZ3HKb37xPGOIntZuNdwm5p1k9BAAT6yqsWfTcuODcck
	FuaQRsB4afQHIQJV3XdhxVsRwLsWtGoM3gLRRUbl/Aya3HURYeqlrsJwD8RwokUPHi0Mue71Fhq
	jlyvzYfy8Km6LuK2mOyzHlM5ETPF0e9t0JgWC3rx22Sxt7/2V740cznzIqzy3O32vMO90chAECJ
	89CK/gw7YFAApMzMmjAYSx+9hcqyybjIY2/ojp1m7YyppHgV06MSQwqbNa3NvofoRfzIavgYLzi
	DG81FdJIuPdlxAR3ZxUjVhKWbkwZkMLvT35/GKUVMrfuNMXIIq/EQkAENk05BamKXXNMSC6TYPg
	JyuakTPJoqQEcGRorgDsMddqUEPLhCS0virDU/9CxIn9HONSWaxhMlLbyfFbVDM79rcABsGIyTb
	zxQybqH6p+8Iqk0fGN6wDK49J5ye5G6lmMbMyb4/ltDr+8WBQ=
X-Received: by 2002:a05:600c:c11c:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48e706e0168mr96108715e9.26.1778491741993;
        Mon, 11 May 2026 02:29:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e89fbsm157606675e9.4.2026.05.11.02.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:29:01 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	linux-usb@vger.kernel.org
Subject: [RFC PATCH net-next 5/5] r8152: Move long delayed work on system_dfl_long_wq
Date: Mon, 11 May 2026 11:28:40 +0200
Message-ID: <20260511092846.120141-6-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511092846.120141-1-marco.crivellari@suse.com>
References: <20260511092846.120141-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BA90B50B33A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37236-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim]
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

Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/net/usb/r8152.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 1ace1d2398c9..16c521e3fe0a 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -7050,7 +7050,8 @@ static void rtl_hw_phy_work_func_t(struct work_struct *work)
 
 		/* Delay execution in case request_firmware() is not ready yet.
 		 */
-		queue_delayed_work(system_long_wq, &tp->hw_phy_work, HZ * 10);
+		queue_delayed_work(system_dfl_long_wq, &tp->hw_phy_work,
+				   HZ * 10);
 		goto ignore_once;
 	}
 
@@ -8620,7 +8621,7 @@ static int rtl8152_reset_resume(struct usb_interface *intf)
 	clear_bit(SELECTIVE_SUSPEND, &tp->flags);
 	rtl_reset_ocp_base(tp);
 	tp->rtl_ops.init(tp);
-	queue_delayed_work(system_long_wq, &tp->hw_phy_work, 0);
+	queue_delayed_work(system_dfl_long_wq, &tp->hw_phy_work, 0);
 	set_ethernet_addr(tp, true);
 	return rtl8152_resume(intf);
 }
@@ -10001,7 +10002,7 @@ static int rtl8152_probe_once(struct usb_interface *intf,
 	/* Retry in case request_firmware() is not ready yet. */
 	tp->rtl_fw.retry = true;
 #endif
-	queue_delayed_work(system_long_wq, &tp->hw_phy_work, 0);
+	queue_delayed_work(system_dfl_long_wq, &tp->hw_phy_work, 0);
 	set_ethernet_addr(tp, false);
 
 	usb_set_intfdata(intf, tp);
-- 
2.54.0



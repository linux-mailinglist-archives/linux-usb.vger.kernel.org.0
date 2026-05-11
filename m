Return-Path: <linux-usb+bounces-37235-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NbXFrKhAWpKgwEAu9opvQ
	(envelope-from <linux-usb+bounces-37235-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 11:30:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF5A50AE90
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 11:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C33D300C012
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7BD3C0639;
	Mon, 11 May 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="caFPe0Xu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E223BFE3E
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 09:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491744; cv=none; b=a6rAtLiO5Gi/dWdWaKuIUEH1DSIO56T+XQY72lpqaHZldPS8747gIAz5Vdm6Pj0SAHnpoVttA84rPvg48rGJ4WyixOf36D8M9PXUEPZOpg9JJemrtPb1DsJETuJGvepbeIT5GnBBzClqofpZKFKoRcg25sJXPGChCe+VNS7SMA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491744; c=relaxed/simple;
	bh=WFctueSO0c8kiOMz97Igcd0GbiVV9wZ/sS8JPym8NT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PU5+KKKABOA3MUFl793RTNTG6L6M2p1Mz9390+3M2rFJqUICpAR7uub9KzTXJzb3Ym/RUJ6et91LUyKJaqgaIDC+LTotDGj2se/wgQbpW/Ko2EKR7cmcJOHbByV+shiiP6GLQUt9re2BbsqW+wyW1btqfZ24/CdNmS0s/Drf568=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=caFPe0Xu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso48616005e9.1
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 02:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778491741; x=1779096541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTpT11VVpBsvTrfwwuWJXCtXwtjRJjFk6SsZKCsLecw=;
        b=caFPe0XuGA2SSoIQSE8FYKAKHc1C/WLq6nfsXyMjoG5NpiSNQ8ALcyLcTDe6FoAh/G
         3L+L3m8mToGZ8Bv6u4Pg+cRZsBqSf+3haFEOKBp3+jWcWxOy7RbnVxoLYxvQ9pgFxOy7
         PcWmBMOXkSZfkPHbDTNWxYa7UjyntWlDlVu2iC53h/0xZM0Xdbud+sdSy2zphk6T+1KW
         uL8cwvNKDZ1iWUVtOVQx4ozOgt/pfasyiRLQdkzI413QMZH3ZL37I0rOHzQb2zC4j3SP
         845tXjfLU2JuSovV8vbqx2K9x3Vdk+RiLJvY/UEut8VNUikAMMaq6M3xIanUEFnxq1as
         gpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491741; x=1779096541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TTpT11VVpBsvTrfwwuWJXCtXwtjRJjFk6SsZKCsLecw=;
        b=jMBmsPO/ecMKvqnZ3OjtSmCXkatbiRpAGWDpiif2DVHVJTWYPOva4bFrQkHR3mw/j+
         s5eKNmNmNInWxyRVHDjAug0FA5GAIlfpLFrJRC9x8rirkwtbNk6CWtaj/IzjMNQxLp4E
         4QwmK64TWeB+D/7kZ0ayh073dzLm7YJpX39ZcDLlyxdTTGBVw1JfLRq2Y/LBMJWGmr6k
         +eKsWQD7Nc8na0JGUfP/WKKGhQbu7GTkUmoMUwpaYCNF92lOn9v7OY6gDLcVHhQuezV+
         5f3C94DymZ3GxSwjpfZG8zdv1Y1MRNR6c5vcd8iPXJmez7TlYVsyPs8dmSY8s9HDRAl0
         IQAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5LOKjySc9d0TD02nhZ/S6ujN1qveg7sZ/J6CZgvCdevYutzKEpGe5aMT009RrEkHffPjYLdUCQgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzflxKQ4aGJJw349Kv1mQ/nokfY5jl+yRJv79IlCHLcu+vhtVrH
	wvw/AvcO3hU3U6gVEOctPQocQRoFXkiSlTCZ+fPx9oI+MxhJmbAVuNuaFH05MF/6Hzg=
X-Gm-Gg: Acq92OGpnsAr6q3SruOL4spkYOEhu6oG/nwY7HS25Zp00cZkwD4QO1u9hiHEXqZl1C/
	NUW73nWa1KJRsRfOCpH7vZMk28W2qzL+QmnrkZ5beSTPPzERR7qxncJMVpUl9QsqohNxJ4a2Suz
	RIg05DfJ1m3BNVc3VSinUDxUAmZx43nRUrxKIXNx8rv6PP9ggjm205vycKXS30jNNqEMXX3qyai
	QN1uzBKAOeQfFLGo3r5S6T2hY4cBROecS4RGlv/QUGCAmmAilH7KtIpwgpDN2IhbfNTQWyAYj99
	JZkk/HC2LdzwnnkH79NWC7sf0XGYOK4fLoEDrxW87Ftc02hkAaMZbXiUjLdBrUpfEUSMY+BLizf
	SKtQweTut8j42/AUTabj4e4dfJ/aGXGzKD0qyDFgW/B1RliSmkrcCFjIN+iguVlAVsd/7qKp6b2
	o6dzffSiOdb3yzpR43m1q8X+71qhL8YUJVsO6D44po9E37qdBzPVQyFnWRMw==
X-Received: by 2002:a05:600c:8710:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48e6d79b006mr168469675e9.8.1778491740918;
        Mon, 11 May 2026 02:29:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e89fbsm157606675e9.4.2026.05.11.02.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:29:00 -0700 (PDT)
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
	Petko Manolov <petkan@nucleusys.com>,
	linux-usb@vger.kernel.org
Subject: [RFC PATCH net-next 4/5] net: usb: pegasus: Move long delayed work on system_dfl_long_wq
Date: Mon, 11 May 2026 11:28:39 +0200
Message-ID: <20260511092846.120141-5-marco.crivellari@suse.com>
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
X-Rspamd-Queue-Id: 1AF5A50AE90
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,lunn.ch,davemloft.net,google.com,redhat.com,nucleusys.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37235-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim,carrier_check.work:url]
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

Cc: Petko Manolov <petkan@nucleusys.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/net/usb/pegasus.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index db85f40734d7..f26bf54e606c 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -1126,8 +1126,9 @@ static void check_carrier(struct work_struct *work)
 	pegasus_t *pegasus = container_of(work, pegasus_t, carrier_check.work);
 	set_carrier(pegasus->net);
 	if (!(pegasus->flags & PEGASUS_UNPLUG)) {
-		queue_delayed_work(system_long_wq, &pegasus->carrier_check,
-			CARRIER_CHECK_DELAY);
+		queue_delayed_work(system_dfl_long_wq,
+				   &pegasus->carrier_check,
+				   CARRIER_CHECK_DELAY);
 	}
 }
 
@@ -1232,7 +1233,7 @@ static int pegasus_probe(struct usb_interface *intf,
 	res = register_netdev(net);
 	if (res)
 		goto out3;
-	queue_delayed_work(system_long_wq, &pegasus->carrier_check,
+	queue_delayed_work(system_dfl_long_wq, &pegasus->carrier_check,
 			   CARRIER_CHECK_DELAY);
 	dev_info(&intf->dev, "%s, %s, %pM\n", net->name,
 		 usb_dev_id[dev_index].name, net->dev_addr);
@@ -1297,7 +1298,7 @@ static int pegasus_resume(struct usb_interface *intf)
 		pegasus->intr_urb->actual_length = 0;
 		intr_callback(pegasus->intr_urb);
 	}
-	queue_delayed_work(system_long_wq, &pegasus->carrier_check,
+	queue_delayed_work(system_dfl_long_wq, &pegasus->carrier_check,
 				CARRIER_CHECK_DELAY);
 	return 0;
 }
-- 
2.54.0



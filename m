Return-Path: <linux-usb+bounces-30206-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CD92CC40A44
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 16:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C32EC4F0ECF
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 15:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C00328602;
	Fri,  7 Nov 2025 15:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="I0ZDTvDd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4C432BF41
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762530169; cv=none; b=gAMv3CjdcDES7lC+7HuyRwVkEMxXpOhrrJTabo+6EGp0634TMDfyNycP7FPM3KaP1fuu/bETOqTnW+2yD4Xr9fhOHIpwVF+QJL9aObVxPVDGyeSqD/JpFxwsKeOVnPu5zdaiCG/zKN+jMA70Hm94dZmycZNGwZ0TZWg0fCqw4bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762530169; c=relaxed/simple;
	bh=FllVlbWS4MtLkyQNg1oOoXS8Gv/IymNyRvTVHqi2Ks4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LBhXYSaHrT4dqBv/C5scUMh8S3ZPu64825XGLkQMX1pIIYup3mMhwo/SraCqrvbhr6tMzSz7YcMfEkzZmbYb1OEe9wXq2vlyiA7OnUIoqNyqT0crOuRn1WuKXwjIdswcEFQfp4XiBOs66a0AR3PeQcjhmT7BdVemISxu7URghTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=I0ZDTvDd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so633379f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Nov 2025 07:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762530166; x=1763134966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EEllDksTQmdd3u8PyFwFKXQ1ssazmQ/lfWRUKOA18nI=;
        b=I0ZDTvDdZasUnpUiGcBtTCkw79yxoN3lP8jisbYQfWrYhOBDmOe/+DqiwXEnCjT/Fr
         Ywj9Goc3m1tMGbX4CVGUqlPGakpxl/HCS/j48ZgWsMLSwmytZadPTVXS5sVlUpIpF1oU
         hSLaPwvoea5DKYZ8sAo6rhB7DqsVkekaLWkDYR2wmanaG0RcsnADWO6IpBGnFpAr6kLJ
         1x1+/4Cj1OxmgOCxkPA5vJX7OlGY2xrHDWHzcKfX2RLk9yjr03eFVqF0m0ZHm+nwa3Si
         L7ovxpYUW5Lc5BnUrxWNxLr4STTrrk7YkDtVCShjcFG/XzS6aCWpyd80dvr/SeYpB9Gc
         HqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762530166; x=1763134966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEllDksTQmdd3u8PyFwFKXQ1ssazmQ/lfWRUKOA18nI=;
        b=aOeXPJTfr4GNfQaSjOaH6JJ527tYGjcLWSXfhWeQgIdhQoBNrZJRiPrqOs05+jsJhW
         sx9laHG/iLdIcDEVSBHyzQq1ajTDXPgpTLLhjd1XhjioAfwmBLRHo4/NK8cp8qJPN0bH
         Ce5oJSU8kZ3cBCckYT1QYKlfBK2z3LVBSl1075DHNLSaHiOH3wr+QpBovN1XfcnF/99f
         BF5HTR3XY9QpsVlgNpbB8QQcCQ+YjVdQyTjBd5PlQ5KEmP8F+WdnHr6ZiDJOkJV/tSia
         RJ3+Pr5Eq+yYM8J3KtGX1rUvbYCqqRq2JVK8P2xoozEEww23HrqZ09z78Hvzs/zJxdq8
         7pFw==
X-Forwarded-Encrypted: i=1; AJvYcCXA5uj3N+QtaqxocL/rXp69/vvs8kxxaWrVJCnMybb2e25bPQZOUrbAynRR3gpEkrJ1iWJ+DV4l4a4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk9xTXWDYjSeDruGaMl1kWeZpnJsB+YDSAbuSXTJx33FXNmGzK
	WqX8Jhf9rdZyW1SS/L1d0ANYH6g1Q8mIrPo8n7bH1sUC3ynLNqhIg79WROVnX5Tz14w=
X-Gm-Gg: ASbGncu2pgiF580woqNOCK1V7s6JRTdu9Yv3wkMJINRFMgDTYSB4ERd690w8Oovdmia
	8RhQw4pMcYmVxGSJoTanc3ggOF+896VO3v7QuoRgAFHrHbWWOb5d2+exESjYirg6gVjiNTVi04o
	C4qXmjuCkXgFTPTscGk9GgloQNya6iZ3ijgNUMGVKkaqgoqHdmNqkSeT3uiZmzuiZYg0dWOaUYs
	mxdpKcHF66Ljd+38zW83iZguKeXIiR72HOEb55SKEJVhiWxFh3lPJOEXxXP+mFYR7DSt9ZVmDxb
	Oj50mYOy9nrkjotSZZL06n9Q12ReGelkxDKLk/xeMrcxYIXmRjTp8lJRCvDOvvHqYMWcu2MB58p
	anqYEzAXugnJ8M8VSTQPB7rQKl9Gj5VGnm8YU+jLHhV5a0KEpPYsJQXNqnpn/461jBmk+jxvrLd
	3LrJRDsI1U1pC1QCp8ZEDZLVHxUDrIEJNIAq4=
X-Google-Smtp-Source: AGHT+IFBda1EcsHmddpDO9LOEIIrlJYCTDL5Rlz+CdU/5vjVJjQIDVH1r/dzDG/W3yb8c7vMr4OskA==
X-Received: by 2002:a05:6000:1867:b0:429:d19f:d922 with SMTP id ffacd0b85a97d-42adc6895b6mr3593700f8f.11.1762530165930;
        Fri, 07 Nov 2025 07:42:45 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67921c3sm6213783f8f.40.2025.11.07.07.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 07:42:45 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH] usb: uas: add WQ_PERCPU to alloc_workqueue users
Date: Fri,  7 Nov 2025 16:42:36 +0100
Message-ID: <20251107154236.306620-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistency cannot be addressed without refactoring the API.

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

This change adds a new WQ_PERCPU flag to explicitly request
alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/usb/storage/uas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 4ed0dc19afe0..0657f5f7a51f 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -1265,7 +1265,7 @@ static int __init uas_init(void)
 {
 	int rv;
 
-	workqueue = alloc_workqueue("uas", WQ_MEM_RECLAIM, 0);
+	workqueue = alloc_workqueue("uas", WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!workqueue)
 		return -ENOMEM;
 
-- 
2.51.1



Return-Path: <linux-usb+bounces-30106-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E07C36F30
	for <lists+linux-usb@lfdr.de>; Wed, 05 Nov 2025 18:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9182E64602A
	for <lists+linux-usb@lfdr.de>; Wed,  5 Nov 2025 16:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6789531C595;
	Wed,  5 Nov 2025 16:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LO5u0mXX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E022430E0D8
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762360068; cv=none; b=T8FnXmdaV8YP9lqK0sxPCtaCxM2cLRUAoOurzg2gcaeq8ywNlBE8wy90FI7zgr1JmYnX87rejyFgvc8Gwj4TDu5843F2YiEL8QMXnFfS1xlVMpqSCICV+8TuIUvQg+9CozRoSlFev/9Fq65R2hE0eoOCEDgeBUkdVRzY59+qx1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762360068; c=relaxed/simple;
	bh=ScYFsi+CQ2znfz+Ybc9cX2mvEmOBus4QcA5+jXyJO4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qepq9P5m6KPXdL58XoFsJ5PLJbQL6xxtm23PFhWDMJI1rtxFlXpdLXKtCT2HKrpInGtaCjy5PMoMaRtRfdLctHlE8p58ZD34DJ7AkJVF3DKLiaiLNefgTEAQ6wcfjAhOF4j+AoDXZZLweaprTqPf8l8kqUzt/uqK3tJTiSZPqt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LO5u0mXX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477549b3082so18784795e9.0
        for <linux-usb@vger.kernel.org>; Wed, 05 Nov 2025 08:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762360065; x=1762964865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPja7sf7hTqS15KwtFLZrtw6wHJoXtgzrlY7dcNk5wY=;
        b=LO5u0mXXPgpGzWJ/ZlQanQb41npsPnM7rqiJgdHrjx+d0J5slOTJIHPJGXcQkESwP0
         HvA24CiFH2l0Jd/+JC1NF31kuOKaYM32VFXp8hB6gyNvZjey+7JEEprTlNEDbi12OROz
         y5CTQjUHdcOC5iXQCC0LEIxS2pafd/huBU2i8muo2mc81pvrQU0CuFWKe5m/KvY7MkJ6
         anbEYFhdUdWNjooSSXjsUvEVjEKT+1Lxr7FBoVHfpLL1cp6Gmst30D+8Vq2p//Edvfnr
         G5Fx6EpAvWgRHfLkBzPDDDtfwC0z94OL9kH5eZLD2l729mNM6wSW1tz84deNJ8sZTsoG
         qe0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762360065; x=1762964865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPja7sf7hTqS15KwtFLZrtw6wHJoXtgzrlY7dcNk5wY=;
        b=F+PRaZGzerhoDtXPLs2h7FHQvq/uKyLTFA1WUPftp/adZaGHirpFgW6ZiSZ1BkoT1f
         Hec/NntU1jSMJBlDrH7PZXc8gZ8PiVbYgjdJqtn/DzqzrX1vJje8pWjnBS9y1A0Qsvsz
         DhX3UPRw1Y8GdTz5kAhND6ighVNULC61sQcclJ9914uJLfxScx0s3Mc8CRKrLUc24Cax
         f4HMUBZ8/kNFbGpDVz+gMM+PJM0zHNEe0fnRdy4NrATFM6h/F3+zyz/CT9jY9c6008Jl
         HcwezINSablSZJ0XB3SSZo/6TxILqvlgdJvAX0vReU+9x/9cOLN6TO1tps8DLvgPtFCO
         EoKA==
X-Forwarded-Encrypted: i=1; AJvYcCXFZtho0sLfDLzFBRypxYGj+i8BISUJWNOnrpQi7EF5wahEjP5qt/pvJEwB/oWzTL4vW5D1S0pZxPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAVtVpuXwpDfyEegvFwV8NQeix8ZTEaG7jG/iM4/UMITmIFcCh
	ZluhOEYvFzVX/LfEVDI+qlvQteVm4La2NgkjXfhQjo7sRNBCTcJQrlbKccZEpACtMO73QrWl6WA
	sQik3
X-Gm-Gg: ASbGnct92D/Xr/dMK1/xtUpNMbtIRTotOWmBUsbIjP6UpsfkM2HAMhNwqoI7noRPTYp
	gUSpnRl5HHH4DEEQHQMct0Krwe334YSoPOyDETgGU9JXylRM53gsR7K2DJ4tb5cKxEFp4jRaOV+
	rguhSmKbQVz2nYprpYTUbxE7EDqyfT2iB83vIAHFSP04IoJImXYDeHRdiYWTGuqJ2OJBmpUex9l
	8AT6xomIn14xHQYWA5RokuvoYyY4a2olgo7Gc/qxatow2FRoLodTBtQeud3iBzdCErYw2K34I0M
	b4SquMxh9bPpZsQycTLTnNC7XpA2l28A3pyXD/LSj5UytcEnjYojr7BrVuUmBxR/r8hVNpQ0ksw
	nZrl2De71dTVl5EvA9rEgGZcVX9F7q09hBeJcRkDfanoiRpB037aMtrCLTdehQtltgU+MwaVEX+
	N7cPqIjX2yi1JhEy9+DbR82xU=
X-Google-Smtp-Source: AGHT+IEfCYki37HXIu7pIIWRGgwPvbyC4maoBsPjyr/idkvFdo2OcoNGGQjYZ+hklJH1J0DTrM799g==
X-Received: by 2002:a05:600c:4e48:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-4775cdacf79mr29064435e9.5.1762360065114;
        Wed, 05 Nov 2025 08:27:45 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdee965sm57114305e9.17.2025.11.05.08.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:27:44 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: [PATCH] thunderbolt: replace use of system_wq with system_percpu_wq
Date: Wed,  5 Nov 2025 17:27:36 +0100
Message-ID: <20251105162736.320591-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

This patch continues the effort to refactor worqueue APIs, which has begun
with the change introducing new workqueues and a new alloc_workqueue flag:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

Replace system_wq with system_percpu_wq, keeping the old behavior.
The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/thunderbolt/tb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 4a94cb406bdf..7a3f76a852de 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2636,7 +2636,7 @@ static int tb_alloc_dp_bandwidth(struct tb_tunnel *tunnel, int *requested_up,
 				 * the 10s already expired and we should
 				 * give the reserved back to others).
 				 */
-				mod_delayed_work(system_wq, &group->release_work,
+				mod_delayed_work(system_percpu_wq, &group->release_work,
 					msecs_to_jiffies(TB_RELEASE_BW_TIMEOUT));
 			}
 		}
-- 
2.51.1



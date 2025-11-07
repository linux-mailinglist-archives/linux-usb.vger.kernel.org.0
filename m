Return-Path: <linux-usb+bounces-30205-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 238E4C40A0E
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 16:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9DE9734764D
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 15:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73ED132E739;
	Fri,  7 Nov 2025 15:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ezEn+KTn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BC92F83BC
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762529870; cv=none; b=u32gtM1xVkozigQ0nq7u0jD7cTtk7xzHP6R5vU/+URgNtg+iQb4v3mQVpfFw78bhhfH5ykRNN2pt9BTBDICFGrkOQYtcqwe7gR3m+TQ42xeEDyxU3qalV0cWTXDY8KUk1d4/5wkcZQzwIKJC6EVI9sNx8cRR9MoMgNLo1O2cZYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762529870; c=relaxed/simple;
	bh=mPQ47w/zAfUpHgqm7tWAUuazXErGJ2t+HqxJi7cN+Fg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DdHBoXak1XmMHbKIhHAWY1W+sQYVq9T83/T99Fjeh9c5nFcSP6HJbLHxrnNv8FGXhGNW13067gXalKtPxvzYH9dk6iQ9YaApkjn793PFiaHQlfNS0nspUoqeKXoWUIhQCFRI8fKIQR8Bwvf1UeHfOfoypefQvdivI37T0B9SX/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ezEn+KTn; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-429b895458cso476966f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Nov 2025 07:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762529867; x=1763134667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYlVzA960q272CsXQuy54o8lCSBlxUjmuT/lBHNgOu0=;
        b=ezEn+KTnrLfYk6W8nBbaH8irxEiQ4o7zODZvHGZA+tAz4t/t9MdtHGXrkHZTK33J3S
         +UHv4DrpkZJMNS1wQtKyC+RVS2aA1i3WhQNrpSuo0sc0t2vNVowO/+4CT9IaEjJkZD8p
         yvBxOYYPAuC5lh1dCjW5WP9JIC27eMJr1cUbOigH8riPjmRBM2gyX+2MCRPs+E4nKKsc
         xqnckn9dQIo3d7lCU6PqrkUX616tEAZ642cvDUPhufCIGXFQ7i4QFKaQJt32ZsBuNmDz
         CCC+1M7T+Wk1qqC0h8wNAgEjAUBkMCrBHTmAyxFaGuDgJnLLWhC1eDV8vP8awBJq+TU5
         /yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762529867; x=1763134667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PYlVzA960q272CsXQuy54o8lCSBlxUjmuT/lBHNgOu0=;
        b=et1JvzANcB/tvffT9ZYlNVk+r798n+R13/iPOc4b8so6VYpZBYTe2yhOT1IM9GG2wJ
         tG/zfLWqIbY15S2smF005HVkhSEJKrCnROhrBMht61wBU7HbNUi6yafCZBdM5Bcdw1+Z
         UcCPNAh11+QwajQfbqAQ8fPb+ZgcgKQs6CP5FU9YLWLNXSKGO0Yl++0A+dmps+Ytq1Cl
         41iIMlRO6cdvdn89jY2689qt/kLGcP2zmKTtZI5bRYd1uX9WThntFfNzkRnGLCysMk3J
         D5mDXJsFvM/zOClYsrTNH1zkqo2yOR1ESkJtAulidxnUxkwG7O8UShbWgZB5gJFI5JMb
         9AzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAMj4/w70IFg70GCA70mPR7XxgR2W/sv+J7XDb7Pl/PwgPywTNLLEjuPFN/7fDhyqd2CqRc96NPCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoWrLco0tafhIaaty1TP9eqav0W/By/lLnFIqXEAS6cJDA42EF
	YoJe88vim+rBXJ4HksMdpcaz04fLvcGdjXGfO1uEs1lQig8As1J0aFy90XpnCx73K+4=
X-Gm-Gg: ASbGncsFF4FmO5fmndrZ5Q4zNN/45VM6mBMLXAVEndtoWW86bAugBPDhuHBLdMgifLV
	Hmph82BIzJkz0oN4fNd4B+Akl9esu+I/2TNkXH4DpzbWuZ4VSfDrTZS9/HLf/sgOyXwPgzBFZz1
	t7I7CCikdn8GEpQ3ChQmccBFOk0aUYBHTOF6bCuXEoruxA2lPF/bTiOPTC4tW+pv08hseluFuHD
	nhMy5fFU5aG22lVEzxl+feSz6QWPdbvNPDBQcHqvExl+OwFtsskKjBMdYNQDIov1Ro0sUIPnp4b
	OUkBurIcpPQd8B9Pe9DHP5S/8KUwmyUb6mDTv9UmqSXfjdnYkt6WkxTukYS3xt7o3ecOb/J4qq0
	CCt9/5BBoKVgF2fKm4x1oycXNbSYVlhcxbEYKJ0mpF/uEsz5tLoF59ZPzrJFGAy919C2s0ckrwL
	4kjAiyuFDczkGZb6hOnbQh3s3p
X-Google-Smtp-Source: AGHT+IGYhcS+M6tSBMjY0Hp3kRBjPTX80aXF3ObfGQ195hEhJg3fYy/Wcot1z8cXfnMCDUR5aSHR2A==
X-Received: by 2002:a05:6000:612:b0:427:167:c2ce with SMTP id ffacd0b85a97d-42ae5adcbabmr3068885f8f.42.1762529867007;
        Fri, 07 Nov 2025 07:37:47 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67845ccsm5763460f8f.36.2025.11.07.07.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 07:37:46 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 2/2] usb: typec: anx7411: add WQ_PERCPU to alloc_workqueue users
Date: Fri,  7 Nov 2025 16:37:31 +0100
Message-ID: <20251107153737.301413-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107153737.301413-1-marco.crivellari@suse.com>
References: <20251107153737.301413-1-marco.crivellari@suse.com>
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

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/usb/typec/anx7411.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index 0ae0a5ee3fae..2e8ae1d2faf9 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -1516,8 +1516,7 @@ static int anx7411_i2c_probe(struct i2c_client *client)
 
 	INIT_WORK(&plat->work, anx7411_work_func);
 	plat->workqueue = alloc_workqueue("anx7411_work",
-					  WQ_FREEZABLE |
-					  WQ_MEM_RECLAIM,
+					  WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
 					  1);
 	if (!plat->workqueue) {
 		dev_err(dev, "fail to create work queue\n");
-- 
2.51.1



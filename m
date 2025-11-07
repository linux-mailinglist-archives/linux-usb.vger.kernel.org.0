Return-Path: <linux-usb+bounces-30203-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 267D2C40A05
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 16:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C77C1346CD2
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 15:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9675632D0DB;
	Fri,  7 Nov 2025 15:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e8Iq7WP3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C44E3081B5
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 15:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762529869; cv=none; b=j1YFgDN5cK4ivOXWJhEmiCiG2erntjauQfTvp7awKwRXZsmf4Ur35C2dJbwNBY3YJq1ukips1ls8jKpB9APGB5LBkySJjZjiUkcpC/+a2CLfkKdnQdlfNSBafMQZcftcvq7Hj1H41TCAJyTq1n023IPvXshjJAYyVnlC1Nr1G4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762529869; c=relaxed/simple;
	bh=fENo0AEoHS8vjdzodw8//Ervf3XX6q9wCb0EdrAP1gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=al+KfacPzHoo0K4qMA6WVgos9VM8papkDI9vG86iGpCrI/z3bBWaaImlAj/IuJIPhSRryN5TL/FwjV1OmBX2c5kgEWvdhwJmJ8ItTuobNnPtxEM4Xye6ZUyrbhOsh6e7hVo9KfBMd8+QSplXGjbNJGcJsQYcl+/Yyo8u8YYOUtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e8Iq7WP3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-426f1574a14so556706f8f.3
        for <linux-usb@vger.kernel.org>; Fri, 07 Nov 2025 07:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762529865; x=1763134665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMQZzS260QJiBrEG+1HgRiScApWFFVAWqrxceNoP7lg=;
        b=e8Iq7WP3T9Mf4RMfY54naY6KdTQLuAQn9oK/+2yBNOhIelxmXhjG/qTqjwsqGR8PdD
         S+YKVcJJdL0gXH1IomC2nCnTqPqSrwvPLqFkvEAaTJ5lZITBUoW65A9olZoU1/iOdeuh
         2/oclyebwYrmoGaxQpJ8RQ62hssirgUw3ils1UhdiEmkAav+KYjskhZWlUvC1JZqj0sJ
         TaFNJf42Bdgd5pAy4L3l2IHsDrS8yQGiXvuhsV3sj4yrHh/TQmjrwRTYmk9y4uPrRglp
         pIZJzcWaCceR4/j60jQfhqOso6AaplN7VqICYeb7LPEzDIC615Hy3GZE1BWOF8MaA2+w
         sXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762529865; x=1763134665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMQZzS260QJiBrEG+1HgRiScApWFFVAWqrxceNoP7lg=;
        b=QzrKMS02rMLcv2wxULMfYU7Lb0uRYzXXU6xrbmXog9C5XETW49JU7RMY5ZwRjFoNJk
         aq2j/eMdIiACX/HchPc8vi4OfaSnFpG6TfjCH/yOLKKj9GKVwfOZSb63UO08nONe5JOk
         wYwA76QOI/X9Gnsl1qbxljiHqwlb3pWuyp6VoX3O6/0mKL3+ZAElD16SEpBZdQbdUEg1
         hExhth4WfVKAZWQtuDB2T9rX/lTdZoIZtpRBlH+qu7jHSq86uXnYsCsGy0sWI9h+HC2N
         xQWzPiFZZSVhi6Jh8ZLKZ7X6xxwXWqrnCLDTG529jOb/TS7NNOKebteyUxkLCAyrWUGL
         pZFg==
X-Forwarded-Encrypted: i=1; AJvYcCU77Z6y0nkM92786BvVfQCTmnUSo60hwc/b0s/YgulKYn0vXg0VDKruD7UITA3KywXf98gxMup6o2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWgHpc901WsiVMFbgI4cJmg5TpFZc1dQcE3eIkRscIM9qTA7xV
	9BY1aV7GafBJSchyI1rR9aZQLH8OTGHrsatrj961audl4lgA1bjMNQWWOcTK39XPAwM=
X-Gm-Gg: ASbGncvrBpwEvB6HAAj7AkcL3qz/g0HxYxQyYUYV2J1Y6+4yB6xtPKSIFM1fCIC7Jj2
	fB5atATdasOZ5ncisOYiPGJu2SbNejQEUEU8sNTYwERMfpPEBtOUxnQ/6pj99z/v5bf58FO1hgj
	1PH0ocETnz5+IEWNAv9DWpHH+FmEUk31LDJoBArSC+aV+jcNpu+tZWhMdvw7IvtJ9bQXWIgF2pf
	sl4ReN07CVyjkjFBVjmbPFuENbWqpmZTbjtZIbgcoYtwgfg/r28pSTnUi6XNi4gvPaTNYDPfrds
	wmJ3pTsQIDolSy8dwheJEfTtyZZQcT7/8FcgPgg9iMJ4uiOYIFvX7RydZZ+2q818D0VGdAW3K8B
	WVaWTp7lFZT1cc/OTQnBAOjZ3oLMJJAgSi8HIAzfzJWme0Otk4GBL8QJnlPrMFThLrAqJhd37ZU
	n79wqiub01OUHkISnIyGPSst/Y
X-Google-Smtp-Source: AGHT+IE3PZ5ZmHu0Bu9t7eLJHCk8qo1WdCOpE0stMx67TG3l6gYq/N8snpXPCiDobpiHGGYG3mCmNQ==
X-Received: by 2002:a05:6000:268a:b0:407:23f7:51 with SMTP id ffacd0b85a97d-42adc68843cmr2621604f8f.1.1762529865278;
        Fri, 07 Nov 2025 07:37:45 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67845ccsm5763460f8f.36.2025.11.07.07.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 07:37:44 -0800 (PST)
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
Subject: [PATCH 0/2] add WQ_PERCPU to alloc_workqueue
Date: Fri,  7 Nov 2025 16:37:29 +0100
Message-ID: <20251107153737.301413-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an
isolated CPU where "delay" value is 0 or greater then 0:
        schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

        schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

=== Recent changes to the WQ API ===

The following, address the recent changes in the Workqueue API:

- commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
- commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The old workqueues will be removed in a future release cycle.

=== Introduced Changes by this series ===

1) [P 1-2] WQ_PERCPU added to alloc_workqueue()

    This change adds a new WQ_PERCPU flag to explicitly request
    alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.


Thanks!


Marco Crivellari (2):
  USB: add WQ_PERCPU to alloc_workqueue users
  usb: typec: anx7411: add WQ_PERCPU to alloc_workqueue users

 drivers/usb/core/hub.c              | 2 +-
 drivers/usb/gadget/function/f_hid.c | 3 +--
 drivers/usb/typec/anx7411.c         | 3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.51.1



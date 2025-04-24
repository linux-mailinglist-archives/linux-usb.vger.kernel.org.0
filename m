Return-Path: <linux-usb+bounces-23394-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCD3A9A6AD
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 10:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19C9916AACC
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 08:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8799227B8E;
	Thu, 24 Apr 2025 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PIcccUr4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F895226170
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484279; cv=none; b=HvBR0wp0lMkYcWsufIBoMuaQQ3mRrPxsGysPXL+crs6XytWO3Sz0VzYdHFecn5RbtEVTpWM0hLoh4nUsH15F5nIdua2CvirSrQDPA7LzpgHB1kyw2r7LR7XB9R+CG8ZUssbsn+XLK6ZSgcMP0J2Q7K5heiL5RNw6SOcFbtMwOD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484279; c=relaxed/simple;
	bh=+lgkbRSJ0iOtxtbXAXv2QUHccF5KvXTmCcVLkBvVWjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oQnid96iR1LKv1zOiBZfxgdkvbjfs9kz0yiv58LpT6V02tIVWVth0LKPZvlagriAQ7AZXeEvhSE3fMR6Y51l4th8v/BrVwVKjXpk+pQ122Qagdbzh73/KgTwIM6ZHm9FElLgGQpW18jiuO3bwb49z5hcMwkjDRKehSmKgWJgBhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PIcccUr4; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aca99fc253bso112385566b.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 01:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745484275; x=1746089075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LQWfbR45iZucEp5TpNYKj0HRMs23v/ORSUAtRdcvJdY=;
        b=PIcccUr4WuJIii8m325QbeIfCG1KYwwZ6kKW2n1VnXAc1FaCOcXWs+bgPMhZD/jLMD
         T+HkwNEzyhgQzWfPIAFNtz2YZYxnmsPQPePEzZkbyXPtnxh9dFEhG+CCzkGfnEUrzgoz
         OvMdkSI2ECM6G0mB40kvKuI3vOMVWrBbLmSA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484275; x=1746089075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQWfbR45iZucEp5TpNYKj0HRMs23v/ORSUAtRdcvJdY=;
        b=bPCKyceq/Ihrem5/lyAR+OMwB4qcVs+wmdAqchQqiaDvRndQlnR4ts6rXx6sgVlM58
         criuXQGfkdpTqjPtAYgwkI0jrtmPQF2oxlHvy1JxYq8yM+HnSI0TMHtHaeFMGm56SLXn
         LC8pNmJf1BRbCRRM/6LQ4VzW2fJhZT+hQfmybLhH20JtLYNEZsjLj4K/BeMONrAj7tFb
         K1tAnJoJU2Sm1Yw5CAO2hld/4KxADI7Iq/qYqKzmZhOlXfuHWOZ0WJvI1qIUawcyFlBn
         6IRE9gY/Tgp3AAn/DT1ArJOOEw/zRubTaaDKfQ7EHtjhvhaRn709N2ziaPWFi7Spvf8M
         41Iw==
X-Gm-Message-State: AOJu0YztFCVZPVacUKqHPio1odIqM7bvyHarfdvzrOTV2OcWJUz+nXvj
	g3Itj+PrzQ+IwqcdiwNRhmWTW4rHmZMgvKecixCuZoMKeGQTaBBKy/UblXgm7g==
X-Gm-Gg: ASbGnctEn7b997fC/4UUUlSXVT51GLGJhgyIsYunA4yuGPm3M6uM3NojBJxYNIRMRcv
	bEY8ULGttH1UuN3FxQa54plq0MQbl9fWE5crbu94IGn/mY55qH1CLYyRmyc1xYKi/fvBLJm0Qdv
	26ViHhIjfp47l+4kvrMjuFV8C0mZA1Ao5i0knYuWuiAmTi0rPTSJQ/MXCpFmKTi/8TcmLBkhkSs
	Sm3Ao4NeKhy8kqLaqELmoBYTxWoG+rEb39zB31oN62xETBNx4Ba3bhFwTsLgYkU9n2QNHxagfG6
	bvkRKbCMaDuJ1QF6zRS5xWIpzlGc6uQcXkAKYGdo3qpw5rSfq5Y3ulSPq9ieuMeaXnkrA+TcUPM
	5aPOO+A/vvkvAZqSkmZG4Oyxuq/44iBbIgQ==
X-Google-Smtp-Source: AGHT+IH3VTo3+soWYDQ8rxAU3qcPAmzkeo64vgOFZZWTcEbYsASerEhk4Ug5ZhPthFWa+a4Wj1KzJg==
X-Received: by 2002:a17:907:1c1d:b0:abf:7636:3cab with SMTP id a640c23a62f3a-ace572a282fmr194791866b.29.1745484275431;
        Thu, 24 Apr 2025 01:44:35 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (100.246.90.34.bc.googleusercontent.com. [34.90.246.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c5eaf0sm69377466b.181.2025.04.24.01.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:44:34 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jameson Thies <jthies@google.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Madhu M <madhu.m@intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 0/2] Fix thread synchronization issues
Date: Thu, 24 Apr 2025 08:44:27 +0000
Message-ID: <20250424084429.3220757-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2: ucsi_con_mutex_lock / ucsi_con_mutex_unlock functions are not longer
exported. Thanks to Heikki Krogerus for noticing it.

This patch series addresses deadlock issue and prevents a NULL pointer
access within the UCSI driver.

The first patch resolves a deadlock that occurs during partner device
removal. The deadlock scenario involves:
Thread 1: ucsi_handle_connector_change holding the connector mutex
(con->mutex) while waiting for dp_altmode_work() to complete
Thread 2: dp_altmode_work concurrently attempting to acquire the same mutex
Thread 3: ucsi_poll_worker is indirectly affected as it would be blocked
by the held mutex

The crash log:
 INFO: task kworker/u16:16:7254 blocked for more than 122 seconds.
       Not tainted 6.6.75-g5e7fdbab3246 #1
 task:kworker/u16:16  state:D stack:0 pid:7254  ppid:2 flags:0x00000208
 Workqueue: 16130000.spi:ec@0:typec ucsi_poll_worker [typec_ucsi]
 Call trace:
  __switch_to+0x130/0x158
  __schedule+0x950/0xa18
  schedule+0x68/0xc8
  schedule_preempt_disabled+0x28/0x40
  __mutex_lock+0x390/0xac0
  __mutex_lock_slowpath+0x18/0x28
  mutex_lock+0x28/0x60
  ucsi_poll_worker+0x24/0x138 [typec_ucsi (HASH:5d4a 1)]
  process_scheduled_works+0x258/0x4d8
  worker_thread+0x330/0x428
  kthread+0x108/0x1d0
  ret_from_fork+0x10/0x20
 INFO: task kworker/2:0:25045 blocked for more than 122 seconds.
       Not tainted 6.6.75-g5e7fdbab3246 #1
 task:kworker/2:0     state:D stack:0 pid:25045 ppid:2 flags:0x00000208
 Workqueue: events dp_altmode_work [typec_displayport]
 Call trace:
  __switch_to+0x130/0x158
  __schedule+0x950/0xa18
  schedule+0x68/0xc8
  schedule_preempt_disabled+0x28/0x40
  __mutex_lock+0x390/0xac0
  __mutex_lock_slowpath+0x18/0x28
  mutex_lock+0x28/0x60
  ucsi_displayport_enter+0x44/0x160 [typec_ucsi (HASH:5d4a 1)]
  typec_altmode_enter+0x110/0x120
  dp_altmode_work+0xe8/0x170 [typec_displayport (HASH:c690 2)]
  process_scheduled_works+0x258/0x4d8
  worker_thread+0x330/0x428
  kthread+0x108/0x1d0
  ret_from_fork+0x10/0x20
 INFO: task kworker/2:3:25952 blocked for more than 122 seconds.
       Not tainted 6.6.75-g5e7fdbab3246 #1
 task:kworker/2:3     state:D stack:0 pid:25952 ppid:2 flags:0x00000208
 Workqueue: events ucsi_handle_connector_change [typec_ucsi]
 Call trace:
  __switch_to+0x130/0x158
  __schedule+0x950/0xa18
  schedule+0x68/0xc8
  schedule_timeout+0x44/0x1b8
  wait_for_common+0xe4/0x1d8
  wait_for_completion+0x1c/0x30
  __flush_work+0x22c/0x2a8
  __cancel_work_timer+0x130/0x1d8
  cancel_work_sync+0x18/0x30
  dp_altmode_remove+0x20/0x70 [typec_displayport (HASH:c690 2)]
  typec_remove+0x60/0x120
  device_release_driver_internal+0x164/0x258
  device_release_driver+0x1c/0x30
  bus_remove_device+0x140/0x160
  device_del+0x1c0/0x330
  device_unregister+0x1c/0x40
  typec_unregister_altmode+0x40/0x58
  ucsi_unregister_partner+0x90/0x170 [typec_ucsi (HASH:5d4a 1)]
  ucsi_handle_connector_change+0x184/0x468 [typec_ucsi (HASH:5d4a 1)]
  process_scheduled_works+0x258/0x4d8
  worker_thread+0x330/0x428
  kthread+0x108/0x1d0
  ret_from_fork+0x10/0x20

The second patch prevents a NULL pointer access that occurs if
ucsi_displayport_work is still accessing partner-related data after
the partner has been unregistered.

The crash log:
 BUG: kernel NULL pointer dereference, address: 0000000000000300
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 Oops: 0000 [#1] PREEMPT SMP NOPTI
 CPU: 3 PID: 3413 Comm: kworker/3:3 Tainted: G     U 6.6.76-07480
 Hardware name: Google Brox/Brox, BIOS Google_Brox.16080.59.0 12/18/2024
 Workqueue: events ucsi_displayport_work [typec_ucsi]
 RIP: 0010:typec_altmode_vdm+0x8f/0x4d0 [typec]
 RSP: 0018:ffffa929c825fe28 EFLAGS: 00010246
 RAX: 0000000000000014 RBX: 0000000000000001 RCX: 43032ac4505ac800
 RDX: ffff9d8def8e77c0 RSI: ffff9d8def8db5c8 RDI: ffff9d8def8db5c8
 RBP: ffffa929c825fe50 R08: 0000000000001fff R09: ffffffff9385e1e0
 R10: 0000000000005ffd R11: 00000000ffffdfff R12: ffff9d8ab4b67c08
 R13: 0000000000000000 R14: 0000000000000000 R15: 00000000ff01a144
 FS:  0000000000000000(0000) GS:ffff9d8def8c0000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 0000000000000300 CR3: 0000000148438000 CR4: 0000000000750ee0
 PKRU: 55555554
 Call Trace:
  ? __die_body+0xae/0xb0
  ? page_fault_oops+0x381/0x3e0
  ? prb_read_valid+0x29/0x50
  ? exc_page_fault+0x4f/0xa0
  ? asm_exc_page_fault+0x22/0x30
  ? typec_altmode_vdm+0x8f/0x4d0 [typec (HASH:c6ec 5)]
  ? typec_altmode_vdm+0x87/0x4d0 [typec (HASH:c6ec 5)]
  ucsi_displayport_work+0x34/0x70 [typec_ucsi (HASH:698a 6)]
  worker_thread+0x386/0x930

Andrei Kuchynski (2):
  usb: typec: ucsi: displayport: Fix deadlock
  usb: typec: ucsi: displayport: Fix NULL pointer access

 drivers/usb/typec/ucsi/displayport.c | 21 ++++++++++-------
 drivers/usb/typec/ucsi/ucsi.c        | 34 ++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h        |  2 ++
 3 files changed, 49 insertions(+), 8 deletions(-)

-- 
2.49.0.805.g082f7c87e0-goog



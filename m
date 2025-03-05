Return-Path: <linux-usb+bounces-21389-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EDBA4FD66
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 12:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBC0C1885337
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 11:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A715214A95;
	Wed,  5 Mar 2025 11:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lphl5ICA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC3E1F4172
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 11:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741173469; cv=none; b=aUwpbvKD+dv/kGk0zrwBjKeYNunaeHTMDkzFf0Qs9epFLF6NdaSSwSV8VgKgBpieRs75IDxLtuAsGzujaaQPiyqP6ob8ZCAexf+/f9PJGJD3PZ0VPmuhlY1vpCcIcPTh+leOsMFpN66Wi+Q7T6Qv7dphzJ8CX/dD1x+Xaxu3GqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741173469; c=relaxed/simple;
	bh=SVSH+f+O2e7LWdBEFSN/r7n6fzdsEWyiVARn8NbEe/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kWuQNQxWCS+/reOlWdgqqW33XT+PSpIJDrmYsANBY3NCV2K03ins06gKgw1TqRrO84Z1NsiHztSW+wVSfHlo4+Rzi8v+aFBcGivIq0z/26STrboLof2Zjszftyh2o0Al91cUFWh6HVY8DF8ttfvBQ8sp5pvVU14TN+lGYZyP0fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lphl5ICA; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abf4802b242so788545466b.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Mar 2025 03:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741173466; x=1741778266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x6V1GXQi9zxTEgxla4zdqofUBg9eZtKu7BigZbCQbD4=;
        b=Lphl5ICAsickXtR4DtnXGzC1qbI6SzDcCDJM9qsG8sAAVCldtWDRuIHf8g2g+UINaz
         5MNLFydYLQpDMnGOoxfjDxaAhhsehjnS72RV+/51uKb/i7HcTmaUQThzqAqUaNN5lIKK
         S3tawExa73W+GuP0RZniHlB5MpSKppNdlbr9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741173466; x=1741778266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6V1GXQi9zxTEgxla4zdqofUBg9eZtKu7BigZbCQbD4=;
        b=Dk9R0SVKqrRVsu4KLfy1HhYblCZCBpLgwJaM/iXBkr6+fJKOWOj0S8cw4VW3hzMvTA
         IZUHe67xd9pK174iKLb8apyAr3quoU0I90dOPMphqkn+Kf465QMCYKfmR0Zgzw+qtnRi
         ssg1h7xJA4K0G7oSvPZDO8so/ECHnpeRqcQZ8QYoek1ap7n4T7FDZBt5hIHwMllQlUMH
         lzFrGdB5seFFef/HL/8IFFXyDnJcDVRfZNPk9KVkiizTskSqJP7MDa+EnqTTBwyXdYLu
         dZ8uD1AbH1OWUBNF7UYsreHxmj8qp7pNuNSIAJvc8L7ZAepN3chmuswMxQpgTFF31wM/
         7yqw==
X-Forwarded-Encrypted: i=1; AJvYcCXmUzT61nu1miJlFLxkYBCMB9zicfwRFJuHFepmUnUXDj0x3HLiNBbHBhB+vbiqvRFEfGQs+OQGT3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd+A1VqwuntnpTWsbpNCGhV2DPZ0+fKHaqcx4io7agdmZXgHIv
	v9YcKOMMLT8L0PHDNxuRsJX8UUADCaXYW/RHkgBHoW+4u7CJDzCgLMYIkidAPw==
X-Gm-Gg: ASbGncsFqRx3SYZA71xEoIa6JFb49LOtQJhCxxs2W0DwfwgianNUDvsd0z4KLDg0EcA
	K5NbnSYwzlYWg+EEJ7EyJVi+yCGoOwSbeVbEEXwvn7pXgyxypas+N7v9vbk6OrB3AOhadnBGyhn
	nhKmO+6RyqG398A+3HKrwuhYW9xvYc4rCtx9zpnVO+NpQEVQWEhHrnX0pyoeS4v7aCUpq0Htx+U
	Y0tG9uUUZ64XaGR/aYXYS4LUSMNv1Wytr8F0BF56npyd88orCyDy6rtGhtM37RUdOTux3Pa2MDF
	DuuJURgVYkA3rGWZA44bXpbOVwXPafCMO+q8Je/qeN0cRHmorhoeHAb4t/5AGSkDI3MyJNBYYfi
	d4EbwSg9UFvxniEmTnpSeffO7n91Jgm2QDz4=
X-Google-Smtp-Source: AGHT+IEBt6x6NvkT3/tf3VkcgMbthjH75UXCNZdV2Qe0xe/ZqqD8mt9D26KJtU4BE02ygNrv54EMXg==
X-Received: by 2002:a17:907:1c92:b0:ac1:ea29:4e74 with SMTP id a640c23a62f3a-ac20d92560dmr282776366b.28.1741173466038;
        Wed, 05 Mar 2025 03:17:46 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac21e902cddsm35907966b.113.2025.03.05.03.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 03:17:45 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 0/1] Fix race condition causing NULL pointer dereference
Date: Wed,  5 Mar 2025 11:17:38 +0000
Message-ID: <20250305111739.1489003-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2: tag update, no code changes.

The kernel crashes during UCSI initialization due to a race condition.
In ucsi_init():
1. ucsi_register_port() sets up a work queue and schedules
ucsi_check_connector_capability task.
2. "PPM policy conflict" causes ucsi_send_command to fail.
3. The error path (err_unregister) deallocates resources,
setting con->partner to NULL.
4. After that, ucsi_init() waits for the work queue to finish its task.
5. ucsi_check_connector_capability task, running in the work queue,
attempts to dereference the con->partner pointer, resulting in the crash.

The core issue is that con->partner is set to NULL before
the work queue task is guaranteed to have finished using it.

The crash log:

cros_ec_ucsi cros_ec_ucsi.3.auto: PPM Policy conflict
 BUG: kernel NULL pointer dereference, address: 000000000000030c
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 PGD 0 P4D 0Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
 CPU: 8 UID: 0 PID: 13 Comm: kworker/u64:1 Tainted: G     U  W          
 6.12.0-g15b373ee5573-dirty #1 b5276ebf6ba85f471d9524ce34509877165c9f58
 Tainted: [U]=USER, [W]=WARN
 Hardware name: Google Fatcat/Fatcat, BIOS Google_Fatcat.16163.0.0 01/15/2025
 Workqueue: cros_ec_ucsi.3.auto-con1 ucsi_poll_worker [typec_ucsi]
 RIP: 0010:typec_partner_set_pd_revision+0x5/0x80 [typec]
 Code: cc cc cc b8 ea ff ff ff c3 cc cc cc cc cc 0f 1f 80 00 00 00 00 90 90 90
 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 <66> 39 b7 0c 03 00 00
 75 06 c3 cc cc cc cc cc 55 48 89 e5 41 56 53
 RSP: 0018:ffffb532400c7dd8 EFLAGS: 00010206
 RAX: 0000000000000004 RBX: 0000000000000004 RCX: 0000000000000000
 RDX: ffffb532400c7cc0 RSI: 0000000000000300 RDI: 0000000000000000
 RBP: ffffb532400c7de8 R08: ffffa3ab042d28f0 R09: 0000000000000080
 R10: 0000000000000080 R11: 00000000000000c0 R12: ffffa3ab01dc6480
 R13: ffffa3ab120d12c0 R14: ffffa3ab120d12c0 R15: ffffa3ab12074000
 FS:  0000000000000000(0000) GS:ffffa3ae6f800000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 000000000000030c CR3: 000000010700e004 CR4: 0000000000772ef0
 DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
 DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
 PKRU: 55555554
 Call Trace:
  <TASK>
  ? __die_body+0x6a/0xb0
  ? page_fault_oops+0x38e/0x400
  ? work_grab_pending+0x56/0x230
  ? exc_page_fault+0x5b/0xb0
  ? asm_exc_page_fault+0x22/0x30
  ? typec_partner_set_pd_revision+0x5/0x80 
  [typec bc1e7c7e089f4aaed440a0a5388387e3ef1ca2cb]
  ucsi_check_connector_capability+0x71/0xa0 \
  [typec_ucsi 843b0396f746abb17c01f8d4d12ead8b09b88609]
  ucsi_poll_worker+0x3c/0x110 
  [typec_ucsi 843b0396f746abb17c01f8d4d12ead8b09b88609]
  process_scheduled_works+0x20e/0x450
  worker_thread+0x2e0/0x390
  kthread+0xee/0x110
  ? __pfx_worker_thread+0x10/0x10
  ? __pfx_kthread+0x10/0x10
  ret_from_fork+0x38/0x50
  ? __pfx_kthread+0x10/0x10
  ret_from_fork_asm+0x1a/0x30
  </TASK>

Andrei Kuchynski (1):
  usb: typec: ucsi: Fix NULL pointer access

 drivers/usb/typec/ucsi/ucsi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

-- 
2.49.0.rc0.332.g42c0ae87b1-goog



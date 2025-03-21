Return-Path: <linux-usb+bounces-21997-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A0AA6BD52
	for <lists+linux-usb@lfdr.de>; Fri, 21 Mar 2025 15:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F1AD3BB420
	for <lists+linux-usb@lfdr.de>; Fri, 21 Mar 2025 14:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2161CDA3F;
	Fri, 21 Mar 2025 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Av5+AzJW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA4023BE
	for <linux-usb@vger.kernel.org>; Fri, 21 Mar 2025 14:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567906; cv=none; b=MZr7XRbkxHuDQiMG1tjpMzpfLXfymPmziRVSGmu2/VYN0h+xZxowxAr+rfx43eXLYBoBi0TSZK6e4xS9B9rtuo8xMVVgq72ZEJyeYTIr8P1fcDPFqZTam4tfop6o2eNaNrdJ3QeglWqLGdOYkIFtA8DrpZE3dTB3enveEIVNRTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567906; c=relaxed/simple;
	bh=gisHJZdHz+JMX9ST5mViBemlbmO1eiaA8Q3RPj+aTA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rSscM7koCQ1Oriyleiaj60EQnnSISekYjadgOQ4Z7yAJpjpqBmIx/HEQXZkEMcVqWEAtiHo1qm1Tj8lrs3V5W6uau8M8uHxpA3XTsJZ9qLA9vcXVM7PdrJTOZw1g0+ufKOaW2JYtyOuRDXXcxtu4rBEydF5D7rbIC9F5Oz3sbuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Av5+AzJW; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso349798566b.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Mar 2025 07:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742567903; x=1743172703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nfMbEI0Fx5sNu4XSqiwQsHxAfpsAHkFaA/RtV98dhKo=;
        b=Av5+AzJWFj3jTxVoLR6XQC4zSuXBe6nV6vzznprC0DV2cX2YDH7eU83DHqpLtCrYJx
         fYLEjKVuUS6Tu8+exPh3jDZl8niFDmc5riH19Al9AH2E6V7rSCbLx00x8TSvIVgIrZP4
         oQav60sJehQXr2TM/QwgebcJZe4gF6DzCD4+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567903; x=1743172703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfMbEI0Fx5sNu4XSqiwQsHxAfpsAHkFaA/RtV98dhKo=;
        b=lYn90+F637d7rGTqWleeLtB4K+f6fsXpOxey4+xLKYpg8mPoynhk/vcV0R9bHdaTf1
         G8tS6JH8R2L6R+FBYJolp010BGKjXwwolDI1UWedAqDAHRyzxjMQkkL6GinEGjDV6Aut
         HJZ+vSRLYkRAbu+pmfiFEnM6w4dDLS5HGtkKVx0vv4ds1kevYckKUvw3lA6KZtAwL/nt
         +UM52FLqhl1LlUAthJfj+7Pr7fy65T/VSgcd7RBV82T/5BaTXiPQly4T7nj+5iwF0DY1
         5Sg7N37ALqwBXXY38PGJnW0FlEj+oOI8vyev3dbxx2/pJLMZvbFULFs/Stt4d5aitOWb
         8UpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjhAfLCWiAc6yfMgxsZVcmJ6v0/uH2u8MmOhGz1iQuXKstmCpmriB+o+DxYgJk8f2E2U6NY0CkmEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaKMAvmICXWay2HwnT6C9sI2EqFq7lRPTTQ+HQg9j/wA6+SOI+
	PoP+Dd0MahcBMXFLJWE2B8IiugpXCpLpwPW7jSwsgRWnBNoQ1nZWmhtVOXicvNWG5XoOQ6UKd8x
	aCg==
X-Gm-Gg: ASbGncu28aDG5KI9s72Fgq9o1GPOIAtsXDtCJPnPlozngrHkb7VFm3f0UQ/uVRihZvo
	NDziV+Da1zmJrWt9o6gOHr1yCpHZ4AuS9vHSyUsMasl75FQbSPNVCt3KvbzUhq6Yp8IHBMRNjTH
	gdUelwOUHeS67Gvu5fLqR9PFXYxqqfmxsZMGsUn4Z0mkUUfyTBubcqI7bCq0F/7PeGisTGZWS+M
	Vgs6X76LRdhqHqJmqbITKzyz5n7KdGvcIE0AGGyTPro/pjPeyGBRaypiu6FhU4cH8NRu0cOfOB3
	Ye7J/VoAj2YUaa7gxkH9BAKnxeBIgo0zJ/f1vsOJl1pGcnvs1FReCmkTkdQ6+sU26IAr0461V1e
	A/yxahD+1KLNn4AKIX8DvjQS2NuZXSxa3xhY=
X-Google-Smtp-Source: AGHT+IFWADprdJ2vGFGhLSQej39m3rICpxH0t//Y7vxIg3aJUhiyEW/Hz3Z3rwURI57v3s7Rs/uJbw==
X-Received: by 2002:a17:906:7952:b0:ac2:c424:c316 with SMTP id a640c23a62f3a-ac3f25836b0mr386823066b.57.1742567903031;
        Fri, 21 Mar 2025 07:38:23 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d3d43sm165303566b.51.2025.03.21.07.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:38:22 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 0/2] Fix invalid pointer access
Date: Fri, 21 Mar 2025 14:37:25 +0000
Message-ID: <20250321143728.4092417-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches fix bugs in the USB Type-C class driver, addressing a NULL
pointer dereference and invalid pointer usage during partner
registration / unregistration.

1. The first patch resolves NULL pointer dereference resulting from a race
condition where the port driver and USB hub driver simultaneously invoke
typec_partner_unlink_device. The crash originated from dev->kdef.name being
NULL during the second unlinking process.

The crash log:
 BUG: kernel NULL pointer dereference, address: 0000000000000000
 CPU: 0 PID: 55688 Comm: kworker/0:2 Tainted: G U 6.6.56-05934
 Hardware name: Google Redrix/Redrix, BIOS Google_Redrix.14505.778.0
 Workqueue: events cros_typec_port_work [cros_ec_typec]
 RIP: 0010:strlen+0xb/0x20
 RSP: 0000:ffffbe400c5b3b90 EFLAGS: 00010202
 RAX: ffffffffffffffff RBX: 0000000000000000 RCX: 0000000000000000
 RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000000
 RBP: ffffbe400c5b3b90 R08: ffffa2a011187000 R09: ffffffff8d633a4d
 R10: 0000000000000000 R11: ffffffffc092a6b0 R12: ffffa29ff4d02990
 R13: ffffa29ff4d02d98 R14: 0000000000000000 R15: 0000000000000000
 FS:  0000000000000000(0000) GS:ffffa2a6df800000(0000) knlGS:00000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 0000000000000000 CR3: 0000000191cb0000 CR4: 0000000000750ef0
 Call Trace:
  <TASK>
  ? __die_body+0x68/0xb0
  ? page_fault_oops+0x379/0x3e0
  ? ep_poll_callback+0x132/0x260
  ? exc_page_fault+0x4f/0xa0
  ? asm_exc_page_fault+0x22/0x30
  ? __pfx_pmc_usb_mux_set+0x10/0x10 [intel_pmc_mux (HASH:1400 30)]
  ? kobject_uevent_env+0x13d/0x3c0
  ? strlen+0xb/0x20
  kernfs_name_hash+0x17/0x90
  kernfs_find_ns+0x3e/0xe0
  kernfs_remove_by_name_ns+0x47/0xb0
  typec_unregister_partner+0x4f/0xd0 [typec (HASH:1400 31)]
  cros_typec_remove_partner+0x19f/0x200 [cros_ec_typec (HASH:1400 32)]
  cros_typec_port_update+0x555/0x1690 [cros_ec_typec (HASH:1400 32)]
  ? snprintf+0xd0/0x640
  ? cros_ec_typec_event+0x2a/0x40 [cros_ec_typec (HASH:1400 32)]
  ? blocking_notifier_call_chain+0x73/0xf0
  cros_typec_port_work+0x34/0x60 [cros_ec_typec (HASH:1400 32)]
  worker_thread+0x395/0x940
  kthread+0xed/0x110
  ? __pfx_worker_thread+0x10/0x10
  ? __pfx_kthread+0x10/0x10
  ret_from_fork+0x38/0x50
  ? __pfx_kthread+0x10/0x10
  ret_from_fork_asm+0x1b/0x30
  </TASK>

2. The USB HUB driver's failure to notify the Type-C class driver about
device detachments resulted in typec_partner_detach() not being invoked.
This omission caused the port driver to retain a reference to a released
device, triggering a kernel WARNING upon unplug. Furthermore, when a new
device was connected, typec_register_partner() attempted to use an obsolete
port->usb3_dev pointer. The crash, occurring in typec_register_partner(),
is resolved in a second patch.

The WARNING log occurred during device unplug:
[534629.006366] kernfs: can not remove 'typec', no directory
 WARNING: CPU: 0 PID: 864020 at fs/kernfs/dir.c:1684
 kernfs_remove_by_name_ns+0x79/0xb0
 CPU: 0 PID: 864020 Comm: kworker/0:2 Tainted: G U 6.6.56-05934
 Hardware name: Google Screebo/Screebo, BIOS Google_Screebo.15709.185.0
 Workqueue: events cros_typec_port_work [cros_ec_typec]
 RIP: 0010:kernfs_remove_by_name_ns+0x79/0xb0
 Call Trace:
  <TASK>
  ? __warn+0xca/0x1c0
  ? kernfs_remove_by_name_ns+0x79/0xb0
  ? report_bug+0x14e/0x1f0
  ? handle_bug+0x41/0x70
  ? exc_invalid_op+0x1b/0x50
  ? asm_exc_invalid_op+0x16/0x20
  ? kernfs_remove_by_name_ns+0x79/0xb0
  typec_unregister_partner+0x5e/0xd0 [typec (HASH:1400 25)]
  cros_typec_remove_partner+0x19f/0x200 [cros_ec_typec (HASH:1400 26)]
  cros_typec_port_update+0x4a0/0x12a0 [cros_ec_typec (HASH:1400 26)]
  ? cros_usbpd_charger_ec_command+0x20/0xd0
  ? __queue_work+0x3f4/0x520
  ? queue_work_on+0x6a/0x80
  ? cros_ec_typec_event+0x2a/0x40 [cros_ec_typec (HASH:1400 26)]
  ? blocking_notifier_call_chain+0xce/0xf0
  cros_typec_port_work+0x34/0x60 [cros_ec_typec (HASH:1400 26)]
  process_scheduled_works+0x299/0x490
  worker_thread+0x2d7/0x3b0

The crash log occurred during the subsequent plug:
[536103.301256] BUG: kernel NULL pointer dereference,
 address: 000000000000050b
 Oops: 0000 [#1] PREEMPT SMP NOPTI
 CPU: 0 PID: 864020 Comm: kworker/0:2 Tainted: G U 6.6.56-05934
 Hardware name: Google Screebo/Screebo, BIOS Google_Screebo.15709.185.0
 Workqueue: events cros_typec_port_work [cros_ec_typec]
 RIP: 0010:kernfs_new_node+0x1b/0x80
 RSP: 0018:ffffbd318c433bd8 EFLAGS: 00010246
 RAX: 0000000000000004 RBX: 0000000000000498 RCX: 000000000000a1ff
 RDX: ffffffffc0a3b435 RSI: ffffffffc0a3b435 RDI: 0000000000000498
 RBP: ffffbd318c433be0 R08: 0000000000000000 R09: 0000000000000000
 R10: 0000000000000000 R11: ffffffffa61156d0 R12: ffff9e573ad2d400
 R13: ffff9e5653c47e10 R14: 0000000000000498 R15: 0000000000000498
 FS:  0000000000000000(0000) GS:ffff9e5d5fe00000(0000) knlGS:00000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 000000000000050b CR3: 00000002ea838003 CR4: 0000000000770ef0
 DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
 DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
 Call Trace:
  <TASK>
  ? __die_body+0x68/0xb0
  ? page_fault_oops+0x379/0x3e0
  ? exc_page_fault+0x4f/0xa0
  ? asm_exc_page_fault+0x22/0x30
  ? __pfx_klist_class_dev_get+0x10/0x10
  ? kernfs_new_node+0x1b/0x80
  kernfs_create_link+0x3d/0xa0
  sysfs_do_create_link_sd+0x68/0xd0
  typec_register_partner+0x12f/0x220 [typec (HASH:1400 25)]
  cros_typec_port_update+0x5dc/0x12a0 [cros_ec_typec (HASH:1400 26)]
  ? cros_usbpd_charger_ec_command+0x20/0xd0
  ? __queue_work+0x3f4/0x520
  ? cros_ec_typec_event+0x2a/0x40 [cros_ec_typec (HASH:1400 26)]
  ? blocking_notifier_call_chain+0xce/0xf0
  cros_typec_port_work+0x34/0x60 [cros_ec_typec (HASH:1400 26)]
  process_scheduled_works+0x299/0x490
  worker_thread+0x2d7/0x3b0
  kthread+0xed/0x110
  ? __pfx_worker_thread+0x10/0x10
  ? __pfx_kthread+0x10/0x10
  ret_from_fork+0x38/0x50
  ? __pfx_kthread+0x10/0x10
  ret_from_fork_asm+0x1b/0x30
  </TASK>

Andrei Kuchynski (2):
  usb: typec: class: Fix NULL pointer access
  usb: typec: class: Invalidate USB device pointers on partner
    unregistration

 drivers/usb/typec/class.c | 23 +++++++++++++++++++----
 drivers/usb/typec/class.h |  1 +
 2 files changed, 20 insertions(+), 4 deletions(-)

-- 
2.49.0.395.g12beb8f557-goog



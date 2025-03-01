Return-Path: <linux-usb+bounces-21228-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDC0A4A9A1
	for <lists+linux-usb@lfdr.de>; Sat,  1 Mar 2025 09:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC4EB7A9B34
	for <lists+linux-usb@lfdr.de>; Sat,  1 Mar 2025 08:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43911D514B;
	Sat,  1 Mar 2025 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z/eZcQgN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7351C1AB4
	for <linux-usb@vger.kernel.org>; Sat,  1 Mar 2025 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740816679; cv=none; b=chgLOHqE7Sa8787LFBw9u6g9WYRTf2RAzhjio1tzPNRJNqxGmSVC1wXINy6UpkLwoXWcUQR7ggFFUxcd0UepV0ORm8JPEyXPiXMUkkHF+IPOMczFZhw0sl2wXhtaN7HiRkjtXA5RB4GS2aC8wweg4ZnqwusFWKhBpmY5AUGvmn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740816679; c=relaxed/simple;
	bh=y/PM0okwX0Ed7bixbKlSzQClxakMqEJ6aJ39DwnMPLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jN0Lc3TVq9blie4riY0btsyHdorLa0SE74TUlzSbpV81QAsUSGNS8Sq3sYato3oiiq97xfdu/2/Ai/oNqkx+LqGarKhwoy5bl2mjThPbCpeFZh/HXd7wul40c6jHJN84Bh/h4lvF1auxNLwzAd3yaM3c7o6AZFiXQqKisME6eCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z/eZcQgN; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so4994191a12.2
        for <linux-usb@vger.kernel.org>; Sat, 01 Mar 2025 00:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740816674; x=1741421474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mjLt20YjMampy8+UMdDtqCZbrxv2nFX7rkyDyefUrns=;
        b=Z/eZcQgNQ097JWDwDqvnIci2SU/Ku4BgxnoJkBBQjIzVy0QMKo+UMg4MFQSnqc3rVe
         o02JAbEtx47BJbwGvMDtR/7FSnaKBI7YBNAJktnkeZoH8/OuZijzJ67P4G2SxasxO3Oe
         KdGfEeM45IhIKsKmWXwZN3akgVehXALkSDkNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740816674; x=1741421474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjLt20YjMampy8+UMdDtqCZbrxv2nFX7rkyDyefUrns=;
        b=qkLy6z98mNx7AFDG6VdJPMTxICdiM3ye8NxnWPOcS4PGsU2JXD/qCYJnm8lx60LRfw
         A0Hj2JDJEGLEps94aeYZNsDJswygBe7weTROImqBrnUhEdY1a5f648UD8N920HhjQ5hy
         1sjCMXadWr4uE4IpXkl55RvIV16ja3rjqUSHCdeL+hW7tCQWWQZlIc7AIvHYoG/kjT1S
         g1yPW4hfsNTJTNXkAILwu5FQQan7s2CDU5XjOhlWS3dvqFI/sMTtF27FPgkLRO0abBi5
         xEi+M7CUAc+QpOSSMocLO1NQZKgYNF6eggFplNimgY9e+6w2lMBSOEQ/qfKuKGy31bKm
         DARg==
X-Forwarded-Encrypted: i=1; AJvYcCVmUDsN0w1dP5S7aOfBAPBW42pkkVYHUGVTAgsSBxEpfzN+G+ei6HC7cZoKWbysCelpY9MxLiDbYUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIT99tu0tBZ++Cq+zl6gtP9ZnmfScarG3rgqERwVXTuHslAUoc
	MzQ4SaOJeih6kORKC+svJiZ1hD+hrez/ksePGmKig7YICpm5+FEKquzBTEZF/A==
X-Gm-Gg: ASbGncvE5c75beqyhOKfMfDaRXw6hJ0JZEcPF5geW/0xIz3kat4Iko9tm3HKBzxPLiq
	y8hSMP86bHRr+W2ni/NtqIWzuhjTUTYBbLLt5jmBWEkfuvtP9dUOBCTiB/jH8iSFwjNJlpGVOij
	7ZoLahppsn0ZXtnocYM2TjHNM+MjMhGRdo/dNWuppCMjh4YvUAlxffFLfKrVjC3PvVsdbbtR6KM
	NTO+p+HVRuCQh0Xhm9a0iK2yHe1DIVfyDFgLNWPotqZrCuuCK7sb6NGQyeOrGThbaP512cm35tG
	Ocoy7fYGW4axCOfoBvD218F2OLpKhsmO7IV24R4dHjw8ImeLEo0uv930uuNtVJgAN1Qp1SLR4qc
	EIGCg3M+qrSFu8vu91v1vSr0eYt1Q33fS/P4=
X-Google-Smtp-Source: AGHT+IFWGjTqEOE7iDv+KUg8YX7v2GdNhxUdYlf7Mvz5UaXeO7udGrcXIKLthgLSbZd5OCdVON4QnQ==
X-Received: by 2002:a05:6402:5214:b0:5e4:d192:2373 with SMTP id 4fb4d7f45d1cf-5e4d6af23a4mr6484482a12.10.1740816673887;
        Sat, 01 Mar 2025 00:11:13 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b4aa5dsm3693641a12.14.2025.03.01.00.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 00:11:12 -0800 (PST)
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
Subject: [PATCH 0/1] Fix race condition causing NULL pointer dereference
Date: Sat,  1 Mar 2025 08:10:55 +0000
Message-ID: <20250301081057.1952519-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.48.1.711.g2feabab25a-goog



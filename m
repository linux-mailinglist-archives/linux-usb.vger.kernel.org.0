Return-Path: <linux-usb+bounces-32342-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF73D20DD3
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 19:40:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7989301618F
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 18:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360E33346A2;
	Wed, 14 Jan 2026 18:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9uKoYII"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2937C303A18
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 18:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768416039; cv=none; b=l5cGzjZu/3UF6dhBWs3hYhI0mzPnOjx4JfB7ZIVoAf9VIBWsRd6/dKXdKJyNxkoA8eIfh/i0xQJbXpCcMQbcPVzQxZ4L7GyZ24LbsaPBhq1FvmmZBEvUTndweibAabiA5HS+3eKj+iKvgonwPuzgdt60IEXPBhXQueOlz/j4lzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768416039; c=relaxed/simple;
	bh=gIkLV+3FI+9dZKIY8vmxAnUjUtjc/p76UJ4h1b/KoXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mfLh876TgnC9pXSRZxPomj0Ky5Ox+DnRA10TBLN5VbqjWLTmEaw8EZSZvHQ6cUuGyniJWsZF/aARtWM39KeKMrc/B5k5SVzsKYW0Zk831gqFeIEsosHkvpxbFwmWxgVpmni774cM5aq2NwxWjrT5dAUIsH2OaXbCfUK62gsNVgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9uKoYII; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-382fa0dc9f4so936411fa.3
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 10:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768416036; x=1769020836; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lBn8g7AHhTvzdGXVwrOL6JsNt3dO9sitmYqcNNqbO8k=;
        b=k9uKoYIITpgpgRPY2HKPQ7pWmAv6NvTNAP1wxJkDtEalxC3Hao8maMh/hPz6xuc1If
         5HA6WxEo4fAv9sjpZpFoSAyRk9NVvvyJkKNCWRxhkD8nBGqpDm3YJcaOodYxO7ZNHqco
         orBe+Qni3HWnnPyoPy7rN9KsndDNoZyuLpK4G5NjR4jG+BhQCUG5eKH34hZlIAqifYXL
         UdrXc9MGKAiKcE9sSe2uZxqOhQSTS8G896CTsg0sSZwg2c11IG5q+gFXBQRBw2gwg7Jd
         9yI/lFw+WidCzS3Xah/MjxfAoKrYacU0LfOQx58YCsJUDO+fJlE+nFox39E92gQTjKZy
         4AYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768416036; x=1769020836;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBn8g7AHhTvzdGXVwrOL6JsNt3dO9sitmYqcNNqbO8k=;
        b=Xq44r0Os24BA9NtNgaGjThNWAfxVbXZ5IZwXI3nTbUutuOB/kNCQjxOAV6EOCQgN3E
         CMfIksKe9d1kSgnYdQRc97YleyXSOa2ARsf+OVDnO8daBL34KGbcWNfr/zliDGJRkrK8
         Xx9mci/tz7dQEd4a4dcaaJYJMdnq0b4j6TRuuiBMoYnTnTIrni8GUuNebHJF7uSgrrKL
         VIyGZrrVpybnylRSPlzv1759mQQzycO8TejVyf0HQ/CoOnC5fY9wk7lZDl7LinbNvewS
         IS9w8xELCpqMyIw0nD4cQGmn3xdl/w/fh1oRGtQ0/D0foxiXUKA1vAG4oLIlP/PtO4If
         3x5Q==
X-Gm-Message-State: AOJu0YxByluNTqiairl8eg/dPL+k61i6W2Zz8ZMl3beyjvyG5xvRL0Fn
	YC0xz5/lRDfShwId+Mbp+ENontlreoDvtgvpel8bScLDAdyZyzCe6ZkScK7dzsgrEYA=
X-Gm-Gg: AY/fxX4qmUijhTqQmn1v6xTk1Iv00E+KDVL/8GMrpnACFNG0LBhUU53DkXfcW+75C0u
	hv0kbZz4zeC3zpdnMdE/yjkeScg6lBmvr7iLTPB7CYKeuGliYDxKnRS7VwvwqAJRjcuRyzNSSGi
	XL/8hy0KQi2/0C7XUFXu8DQkL4o27EjrNgng7gVU3F4CadAi0RacNJr14qxnt8LRP5KJfp00A/O
	A/eVlsaF2+fwDuEgD8nxhrclybfYWVNfNctxJoTySYc3BvhzECZ/nbhADsEsXDHcjGL8rXkUYTA
	M8Tgxw5hLBNjdv3RKUdweEKlL+2PY3YKOOmD9GPbALKoWnXGHXOfTveLBbsBRTKk54NvcmKkzWi
	34emt1easRZU1P/o9n957Nh0fKO53kBYQ6qggfP2DnuHJbl4ch8O6hq9WAqHrrzARzwJ2fIwWR0
	x2veGZUdswCfrN3gI/QXRwX1mCJeguEiuPVyUpH5aj1hAg
X-Received: by 2002:a05:600c:1c20:b0:47e:e712:aa88 with SMTP id 5b1f17b1804b1-47ee712ac96mr1739685e9.31.1768409936259;
        Wed, 14 Jan 2026 08:58:56 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428f1ba7sm1108765e9.15.2026.01.14.08.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 08:58:55 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 39487BE2EE7; Wed, 14 Jan 2026 17:58:54 +0100 (CET)
Date: Wed, 14 Jan 2026 17:58:54 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, pdormeau@free.fr
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	1123987@bugs.debian.org
Subject: UBSAN: array-index-out-of-bounds in
 [...]drivers/usb/typec/ucsi/ucsi.c:605:12: index 2 is out of range for type
 'ucsi_altmode [2]'
Message-ID: <176840984804.2144647.10736984532804520381@eldamar.lan>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Control: forwarded -1 https://lore.kernel.org/lkml/176840984804.2144647.10736984532804520381@eldamar.lan
Hi

Pascal reported in Debian in https://bugs.debian.org/1123987 a problem
catched by UBSAN in drivers/usb/typec/ucsi/ucsi.c:

[  +1,022859] ------------[ cut here ]------------
[  +0,000008] UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.13/drivers/usb/typec/ucsi/ucsi.c:605:12
[  +0,001186] index 2 is out of range for type 'ucsi_altmode [2]'
[  +0,000578] CPU: 10 UID: 0 PID: 275 Comm: kworker/10:1 Not tainted 6.17.13+deb14-amd64 #1 PREEMPT(lazy)  Debian 6.17.13-1
[  +0,000005] Hardware name: LENOVO 83J3/LNVNB161216, BIOS PYCN30WW 11/17/2025
[  +0,000002] Workqueue: events_long ucsi_init_work [typec_ucsi]
[  +0,000010] Call Trace:
[  +0,000003]  <TASK>
[  +0,000003]  dump_stack_lvl+0x5d/0x80
[  +0,000007]  ubsan_epilogue+0x5/0x2b
[  +0,000005]  __ubsan_handle_out_of_bounds.cold+0x54/0x59
[  +0,000007]  ucsi_register_altmodes+0x214/0x250 [typec_ucsi]
[  +0,000007]  ucsi_check_altmodes+0x1b/0xa0 [typec_ucsi]
[  +0,000004]  ucsi_init_work+0x919/0x9b0 [typec_ucsi]
[  +0,000005]  process_one_work+0x192/0x350
[  +0,000006]  worker_thread+0x25a/0x3a0
[  +0,000004]  ? __pfx_worker_thread+0x10/0x10
[  +0,000003]  kthread+0xfc/0x240
[  +0,000003]  ? __pfx_kthread+0x10/0x10
[  +0,000002]  ? __pfx_kthread+0x10/0x10
[  +0,000002]  ret_from_fork+0x197/0x1c0
[  +0,000005]  ? __pfx_kthread+0x10/0x10
[  +0,000002]  ret_from_fork_asm+0x1a/0x30
[  +0,000008]  </TASK>
[  +0,000001] ---[ end trace ]---
[  +0,000006] ------------[ cut here ]------------
[  +0,000002] UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.13/drivers/usb/typec/ucsi/ucsi.c:609:18
[  +0,000579] index 2 is out of range for type 'ucsi_altmode [2]'
[  +0,000562] CPU: 10 UID: 0 PID: 275 Comm: kworker/10:1 Not tainted 6.17.13+deb14-amd64 #1 PREEMPT(lazy)  Debian 6.17.13-1
[  +0,000003] Hardware name: LENOVO 83J3/LNVNB161216, BIOS PYCN30WW 11/17/2025
[  +0,000001] Workqueue: events_long ucsi_init_work [typec_ucsi]
[  +0,000005] Call Trace:
[  +0,000001]  <TASK>
[  +0,000001]  dump_stack_lvl+0x5d/0x80
[  +0,000004]  ubsan_epilogue+0x5/0x2b
[  +0,000003]  __ubsan_handle_out_of_bounds.cold+0x54/0x59
[  +0,000005]  ucsi_register_altmodes+0x233/0x250 [typec_ucsi]
[  +0,000006]  ucsi_check_altmodes+0x1b/0xa0 [typec_ucsi]
[  +0,000004]  ucsi_init_work+0x919/0x9b0 [typec_ucsi]
[  +0,000005]  process_one_work+0x192/0x350
[  +0,000004]  worker_thread+0x25a/0x3a0
[  +0,000004]  ? __pfx_worker_thread+0x10/0x10
[  +0,000003]  kthread+0xfc/0x240
[  +0,000002]  ? __pfx_kthread+0x10/0x10
[  +0,000002]  ? __pfx_kthread+0x10/0x10
[  +0,000003]  ret_from_fork+0x197/0x1c0
[  +0,000003]  ? __pfx_kthread+0x10/0x10
[  +0,000002]  ret_from_fork_asm+0x1a/0x30
[  +0,000006]  </TASK>
[  +0,000001] ---[ end trace ]---
[  +0,000006] ------------[ cut here ]------------
[  +0,000001] UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.13/drivers/usb/typec/ucsi/ucsi.c:610:19
[  +0,000608] index 2 is out of range for type 'ucsi_altmode [2]'
[  +0,000597] CPU: 10 UID: 0 PID: 275 Comm: kworker/10:1 Not tainted 6.17.13+deb14-amd64 #1 PREEMPT(lazy)  Debian 6.17.13-1
[  +0,000003] Hardware name: LENOVO 83J3/LNVNB161216, BIOS PYCN30WW 11/17/2025
[  +0,000001] Workqueue: events_long ucsi_init_work [typec_ucsi]
[  +0,000004] Call Trace:
[  +0,000002]  <TASK>
[  +0,000001]  dump_stack_lvl+0x5d/0x80
[  +0,000004]  ubsan_epilogue+0x5/0x2b
[  +0,000003]  __ubsan_handle_out_of_bounds.cold+0x54/0x59
[  +0,000004]  ucsi_register_altmodes+0x1fa/0x250 [typec_ucsi]
[  +0,000006]  ucsi_check_altmodes+0x1b/0xa0 [typec_ucsi]
[  +0,000004]  ucsi_init_work+0x919/0x9b0 [typec_ucsi]
[  +0,000006]  process_one_work+0x192/0x350
[  +0,000004]  worker_thread+0x25a/0x3a0
[  +0,000003]  ? __pfx_worker_thread+0x10/0x10
[  +0,000003]  kthread+0xfc/0x240
[  +0,000002]  ? __pfx_kthread+0x10/0x10
[  +0,000002]  ? __pfx_kthread+0x10/0x10
[  +0,000003]  ret_from_fork+0x197/0x1c0
[  +0,000003]  ? __pfx_kthread+0x10/0x10
[  +0,000002]  ret_from_fork_asm+0x1a/0x30
[  +0,000006]  </TASK>
[  +0,000001] ---[ end trace ]---

While I initially asked if Pascal can check as well mainline additionally to
the tested 6.18.2 version, the problematic code seems still present, so I'm
forwarding it now.

Regards,
Salvatore


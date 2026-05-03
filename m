Return-Path: <linux-usb+bounces-36863-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xj+mNljZ92nymwIAu9opvQ
	(envelope-from <linux-usb+bounces-36863-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 01:25:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6649E4B7BF4
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 01:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E9577300289A
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2026 23:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FF53AD537;
	Sun,  3 May 2026 23:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="OJjaYYX8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC1F39A7FA
	for <linux-usb@vger.kernel.org>; Sun,  3 May 2026 23:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777850706; cv=none; b=LA1IDgDbiVQWqkTrRqDviXmYjVHYS0s8gvGW44BRHg+nnNCF/v5BQ/7lhmlGz9eP/B/t+qp1g5Nx8Ng8bPo4lEKaSh/1LajXMHDC4HfFGGT5kmmwo24WOPMHxhfBeRlZctoqLibc6WT0N9pD+fBWzveFh0dmtLbmYIfuDrxeYQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777850706; c=relaxed/simple;
	bh=d01B8LShpZopRX/WJuuJstXQwYhQkCzyMtrlgUno6wI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oW7cGJY0+u0FRet7k5LMe3NTei7FK9JKPie6D5O3RiMeC4CCcq9zkYjzUr9xhVtcM6m1A0uQfgpnFtzoAw5u/tegcl8qqal9KM5Jmclhqaaa9Mn0X8rSht20d4jQZVe/Cf6i82JriCtVspL7FbLUBL9LS/ggM5hYMaeo5Oei3vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=OJjaYYX8; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12e332315a8so3250559c88.0
        for <linux-usb@vger.kernel.org>; Sun, 03 May 2026 16:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1777850704; x=1778455504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ax3qBoj3hACv7uQlIcEpF9h/jT4uELUm1wlMI6OoZdw=;
        b=OJjaYYX8SjOn/HFCb41r/xGH9OLufIMw3Smvb5cRm/zr7rbgJUz8+TYeMb08nx9M4x
         joQRkLUovbsJb9ePC9F3CEoovdzqjRiRyGdLw1n4L5+zMwMT6iWc3fVEWQyK+UfZVEx9
         zH1Fosemd7/ErQEaBH5W+TZ48qR/RY0JUNhD6kBkq+EjTEWk9AFxi18f0h+j1so4lCfR
         siNtaSEiK6VHExPcc+8irMBAartoMRP1EOtJLaL/0ytKqj5J4lEVVwAqnWOS8yOWRA9J
         q3kPohAz6iWWpR2EhkIW6f7HpEhfWLNv8UjO1Zo/dRRaFMK+LLJ5pHDULVYYHrL5CLWu
         lo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777850704; x=1778455504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ax3qBoj3hACv7uQlIcEpF9h/jT4uELUm1wlMI6OoZdw=;
        b=FFFPFC33wyZG/xCtw+MfhLxRVLUk00GTilvhdRdV/FWzkZ9HHDxDe6GBMmXVGq1bXc
         zeuywt3/8QvWu0r8QGbIMtiBXpwnjGuGg+8LjkxdHfL8nffFVNGt6Dmi6+hSPk2xc+d9
         Flp0uz5dedwoRftYAunaVJYflBSsth05Wb+wudVwvHAeNdFsIQps8eo8VWzPCLzdTLu5
         mnRa40fhDBN0gtV3k+4q9Z5XKILMWe8ToqDfwBNRWRQZysxm+ZwImQLuzEHm35BPTDZo
         DDs+dqKWWZvRUYn3sFpFAH1y3gTUZcsynmNOAwnhMTTARyBux1jz1jzp8gG9oNpVdMo2
         UqMg==
X-Forwarded-Encrypted: i=1; AFNElJ86ZqemMMgVoD5QLT9YL/RmBsp4V2GTU3Y6zdzMym+wWDO+cmKDq086rOFeLSTVY4hh7Qlm/Gij+yU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVGqQF4XUYYrq9/DPCzF6CtfVVrm9TFLtbko+f6b9PXoD1t/ZT
	I9Q+LDYa46neV10qHfNRT/1AR/zbshRnWIEiJshu9uFN9FxwAnAL86J86A/MbWJuMQ==
X-Gm-Gg: AeBDieuA1fmSixq7bLrJfPkrqlSKyyEkqJTKL08Flb+Q9+nNvzRLYiQgKXGR4JIKPGW
	TPNB4pnyyJQ5o8yFII44joLwgSIHMyTY9/agITYr7FlS2HqQYa4HTGY2/kzM40EKRvyKMPigA2A
	pt6gPdUSUJeS7b7fYkx/nl326+FHze693eWhDSFT+0PPCOEvUmGCxoyyr6N1zwdEulJV7X1QoA7
	8gVRvjrr6Umx2I/HTWR8G3Z/D38WHVAK38I9n4y7yrkOf/vAEFv5R3kSiRRW+8cmr2CFe2ib0aM
	LAtBK0fDnQvk8AADaGfANUoVXJvhNdJdHQNTVxjKEnzn6MbyeSGVC79ShB6qHctKpEA2e/abLDZ
	jSofQJaKTk7OxovdaHQ+0x+L695p5/MU0jIComkvVX6ftoKjylxhjEI2e7g8DEk4mLr7SdOdy8G
	TyYcrbpYHU4cSB6NDJ/3iy6x80d3nadCCpayFADju09RRT2avlXYt2NarEttGyJ1YUYxFHq+9zb
	qKHMKdBUg==
X-Received: by 2002:a05:7022:497:b0:12a:6fb7:87e3 with SMTP id a92af1059eb24-12dfd83f546mr3462600c88.31.1777850703242;
        Sun, 03 May 2026 16:25:03 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8278e7dsm12432465c88.2.2026.05.03.16.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 16:25:02 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	JP Hein <jp@jphein.com>
Subject: [PATCH v8 0/2] media: uvcvideo: Quirks for Razer Kiyo Pro firmware lockup
Date: Sun,  3 May 2026 16:24:59 -0700
Message-ID: <20260503232501.302335-1-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331003806.212565-1-jp@jphein.com>
References: <20260331003806.212565-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6649E4B7BF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,gmail.com,linux.intel.com,jphein.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36863-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jphein.com:dkim,jphein.com:mid,stress-test-kiyo.sh:url,dmesg.post:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

The Razer Kiyo Pro (1532:0e05) firmware has multiple lockup paths that
cascade into xHCI host controller death, disconnecting every USB device
on the bus -- including keyboard and mouse, requiring a hard reboot.

The bug has two layers:

* Trigger (device firmware -- Sigmastar SAV630D + AIT camera, fw 1.5.0.1
  / bcdDevice 8.21). Three failure paths:

  - LPM / autosuspend resume: device fails to reinitialize after a USB
    Link Power Management transition, returning EPIPE on the first
    UVC SET_CUR. Mitigated by USB_QUIRK_NO_LPM (patch 1 of the
    original 3-patch series, merged by Greg Kroah-Hartman, backported
    to stable 6.1, 6.6, 6.12, 6.18, and 6.19).
  - Rapid control transfers: sustained UVC control operations overwhelm
    the firmware, causing endpoint stalls. Mitigated by
    UVC_QUIRK_CTRL_THROTTLE (this series).
  - USB descriptor spec violation: SuperSpeed Endpoint Companion
    descriptor for EP5 IN (interrupt) declares wBytesPerInterval=8 but
    wMaxPacketSize=64. xHCI derives max_esit_payload from the former,
    underallocating bandwidth and producing spurious COMP_SHORT_PACKET
    events under load.

* Cascade (host controller). Firmware lockup or stalled endpoint
  cascades to xhci_hc_died(). Severity is silicon-dependent: per Michal
  Pecio's reports on linux-usb, ASMedia hosts hit hc_died in seconds
  under both the dual-cancel and SHORT_PACKET-flood paths. Intel Cannon
  Lake (this series tested) survives the cancel/resubmit and stream-mmap
  teardown reproducers clean.

This series addresses trigger #2 only. Trigger #1 is already mitigated
upstream. Trigger #3 is a host-side bandwidth-allocation concern;
Michal Pecio is prototyping an xhci ring patch (clamp max_esit_payload
+ retry on COMP_SHORT_PACKET) on linux-usb. The two efforts are
complementary: this series prevents the firmware from getting into the
locked state that triggers the cascade; Michal's patch makes the host
side more resilient when the firmware does lock up.

Why kernel-side mitigation is the only viable path: we attempted a
firmware fix. The wBytesPerInterval bug byte is at offset 0x1F570A in
the raw firmware image distributed with Razer's Windows updater. We
reverse-engineered the UVC Extension Unit flash protocol the updater
uses (XU6 selector 3, 32-byte chunks, status 0x82 = success) and
implemented a Linux flash tool. The device acknowledges writes and
reports burn-complete but does not persist after power cycle. The
ROM-boot recovery entry path is locked out in production firmware.
There is no userspace path to fix the bug on shipped devices.
Forensics: firmware-analysis/ in the linked repository.

This v8 series covers the remaining two UVC patches:

Patch 1/2: UVC driver -- introduce UVC_QUIRK_CTRL_THROTTLE to rate-limit
  all USB control transfers (50ms minimum interval) in
  __uvc_query_ctrl(). The 50ms threshold is the minimum that empirically
  prevents firmware overflow, 4x shorter than USB_QUIRK_DELAY_CTRL_MSG's
  200ms and scoped specifically to UVC. Quirk is opt-in by device-table
  entry; non-quirked devices are unaffected.

Patch 2/2: UVC driver -- add Razer Kiyo Pro device table entry with
  UVC_QUIRK_CTRL_THROTTLE, UVC_QUIRK_DISABLE_AUTOSUSPEND, and
  UVC_QUIRK_NO_RESET_RESUME. CTRL_THROTTLE rate-limits the rapid-SET_CUR
  trigger (verified via stress test, see results below). The other two
  cover related failure paths in line with patterns established for
  similar fragile UVC firmware (Insta360 Link, Logitech Rally Bar).

Test results:

* stress-test-kiyo.sh (rapid SET_CUR flood, ~25 controls per round):
  - stock kernel + stock uvcvideo, no quirks: hc_died at round ~25
  - with UVC_QUIRK_CTRL_THROTTLE active: 500+ rounds clean

* Michal Pecio's hammerint (libusb submit/cancel on EP 0x85 IN), Intel
  Cannon Lake, 60s x 2 Kiyos:
  - 413,738 and 416,350 cycles respectively, both timed out cleanly.
    No xhci_hc_died, no "event condition 198", no command timeouts.
    NO_LPM was active that boot but inert at this rate (~6900 cycles/sec
    leaves no idle time for LPM transitions).

* stream-mmap loop (v4l2-ctl open / format / stream / close), Intel
  Cannon Lake, 300s x 2 Kiyos at MJPG 1920x1080 @ 30fps, no quirks
  active:
  - 134 and 92 cycles respectively, both clean. No fatal patterns in
    dmesg.post.

Cross-platform corroboration: the same v4l2-ctl focus_absolute
reproducer is reported on Linux ARM (Raspberry Pi), Windows, and macOS
by independent users. Refs in kernel-patches/upstream-report.md
section "Third-Party Reproduction Evidence".

Changes since v7:
  - Reframed scope: this series mitigates the firmware-lockup trigger,
    not the xHCI cascade. The cascade is silicon-dependent and is
    being addressed separately by Michal Pecio's xhci ring patch on
    linux-usb.
  - Added test data: hammerint and stream-mmap loop on Intel Cannon
    Lake, both clean (~414K/416K cycles per Kiyo over 60s and
    134/92 cycles per Kiyo over 300s respectively).
  - Added firmware reverse-engineering note: bug byte located at
    0x1F570A in fwimage.bin, UVC XU flash protocol implemented, no
    userspace path to persist firmware fixes on shipped devices.
  - Cross-platform corroboration cited.
  - No code changes from v7. v8 is a re-send to integrate post-v7
    discussion on the v5 2/3 chain.

Changes since v6:
  - Dropped error-code query skip after EPIPE (Ricardo Ribalda)
  - Included full lsusb -vv in patch 2/2 commit message (Ricardo Ribalda)

Changes since v5:
  - Moved throttle from uvc_query_ctrl() to __uvc_query_ctrl() so all
    callers are covered (Ricardo Ribalda)
  - Throttle applies to all query types, not just SET_CUR (Ricardo
    Ribalda)

Tested on:
  - Kernel: 6.17.0-20-generic (Ubuntu 24.04 HWE), 6.17.0-xhci-test
    (with Michal Pecio's max_esit_payload + COMP_SHORT_PACKET retry),
    6.8.0-106-generic
  - Hardware: Intel Cannon Lake PCH xHCI (8086:a36d)
  - Device: Two Razer Kiyo Pro units (1532:0e05), firmware 1.5.0.1
    (bcdDevice 8.21)

Reproducers and full debug logs:
  https://github.com/jphein/kiyo-xhci-fix
  - kernel-patches/stress-test-kiyo.sh
  - kernel-patches/matrix/michal-tests/hammerint.c
    (Michal Pecio's, alongside the harness)
  - kernel-patches/matrix/michal-tests/stream-loop.sh

JP Hein (2):
  media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile USB firmware
  media: uvcvideo: add Razer Kiyo Pro to device info table

 drivers/media/usb/uvc/uvc_driver.c | 16 ++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  | 20 ++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  3 +++
 3 files changed, 39 insertions(+)

--
2.43.0


Return-Path: <linux-usb+bounces-36084-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AsdAlhZ12lqMwgAu9opvQ
	(envelope-from <linux-usb+bounces-36084-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 09:46:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FBC3C7358
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 09:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 647F830515EB
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 07:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECDB3806C2;
	Thu,  9 Apr 2026 07:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="kgDlSdY1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3283637D131
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 07:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720663; cv=none; b=ScoXGnxa5uWvxWEURhz9PMhdzeiLKP43rNaHRLr8y5mb817OsKFJ9b8QtkiUu0LldbxiT4U/gMaEhT3lOeUI8Dp5Pue3No5zTPxBqnCEnQlMkRCbkNp1eZcWgpc+DuIjQFB/CJaLa2giaWkc2kBk67v0PgseggW37pRdHx+BUes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720663; c=relaxed/simple;
	bh=UceDUxbj39VIyLOljIKZQz5Zivv141yWASgZkCD7G34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmX4vNq2En/ttOMBkRfzVq5IpGkrbpbBZem1lP5K0F9f3NRXrjxPtzpAFn1v9xRcN8UH68aGO9z+mJ6aiVaOYLW4Dw9ixXxwmI6VMUvEkPfcpzJF6SLKuNVecY5/KiFNaPTJBrP1Ph2IB8FlDEcJToTTTfCk6kbE3+rpkUD8kb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=kgDlSdY1; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1271257ae53so7582807c88.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2026 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775720661; x=1776325461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELuTqBhnkDSZI0fi8C1chvAelXix4ySX6h2QqrIkrPo=;
        b=kgDlSdY1mP/R6rTkfzLmgwiEvFM+nSFzxJTm3w7tU2Av2wrfQQWJCw1GjvDHCyxu1y
         YjivBdB5bpEjE2FvEnw1qJUskbaaK3Q8NtbLTP856wXYMNbPgfiJdyg376jEU1avwyIF
         6Z+9mdPUq3Aye4eFMuwCzZ6ttT/KbTRj0ar24Jug5CNF9v8ccSQ63HGvekSJ5g5r1BwS
         bMNTUBibBhgQuCMFCaELHcUyW+3Szsc6LW2qMtMGdeLZB6Z6O9ARrNamd5Wv9gIgfGPM
         PV1Y3YbA1Yw5SMRVdqhANvxe91c6or0m9wqVXnvLbOyxcYU3Ml7E+5CoHntHdw+NEwQA
         IBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720661; x=1776325461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ELuTqBhnkDSZI0fi8C1chvAelXix4ySX6h2QqrIkrPo=;
        b=GhK5TsVkIcN2RiuOTmLlMM8h43j9rq60/rUmd6fOge/TmQfUWDwpQbXxHK6rxhfJdW
         rWI82+mF3JF7D9ZvzqrCAqmcJuLgN7z8aftUygVUw42u2Uc0/gvem3YLkkDzsI0ledKq
         zK5xoVmf40Bd5LBJCcd1TcRZ91irpqhCpsXtOIHvu7B9362AVa9T967pIajfnk2oREMp
         1HG/KobjGeTA6mwfJklNGAa+eQ277pLAjgEEh7N+aK52guVgZh/rSPVJHL7+xr4iMri6
         eoUR2h2iF0BIbnNrYlqcl7Ihgaid5R4dibl6faGrNWXDwftNv1G65bMHuqhnF2vSeiea
         4/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+4VyJpdADk+g0+HUYpHQaFderaDsRoRxkZAzIo6fVYR3hxWt2d2ja2kepoSQ/PIt/0H4D4L7oxVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwusB01xnEctEeMUn92t/MSe+BUXtp4GI3YebPv9fwc+2cZL5tU
	Po90Ox3iUG5zo81Xfj8T8psBjEfrZrD82pYX1Wn/uS1PfsK+iBuTEoGCH/XO0/jsjg==
X-Gm-Gg: AeBDievoJTqDWShOXKPJS/diqgpGofVmN1ui+xtYJc9B4IZQjdjjMwcUB7q8w0aG77X
	RqtFfQ9eX5tbWYeQAmFz/9tdq77w7K7JXU/wS67tWITysyHTfiIU6r6oFrHmLCuatku4ToankXl
	CoUn/WyyP0PNUqjv/TVB+RduiDa1v/fjLN59qBn9tgguKyGgtVuSmP90VoqnzwwxbJre10BUm26
	lQc/LYGQXqEZMaSHt145bg5JKpGOJM/kvUIpqwyyG107SxkhLPVNKuootYvPEtdE3fXbOMZ1fnr
	Q3vo2ogdCKzOaW/e+hz1dhrNB477nTiu/V3H+5Y9oDn5dWIJ4j7ppRcd1K2AmYaGhB69YhRKHUj
	04SRpo1oUUNAyJD2lVAuRhQV1ygwZBdudI7zAQLHuzHV1JEziaNcbiHf+QOW1JqpXZAAhOD28VL
	QxbHGs864jKiYSMuJkQoBamWebhnxhZpZagQWwVA==
X-Received: by 2002:a05:7022:4585:b0:128:ce44:be90 with SMTP id a92af1059eb24-12bfb75c3c4mr11867062c88.28.1775720660987;
        Thu, 09 Apr 2026 00:44:20 -0700 (PDT)
Received: from katana.dragonfish-mirfak.ts.net ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bf90973b6sm25154047c88.9.2026.04.09.00.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:44:20 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	JP Hein <jp@jphein.com>
Subject: [PATCH v6 0/2] media: uvcvideo: Add quirks to prevent Razer Kiyo Pro xHCI cascade failure
Date: Thu,  9 Apr 2026 00:42:40 -0700
Message-ID: <20260409074242.2115657-1-jp@jphein.com>
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
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,gmail.com,jphein.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36084-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jphein.com:dkim,jphein.com:mid]
X-Rspamd-Queue-Id: 79FBC3C7358
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has a
well-documented failure mode that cascades into complete xHCI host
controller death, disconnecting every USB device on the bus -- including
keyboards and mice, requiring a hard reboot.

The device has two crash triggers:

  1. LPM/autosuspend resume: Device enters LPM or autosuspend, fails to
     reinitialize on resume, producing EPIPE (-32) on UVC SET_CUR. The
     stalled endpoint triggers an xHCI stop-endpoint timeout, and the
     kernel declares the host controller dead.

  2. Rapid control transfers: sustained rapid UVC control operations
     (hundreds over several seconds) overwhelm the firmware. The error-code
     query (GET_CUR on UVC_VC_REQUEST_ERROR_CODE_CONTROL) amplifies the
     failure by sending a second transfer to the already-stalling device,
     pushing it into a full lockup and xHCI controller death.

Patch 1 of the original 3-patch series (USB_QUIRK_NO_LPM for 1532:0e05)
has been merged by Greg Kroah-Hartman and backported to stable kernels
6.1, 6.6, 6.12, 6.18, and 6.19.

This v6 series covers the remaining two UVC patches:

Patch 1/2: UVC driver -- introduce UVC_QUIRK_CTRL_THROTTLE to rate-limit
  all USB control transfers (50ms minimum interval) in __uvc_query_ctrl()
  and skip the error-code query after EPIPE errors on affected devices.

Patch 2/2: UVC driver -- add Razer Kiyo Pro device table entry with
  UVC_QUIRK_CTRL_THROTTLE, UVC_QUIRK_DISABLE_AUTOSUSPEND, and
  UVC_QUIRK_NO_RESET_RESUME.

Changes since v5:
  - Moved throttle from uvc_query_ctrl() to __uvc_query_ctrl() so
    all callers are covered, including uvc_set_video_ctrl() which
    bypasses the higher-level function (Ricardo Ribalda)
  - Throttle now applies to all query types, not just SET_CUR -- the
    firmware doesn't distinguish between query directions under load
    (Ricardo Ribalda)
  - Added lsusb -v Device Descriptor to patch 2/2 commit message
    (Ricardo Ribalda)
  - Bug reproduced on two separate Kiyo Pro units, confirming not
    unit-specific

Changes since v4:
  - Dropped stable CC (new quirks, not regression fixes)
  - Updated cover letter with 6.17 test results

Changes since v3:
  - Regenerated patches against media-committers next branch to fix
    context mismatch (v3 was based on Ubuntu 6.8 source)

Tested on:
  - Kernel: 6.17.0-20-generic (Ubuntu 24.04 HWE) and 6.8.0-106-generic
  - Hardware: Intel Cannon Lake PCH xHCI (8086:a36d)
  - Device: Two Razer Kiyo Pro units (1532:0e05), firmware 1.5.0.1

Stress test, crash evidence, and debug logs:
  https://github.com/jphein/kiyo-xhci-fix

JP Hein (2):
  media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile USB firmware
  media: uvcvideo: add Razer Kiyo Pro to device info table

 drivers/media/usb/uvc/uvc_driver.c | 16 ++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  | 30 ++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  3 +++
 3 files changed, 49 insertions(+)

-- 
2.43.0



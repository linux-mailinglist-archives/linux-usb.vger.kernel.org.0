Return-Path: <linux-usb+bounces-35297-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iND1BkFywGmDHwQAu9opvQ
	(envelope-from <linux-usb+bounces-35297-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 23:50:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 765D82EB108
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 23:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C860300A761
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 22:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEBF3314D0;
	Sun, 22 Mar 2026 22:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="z2XWmGKp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE2C2FD1C2
	for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 22:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774219834; cv=none; b=bgPmi01u6EfnZAzUmfS/ZPMTm8CvH0UlgXgwWIYWFxz5cUcqT1HfV4EfnOF6xStUdunZR4E2xNfe0cNcbG9KGx9mBtXmYYJzqQwHQhZE43yvI65osvzzvW5u58IfTd+gllqpt1zfgst3MbkM21iR5jyvR6yR8rhxppm9hN5wsxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774219834; c=relaxed/simple;
	bh=0rBP9cmP3Rq9XVksFITPmsWOgg65fxpyDfXQOlq5fX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RU5PUygfhVvXDOXRFt4W4k5mSpQS83G8hvddKMI+CN5sIuD1dV2UKlYsrXFlbPLjX1nL3JUgWaPZVVin0UisbqK4DqhvuxfF2HqoCIoxL34Y+ycY8yWQ6/MJhLpsqfWx8Ypz8yA9ZW5zc3tLNV7fAS78s+JP4JahfpPw1bVkgCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=z2XWmGKp; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b6b0500e06so4075318eec.1
        for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 15:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774219833; x=1774824633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nUoyhbPcIc2EMQIlt76bSFYcSIJJ4Un7MV9DQ53afaM=;
        b=z2XWmGKpJraYTn2kyGrsxQMAG1glpDCkGtmHAeyFXyOJc9spdTOkWirOjegwJUI48y
         4oCCHqCv5X85ZFM3YBhqapdfLO3R8Z6FfVW+aGuk7QY2Yn1lo06fYJVB8r0BbGaq7ujU
         2mVBMJzk7MnNz4MWqvpwfm83hPDzQf5uZKNtjMyOygkd/Yg55G67nD7fUkvurPUPOHx8
         /Bv8WRr15RqK9gLjXfkHA3/+B8jc82TTUUMu+ncyrvfSx6XWVNr9pJQjGyF7grnITJj5
         KTAvMC/eQhSktskUgeLZKMGa9heHb+MvgkBQemuX6Y1QO/OYcNkEiCIxM9j0UqHOrocb
         6/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774219833; x=1774824633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUoyhbPcIc2EMQIlt76bSFYcSIJJ4Un7MV9DQ53afaM=;
        b=pK4B2hWX1BWWC2NsBBvbd19CszuUsyn5BJQjftIwtMWg5g347jiT3id6Dr2317+2GE
         vvsAyGaN68oE/rP+KGLLMIbTTrU/wMG4CTKAHKQsxoC954s1HmM3zDT9hc0RCGnyS8Lf
         6YxM2S9R66PuSYHXqF7AfhDxiZ6pB7ROHP6WY2h+IUgUED04ASU6YZtXdGkFB9H29xjF
         Jj/y9M8+MMNW3g7aXo4SD6Nv1+u05A4rWiWRjVZPFo/G+Wl5+IjhRKphW3bMgtdM9BbW
         Sv5B/x5wMZNY9vCPFQQ4ut2cxkC9wHpMAB0A0ZEdAgBFFEYUvQmPk0A8U2Htn8k8pYs7
         ffRg==
X-Forwarded-Encrypted: i=1; AJvYcCVncon1AGkSBKRB4JrJ+/HH/gLRFDgOM9YpPCs6IqvPaDbGEi2oSBcbg01sji+afvAKfHkAnv9tfrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtoURyjibeaS4ZwNEq4qBcfi0Sgg1d7URmnV8Sdf7Gx6S9k3mc
	8x4LG/e29jMjV0/W3SqKrtMLcOQiOnHyhdzPxwZm2YuKw593ypSV1jkGmspQP7I2wZw0q+PP6HS
	0+70=
X-Gm-Gg: ATEYQzywRlQD1SEV7215p7iQ9Ac94nCk+gpOVnr0MDHPPgsagcXZO5e/Cti/REEj9LN
	clyUpVk/XTOaM1L1wQS6f4mzWefRpt2Az4hnoNYQhxxLstBwwGLY4pAZZyYW2jaDB+8x5Lr0F+D
	EC4YBjijL4IOmmBQpgCqhJJcnOWrTKFXjv66upjYFVfPSOxmSdDasWFYweXUCLPtUGLPPMQCKnf
	GjhU8NKpkZG8ZveA1W4LF69drInmb8pOIfk8MOMcudqeGutocZ5+i4IrsAesryrlZjBAiqfVext
	X17gY6BNwCQsfFSHHPmi5lEkhSSsk8o/HSCuJPSERLCR3Jmvs5Gcxo1EgVih4YjxyuFWZY5XgH/
	igoIIH/wYZ2dyfI0PDMga29b3PSwhipNcP4o1JhaYuRGUBBmEoMRaErzYRs1mzvjAsyt6QZr8yN
	JuTMFC/o9L
X-Received: by 2002:a05:7301:1f15:b0:2be:884e:17c3 with SMTP id 5a478bee46e88-2c1095a7a7amr4111742eec.7.1774219832489;
        Sun, 22 Mar 2026 15:50:32 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b31ebd5sm10928052eec.27.2026.03.22.15.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 15:50:32 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH v4 0/3] USB/UVC: Add quirks to prevent Razer Kiyo Pro xHCI cascade failure
Date: Sun, 22 Mar 2026 15:50:09 -0700
Message-ID: <20260322225012.1817920-1-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35297-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 765D82EB108
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

  2. Rapid control transfers: sustained rapid UVC SET_CUR operations
     (hundreds over several seconds) overwhelm the firmware. The error-code query
     (GET_CUR on UVC_VC_REQUEST_ERROR_CODE_CONTROL) amplifies the
     failure by sending a second transfer to the already-stalling device,
     pushing it into a full lockup and xHCI controller death.

This has been reported as Ubuntu Launchpad Bug #2061177, with reports
across kernel versions 6.5 through 6.8. There are
currently no device-specific quirks for this webcam in either the USB
core quirks table or the UVC driver device table.

This series adds three patches:

Patch 1: USB core -- USB_QUIRK_NO_LPM to prevent Link Power Management
  transitions that destabilize the device firmware.

Patch 2: UVC driver -- introduce UVC_QUIRK_CTRL_THROTTLE to rate-limit
  SET_CUR control transfers (50ms minimum interval) and skip the
  error-code query after EPIPE errors on affected devices.

Patch 3: UVC driver -- add Razer Kiyo Pro device table entry with
  UVC_QUIRK_CTRL_THROTTLE, UVC_QUIRK_DISABLE_AUTOSUSPEND, and
  UVC_QUIRK_NO_RESET_RESUME to address both crash triggers.

Together, these keep the device in a stable active state, prevent rapid
control transfer crashes, and avoid the power management transitions
that trigger the firmware bug.

Changes since v3:
  - Regenerated patches against media-committers next branch to fix
    context mismatch (v3 was based on Ubuntu 6.8 source)

Tested on:
  - Kernel: 6.8.0-106-generic (Ubuntu 24.04)
  - Hardware: Intel Cannon Lake PCH xHCI (8086:a36d)
  - Device: Razer Kiyo Pro (1532:0e05), firmware 8.21
  - Stress test: 50 rounds of rapid UVC control changes, 0 failures

Stress test and crash evidence: https://github.com/jphein/kiyo-xhci-fix

JP Hein (3):
  USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
  media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile firmware
  media: uvcvideo: add quirks for Razer Kiyo Pro webcam

 drivers/media/usb/uvc/uvc_driver.c | 17 ++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  | 32 ++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  3 +++
 drivers/usb/core/quirks.c          |  2 ++
 4 files changed, 54 insertions(+)


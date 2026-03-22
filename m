Return-Path: <linux-usb+bounces-35282-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFa1MgFlv2lJ4QMAu9opvQ
	(envelope-from <linux-usb+bounces-35282-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 04:41:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA302E822B
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 04:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 859023014C1A
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 03:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8856637FF45;
	Sun, 22 Mar 2026 03:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="o0Rr2I6Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F61175A74
	for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 03:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774150897; cv=none; b=C2sjTrOF7kOCXyFgZE4xWf01FmEcSACM7nk65IvsUHeYyNBrMF0iN9bDzSBX9cowPH/EYJmBbLZOth/R3cqBpd3ewajl+/Q+lgoDPAoZ5CRDlj7qXuODEVrY7VsFX1aNlRGzRhLwHuTvMFyzAypP3IL0CY/gwIV7I6Z8/hRH8YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774150897; c=relaxed/simple;
	bh=tHUivnefSaJZv7DvzCJ5BZPq9xvMoPyq7Pj5WiR9p3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IZNCSmhBhD9mF0m7b4WE5R9yA8L0taGiWZQdD/xNKcvj97woA9JgBqocEtMjJdC/U21/Utfv+Hhficz3nFJ6V8Bt1LSKFOdJ92upiUEBSOpc6VH2vzxtiZahk0XfzrMoTY7ET6VK6rQOMnyqVuoEBlNk1MAErCyZsvP2OqCEWtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=o0Rr2I6Y; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c10a2e2cd1so632841eec.0
        for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 20:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774150895; x=1774755695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vzWad7TnEuOsVNjUj5NlyByFkn4JT1LVnE5mFmavtf8=;
        b=o0Rr2I6YmDMOZO1dEJ4iizOEU6gbP3oyjEqsmavFp30zonO+HMIodCaL3HeLiDhDde
         V6NNY7dufcPX2+8hIvwgQ+prIN22KSEPZtHDYK942PwcZ+FBr6yR8BMCSwxXHKmsgjXV
         fly0HZz2JJhEm9Wy95gUuO4P1g/Lntac0r9jInqQzGP2y3qeDH6WNOUZ0UC2VcfWCI53
         j1fUA8w3/iQunGZ4dIDjXR2DoL0bh0ZEoOleXfUcpWqeJKOU1sxAm/E3Sk7l7t428+Jp
         muICYXLn77Ed4sIwHP0snNU7Mg1QW7Y79tbew4T9Z665TTND6iirz+/uOYYGfVl/RKUu
         EJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774150895; x=1774755695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzWad7TnEuOsVNjUj5NlyByFkn4JT1LVnE5mFmavtf8=;
        b=Hcu6Ja37nmr1ntjcJIUC1QMACfZn3a18J1HnoEoD5Wwm9OOvwrs+5ibWOgPic00Ikf
         LYQPdcisOjRff1R2Me0kOcHvbZpF0ls9YR/X3PgHhfzI9EZMQ/zfkrp9ZmsGTxwgPxCn
         ecvYbHH2Po2E0L/widq6rsdQJV/P10cvDga7GMmCh3iyKazxQuLLschFfAvso4g7m9S0
         PwRdK/DnK7pNWKsJd1d9yj4lwsOLMEv75nqVH1T33QKfPnC9c3p1ZOL2/u9cGMPrJV8T
         SlZsER38SVZ4g6aGRvMvzFSBPirZXWoXz7k+j1IhAtgcZYwa+4f6Q34EcW1U1Te4B1Zf
         CW3A==
X-Forwarded-Encrypted: i=1; AJvYcCWUO0av8hphK/yvkHynK4rAZPowt3myh+FtZC27QTvGMfSaVucia8aH/0c/B28XIMCuaDildrDa7LE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEWmgA42o6emndHXWFNf87ikRUmDOnZ2yj6XC4fwqDtWG9Qhrw
	kj62tkCD2TCcD0ZgfI8Co/TUotSTb7YXqMYEdMbnvhJs4/lAwTljl6CB7t6L3Gjp8A==
X-Gm-Gg: ATEYQzys9Gs2mKGCMOwxOu04LwKwhY8ZkIlCbce97r2d5mIsxQt6Bo5umlj0cUzz5pm
	iQrn9A1CeJ7yTC59h9VJtLWBp6vhpTTD7j0cmtYjdezWAi2AeuzQ6WfraZ4XTCB8B9tUDKFFMP8
	o8NrHPrcM4HaCjjO2WT/fXJ9aQcf6vrDYgZjLCKq5H+zHoOihoiWQveaBBM2jU2IAZtMxfMSduE
	iZv6J56KISfF68P70qdgUDTSv7zxS/DcgF+Pve5FVIeA9dt2U1BJ0TfksRoNlWow/0WpdqkmU1p
	De0ym7aFMXxbN3x597HaF41xH34You0XevPTuD8sCzKE8mtX9Vxu6RaXxULchJ4LSUcODm/k06R
	AV2svKRwDw726r9gMZzJ7CX5q8ZyuWKTf4Hm56B0MamQNuUKiwonkOw/yc81t2lHyw6zZctxNCf
	nPihA/N3DS
X-Received: by 2002:a05:7300:d705:b0:2be:142f:d48a with SMTP id 5a478bee46e88-2c109784293mr4373006eec.27.1774150894879;
        Sat, 21 Mar 2026 20:41:34 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b1961a2sm8989451eec.12.2026.03.21.20.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 20:41:34 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH 0/3] USB/UVC: Add quirks to prevent Razer Kiyo Pro xHCI cascade failure
Date: Sat, 21 Mar 2026 20:40:10 -0700
Message-ID: <20260322034015.3629056-1-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35282-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6DA302E822B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has a
well-documented failure mode that cascades into complete xHCI host
controller death, disconnecting every USB device on the bus — including
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

This has been reported as Ubuntu Launchpad Bug #2061177 and affects
multiple kernel versions (tested on 6.5.x through 6.8.x). There are
currently no device-specific quirks for this webcam in either the USB
core quirks table or the UVC driver device table.

This series adds three patches:

Patch 1: USB core — USB_QUIRK_NO_LPM to prevent Link Power Management
  transitions that destabilize the device firmware.

Patch 2: UVC driver — introduce UVC_QUIRK_CTRL_THROTTLE to rate-limit
  SET_CUR control transfers (50ms minimum interval) and skip the
  error-code query after EPIPE errors on affected devices.

Patch 3: UVC driver — add Razer Kiyo Pro device table entry with
  UVC_QUIRK_CTRL_THROTTLE, UVC_QUIRK_DISABLE_AUTOSUSPEND, and
  UVC_QUIRK_NO_RESET_RESUME to address both crash triggers.

Together, these keep the device in a stable active state, prevent rapid
control transfer crashes, and avoid the power management transitions
that trigger the firmware bug.

Tested on:
  - Kernel: 6.8.0-106-generic (Ubuntu 24.04)
  - Hardware: Intel Cannon Lake PCH xHCI (8086:a36d)
  - Device: Razer Kiyo Pro (1532:0e05), firmware 8.21
  - Stress test: 50 rounds of rapid UVC control changes, 0 failures

JP Hein (3):
  USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
  media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile firmware
  media: uvcvideo: add quirks for Razer Kiyo Pro webcam

 drivers/media/usb/uvc/uvc_driver.c | 17 +++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  | 33 +++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  3 +++
 drivers/usb/core/quirks.c          |  2 ++
 4 files changed, 55 insertions(+)


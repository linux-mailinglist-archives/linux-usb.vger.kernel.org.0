Return-Path: <linux-usb+bounces-30917-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F094CC85C52
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 16:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DDFE04E269B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 15:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DDD328603;
	Tue, 25 Nov 2025 15:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRlbfvnB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC17239E7F
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084468; cv=none; b=IYEEN39AMwKUoTuZ4mhQ0kJIgF7OEhEX1owuqOF6f2pi0htsM9L1LjJYqjcMGDsgdxg04dU8chWyYg1LSMKo5ApeY00LQcxwGmZdmWD/SmhTqDC054UHB/wN8UbAzYYtbVN7+yVi9Clis3j8hGaJeNd1YDQVgnS6v4hVn/oqfgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084468; c=relaxed/simple;
	bh=cZKCDok2bvgHpy/QIdyMpaY5kiMPfYKS7NyBSXZn3R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bu2gzX3quV4RLw5RUtWaw2grjZwtmDFFBz/Ss1Sfhxd2PpFtcGE2R+Bw5Hh8fB0mOwq0X1YzBfyL29CxGGVg9wk75Xx8AiKv3aowNq8OTLJWMebqa2QfRY0r6Lk0GAraZqg9bXCA2o265XnhG49gENssqwHaiDIe3h2WctIsViQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRlbfvnB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47755de027eso30321005e9.0
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 07:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764084465; x=1764689265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kq9qSywkO4PP1gvaQ5TihW+kIalcwEhayZAl0fTMBI=;
        b=bRlbfvnBSLBCUtxu2jfWfUvJbfGRMDn/UhwGDUATzWfYlRojJQ8EQUHq8veJTQFtmH
         7W0FKJtvPo1A2IllpHRxWUb0LUPgIFvfuOZ2JW+XRdy/foR33dWv/7M+GReXgT6QiWTn
         EA8AenFUxSW1TObJibvdQVLPdRYfTJiY/wOHFyOADAhYipxWsDLBHD/vUNPPSfp8zydj
         3lKSuTBjbDZJ6P9vPfieuxns3oiC9Fs4xFDVhwGNAsPa68o7ctDcpVKGdioA+kKXrt8O
         Bx+RlbeldoR63JgfFmRiXrUnGHEApHDF83tDkyI7Q6G2xdTiXXCMc4x//Zcx/35RrMkd
         Vb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764084465; x=1764689265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9kq9qSywkO4PP1gvaQ5TihW+kIalcwEhayZAl0fTMBI=;
        b=lScI/s+MunJWz3HOpxRR7tiVo3UUStnZUPk1f3aPctYCX4iEzltZeaiW8GQke9Z/wh
         465RkVcPMoTheimJEGfRc5pLILUwOhFxNfAcUuusx1E/xK61WaNxzTlmfvNTRpptP6+P
         VdpuEibgDp7PU7es7Lx3g29dds+Z70GfRqS9ubDQ4x2g96zthP5PY7H85gL3H1e3Mc/w
         uY6oav3O0fejudCCSYwFkxNREH8RJhzsKxuEAW5pF1UkL+5iznE6rbzrbu8CV3aseIs0
         W4DMtOBdPUuYAIipN91GctsxazSvtgQNXT6CuXCEXye0c7T6wPGjSJo9Cdn0lnrsTLuJ
         PxBg==
X-Forwarded-Encrypted: i=1; AJvYcCWgrqRPx7MZ2iFzQzZttkU2MWi+2jndG1hmwLNwssUHKV8NOwSpwNPj+eeD06UWMHIk+5ve3o6Oxw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGWtRju2vshAsc09lT1eADiH2Z5sXNU2QAu5dT7ZEmsfq8F1/1
	AsJgqj6XwJMyS0r/D9VW3b5pWXvbs0Q4PAagDHHY35aAN/UJZpdCoO7/
X-Gm-Gg: ASbGncsiZDsGpfrO9KyXkNWaaLszSr5eEzkA2h5gRacHzjxLgZsdKVHcyYbAJYnsU82
	9/88Et6AoNTEzpfV6LT/lAe31Wk1/YrSm3C3l0FQ5O21I0X9I9MSQgIWvwh2aZoUNeGIAeCwfT1
	0Cszjq30/QEoIzppUijS+J+NL/KKliYc10q6lDsoypq+rzu1SMlv9jDajjVl5I4RWwcRU56+0ty
	qsTK0rDiamIPgrHk7KSXIGzpb4+e5hqTFP9lZ0vPHbugmI57iRyWUD39I+nZADrWzPv4LWUggyz
	RIqBB4wsGQFEA+GWhPMfV45bzbUD5SlsYKyDp8GvzZ2TIhE2soXuBm71xXHhNtQSW43D3G54EXA
	q+ryQkfZtcorcA2mpCiOyLWy6RCxQs2vWgWL2DxTfk8lM3aXorSYWbuX4rtFWd7n8K2J2BQDD7v
	s9RUvb/D2YKbzToemqv5iSbnAc9e6aTWHK6MeRkps2w9MSy6j+m1omQCh92ZfaW5R9xZ3B/u/Bg
	tgY4nXA50c5aAPuUFNkk2Eaf8RO0jM=
X-Google-Smtp-Source: AGHT+IHFfmBxIORYcbu6BbMr8OVYOSZuWC5mNvnXDGuW9f9pbFUhSNkcfZGsnaCD8iZPXTL7pqL0pg==
X-Received: by 2002:a05:600c:1c87:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-47904acef12mr37194885e9.3.1764084464392;
        Tue, 25 Nov 2025 07:27:44 -0800 (PST)
Received: from labdl-itc-sw06.tmt.telital.com ([2a01:7d0:4800:a:8eec:4bff:febd:98b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3602d1sm265128575e9.5.2025.11.25.07.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:27:43 -0800 (PST)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>,
	Fabio Porcedda <fabio.porcedda@gmail.com>
Subject: [PATCH v2 2/2] USB: serial: option: move Telit 0x10c7 composition in the right place
Date: Tue, 25 Nov 2025 16:27:34 +0100
Message-ID: <88bc1bd65455a35db6e92dba86cd5805ab3821ae.1764084304.git.fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764084304.git.fabio.porcedda@gmail.com>
References: <cover.1764084304.git.fabio.porcedda@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move Telit 0x10c7 composition right after 0x10c6 composition and
before 0x10c8 composition.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 drivers/usb/serial/option.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index b9983e6f5eff..2610bb860682 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1445,6 +1445,9 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c6, 0xff),	/* Telit FE910C04 (MBIM) */
 	  .driver_info = NCTRL(4) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10c7, 0xff, 0xff, 0x30),	/* Telit FE910C04 (ECM) */
+	  .driver_info = NCTRL(4) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10c7, 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c8, 0xff),	/* Telit FE910C04 (rmnet) */
 	  .driver_info = RSVD(0) | NCTRL(2) | RSVD(3) | RSVD(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c9, 0xff),	/* Telit FE910C04 (MBIM) */
@@ -1455,9 +1458,6 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(5) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d0, 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d0, 0xff, 0xff, 0x60) },
-	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10c7, 0xff, 0xff, 0x30),	/* Telit FE910C04 (ECM) */
-	  .driver_info = NCTRL(4) },
-	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10c7, 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d1, 0xff, 0xff, 0x30),	/* Telit FN990B (MBIM) */
 	  .driver_info = NCTRL(6) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d1, 0xff, 0xff, 0x40) },
-- 
2.52.0



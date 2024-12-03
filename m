Return-Path: <linux-usb+bounces-18034-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5DD9E1937
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2024 11:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BF3CB307E4
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2024 10:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5C21E1C24;
	Tue,  3 Dec 2024 10:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OS1xNeSD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254E21DDC3D
	for <linux-usb@vger.kernel.org>; Tue,  3 Dec 2024 10:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733221406; cv=none; b=uaa3hzd/umunzbSXwuDHXlJ81cZCFEhoAJ3B4b5qYgxNO+f70sChwpu9CS2ACXO83Xc/29F4ydxtSbCwF5+oefEwF5uK9+s3AKNq6fN29v7015ovc5TmcWXAYgUUFrVtAapf7Zmze3pAaF1y1Lzf9m5bhMfVyrt/NmqpG+AXHDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733221406; c=relaxed/simple;
	bh=ETw7u1mk0LjlQqPvj8gR4APdnoQAxNUE+W5cxhDMBCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eqrUvHZBXLwlA6jdx/lyq7akPN0d/s1Srp5z/V28iT4Fl73kcVFrooxU2lw3iGgk+PEXnYbUi3ccKXfLKnUdCEl97YqqpiY9/5gTCoguAEEHjw8Pwr3WvqlYqjqZS2ZGS4U7rO3r25G3MeUnPbx0mia/JNwnujeZEZMcMPBLE+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OS1xNeSD; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d0d4a2da4dso3371977a12.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Dec 2024 02:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733221402; x=1733826202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RJzpjZ91uuCvgpzILXkD8zrAjfL5m7WyfegMJCZBGNo=;
        b=OS1xNeSDFRucWUPYzNa4KkWLxq2n/G+Te8RHXpU/jaGhzQVVCxUeHIQrif/bUYWx0U
         JMlarphRDAkG0/fQjrqKISCDNhpHnh0zAQE3JNYISpEDJ6Yy0JHLGt4vVIaEbTICHOBi
         +XgFjGiYx+bqe1Z1698fpD39UvnE2FMBGCQsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733221402; x=1733826202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJzpjZ91uuCvgpzILXkD8zrAjfL5m7WyfegMJCZBGNo=;
        b=IR0gFqsI9rlMk4Z505qff02ppYp+64WYxUZR23zNg9LrneWPSjHQsc0i/t7Vk/vEyH
         49tz5UO32l3YdNsimrK9OhjIdPbzfsLJSLlrJArjQX+8yK2IWZSQOmQWi3JaO8wW37mj
         0VofiIoxgjpJ6c5otmTBjoiIIGWTTgF/8e1pv9hbdugUXSMlMDHdKXeDW7WhYLcrvp/w
         iycyqVEv1E7ivOUsJRNQhbG1YKDGDvRGOws/kEaF+0PTt20oegbN2YxYrMGopmfu5Kaz
         toxnpBESYHCWun5NjQ497OkeoL6KBrzxL4p0NDkaQsRmReS2XhFg4Lx6uoJ+yP2d/mXg
         WBng==
X-Forwarded-Encrypted: i=1; AJvYcCX7PNV1vM3mzjizFhXItcLfj6z8ZdwDfgurK+V0dEr3N/vmYXNtz73gRVeLK9dPm6Ia7zYSDe+8Vk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3ADKR2ujfi70ced9PuPC4ge4dmY5qdGQCmHumHcTMNM14XvdN
	QaitWmhTkbVQvXmHr0aLhaQz1RaDNidNFM5herg1o8gpEJBe3coySE1PlrT2
X-Gm-Gg: ASbGncuwbZ85eTCWhziofWU5MAIwjFF0aGDlMWBMlr3YvmYGT7cmaJcptDJiMo+jtAF
	ZF0R+aIw8Ex/wf4jYv1lCzU5mZkVidxn1r+bKlk2l3jsqpVhEdo96Yvbs4s5F0SXUpDyhrVsXu+
	WQatv0nTyhStH3uXt/ilbWTLz9GE0VqTIqOvu0qOU8WinQLdlyi0cIHoWzORk1mNV3l4y3cuWj8
	vaA2Cxa0G59FndFeOLgh3acylsPabnrto/1GIs5XrYdpq9dDwVXa/is0gb+PL68O/RvBeWv4QHq
	VIn/IMSG5gq2AgJ4+rBbuqvLY3uhXYfIwkk=
X-Google-Smtp-Source: AGHT+IFVjs1rNJEw3UFMNZnu1wLLGO1PKNpGomwEtLmWDel9W+iixQKGmicK6vakDP7uGLvRDgW1hw==
X-Received: by 2002:a05:6402:34c5:b0:5d0:bd2a:fc2a with SMTP id 4fb4d7f45d1cf-5d10cb80224mr1426909a12.26.1733221402401;
        Tue, 03 Dec 2024 02:23:22 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0f6cf4bbesm1720851a12.43.2024.12.03.02.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 02:23:21 -0800 (PST)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: typec: ucsi: Fix completion notifications
Date: Tue,  3 Dec 2024 10:23:18 +0000
Message-ID: <20241203102318.3386345-1-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

OPM                         PPM                         LPM
 |        1.send cmd         |                           |
 |-------------------------->|                           |
 |                           |--                         |
 |                           |  | 2.set busy bit in CCI  |
 |                           |<-                         |
 |      3.notify the OPM     |                           |
 |<--------------------------|                           |
 |                           | 4.send cmd to be executed |
 |                           |-------------------------->|
 |                           |                           |
 |                           |      5.cmd completed      |
 |                           |<--------------------------|
 |                           |                           |
 |                           |--                         |
 |                           |  | 6.set cmd completed    |
 |                           |<-       bit in CCI        |
 |                           |                           |
 |     7.notify the OPM      |                           |
 |<--------------------------|                           |
 |                           |                           |
 |   8.handle notification   |                           |
 |   from point 3, read CCI  |                           |
 |<--------------------------|                           |
 |                           |                           |

When the PPM receives command from the OPM (p.1) it sets the busy bit
in the CCI (p.2), sends notification to the OPM (p.3) and forwards the
command to be executed by the LPM (p.4). When the PPM receives command
completion from the LPM (p.5) it sets command completion bit in the CCI
(p.6) and sends notification to the OPM (p.7). If command execution by
the LPM is fast enough then when the OPM starts handling the notification
from p.3 in p.8 and reads the CCI value it will see command completion bit
set and will call complete(). Then complete() might be called again when
the OPM handles notification from p.7.

This fix replaces test_bit() with test_and_clear_bit()
in ucsi_notify_common() in order to call complete() only
once per request.

This fix also reinitializes completion variable in
ucsi_sync_control_common() before a command is sent.

Fixes: 584e8df58942 ("usb: typec: ucsi: extract common code for command handling")
Cc: stable@vger.kernel.org
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---

Changes in v2:
- Swapped points 7 and 8 in the commit description
in order to make diagram more clear. 
- Added reinitialization of completion variable
in the ucsi_sync_control_common().
---

 drivers/usb/typec/ucsi/ucsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index c435c0835744..7a65a7672e18 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -46,11 +46,11 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
 		ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cci));
 
 	if (cci & UCSI_CCI_ACK_COMPLETE &&
-	    test_bit(ACK_PENDING, &ucsi->flags))
+	    test_and_clear_bit(ACK_PENDING, &ucsi->flags))
 		complete(&ucsi->complete);
 
 	if (cci & UCSI_CCI_COMMAND_COMPLETE &&
-	    test_bit(COMMAND_PENDING, &ucsi->flags))
+	    test_and_clear_bit(COMMAND_PENDING, &ucsi->flags))
 		complete(&ucsi->complete);
 }
 EXPORT_SYMBOL_GPL(ucsi_notify_common);
@@ -65,6 +65,8 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command)
 	else
 		set_bit(COMMAND_PENDING, &ucsi->flags);
 
+	reinit_completion(&ucsi->complete);
+
 	ret = ucsi->ops->async_control(ucsi, command);
 	if (ret)
 		goto out_clear_bit;
-- 
2.47.0.338.g60cca15819-goog



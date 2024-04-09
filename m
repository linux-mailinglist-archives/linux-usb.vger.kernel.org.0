Return-Path: <linux-usb+bounces-9100-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8348F89D01B
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 03:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CBAA280C72
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 01:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A854EB4C;
	Tue,  9 Apr 2024 01:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BqnU9E5j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A0D4EB2B
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 01:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712627942; cv=none; b=unSufIxpIexECXilomT8oTU3w+XkPCGPSPWTqFRUKG59KH3E0bk0kDdVNrKga8k2mFLWpFW2xxexvS7gUm3P3Pes006MxxDEuAlf/qF1uK7PU1sNEvIaM8EW3Uk4tFRQc9M39gUtDbR3UeYlbveTI+8wm3ra2Js+YLFnk42itfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712627942; c=relaxed/simple;
	bh=QxZKQOwykKKeB9SvCYrLDz+vdve2h6L61n8N+z7rlCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V7Qj94WNjSpivFwQ7QqiTv/HcSauGC2IyknXMIV8+XzcxZ3qgh9+MMdUub439her00wF5J93egZFapd0opP8lr0gvNCxxwmffd4AjaUo/Mqe4E4pfUwAFFDEbrAGXFULSMBpj3KqkST4UNJik5a6IcZfZOLQvTQCSnwRoMYuZco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BqnU9E5j; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e0bfc42783so44438475ad.0
        for <linux-usb@vger.kernel.org>; Mon, 08 Apr 2024 18:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712627940; x=1713232740; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eqiaFo5cc41pSCTeYetx/RgbKR8V0cyIDB0v2QkfDGA=;
        b=BqnU9E5jQo2Ou2O8c/x5+8WjTNejlyHE4WTZ17f6MW2uFKBFVPm5i9j/XsEX2IhqGV
         OwI5v0eLecOv+hzSPEU+LCijO6J9kyzUYbNWiK3L5UyzrXdM3tPxslX/zNutGR/5GNBv
         A1esAzUSqacskBK6sRmzoxbrBEL8iq+Ig1+/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712627940; x=1713232740;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqiaFo5cc41pSCTeYetx/RgbKR8V0cyIDB0v2QkfDGA=;
        b=rME8dQK+uxQfcD3LfyZ8DQb8Uo5rEPto2X5s7NtKONMR86R0x8h8CJvjELFtz9A5o6
         zyO+oje/UPsQN5Frls9gqnSL7iOiT8EuX1w/9LvO7ZR1nPTVreZ12Gv1iQLM0WD3U8m8
         abM1Ww/i+b8snc5gpAzvW9YraWsMCkm4JQSHMrZWCB3Uy1h3VK6WIBVH8ET669ua/T5B
         CrzFUrHB8I3Rwjf13pkJFIESgOSlGjxJPyawguMgL7vf8frbKEeC2avEnEyqr82chDPh
         k7LNWdIMlJ+Sn2vwh2rtLR79GKUDuN1YpfBqO07R3eSrQ7hvU+HEPkZUcAXSPt0Qy0Za
         GPUw==
X-Gm-Message-State: AOJu0YzoNs54TT6tmBzLpaw6wO6pDTRdAueqjMY3rAn1sxW+EXYLoxFH
	QEvHteDbCVEkgpEnJOAXnqq3qNC9AUIVEKCN17mw9pdKg3haZq9vzGzGDdQP9Q==
X-Google-Smtp-Source: AGHT+IEJ/QAo7BT6jn0kGCUdP0TzveYxksa9RgwGjK8/vGmMxlyKHD210Dd6QNBhWeM7BQiL6l1XYg==
X-Received: by 2002:a17:90a:1b8e:b0:2a0:4b80:9316 with SMTP id w14-20020a17090a1b8e00b002a04b809316mr7360385pjc.28.1712627939681;
        Mon, 08 Apr 2024 18:58:59 -0700 (PDT)
Received: from pholla1.c.googlers.com (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with ESMTPSA id l15-20020a17090a070f00b002a0777a2b1asm7805998pjl.10.2024.04.08.18.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 18:58:59 -0700 (PDT)
From: Pavan Holla <pholla@chromium.org>
Date: Tue, 09 Apr 2024 01:58:57 +0000
Subject: [PATCH v3] usb: typec: ucsi: Wait 20ms before reading CCI after a
 reset
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-ucsi-reset-delay-v3-1-8440710b012b@chromium.org>
X-B4-Tracking: v=1; b=H4sIAOGgFGYC/33NQQ6CMBCF4auQrq2hQwvoynsYF9hOYRKhpoVGQ
 ri7hY2JMS7/l8w3CwvoCQM7ZwvzGCmQG1IUh4zprhla5GRSM8hB5gUoPulA3GPAkRt8NDO/G1t
 WAqRS1rB09vRo6bWT11vqjsLo/Lx/iGJb/2BRcMHNCUVdYG4FlhfdedfT1B+db9nmRfgYSflhQ
 DJASi0qVYNq5Jexrusb9epQHfcAAAA=
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 Pavan Holla <pholla@chromium.org>, Prashant Malani <pmalani@chromium.org>
X-Mailer: b4 0.12.4

The PPM might take time to process a reset. Allow 20ms for the reset to
be processed before reading the CCI.

This should not slow down existing implementations because they would
not set any bits in the CCI after a reset, and would take a 20ms delay
to read the CCI anyway. This change makes the delay explicit, and
reduces a CCI read. Based on the spec, the PPM has 10ms to set busy, so,
20ms seems like a reasonable delay before we read the CCI.

Signed-off-by: Pavan Holla <pholla@chromium.org>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
---
The PPM might take time to process a reset and set the CCI. Give the PPM
20ms to update it's CCI.

Commit message now summarizes discussion in v1.
---
Changes in v3:
- Commit message updated.
- Link to v2: https://lore.kernel.org/r/20240403-ucsi-reset-delay-v2-1-244c175825a4@chromium.org

Changes in v2:
- Commit message updated.
- Link to v1: https://lore.kernel.org/r/20240325-ucsi-reset-delay-v1-1-d9e183e0f1e6@chromium.org
---
 drivers/usb/typec/ucsi/ucsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index cf52cb34d285..c0706c40fa64 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1280,6 +1280,9 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 			goto out;
 		}
 
+		/* Give the PPM time to process a reset before reading CCI */
+		msleep(20);
+
 		ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
 		if (ret)
 			goto out;
@@ -1293,7 +1296,6 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 				goto out;
 		}
 
-		msleep(20);
 	} while (!(cci & UCSI_CCI_RESET_COMPLETE));
 
 out:

---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240325-ucsi-reset-delay-bdf6712455fd

Best regards,
-- 
Pavan Holla <pholla@chromium.org>



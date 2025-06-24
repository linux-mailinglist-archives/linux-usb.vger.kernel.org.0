Return-Path: <linux-usb+bounces-25065-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84369AE6693
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jun 2025 15:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00F637B3B5E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jun 2025 13:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A2A2C08A0;
	Tue, 24 Jun 2025 13:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K/ReQUi3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC99B28ECEF
	for <linux-usb@vger.kernel.org>; Tue, 24 Jun 2025 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771988; cv=none; b=GCSoMbL+P6tMsK34DNErJTO/l7TRjWqzx3247Cg/aJdJWeYx7LE7pcayhdOeXqDr1wBX+kfj02wrON1UhokSQuJjg/+BKBlLwzb4baKqnYzYGa4BnN86T0IwbEooYAqasG5vbWaXXQQfmGBs+xbMrij6h3iTo1uiRamTMnGKxmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771988; c=relaxed/simple;
	bh=2aYjxn/XjyqfROJtwhDsYywKfhT/JjZo+9HmvBofW1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BH4gZeNxmOz6ZCOXSOQ1HvhyUhAXIX6xjBxQUZ3ez4c9Qd3zb55Oa3pP2YcyH1orRBteYNXyhh6SieSNx3+/Frpc+/yb8LQ074O038kHEDXbj89dyVANSPEk++j5+s7C/QyUewVJCsqB8cnCZEe9mPLXRPKj8tmTl6jw+IZ30yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K/ReQUi3; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad88d77314bso92316166b.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Jun 2025 06:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750771985; x=1751376785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tkj6v/oyYjnLDQvdndgBTk2Muh6SQTWgkcZpBQ/t9Hg=;
        b=K/ReQUi3eOOJcY1jqxMDEaPmV8o/99W2V21rfnkTbPHZBkJL70o+rihqgCxoynfV0m
         EwZFTtQXi9Qenv+w4ZKIRfxQYZXycEnsb5dlofEYuDhrljHNypCqQ1TmXCB5Mjvodej5
         05vro4Rk4zdHEv7uC3l0wjr48IgKTuaH5+3/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771985; x=1751376785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tkj6v/oyYjnLDQvdndgBTk2Muh6SQTWgkcZpBQ/t9Hg=;
        b=mf7Qb+2S3suI9yUr1ih5luXEhNawRluXO5GlwhU1DzWLj/MGsW6beWbRqr1c0hcSEV
         hXaUOZ3eO6WFw1isXMkOIy/Nn3O4yT086tFM0OtM1Ij6Wo12BFKWASeSgIauLc3bHVZq
         ytP220FLRNwkRzl1RlvL+rMbCt39Am5pQ1LYJXu827F0XYkbMX/RYZAItXluv48WwFYa
         wHVz9MHlXUtw6ltYTQDSTlnG0x0hvCmtvY6TRdeusdZcgLYsyPTQoxNCh+h54Uk3s2kv
         jBxVIFXkPfaV0x2rrHkqIf85RPCK0BBksgcEp2etMI4zy+6GT5u78JGOvtIQK7GHaLtk
         lKEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAhn7gWj0nzVa8+bnzSBS5B2kDwTC9dVBjfC4idonkx38tTTNDEAw9FwY4XA+bs5pRarGxaK0uwSk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx++7T30X3gmMOMnRsrSec8dmVGBtrGlwCjCdHD+epZYMqVmD6B
	xSytw0JvCLMRIWJB1h4f9efQxwReRmNQmzez1zcZoDz+i+lFA/eiabBBiOvKHIV+/g==
X-Gm-Gg: ASbGncu5upBFT3ucm/q8HMqRqlgiY+BCxoTNpaxSAAOx1DD7rdnRR0/30Oyzdg/u71p
	5TFeybKumnccw7nqCriwwvUA/qhd1iKvxt+lBgb8cJHSBaviA5NiXqfOurGu5EBvaeRvUn9avR5
	nNYaya6u0tAzdxve/+r7NKta+hTGnEYde17IFDxG7UvijwX6rO/zk9q9gJnJPxRQFNgV1xY9crR
	GqfwHhGdl2QPkC2DzNeKOjrGI1wYXSFZbWkuUA7cqviRmarDDfmTYAb7Q8oK21FB6oP31Rn9Ym9
	YICT10L/iRs/8KyyHlp35lqL6ImGk886TpEvEEaarSg9Pl9vg0hj0gBiZupApGQnX0m5SzvSJhp
	qBe08n4xAh0G6eWXzK0dfcmFU3U5+KWv9KtrUMwZadVHz/Yh5CyZn
X-Google-Smtp-Source: AGHT+IEe0SD7CtPOT2GsU04+3bSuhfq+kqQCtC4tVp5owq6ZynhgbyzhdLvK/T4ZiLjHJSHP8BIZCw==
X-Received: by 2002:a17:907:948a:b0:ade:bf32:b05a with SMTP id a640c23a62f3a-ae0576a05f2mr1363893566b.0.1750771985028;
        Tue, 24 Jun 2025 06:33:05 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053edc0f5sm888265966b.59.2025.06.24.06.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:33:04 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jos Wang <joswang@lenovo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: displayport: Fix potential deadlock
Date: Tue, 24 Jun 2025 13:32:46 +0000
Message-ID: <20250624133246.3936737-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The deadlock can occur due to a recursive lock acquisition of
`cros_typec_altmode_data::mutex`.
The call chain is as follows:
1. cros_typec_altmode_work() acquires the mutex
2. typec_altmode_vdm() -> dp_altmode_vdm() ->
3. typec_altmode_exit() -> cros_typec_altmode_exit()
4. cros_typec_altmode_exit() attempts to acquire the mutex again

To prevent this, defer the `typec_altmode_exit()` call by scheduling
it rather than calling it directly from within the mutex-protected
context.

Cc: stable@vger.kernel.org
Fixes: b4b38ffb38c9 ("usb: typec: displayport: Receive DP Status Update NAK request exit dp altmode")
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/altmodes/displayport.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index b09b58d7311d..2abbe4de3216 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -394,8 +394,7 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 	case CMDT_RSP_NAK:
 		switch (cmd) {
 		case DP_CMD_STATUS_UPDATE:
-			if (typec_altmode_exit(alt))
-				dev_err(&dp->alt->dev, "Exit Mode Failed!\n");
+			dp->state = DP_STATE_EXIT;
 			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = 0;
-- 
2.50.0.rc2.761.g2dc52ea45b-goog



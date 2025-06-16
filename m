Return-Path: <linux-usb+bounces-24784-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD88ADB210
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 15:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F279170153
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 13:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954412E06DD;
	Mon, 16 Jun 2025 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L0dMoETu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7992BF00C
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080803; cv=none; b=VLuPCWtVimowC8FBb9lWFo7WuzYtbCTNw1gwNMQQUkD590yDao5ZG/wEfLrlB+Bfyy5q08hCyQk4EaCiyCUQwLsGRMSPkkMHlNVeblabjKDDEtALeMG2FD40syp2MIKnAjOoAp18+VZSK6fHeOgAQ23C15ADmKdmTe74JFzXP9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080803; c=relaxed/simple;
	bh=Qd939gkPb0H61tPk2RIMeLDSe6Zyt59w3Ryj4n49L+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/hRwriMSfdzSrdz3pHUYieMFUx8HZn9PlZroSaoaQc2UkLxs8Ur/btgxPvRC5V9On5jy7BkMGjjpBJdDoagDu7rRBKXMkhH5enB5wc7B2B6+sBK6UOSlMABy3UD0IP/m34/SaCJP8C6yh6uZdhP+t8H3WBO/gG51rQfGXTxQrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L0dMoETu; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so497567a12.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080799; x=1750685599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxRvpi4mZMXdsuvOPAqvVcquISKrLNsOB6lTKg+yoXc=;
        b=L0dMoETu2GWqiOB/SPJgmEpJcEG4LNW3FoySfEglS19BC9dsJvWMBNmGu6SPWZmvOJ
         ATu3Rg+I9AzO2IgCyJ6KXzgIeWxx9GmEnbi+PpoUuEEARPeKsG3XzMN7IaQrEjyNhom5
         iPtV5ai8jvM7FBY90sibLniYKItVLE3NPoStE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080799; x=1750685599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxRvpi4mZMXdsuvOPAqvVcquISKrLNsOB6lTKg+yoXc=;
        b=tpx/BkyKx0A6VKj1MeUdB1GLKctzcMBdLbvD8InOjIk7wdNokvF6pqX6Ox/e9mDQNF
         y9d4Nyo2NMEA1/azC6DVH9DGyMD7SKweM/8LIPPK6hHGgwlU/tObI7L2AGDygU0iEp/F
         zv7Pjst6zn2UtPt3WxdJdYiVscZwvdwqvFEixl0YJ0toEz67U8i1wzQ6Og8RWvlQSq6s
         AEqyLHA+nxGLeqXcgp4wISw/+iTUuIcoM+d6W7DIpc6QzcjKECJ9mn+bPCgZ39W2kxPF
         3GVx3IjLLimZ9TWNQov7pP5tR1xSQt8BS4viwWKgE5C3Be8vaO0dslMCKm3fksCIUgVU
         BVWA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ4Pwx0HcljQERM8CHmoMzDEk4ZGA5/duFMIFI7NpSsNrtYQviPTxbGstn3sW9oI91f5JG7+khcso=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0lQzm8RIDdyh8nTYbCl1+YhIgytp8kyx1hhwjMrckDEdsJ5jE
	vSvYhL7YxB4R9S3DUM9VN0PqbISPQ8zRohMtdINc49LgNGfpNMjA/zK8AI1wskXuyw==
X-Gm-Gg: ASbGncvAqgZdFzHUQPNLozeTfJLxJyx9ipZxEdDTCo7c3OJTwE4QC7a9hpVZDl09eW2
	q6/HAQuNR02xdZGT2R4/0O/8oLCMilUFcz0gxHHTSX3y+BhE1cEn1laUQ3drdbXRyK9sr3hmHJk
	6zln5WniMCkCi1XqpHXdq017YKrLNsdZlveYYTOcs2iCZTuj9EoGDD/N1HcC6aeRo/Od56m/2uN
	S42Yb8CYRqVousns7o/5t0zelUKNIXvsnKcSy+iPShRGC8hjvauXnochbE4gg6MqHNo6vJyGDA+
	A3sQjIj14PdWzFnR6OlMd38Kkc3/R2kW40P56l6byV0MN66k15hoqUMcnz6/HHmEM1hGbH8Fnoj
	2ocmzFaZ1yq2sfvHQSTDhzYGwSe7GgzjwDhagra3nkmnEMGv+ExWOF95flY7GLlRX6OEJ
X-Google-Smtp-Source: AGHT+IHXHH/g4hQtpUyXbw2a55jyHtMmZWxsR2Yjrb1ebrbQezAfwXZaOWNhg4NlM54/48a7s2JliA==
X-Received: by 2002:a05:6402:26d0:b0:605:2990:a9e6 with SMTP id 4fb4d7f45d1cf-608c6e16978mr9487904a12.5.1750080799174;
        Mon, 16 Jun 2025 06:33:19 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:18 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 06/10] Revert "usb: typec: displayport: Receive DP Status Update NAK request exit dp altmode"
Date: Mon, 16 Jun 2025 13:31:43 +0000
Message-ID: <20250616133147.1835939-7-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit b4b38ffb38c91afd4dc387608db26f6fc34ed40b.

The commit introduced a deadlock with the cros_ec_typec driver.
The deadlock occurs due to a recursive lock acquisition of
`cros_typec_altmode_work::mutex`.
The call chain is as follows: 
1. cros_typec_altmode_work() acquires the mutex
2. typec_altmode_vdm() -> dp_altmode_vdm() ->
3. typec_altmode_exit() -> cros_typec_altmode_exit()
4. cros_typec_altmode_exit() attempts to acquire the mutex again

This revert is considered safe as no other known driver sends back
DP_CMD_STATUS_UPDATE command with the NAK flag.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/altmodes/displayport.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index b09b58d7311d..ac84a6d64c2f 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -393,10 +393,6 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 		break;
 	case CMDT_RSP_NAK:
 		switch (cmd) {
-		case DP_CMD_STATUS_UPDATE:
-			if (typec_altmode_exit(alt))
-				dev_err(&dp->alt->dev, "Exit Mode Failed!\n");
-			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = 0;
 			ret = dp_altmode_configured(dp);
-- 
2.50.0.rc1.591.g9c95f17f64-goog



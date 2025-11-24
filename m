Return-Path: <linux-usb+bounces-30863-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB44C8094A
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 13:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1661B4E9C2C
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 12:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2195303A0A;
	Mon, 24 Nov 2025 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dc6VnD0W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82633019BE
	for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 12:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988414; cv=none; b=gNpqWljmqw7ejm/4hmBRpXcj07Cb5Bak43/FjWs3MKNs5oHvbAtp01GHm4d7S72gF+J/Ostwy1VkzURdGO4F8Kzg66TqAcDQ4KJzuDDNcnjUwHyoHm3bssjjc2MHZQNBbh1+zHq4yVNOT+0b+u6CF0Tnflx00mFjQ1tGGXdgSeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988414; c=relaxed/simple;
	bh=WiqBNXOl3cRjaCJAYVsy21ddsz+svXl8bRrhWSOeHSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SkIkF4eM5/0Z/MepqftNw/aa4+HXlVzaKGywy0W9JSUv3+pweQ09BlvBIept8XpYtCFBDPCjl+OBpJokRlzAjapDpDy3mwyXclgLn/zL3SEVHUH+8E/q0jXwAVjxjuxDjh9R9C3Rzu1M0qD8hqviqP4x4JUnfHLTvSf1ByrUm5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dc6VnD0W; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so7424504a12.1
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 04:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763988411; x=1764593211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20W+VePrDZCUNpW6oks/2DqF0UJGlQouxoOcp4kUQPw=;
        b=dc6VnD0WJeNYTYvaDihdVjyiBRiWbI4wM1cEhyi7qCUUwG56Iz25W5lWDqjiTrJngg
         uoBZC/D6Uw57KuI7PNoUtPq1aTSr2Xui2HjYsvotsp+W4mJHDeah4OzBgTxyoBtNt+2/
         vhfUZTzFyePlh4PnahJWfN8g0p0iOZZMKD+tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988411; x=1764593211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=20W+VePrDZCUNpW6oks/2DqF0UJGlQouxoOcp4kUQPw=;
        b=TWMex0HqL1Xk6glYDnH6Ieqy8SLMhrZov3FE+1xoakzUchDXM3HhcwHahdGTBnFiBq
         nEeN8vemMtvRyewOlHkL78Yboi/iu58/fcQBtTmzyZadJlt30gjURnLCfFzceNTR3utX
         lcfynW+C5OogPmXbcM7Qf1dlkGzLxbqyxDVx7ZlrAMUOtznvhqiZpxH95gNu6Ge/W2AH
         hkpPSnlmkL+hBwISMt6vdxV66JBYtqF/4qKyFolti5gwWPa1kJL+KxpQtU0NmSYtaWK+
         /mVVXsTMl5+NHce8EEYvSzOq/N1JXlj8nnQWfMf4+H03a0aSu5WYHUXH3EjleUN19jL+
         I50Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQVRSCIBP8CgWqpo2fZJs+2Umn3XmwacqRwsfVJktCZu4om3De2SeOuPL+3CHX4PiYT+J46WwUARY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSuOjXAug3jOq+EpYBgLIIAQFiu1RmfkiOYMkYdcmeCrEvZpXy
	9hrcHF10phn3dbE6lFQOb3d9I1EiwgooIU9ETp0Iyv5/AMEy3mKmyJSeDgQ2zwf9qg==
X-Gm-Gg: ASbGnct47YlCdl6m/nTDbYdIrA2KfiZvBMo4EOmRgLZ+wDuFU4ATm01EQpkpbeJc6pf
	NkyQFrjAlmwpy4I9Mjq3rH6fk2P8K1PQSEGV6F+SFXew6P2GpWbZwD7wrBqO5vEEY4/ezBnRYY4
	FBGs7rs3KCrR9MPmgr+Pq66BbGg8J1QdGZRQVZn2EyH1xCm1L34I5X7lETY9EjPgQGabrVBWV5m
	s5lv9vhY6TvNSJqFk56mk8Kfn7NK3wpZNEbXp2K2bIRbMD5YmO/aCcsG3LLZ+X1wqE7uySmig/d
	0HM0Gtt3sjDe7ni6F4KJuMikr9TwA7Y4ptnxlKAvrVA7XrJVeDjS5WBPZHwftWJLWpSjg1zE574
	CGSLIdo+3KYCrTo15kJrv8NJPwyOdJHMSD0SE0l/T7VFzQGbahkzyMKH5X5L3W2TaXe0v5vVMGT
	cVhN/e3vD1xjAVQfW1CYDEK9OpL4mPBG9CpsSV7IkLL7iDJlK/DtQOOweEkYhnJZrxBd8KS6Rw8
	TvF1qn8dRA=
X-Google-Smtp-Source: AGHT+IFBc5f43ZGu6GEElbBrb99VGVIcJ0+CIqsv4BCyTkBuMMbiuLeutPFKmbIx7Sw8GvAwIvAE3A==
X-Received: by 2002:a05:6402:3246:20b0:640:c640:98c5 with SMTP id 4fb4d7f45d1cf-6455469d112mr8681807a12.34.1763988410986;
        Mon, 24 Nov 2025 04:46:50 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536460ea9sm13342599a12.35.2025.11.24.04.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 04:46:50 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 3/4] usb: typec: ucsi: Set no_mode_control flag
Date: Mon, 24 Nov 2025 12:46:38 +0000
Message-ID: <20251124124639.1101335-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
In-Reply-To: <20251124124639.1101335-1-akuchynski@chromium.org>
References: <20251124124639.1101335-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag indicates that the PPM allows the OPM to change the currently
negotiated alternate mode using the SET_NEW_CAM command.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 9b3df776137a..82c3efd72639 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1700,6 +1700,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->no_mode_control = !(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->version >= UCSI_VERSION_2_0)
 		con->typec_cap.orientation_aware = true;
-- 
2.52.0.rc2.455.g230fcf2819-goog



Return-Path: <linux-usb+bounces-24788-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1072ADB220
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 15:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D0FE188F2EB
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 13:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09E52ECEB4;
	Mon, 16 Jun 2025 13:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L+s8sUSS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0D02E2EF4
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080808; cv=none; b=H4OFKq60PXmK0LmG/za7nefYUYiwmGjhcjCSuIpCSenAtV97zIdDPaF+aOao0ZMqBKaPiLgk6jD5kkW30YOB9rKOirtWSurFyIuSRUgghdqzKNVe9OTv/Obo8jnqX3G5EV8tJEreiy3swEQoR8AsPR9Kg6E3Pe7Onoe5V/SkN4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080808; c=relaxed/simple;
	bh=p39s08lBsdKyWiPzDRau2EzpDZFXgqJHAiwGMuq/Nwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jig0gYigjLnKpJXMifjaGEVXvKKDwNa6u79LgQ+rkKmn5RefISE/OX6tpNRkokCECuGfU/JjIkPLs/2I2k1O9wzZPUvsJoFpVCQbC8Xt+3GpWkwtImOgAlRfpf2gNGzYyvctC3IpccvJ0UClOp8n4fhA1estHza7JBWDaXqU36s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L+s8sUSS; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso7536893a12.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 06:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080804; x=1750685604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRxqEsXbtVo0LTo1eLfkdMCcKn/6qpCdwe4jbm1dkIM=;
        b=L+s8sUSSF/Udpc2RkSiAVy5YerjD1X0adZ3u36b69fv6wfyOYFbxbDVj/LGqq0gAst
         78jPhM7PY4undtTcqLg7rXKt1/A523FOJct926umc43ZdjUQDwp/PjZjFlqAakRYVjtp
         IXeg5h/zOg+F0XF6/IPiPvXTp79mDzaJ3hTco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080804; x=1750685604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRxqEsXbtVo0LTo1eLfkdMCcKn/6qpCdwe4jbm1dkIM=;
        b=QHgeqOG7WE5aJVj51ei75j+BDSlxTUL64tl5AQB9CnmEW/GNim1h1b9C+EMoRj/XgQ
         NuS4jCPnvU/A4sJLQbb41JqwX/0lP6lIz/2oS0AU1rrDO8Jbg+iK+jMpoqWqhB0ap8RZ
         41erWXXu9NhUegoR1Hk15Cd8T/P6eySnHbayPGQz4f6DTCzPBnSy+2cUnlvJOo7TfkQJ
         hctnH/yzm05rnJ6d122dGZ54BdJ/AqI75YY+h3CQYH/U9eShc45cUySHbjpwH+QSzj6H
         M5qF8JipsjFoZWW9yWvIHLXcy1Pdcw0hlrETEl2pAsvjgcgns8paViWhilieUb8pDE95
         /csQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx0Aty/JgnRjBbhNcCrqK9wcThBK0QX5YOGP7DE/VXyMBprzzAFLOTyFjuvLohPYWVeQrk0F2ipDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN5ePZ32OzdqQYgFWEsHx8bHiVbaJYyfcsh9foMt1U6Z44Xmos
	mf8hbECY7HPzY/NYEYJ5Yiuqcu72eskS3sJXbHFYZTuY+TAUzLVU47F79ow1r52GIA==
X-Gm-Gg: ASbGncsAU8LVcX72lZJAWXvxE4qLtHA4sMnmXv8cMizD159M5SMP10InTllfsq8IiOk
	PzVVYDS/Q4jsy4NxFBT4Iocmznh0T2Q/ecCHlfY4vzeRP7OrD0W/dMhykETfHhD08bvXKKDuMR3
	3nj1uC77GSSdzqgEVc7WiK4C2OYWwZPrdAtHzxPz1o1tiW5J69rQYrvyA6tvhHEbshSBQiWCXpp
	jc7vFQvVlVSgB70bquZLhuQUWmIA6gI+o17MmnxPEJhf6xNql0GTed3NnRpsbplQ667k0OmDViy
	mGsK68ngQyQCH6To8RixUpPNICsHxKIMgJBySaI0ZWyPM3mrOgTB7acEoNuXZx8BSSaClf4Pvuf
	XAhzPkwlBRaaTHYILyzY0Z6K+K8MsQLwwBMMEX7htu5B2dMffIiAoC+V/TA==
X-Google-Smtp-Source: AGHT+IHW7N4V3Xmd80K442egDP5c14Z4Wwz41/QwxRTZ4VwR1xjfYPTBJjTabMbR2EIyF9mo+GlBTw==
X-Received: by 2002:a05:6402:348f:b0:602:225e:1d46 with SMTP id 4fb4d7f45d1cf-608d0835bf5mr8908309a12.3.1750080802251;
        Mon, 16 Jun 2025 06:33:22 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:21 -0700 (PDT)
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
Subject: [PATCH 08/10] usb: typec: ucsi: displayport: Propagate DP altmode entry result
Date: Mon, 16 Jun 2025 13:31:45 +0000
Message-ID: <20250616133147.1835939-9-akuchynski@chromium.org>
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

The `DP_CMD_CONFIGURE` VDM is the final step in the DisplayPort alternate
mode entry sequence. Reporting the error code from this command back to
the Type-C mode selection logic allows the detailed result to be propagated
to user space.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/displayport.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 8aae80b457d7..6f754e696d93 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -241,7 +241,9 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
 			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = *data;
-			if (ucsi_displayport_configure(dp)) {
+			dp->data.error = ucsi_displayport_configure(dp);
+			if (dp->data.error) {
+				dp->vdo_data = &dp->data.error;
 				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
 			} else {
 				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
-- 
2.50.0.rc1.591.g9c95f17f64-goog



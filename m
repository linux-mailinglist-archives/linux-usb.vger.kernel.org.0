Return-Path: <linux-usb+bounces-15460-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 703209864C1
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 18:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E7FC1C2331D
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 16:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF068288F;
	Wed, 25 Sep 2024 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CeItgtvB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B80B4CDEC
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 16:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727281520; cv=none; b=iTJVgU9F8L19Fnr6fDAqx7nnt73sNb8mXrm/FlWUIuZTETlqSIcDCC76/fuN1qjdxsylnqWQOArbRzkJ95Jsbmcoy9ZAeDNAWgoISvc+ixU5FkBIXxe3ECKtTxOpnvLlGOEYtdvsor5cnFdGHIuaEDRcxEWtvU3SFpeiEAku62w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727281520; c=relaxed/simple;
	bh=B/aYBTa60A9g90oBOpffUDM7pG4axnORwfirwaLuURI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YEVwli6o40fACbZoACDJbWd6+6M1B309FrVvuI3FA6WH2gi27q29TIUajH5ME7bY9qCTi55e35jDHJqJKqjsPPMrWfNS2PZRIoN0+JmWm9+/PFGofFZoSAlT+hF1zfr8j+VAT8f1+3qawH7yoeNnEFTU96zgaKENohr/Gq7lBhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CeItgtvB; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7cf5e179b68so75147a12.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 09:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727281518; x=1727886318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=li8IhGzdBecmdmZEMsV/NksrzGw4yHw1ja6oPqU+zCY=;
        b=CeItgtvB2mVjg7AZzpg/MNIpruRwGVF5e0cMpKNL9fG05Tsl8K9HdONfCshVW6ZiHX
         K9jUywR71TygRNecDH9mhFmhI/guIShGQyYELN0gJUCuUcSssSHOHBhg1A1oVUK1ZuMV
         WF8UylFgWmKR3HhDjA5nnwd4uWaTScvqiHa0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727281518; x=1727886318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=li8IhGzdBecmdmZEMsV/NksrzGw4yHw1ja6oPqU+zCY=;
        b=khKKODr35qYzq0XZFNMWnW1WGwli0Fx6GCCop5Yh1LU7Ig0PdKk0Z529VpHY2m/otP
         URwUmx3EdUcapr1ry08duiyKh44w8t1GTSFc2XDcMNZ/xPx89z2cSFubg8rCy2knvuKZ
         ARH3mHQUmIbIFd57Qi2my2BBqvdUgAyC2Oh09Lmvoxaq6wQRn9SKR/bBBJ14KasakISk
         yU1ZenU2bIo/ylnGwBB1P+nYiKHZtEVuMf8DCMxN8oxZiHtKSu79cD2txWrAUOX0tgXx
         rdokmjo4mCIrcYq1ofKuTitI78xNStEAOxBbWexZu30bftjXE6gpCNXv04bEeF8fHv5N
         3Gcw==
X-Forwarded-Encrypted: i=1; AJvYcCUVomvKicIUA2EEsHvAsB3UY3chlNkgntjHJGH2ZFomUNsXUfDOgnBiVWvl/P8vbJouHfXpWMDiIGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn5A+iKkRvp0mpPIWe6XIFnDK5JhHrKJxWalKWh4Mj2h0aUQP9
	uE+bXjb+Mbkkrv67a5FbgRKKLY4olVFo4g4Ms0SkYx6BB/jX1x737Hd0DgWV3w==
X-Google-Smtp-Source: AGHT+IFMT5cF7Fy101YbQOPVWEhNSeZB2W0BjXha7Z4XNH7qjSAj0pLjLalziUhJFRR8caZAYC5Zfw==
X-Received: by 2002:a17:903:28c6:b0:205:841d:1221 with SMTP id d9443c01a7336-20b19c6f3f0mr1932145ad.24.1727281518406;
        Wed, 25 Sep 2024 09:25:18 -0700 (PDT)
Received: from localhost (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-20b0e4ed6c2sm7061535ad.271.2024.09.25.09.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 09:25:18 -0700 (PDT)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org
Cc: jthies@google.com,
	pmalani@chromium.org,
	akuchynski@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 3/8] usb: typec: intel_pmc_mux: Null check before use
Date: Wed, 25 Sep 2024 09:25:04 -0700
Message-ID: <20240925092505.3.Ib7a83adb069df1cb0a40dcddff29618bf3255700@changeid>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240925162513.435177-1-abhishekpandit@chromium.org>
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure the data pointer in typec_mux_state is not null before
accessing it.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

 drivers/usb/typec/mux/intel_pmc_mux.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 56989a0d0f43..4283fead9a69 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -331,14 +331,19 @@ static int
 pmc_usb_mux_tbt(struct pmc_usb_port *port, struct typec_mux_state *state)
 {
 	struct typec_thunderbolt_data *data = state->data;
-	u8 cable_rounded = TBT_CABLE_ROUNDED_SUPPORT(data->cable_mode);
-	u8 cable_speed = TBT_CABLE_SPEED(data->cable_mode);
+	u8 cable_rounded, cable_speed;
 	struct altmode_req req = { };
 
+	if (!data)
+		return 0;
+
 	if (IOM_PORT_ACTIVITY_IS(port->iom_status, TBT) ||
 	    IOM_PORT_ACTIVITY_IS(port->iom_status, ALT_MODE_TBT_USB))
 		return 0;
 
+	cable_rounded = TBT_CABLE_ROUNDED_SUPPORT(data->cable_mode);
+	cable_speed = TBT_CABLE_SPEED(data->cable_mode);
+
 	req.usage = PMC_USB_ALT_MODE;
 	req.usage |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
 	req.mode_type = PMC_USB_MODE_TYPE_TBT << PMC_USB_MODE_TYPE_SHIFT;
-- 
2.46.0.792.g87dc391469-goog



Return-Path: <linux-usb+bounces-25303-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F320AEE040
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 16:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EF50188526A
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 14:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEED428C873;
	Mon, 30 Jun 2025 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IBpaNIIS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F3828C5CC
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292778; cv=none; b=u8REGNcXCDcQL2glGivEmcsMZoaayX3N80S/WSWwit10e8Egrr+fw5IMdY6wSaKIYtsjZKbfaZKZY0bgpubGF0cwpkEzp+NGC6GyZl/lP1mNiI9E6tXGZdFecM4ynneEDij4suvcIz5i3nkk2P3k7TdTVQ24GQ3DlkyOj5hez9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292778; c=relaxed/simple;
	bh=ytxK9BrkKoT/N8cg9coC0zFOaRK3Cp6/HIU92e99cEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1vKgEIWPe37bl5WRtQmoKR48/9x+SkBPe8qgMBFuaopDLppGcC9HXrZM4VX0m6ahVcXodj6p2uT3wIY7Nbxl4lgDMmBrGj0fiC8yQ6LqrHKOKa/oaMbtPmybn9YGA5LVpSpDFjD8URXlE8/xI844Xdf9fmnjXbpt60hxS4uQ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IBpaNIIS; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acb5ec407b1so387693766b.1
        for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292775; x=1751897575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlOV7R9ML+sYKy5LsxmrHuBwhtr5k9iFt4a13bQXPG8=;
        b=IBpaNIISfOJcdeNC2qnfuKcaMrkxbVQfyv2YAFC0Q35DurCqYFv3gw6i9QmRT/5ohX
         QFLiR9UDlimkYGTF9u1vol5LOgkgclyxMiqfDDzppyvcNPEP0FEgi2w8HPSNPRLpLiKq
         uaFBFu39aUc4IroUg+dV06G1j4gDSr6+6dmAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292775; x=1751897575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BlOV7R9ML+sYKy5LsxmrHuBwhtr5k9iFt4a13bQXPG8=;
        b=IAfTF9755VnSHlt+4wCeCNDx6ps/wZdTz8QMPdlaa+DETAXpoVpEmtq0LfnIjJXSqW
         2i0foLn70/3/N7tQG2q9OCk4B59IB/Sw3JAziumDoR5Gs/6J1BUaqwlYEs4C8OE29yjX
         EcCXOJdo6VA5BjkSYOQM0xfP5CG1Xhi+Yg9OtjynYOXJxEN1DkOFrMouUx6g0xyZvAJW
         PtJGpjaCkAVH588L4oldh24nGItGyCzdjeXmjjyxLit7ujtreKMmuiddIb3YYvmcVnRO
         ZTsr32FlGcW2LTgcRPC7cXYn/W0DLUoYdiveWY/DZofKeohAE7PPbjYIr5A46eQNTR8X
         L/EA==
X-Forwarded-Encrypted: i=1; AJvYcCVBH/o3DyrdvFsNDJEC3KPFzpRTUsRWbfTFkYOJoIXcN023aQF3Y3mbR2w4/kIS8dhcR+Uo90NPsxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCJsYKvYpgTGRJzHifkZ9cMtVqpTvdV7PEhk98Yk+zqawhzoiT
	2Tf0U3VRiFbs+I+2n4JzteTyzfMwjbH+VLVmSa5r3gxgEDKd975ci+TCxIHqJVGB9Q==
X-Gm-Gg: ASbGnct4dUdW9OD/gQ1SggUPh72U5UC6MlHehenQkaA1Nb/BW8EHTVifW8QXYlBZnvm
	dZtaulnRvl7br7zhoPhGJtnmCCUDnZwPrLipT4i4JqDcS/BdOGLiMoxT36jDqgwmxK3lBVA9M2m
	RrvcH8E5XSu23cc/sapuqEZrwmJe//qbqik/PhnRTprEVUTTd4gA95sNwwFq6/z6V3A3IImjMhy
	zVsfdQVROnOhko6gDNAL8n516oFC6wpCM5Ccjv2HZxYolJa6rhWHN+UPuK/AUiOgMAcZLaGHYG8
	Tvk6ELs5aPbJtYx4cjKJb2NpFugrj7omFzuh9rxggLdEvMQxs0mu0T1RdeDKSHWqj3bmmNDjwg8
	QmF+MuMmgMWCAAAADygUiuhxqfSxSLY8F+hhjLvu65vIOXm+svLLO
X-Google-Smtp-Source: AGHT+IH7cGazfkX+Q/r6UXJxDNNrYEeVRMUy3tM0qgcbXb/BVt0v1LwGWdxtyfIaNhvclHwiul1KLA==
X-Received: by 2002:a17:907:e2cd:b0:ae0:7db8:4189 with SMTP id a640c23a62f3a-ae34fd38c3fmr1311198066b.18.1751292775141;
        Mon, 30 Jun 2025 07:12:55 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:12:53 -0700 (PDT)
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
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 03/10] usb: typec: ucsi: Set alt_mode_override flag
Date: Mon, 30 Jun 2025 14:12:32 +0000
Message-ID: <20250630141239.3174390-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250630141239.3174390-1-akuchynski@chromium.org>
References: <20250630141239.3174390-1-akuchynski@chromium.org>
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
 drivers/usb/typec/ucsi/ucsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 01ce858a1a2b..1372becaec82 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1616,6 +1616,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->alt_mode_override =
+		!!(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->ops->update_connector)
 		ucsi->ops->update_connector(con);
-- 
2.50.0.727.gbf7dc18ff4-goog



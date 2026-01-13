Return-Path: <linux-usb+bounces-32261-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9868FD19056
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 14:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BED74307F725
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 13:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A4C38FF0E;
	Tue, 13 Jan 2026 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lULCgikZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA1338FF19
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 13:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309554; cv=none; b=TZT+eOLLN1OzCpt3m3Rrhv9vjgJwQo8EK8OSp2nE8l8+Dsh/pKtm1EzYi346VMQezDLl0aRUZtUGBtuypBNDPhXXrd8vwZoNop9nVvEypMyYJYk94eT/JLDUUy+yEqJoxCcy+0dH02/2OycTsn8rn9MO1sOVQjal5rrzkHAcdv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309554; c=relaxed/simple;
	bh=+JaIC+XYxgvHZoYamzUQwiwiebl7OEagOKElTNuRHxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j1lcsgm5Ks1z5UeUAiC/2et5+F6ACS/0XOia6WeKpbeqJQFQN15Cvjy1vYYHXvpH80pTKRox+V2EApVUDwqYAjgkUdH2ZKnBpIpGvuJZbIHXR2/t2TXX26Ys3fp88zattNkyeqZZUB78OYKeTelB+5SQZa5sfuDOYCAB9lY3Yq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lULCgikZ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b871ba73f49so307377766b.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 05:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768309549; x=1768914349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCVsnNiF9taQOhEY911oRHXRaOv1GHlaDH7WrNRKjM0=;
        b=lULCgikZ9xqriZz3C2Un6O7XdKXUaexBb7HBb+v80iI8ry373rORO23kvuqv9DAl09
         LoenkHcq73pfZIgD1B5qwEcN8jWHhrWmWMHh/Cl8Fs11Kqo4N6kZquFIpi+pyG3xqpfF
         KfgigfrxwYJipvF5ioEeHjBD+Nu6zp1agymRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309549; x=1768914349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZCVsnNiF9taQOhEY911oRHXRaOv1GHlaDH7WrNRKjM0=;
        b=mMKuWVQMr83+wk6jFdvbVB3Y2PNdoN1h6mLaJS0vOS4qevyh7fZ29gSIhDQeUS2KzT
         sPGbxqDNwndniNC3VCR0D1A0dV2OFNcF4W4vg9MrgGs9H6T9ecqtYWrdYrSl+skLjznV
         4f360XNDlKjoXh366m+JSzFwF/qiEK3uvWmRx6pBy9Xa/Z/YQs2iKWndwV0DfNX72R5d
         BuZuU+G7R4KsUrl8bKzBhKpNGh+gDLHb07VJFxQjdqQyevqUzwLsreg55QRTJgIYZaVJ
         byGkXnMrhi6XPbCVbEwF0cKUBqMNomLFXoXsDrEfVYj4yUKFtZsw7zTiVNUMVVi3bJF7
         0A+g==
X-Forwarded-Encrypted: i=1; AJvYcCUNSYqUJlwOVEFjqNAHHlH2ybzZ5Ny45Gjv+ChrQfrsZIeCJiFSqRX9FKSyQtG6RD5QQ58VdiZg/vI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1DArDsahV9qb+OHmnlmm7K5IXZDcV8imfjdbAUtr+Z/RwFrwF
	yaZ0StdfUnCSekBpxQWcuUymsOnAcWWvK7E3kGvlNZHFEn6ngwJhsAeOrLWkKmeTlA==
X-Gm-Gg: AY/fxX7N0MaGSjImVoRU+Nr7azqOEoCOZdHmVUmSbrfnNt8Xxchm3XW7R5UeYxgIt+G
	DqrEL4nwHuATHoSvfkvQ8hil+tcS7j/Ua4qxo1LsT0ahowl1rXTesk0JyJK654rCzQ92WA/OAXT
	dRHR+nXATgTfdEQYx+Eh0QPZAwtniCr6Tzca2TYNeqoyIT02j7B3ozSrht7McAtoFdSEHWcoqAp
	WsZL1Sp8QkhePqsKuNwzem+hZQQ+0HXScAauiBYgAmPiVhnt4zanLjKzo//VY2/oDD6WIrSD60M
	e4gpPohPqd2wzGyBsg1V3/BycfE+luc263m5f7A5pKFHkECcLPPeRKYG1PiFOIFVTCQBy41xNAM
	u3IM/v0pFt6nrN96EmrrrbfSUhjmOSywwXmnhGCS1YR78UyMcpK6MtRlbKf2hPpuQivfStDfy3F
	uqh61lknS2CasP2Iuh6SSTJ56/Pkq9dtYZtcSd7EYKBsjxH6NnJ6OYg4R/stW1xrbvnR5RgFq5H
	woaWNkA
X-Google-Smtp-Source: AGHT+IHQrZeQ/CRIvkRFs9Xv/iIOSXPTXMS2jM8rkvlNg8AKY+SdRTPp2Q3LTRtbojrFp7c5Z7Rq6g==
X-Received: by 2002:a17:907:7b88:b0:b87:892:f43f with SMTP id a640c23a62f3a-b870893074dmr819575266b.29.1768309549279;
        Tue, 13 Jan 2026 05:05:49 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm586217266b.63.2026.01.13.05.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:05:48 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 3/8] usb: typec: ucsi: Set no_mode_control flag
Date: Tue, 13 Jan 2026 13:05:31 +0000
Message-ID: <20260113130536.3068311-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113130536.3068311-1-akuchynski@chromium.org>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
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
Reviewed-by: Benson Leung <bleung@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index a7b388dc7fa0f..deb210c066cb5 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1659,6 +1659,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->no_mode_control = !(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->version >= UCSI_VERSION_2_0)
 		con->typec_cap.orientation_aware = true;
-- 
2.52.0.457.g6b5491de43-goog



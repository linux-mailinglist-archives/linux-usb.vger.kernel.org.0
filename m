Return-Path: <linux-usb+bounces-32504-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 895DED3AA18
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 14:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C5DFC3006731
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 13:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3337B36921C;
	Mon, 19 Jan 2026 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fa9z9URx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23018365A03
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828727; cv=none; b=RRxNAMRcTesiblxwpbVaaZ03GVt37/vspBLFfaqYeYXangTnRdOdFYQaP1c1KI+/1/aPLszyhgI0ImyeMbzzNaxCMwmOcVMnGo8Te/+rY+xzVsBY5fwMp9vIZZGfPytNHj3wsLgC+EFlWSQEU6rrah4aIeW3NwXSndbiV1B4iUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828727; c=relaxed/simple;
	bh=aP2YFO92lDva0e1jN3T5U5hBf2PD7EyvHXkgrzxR9eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iI8z0ry+R87g90rWKv6Rwowqs+Mwo90BvDPkYsOZao9cfR8xIMsi36DszsPq9gq0luMp1WHmEanr1dCGKCa3n5oauFXDAYfJFB4NRtF6Km6q+FWDblBk80+7n6nDJdq6FzKj8cWUSdXKcfyCR419koNx32EPVTizVNaoNj/b9Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fa9z9URx; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64d4d8b3ad7so6892398a12.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 05:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768828724; x=1769433524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHMLWRy5Z3mpMYGMUoVXUolvpCNuwJWbgQEgoyJgmAk=;
        b=Fa9z9URxBN1jC2DM2DnhmVQ1GBsz19w3IkeupgRbSS4QpfzH9o98RGe3j3V7sy49lJ
         JNg7vNH8epQsn537pCe4FC7gZtGY2cuxWjGavv6elfmoDe8NgOiOV+njEeMhjuy9wA1+
         +/3d67JOucW+S1lfxOKryVjBjqhRM2E7xcuDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828724; x=1769433524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KHMLWRy5Z3mpMYGMUoVXUolvpCNuwJWbgQEgoyJgmAk=;
        b=U5prHTMjntE3yNt1uV7wGPIyGqYg0gKttLloOLgrxNaBerKkzucFWGHYvs+7tvHaXR
         JAJOBUzwM9fkq1H9PeJnZ9rXalZedUgt+zHAtSfJghowld+8WveVqY/JW9wz8DwYn3Gv
         bLc9cRRcH4maJMubYjCsCZe6e6oodrO3SugFKhQSUw9jxuDj3CJpSMdAhqU+eCKO4ZZA
         iClsJ9VKcyB5JLqJ9zCPMWX7sKvde6TXn7E7OKJT+qKZmdap6yKgPhE5Q3WT3fFgeX3n
         uLHaiAF6YLw0q8UDbq7SpWmiS+yKk/OtEHklcOC6xYRL841Qarq/ryKBBJlDanKH8KXV
         pB1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7eZYjbzmz8DJFUVyWmYPKWJRpQMEPfb0Rok7eXRLooafHR3UUYS3g1MAZ4a6EsmzVHnXG//pDsS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxvqoddAsbLYQtUzbsDTtQLvMgLiXolWT0iLwHzN16mEUJYHI4
	GH3//Itv6vzJBBiMTCxx4CNzA8aZYFhFNFfqscXpJotT97/dXKXbaxDxULkEG/Q2Vg==
X-Gm-Gg: AY/fxX6BKbHxPi70NbbRMBTKtmMOaOuCwknaO5z6peuv14urDmtwafft0NAbZ3dQ6s0
	7bK+BiHwcd1p+wmf9gPwu/rfxLJc8qkq9kO+RTK0889fKBMy1ZPdIC778XtVJXCdkq+oqp6rgLq
	p0anlpt4zmcrV5+uFlM082lMN4lrrq8LSmM2i1kRBoRoswEuRnnncaYZNDIdWqLxg1ayECZzXJz
	9wnBrkg0QPyBcNrKsNdIJYuwW1g3KrizeAVjcezHqXYcTkgymbXG+LKs/HO9nO5SyZ+tr3/7NbX
	AoBp1s346ZSC84wTbVArzJV1nkUmhYyRX4KrknpgKug3PiZ54jY7e8K+vPPTPXHRwR4uKPW63DR
	95d75n9Tbp9E1/zqPJScGdP6et6BAo/t66iw5+WDtHKVWKB41NY4c7uIizWM4u3caour94SOh2U
	LPIDhrHXhX4fAOkqQr+T6ppuTkZgO6GRxXsh9notTZfw1klVyGtQi4Ens1ozofLnwJTrkSjciNM
	lMDtdtj
X-Received: by 2002:a17:907:9713:b0:b80:402e:6e77 with SMTP id a640c23a62f3a-b8796b9da5fmr999144466b.54.1768828724407;
        Mon, 19 Jan 2026 05:18:44 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9a14sm1078801866b.45.2026.01.19.05.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:18:43 -0800 (PST)
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
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 2/7] platform/chrome: cros_ec_typec: Set no_mode_control flag
Date: Mon, 19 Jan 2026 13:18:19 +0000
Message-ID: <20260119131824.2529334-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260119131824.2529334-1-akuchynski@chromium.org>
References: <20260119131824.2529334-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index b712bcff6fb26..c0806c562bb93 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -491,6 +491,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->no_mode_control = !typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.52.0.457.g6b5491de43-goog



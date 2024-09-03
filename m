Return-Path: <linux-usb+bounces-14587-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 330D596A459
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 18:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 570B01C24170
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 16:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A3718890E;
	Tue,  3 Sep 2024 16:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i7NwbGri"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CE618BB98
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381048; cv=none; b=FjwKoCXv5xGK3GFd0JUAHYZ6Ygdzui76Q+K7K4S3h11LcXQfj4tqyFfB3Tb7IMSnXiOgB3lb6depCKYsARIxglVz7PGffBgEMgDB7cM+VkASkrbiJCIOqkjcAkRakB7+ayOzIepiTVVWe4E2ByDKj+OfUeWkOB3ObEqqhjy2/KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381048; c=relaxed/simple;
	bh=zeFAAnixERBujmnP+OfMoylgALYCdPQWy5IZUOiSTn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JHRkfR/zYhiKpyeqEfhg0BNWupz9tU3rim2AGj5+oLZsixuoJTaw0qyyl+lq0d/PIBy33wgKQ/vWeIe3XCPD4qK9FVKilLWEAGUOjzpp3yRYpRx+94pn3AAs5TeDqX/ex1VtfGCMLrzETV1+mgYJ+TP4qBDYua/ScElSKYtsn9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i7NwbGri; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a89c8db505bso357432066b.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2024 09:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725381045; x=1725985845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1529kCYToVWA/SvyL2miiVbvfe9UVSeUX+iIF/erMtM=;
        b=i7NwbGrigDbN2NP4Qo3v8Kt5xvTdLcYBhYpgPiLuaYiBs+hF6fHh8w9ixqStX6Z50D
         fe8is4TCeTFh01ngggKmgpqcT4sqetuzJ1Z3eH/IuBQzHrLOCuYJB3rhdPlR+D0Xjg/X
         UVrY6Qdd3FUczgBd+xHfP2hDE0jlQ8/+rAN/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725381045; x=1725985845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1529kCYToVWA/SvyL2miiVbvfe9UVSeUX+iIF/erMtM=;
        b=to/5ZxQzUEY4OL6EHTHtWvCZ5tE6d4btFZzkXdpxKfm7vU3sDujcY9FurIdRKDFihw
         xEe2C0O4Q9tfcOmFNO9NWpG0fOSDtKP2BnqknJYlxSW0ih/s4lLbJcyuXnjLbgx93Uuo
         Ew+mOXDX/LUd97qx4D2sUKZhvHij/T02BgxmOmFWa0cz7HZRuKg5QmEZU3XFV2ZuD7+a
         J6IA1t6Nf/GDrpJYn1una2JgiP7dzp1IyrzcG66iAeMN4jl0AWYcz6F0YPnY69Q6M2ha
         ay/ZPfOurd8g/q4dqtX7O5LhtshF3E6gLuZmRrIO3r2lx1rfbMyVlDsm2Cs0aCghMTlB
         fg2w==
X-Forwarded-Encrypted: i=1; AJvYcCXKNCTdJMKmZLdO1JoNCurO7//e6yl8tuvfo2GD8h5AFFyKc0O25mkvVNg6SNDabQvEY2wabxYTPKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqTbBhSjBnHyCUFDQtBDjMBYXUbm8ITdrzMXJe5va1HW60OcxF
	Md20zNVQjm4gZGqEMnaFD7FTQlSNUSQdCCCfjraFJisrFqsTf/gzcUKowex3
X-Google-Smtp-Source: AGHT+IE98mHJ5UpNz2yGMEBg9I4YslwHEn6KQq1me3zTIU0zpG7qP0AN3s2VlMVbsPYfg6dglKz0Dw==
X-Received: by 2002:a17:907:9690:b0:a86:78fd:1df0 with SMTP id a640c23a62f3a-a8a32ed8959mr101502266b.34.1725381044779;
        Tue, 03 Sep 2024 09:30:44 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196bc4sm700685866b.125.2024.09.03.09.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 09:30:44 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v5 7/8] mfd: cros_ec: Load cros_ec_ucsi on supported ECs
Date: Tue,  3 Sep 2024 16:30:32 +0000
Message-ID: <20240903163033.3170815-8-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240903163033.3170815-1-ukaszb@chromium.org>
References: <20240903163033.3170815-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavan Holla <pholla@chromium.org>

Load cros_ec_ucsi driver if the ChromeOS EC implements
UCSI Platform Policy Manager (PPM).

Signed-off-by: Pavan Holla <pholla@chromium.org>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index e2aae8918679..d5d63df7fcbd 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -108,6 +108,10 @@ static const struct mfd_cell cros_ec_keyboard_leds_cells[] = {
 	{ .name = "cros-keyboard-leds", },
 };
 
+static const struct mfd_cell cros_ec_ucsi_cells[] = {
+	{ .name = "cros_ec_ucsi", },
+};
+
 static const struct cros_feature_to_cells cros_subdevices[] = {
 	{
 		.id		= EC_FEATURE_CEC,
@@ -124,6 +128,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_rtc_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_rtc_cells),
 	},
+	{
+		.id		= EC_FEATURE_UCSI_PPM,
+		.mfd_cells	= cros_ec_ucsi_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_ucsi_cells),
+	},
 	{
 		.id		= EC_FEATURE_USB_PD,
 		.mfd_cells	= cros_usbpd_charger_cells,
-- 
2.46.0.469.g59c65b2a67-goog



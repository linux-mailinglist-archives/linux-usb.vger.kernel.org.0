Return-Path: <linux-usb+bounces-18461-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3A39F1A2B
	for <lists+linux-usb@lfdr.de>; Sat, 14 Dec 2024 00:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F9BE1626BD
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2024 23:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA89C1BE871;
	Fri, 13 Dec 2024 23:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bmKh0npO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CAC1B85C9
	for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 23:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734132960; cv=none; b=EinYSQkXi0/Sm3wxx+mlqcuRJIpm3r3yWROQqOIiGTfyU/q7GdeCv39IsZblcAHP72MSc+NgdSvOq5V79tCL3/uXWk5VXa6HvGfxey0iACDzfZ+qr873N/VrsK+rZe2WmKQAlvBk3eFb//Iyn3ETduSjxWU2HbrvQ9FLAlHnTxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734132960; c=relaxed/simple;
	bh=9hMsPqdjwTDIkVnxhSULB0CiOHTJ/6C16w2i8yp2ayI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hoGERUuXJeAtfORGSqG5f2AHswNeACbg3NGURZHJHlExKjoU66MABYUceqegDkOPJlbAIdd8fjC0M89NbKt9rPJ+sm48pjk0nSYhVAjORrw3dN18vifccrkyZQd6rBdW8xeZ8v9DpM1Jz7D7xka5IW4HDs5+dMiKk+asruuHa10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bmKh0npO; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2162c0f6a39so31441845ad.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 15:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734132958; x=1734737758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBaLRXyqu9ANmWNoElcN8EfCavDwsorcYrnJ8qiOPQw=;
        b=bmKh0npOjwhnFuMyk7bxQ+AAduTh3tDXZQx6FpY31x+DZnik7a7whzUre/mPRh7Jft
         E8PGpEQrQ5vHRoBN5pqvlPBu1M4Bg2UHXR5F0l5fHLFZzIpUgtuSXCP29Bzt4LnThjPK
         mes0Awug1yOpHm+RPi+T66cN4pVm7Gi2+Kqr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734132958; x=1734737758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBaLRXyqu9ANmWNoElcN8EfCavDwsorcYrnJ8qiOPQw=;
        b=wO88jIxxSPEzIR6BRo5PZ0+BXQkBsNcmXxu8Mj0Nx0MUcewryBvjTAMNMxAfVqo6pc
         JJrJ15iXh+p33sOrL97jy0/8fPYeEPSU5952c9cZMIA6YIfAMo/nr/GTrqoPRYxxNLHb
         NW7n+8JH9WWpesFagrJplNmuJhiwqE0MoOQq6RjaezyfQCO/ff6JJPk7E5aLfawOInl1
         Ow7sHEbiW/UsRLgw/csJffmpHmwmvmm4IZBb3OabBPyid9n0y6byf5zMeH3f3aW/Fh+z
         sTCPu8vsHSROirbixXQgx4VamCY6nzVGeaqDaFb31prkE/EMWt8pgbqEwF5cAjTO5OKw
         1MTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnfEWtPKyYWCCKY0Fl23KvCLeHUSnJqjRIvWuypj+uWEJhuX5ef4HsCazb94cg5725FYhcwn0ltvM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/IYRDx9Okyh8XrRFYVhxhXmZW0qlL+zcfGI8oooH5RRJTp1/T
	sT7EusloWNqyMgrbB4teHw488n+RYQFhkToAaBK28KaHINgHKSWb+1Kql3fzxQ==
X-Gm-Gg: ASbGncsPKc5ZrDh3SYSIQiyoW4iSVzpUrJezpQ5gdCR4l/IA0IjwUKKhVAGgZPIq954
	IUozpxzarCE2lOh9rQeu8qkClt8/LSbMML/d3rnAaMwu2SwqxSiwXiSW81zPn8yl4oo55x/dBKM
	HAZTTn6N1KVIM/WnWfhSt5cwYrSAyP9xK9m5V6HznpPrAq7HovdNL0FQu63tvRXbYAwsUpOUKIJ
	6XzmEqNX5FbWtrKOCzPSIn5wlHD5QMFuMU2E5rb1yRISi79PxuzQtupuRWnJCDcHYQhi0ZUOVEs
	EhiC6eqHJJ+sAn+FL/yFJ6GrT/mjIzc=
X-Google-Smtp-Source: AGHT+IFkLu8dhCI4lsuwjqZrtk2iI+9FAjgaYImUppnevu9yz/pPZYeDJmM8ec/4D1wBs+eOoc6eUw==
X-Received: by 2002:a17:902:db02:b0:216:3440:3d21 with SMTP id d9443c01a7336-2178c874e19mr135996475ad.26.1734132957686;
        Fri, 13 Dec 2024 15:35:57 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-218a1dd3ed1sm2974985ad.105.2024.12.13.15.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:35:57 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	sboyd@kernel.org,
	pmalani@chromium.org,
	badhri@google.com,
	rdbabiera@google.com,
	dmitry.baryshkov@linaro.org,
	jthies@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/8] usb: typec: Make active on port altmode writable
Date: Fri, 13 Dec 2024 15:35:44 -0800
Message-ID: <20241213153543.v5.3.I794566684ab2965e209f326b08232006eff333f8@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241213233552.451927-1-abhishekpandit@chromium.org>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The active property of port altmode should be writable (to prevent or
allow partner altmodes from entering) and needs to be part of
typec_altmode_desc so we can initialize the port to an inactive state if
desired.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v5:
- Extract port altmode ".active" changes to its own patch

 drivers/usb/typec/class.c | 5 +++--
 include/linux/usb/typec.h | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index febe453b96be..b5e67a57762c 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -458,7 +458,8 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
 	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
 
 	if (attr == &dev_attr_active.attr)
-		if (!adev->ops || !adev->ops->activate)
+		if (!is_typec_port(adev->dev.parent) &&
+		    (!adev->ops || !adev->ops->activate))
 			return 0444;
 
 	return attr->mode;
@@ -563,7 +564,7 @@ typec_register_altmode(struct device *parent,
 
 	if (is_port) {
 		alt->attrs[3] = &dev_attr_supported_roles.attr;
-		alt->adev.active = true; /* Enabled by default */
+		alt->adev.active = !desc->inactive; /* Enabled by default */
 	}
 
 	sprintf(alt->group_name, "mode%d", desc->mode);
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index d616b8807000..252af3f77039 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -140,6 +140,7 @@ int typec_cable_set_identity(struct typec_cable *cable);
  * @mode: Index of the Mode
  * @vdo: VDO returned by Discover Modes USB PD command
  * @roles: Only for ports. DRP if the mode is available in both roles
+ * @inactive: Only for ports. Make this port inactive (default is active).
  *
  * Description of an Alternate Mode which a connector, cable plug or partner
  * supports.
@@ -150,6 +151,7 @@ struct typec_altmode_desc {
 	u32			vdo;
 	/* Only used with ports */
 	enum typec_port_data	roles;
+	bool			inactive;
 };
 
 void typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd_revision);
-- 
2.47.1.613.gc27f4b7a9f-goog



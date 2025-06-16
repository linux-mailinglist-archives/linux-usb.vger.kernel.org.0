Return-Path: <linux-usb+bounces-24789-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74099ADB221
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 15:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7054E188445B
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 13:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8912ED864;
	Mon, 16 Jun 2025 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P5ba32G5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F342EACFA
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080808; cv=none; b=GAYwtvc557iQfeMdMtn3bCM7JJEjtWZ+Zy059e2xp9z+TyUzpjjCpfWRKsZEyDuZq1ESAGknKMNm556bdNGH7DvXjEDL8modJhcOsjysTFIcIKyFhd/97TNz6YO9KofBBYOvAsbQ/s7XfTMuLBe+fIMgm/1YuF6Sh4yOzXowC7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080808; c=relaxed/simple;
	bh=cMKsJUotDdosJ5GgRT61ngKqLnwH/Sc2vQwUb/JvwaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IgSMVOrXLbdEkfsiQND/f348gHi2DWU5WQ3gHhXueFxLynnyABajBVaRVZ+HjDhIEzWbp6rFrhg0QsDqPw2/kTyg1tzZjc4EjukEceTUiyNaSO4YKXhGF8FE5wgzwvM3tOgRgCQm46ieU61zZ+45A+YF+oTBRlyUZYEBXjHrju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P5ba32G5; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so8868213a12.2
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 06:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080805; x=1750685605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lc1xa9XGYazZdbig9CQp0aaqg5/Q33JTrH3v7YQaNmY=;
        b=P5ba32G54XHUkHVqSLXc8+9deIRH3Ms0dsz+RUhfkLPMi20QlqGv4YQl1SIgT8bAZM
         OwdoTo8TYSeerWtM8Tc67/+Kn9DTfmazu1tcQ6cVi5wwSuWcDZAP55wUqmMh1O1JejYF
         qbYsCUyTFyXQGYzoj6h5JQjsFnjwxi113I3DI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080805; x=1750685605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lc1xa9XGYazZdbig9CQp0aaqg5/Q33JTrH3v7YQaNmY=;
        b=kTooFZO8l/Xc3G9hK/Vnf66gzv0Mssz9dy8uz70yk1GLU+8U41ppu6nNHTlfyZVEaz
         rrMeUQfyCoR26Hy4W/AlX/wpNgrKXJZb8lG+oCuGokZ+10Ho++76COUc2rjE9WXCJSA0
         3Sb1HR8/495BLNSzTYoAb/PZ35wwO9PQtIc6rwXRj70xF0gmpBZ1VQQC5umZQm4vzOky
         yB/8vBjhAHNQe0q4LUjvfBTLcHnDMw940vC2CJhNiQAZ3OyccMolWOwLm0QNvJoUG0ab
         snNuZSbmOqeQkPC6wGnt/u315dJVDOaDNosCHeKXbY2awIm0lvv8iWYe8I7RQmMeJpcR
         bOOg==
X-Forwarded-Encrypted: i=1; AJvYcCU0OoCzrKZ7m6Dc7ytewLFs1izaCzixWELcnSgtTMKGy09NyR4lL/z1du6N9uAaQgMMyqEPPH/SpQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNKKSrAcf/49gQO1t0quP+XRCnSIrXCvOxOIMvCerm+xtOVhvz
	ctPbTYeRFMgJxpU2KQYcCaVKo10M6Bo2YhPyFbo3+qy28dcQ3thekpa2QOMgmHBX0A==
X-Gm-Gg: ASbGnctD2zc2+AyC+Yf/cDWpZVj8a/C1PxhePEjtSn1gcInWpuafmv+MY0zNDi3xgeI
	IGiZSRUSRtFmLYcDOlkfkDnFgRB5C0M9T2L1N3NOd4xOy7gjK71ZXNWWSCW7ttBmeJEmzrgyJG3
	DT6COkcLwYVZVw+4Cnvpk8p7eUM+1vdz0YPxvs2fQdYkEmSqIRu0IxdRYYpTj6IqtNvYBalSC5R
	1Fb1PyHUsa8QuqIAGyz3ubDxKMRVLGQRvAOxzaAmtXj+zgRbnp+TsPPwC8AsaXPoJbQ6AdC6nl7
	ACiJ3lQZNI+iTO6ly5dvJRyEs4O3WQq8CFpGL1qMmHMbZq1/+phCpgfFKpfrocEGxikQpajSxIJ
	Tvgww128USSCnuLLEAJ5S6oGyDQfUJkHc3XrwuS8tabGme+xwmuh84Isy3Q==
X-Google-Smtp-Source: AGHT+IHw6+ZqjUiGtijKP7659AHwRHhXUfja1QVHvIcjre79jMfTDQp7kopiYwQiEAC5sFmbVRn9HQ==
X-Received: by 2002:a05:6402:268d:b0:607:2e6b:47b2 with SMTP id 4fb4d7f45d1cf-608d0979e84mr9154566a12.26.1750080805113;
        Mon, 16 Jun 2025 06:33:25 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:24 -0700 (PDT)
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
Subject: [PATCH 10/10] platform/chrome: cros_ec_typec: Report USB4 mode entry status via callback
Date: Mon, 16 Jun 2025 13:31:47 +0000
Message-ID: <20250616133147.1835939-11-akuchynski@chromium.org>
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

The Type-C mode selection logic requires feedback on the result of USB4
mode entry attempt. Call the `typec_mode_selection_usb4_complete()`
callback to provide this final success or failure status.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index a4f338771094..c5a7f42ffb5a 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -698,6 +698,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 
 	if (port->mux_flags & USB_PD_MUX_USB4_ENABLED) {
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
+		typec_mode_selection_usb4_complete(port->partner, ret);
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
 		cros_typec_tbt_status_update(
-- 
2.50.0.rc1.591.g9c95f17f64-goog



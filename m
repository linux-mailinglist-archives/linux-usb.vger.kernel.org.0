Return-Path: <linux-usb+bounces-30862-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 015CCC80910
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 13:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9116A3A6CBF
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 12:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E263019C0;
	Mon, 24 Nov 2025 12:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mKy0tklM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633BC30149F
	for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988412; cv=none; b=uApID/QKXJ1jIgcE5pgMbnZUt3PXFA90gr9sch2BZySStyQw22wXgMypF6apKVatDHIcsvPy4kWI95FOed/ZMhGK+M9i7VvabEM1zDgRPNB797QoNP7NnbBx1V7rkeMUPTvMgVylimztmpvoUB4erTzpsLW+QpIRvtCrbzyCAfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988412; c=relaxed/simple;
	bh=AfTRfVR6FqansvGC0ZbCDHLMi4UPrZY5zWFqtR4JCOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jo53LWpBMeSd+G4kyxMpLsexybR52ZtW9N/3DIpOJgir550UuPahif9ovQAmjxrKelNSFTnoNG/VYyA2kt/yc0QVhQQb4z6prNtmSQq1xgMyWWnlNDGMjRYbV6k6PtPs0QLfkDw+FBdOEGmSSWpZsO0lzw1y5uFLst/DApwJDHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mKy0tklM; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7370698a8eso549450466b.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 04:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763988409; x=1764593209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcNKygSH663Cq7ccIPy1yee59jsF3OcZatBL8KE+sKc=;
        b=mKy0tklM/B5hYBaAEyhadolxZZyUkU3GKokRmKC6rqo1QIJ+wGw8Xx8wqMWv5uUmmz
         XIobtGFsyJrDxL+hhlxc9HuxsjPsruhI6ByBan/rqA4vLHdCXN2zZfEFeWvmsld9kt+v
         Ymq16iGtBYpNW8GCR3BY/QW4C8PIdRdXkyCjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988409; x=1764593209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KcNKygSH663Cq7ccIPy1yee59jsF3OcZatBL8KE+sKc=;
        b=FNBu9phR61lBqwl7+tszKhcl0BqGcfODrsneZbKXfrAFyWg4ldz2jigySD6Frg7uEH
         3oXgCVu6Xg60JuIOJv1weGt5LklxI/zifJvWKNQAKZOFfTNNuWcj0Fq6qUwOnEwIbZyE
         1lVtO/+0OaiITUkyAC+fY/YtLjCkh6+u2gGN7EU/Mq51NMk4xFXnDwHvBOYLHQFnHTW5
         3r3fNpD0RaxVoWlNnBUD+L4Y3Hi602yE7e3c7zMsXBVOZR2iNA7CYGZwWO+Il1gYTFdH
         gRhESARfhMb+wck45QaseIixwghtQKluZsAPvf7TqqqwHV67JtUHoy2TmoYnC0ekr4Xe
         zGow==
X-Forwarded-Encrypted: i=1; AJvYcCXp7JvoZGqDh3ZrqF6bevngqp6Q/pam5Fabq0kT7k88JNyjlXshfYzzOrUlvX9jgTB9agWkIbAhirk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzanAs+3swPzAOZt2exGrDDxLAyIPC03Rax44SgFSCCpBqkpcR9
	8QkLPeF4zoRA/h5cAtbQpXYWXFjybeWsD473kiL2egF7+Re6YOKsrQpc7VuHNsGX5g==
X-Gm-Gg: ASbGncur8dc8oETEhMLlyv+V2fajYPDl4GSjOKqwTCjrQoihCF4LoUkL5am4LI+Fv1E
	WwphzgpRnyXmXvOSVxyv0T8U5SRQDsYoElAumkQKAki9+eAoyZf6Iv0xUHlU5mwEc3FAPok2l1F
	aJO7e2L8kOhuUBvD0UJoc32sFX0sq6NeQUek/DloYFmFEUJYkn8tpQCSG/y8c5ZoCQNaWg3F039
	H3hxeEcxoGQidvwfWNH6Zu0o42EhRPREQxOktVI+p31bVXR84wL4hyCqbOy6zlOPEveXcziSFgI
	FnFdC6A5qeLc8NP1N999ul32sdB7q5g/te1yiKP+9Y3UtGrrQvz+rM0ItEH36hshdmGQ6qXY+ke
	u1AckUGWGut2SH6fWBEV6ouwyTaAFCwybmRAa6Zy+Ml+G+8OoFselXbWJ32nlZUrsUra91tdg9a
	jYZ9Dz+SliFukyID3ktjtEsYuolnJ1zi640M5df+dAhwHH1yDfWyL8jqM2M9EmaFU7SNY09rswu
	1pq6UmPh6k=
X-Google-Smtp-Source: AGHT+IE4LIQdRqEDZF6wZq0Q+W5lQArq5CFAWkZqHjvIypeEj3xstLPCx4WOLYpXdzHH0SS1oqU1nA==
X-Received: by 2002:a17:906:fa0c:b0:b76:8077:4eaa with SMTP id a640c23a62f3a-b7680774fecmr698118466b.6.1763988408735;
        Mon, 24 Nov 2025 04:46:48 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536460ea9sm13342599a12.35.2025.11.24.04.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 04:46:48 -0800 (PST)
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
Subject: [PATCH v5 2/4] platform/chrome: cros_ec_typec: Set no_mode_control flag
Date: Mon, 24 Nov 2025 12:46:37 +0000
Message-ID: <20251124124639.1101335-3-akuchynski@chromium.org>
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

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index b712bcff6fb2..c0806c562bb9 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -491,6 +491,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->no_mode_control = !typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.52.0.rc2.455.g230fcf2819-goog



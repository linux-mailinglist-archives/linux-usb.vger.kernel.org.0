Return-Path: <linux-usb+bounces-27259-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A672B344DD
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 17:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E53A217AB9D
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 15:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2266C3002DC;
	Mon, 25 Aug 2025 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VDbqnCk6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9E73002B2
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756133889; cv=none; b=YzsMbNu6/gWrlHGyj+Qq6XrOKXc3cFtBAOyN3+dccS2MJ0dVGrVyVSXqPSiS1K67bgCgC8KzHpVobatj1lmaBfsDjWwH5nUewB8mJM6o7jQq8Cil8xrS1RBEdHUPJsYFVs9BU2hN5k81QOJpE9t3Uj6LOvhtp10wNJ7NkD1EZ9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756133889; c=relaxed/simple;
	bh=tkimgEY4C8jjn4oRfroM6cLsK17WffIXDAl9IE7NHq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rdlBWWJENm9eCax/cfySbQ8vzcwDLCIjc1W75Y9XOLvGDl5fHux3h79CwygMVfrbE9cqPYR2x5UkpZK0VM4xfNFOYrtpgvXopYoC9+qF3QNOoltIdzy0kAnd93resSsgNpR2WQChuw9llKUK7stz11Q80WXkN1THqoHlXYgHKI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VDbqnCk6; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb732eee6so780625766b.0
        for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 07:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756133886; x=1756738686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhhWTF/hAYz+kqb7eG5oSk05Be3U3tovVz6EKeBpeMI=;
        b=VDbqnCk6jwaqWXC12jUfgzaKWOlOSzV4moyqkx7FrPWdjORbOTV7LlWNOLXp+W+voU
         mkQAaPJeQX6A1dkDDiabFx+m9CKYzpnYL93QsGSu6RODH64p+GDj3aXbJln8swo077Ou
         FrO/PTyKXja79XfveOi4ltsx4qZaikggdgehw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133886; x=1756738686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhhWTF/hAYz+kqb7eG5oSk05Be3U3tovVz6EKeBpeMI=;
        b=iPZarafDl1A2Yjl6vs0P0K+B8uR+NnK372LEww58p2UeH7UNzRXMVnZwery1cIB3pg
         h5FoMEv4Hgk1YZnLcwnCliTd/F96KwypCgBqIZc5bxyVH9QOa4ApEjlQkXp0sQU/i+xb
         rXij/pgcItaQbSZ3I3shdTBMCQFlKrapEGwPEWjU5xGCnhp4ENH2Khe7oZvOg8xsAhHk
         CeXkGs/ksh7v674AgjSi/o9o0yWOcXTWup37LRcFHRDCL5ft+WA8y0wmM48PUUAFXGdI
         EP3XhAEZ7w2Tmaj4unH6bVMCu9Xe4LY14jb96kt/t2QRMzdMxYzJs6+9416+w1XGDPlk
         sakQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7ETs+PIzATSWLF+UB/0PpRZw62A1Cr60TXpwuLvJqBNckftLDmcySClttAH4HBKYaHEAYriVVxnk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyaxhp1yj6n7xfDRPejqYb1kkLU+a+4MNbugcBtgtfky4LFKZNw
	AMeX4cAG4UH24RVW1y+gbZcEIJHeEMErT4aMDpXxcVG+ZJgj01nTI3LJTqEfKlFyIA==
X-Gm-Gg: ASbGncvO3fyCIbVO/eKQ2qyTLTifNBYkDrsOuO3RGdq4J7BO0l+Ofku+rXoAxixs/Vw
	8E62IwHF34yeTwfSYkapimyNzi4oHVhTDsbXWo8KbYCth/crwFTxLgyadowf00vLlqlPI2Ubw+p
	ooZoRYIhMs8A8nrPgCr9wBLEWT4sz7UBbYElBma5YsRzvojF1XqNqgGshQmWqh03C1RVNjPl7sd
	QfUQzi6e0nXkv/3viyVot9j2orJF+WG0PEsO/EvS2/x+Cp2TmYWkwqC4Sw6BKMnMVlbm1xfJ8hs
	je98lbjhq3XLlEZcPR+rtbobkZGmtusBHs1Fr1gASmB91Iseuhl8j0+xWngK5pDYuHabTPvEJKm
	B4rwzLdOcaQ5baos6qUgMg7GHdTu4PtsXB6IZh7WVkmUiDgWbwDex5MeekbFV4eKcHFlvMLd6MX
	C1pC7+6+RJrPbH
X-Google-Smtp-Source: AGHT+IEzjvHrN1iQIq8FAKzUqb34qM6bbiS8410ZZtrIWblYT3InjbPAMTBFJWEl9Bykqq/40gzsjQ==
X-Received: by 2002:a17:906:6a0f:b0:ae3:635c:53c1 with SMTP id a640c23a62f3a-afe2974ea3bmr1211128166b.54.1756133886030;
        Mon, 25 Aug 2025 07:58:06 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (168.23.91.34.bc.googleusercontent.com. [34.91.23.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8d03f981sm117294166b.60.2025.08.25.07.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:58:05 -0700 (PDT)
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
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 2/5] platform/chrome: cros_ec_typec: Set alt_mode_override flag
Date: Mon, 25 Aug 2025 14:57:47 +0000
Message-ID: <20250825145750.58820-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
In-Reply-To: <20250825145750.58820-1-akuchynski@chromium.org>
References: <20250825145750.58820-1-akuchynski@chromium.org>
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
2.51.0.rc2.233.g662b1ed5c5-goog



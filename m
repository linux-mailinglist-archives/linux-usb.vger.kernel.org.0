Return-Path: <linux-usb+bounces-25302-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45263AEE046
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 16:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF30C3ACAA9
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 14:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7B228C01D;
	Mon, 30 Jun 2025 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y8n+/Cud"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EB728C2B5
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 14:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292777; cv=none; b=QHTQiVa82lXJemLLRm8bm1FOMji2iGW1BQO3YgT1pXeGj52NUHB6+bTx6LqaePubijgYXv1Mnolh2mk2cgVh/mXfnj5fb9e1XRtG2gOKA1H9fw1Pf27UJrzx/d8bDRV2MIqOyoM2pJpf9jD+eejWJNAOKsvegYMl+36d02PYos0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292777; c=relaxed/simple;
	bh=LNKB7M4XGZD1wvMm18MmkB/SXjyMDrkXYtnipJUgGD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PBEFj3gbn8X9alAIzZmrmG8HbztVuUoQo6EqrRQnAQ2TlOt5CftlhlOkplJpbs9wIm8I/CkDmvlHolXat9OeaiUb8ySCLNklMs1jqBX6yR3I1wu4ENL4JfrMMVIxBfjTTkGLi6gVXslRFq4zwUHcuREd/FELmmO9yluG1CIH2LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y8n+/Cud; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so4660447a12.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 07:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292773; x=1751897573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KBYhaaZ6zyK1v99fMMJLyWKmWrudMkEEsbHwWdxmU4=;
        b=Y8n+/CudVs1P+ZoiEKWB4SLwaZ/FJAQ9fMnvz9GF1Wncl/nBfn7WvX+p4umrPfrTQR
         oCeUW1gVzarvUfyWje43hFPhjtmxw1a1ywX8yUHbiDYJZVVVcgnGD/PtYBDY5rwxugcz
         2cQcB4UFEbefwiqXCWcCPBMrkOPdQS9I+Uu2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292773; x=1751897573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KBYhaaZ6zyK1v99fMMJLyWKmWrudMkEEsbHwWdxmU4=;
        b=jhxUIl4jw7ySMN+V12VQbw/ePuVwGE5skySk1F1wXkgMWL+j8jqT+72oKU5l9GsRGT
         u0oilAp/X88KMzHh+gWk3a3plU8Y3a9TdO84iiqhiUA3seelxRHfnmfJweD4Aciwpk0D
         rqBWYt+lF3VdCHZbRID4il0GG/IRLxyxJcW6euGXayckJ2ReVjesIQ6NTkZONKrQnnFu
         zCfyXwMpx9+Sum0PrEWiDXG2ZfbviEEOkJSxzp/IHA0HCguScxuTAYTOsBNWceIXe769
         Gaj8Ftj/jM51GB5sWDX+SPGCPGzij7TjDfH3inh29ckGVkXvn/W8onUboCwwXIZ2ltCK
         GV6A==
X-Forwarded-Encrypted: i=1; AJvYcCWGBhPzdVfE1tFcvVFVtFIXN8Ais9aaHH5/LAwzAuNpivLvEZKlNDLDOL9Zsi1TYWvT9625LxI5O/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YybkgQNpkNsk6JFeGnrbDb+3wHfeOMrGax7n0+/a4prF0bPVeeJ
	g29zAmMbUlA/LUtuASP3sSnOZQ3QCsNtxys6DHxW4OjvYML/GJHPiDR+uMk4gLT9GNN7rDM465j
	0tnUBTQ==
X-Gm-Gg: ASbGncsu17CPj3dnjCa9crG5uvzmAwBjXzIfpKx9zZ9l3LR6IuRnAjKwLS5ONsceIrN
	3oxD3AXhynOwi+LJWWWUFbPjYY6oSlDAV8UzoYIlKBv2hpUKKBgksm8WmkNwLiAzj6Gl9lIXDkZ
	9bVSMDCBcPBTwed3H1KCdw2BT0z0ehKcxpqtrDQ9e5ykmtqpGrzoPQoALr8eyFy6KkeKE3KwgOj
	0X71MnPIg7gtF0EqblaihObdUbV/m/v2FtLVWViDzUWD4uJXQ+WZ1DvtywTZPZJjFmQJ+KXVVPt
	6cDJO01eoNCmoqCw5IIeBhw9xXaqkkVjmx+rCyokAl18doM8HQxAJJ/dKMmIuUpm95Uv7u6hVi8
	EHjw+vXbUBW2XBKrmwv2f0R4W3QIMoXaGFbKASOrNhCiywSl601CX
X-Google-Smtp-Source: AGHT+IHGJggqCDNtOOZaIaGa+EEv/ilhZRgs8ngdME1C5KWNG1YEyP/nwbdR5Tfg1rSmkUT0/Gm90g==
X-Received: by 2002:a17:907:2954:b0:ae0:ded9:7f31 with SMTP id a640c23a62f3a-ae34fd88f19mr862849766b.20.1751292772639;
        Mon, 30 Jun 2025 07:12:52 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:12:51 -0700 (PDT)
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
Subject: [PATCH v2 02/10] platform/chrome: cros_ec_typec: Set alt_mode_override flag
Date: Mon, 30 Jun 2025 14:12:31 +0000
Message-ID: <20250630141239.3174390-3-akuchynski@chromium.org>
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

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 7678e3d05fd3..3aed429fde03 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -408,6 +408,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->alt_mode_override = typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.50.0.727.gbf7dc18ff4-goog



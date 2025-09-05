Return-Path: <linux-usb+bounces-27601-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C954B45A3E
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 16:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D7411CC46B9
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 14:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6F43705A0;
	Fri,  5 Sep 2025 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UvdsUduc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04954370587
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082141; cv=none; b=E5cs/HTaMnTSx0iDW8uH8iLi37K0CezTVUdJVPrBw7uHyF9rvIlNKaWUeUmVUd4wl/JvWCkyw+dEm+SnOr39LOICKMu9sJfWiNSDLzP4+YfoOceXYkKB3pBKt82lmQYCblbpkKJ2evFWG5TnKG5fpD91GDrBaU7aSGks5i/++mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082141; c=relaxed/simple;
	bh=7dk81Au3j1iQk6yPR3k0+dfNeO3eOhLC3P47r/ZLlaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktaT99K6Is93M36nZrbXg8vlfs9OGiSobCmQKccZzYBI4fNoIFMZQgsUw+9kvOkMBVduT1aIVlxEoPu8oOYUwa3X2sGkw8H31Ye7uUv27ZEefmkyoQmNfFx2e5L6eKRmEsKunuIobffOMt4ktn2tSckBRUKuJ46dlWTimqs/lqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UvdsUduc; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b042cc39551so397791466b.0
        for <linux-usb@vger.kernel.org>; Fri, 05 Sep 2025 07:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757082137; x=1757686937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNdygYENTLEaOX1N0zFeQLg29SgfHGJhm074WNrdLtw=;
        b=UvdsUduc+ZvYGFDj4pbg47208ALjcoRcHLpHCE9aKCHQ84ZDW+6CGgj0tSpuEDUGEj
         UZdj9Gk0l4/xt8cTX6OfkxwvcPIjiT/38W9yFAIMp58DEW2dDRAJWLAbdNndyGsLlDHi
         VBVSg+YXVv56qNbdqx8omDXkCRzgYRRbWWJZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082137; x=1757686937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNdygYENTLEaOX1N0zFeQLg29SgfHGJhm074WNrdLtw=;
        b=Grt8LRnlZkwzk+7Pjr/euh2H8tP4dTBPu83DDxl9NPePlykp+nJshxPJcVlvFveg4h
         KOu4mE8eXr9X0PpmAlFzjE7f6NmVXWV0NQduP8n9MD9e8eVw0joNrWAuG9C+vmJMPoil
         9VNoNR8kDIZVc8JQW2TtPso5raVNJl1FT9+rSVFtOPvNqYZKrEbJ51ZmUU7W46GdYK4a
         IZMv9qQ13+IFV67SglTYj58lTUfhMgcFyOUbiEMQ0GyyKYxcyQnexNSioo4vctdJyAZV
         QDW0XEb+yUuN4uRuh8Rx2tMECu0Z7xlaTRdHbOknyi5PlW+90px2Yn6P9V6+01+HFDd0
         /ncQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/IOtuv+xoF7aqEv2A2a5wVxJF77dD802gUAJwRWDim73ZWOIOWC43be3R1QjhczMzS3hERlc1b/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPkEULG+dZfBvKKudp7PeT0lmgNiNWXNGBwM4Sg1JyX521iPBx
	riBZWFEyXjggXnnCLdfP2PLFl+SfD1ehtbl50NFdRSWhEiC3szfHHZr8JBKro+TXfA==
X-Gm-Gg: ASbGncvfEG7Vstw+02O87Hx524y3pYTv4nHhxgDcm3EvGpXDs5zMwnECPJ/9OnbTayT
	GWNctyNFv3mHLLLBaJcMf0NB0zpJFiLRUYyKhOe9KWt0EgZI/wxandwL88t9h5c4e9/ILnFPdOq
	Vs0edZZXj7EpfPUWnF1chqA1d5tjB7SU9ZIRhuMCilubf45Z8w6YCpnIDOPe3zeYP7g9vrNKHas
	vkOyzpczbrcsNB2NJhV4eBa/18dYYlwIcXHBQ3d3O917u9kGplx6Wv9izdUheD5zl/XCpctHL7I
	/KelcwRjof6q9rqvPMaFTRYnc99OjSekI7FDbb8REc1Y7p0yMUPK4Gqwo1Ew1MvFgiG/NTsChPT
	jF8/zurryZeYeWgZtKjCTTlujhH2ZOJIbROQc4oaqAifxfgkknp7YkdWokK8JmJcmWgg2uIuMYD
	TK3pRkVAVEfVHFT4Q=
X-Google-Smtp-Source: AGHT+IF1G3sXay2HMrNzwLZtA3zxVhb7Dzgn8IIvQwuekRHg2fNC6grbFYHUf3CV1eWA30lQkiz/Lw==
X-Received: by 2002:a17:907:1b22:b0:aff:16eb:8b09 with SMTP id a640c23a62f3a-b01d8a2639dmr2066545166b.5.1757082136974;
        Fri, 05 Sep 2025 07:22:16 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0476e0d61esm502141066b.53.2025.09.05.07.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:22:16 -0700 (PDT)
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
Subject: [PATCH v3 2/5] platform/chrome: cros_ec_typec: Set no_mode_control flag
Date: Fri,  5 Sep 2025 14:22:03 +0000
Message-ID: <20250905142206.4105351-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
In-Reply-To: <20250905142206.4105351-1-akuchynski@chromium.org>
References: <20250905142206.4105351-1-akuchynski@chromium.org>
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
2.51.0.355.g5224444f11-goog



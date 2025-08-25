Return-Path: <linux-usb+bounces-27260-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 316CBB344E0
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 17:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ED13202F6F
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 15:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33050301029;
	Mon, 25 Aug 2025 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nQFjRF/m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2A43009EC
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756133892; cv=none; b=dPTOBG5F8vcePTRzm+Oq7GG3GqnWtRluk/+fMam4nVpFSjFbmzrJ/JyKnC7JHO8ttcdcnP2BFKv5Z8aHUsxYXEbZcIE24NOjvgzEh/1pw2pbcW/IZg/uCtDOHMtIlMlyHLM/lZvERMh3Pb/54SU9hxoRm0UC9LT2nB5SOjVlhNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756133892; c=relaxed/simple;
	bh=sCzcaHvyNBs2XDXKynfkNcDEJnlMJJf0GaVUdmsnhSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JeDk4qTC/0NhnIctVhmC0kEjT25xOlyjGbBHqZSWVj90XhZCOCIrwrQFaNikOQr+GAPn5U51R1dUtoVHKQGTf7LGCp8dNJWO7QweRBzR8y09e979D9BoDI9J0PGlWm6vcYkMvqfwZVBW0mq86E21O6yiTg2vHnNQylYhuA9bVBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nQFjRF/m; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb72d5409so747499966b.0
        for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756133889; x=1756738689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEe7YY1Cpi7JTuOOA0pZSF33Y12/vgAOx6rgD/OGWgw=;
        b=nQFjRF/mRIKyWLqe4gUhep7kBD7cpHUrxARXwiwcusgeBPJEa43vJsFuH0qayHH//C
         Cy2iJKpKBVGjDirQ0nxfGPW9IY6OB5zio8PCWshuztPN8h6I2dogJQb87EGVanyMefpY
         QTPtzeDnNpHa1cU1ueGq+AApabEiW8ax2c+6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133889; x=1756738689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEe7YY1Cpi7JTuOOA0pZSF33Y12/vgAOx6rgD/OGWgw=;
        b=OzRXxmB4DYw+ahRi8h6t37KvMX/i3xNB1mcDNJmWkVT2XULcLcPDtLV3FcKNcTfont
         AJnQNodE0rcMAQFQEqC66tf+wpBeofdEe7F6+FbtZBr05lGxOOGBt+a/OHkch7/Qq5Ov
         R9a9JyvHRi5ZoqIx3WLLncFhz+F0uM3tlXci84IVLfAhHLrjnVBxkFdEOUZUOgcPb4v5
         G5y2/t/pTnj+KsaGbSXZIphe/wcZb8D1K88W+lqKQKDCYDSFCCL8fekh00ro4xoXbwVT
         II3x94gu/iuSUom+ENpEyfuqdkXr0BnYVz5keGCX6a80aRWL+qe5wJYPZbKY/7pR48cv
         hM/A==
X-Forwarded-Encrypted: i=1; AJvYcCXhJg/wyk5AVTvsnW0PGHVItRxepH0TLrHuh9CFkoVvKFNHsxCh4tfPPOD4ClOnEX1FYigbXtPsgYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVUKO6dvOXnVXmAilnjK2zAXFfJUd1lXGxKajY1D7Uu4ijUlbR
	FmMyVOkB39Qad3b1bnH6Qm67NzsItpV+VJpj8IzFv3miBmrm0O2xtt4BWHW1OhYkmw==
X-Gm-Gg: ASbGnctcacFLpOsNjwpjdqnukqNP6u6YPq7sWSTtKH103WGE1aFiQniqKFMPPXJQSfw
	kE7jDhJ957pwpGsuS4alfdWGQ3ZItQZ0CC+TMZGvZob9OT0DZl4kbAZ/abkmBuZniWeQZmeVMei
	rc23FdX2lVgbVnuVhaWU8FjzrAaX/+WZDxvX0NiwdWushRvCziVljvBJ7oEDCDFRW53/zvw0nPA
	QhNT5UJhajG7KbUDQ1o7Nfv2Mr9aNpuNDJVv9qynmKs4HIOMtJDF8ZMMaxK5wyKg4+omlQsPNM0
	L/5wcUyO/f8txLEw5ZF5Tko1oxxMdQ515Sboclw2drXLNhUvq9z5yt1ImeQFo92DomHa29f45Le
	oEQcjafns3M7zpgp3w5sGde1uf9Jrdi/vR02vgiDravZ7vATE/6a+0dRMMoAeFYdVjNqvts5hYs
	1YGes3vUQAoLyi
X-Google-Smtp-Source: AGHT+IFyGVkJn7Pe4QajoYR658kFpe1L884A54RCJlaO5lAZ/VrHyO1MunmHlcOvbaeR2ixPy/zAag==
X-Received: by 2002:a17:907:86a1:b0:afe:735a:fdf with SMTP id a640c23a62f3a-afe735a1362mr500412866b.36.1756133889266;
        Mon, 25 Aug 2025 07:58:09 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (168.23.91.34.bc.googleusercontent.com. [34.91.23.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8d03f981sm117294166b.60.2025.08.25.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:58:08 -0700 (PDT)
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
Subject: [PATCH v2 3/5] usb: typec: ucsi: Set alt_mode_override flag
Date: Mon, 25 Aug 2025 14:57:48 +0000
Message-ID: <20250825145750.58820-4-akuchynski@chromium.org>
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

This flag indicates that the PPM allows the OPM to change the currently
negotiated alternate mode using the SET_NEW_CAM command.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 0d6b0cf5a7cd..85a6b7fc6d93 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1632,6 +1632,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->no_mode_control =
+		!(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->ops->update_connector)
 		ucsi->ops->update_connector(con);
-- 
2.51.0.rc2.233.g662b1ed5c5-goog



Return-Path: <linux-usb+bounces-26462-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC60CB19E41
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 11:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41ED53BC892
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 09:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D58C2459F1;
	Mon,  4 Aug 2025 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KnM0i9+I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CB724EA80
	for <linux-usb@vger.kernel.org>; Mon,  4 Aug 2025 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298282; cv=none; b=Z1WR57Vm4LxXEFhU2qNKQ6XRUAcIAy2QqKVhNgu2RqsTjE3/hxrwX4yPBHeaPG05epsG7hCHrtcuO46lmaBP5TLoOF+2vxaSDyhAQNI79hp/uEIwY3pr/dXhq2zknmWZCN53X56m97Yin0TFhBcjbxM+sE7P8tfeQsx9VqZgWWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298282; c=relaxed/simple;
	bh=lGxWrmyJi7QQe0IzSfeCLytqae6M3U2caSjouup0SQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FlD0aAAwWYMXosb/moXCPP/Vt4L/8HrqSxkGehhChix8O/KBiDeTmgYIuswlXhpoeXzYpFYirbX0rTtTtuPBKI8Yfyz0lqpU4zSPR/7Ln7VTDDbfbgvOLyQ9myLEWCjpaQa6yBBppTQa0SJ7Bbq+KR6GBOv10BYwoblzDaPQi18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KnM0i9+I; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae3b336e936so633603166b.3
        for <linux-usb@vger.kernel.org>; Mon, 04 Aug 2025 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754298279; x=1754903079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwNnM2nFXT5vCpq6GQAtc8w4BljRfhoqKtZx8NfXTfY=;
        b=KnM0i9+IYqWS7cCwt0nKUZ9IR3Fjrd5yFGTtHygPlWnL27Y0BSSu0wBBCS4LZXiqvV
         AuuCZr+w2en7snRfIcsmPb6473CtbzNbwVy3JS8N+oLIvDMBXB5tBpz+HXrzkkKapZJQ
         Gn6e5hVBhTkm0EwZKtpAqUFrAn/vnsri+snBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298279; x=1754903079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwNnM2nFXT5vCpq6GQAtc8w4BljRfhoqKtZx8NfXTfY=;
        b=mxxTpGlXE4pktRifQtji2DLJl7wzWuagmMaEsNX4myNlA+SG9oVLP9UeLu3U/5/gDs
         d4COOpE+x670Qw3LnHBol5l1S96l5j4BqcrX98agn2uERoICKABUz6y8uqYlrtDONcvD
         /QAsfOU/Vtqzr4rt57CZhPUa6kUMBpZE8e7n0yh/vtsG7Gp4SoGTJ85i+trg5Vo3Zo2w
         6JLLeQYgNN4Q9mn9l0sd/sZgnKJebbqo7vADDQyDDjW1rVem88gpGRUWmyO9HptEcWZs
         QOpFBKQEIWbpahy3u42+vS5Tse8HVFXAPz7eWoP/gnolWjIg68Opmp1YT6dVdi7yOjmF
         JoCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB/oRVQBX1K07xjbG+adHKLrR23sptkpCSydt50kpAB76HU9h4PMsnV2pK293hZF4ZxN1HNYVR6zE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVggLMXQ0sbIURsAnjn4osWJ7rm0vpdqpXJ9OreE9b8KpnJGJ+
	GMyOQmUN2kDz9/pmO5l3+mnS46z90mbhzpFv9iWxC0x30nVFITgByTYKO2MdvdZ2AA==
X-Gm-Gg: ASbGncu/noqm9v7oFoWfBkFfr7DCmpuZ1QQmaSL6JjlDiDBwbnQxF5Mx8HTlvR/96zB
	k5fCchqulRfAtLUJvFtFPBXCCWMZ5GseH1eYZPyqEcROkPnkJmyg/rVLQX9RGI6lAVQil1kLA3f
	WS6y4bEuRDIoMLrcZh8uOW9iGa8R5J7BgOkUZ3IKPZR8EEtNsXTNphR4m/sNwPMRHhWTBpGK35C
	SfSInoNtOf/B1j2MwlqPxgOX6ta5Nu5EITIoUIIFPBKI9r8vzH8QlLEWnHjGgjxAiOYCzbpBXU4
	H8YoKc/R1AWAK3h0NAjY0vz79tjhhU5RAxtpj5horFgH+PJK9K/gqIWJD7xvk4YSeP5ENCHzvLu
	wKX/P8s9+5mScALjZkiDamELAWeGNPriqy93lSWR64whlTtSpKGJyyg2bpctH3R0IWHEEQWNETh
	+2d/t8yt09jOaS44k=
X-Google-Smtp-Source: AGHT+IFDY6Eti/U0HvJUllLufsYb1TLIXF6CEqk3Nsb18AYq8jRe68qPhRYRsXxRYg9IeMMo3fetyA==
X-Received: by 2002:a17:907:7f0f:b0:ae0:ded9:7f31 with SMTP id a640c23a62f3a-af94001f8dbmr979021766b.20.1754298279104;
        Mon, 04 Aug 2025 02:04:39 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm6412790a12.36.2025.08.04.02.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:04:38 -0700 (PDT)
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
Subject: [PATCH v3 07/10] usb: typec: ucsi: displayport: Propagate DP altmode entry result
Date: Mon,  4 Aug 2025 09:03:36 +0000
Message-ID: <20250804090340.3062182-8-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250804090340.3062182-1-akuchynski@chromium.org>
References: <20250804090340.3062182-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reporting the error code via VDM back to the Type-C mode selection logic
allows the detailed result to be propagated to user space.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/displayport.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 8aae80b457d7..47c28646cfa9 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -234,14 +234,18 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
 
 		switch (cmd) {
 		case DP_CMD_STATUS_UPDATE:
-			if (ucsi_displayport_status_update(dp))
+			dp->data.error = ucsi_displayport_status_update(dp);
+			if (dp->data.error) {
+				dp->vdo_data = &dp->data.error;
 				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
-			else
+			} else
 				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
 			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = *data;
-			if (ucsi_displayport_configure(dp)) {
+			dp->data.error = ucsi_displayport_configure(dp);
+			if (dp->data.error) {
+				dp->vdo_data = &dp->data.error;
 				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
 			} else {
 				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
-- 
2.50.1.565.gc32cd1483b-goog



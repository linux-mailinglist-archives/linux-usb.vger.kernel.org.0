Return-Path: <linux-usb+bounces-25307-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9564AEE048
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 16:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF0C5188896D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 14:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233B628DB63;
	Mon, 30 Jun 2025 14:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PkYuq1cn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0886A28D8DA
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292788; cv=none; b=pPYJ1vpBnR/GlvI3Yxg2fAgvNnTJQ8/cgdnVZGk39ks/eoB4kSfUNeJcp9wzz8aVAp+D/qF8P5NeBYZZPp3NwO2oIItsRAjlAzixxKFYTWrnZSXj5+VsQ7j+ikJ30Vxe27fqgVhX6llm+kcS63bvTBcGoOiVL8qxKbC8sav0l70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292788; c=relaxed/simple;
	bh=qWGW8YbtsDuKpbmI6ubepotX+ijoTJp4dAQsUcMuZjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugE1U0QS+PjmvB6eZcAgzsJNE45LqbBM6I1VV81nXzyCR7mPWSwlxjYGhrGy1hoDlM+az72YE8dNjq9+OJvf/LqDf/cUCX/1in66Srv3clWdlzyynUEEh+BGo2bV+S0W6tnt78W8FcYBFMIStctawLqOO2HMLm7DA36OPCbHw3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PkYuq1cn; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae223591067so385304466b.3
        for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292785; x=1751897585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1Xh0BjAurZ8GfKMX5dM5eIqjsMx/yoO6fgXGDkZDUE=;
        b=PkYuq1cn2UtiD87OCXUnyJQnJDVZtFkTp0kAayK3suKPJmy6f1DWPNsNkgzwSO0Apt
         Vkc7MRB5mAmGEaWt+P03dXIh8dTqTVAjRq3GTZkpDZN0+UkjY318cQyRPrnrITNwqSNr
         aspimak4joIRLHUMkUzPKnKmqp651WWDLEksI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292785; x=1751897585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1Xh0BjAurZ8GfKMX5dM5eIqjsMx/yoO6fgXGDkZDUE=;
        b=L1OAW7T4+zHsmEgdygQS5v6wCVQRWyay10oTs5yni+Z8/GfN/yVOS03bVsYl8oj5wk
         XEkHzHMZSJRxm+GA+g3ZrOagpWcCsANgvI4hinK0JypFcSxOu/nUiF0XPT1qqln/x0W5
         YknJ/Wa7zFZFDfL8h7mG80DGkI2BDT3nyUZQL19NJDyEpIUCvX5vXvkRcPCqNjaIasiX
         2kjKDW9vkc7xELYN7BgONcahTyNT9lQM6ly5TaANoQPn+Y6tG6Ty8BENkiEniR3/j6Hy
         AmAILNlFajeCnsPvLhSAkZAVRuaP6IsIizX6aKVEOq3tDw3kE+OyBetauj7Li2gtm59d
         lgAg==
X-Forwarded-Encrypted: i=1; AJvYcCWGk9GNfwfrl1I0122I4aqyCFnCTQYkAWXW8dZmFJaw4WZgYMld6prNKnbm1MjZQQbA/4+B8v3Dnn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjdtmHcK6F5YoN4n4hDAUwzcXM30aFRodYMd4lMLyViCVhIcQj
	q7qp6hSSPGcOxqJSV3sYbpK7w89bNe/nksvKtNkqxd33kr9Y4a44ZpE/wxpfaPX7MA==
X-Gm-Gg: ASbGncvqosGZEIU4FmDewEl1FQCnnL6aiRYrVIBZtG3HF0voT11MWNKk/mWsUBaAu7u
	2jPpYpvvs2pn3Y/uKO0X48dP0d+J8pKmGtTkV3Ysz2Mdn06NQ3greuXUYoL8V8WJcoHJf1a8lUb
	75ZQn68YSj3LO3ZFFZy16Nj9LenxlEjcD5ariMQcCXwjOuefflMfNaCjAyHL2VfqqQyt7SekLWm
	GFv/fG7j/iSwo/0B3A3d1EWvlYuo76FlKTFNwlv25r3/BLDGNo58i3mlnFyQK+2aH6+HKMvBmH0
	zNZgi9kgTetGQhjq8T7wxrNw/WL9nOWt3pLn766BdgXYsjXMxmrLrDwkYmb89BQASq6Ng0D+RjL
	iqBAnDRgju5artW2YziGlNTFdJWV7UOTAf9ridpo4OPu/5oae/8f5
X-Google-Smtp-Source: AGHT+IGiJo2J+7ysvkMPbSppys/RSb0riJCR/djRR3Vxz/X1CdlBlaaZmnA7ExkeEfvj0vTjvfESJg==
X-Received: by 2002:a17:907:d78b:b0:ae0:af6c:680 with SMTP id a640c23a62f3a-ae34fd3311fmr1153897566b.2.1751292785232;
        Mon, 30 Jun 2025 07:13:05 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:13:04 -0700 (PDT)
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
Subject: [PATCH v2 07/10] usb: typec: ucsi: displayport: Propagate DP altmode entry result
Date: Mon, 30 Jun 2025 14:12:36 +0000
Message-ID: <20250630141239.3174390-8-akuchynski@chromium.org>
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
2.50.0.727.gbf7dc18ff4-goog



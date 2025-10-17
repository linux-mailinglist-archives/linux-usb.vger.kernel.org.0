Return-Path: <linux-usb+bounces-29391-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE68BBE5D8B
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 02:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98E2D3B6937
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 00:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580087081E;
	Fri, 17 Oct 2025 00:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QuRknbAs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522233FCC
	for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 00:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760659275; cv=none; b=QckHhwHveJGYEWj+dPhPxAa2SFB29aH3xuRv9vnSlD0XIcUauPCrPQo9U0L3GQIR0eS7bEEzYfEORKOkyQWr3v3TABlp0aZ1HHvuXH7DHNUZrSRBwN3nvEjIoBwJkLT0/rdRV4TCef/+9Y8HOXfr3I9HfdcJxNg0cjyd3AXnT3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760659275; c=relaxed/simple;
	bh=d3vMgGjtDBOyl9OMQildPrcV91xSXzk0ehLUQ/v8Xv0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MX6CtP4WDtPD05dUVc5xALTHiQC0hCF9lytxh6RrSV7uScMb3KcFovCw+bGwQJZCpJgVR3p7QplyDKDVp3NCpDhmKsOJbbWlaSVGmdoMi8tUab8SRa90OF8lMvwI611N+yvX7AWQyPDahL+dBrnxd42KWuh8SWCcSnva9+zUMmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QuRknbAs; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-752eb824a20so19271317b3.1
        for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 17:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760659273; x=1761264073; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A78b5qm3ewGLH/hUPVAkK/xpFE0iF757uAxcChhA++c=;
        b=QuRknbAsGyKsxrzZ5JEAbo3dZPm2D83FQXEkDMLZGUW9IXCm6tm52h0apq7XphmU+f
         gcx49zQ1+1IaCIgRBFTmu1dtGFU+x2lCBzih1DsZrM6D/jrdZCmEwLONc5z2NtfYfavV
         9ZBYSLfnT7fdfo6qHPhLY54+VEWptUZ+iaPq7i0XAZR98tguDZWBS575xDAmAeG7XzP4
         g1U2mlP63v418SsrADoJViIykwlp4hn1HL8P7BB4Z1ULv4FR5WYxU+xsI7UnItHPa68q
         0UftWxKEHtGoZi12H2KSK8elHJOqMyTxuzjVLsi9GlhTyrKBafvVKvT9a7elEUpc5J2s
         Rd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760659273; x=1761264073;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A78b5qm3ewGLH/hUPVAkK/xpFE0iF757uAxcChhA++c=;
        b=moefaHgETzRauTGjBH5BDkwIkQm7xxBm0ogP7SEvexbJpzwydNPlj/GTCPGKLUWwV2
         8SBt3njDnO2ILuNUjL1i1iqyVS/scue4mm73Ib1qJwX2Fn9BfcO1LQLCJut1wkuClAHH
         ljpE13/Zzf9hnGLLNewgNKfDbBOK5Js2veMHbaUz2QouaxcZkDI9nvhsCN4vWf4Y68QA
         EkYoTnIIwZ9y6+lu0aal6a2eunS0OEnVc7+ukuWUg4ZcZtr2RHAp9fhYhMjqOHgvt7vY
         vgRAq1AfQepCJIivPzyCnyXxwDvsMbzjkUFJdG0qqkpzOhsr4RnYsmGkD34kNpMtWZ+Q
         7wVA==
X-Forwarded-Encrypted: i=1; AJvYcCUSHyX+kxkrlXcx/42eOgYt9seNi5u9s2Mp+ElPTl13blstRMYnGV7pQSgdXPd2W9DPDxb4bT0urvs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+JT15W+5TzQFGodNmmzu83S/YIvo4suG7y5RQb2aeWtA7C+Ys
	mZy2jHEZ1MSqMebGUcqE+O6ww0zVYtzvUBrWvvW3Qxx+bAQbNW9ZCiGdtdvKdbkPY5hhwnnVzxa
	Fzd8aZw==
X-Google-Smtp-Source: AGHT+IFylybvNrf3hXc+GFgB8oGAf1c3GA993gedEMW8xHo1GeQ+Z1gBgex+rl8Insn441vHeB3Esg0x1As=
X-Received: from ywbik3.prod.google.com ([2002:a05:690c:4a03:b0:783:2d0e:3443])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:7089:b0:781:64f:2b63
 with SMTP id 00721157ae682-7836d3a2c7bmr19754167b3.63.1760659273157; Thu, 16
 Oct 2025 17:01:13 -0700 (PDT)
Date: Fri, 17 Oct 2025 00:00:51 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017000051.2094101-1-jthies@google.com>
Subject: [PATCH] usb: typec: ucsi: psy: Set max current to zero when disconnected
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org, 
	gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, sebastian.reichel@collabora.com, kenny@panix.com, 
	linux-pm@vger.kernel.org, stable@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

The ucsi_psy_get_current_max function defaults to 0.1A when it is not
clear how much current the partner device can support. But this does
not check the port is connected, and will report 0.1A max current when
nothing is connected. Update ucsi_psy_get_current_max to report 0A when
there is no connection.

Fixes: af833e7f7db3 ("usb: typec: ucsi: psy: Set current max to 100mA for BC 1.2 and Default")
Signed-off-by: Jameson Thies <jthies@google.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/psy.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
index 62a9d68bb66d..8ae900c8c132 100644
--- a/drivers/usb/typec/ucsi/psy.c
+++ b/drivers/usb/typec/ucsi/psy.c
@@ -145,6 +145,11 @@ static int ucsi_psy_get_current_max(struct ucsi_connector *con,
 {
 	u32 pdo;
 
+	if (!UCSI_CONSTAT(con, CONNECTED)) {
+		val->intval = 0;
+		return 0;
+	}
+
 	switch (UCSI_CONSTAT(con, PWR_OPMODE)) {
 	case UCSI_CONSTAT_PWR_OPMODE_PD:
 		if (con->num_pdos > 0) {

base-commit: e40b984b6c4ce3f80814f39f86f87b2a48f2e662
-- 
2.51.0.858.gf9c4a03a3a-goog



Return-Path: <linux-usb+bounces-9689-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7CE8AFE07
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 03:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72581B24D84
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 01:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9901C697;
	Wed, 24 Apr 2024 01:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sr1FdjRv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A8F1C6BD
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 01:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713923346; cv=none; b=gafzn6HBiwGQ44vJVnK/WEdaLy7DdF8vvKp5nEAKVPY41TMVOLIpMsnScOMUNVjkVIaOocYdgqUy0GQzY0uXsWAkZIuouvTfsfrTPRX4fRCfNGQ0NqG8SBOqqwa6oZI/leOg3IE6GGeoeubDvLn3rfNhXpjIxyvD6I3gSV7addc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713923346; c=relaxed/simple;
	bh=O8wBo3jMW91/mXqgW1PShQ2yxrd/2XtsUuJ2TzAYSKw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fxAqnufgLWfhgdEtF6zNbRg+/u/SfEA02uOCrXzfhx1JnOlA8m9NLkYTAjX7QrV5DKCKJV7hZl+MgPXRc+I38vQCX4Nzoa5cDSf/Q8WBlnO7Vs29bSctwloNrbqTR7yVXMDt6KfqBVNzdn8WO7OCRCKkXpGyAzcmVJ5ibcJa5BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sr1FdjRv; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-de45d8ec875so12164618276.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 18:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713923344; x=1714528144; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JDrdqA7hSwKXktN/HHZfNNu+trfOtehLiAtZBEVkgVo=;
        b=Sr1FdjRvL5uJyRcVG/GfPj5PqcKHhbpHPtQwKnU8jgScszaddSO/lWXTXGBJG0JOD+
         yq3mdFqz9YO7u0zihEQklvM169oIFBS/TJzK/mYnui8/7uyQRezVqYoRdwapmHvysBnl
         AX+TOkoMpQ3NpXe01vCMbJ53huppSqcunGef+6JWQaVR+ebfeHeyJ+O3Gklz2hX8pcU0
         X5CowR/eoABNQTfnJaWfU7pDNfnURqdyHbKEoA697ASHeccZuFfKmxMAFWDpUdVQXEzX
         euYNDPj0D2Om+jxM50DFVSNF2uPA58s73d5NIBj2cDFtfk+H3HZ/ufpd4p2gDQ3nTm0d
         E/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713923344; x=1714528144;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDrdqA7hSwKXktN/HHZfNNu+trfOtehLiAtZBEVkgVo=;
        b=jVLlGrY3BZMEai3cWD8mL4YYP2862B8IuwHq8S3VjHubb49A5nQDcHWTNALdgeolfr
         GBmM9ZGsg1PTuwnjGE7ILoegCPd94aHt82dTUFdx8HP3AdbMpXQGf/G/DbX+6qY8YbkR
         pDsMmpag2EZDYMksrzwUTSn8kiK82FpZhVWfhmMvq1iYFk5WSc8XLkZrIS4OvX9AKaUZ
         XdBtxBLJIsOQPoqr8SdXrdVGtdDBuDhEXMqbriCfd9FUKxk4S5oIAMyNGfxCJbOghEjU
         sjbBIwzOEhy/w1kihOYVPkBvAaI51vNX5q0wciy6gGvGwkDaEEj1Rbs+6doBZ1yW+qKU
         b1qg==
X-Forwarded-Encrypted: i=1; AJvYcCV2gUAfN96xGsYM10q3CH+NS9XT5ckCEm3ADmdvWmJW7Vz8j8uqRFnb5+Xf/Z6eyJJCc5PiiPtBA4QjN+TPzIuQ9sMW6cXmv/B2
X-Gm-Message-State: AOJu0YyzSV/1B4R4NGX0TfM9BycP/q325j6P5ahWomjYR4trr0KnBQZN
	RvbnMfAi/PIUkXcmQ9USjFDXcDGKrnNsvrImrBv95tPeBftsUerG6Jss6Q0W0dQHTjdmX0TthtS
	v9g==
X-Google-Smtp-Source: AGHT+IGzPA/NrAQVNPZqtW1hoV5x3X5BTGRzZh8/ME0TGcv9dw+bpp5t8x2CH2Htl6Uyy00ThOpIRjHhwtU=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:6902:2285:b0:de5:2325:72dc with SMTP id
 dn5-20020a056902228500b00de5232572dcmr379795ybb.5.1713923344005; Tue, 23 Apr
 2024 18:49:04 -0700 (PDT)
Date: Wed, 24 Apr 2024 01:48:21 +0000
In-Reply-To: <20240424014821.4154159-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240424014821.4154159-1-jthies@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240424014821.4154159-5-jthies@google.com>
Subject: [PATCH v2 4/4] usb: typec: ucsi: Always set number of alternate modes
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Providing the number of known alternate modes allows user space to
determine when device registration has completed. Always register a
number of known alternate modes for the partner and cable plug, even
when the number of supported alternate modes is 0.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Jameson Thies <jthies@google.com>
---
Changes in V2:
- None.

 drivers/usb/typec/ucsi/ucsi.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index f167891e3f79d..994b8a6b6be96 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -815,10 +815,11 @@ static int ucsi_check_altmodes(struct ucsi_connector *con)
 	/* Ignoring the errors in this case. */
 	if (con->partner_altmode[0]) {
 		num_partner_am = ucsi_get_num_altmode(con->partner_altmode);
-		if (num_partner_am > 0)
-			typec_partner_set_num_altmodes(con->partner, num_partner_am);
+		typec_partner_set_num_altmodes(con->partner, num_partner_am);
 		ucsi_altmode_update_active(con);
 		return 0;
+	} else {
+		typec_partner_set_num_altmodes(con->partner, 0);
 	}
 
 	return ret;
@@ -1141,7 +1142,7 @@ static int ucsi_check_connection(struct ucsi_connector *con)
 static int ucsi_check_cable(struct ucsi_connector *con)
 {
 	u64 command;
-	int ret;
+	int ret, num_plug_am;
 
 	if (con->cable)
 		return 0;
@@ -1175,6 +1176,13 @@ static int ucsi_check_cable(struct ucsi_connector *con)
 			return ret;
 	}
 
+	if (con->plug_altmode[0]) {
+		num_plug_am = ucsi_get_num_altmode(con->plug_altmode);
+		typec_plug_set_num_altmodes(con->plug, num_plug_am);
+	} else {
+		typec_plug_set_num_altmodes(con->plug, 0);
+	}
+
 	return 0;
 }
 
-- 
2.44.0.769.g3c40516874-goog



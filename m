Return-Path: <linux-usb+bounces-10221-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 971F78C2AFB
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 22:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C822E1C226F2
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 20:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9674E1CB;
	Fri, 10 May 2024 20:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PH4C1t5r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E3B50292
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 20:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715372005; cv=none; b=hgGCNdmJJ3I8ECmYkI7bWhEn5dD4PxFztMcCcdNxgn7wTkdaru0Jx39ccDmLzZXtpIuIz03fOjoNXuOeFIbXy6Ocdmut/BVcXPBHGequg054KS7xjpFLr+iiwdZ85FYw3GY+gHfBlGCNRggJmCiC1JyzGVtTGeK4B/jXnYCt73M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715372005; c=relaxed/simple;
	bh=hUB2oms6xp9c47rZp7BKMmLVOt10/JNv5LT/f7l1e0k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GjHabghu7lIBgidV3alHw//25HvYqNOThAsQJ2u97tecwifMps1xLiZpUUFiWixh5lPCBJwfRMsIQVV7h03TbrAxaXOG/BqgAENqxZu1wvtMndOmeBYjTq5L3qvsa7pmRz83+jXce6wxf/NR6XigQFVDOx3weQRZaWPppBFIsMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PH4C1t5r; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-61be530d024so39710947b3.2
        for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 13:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715372003; x=1715976803; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YhvBEaMPWNIcwJictLHqDEbzNX1B8hMyot5dxcw8pLs=;
        b=PH4C1t5rueWpAhKXhgdxN8qSwdZbn5v0UslS8QRVWfXNKOrlwUdy8l4MPfTx3ORdgL
         2B2KmcBvNsA+GYarR1MckZvT2JnA0KRL4v0LOv/pwkGO9csHK6mB37JSgpGM+r0lYpKN
         Ui/UojmSw4SBimx/N5fzeXvZrTiS0MWcxwOP+lhMmfY9WJE9Ha31FUekHXVT/Kymkjv5
         SMTRtXwkfZLl1Z8M0+IQkqQOKVoAhQLvKwC//+IXTtNbCdgLstOPNqRme0v0tdg4iMFs
         OVjloCY23tZZGqUUIOgCSCZVFlFniHnO4JhhgSW01KUAR8qVmg38KaXU5qTrLgYEjDk4
         htEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715372003; x=1715976803;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YhvBEaMPWNIcwJictLHqDEbzNX1B8hMyot5dxcw8pLs=;
        b=typ0wRrx9IziSS+0dlNLLJhanWvtvWIQlU4JsfUQWXkWZAUM2FUQ2Odkm3nxzM5Roi
         xKUEt4eogbAmo1kfjVIWKGS0RgtnXbtdn2Wjk/VreIAGKiuaCFZb7WQfaenO06QgfOVe
         KcoGTR+8lTE4F7UFZ9PtGi3N1Jun78vq6hxoXPE5IIwWggTv0Rtk2nzebZWwtPprmCHJ
         SjMiwB/B/ItaREMT88OigHFiDFKQjDaa3SWuB3Z6omAs4dm73HVxz4YVv8TntLNhNcPW
         RyecoLg4l13nBzpkTgQqvqzbLBm2GF4mMn5kubx+guGeIuLLi+oVEPxRmq5VP22Eo+pg
         VHiA==
X-Forwarded-Encrypted: i=1; AJvYcCVE8Pa4gFH4jQ3tzAxycrTQm0dhwRLbQvP06iWtroFjjqJkvVyjudnjswbvey12AMJmzJ3uMhkLv2pjHa5TvO4IfqIsrjdtXTK8
X-Gm-Message-State: AOJu0YzCJFGUrYtj5eom0jD9TXuWOO4r4qvZ+KmEgW1jql88LLIIUBL7
	OP7Hf8dFjz4WergE6mh7OI27o6pn8iv6FqhqauG8cbPCA6/mEkG/SsnxTYJx3WlgNlu8cE73RDF
	TcA==
X-Google-Smtp-Source: AGHT+IHSOagr0nWF2zL0Nd4uRaZ7DGKHXDXfOLIV5EwzElZtcmActJInDo022AlY6Ss7BHva64+9QW1t4E4=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:690c:3608:b0:61c:a9ce:3092 with SMTP id
 00721157ae682-622affea282mr8824807b3.5.1715372003063; Fri, 10 May 2024
 13:13:23 -0700 (PDT)
Date: Fri, 10 May 2024 20:12:44 +0000
In-Reply-To: <20240510201244.2968152-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240510201244.2968152-1-jthies@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510201244.2968152-5-jthies@google.com>
Subject: [PATCH v5 4/4] usb: typec: ucsi: Always set number of alternate modes
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
Changes in V5:
- None.

Changes in V4:
- None.

Changes in V3:
- None.

Changes in V2:
- None.

 drivers/usb/typec/ucsi/ucsi.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bb6e57064513d..52a14bfe4107e 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -812,10 +812,11 @@ static int ucsi_check_altmodes(struct ucsi_connector *con)
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
@@ -1138,7 +1139,7 @@ static int ucsi_check_connection(struct ucsi_connector *con)
 static int ucsi_check_cable(struct ucsi_connector *con)
 {
 	u64 command;
-	int ret;
+	int ret, num_plug_am;
 
 	if (con->cable)
 		return 0;
@@ -1172,6 +1173,13 @@ static int ucsi_check_cable(struct ucsi_connector *con)
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
2.45.0.118.g7fe29c98d7-goog



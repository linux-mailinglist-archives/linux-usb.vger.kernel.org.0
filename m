Return-Path: <linux-usb+bounces-10220-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB028C2AF9
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 22:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDAFFB24A0E
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 20:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3A45028C;
	Fri, 10 May 2024 20:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iGgKgUUR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244184D595
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 20:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715372003; cv=none; b=N5zumE4+ruP0zjiLToRpck8h+zWewmNk6fFRrEXJf5GnOntSPPk9X/5RUYrMQ2X2Jl4/+kVCZv/ggrk3jcWSjau0p0mLFJnQxpPPemeo10EKIMldpeoUH/EygfzYmLfC/vMYn7RZUNBuMGnYa7MX/ex4MEUaOP0GVvu44QRVPU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715372003; c=relaxed/simple;
	bh=s/KsF7KsNmNqfW9jySfUKYHz0qrPmcvkypMn9trKTyw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rrWLomnWJSjXvgpl8g8FfTQ54eNBeSCukqdyY7GE7sTNZ/g+TTomt+y5OWby+EpvXHym3Zp6pYs4gbPSABsIu4Ye3QjZ0tWtJTeIACttlLsR0ZGYBESWuGaxSeMI2tdFFuFcl/hjso+J/n26nNjjgY0Q739dVRJs0Fc0wyeF/WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iGgKgUUR; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62230f6d44dso27105927b3.0
        for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 13:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715372000; x=1715976800; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p6Gt9uHKHh1HnRu1uhOwPYNBg9fkaiXawsgjwu/g2rQ=;
        b=iGgKgUURDJra7q/q+qsrqQRPaFVth5wyhzcl+LVZII9B8Y0q133RrzP6/aLUpxBuBj
         s2bALKoKL79yWaGugkGHOqpQiGTMEH5KHa/Hfev1sghOfX81dLh0MCeVOQjPACXWQu8r
         +e+knN6xBvkdo2faKyx/dnYLaZnDWmJoG+xtIG4+8/uUImlzeCtNKs+mX5+xrfXFSq/f
         +XNyOD9JNoNxSAOIwlbT6dvZ5FzH7gfW8Tw15VH48ECim6PYwVsqZ9oTbWuuOsOSwQ3f
         6PsV6znHABNyTYOYpSbotzDiy2Y547kJ+SDLlfasrYQbZeN63BcpYgAkpGpngR1WrV0Q
         Aqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715372000; x=1715976800;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6Gt9uHKHh1HnRu1uhOwPYNBg9fkaiXawsgjwu/g2rQ=;
        b=j0w6juuznJF6Q+Ku6zzyGqsc3FYP71oUA+Bl9kNq4z00AwyXdYpghERhnh94B09/5g
         bPnJxvIFoEBKkt7ufkyQrfcgD11vfbm/wA4f94EVsI3Z6AqbLL/y5qxauRffpcuvie0c
         NtNEsCD0JRA0+qNKbz4aqS5loz+fk8+f33vyphQ6jK19Ypj9r5EJqbGTJMS7Z5/vojLB
         HEHr4MhwG1ZIrdjAczpydZlOR4XkQsf4SSXQxsRjK2zf9DbsC1VHTnBcD5A0UG1YFhoP
         QxKhpr29zWS6j795clTPmkO652sP6CpPuaPhwPd9D6RfxFzRTPt1wplzaM6TGHS95M1W
         ixTw==
X-Forwarded-Encrypted: i=1; AJvYcCWModdPd6e2PX0AblzVLBwYa2y8JJ6tWi6RQMwVT1GVwVzkfzIwlZOGzKgeQ8c7rntQfR2Vmv1pT6Ji4W3YJzmXMThcU11WxanZ
X-Gm-Message-State: AOJu0YwmsvTsO8dfpzmtnvd/XWVKMj91YAw8qeaNiD2OTV3fEKt7ie7R
	cBZsPuCSHH12/3aycjYMZAjzQvV8C9TvToITmXy+4queiWqu2Ocu3C0Jzqc2fXJLdtdgARYJYO0
	d+Q==
X-Google-Smtp-Source: AGHT+IHLsMBUIwCHd5hp/OGLEudpP21Ef0vXfxq8qlIt/w0QmOPWPdN1qKJG2EgmCn1IU/UGOJJp5bTij7E=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:6902:18c1:b0:dc2:550b:a4f4 with SMTP id
 3f1490d57ef6-dee4f33cb20mr954759276.1.1715372000164; Fri, 10 May 2024
 13:13:20 -0700 (PDT)
Date: Fri, 10 May 2024 20:12:43 +0000
In-Reply-To: <20240510201244.2968152-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240510201244.2968152-1-jthies@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510201244.2968152-4-jthies@google.com>
Subject: [PATCH v5 3/4] usb: typec: ucsi: Delay alternate mode discovery
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Delay the ucsi_check_altmodes task to be inline with surrounding partner
tasks. This allows partner, cable and identity discovery to complete
before alternate mode registration. With that order, alternate mode
discovery can be used to indicate the ucsi driver has completed
discovery.

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

 drivers/usb/typec/ucsi/ucsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index cb52e7b0a2c5c..bb6e57064513d 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -963,7 +963,7 @@ static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 		con->rdo = con->status.request_data_obj;
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_PD);
 		ucsi_partner_task(con, ucsi_get_src_pdos, 30, 0);
-		ucsi_partner_task(con, ucsi_check_altmodes, 30, 0);
+		ucsi_partner_task(con, ucsi_check_altmodes, 30, HZ);
 		ucsi_partner_task(con, ucsi_register_partner_pdos, 1, HZ);
 		break;
 	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
@@ -1247,7 +1247,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	}
 
 	if (con->status.change & UCSI_CONSTAT_CAM_CHANGE)
-		ucsi_partner_task(con, ucsi_check_altmodes, 1, 0);
+		ucsi_partner_task(con, ucsi_check_altmodes, 1, HZ);
 
 out_unlock:
 	mutex_unlock(&con->lock);
-- 
2.45.0.118.g7fe29c98d7-goog



Return-Path: <linux-usb+bounces-20062-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C878EA26A39
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 03:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9697618874E9
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 02:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789FC1482F5;
	Tue,  4 Feb 2025 02:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W9Gg+67h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E77F145B16
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 02:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738637173; cv=none; b=PyT3BKlIB0pRiNXS/icjVeBaO0oQSmL+VU9js7WGsXzFS4DtyZGqj4HfZGGS5x6H+l7CPA0WIvLQr3R2Fa0n0aqsosxoVR7bEzhwbfGxa0jiH5NE9F8BTRj2shy8QgyMFmldP83IusgQeVcrrK4rm+eyipmz9id19eSU4D1iGQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738637173; c=relaxed/simple;
	bh=FhlvvrwLx13f9HUXfcFDQ70gZZkNz8MovH5kLuSeCkM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ct43xV8MYO6MNUDMw3SBAOmCdzCAPY0ZX2rpdH/yMds6J93jIw+qSoB98eAUgI7gDv2Rknbw6rxLiwtn8iiReomCXkifd2wRoLhHrCb1N6yg7HvtLeZzZTysqhGytVBl3q+AUZYVYdlxVouKWwgnj7TcQFOroF0IfUj+9tVTe1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W9Gg+67h; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f5538a2356so9323595a91.2
        for <linux-usb@vger.kernel.org>; Mon, 03 Feb 2025 18:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738637171; x=1739241971; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yj6PYh7a5V+2YmsXleNKK2uqpxAMcmSNOValgCGwzic=;
        b=W9Gg+67hHL+1kBm9NiM6SO2PED2/7+SUp5J9IoJ08VcMwM/NP7yRSzExPe9n3ej4nS
         hS8Qh6J3PwyJsUaXHe8WECkGgfO1Lw83afbcezn1FS3vbCwuh03Buw020rBYrx+OXanQ
         5rWXbohjuOy7hPBlq3oNE6m83SVb0jP6cIeuwCCCxeYFupi/bOACv9TsUUbZGkCvUgv/
         zmqPL2F/o7WUcoKPqpPFeKdJMFl92uWCKRFOLqi+xb4KY8GCF6uSYNMQWSry7sg+Qhkw
         eGbQjNemBE5rkuNSmpjmdEy8yMOZtWSRm29PDVDJ+q0KfLCV5C1G+bKYfRTkyFtF5cOG
         +p9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738637171; x=1739241971;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yj6PYh7a5V+2YmsXleNKK2uqpxAMcmSNOValgCGwzic=;
        b=uztGsgzLkrkjASJkC2VVitSAaj2qAKfCp2/3rMo9CZtO0jQh2Mp3NSErNxZ0uFeqJf
         duZeM44RBBagKhkVIHX1Uca7e02aUE3KZHhet/GHlyWu22bgDijvGbGjOim70FaT8Agn
         EEdWfQDfM0FValspauHr5jkseZW3PL8WExxpNFqazNvuBGsmVs8Uk6XlBmxMM62Yabqx
         pGIxUKuvJ31YuRx8senBWR56AsjofNoKF5I5pRo5/C+mRmEZYHeLy6ZUuRSfkbNcYz9P
         2+55ZKNJxJ6puvzGB+9ZGP5v5+dgXxy/SQpDP1AZcGd+jiibllDMx+7mdJY3GiH5zNZF
         kNEg==
X-Forwarded-Encrypted: i=1; AJvYcCU8ZoLO+2KNJBR/GkUHPBAxUgKUusXfCU3JlSoxubL0xlJYJU5gOcx5phpeFb2ubu7Mhk2XzSX41XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxnG+hrhOKGe1biATrmXd4nPel1BEMxC/k3Ci5TksuYDKXraXe
	GaddbVkcZY3oU+f/sgJ8C9eUjKGcL1X4ZaCFHJgDFVwiumil8dyHAd787QjjNf58qfHowhbLWgU
	hcQ==
X-Google-Smtp-Source: AGHT+IEn7QjqULPLggNcfCVd5kG+YjRhCMLFnv6RORNu9jV0K0dUDdgMxSFqNkRCyU2XpgiPsBSpbdeAIlU=
X-Received: from pfnj23.prod.google.com ([2002:aa7:83d7:0:b0:725:d8bc:33e1])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d04e:b0:1d9:c64a:9f72
 with SMTP id adf61e73a8af0-1ed7a5b68cemr45332792637.2.1738637170795; Mon, 03
 Feb 2025 18:46:10 -0800 (PST)
Date: Tue,  4 Feb 2025 02:45:59 +0000
In-Reply-To: <20250204024600.4138776-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250204024600.4138776-1-jthies@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250204024600.4138776-3-jthies@google.com>
Subject: [PATCH v1 2/2] usb: typec: ucsi: resume work after EC init
From: Jameson Thies <jthies@google.com>
To: ukaszb@chromium.org, tzungbi@kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, dmitry.baryshkov@linaro.org, 
	abhishekpandit@chromium.org, akuchynski@chromium.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

A manual EC sysjump will restart the PPM and break communication with
the UCSI driver by disabling notifications in the initial PPM state.
Update cros_ec_ucsi to listen for PPM init events and treat them as a
system resume to re-establish communication with the PPM (ChromeOS EC).

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index c605c8616726..5f17fcbda059 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -205,12 +205,19 @@ static int cros_ucsi_event(struct notifier_block *nb,
 {
 	struct cros_ucsi_data *udata = container_of(nb, struct cros_ucsi_data, nb);
 
-	if (!(host_event & PD_EVENT_PPM))
-		return NOTIFY_OK;
+	if (host_event & PD_EVENT_INIT) {
+		/* Late init event received from ChromeOS EC. Treat this as a
+		 * system resume to re-enable communication with the PPM.
+		 */
+		dev_dbg(udata->dev, "Late PD init received\n");
+		ucsi_resume(udata->ucsi);
+	}
 
-	dev_dbg(udata->dev, "UCSI notification received\n");
-	flush_work(&udata->work);
-	schedule_work(&udata->work);
+	if (host_event & PD_EVENT_PPM) {
+		dev_dbg(udata->dev, "UCSI notification received\n");
+		flush_work(&udata->work);
+		schedule_work(&udata->work);
+	}
 
 	return NOTIFY_OK;
 }
-- 
2.48.1.362.g079036d154-goog



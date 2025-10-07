Return-Path: <linux-usb+bounces-28942-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC036BBFD17
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 02:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B245F4F34B5
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 00:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8CD2226D14;
	Tue,  7 Oct 2025 00:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dFojNvCA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDC7223DDD
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 00:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759795229; cv=none; b=N9c75J0RBk0TXbf4AVAvOAy01VzO1w/2CN94n4XeSdlnxZrmmuF+jrseFxhBTojCX8gFEcb6WQ4r3F3ldjvtmCCcjcvMvXi9JOz6Mn50yetCfXsYOjcMrYpONoxqENevB1B8qkrJu9mILIPMAx+QgDRwA+7wws6aTNW+y5oSm2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759795229; c=relaxed/simple;
	bh=pENwmsAAjmiNkgco4RnTpMkJCARZFCefDJIaJ08Ov5c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S+DOnDEhXp5P5hZfXMFW54jfZ0S66s8Es25HrbUaz10pRZnokb4fkRsIPXIu2oUDGYHPIx1i7GTBNJA8WrL0qBtKbgdEDqzRsCRmgf1Em+KonbGob28eWLKejbugFQr+KQla51t+Yq1Z7bStJxP9mHBjb+qUMfPa4fbHLSY3JDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dFojNvCA; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-28e8112143fso14262385ad.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 17:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759795227; x=1760400027; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=veFXfjRDf0dsvd44VAIZ/d1llsST7JCD9aXA/FPz96g=;
        b=dFojNvCA8fpNQss7mCwGj7h3gilGHWx4j8omrm0sTp8KdF7mryYhhC1Emj/BiIYBMI
         uek5x1JYUxgh8QYVN8hy3/2+PH5fqwgmzSglGzmArPysvAar9GQBR1wmhXyMHhGGtNaI
         vUKLLH6qSc3KCMrG/A/IqKEVuo3U8qUNvSoczFv5qjgF4uTHu29aNPlIeFDuvkEVZjgE
         6OSQqxNSQ2TSoT+YBNINFdX3T5uNM3F73X8oyKlqQlxY4V1iPuYjK8T5X50flsyWfeQW
         aPjiur3LkQhpWOu2F1wFOVY1LTVsr1N2KffpHm4MYtNGcjzoTwiNmCQ3JkNIPztw9rqW
         8wWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759795227; x=1760400027;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=veFXfjRDf0dsvd44VAIZ/d1llsST7JCD9aXA/FPz96g=;
        b=qBa1T7g+6NA253svcr6rjBlFU8U4MbL+WJOSsWPpTBq5TLE0nSLshN/6tnqolvd8dI
         SLgtG5Rb+avJ5YgxQs57Fwn3V+3GTiwYO5ti1lGiUxxbsE0+K5KPfjpZypJDJttZpoaD
         fhuVlGr0pIh7HkzICqtHKg9b1Ql5tOUxdOTJADONC3fCHUadqSgFx/q24ELngApfy8hk
         MhHnHzM3Q8dYjcrD34t5j3WV7WYHhhx8qYHbOHdfWeQEzgbm/VgRHnPULnBmarsq8Bst
         OYve/yFp7pKDkVkGDhzSjNDEW3qgvTFl9FRtuE9bBNGtdJi2xHrI7roR4VJD632+65yo
         S1Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVm4ICQSuPA1CFHLYdzWu6yNbRvELC/eU3CDM40MkVXB/RNGgU+nWW76LFl3XtlGMjWvjFUsQH1QcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYx/zKW/PMzlWwqiCsOQN9WJrLODKoBXAtF2OaQLpYJ60JK967
	NoqiVNlTfK4QWSGbtaXEBCiYReN4TpzqJI2/4lHSMxijYeciYGYEfn9ie/QTLapRnFqd7UjTzko
	shNBvog==
X-Google-Smtp-Source: AGHT+IEOR6Wj27pRpKv0k/qoUxQHhzFwXh906JQ8G1YD/rp0fjukZfK5N0y7vLEm9X9EgoopeHdAosKdGtE=
X-Received: from ploh14.prod.google.com ([2002:a17:902:f70e:b0:269:4741:6d3f])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db05:b0:267:a5df:9b07
 with SMTP id d9443c01a7336-28e9a513217mr199147135ad.12.1759795227083; Mon, 06
 Oct 2025 17:00:27 -0700 (PDT)
Date: Tue,  7 Oct 2025 00:00:04 +0000
In-Reply-To: <20251007000007.3724229-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251007000007.3724229-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251007000007.3724229-4-jthies@google.com>
Subject: [PATCH 3/6] usb: typec: ucsi: Report power supply changes on power
 opmode changes
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: jthies@google.com, dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org, 
	gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, sebastian.reichel@collabora.com, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Report opmode changes from the PPM to the power supply class by calling
ucsi_port_psy_changed(). If the current opmode is USB PD, do not call
ucsi_port_psy_changed(). The power supply class will be updated after
requesting partner source PDOs.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3f568f790f39..7b718049d0d1 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1022,14 +1022,17 @@ static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
 		con->rdo = 0;
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_1_5A);
+		ucsi_port_psy_changed(con);
 		break;
 	case UCSI_CONSTAT_PWR_OPMODE_TYPEC3_0:
 		con->rdo = 0;
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_3_0A);
+		ucsi_port_psy_changed(con);
 		break;
 	default:
 		con->rdo = 0;
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_USB);
+		ucsi_port_psy_changed(con);
 		break;
 	}
 }
-- 
2.51.0.618.g983fd99d29-goog



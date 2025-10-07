Return-Path: <linux-usb+bounces-28943-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7276BBFD18
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 02:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA8353C5149
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 00:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D8922AE45;
	Tue,  7 Oct 2025 00:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q03rbH0Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438BE227EA7
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 00:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759795232; cv=none; b=m7u9zlJGVwrchFk93LdclyzvUSclau9XWKjLak2q2KMBI+ATjHBXZcSypNNtqdT1O3JKHsgQUosbiiCCVaCMnxs9hkHIhxOTgw/pwdJBBddycm7dhCn7iprsHULTiBGiapMjDoL4k456XSttcgzcicJn2ZoVTV6IhcSpum9UXME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759795232; c=relaxed/simple;
	bh=D+MRKxpRY+FzYsdPeIj4rxTE/97xCVi92Ne0tdfRG9w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=amc73b8EiAO7zv0J59/7TsZ05FwNFQONmZZFFaBaSfODiSY5ZZANzyQXiqlCqsp4PZJm8HihGxPEmEiy7bypKr/lbyeGXRLUCgkIR2abocaexGDgIq0PIai/c58Zy3WD04+4DDdDRZMqM3VmiALHhHJkdCZJplzWhMOBdrbGlyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q03rbH0Z; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-28bd8b3fa67so48270545ad.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 17:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759795230; x=1760400030; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HBzYAbkVeiCWYgmKOO6DMAiS3ySiT/Utkjit0D80cV8=;
        b=Q03rbH0ZOciiKXEGIka8M5SIgkmvzw6ZHsDsOkSYyUmLRCd8v3zg1PCTWsjgf205cE
         fju8msKsEasSW/0kkBl6H10HqfnMZm4EgbfVOvofsXBgSWUacfO4/3ZUHCeyqPwoLs3o
         nIsHdRVAqLeBDmEyt3nHaAAjywJdKopVZ3J4A/nYfXQPISH5PH7d1/oOWzBJ592wkSgH
         m1SAQEkRXRW0CSkcAD2PNVa6uOgy0xfcj1sV/HquWem0LmSUERRwbzcY3Wlmp+bBTDtL
         BMk32ivDpxNgdFKmcAAIG+Jw47DFOQCdpSYvns7wogtXrvL2kE6hgLgyfiY5lga0U23m
         Pn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759795230; x=1760400030;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HBzYAbkVeiCWYgmKOO6DMAiS3ySiT/Utkjit0D80cV8=;
        b=F1r3TmXrtm9mR+BSqECmnD0ZCM4ekalx+fQsHbHP7vtNvRlEpsda8TBPNxt+Z6cFxV
         3CV18vuQ/uyzjUa3VtTfqnCC1s7vDMQQGIR4wqswwVjC2kE2ZqZJ3WINKYxE0lMcfGdF
         DKTxv2wRs0P9Ta/mYP29qv8A3i1FW1q+GqDaIfD4WFWA+6vFnAUGnOvJ0q87trmXL7MW
         HP2sVBTaCMe6LQDm1P9j3MSHqwM+oKTfHabw8MuaUKDBe9vKeBa5Hm4QElsNVg5Uy4Is
         NgF7xcuO4MzsPo6NvsjKVIOlKp6Ma575B0QOz51Jt/dVz44Tcgvck2KrOgBwtZmBpDKg
         NaNA==
X-Forwarded-Encrypted: i=1; AJvYcCVkdjm4sRgZiNQaLNxefQy1GmbUwrvnQEq9PWRGMP9gw8WLKtbi6u1Ec3uzzgzOi166xtIo+6K/voc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOinxjORlxwzEpK6iOswJJmfC1dN8EDDpZIw5ARGE8aHslReVR
	jm+dxfctL1jMTpmLY/18qMgoLqHpp5iL4/9z++SHPxxeiFuSAq1yjaggjSx5T4g7YOWvR9r5qq4
	KgkLqGw==
X-Google-Smtp-Source: AGHT+IFxQ/0APQQH/w8k8aOg6BAF8kp00klr4bjh7buOd+uTq0PuqSjd8xU2TYekqWlGFdbE0f7oM3ZZQgc=
X-Received: from plek20.prod.google.com ([2002:a17:903:4514:b0:274:e523:6f5a])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f04:b0:269:8d85:2249
 with SMTP id d9443c01a7336-28e9a5689f6mr144152565ad.22.1759795230224; Mon, 06
 Oct 2025 17:00:30 -0700 (PDT)
Date: Tue,  7 Oct 2025 00:00:05 +0000
In-Reply-To: <20251007000007.3724229-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251007000007.3724229-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251007000007.3724229-5-jthies@google.com>
Subject: [PATCH 4/6] usb: typec: ucsi: Report power supply change on sink path change
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: jthies@google.com, dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org, 
	gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, sebastian.reichel@collabora.com, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Update the UCSI interface driver to report a power supply change when
the PPM sets the Sink Path Change bit.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 +-
 drivers/usb/typec/ucsi/ucsi.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 7b718049d0d1..1a7d850b11ea 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1293,7 +1293,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	if (change & UCSI_CONSTAT_CAM_CHANGE)
 		ucsi_partner_task(con, ucsi_check_altmodes, 1, HZ);
 
-	if (change & UCSI_CONSTAT_BC_CHANGE)
+	if (change & UCSI_CONSTAT_BC_CHANGE || change & UCSI_CONSTAT_SINK_PATH_CHANGE)
 		ucsi_port_psy_changed(con);
 
 	if (con->ucsi->version >= UCSI_VERSION_2_1 &&
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index cce93af7461b..35993bc34d4d 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -382,6 +382,7 @@ struct ucsi_cable_property {
 #define UCSI_CONSTAT_BC_CHANGE			BIT(9)
 #define UCSI_CONSTAT_PARTNER_CHANGE		BIT(11)
 #define UCSI_CONSTAT_POWER_DIR_CHANGE		BIT(12)
+#define UCSI_CONSTAT_SINK_PATH_CHANGE		BIT(13)
 #define UCSI_CONSTAT_CONNECT_CHANGE		BIT(14)
 #define UCSI_CONSTAT_ERROR			BIT(15)
 
-- 
2.51.0.618.g983fd99d29-goog



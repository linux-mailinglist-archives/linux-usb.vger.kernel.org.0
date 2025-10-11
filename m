Return-Path: <linux-usb+bounces-29160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8F7BCF32B
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 11:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3CD3D34D61A
	for <lists+linux-usb@lfdr.de>; Sat, 11 Oct 2025 09:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61425246774;
	Sat, 11 Oct 2025 09:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uajayrgd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C263532C8B
	for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760175599; cv=none; b=EdRka/LpSMU7hivGJlLkL4j6HIJ8ixaM5PhNwEtU+4xNaYcpn9TNcONjy6qFnVAVaxqDoYaAMGZnrHVRYoRo7Ky4BnK5DArtZGs/BJtBqqdsnNg54VqLeRWp/gwd2FLIbQ9XdAznaiODFe8OVspBkzg1cBm1R8Ba6ZWQD2Sg+K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760175599; c=relaxed/simple;
	bh=DWulZoMSEhvbiHnjEqnSdTzgVje1JCmA/RDSbaOK/L0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l/1VTS/LnD0HF40kvZSIgmFeRqsqLN72o6oBD70hEFG9rUwG2v3+mhDzCtBeQqZwRGkYfpa+2yHdle/OLuqKhoDKMMbbC7oshMBwOy+5U7rSLxWUULL6JtJrFfthbsA/AZ6H+66JL1lTz/VvSLSRYB2xN8T2pYTS5eUL7/S0OG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uajayrgd; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-32ec291a325so2048049a91.1
        for <linux-usb@vger.kernel.org>; Sat, 11 Oct 2025 02:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760175594; x=1760780394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i/hp0xubT0bG806mERk4z9+ItCewWdjkvCrKt8wokmk=;
        b=UajayrgdbuErmrsspfr4MbzgOs4moY61HAZwL0n+89KGGO1OPnvEtgjayi5pb7vWJ0
         OjZw0rjNovt9jAvO7i5rbPncvG0NoFb8JWL99gmiH9mrQIygnHvoh42vhYIlZbCB5Qye
         fN3Vifgg8et74pnp6zCF5egzfnl9aZItMBRYv+oxzwDjJGhkV7VZMqs7BpIa0v7y1WmT
         Fh3aBT/oaW8k/tOnLkBm+GUxfH4OOJsaFudBECVIcKeoOvkoRw405xrXyF11c5wFsLGk
         JIH/HcvQVMsq+q5USa4n28mBV44e2UFp+XikUEsRRUP8dUJTgmfv1yRQwmwe6UQuFcKS
         D0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760175594; x=1760780394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/hp0xubT0bG806mERk4z9+ItCewWdjkvCrKt8wokmk=;
        b=ZLb5c62Df5nhyhIkqkcZ4sCoUbppcgw7SmETWxHVX4ziPK5JhqzVnl5YTB+CM524Ps
         mnQ9BTDH8r0HXrvfrbmSE92HExKiKdEpIhEb8MdHk48WoZYCEpjOYhZydLGcDhf/8zG+
         e8MAFZUjeTAUyzCED9XHby+6mojC5B/Q+lufdzERAYvbvoZ7OrG8IPZZhFrKLhj9gIna
         t2R8INCrzVGWaajSppKOrQr6FVg1UJPOKjfdyB4+DpTUE60CfsEJvnJCIn3Ud8LrSWyE
         rynDXSRgPl1pkvZTcT0kQJ2Z++zhICSs3gV9RNj5y8XITI/GalqpwcZdGZTdrEaO6R+1
         hZWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3rGvCtY4q+rfid6s0Pl8tLMh/Golh3qne6XlnbOjpZ/DjsqiTZT2UpsER2TZzKcriTFbBzOvv3OY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwXjaG3ML6NqSrJehrxBVeRHuGtP8KyXUMnSjzeFVVkSsh6rgJ
	oDVXm7luGqs4JD6XK9N6xofg9x1sFU6jU38uUGK7fg5kyVBdXjhPsXyi
X-Gm-Gg: ASbGncsJWdF8TdK/1w2BKbNPnpIT4dPi3KH8MCATDours48jOeGkERDF3HoJS/WfVB7
	mqTxeLOPVAnre7cD9fAC6rrOWiSg3CZFbBXaFqOdQOjnHIIhmwF+kE9PkWGVQlfiNdjdD6rih6O
	SHPchjOZciHCd7+9NC8MuyVnhiTYV79YSUhagdjgFmQGXVrn5yftxNOmbmPVoZs/TuPYYDMX0tl
	lsSbZJIrGDpPZUsKtq0PZDe1MDFTHJH6m28TB3nWWGAy9HAbTmLt8a3TAb/4Kb7C1Om/FOppwSi
	nosU57vSJ4rxPcUkrRyltTUr54RC5wq4N+bkIw8x9M08N5uC+uwSVqAfBghtG7Dk3mFZL9Dm79h
	6WBl1aO3vfqvGrtyQ5yutcrQ0luByVjnj/c9zgtaReg/hCwiumA==
X-Google-Smtp-Source: AGHT+IHlrOOhmyePzgU1zqgIpyyeWDPqEEgVRAICsIhKY2hiXJnvchEuAX0BSG2ClMyGV5EPCagGQA==
X-Received: by 2002:a17:90b:1d0a:b0:32e:87f6:f5a6 with SMTP id 98e67ed59e1d1-33b50f2300dmr21030970a91.0.1760175594136;
        Sat, 11 Oct 2025 02:39:54 -0700 (PDT)
Received: from fedora ([2409:40d1:88:ea5b:9773:a1fe:6d1:6334])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a3cc0dsm5950526a91.9.2025.10.11.02.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 02:39:53 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	i.shihao.999@gmail.com,
	linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v2] usb: implement proper subclass protocol translation
Date: Sat, 11 Oct 2025 15:09:37 +0530
Message-ID: <20251011093937.19434-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Proper protocol translation for old legacy usb devices
to set proper cmd_value.

Earlier protocol translation was insufficient for old usb devices
which was padding all subclasses such as USB_SC_RBC, USB_SC_SCSI
and USB_SC_CYP_ATACB cmd_len to 6 byte value and because it wasn't
complete it had a FIXME comment stating to fix the protocol transl
-ation for those legacy usb devices.

As a result implement proper protocol translation as per their op
code. In addition to the old default value 6 those old legacy
usb-device subclasses needed cmd_len value to 10, 12, and 16
byte also.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>

---
changes v2:
- Update protocol translation comment
- Add comment for non-legacy subclasses
---
 drivers/usb/storage/transport.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index 1aa1bd26c81f..edbada636f6c 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -718,12 +718,26 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)

 		scsi_eh_prep_cmnd(srb, &ses, NULL, 0, sense_size);

-		/* FIXME: we must do the protocol translation here */
+		/* Handle usb subclass protocol translation */
 		if (us->subclass == USB_SC_RBC || us->subclass == USB_SC_SCSI ||
-				us->subclass == USB_SC_CYP_ATACB)
-			srb->cmd_len = 6;
-		else
+		    us->subclass == USB_SC_CYP_ATACB) {
+			/* Determine cmd_len based on scsi opcode group */
+			if (srb->cmnd[0] <= 0x1F)
+				srb->cmd_len = 6;
+			else if (srb->cmnd[0] <= 0x7F)
+				srb->cmd_len = 10;
+			else if (srb->cmnd[0] <= 0x9F)
+				srb->cmd_len = 16;
+			else if (srb->cmnd[0] <= 0xBF)
+				srb->cmd_len = 12;
+			else if (srb->cmnd[0] <= 0xDF)
+				srb->cmd_len = 16;
+			else
+				srb->cmd_len = 6;
+		} else {
+			/* Use fixed value for non-legacy subclasses */
 			srb->cmd_len = 12;
+		}

 		/* issue the auto-sense command */
 		scsi_set_resid(srb, 0);
--
2.51.0



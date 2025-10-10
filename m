Return-Path: <linux-usb+bounces-29114-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41697BCCC79
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 13:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 695F41A6180A
	for <lists+linux-usb@lfdr.de>; Fri, 10 Oct 2025 11:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C438274B5F;
	Fri, 10 Oct 2025 11:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpFOnwG6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64306285C9F
	for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 11:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095819; cv=none; b=Ijy9g34moSyd93F7xc4ljWOWWTVUY0Yh51GBAfg2jFPp12E2qkDgZuH3igu+e8BlIiwE2c2ZOUxU29uJz6iZwfXYMiqwOtyklH2zMNQ6bAlDtT6ruimAunXh4r6GFsAWxCVb9voH9wFoxRYRFpVkMBACVDQUNuFZxrXJR+UNVlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095819; c=relaxed/simple;
	bh=rveR6cx6ebQ4+uXr6uy3Gv7dE1U2mYSMxwWXUgGORnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LdFPcAsDEtCTv0yE4yTNAjtQe3mwfgnTL/sxCqjeonQs6fzUGeNy+Y5llWFJX0GmUBOTpoKx2xSMyWJjdcbu1j6mNRwgr0LCExe133VO9TSrfLbU5JzLNht1uCAofuYE7WYMg5ulHql152lPYXKjRrhfm1bB3R5A3/rVjBTssU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpFOnwG6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2681660d604so23660175ad.0
        for <linux-usb@vger.kernel.org>; Fri, 10 Oct 2025 04:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760095817; x=1760700617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DP4eor4oftivBYeHDkFjINJ1dsAuKQQ9icHh9+fGO/I=;
        b=PpFOnwG646n1EyjBHzcvMxqEcc1R5H8TuVugVYf5X/3wgdiyluLGNJhSpKki+3hyPk
         SFt0Ej9uP6OWLkM+cLJvoxgtG2X6bl4uvV7PtOau/Rt+t08MIttFUwrWFb8zPYuQpIdz
         RcGBdJOA6TgPL6xYhBveYhB6SF/s2AVtrRJPvsumWKEsgnh+ABldvb7qW3SAK4llIKSr
         b/4GkYdschIVke0nkoYfFWKBGcvgQs/vCvPAXXhT26IJYKa8au57S79u0Gz9zrP5rnOz
         lz5qsjAkkbDC9g3hwuKnUKSGInK45u2v7bHif+2AMX1ZFPbML2cep1tUjg3h6mLyszRJ
         Lm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095817; x=1760700617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DP4eor4oftivBYeHDkFjINJ1dsAuKQQ9icHh9+fGO/I=;
        b=RduZQeCVTkGa0GgCBi1ay56wBRVpL4EEe4W/em1d26xZ6rtRbD5mrJFIALNDjpkR+2
         qAjgSi/PK/rwOgSDIkEjw27DMig0pdq0+1Phn4F00SzEs17wrA2oG6utlq9SMHwSC40W
         bruKGVDzkhC3omsGJ/v/ubO0ruj/azMMDb3fJdCSgFz8Xs72KLhDIvEP15HQ7hnvnErM
         UmvWm8VzmPiaExGlH7xSBHLrLMCJxdBkDs8+YP5AMq7iAxtyn9OyQ2sltX4CFM7mnK7O
         HLi6O/MzdszdoQCQ+RNkn9OlCUPG4HwTiBGQemGhbVNVh0aHE8mp4HXqq4BnZKCOMSNC
         Gvng==
X-Forwarded-Encrypted: i=1; AJvYcCXHWzQyZeRBVdme4Jdthm+PRNMmgAluhAGzwXsiGcrAvxYxix0inFAbksGw1C7trwPn4SrAI5RpCUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLX9WIve3EG+cZM+NQ4NQAkKI/kALpM0Sq1fWvnsDBb0QyMywv
	cBd63co9DY58g4K68UiofwJwjVkM6zj/gs8NvCPDC63DusQf0zNXhKmv
X-Gm-Gg: ASbGncuRYc46KSIlh+DCFBZvpbWVaqIrMk1gfv1ltzwABC0zM7bpr/JV9PvyCCKjz13
	5rA+Rm0kSLOdOFKTFXrNcGXlSgKZyHMAZGphDtk3AR64HdisawNglZjVAoRjx/iAKttYdo1rID6
	TkI4UNHveidv2qeSDPURWD428xFI3KouFRM8T4YCRmShX/lrRPbCmbH7pRLP7+PsVAw7sDSPwj8
	Qc/BscSUbA43A+daXlLqhQs1Nww3Cyh6x1nUtYuB0rSE+62+/TOC83r3WiLEV3LxWrakueVlXgy
	26KUKSgzxZffPm2Sk2lP33EmcElTwxavEkA7sHaqh1Jo1PddeU/nGNJZ9aSYLwqUwWax927I5VV
	C+3/wGeYXbLqlIaG0YqzMeCErJLmPZ/pYoJNpaJZ92Wg=
X-Google-Smtp-Source: AGHT+IHYPVGhopu6wAamFX+6nz3XeDbFkWO8uKl3s/5krayk2I7fNrJXdks6aIEHY/HB87vvGH4w5Q==
X-Received: by 2002:a17:902:fc4c:b0:282:ee0e:5991 with SMTP id d9443c01a7336-290272b54abmr137911745ad.30.1760095816553;
        Fri, 10 Oct 2025 04:30:16 -0700 (PDT)
Received: from fedora ([2401:4900:1f32:7e6c:2a0d:1f4a:15be:938f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f07d51sm54393115ad.69.2025.10.10.04.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:30:16 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: gregkh@linuxfoundation.org
Cc: i.shihao.999@gmail.com,
	linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu,
	skhan@linuxfoundation.org
Subject: [PATCH] usb: Implement proper subclass protocol translation
Date: Fri, 10 Oct 2025 17:00:03 +0530
Message-ID: <20251010113003.22863-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Proper protocol translation for old legacy  usb devices.

Earlier protocol translation was insufficient for old usb devices
which was padding all subclasses  such as USB_SC_RBC, USB_SC_SCSI
and USB_SC_CYP_ATACB cmd_len to 6 byte value and because It wasn't
complete It had a FIXME comment stating to fix the protocol transl
-ation for those legacy usb devices.

As a result implement proper protocol translation as per their op
code.In addition to   the old default value 6  those old legacy
usb-device subclasses needed cmd_len value  to 10, 12 , and 16
byte also .

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---
 drivers/usb/storage/transport.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index 1aa1bd26c81f..4820b45d2a32 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -718,12 +718,25 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)

 		scsi_eh_prep_cmnd(srb, &ses, NULL, 0, sense_size);

-		/* FIXME: we must do the protocol translation here */
+		/* Protocol translation per scsi opcode group */
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
 			srb->cmd_len = 12;
+		}

 		/* issue the auto-sense command */
 		scsi_set_resid(srb, 0);
--
2.51.0



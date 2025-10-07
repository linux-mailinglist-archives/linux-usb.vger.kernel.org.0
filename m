Return-Path: <linux-usb+bounces-28966-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A77ABBC13BA
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 13:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50D283BA09C
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 11:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0639B2DAFAB;
	Tue,  7 Oct 2025 11:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxBrNnqq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC612D94B4
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 11:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759837083; cv=none; b=MIrEw/YtLIjNxwWLBOSv4W4PxSHxHBvHVzQPzQz8R8FbMRqasqwG1bo2TXt2Qnfc4B9A+wBVKoFKHoKqkNL6bxGmFma7RMDlg6RYIq/c//4Jk0v7ITY0Qq8Hr5gEaiQgw8Nwy81tiX14e2GraZz1G+qfi21b7qPqfUWbhmCmiHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759837083; c=relaxed/simple;
	bh=d7RUjqkiFf3+IFkcojRKwI4rF+NH4M4MopAkd1DNA1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0e+J17+znotYXe6kMiALuTko7dhXbrKhUzNyd2+r4h5UqY5jGtF/jCYHoy/8TAhqQ2Iz/9n65hOOQoFmFNEDF0tOSiFzTvelv9+t8NvrbpPsDsCd1/EYTgO6xX0cZJbT9IOEArBsobMYPyj7eWlUdwNxwLtwFHY7XCVNs7WorY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxBrNnqq; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-27eed7bdfeeso82321415ad.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 04:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759837081; x=1760441881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahPadqajcRtIBXtat0qc/Ft7/OUx6NvlLGSuRZTtprE=;
        b=lxBrNnqqp+pmWQzIgMTmagZfcuScnLsm5KqqSOEDbA4IupSVzfPPKXo0sR9HtN2q/8
         75M4woJLWAnyuelE72VrdCMqGtX+W8hkYWlflb0XhKnKL16nnt/E68mXWfa5BGeCCJF1
         oiJm1pPBuzhX2qn2HOHTIsH8zH9hWUSq9LBhj4OeoKVkeCg87NRO/LR0cDpDjg8R5aTD
         m0dv+ibP0IDca9097g1Ur4zbey2bjs+3hFkrwf1AFb014ji/F1ZZyruNrSo6NTO6IWBx
         8deIa9vPsY2lgWr9Fz6sX3yC9jxjfwKRX4XhnCrVZIV8uyfNkqjxx00NrcFiVV+JH9md
         V6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759837081; x=1760441881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahPadqajcRtIBXtat0qc/Ft7/OUx6NvlLGSuRZTtprE=;
        b=lOnxG8BeOGcaujBOQkoogkTNk/UX2ORROE1Dpg9cROeZd4POFL1p8pa3qXVlQrnZMD
         RnACtUOV7/PrzrOEQ4NM+NaCJrNgWETPh9/X/KX9ZTvVT+2NcvAWPbG0ANIN6IkzjgF4
         vnKwYMp7/0APXfF8TK7CZLE0N8OiOBrvQEm27+N2OcWJJk1chfL1iXG8PMRDR8dnIy0l
         yQswIC84zTm/sp6nXlQCeqZB8md3lgVCw2uIhxAkAnZ7K2g4735alRUsPTGXqN3kAdgP
         5D0AYH57BDAmUdFLfu9UjlcE6S7c6tktQhG9q+QqtHVRd4U1x7Se1LbNJR4angw6TRa4
         +3ug==
X-Forwarded-Encrypted: i=1; AJvYcCVRin0mkMCFfueuRfdI+JdDAEXgKGheu83ZRpiYsCDkt+ubEOLLSE8+s46S1oYuoegEhvCACKS4+60=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIXIYSQ94TNwI1/MqAr9alHCfUJCZF3Nb0bh8gvmAj8jfC5eZF
	88FfE/cfmFYXfM0uvaNWpwh+rTxEhcqUhpidP2WTru1FmJgC+PSLDusv
X-Gm-Gg: ASbGncv8oeuejCsCmSq8vaYmWsGXicax8TqQsxgp9cGxs3lQ6wKPDyW69JrsnxN8rrQ
	k8vRfbT84Dg/azjXQbeEXXoO6W+tKOwe8/nq3yg0Uwz0VbVuSXtCBz/zoW5PO8SY5ZxGG2gZ6AR
	K7zRcxwGK5RC0IPhnbELeeIc1iDi7bS/qUlsCD7Wn0LhBpOqm99kelph/jWoKjifihulAbp0oy+
	Tepy3pwZ3n+V50c/xljKyBiMqzBBK/a50cofCD2HZO8kLby8vXFjTaxBz3BYOZcbfg/vJI3KGQy
	ZZkBmdtxPcdvvGrXt42ljosdn6SBvW5LL3EGrUMxGuTBNDipfNwKnRbDSNJak/saXmPaqL9Y1oj
	gybTv9WSSnd7VXDYWTeZ8ZrjOfJafFiqFNGqedgTEMLHdZg==
X-Google-Smtp-Source: AGHT+IFd6fxInqE/3FZP/9V72QVyfQG3odGO1u+YzqPzKdgEzcXRn+yowu9W/aPSX1TYDO/I1adN0A==
X-Received: by 2002:a17:902:fa0e:b0:28e:cbbd:975f with SMTP id d9443c01a7336-28ecbbd9928mr18038605ad.1.1759837081190;
        Tue, 07 Oct 2025 04:38:01 -0700 (PDT)
Received: from fedora ([110.224.249.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339ee03ba76sm1391407a91.1.2025.10.07.04.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:38:00 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	i.shihao.999@gmail.com,
	linux-usb@vger.kernel.org
Subject: [PATCH v4] usb-storage v4: Simplify protocol translation
Date: Tue,  7 Oct 2025 17:07:32 +0530
Message-ID: <20251007113732.14709-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <db6b1fe6-4167-4d2f-85e5-4e160baffeed@rowland.harvard.edu>
References: <db6b1fe6-4167-4d2f-85e5-4e160baffeed@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify protocol translation for usb subclasses.

As suggested by Alan Stern  to remove the switch case labels  with
'default'  or keep the  previous  if statements  instead of the switch
cases and advised  reasonable value when cmnd[0] >= 0xe0 .

keep  those usb subclasses to default and simplify logic removing
switch cases and set 6 as a reasonable value when cmnd[0] >= 0xe0
which fallbacks  to value 6 which is old cmd_len for those subclasses.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>

---

change v1:
- update subjects for the commit
- update commit  description
- check checkpatch.pl script
- update From:  and signed-off name
change v2:
- check checkpatch.pl script
- update verion history in the commit
- wrap git commit changlog message
- update git commit  message body
change v3:
- simplfy protocol  translation logic
- set reasonable value when >= cmnd[0]
- remove switch case statements

---

 drivers/usb/storage/transport.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index 4d01f70f39ac..14cc608052d9 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -719,17 +719,9 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
 		scsi_eh_prep_cmnd(srb, &ses, NULL, 0, sense_size);
 
 		/* Protocol translation per scsi opcode group */
-		switch (us->subclass) {
-		case USB_SC_UFI:
-		case USB_SC_8020:
-		case USB_SC_8070:
-		case USB_SC_QIC:
-			srb->cmd_len = 12;
-			break;
-		/* Determine cmd_len based on scsi opcode group */
-		case USB_SC_RBC:
-		case USB_SC_SCSI:
-		case USB_SC_CYP_ATACB:
+		if (us->subclass == USB_SC_RBC || us->subclass == USB_SC_SCSI ||
+				us->subclass == USB_SC_CYP_ATACB) {
+		/* Determine cmd_len based on SCSI opcode group */
 			if (srb->cmnd[0] <= 0x1F)
 				srb->cmd_len = 6;
 			else if (srb->cmnd[0] <= 0x7F)
@@ -741,9 +733,10 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
 			else if (srb->cmnd[0] <= 0xDF)
 				srb->cmd_len = 16;
 			else
-
-				break;
-					}
+				srb->cmd_len = 6;
+		} else {
+			srb->cmd_len = 12;
+		}
 
 		/* issue the auto-sense command */
 		scsi_set_resid(srb, 0);
-- 
2.51.0



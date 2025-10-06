Return-Path: <linux-usb+bounces-28906-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAD7BBE08F
	for <lists+linux-usb@lfdr.de>; Mon, 06 Oct 2025 14:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78AB33BB838
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 12:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FBE27F754;
	Mon,  6 Oct 2025 12:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/ovC9Ng"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A7028031C
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 12:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759753913; cv=none; b=KtNPzK6Bw6bU4RkAkxjnTNApfov2ZnnbY/KAGJlso8gDqwao27mr+aZvUSBENQWiaRcqmTjYcUHxknmZY2bzjF9gQYhZ0O1mRYCQSrLaP33IHAWC2uANY3iRZSzfS6xe9nKe41fgJv5NunzOO7yXDd+s17gCdGltaRdeFmjc3ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759753913; c=relaxed/simple;
	bh=LzyrXF3Tdqb1wO2m4DHxN+BhW/w17yer6im1uRqKkoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3r71No8CI2QibHW6blsoO4LO2yeIyf9WOxt+WzohIfzoZmZTljO1pKksNacJOsYfm9pv6zyKRnvnHmTsz9gkaX8n6ikvkvJd/l0IHxvuFBtGihYTWI5ceUDYHdWBj+opJEwYFpKkjBHr2JefcPAenzeBmTQSgwzKo8POjAqHco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/ovC9Ng; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-791c287c10dso244198b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 05:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759753911; x=1760358711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JaR2vXQWKfTheeLKb9c2jJ7lLESVab1QtUTeLhYAv4=;
        b=G/ovC9NgrJkzA1Qthjn3o+2L0seS8Na7bhI2SK1EQGOXEJHFr7TNQOuAY+8+/Kt/H5
         4uX+56iIypoG4zHTLyo7Xv0o2bHfkKrsLmidBZOjCsdn6D9T6gsZPB9kNgZsSDLXJ//p
         LzNhfsXYWKeqG+09ZAFjpXnVB7jLId3d6zSjcDLkRHrQ/nua9fPaJiRSzrco1ui+tsNU
         Gv9kNn6mtokmIlDzuI7YzoX5KiEybFV4IawRFVt5Pp+s9vPG8tTltzeR6rRVmp1lXspk
         dUyKuHSEGKovXw85dJz0c+Mob3Ad8/hSJoSGuM6P/wDY5Ta3OXGkpUly56OjU6zodlIU
         erpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759753911; x=1760358711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JaR2vXQWKfTheeLKb9c2jJ7lLESVab1QtUTeLhYAv4=;
        b=RnSWrDzH4ojEi94j8Y1CYWxawTrDdUI09QyX9qk6/GsmGva2mYhGNgczh+jU80KBkt
         5PizSo7Z5RiwQJSOGNwV5XbJnikajJfoHc4uDm90CV4JzmZp8TKEEssQ6+tTwwgONjLp
         bJowk5gj8AP1uIE6yfXt0F8SgrhCap1wgbQRujiJtMNpgD/sTeuuLb6oZe/dfBDK000S
         R/MTuInQrpkWkiDOTogC8pXL/tPKCAVAtDesOlBZFrp/4DNWX35JnGRn/2p6aElJ+Gao
         qDMXhbZ36RvjCTui+oO31wnBAmHXTTmY6GWrY+3c0VsgrTNWKd2FP3hootXt7KSJdLp7
         3QjA==
X-Gm-Message-State: AOJu0YwEd3ur4MpRyWEzr6svfKttmPNS7a7To2Z606i2Mvjg6w3+2mvo
	kBnY1JhLzsEHGHb52NwjAapCEkWTQ/jjTDX2Wf2QSWi7+eLEs6pjb2pA
X-Gm-Gg: ASbGncvxgWYLNYifR+Bcc1GnyAXrQESg/23ryAV22CgBBS2apdlpdvu62XlUvsso9H7
	IcrHQIXxPlEIJtWazruCL4O6L6V2/gAC0uBbtUrJMkyMllQhHkegJWR+OlmyVBfOutdQkL7s6Gq
	d33ZduHjxc7zzCIJmUg/P3OZCbM5VkXUCZ33XXQK2rPFO0jKEd0hfBVM8ohy79z6LtIwb8nJ4V9
	MvCh+foZtiSdQVBTkl3stE1W5g1c391VCeM9cDKW/fQxJA7/79KpxVFrH4eOrdTaxwkQy/Xi5ju
	AMKDJQ5cE9JifMHSehtuYODGZsEzd8rzDQRMfBdGR9LSjljqKcylKlRY9F+bqPCSIGTkBtAM80q
	KBkW0h0hUCsBdS/u2oJw8+hcPO+gdPCvaImtfD0rS0b3yh3s61XP9WuTbO7I=
X-Google-Smtp-Source: AGHT+IF1xtDKSaiYZc4gRJxPeF5vdC8TYoND/nsUuahXdqLezuxDtTJG7KYrHvbXMqlhmgwfqsDMbw==
X-Received: by 2002:a05:6a20:3941:b0:2fe:d5:4e80 with SMTP id adf61e73a8af0-32b620b181dmr18202562637.37.1759753911069;
        Mon, 06 Oct 2025 05:31:51 -0700 (PDT)
Received: from fedora ([2401:4900:1f32:71f4:65e1:c826:fbe0:e77a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b62e3508744sm8503298a12.30.2025.10.06.05.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 05:31:50 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	shuah@kernel.org,
	Shi Hao <i.shihao.999@gmail.com>
Subject: [PATCH v3] usb-storage: Protocol translation for scsi opcode
Date: Mon,  6 Oct 2025 18:01:21 +0530
Message-ID: <20251006123121.72461-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003104635.24998-1-i.shihao.999@gmail.com>
References: <20251003104635.24998-1-i.shihao.999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Protocol translation for correct cmd_len for old legacy usb device
subclasses  USB_SC_RBC,USB_SC_SCSI  and USB_SC_CYP_ATACB as per
their scsi opcode.In the old code There was a 'FIXME' comment stating
that there  was a  need to set up for a proper SCSI subclass
protocol translation for those legacy usb subclasses .

Previous protocol translation is enough for modern usb subclasses
but it is insufficient for old usb devices for which it had a
'FIXME' comment on it. Also it was  only padding to 6 or to 12 bytes
leaving cmd_len value not properly set for those devices .

To avoid this  set proper SCSI  subclass protocol  translation based
on their opcodes and determine correct cmd_len for proper command
length translation as per their need .

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>

---

change v1:
- update subjects for the commit
- update commit  description
- check checkpatch.pl script
- update From:  and signed-off name
 - wrap git commit changelog
change v2:
- check checkpatch.pl script
- update verion history in the commit

---
 drivers/usb/storage/transport.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index 1aa1bd26c81f..ed9f3b9292f3 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -718,12 +718,31 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
 
 		scsi_eh_prep_cmnd(srb, &ses, NULL, 0, sense_size);
 
-		/* FIXME: we must do the protocol translation here */
-		if (us->subclass == USB_SC_RBC || us->subclass == USB_SC_SCSI ||
-				us->subclass == USB_SC_CYP_ATACB)
-			srb->cmd_len = 6;
-		else
+		/* Protocol translation per scsi opcode group */
+		switch (us->subclass) {
+		case USB_SC_UFI:
+		case USB_SC_8020:
+		case USB_SC_8070:
+		case USB_SC_QIC:
 			srb->cmd_len = 12;
+			break;
+		/* Determine cmd_len based on scsi opcode group */
+		case USB_SC_RBC:
+		case USB_SC_SCSI:
+		case USB_SC_CYP_ATACB:
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
+
+				break; }
 
 		/* issue the auto-sense command */
 		scsi_set_resid(srb, 0);
-- 
2.51.0



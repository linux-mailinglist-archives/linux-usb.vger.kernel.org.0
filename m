Return-Path: <linux-usb+bounces-29007-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8FDBC3898
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 09:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01995188E037
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 07:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3112F0C6D;
	Wed,  8 Oct 2025 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NE452216"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852BA19F137
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 07:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759907195; cv=none; b=GBQDpT/bbfDDJL0xne3SP9Eohyn+ORWqEkj8OSoj2cZbuZxmeRO1ki2nG+zoxumazpo0iCfl5j60Jz2FliTaviPbY7qmYF1+uEGFnwsdfx6f3cMOtsbveUTcgc/xH/5W4043T4ZOAJQtRXQSvAaimt0co8SwAyztVv1Z3dpOMNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759907195; c=relaxed/simple;
	bh=z/paivQZWmZjJ+ca3LjqqafWGvFPmcKwjjCg6DJDT6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S63g6IATlr6MQPM7TbhlUOm/tpwKl4JL8O5wXTIsFXQIzx/+QADPZI+B+1fCiSKozxqlmNMKVVNQmnHE+4lUPCxZ3phicvYC7oyomsnuiKrFCon4OA8NE36zr4HWtZWvr+XvEgW3n4+PCvpdkGw4MAPXAVc7CGhMGLCsTvHQErA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NE452216; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-27c369f8986so69331875ad.3
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 00:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759907193; x=1760511993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iG4PhHy8V+N3vVKa+82YAX47tqo89quIUPKnvk1542Y=;
        b=NE452216Yod0yo52lUUEjDIdlkrH2TkbPeknhKZyu4FWqEQwkJS7f7qVrh6LSPWFN1
         2Tl2i92U+nHH+e2lAIMPZZB5nFWcGnIgoKzztAglCnVo7r8QcolyzkVdp4xYLuuNPmKt
         8Hn3Vki9zMyPGPjCvGWMwhrYgigO1B3M+OzhtVSiXOjp+iFGwJfR3/f1TQzz7ozYaUc7
         WZHdjmqxe25n6jFFpXWnSh53J6zPuRzrOVIY5WMIOlXhLc7zAd7GUIxXpxZExGHgwSZj
         Qu4A26qEQNREGExmANd+2aVFl8fqPX7KPgj1TM+gw44soOlqUnXkX3w/GGVPCsqKje12
         wGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759907193; x=1760511993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iG4PhHy8V+N3vVKa+82YAX47tqo89quIUPKnvk1542Y=;
        b=sBz0kHitN9Tt63ipfRkL68Tv5FhcKnEeHWkmlY/jPbaf40nsGRZ+Cp3DBJPKthwRjp
         O/cSy11G2A7SfZGdE34b84Uk6KnUB8hT0505O997gJCfBZ2b98enJed1lN1FKT7zcx9J
         ZGJ0iRzdQP/Nzg6P1vOnTeQq2i7qWMIGKthErqU8uT/v3OHKMY4MNUZa9vTSEAwquFZm
         foqR0mf6VBSxowuGl3MZ5ALeAl4kIc+m8ge4dFZDeDCv8JpeVivCBiPxNCSdXsLFkuy2
         thiEWBYwn+tKWWip+eajY0BRAjmhMQnzQZYrQlXOEUKjZ89zpIO/yKka3VeWg21WJmmg
         lh6A==
X-Forwarded-Encrypted: i=1; AJvYcCV9MXQB524MnF9pggu9yxLDpOqiW9DB9l5eBTSPwPNZKzDIW+lu+G75XXzgcsRIBKw2OTAz41bM7KQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAr8OJxzTUfQxcVlSb7hZx4cpzkIpgjhufwBUDJ9YbNIZN8HRM
	rRAqaQ2yzZ7Q1g+XJTMX2lKflIUpjBsUHoqR1v4qJj5HOnarFmqMNHtg
X-Gm-Gg: ASbGncvVFPCRUTVLC69yPwbJEr4woBes6v3PnbN42oQPX1WOyLr/urUtQcRCbIwzK29
	okvTm8UDS9kDCROfu8pnFjJP5ifltq5BL9CV8Kom+3o4P6zBpXCsKZi6/R73dyTMiBYykNK/tT2
	1JwQfdVU4+avbEJU3WzOQvhNJQ6KhwimdCFXqPZqAMj8gdI/lXhB3cq2IDFaGOfvGsimXmYLb0a
	WEH43PD/c/5kE1vG/qD/1ryMgOnZ0R2DE94IVZQysLi90FzvMmJW1lecASfV3w28jOHHikh9Tfc
	IhMIdcyZEmqUPRbxHsx8Y4PDqzN6owEwXuZq3jhTvDhg5eWW2upVxjNu0qNu1nCthYtNVIUEOYl
	KjlKc1QOQE+rST1Ih5I+FoTAqW52HBf0ZeHmv42HaNLK5/A7pCi3Thw==
X-Google-Smtp-Source: AGHT+IGZvkcDkztv4XdFAiYtwXupHVDB+bGZA4AuFGiFfbT+TXSx0yy4Th7zyRwzmM7xjmR+A1xsUA==
X-Received: by 2002:a17:903:298c:b0:265:982a:d450 with SMTP id d9443c01a7336-290273ffbf1mr31130575ad.40.1759907192755;
        Wed, 08 Oct 2025 00:06:32 -0700 (PDT)
Received: from fedora ([122.173.29.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d126ae6sm188331745ad.42.2025.10.08.00.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:06:32 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	i.shihao.999@gmail.com,
	linux-usb@vger.kernel.org
Subject: [PATCH v5] usb-storage: Simplify protocol translation
Date: Wed,  8 Oct 2025 12:34:20 +0530
Message-ID: <20251008070420.8302-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <857a1b63-83d9-402b-a9cd-8aca0616c517@rowland.harvard.edu>
References: <857a1b63-83d9-402b-a9cd-8aca0616c517@rowland.harvard.edu>
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

changes v5:
- Reformulate as  v5  of original patch series
- No code changes ,clarified versioning history

changes v4:
- Simplify  protocol translation logic
- Set reasonable default when cmnd[0] >= 0xE0
- Remove switch-case statement

changes v3:
- Wrap  commit message lines properly
- Improve commit description
- fix  checkpatch.pl script errors

changes v2:
- Update subject commit message
- fix  checkpatch.pl warnings
- match from: and sign-off: name
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



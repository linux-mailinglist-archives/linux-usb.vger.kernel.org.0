Return-Path: <linux-usb+bounces-28884-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A239BB63C4
	for <lists+linux-usb@lfdr.de>; Fri, 03 Oct 2025 10:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F4383C4E28
	for <lists+linux-usb@lfdr.de>; Fri,  3 Oct 2025 08:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC9724468D;
	Fri,  3 Oct 2025 08:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9uBS0RN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ED71E5B72
	for <linux-usb@vger.kernel.org>; Fri,  3 Oct 2025 08:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759480310; cv=none; b=U1+CYtzfCHHvWjFjX5zY7lJX6eQm926snjsOgNc/KdI6y0hYSHbltYGJd/srzWyFpAaoehSq6EwFSxCpPpZfeeRML/GfLU5EPoemzfhws2eA3AELh893YegozaOLWo74ynxCMsnhjrXglX6bnnuqstCpRqR4i9MjKuRIaVw6Wq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759480310; c=relaxed/simple;
	bh=bONyhjQRZimrlfljhvr+OEmTvk4ap05M6c6oGRwg/0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MWNjhWDEwKQZiYmxzD9y3qZs+42stmNEiN65LM8HpdQlLdkgc/avtJZzXuJOqc3czFae6rvTBn+dttcKATi04PDMaqmZ9RMIzRI54vU3HaUeXCX904VK2N/p0o9flTWqDBnMumrMcYZittjS4qd7J44kedr5r+rlyLVSmz2waVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9uBS0RN; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-279e2554b6fso13259215ad.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Oct 2025 01:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759480308; x=1760085108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P4b4DdDUPs5giOsQ1F2abBQUmEHbfNpjxB0zd/RjlDM=;
        b=d9uBS0RNoxWx5lqP/cLGkYEOBS3D/FCzEPwq7f2oEj7+IcZTL7lDVK4kPqlCA8Hifv
         DPmnPME/oFKokwdPGJRUMl3T8vU+XkBgSbvIRJ9Wbkh1axjYirAOtgSh8+YUsrBFP4yc
         rLwKZunq+Bd9mMFcNniC4N6Hl6KxO4qS8sPk/b0YzhrutMv2tvyK5u33bGDpbWYHVQsB
         A796tI5c3VAlSvhOokXl31rHWIJSTbiXemKS8O3IYkuuZV9bvJWF8egRDycHovApHmCz
         q4eN1xxtxCErjeD9MyLbpj71VaFjDBpB6Sp3P0Ax00JeUa7f6vJWgmRqh3/YOUpKMyUh
         4NHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759480308; x=1760085108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4b4DdDUPs5giOsQ1F2abBQUmEHbfNpjxB0zd/RjlDM=;
        b=p4W22eRopzJhYX8yEjN7eSh0QPq1Coo1JFc6qfGVzjEarRIK406x8+wIec2XL2IRm9
         DEO6lknl8UHbk80ve3II9X8LXVNKXDQj0pYoQ6TqG7pPde/be+BLKEo0rtcXkYG+mY0w
         PZAmGEc2Y8Olj9j0qXn8EUPHSHwp/p12Swk7/8dyh3T9wHFkIj9RfP29iou/cE76vTcd
         aJZCMp+K7TMS/XdwJteQ61w6qSL/iO315w6ykt02+rLk/Ps5IbdYNJi47AwMSXPog+7n
         tH8l3NWG5y4XusHwZ7xjGXpx5Kxy93e2eUr0KvW27LzijUAP7HPqGT+4WFV7BaKrVXqZ
         g7OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWqiDrCh8QOJBm6IAZZNvUa+b0oZk8tSQSNZralkDkM8zOXRe57t8ZEp++3gVrTCou8hj+PMegGjw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9QOS6ZkWyBbt+cZcy7krLpZWhkrR33u0br4XwiswdJq2Ag0I9
	4/RTMBQWnQc35Wlwgx7CYnNFn+j4Z1bqXdmds5IbsNONshU/W2kpEcxq/ytqHm3N
X-Gm-Gg: ASbGncs1uNnGmWiVRbB0ZSfD77X5MoIzohVjyIqxPEM4fHphEQoM5QwbEPe9vdWXQ4D
	duNO0dsGEXnIS5Im3N/ro2xIA2i6y44rPq+xlQgaD5p7JGU0LKznpqXdW6z52OelU+ekeLoW31E
	E6g9VGwjIRafyZd9N2Y+9REz8f5T4F9xxblDEydBkruyDpTHYtkp0n2JI614peLRtIt6cu0LnLr
	XXooYcrR/c/RuKNoKiQjzsArt74EKPgRVu9b7zZ0kRd74CqWFS8sYwaPh0sMFaU1YKqPOTRK2/Y
	mgU35IAN2uFIAzkaGMiQr50spcRDq7s8jsd5OUmcri1rvPunb9wW8yLRU5b47Ff4msnle896v4f
	OQJOb8+huN/ppIm6jw/QDbVit2EhYTz5azpqYOuaUww==
X-Google-Smtp-Source: AGHT+IHISOfkmTJewyYckvYM67GWPQh32T4nbXD2QI7ynHV6CadwD+2za+QJbhDceR3ZTCP4w8k2rQ==
X-Received: by 2002:a17:902:e788:b0:27e:f018:d312 with SMTP id d9443c01a7336-28e9a513467mr24724415ad.1.1759480308357;
        Fri, 03 Oct 2025 01:31:48 -0700 (PDT)
Received: from fedora ([2401:4900:1c6a:929:4129:3dc8:6b7:9e8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1127a3sm42704335ad.20.2025.10.03.01.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 01:31:48 -0700 (PDT)
From: shihao <i.shihao.999@gmail.com>
To: gregkh@linuxfoundation.org
Cc: shuah@kernel.org,
	linux-usb@vger.kernel.org,
	shihao <i.shihao.999@gmail.com>
Subject: [PATCH] usb: Fixed protocol translation in usb/storage/transport.c
Date: Fri,  3 Oct 2025 14:01:17 +0530
Message-ID: <20251003083124.17072-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: shihao <i.shihao.999@gmail.com>
---
 drivers/usb/storage/transport.c | 41 ++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index 1aa1bd26c81f..4dd6bfa86c23 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -718,12 +718,41 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
 
 		scsi_eh_prep_cmnd(srb, &ses, NULL, 0, sense_size);
 
-		/* FIXME: we must do the protocol translation here */
-		if (us->subclass == USB_SC_RBC || us->subclass == USB_SC_SCSI ||
-				us->subclass == USB_SC_CYP_ATACB)
-			srb->cmd_len = 6;
-		else
-			srb->cmd_len = 12;
+		/* Protocol translation per SCSI opcode group */
+                switch(us->subclass)
+                {
+                case USB_SC_UFI:
+                case USB_SC_8020:
+                case USB_SC_8070:
+                case USB_SC_QIC:
+                         srb->cmd_len = 12 ;             /* ATAPI/UFI devices always use 12-byte CDBs */
+                         break;
+
+                case USB_SC_RBC:
+                case USB_SC_SCSI:
+                case USB_SC_CYP_ATACB:                   /* Determine cmd_len based on SCSI opcode group */
+
+                         if(opcode <= 0x1F)             /* Group 0 */
+                         {
+                                 srb->cmd_len = 6 ;
+                         }else if( opcode <= 0x7F)      /* Group 1 & 2 */
+                         {
+                                 srb->cmd_len = 10;
+                         }else if(opcode <= 0x9F )      /* Group 5 */
+                         {
+                                srb->cmd_len = 16 ;
+                         }else if(opcode <=0xBF)        /* Group 6 */
+                         {
+                                srb->cmd_len = 12 ;
+                         }else if( opcode <=0xDF)       /* Group 7 */
+                         {
+                                srb->cmd_len = 16;
+                         }else{
+                                ;                       /* Leaving cmd_len  value unchanged  for  0xE0–0xFF vendor-specific*/
+
+                         }
+                        break;
+                }
 
 		/* issue the auto-sense command */
 		scsi_set_resid(srb, 0);
-- 
2.51.0



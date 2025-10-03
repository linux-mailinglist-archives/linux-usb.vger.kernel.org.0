Return-Path: <linux-usb+bounces-28887-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7E8BB67A7
	for <lists+linux-usb@lfdr.de>; Fri, 03 Oct 2025 12:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 630F33C1A02
	for <lists+linux-usb@lfdr.de>; Fri,  3 Oct 2025 10:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C9A2E8DE3;
	Fri,  3 Oct 2025 10:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPzeWAJS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D651AAA1B
	for <linux-usb@vger.kernel.org>; Fri,  3 Oct 2025 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759488414; cv=none; b=eJy42HhQYKK63fpWOjLxNjwoL2NkjqvyGNzt/oD9UciOj/2G3//UZQGMjozJnGTTPKGMo9S1iLmkCPJjuwlvDfi5B5h734HaIe3SMxblesZsh+015j4eGEtSlk/840+7b4IPOCf2EDOg1cFn/XSBkR1MJF2vxzJ77xHePOAbHd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759488414; c=relaxed/simple;
	bh=xyRdQwc1sWAkZhM1D16JAqZgeec47CJVY0wu2wT7p2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rj2S/6k1eQq27j6kKI4g1q0/qvI/z1RBnN5N+LvyuhawRzJaxuYwhPwtUSYrJhog8sfbPIIxTFFKQq+snKrrI5ddy7/KSIlYawkBR6WuJJCRMs2atWsORa9KrQ33abfzQP8TDP6aJny06zEFP5ceN+ZpJXdmGJSnUa/emTJRlx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPzeWAJS; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3322e63602eso2999924a91.0
        for <linux-usb@vger.kernel.org>; Fri, 03 Oct 2025 03:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759488412; x=1760093212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=npTUDrTyBFWzIyzCjyof9bX5akmMVt4LSs6r6UONL/o=;
        b=QPzeWAJS6YfTusKP9UbybCY5ByDxaR1nL8LEQyu4oWLR3lpcOFXFTf3fOa/zDvLlqP
         4+up63bH3fgACrKrbCS7Un+VnBH7yPw6VmmRo+ylOeiZfRNTMqJUkWej4OUKUwJCEwW6
         y+lUCQZPpXPeuU0GD+G1JhHaDnMC6kY1WqQX3kzPPyPSaZTX6+OYfLFVeUUR5u5h2dNJ
         UPjHK92/O7qunLI9BfBewwIY177/81JR4YaywqQtiH8enLZbU/MMOZW8eHIECYce62Bz
         RhODSTEajPYRSvZr3jYEzEZEdqxFZ2GfqCq4M/jIHZAI5Dxq/cLDa1wBSz7MTxeqrGbP
         7RHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759488412; x=1760093212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npTUDrTyBFWzIyzCjyof9bX5akmMVt4LSs6r6UONL/o=;
        b=iz4O3oB9oKGQGIAZWxIivMYshW2xNANt1goIixUaPkW2UXTOHOgIe4UTHPJD5LtjWe
         LHm19zsVPBeHmm6Bub3vQ8r7hgHiq47hfdYqscJcxGyR49NtpeYPSrIPMk3kCtW0JEAD
         VwcqwAeDFa1SuOI24vtFLGqBf7U8zvkOhA7XSIMjogq2oUDqMGzJjSzJ9diIGqhaU3SN
         xSE9eqDw1h4npUIRBqH7vyDx5HCLwI1+8xJ5JFrx4GpL4g/j1HSvbm5EeK1L03QOqyR8
         ghdOJWnMyM4wZhvsORxSG766ieEsbMN9EKBuULejHGHlAgsHhVO7peYMxqfdxrFVum3I
         QzNg==
X-Forwarded-Encrypted: i=1; AJvYcCVFs2aI6uN4z8ChcuIZQj6bKaXThoJ8hdAlmg4c7OAT089d4zmMc7YpZ7WuVPMb45OJDCRnSS1yXcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsNwtEbaBa4WhczeKHGbmPjGs8Qu6+P6WgpONJAs6zwctbQl2U
	5yr4GSdR8BCQ3/7p7hw7v+ebYObrlA2l4v0JAxkpbfSZicpL/SICUYLE
X-Gm-Gg: ASbGncu/Xplm0McwEchyfs+E7bXBYxXOXFvfyI1JPiflbStN6O5VTbZmfQdaL/KPt3A
	NX1CupQLTKtLzp10qt2AcohiraVkrq6dNdOi0mlSNAD9Y0RoZoILrPsPRc/Jx6TrL2fSdHwiQBQ
	eZqIDYnXNhI+omwBCCvqEhdCLWhgSmG8AActmaCNyhgVEL8vbOf11ilj2Vp4VmegllZwFAdbb7F
	A9bkbizFr0QgrJ2nq2arWA4/ZZ5PNzDWtDLKiU3rulrVyI7owsd/Q/xu27QdAeGQPe8h6it2ChB
	KTCvpsUdkPZN5/zbH0o2J7ddvZCs7nJ8uAwhul6w14veZaYoxUhnlT4Xc7ZlO6U3TwwzMrrTbys
	Mt2DIb1GU3dtInegJLiwV+nZ5rZ4=
X-Google-Smtp-Source: AGHT+IF24bCrslJOTX7p1/oLqX5Vy+qlK517Q+QnqV/ou3tdRQg3GkvibqA6QfYUEC+7OS5lZYEoKw==
X-Received: by 2002:a17:90b:4b92:b0:32e:a59f:b25d with SMTP id 98e67ed59e1d1-339c27b938dmr3071909a91.30.1759488412505;
        Fri, 03 Oct 2025 03:46:52 -0700 (PDT)
Received: from fedora ([27.63.27.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ebd987sm7663530a91.7.2025.10.03.03.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 03:46:52 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: gregkh@linuxfoundation.org
Cc: shuah@kernel.org,
	linux-usb@vger.kernel.org,
	Shi Hao <i.shihao.999@gmail.com>
Subject: [PATCH] usb: fix protocol translation in drivers/usb/storage/transport.c
Date: Fri,  3 Oct 2025 16:16:33 +0530
Message-ID: <20251003104635.24998-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Previously, only a few USB subclasses had srb->cmd_len translated to 6 or 12 bytes, which was insufficient for some SCSI opcodes. This patch extends translation to the correct opcode ranges so that command lengths are set properly.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
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



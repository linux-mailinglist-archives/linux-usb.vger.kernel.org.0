Return-Path: <linux-usb+bounces-29021-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B750FBC4828
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 13:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 98ABE4E2D9C
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 11:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B45D2F6183;
	Wed,  8 Oct 2025 11:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJEtNHHW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB8722D4F6
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 11:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759921763; cv=none; b=S9xPM23m17kl3TebjzPnmv/Zslg9du4STYBX2kMApQzVFnojKPkVxJesIEbzV4hvzL3RIzli4k3aa2X70Yt732gsodrOtAHxj17QnrNec7gKo4Ry5H44QSeXb3o5HFGdelUOc/wZvyVweQUbnBYL0pIQf+OGgDbMLqR5SmHW4s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759921763; c=relaxed/simple;
	bh=A8jEJckWp9WdIYnTv2iCHDMDhGkffq/z89hRH1LKpu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VlHUY2Ib8MgiVFKnnIvl7tCyxUq5HNRebo6QwtKLs6Lw3iVAnQXJo01uc6spWxPABa0QCoScQ+KPelWZXJEbSEj8r4DRO12t6eTIDjZW5xWXKMuw83kG7wCdnmzjBbFLrm8L9imaGCqPekxHzQrBSrYhdmFXZTrvGQz6U6H/ljc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJEtNHHW; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so6212962b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 04:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759921761; x=1760526561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KC25klfHsuE49qhd2lZf7xTuSG4Th9iMfG1aIP8CfPU=;
        b=hJEtNHHWn6llKCdCfnWqke0qPTwpiPFR8tVKd31VmZ/nN0o0Avk61iCaRNgUArNwW7
         a1YfWDZ3uBoutTW4BRtFgzlPnE9wFOJXTYuegfDvztQ9oL4sTIfXZnlEbglcjfKSlrXG
         GA6lNYc2C3KnCnAo0Xfy3bFN1Uje0DUNtPJcq6p7iqihBYvUAGYBcMB3vbXb4T31SKv5
         waSp7zkJ0s5yYUw4IN689K5y/wnJf6C5WLbwP3ouAkg2ZvtekIfQCjNwFJOrkD1E+Y1k
         hY4cZsHYZcOtHTgchTbQ80U/+FVT5H8akjqpf7wE4i9rm5wszz3MoHbM6NbMTrrOWZjg
         xmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759921761; x=1760526561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KC25klfHsuE49qhd2lZf7xTuSG4Th9iMfG1aIP8CfPU=;
        b=CtkmmJAMeVl8DTZwtAyDzchIbe1NkRM7k5nRH6xTDVd/4JGFm3luLQMWDBLIBc6yli
         iA+K5zT/xbhiDugdD7YKCGnLotszHCH/s2xosZJlDV+O7G/KjG2JNJokwJzLXWudCkL5
         rplKGQ2w4tjvTu8q0t7C7bhGDIbfXCnv9Xz42CYF0uhpdk+Jzu89FruLlB5i2uZaVJQk
         GyR0NC4mec3SM1TD1oCqolAJpzYPhdzx2G+T6UJldQs+/O2ktycoSCwu5MR7X45EvInP
         zxKAguokssxEXys5JK3ysUkIHd3Z733M0/x1Azgy3RcidyXBYebMKaCeRIf4QTaE5tLm
         QuAg==
X-Forwarded-Encrypted: i=1; AJvYcCXrz2O7+NtXZOPpFFoAIMaR42yh2EUa6090G7WHWDmpvpbrmd7X4HX8/SoRBkVdhxerfxFyllbFo0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuP+hiUkKoLwsvScxX/Tjn5nhzVrC+rMia1v+yqynmOwNbebd6
	CpiOdz6SYyPp+PZT9hRzf0hNSMN4Yu7vD5mttZNIvoou6JxmjWmiszq4Nd75qGcS
X-Gm-Gg: ASbGnctgCpaqEfGUuqVBfQt6TjFpnMdztzA65uHyMWDQ2sWHEkGudABuaScgpKEoXEX
	CnDwHUZ0PdzrV+71t8/LVm04Q7GF4QOVPMN7hyu/O1C1I1ZNk6/qVEqgAz4Z0I6au1n3azEINIt
	0eYhj/NOXgTIGsvS22WimyrByR0QNxXbgTIERFi9eizTPnOJmvDZTnbxUOC/58MWnsDN6nmTBDK
	bdeF88xZh/ZCUl3pnghg1FHXMPV52rqbO4JJ3hH4tqyxblsRwp3jzcBbS5haW0ru618jIcNIYfO
	x9bfY7R05m/kzz+QBKirS7c8pU3lYqAWjascCoWuEjp2RnEhzvh56xlSV4DnRIiVkVG51fiUg02
	HzjeUzHNK1Fq/0+MhivLI3RtDZoNinI91AXY/wmgxa3WzvBS8
X-Google-Smtp-Source: AGHT+IHELsy5OckPhJQbS7o/xw6ZAu3UWcOSKGC4r4z9PBn5ygvO6bnz1ApFsB9vIVgMG47qwlR1pQ==
X-Received: by 2002:a05:6a20:3ca6:b0:249:824c:c620 with SMTP id adf61e73a8af0-32da854262bmr3829983637.57.1759921761430;
        Wed, 08 Oct 2025 04:09:21 -0700 (PDT)
Received: from fedora ([2401:4900:1f33:9812:931e:863e:d27d:1170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f599a2sm17534134a12.36.2025.10.08.04.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 04:09:21 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: gregkh@linuxfoundation.org
Cc: i.shihao.999@gmail.com,
	linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu
Subject: [PATCH v6] usb-storage: Fix comment indentation level
Date: Wed,  8 Oct 2025 16:39:10 +0530
Message-ID: <20251008110910.33833-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2025100845-engraver-perch-dabb@gregkh>
References: <2025100845-engraver-perch-dabb@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix comment  indentation level .

The previous comment was indented at the wrong level, breaking
kernel coding style consistency. The indentation has been corrected
to align with the relevant code block.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>

---

changes v6:
-  Fix comment indentation level
-  Fix checkpatch.pl script errors

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
index 4d01f70f39ac..09012cafc536 100644
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
+		    us->subclass == USB_SC_CYP_ATACB) {
+			/* Determine cmd_len based on SCSI opcode group */
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


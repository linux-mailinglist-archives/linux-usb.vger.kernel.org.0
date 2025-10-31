Return-Path: <linux-usb+bounces-29950-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65741C25436
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 14:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6BCC1A22474
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 13:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3920434B411;
	Fri, 31 Oct 2025 13:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XccuECJ1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6068E34B181
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761917223; cv=none; b=jo7CSzO0Cme6GdIsGTiQPseeIYDkhesiYyZLmzXFQLEiulHxr3LXIK4DmMgXLtB13NWa7MUqTrEXfUIyjWQqXvwB3Oz7dbg5AVsBqEJ6fXl5Y1c+/BrFt0WTBkbg8I6C6l+n8Ga9kQwKfVsea2VCw7wAuNK06DHjp/V6KQNbflE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761917223; c=relaxed/simple;
	bh=uhaCwSbT1CmynaTtFkFUfd6VKh41RVQZwtYLimsYg7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SU6tZ2HIS6RQBsIYTz7xQr7p9bpiuHlrT7bPTMPcGOrPoBxzZscKTdiF3WCzx1nImiDyK0wH27XdT63B5B4KOuCXmgcn4r5UWkBr5mK1U5mflzqyRToWsDeCCPV/+7abd9nqSG2Wz2R4rHf4zoQH/IeNTd0M8NHyY/ggCHN7x+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XccuECJ1; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-33ba5d8f3bfso2083558a91.3
        for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 06:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761917221; x=1762522021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WrmdlO7loopDlm2CqslnppoVSdxtVgkxG6FfUB2qsow=;
        b=XccuECJ1h8F58ezeiX+S7pyhbOOK97N6iub3dkg4qRuM3AjINAZ1HO/QDn+qRPdRtV
         uWnR5NPk1jCkV8etFYcJtQ0dUpx+WISpOYzq5KpZtYGzJyOWyvc40G7cvM+r1AbWJdPG
         WagHtNzTfX0muUpZqGH782C/fIYDX/zGkPt7JBOyUOBSGq2jB59SPx9vvOXd6UJc/clb
         c4ApnE/lBxPAX/x24A4tUPVQquHK89dv9EhmD8Cz6MYHad7h5W0d+td4pP9nc63XW4II
         Nx3iBEVDLdEQmIc4Beh7g9BvIq0i6HIS0RwArPJTP7/uzejKduHz0O4m0H9JTqC+G8F6
         zt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761917221; x=1762522021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrmdlO7loopDlm2CqslnppoVSdxtVgkxG6FfUB2qsow=;
        b=t38H2+IcqmFjxJ3dF7JXqgFFQrPhD1r9eDT9uQ1tf2UXeZNHhS1F5WzwsxiTHV7OQh
         M+Y34qHcB3JbQjlbBi+i+46s+ivFOhJDBlBUqsdDtvdbEnt120hVTE02TwolSkdthdzo
         jNw3TPRKupbrJ0kzR9TK+8nTThEDTWe87mYTAYcf8+P6x2LxBQVlpp+9JKCznX8cyHcD
         GQus7TSVW7PRlFSzHcLq5azAiq/ZVHDAtaGa6eOoJg4aKhSWw4k0LOJVeyEi/0hLPaRq
         0lYtpyvns9xFqKaTihKg0ihp/cmnFZl9Y0UQgPnWXAC+8BbFrnRptFMXqvRjiQBL62G3
         c50Q==
X-Gm-Message-State: AOJu0YxevwOBev4vzu6TSSl4nsEHq2MMpZfDVmzAar7oFjqSbyQR80qz
	+9i3CmJh6iRuVeIm6s1Xn2tXsIc5EB1x5PCWiFJwphPfUDuz76PKucU=
X-Gm-Gg: ASbGncuU2UwEe85PkiE8WDwlcpnpfmEb4CEqrq8drlpGOjzLuEkst3olVJ+SBDbaUKK
	xpOnhTHDdipiNLwu65GfMzvh1f1JzI89C9xMvQDtKBAkPTGjMHw+BnMWSECupoc3+kind/b41wV
	iDwujKfg3jvpjUftk3mDWwlp/hKfOzz5AEW3gq4ZC3loe6iLDv8wBTO7w8QwgdXYfjMm/tzIW46
	fL0+oTVnoxOJXdEFUKVBbD+lcZhnQKUQVmEoThVuOAtLq22Mv3FJ6evLsfnqSpL/8OwJSGFZGOY
	RPb92ITfrCSf4EKZTcBX5+yPH6GnqOUrDYrMQ3zqNghX7pv+rmlmp9dPg0F49yUndwRvTwM4xEj
	GFI3/FFUhYlV/W7O1jeAWUZDh4qPI+cjF5nk7wiruyOyanvoWBwc3vAvi1xFF5ftJeK6yhB818o
	eg1xXVKxku
X-Google-Smtp-Source: AGHT+IHzfVYSO8+J0zNhvwv1+BiO2sqnk9KJnssYCkr+vJvVNaYHRPB82I8IkIFPSwlKvjWLwIcZzA==
X-Received: by 2002:a17:90b:39cc:b0:32e:a54a:be5d with SMTP id 98e67ed59e1d1-34082fc92bemr4683310a91.2.1761917220515;
        Fri, 31 Oct 2025 06:27:00 -0700 (PDT)
Received: from VSPRIME.. ([2401:4900:52f2:3b59:ca2f:95c0:7c6b:6e6a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34092d48252sm2232712a91.15.2025.10.31.06.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:27:00 -0700 (PDT)
From: vsshingne <vaibhavshingne66@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vsshingne <vaibhavshingne66@gmail.com>
Subject: [PATCH] usb: core: prevent double URB enqueue leading to corruption
Date: Fri, 31 Oct 2025 18:56:51 +0530
Message-ID: <20251031132651.219859-1-vaibhavshingne66@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: vsshingne <vaibhavshingne66@gmail.com>
---
 drivers/usb/core/hcd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 87fcb78c34a8..66861f372daf 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1758,16 +1758,15 @@ void usb_hcd_giveback_urb(struct usb_hcd *hcd, struct urb *urb, int status)
 		pr_warn("usb: URB already linked to bh->head, skipping duplicate addition\n");
 		return;
 	}
-	
 	list_add_tail(&urb->urb_list, &bh->head);
 	running = bh->running;
 	spin_unlock(&bh->lock);
 
 	if (!running) {
-        	if (bh->high_prio)
-                	queue_work(system_bh_highpri_wq, &bh->bh);
-        	else
-        	        queue_work(system_bh_wq, &bh->bh);
+		if (bh->high_prio)
+			queue_work(system_bh_highpri_wq, &bh->bh);
+		else
+			queue_work(system_bh_wq, &bh->bh);
 	}
 }
 EXPORT_SYMBOL_GPL(usb_hcd_giveback_urb);
-- 
2.48.1



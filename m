Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450D044F14B
	for <lists+linux-usb@lfdr.de>; Sat, 13 Nov 2021 05:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhKMFCA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Nov 2021 00:02:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhKMFB7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Nov 2021 00:01:59 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3DFBC061766
        for <linux-usb@vger.kernel.org>; Fri, 12 Nov 2021 20:59:07 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id p18-20020a17090ad31200b001a78bb52876so8573852pju.3
        for <linux-usb@vger.kernel.org>; Fri, 12 Nov 2021 20:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cWD6ZMN/TLMJ0F8lDVMWbuyLXylJgc5f0OVQLw2Oxq4=;
        b=XGqzUFB0+TL66FpHkvUWL6TwtBjVyDToPBE4y8x969DGErHi/2N/xtnhysGiARTfE4
         rYF/OhO0+LCsRZvYCwLLAcy9t5RcDikeC+dzLxvRjjL9QZQ39NB8UihLnveS2oYUtL3l
         1EcznoDbVuSyMHlLrj1NY3HlIjHPX7HkX03Qubb6MLHIQUqqve87vGXha4pNj1p6nwZk
         GwL4jA6ni7YpfGKAVcUagQGxtxn/py5ukb5y+pkUUGQ/cR9QPLvJ7Fr6Ey67nDZuLEWx
         145BiCn2NmOWbmy7ylHIxBNgoqBSQbGYBEWarm+U7ZvMyJ/RYLcq6W6FEHIUreJYytVj
         95OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cWD6ZMN/TLMJ0F8lDVMWbuyLXylJgc5f0OVQLw2Oxq4=;
        b=WIoZYmHwAuG2nM360lwgfX0aBDr2am4nv8wRn8OPjTgzJwDWmRHKKV/lFAowk+Yg9S
         v3yekd8pm8W9zXLI7mOVAdpwzD79YP1Uaoo1sdSrLIE266lv4lLbk+vMDKQEHOiGjEOV
         BCS+O0owBPLsJlgP5lSa2kthPs/Y3xt3ISh/1NzIiHgoqcEUXBUyfkVoEnbpHdqhgpvZ
         B6Zj+dB8cOiwYmm/JeFVzNoxKznWZxn2hY1tNTd8Hxlk48NUBwo/DIRPYLqzOmJe1gFe
         UtLbEjx81ciIXMMFSL5FM69e+2v2abppNBscHnipVd1hdOHh2MHpIKWf3fDwKFEONA19
         n78g==
X-Gm-Message-State: AOAM533eZJP5wpdxh60UbRse/Q+11l7qMir8zpfvIaljHgC68En4RScA
        gbtzup7CW63TJd7X2REHFrs=
X-Google-Smtp-Source: ABdhPJwMnlxTXidylpfbzDzVr5ku+sBT7r6CfkyxETUkpY2KMyxmPTQ8zsensZwUPT0PmwgnyInzvQ==
X-Received: by 2002:a17:90a:9dca:: with SMTP id x10mr42729844pjv.170.1636779547310;
        Fri, 12 Nov 2021 20:59:07 -0800 (PST)
Received: from ELIJAHBAI-MB0.tencent.com ([203.205.141.113])
        by smtp.gmail.com with ESMTPSA id 4sm6106243pgj.63.2021.11.12.20.59.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Nov 2021 20:59:06 -0800 (PST)
From:   Haimin Zhang <tcs.kernel@gmail.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Haimin Zhang <tcs.kernel@gmail.com>,
        TCS Robot <tcs_robot@tencent.com>
Subject: [PATCH v4] USB: ehci_brcm_hub_control: improve port index sanitizing
Date:   Sat, 13 Nov 2021 12:57:14 +0800
Message-Id: <20211113045714.46373-1-tcs.kernel@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Due to (wIndex & 0xff) - 1 can get an integer greater than 0xf, this
can cause array index to be out of bounds since the size of array
port_status is 0xf. This change prevents a possible out-of-bounds
pointer computation by forcing the use of a valid port number.

Reported-by: TCS Robot <tcs_robot@tencent.com>
Signed-off-by: Haimin Zhang <tcs.kernel@gmail.com>
---
 drivers/usb/host/ehci-brcm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
index d3626bfa966b..2e92918a14dd 100644
--- a/drivers/usb/host/ehci-brcm.c
+++ b/drivers/usb/host/ehci-brcm.c
@@ -62,8 +62,12 @@ static int ehci_brcm_hub_control(
 	u32 __iomem	*status_reg;
 	unsigned long flags;
 	int retval, irq_disabled = 0;
+	u32 temp;
 
-	status_reg = &ehci->regs->port_status[(wIndex & 0xff) - 1];
+	temp = (wIndex & 0xff) - 1;
+	if (temp >= HCS_N_PORTS_MAX)
+		temp = 0;
+	status_reg = &ehci->regs->port_status[temp];
 
 	/*
 	 * RESUME is cleared when GetPortStatus() is called 20ms after start
-- 
2.30.1 (Apple Git-130)


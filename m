Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B197191E34
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2019 09:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbfHSHmq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 03:42:46 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46681 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbfHSHmp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 03:42:45 -0400
Received: by mail-pf1-f196.google.com with SMTP id q139so666669pfc.13
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2019 00:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ynq4+VSfItLDw42HSG2PmPwxQIaEP9/TG6Qe0lfaHR4=;
        b=M1DTO8zGg3YK4giGrLPe/Y27h33Sx5VM4k5s7fYPW+GrHZ+1jFaloTYQhNrxILDs1B
         qUwtZBAAAoGCqXxAGLotu1jQ9L3KpGY+zJI3ygV5SR5FvN3a1Y4AtDt5a3SWjrqoAkiU
         ieLPLPIY01P/4CCRHaofl7Lmjor6gCIHVNTJ/rkbv0FNeYI1izTzRHTDveVL2rhWVVpN
         eOmBSg+Pozci57sIPhYALWk95HruObvNgeSyceNBjETTMn1Ch3LYWsmYoaF+gvBWrVF0
         16DIGrD4OhWhNKWJNJ3VbKN6UGX+S1gRbtNhLAAHGlzB7f9wQZHUYJpqkbTz2Djt6wxF
         ZO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ynq4+VSfItLDw42HSG2PmPwxQIaEP9/TG6Qe0lfaHR4=;
        b=PFWw6hZQWmwu1Yw4xD4/V1Ybe0FfYm/TsBnLzv/0ZoEZepm0pw2K/lg99VGJz/G7Y+
         OpxFb6S54/Wah6cPAlns4j0LrWUt273j3TnaPfafvJD1jJCRu98237yWv/S3sEjSISvC
         xNfT2u4opmJveaY9Gl+yWkppN+Lh5CgZ/21XoBHsNvdwJL1XWgXePV4F5GxnANMkUMvJ
         xlrpUSpwI+VIkF1pdMwZQhbhO6f1sF937p/w95U3Y3qdGFQz38wnBsbFhRURMSak2osv
         6KNw6NmMwBS9c0sAEJgLEvFfaGhw8h15Edz1zkrX229XrO+/g4OZMh7JKlSe7FXgUoVT
         bfSA==
X-Gm-Message-State: APjAAAUA6U1CY6q2m7J3wZ0ebdCM6cAdkjI+XMCUZ76W5lo0qAY+OFXH
        68bEaIRfKFel5YJ/mFY2Jw8=
X-Google-Smtp-Source: APXvYqzApaBTGrNLLBAzBwAQZHdm5R5RJJGMImGlHGBrDEwPAg/LNkku4yHh9YgjlegVCPgff9ablQ==
X-Received: by 2002:a17:90a:36ad:: with SMTP id t42mr19109655pjb.21.1566200565353;
        Mon, 19 Aug 2019 00:42:45 -0700 (PDT)
Received: from localhost.localdomain ([110.225.16.165])
        by smtp.gmail.com with ESMTPSA id p10sm7341297pjr.14.2019.08.19.00.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 00:42:44 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] usb: phy: phy-fsl-usb: Make structure fsl_otg_initdata constant
Date:   Mon, 19 Aug 2019 13:12:34 +0530
Message-Id: <20190819074234.32625-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Static structure fsl_otg_initdata, of type fsl_otg_config, is used only
once, when the value of its field otg_port is assigned to another
variable. As fsl_otg_initdata.otg_port is of type u8, any changes to
its copy do not affect the original, and fsl_otg_initdata itself is
never modified. Hence make fsl_otg_initdata constant to protect it from
unintended modification.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/usb/phy/phy-fsl-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index f7c96d209eda..dbb2d4d54894 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -65,7 +65,7 @@ struct fsl_otg_timer *b_data_pulse_tmr, *b_vbus_pulse_tmr, *b_srp_fail_tmr,
 
 static struct list_head active_timers;
 
-static struct fsl_otg_config fsl_otg_initdata = {
+static const struct fsl_otg_config fsl_otg_initdata = {
 	.otg_port = 1,
 };
 
-- 
2.19.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDDB91DC2
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2019 09:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbfHSH0H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 03:26:07 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39097 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfHSH0H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 03:26:07 -0400
Received: by mail-pl1-f195.google.com with SMTP id z3so545634pln.6
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2019 00:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ASzfI5O2O0aWIzLNo8xD65QuwOFz+BCrJzy7+F0X8Ww=;
        b=ci9rammUMjyOze+UXBOsKzZwtnQCYe4FoN8pe6vwjr40IWJ9pIV9m3XXtK8v1hhbGH
         69cv6JyKSj8cvqso3/yQdy+HatDG6s24gEbMTZBYUuUcjuUAJlxlCwe7PbRs1tp/gf9t
         6MK1FL8RLYFc/r9LJ+AI27peSPcGGKa9JlZBMQ+NFCA9rRKBrV5aymABGl3JjNuvqlvx
         f6aHj3iXexDx3lXvJjK7+O8Tpb1yLHybtVvr5ksF4xfhfXRURyHa5iFeLvvDpW/MZkln
         YZFiWL/sxh5vjsckWRs3hHwFDtrwF9zKuEI5weF3feC3HlbftI68fxlSwp1ODIxEN7dw
         Zg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ASzfI5O2O0aWIzLNo8xD65QuwOFz+BCrJzy7+F0X8Ww=;
        b=aPrb4R30XgzbBUSZLmgga6zAu7i13Bv95wSyevgaGKIBtRH5aZwpw4sAlUXhXru2iU
         mIbBLndJUIhENb6NsK69dhlltVNzuLPhF44y5qmi47VjmsZ2KnAgi1IDgSWkfL9Z7kHQ
         SZMDuILd5iA+FasYCDXwvcRm775bXGuMzjSi6At4KvuExLlDx0cPPUgYfc1YMSEQkM9T
         se+henyz0Cis/ne5Nkdpz6+msjGSVf/KrP5P2irYqJyJ78jNl0qezUFt9tULf3rBGL05
         4Rot2p7Q9d4XkNSGuHHF/PFZrJb+ei2CJtvDqzXUeoUJ6th2DdzemzCeAMuDMu3rT6HQ
         4oXg==
X-Gm-Message-State: APjAAAUkSX+/w6z+cSIKQyuxLBBTYASlMd80/FONK1hezO3iYLFSWDXi
        WMwJCHsS3Tgw+lSgycO6AsZgm/jK
X-Google-Smtp-Source: APXvYqwy7mYs6DlMVHYPVsq+Q6t3f4vuDfDFsrMTgxwx051CaK+bm48qy/KOljcXfPe2nLVkJ8o6SQ==
X-Received: by 2002:a17:902:8e8b:: with SMTP id bg11mr19754178plb.93.1566199567038;
        Mon, 19 Aug 2019 00:26:07 -0700 (PDT)
Received: from localhost.localdomain ([110.225.16.165])
        by smtp.gmail.com with ESMTPSA id q33sm11395493pja.29.2019.08.19.00.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 00:26:06 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     agross@kernel.org, balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] usb: dwc3: qcom: Add of_node_put() before return in register function
Date:   Mon, 19 Aug 2019 12:55:55 +0530
Message-Id: <20190819072555.31568-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The variable dwc3_np in the function dwc3_qcom_of_register_core takes the
value returned by of_get_child_by_name, which gets a node but does not
put it. This may cause a memory leak. Hence create a new label,
err_node_put, that puts dwc3_np and returns the required value, and
modify two return statements to instead save the required return value
in existing variable ret and then point to this label.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 261af9e38ddd..227f4fee184a 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -528,16 +528,19 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 	ret = of_platform_populate(np, NULL, NULL, dev);
 	if (ret) {
 		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
-		return ret;
+		goto err_node_put;
 	}
 
 	qcom->dwc3 = of_find_device_by_node(dwc3_np);
 	if (!qcom->dwc3) {
 		dev_err(dev, "failed to get dwc3 platform device\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_node_put;
 	}
 
-	return 0;
+err_node_put:
+	of_node_put(dwc3_np);
+	return ret;
 }
 
 static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
-- 
2.19.1


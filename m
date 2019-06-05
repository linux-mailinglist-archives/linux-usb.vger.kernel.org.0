Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80676360DA
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 18:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728615AbfFEQI6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 12:08:58 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:40372 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728263AbfFEQI6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 12:08:58 -0400
Received: by mail-qk1-f194.google.com with SMTP id c70so5467521qkg.7
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2019 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=GMTzknLGHQu9jpZJeYpPMbL4Iyoo80bWLLvDc4Ju8UI=;
        b=rg+5vQfoYJSaz0YWe0b9UFtCQnvOcrOdh5o2GnQ5iWdGT+YknBysC5L8Y85ayT6+71
         zu0RZhZ7qNkwLkYhkWmafCKceyIzeVsw3P3iK9hiiffqW/Rt2tMEIgHbIsqDc6h4Gyqy
         WccO6spjZ2FhHjg8ljS4Nfaiu2DhoAQRlVyF9KBootxSFoIHK+Esyu6hBa2mB0hIp3ls
         +dvxrPWK+9X5c2pVudHOU5A0aYLapnC1zYDTPDS2bn95ez8r+vWjCKYY3pOVdua6Bkzj
         boiJsflMNdEY7pJG/S+Zr+V4FdgcNeu9YG9MkrCAOzR1uYR13xIv/vPxadWoRqS2I2hD
         FA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GMTzknLGHQu9jpZJeYpPMbL4Iyoo80bWLLvDc4Ju8UI=;
        b=uNaEjTKLM+rGB5JWaMjfmw/K+urc51UaEGbOGmkTUtuvv/GtLPDD9vQc1GqXl1peKM
         eADEzheeOFi6PF3bk5Epr7+Egres5ELNCKKnOtARFYf7ksscRY5Izv5XBVXtRVxAFmY/
         L5Wf4G3H0zkwFbtfMlPyQYLd7jbYIa/agZEvsknZj8yySzYD+DxCF+YjMys8zfih/jLu
         lyPfE4XuTzTPoyaXXf00vBqCewRN3votNOjNmgPYJGLERYr2o9xtp/0oPFATfzMHGsbA
         4sMfbevvq8TKnHwh+yBoG+5WHj7SwFES59qUYW+ydBRnYKJIjh06LIeJwSvVNEqru0K3
         cjEA==
X-Gm-Message-State: APjAAAXpbHPnoL7k/yXK9rvOx1aiEziZemSokbQQ0DHfroWiQoX5GVra
        yOSweIeMJCBQEhM448lhDPw=
X-Google-Smtp-Source: APXvYqzns0BZc4HpiTyLR7deuC9KwuAOvCpeqh0/QSOe2DZcrR6E14674IH1YD2jsePMKMecLDRMeg==
X-Received: by 2002:a37:6258:: with SMTP id w85mr21160927qkb.40.1559750936940;
        Wed, 05 Jun 2019 09:08:56 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id a51sm13020464qta.85.2019.06.05.09.08.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 09:08:55 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     Peter.Chen@nxp.com
Cc:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3] usb: chipidea: Use dev_err() instead of pr_err()
Date:   Wed,  5 Jun 2019 13:08:49 -0300
Message-Id: <20190605160849.3140-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dev_err() is more appropriate for printing error messages inside
drivers, so switch to dev_err().

While at it also add the missing newlines.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- Keep the orginal string

 drivers/usb/chipidea/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 27749ace2d93..1b6495829265 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -523,8 +523,9 @@ int hw_device_reset(struct ci_hdrc *ci)
 	hw_write(ci, OP_USBMODE, USBMODE_SLOM, USBMODE_SLOM);
 
 	if (hw_read(ci, OP_USBMODE, USBMODE_CM) != USBMODE_CM_DC) {
-		pr_err("cannot enter in %s device mode", ci_role(ci)->name);
-		pr_err("lpm = %i", ci->hw_bank.lpm);
+		dev_err(ci->dev, "cannot enter in %s device mode\n",
+			ci_role(ci)->name);
+		dev_err(ci->dev, "lpm = %i\n", ci->hw_bank.lpm);
 		return -ENODEV;
 	}
 
-- 
2.17.1


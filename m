Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5D75E903
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 18:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbfGCQau (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 12:30:50 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38986 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727172AbfGCQau (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jul 2019 12:30:50 -0400
Received: by mail-pf1-f193.google.com with SMTP id j2so1535129pfe.6;
        Wed, 03 Jul 2019 09:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=TrUa09acIW6HvvTGIpKx9PQFnQ16L2qeMF4zqtIgcwg=;
        b=StUzsoCdTyphOOOBhHCvimsHOl/lw6873T7vbUGAhmcpeJckEl2APf6QxyfvODfDIx
         6sv+a39EElywHWTMqTyLFrLV0YQedXL2l1LNtjU/b13C/pXw15WkDbAg2FPIuLC4gimN
         0auJd7+Z7/WvneBw6+x2kNagrFfkxpL6rvIHgXU+nV8xFZf3EsEZwf7wv6Y6SYY2zGSq
         9Lw8CMkOLH6e9MkO+4Sa7hWcfrWMxV1YQoFN4kpk4jOpLN8LNE1SUjmXxf6jNgfTbV47
         /mIcNT3WshuviL+x5ENk2SgPUA8mV8XGgfPOnywr/LF4HBCswaXpLNYbDMyh0JA8a/3M
         GM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TrUa09acIW6HvvTGIpKx9PQFnQ16L2qeMF4zqtIgcwg=;
        b=iNQPhyIe9Fg4nRequEbF+YOVvJS18rnXZsYneaSeUpWwXZ31Sto+/gy4mH4Incb7H4
         NUc0B3M2yXuz6S/U0MDAaizqaq7TzHFLl2XL0oZwVWS0DS12+Csp8nLeD9A6PsbE4b4F
         CPCTkxu8dtgjejkiYWwP2xdf1I+2qeoyDf/BQArIODWPUTOyFRWSU3bC1UlrMERsI1f8
         bYzhEt4rje24jGfcmpV5fcrvgUPAbUuwVIImAXyr6TrJZTFQPy2qA4mVr2bF2ACtUAW/
         8uXVA74NRopD/u3hPdpRgDNbL2A8O1PnhHbx76gvHhx0h7rO4Xor9K41+SlSwcYiF+gd
         tAZA==
X-Gm-Message-State: APjAAAX0Wr7jr4UmOGZjthAEY+6nIutTaTz8XvPYU7h8ndB2c8ZqMXPD
        bXirx9cczhgCfSVbyxYeNPYL1ZN0KZ8=
X-Google-Smtp-Source: APXvYqzrAQZn0dTjmrb2UFa9XjdmKRW+czq3frTlrHV+50QMJKlhEapEIE3unKDC385LasKzv1BhLw==
X-Received: by 2002:a63:d84e:: with SMTP id k14mr38156512pgj.234.1562171449109;
        Wed, 03 Jul 2019 09:30:49 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id v4sm2915326pff.45.2019.07.03.09.30.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 09:30:48 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH v2 25/35] usb: Use kmemdup rather than duplicating its implementation
Date:   Thu,  4 Jul 2019 00:30:43 +0800
Message-Id: <20190703163043.524-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
Changes in v2:
  - Fix a typo in commit message (memset -> memcpy)

 drivers/usb/class/cdc-acm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 183b41753c98..cc4a96d59ffc 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1410,12 +1410,11 @@ static int acm_probe(struct usb_interface *intf,
 		struct usb_cdc_country_functional_desc * cfd =
 					h.usb_cdc_country_functional_desc;
 
-		acm->country_codes = kmalloc(cfd->bLength - 4, GFP_KERNEL);
+		acm->country_codes = kmemdup((u8 *)&cfd->wCountyCode0,
+					cfd->bLength - 4, GFP_KERNEL);
 		if (!acm->country_codes)
 			goto skip_countries;
 		acm->country_code_size = cfd->bLength - 4;
-		memcpy(acm->country_codes, (u8 *)&cfd->wCountyCode0,
-							cfd->bLength - 4);
 		acm->country_rel_date = cfd->iCountryCodeRelDate;
 
 		i = device_create_file(&intf->dev, &dev_attr_wCountryCodes);
-- 
2.11.0


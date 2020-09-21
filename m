Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8DB82722A5
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 13:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgIULgV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 07:36:21 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44286 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbgIULgV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 07:36:21 -0400
Received: by mail-lf1-f68.google.com with SMTP id d15so13588116lfq.11
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 04:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ihnzTTzQ2wZgtaBo9C1DcEQgiZYLpfLStKr4kjaXDI=;
        b=L2WggUL2bO1syGTrXzUBsllz00KtsKkT5PQPmNTMEnfdVhlXz1Yc3mCLpgm/JzusR+
         /mMYSm8SO+/UGrslNrH4z8L/Grj26eIu1MVDuiZvEfR/PBkRzQefEZfJBBXr/DgYSba1
         BxMXoTUCCtEPCl1zgXbR433AIqvdOpXjCXQrN0DzgYgZrxStKeIxzSS0L7aVIfb+39kV
         V+KBHqKRqGMoUCNP8ArbsxG5G4ff1VP8kbmQMjk0w+XY3JUz5jWajZnVQq1Xiy72nzy3
         /Yi1naTjwsLhs1YGoSW75TdAzpJZl4hTuwAEnbtbtVdjLd92mdvZR60qNMuiXU0K+Mmw
         8H6A==
X-Gm-Message-State: AOAM5337UxlVP3gSNXAAnLajjmfy7HGPLGcBo4xdAT4a9PhwsJUQ5Dzj
        UHc4kozWmlBQe0UPehYjhec=
X-Google-Smtp-Source: ABdhPJyxcjJVpd7FaaTiUZqgq7ZGCPuNb8LumBXB1hYYpAyq0tlY/ih12JyoOV7EkDkhK/6YG43F0A==
X-Received: by 2002:ac2:5299:: with SMTP id q25mr14816482lfm.198.1600688178978;
        Mon, 21 Sep 2020 04:36:18 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id b16sm2637540ljh.34.2020.09.21.04.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:36:17 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kKK79-0008OG-7q; Mon, 21 Sep 2020 13:36:11 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/4] USB: cdc-acm: handle broken union descriptors
Date:   Mon, 21 Sep 2020 13:35:23 +0200
Message-Id: <20200921113525.32187-3-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200921113525.32187-1-johan@kernel.org>
References: <20200921113525.32187-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Handle broken union functional descriptors where the master-interface
doesn't exist or where its class is of neither Communication or Data
type (as required by the specification) by falling back to
"combined-interface" probing.

Note that this still allows for handling union descriptors with switched
interfaces.

This is specifically makes the Whistler radio scanners TRX series
devices work with the driver without adding further quirks to the
device-id table.

Link: https://lore.kernel.org/r/5f4ca4f8.1c69fb81.a4487.0f5f@mx.google.com
Reported-by: Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/class/cdc-acm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index e28ac640ff9c..5b1a1cd0168d 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1240,9 +1240,21 @@ static int acm_probe(struct usb_interface *intf,
 			}
 		}
 	} else {
+		int class = -1;
+
 		data_intf_num = union_header->bSlaveInterface0;
 		control_interface = usb_ifnum_to_if(usb_dev, union_header->bMasterInterface0);
 		data_interface = usb_ifnum_to_if(usb_dev, data_intf_num);
+
+		if (control_interface)
+			class = control_interface->cur_altsetting->desc.bInterfaceClass;
+
+		if (class != USB_CLASS_COMM && class != USB_CLASS_CDC_DATA) {
+			dev_warn(&intf->dev, "Broken union descriptor, assuming single interface\n");
+			combined_interfaces = 1;
+			control_interface = data_interface = intf;
+			goto look_for_collapsed_interface;
+		}
 	}
 
 	if (!control_interface || !data_interface) {
-- 
2.26.2


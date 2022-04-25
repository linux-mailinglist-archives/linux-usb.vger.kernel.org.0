Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63D1C50DBEE
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 11:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241140AbiDYJFh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 05:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241478AbiDYJFQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 05:05:16 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50ACA2C12E
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 02:01:04 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id a11so2971490pff.1
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 02:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labau-com-tw.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=VvnpDJ7qOTxDZh/4xd/DqiAuIjrxDaVMEK6Af8UX0JE=;
        b=x1BbinRbIsluu6F4DnGVj7K83rShQ3FApyAtaeUAhxWOWfe+X2fSiU/CN6h+aAvL+z
         HZac9e6MJ0RKQxx3bJ21rntV0PPFuvQ1CmlQ0BQ0D20FejW8+YE8TBf8dAfhtzaiUZAk
         i7cG8Sf2PFGGeNB+TWurclN7I4thZYGs7wKSvWW4DE2XNlgXPLf7HDO7daACWMCVnuWT
         Hd5wxHqbLo3x26w7RPUxc9pl+7zJ7V8TYyLBTLc84Rmx24zpqTSsR06KfHcAchl9G6To
         IcDmnd7aNPxBVOAVwzI70Hm4FqQvjobmz0OWhVZMR7EVRKjUT9G5dWyXwWpvWSSbdi8U
         nI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VvnpDJ7qOTxDZh/4xd/DqiAuIjrxDaVMEK6Af8UX0JE=;
        b=ITte4pK11Got2neDoGFfnwnayoAPJb12n5ImLC3G0mybyceIadPbilo9A5UMSaBJCo
         19ipQGm6dq52xviHbyTXLr1wStqc++9R5hx8MGE+FCmYmc2oDsrCsFmc5cFOg+8HXbkm
         EQcOKpcgm9i+eYGUElwebFamjhndAw04zMBrvfTGOIx5FJoaSKR0zM7sIjJHsCcIwIRb
         R1kaMuSrA3T+YDVAUAbfnWofBHrpLIGU4oev8hyNqM8+v9lY+Gv7uVKgC1cTX3ouh/i+
         65r5EjVXPp5EwZxq3qgrcyYu6NUK1mwDCrQNU+aSJbMt07AxIfna/jpNjFeYuUQTLuwp
         s66Q==
X-Gm-Message-State: AOAM533JEQDdyeKBVM2Q6cFY8dduFt/RA5Wgwn0vsDUCjUo4g7s+gsZN
        K4xfN5M1NHOCDoTTTOKee5R+Zw==
X-Google-Smtp-Source: ABdhPJzepf2TmJLDWgUN5ULvbXU9RZT7889AlSpPVSzWUCY/EHtBxQqBgibcpsEygLKce54h8vH51A==
X-Received: by 2002:a63:c015:0:b0:385:fe06:eb86 with SMTP id h21-20020a63c015000000b00385fe06eb86mr13948328pgg.132.1650877263742;
        Mon, 25 Apr 2022 02:01:03 -0700 (PDT)
Received: from labau-virtual-machine.localdomain (61-228-66-64.dynamic-ip.hinet.net. [61.228.66.64])
        by smtp.gmail.com with ESMTPSA id a38-20020a056a001d2600b004f70d5e92basm10970123pfx.34.2022.04.25.02.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 02:01:03 -0700 (PDT)
From:   Scott Chen <scott@labau.com.tw>
Cc:     young@labau.com.tw, roger@labau.com.tw,
        Scott Chen <scott@labau.com.tw>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] USB: serial: pl2303: add device id for HP LM930 Display
Date:   Mon, 25 Apr 2022 17:00:20 +0800
Message-Id: <20220425090020.33683-1-scott@labau.com.tw>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the device id for the HPLM930Display which is a PL2303GC based device

Signed-off-by: Scott Chen <scott@labau.com.tw>
---
 Changes in v2:
  - Product id uses tab instead of spaces

 drivers/usb/serial/pl2303.c | 1 +
 drivers/usb/serial/pl2303.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 88b284d61681..1d878d05a658 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -106,6 +106,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LCM220_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LCM960_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LM920_PRODUCT_ID) },
+	{ USB_DEVICE(HP_VENDOR_ID, HP_LM930_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_LM940_PRODUCT_ID) },
 	{ USB_DEVICE(HP_VENDOR_ID, HP_TD620_PRODUCT_ID) },
 	{ USB_DEVICE(CRESSI_VENDOR_ID, CRESSI_EDY_PRODUCT_ID) },
diff --git a/drivers/usb/serial/pl2303.h b/drivers/usb/serial/pl2303.h
index c5406452b774..732f9b13ad5d 100644
--- a/drivers/usb/serial/pl2303.h
+++ b/drivers/usb/serial/pl2303.h
@@ -135,6 +135,7 @@
 #define HP_TD620_PRODUCT_ID	0x0956
 #define HP_LD960_PRODUCT_ID	0x0b39
 #define HP_LD381_PRODUCT_ID	0x0f7f
+#define HP_LM930_PRODUCT_ID	0x0f9b
 #define HP_LCM220_PRODUCT_ID	0x3139
 #define HP_LCM960_PRODUCT_ID	0x3239
 #define HP_LD220_PRODUCT_ID	0x3524
-- 
2.17.1


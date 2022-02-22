Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E89084C0397
	for <lists+linux-usb@lfdr.de>; Tue, 22 Feb 2022 22:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235720AbiBVVNn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Feb 2022 16:13:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233097AbiBVVNm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Feb 2022 16:13:42 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156DEE6D8C
        for <linux-usb@vger.kernel.org>; Tue, 22 Feb 2022 13:13:16 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id qx21so46657913ejb.13
        for <linux-usb@vger.kernel.org>; Tue, 22 Feb 2022 13:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=/UVTg6ym+wu9jzepT3cb2O8j6NvUXuijL57PItWBk50=;
        b=jWNA1H4Y5JPtGs5FQVFSQQnNnNe0bepg2GhVIf6TiRlbjYrQUIXrPMJQJcP2vlrkfx
         Vhfyx02oWb5T7ePQvSPm99OF7uEBhka/A45e0VXjLT/F3UVKDfXqdEwn2MoYO1GPESSY
         UT/UWhWwbCDayXZ+oi6aga0sOJ1HA8nURknw9z3rynOvjwSSewJX+pdP32nQgaVPJHYE
         jE7Kw8cGUCCPJeubNe19W+V5p/zwENLj9Q/dFRi2X0bECum3hs9M0d3yIg0rsBsBdlAq
         83Cw25JpiWVeD8R4r1tnkAPJZAVeIs5bDrI+t33tihRpeh+P6MAcFKlcH+41hw+AaQmA
         O94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=/UVTg6ym+wu9jzepT3cb2O8j6NvUXuijL57PItWBk50=;
        b=AeaT5csTKwZ7koqfu/Zb/SjSmWhBj/cO1K//BU27PxlrHPkor6pX/dBjyLlSIuV5N+
         799c3n0FjALZ78pSEoe0Yl6omPe9udG7mJIW6Lj5To1yYIYZ6HsS9K9vi0NcBF/ufVs7
         C5lzt5RjJG6jreNTgAttzY8QqCQaKbFf2gZ0WBnk0+JIEp5/xw74VvV/ivWLkJBFYUMX
         jxAnFxAz90i6btUC73pH9JU1ia2yyHmj/nyvkI1qmw9H1tGy45W3+ptVceX9awjX9x8E
         LpSYrO4zgAbCqE1SxdumCjGRcUs093PXFSdGsUJgQEb2nJBPk5vK565ZCIBdeFHzAjlr
         UE9A==
X-Gm-Message-State: AOAM533imYC7USE6yTpIO+PrxL/8FLnzgdtkW2RAmLTkfkylRPR4J09t
        5TWvpJplE08Qlv7Rik1Ac87aM+cKaYM=
X-Google-Smtp-Source: ABdhPJwWnObm5G5mw2T9O0rJUldeQMy+wlLaEVluu4o/tBWF7Vd1JjaCM5HpfHQD67SbZqbvLt0HSg==
X-Received: by 2002:a17:906:a1d3:b0:6d0:80ea:2fde with SMTP id bx19-20020a170906a1d300b006d080ea2fdemr18300975ejb.344.1645564394493;
        Tue, 22 Feb 2022 13:13:14 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:9cef:d49f:b9d:efeb? (p200300ea8f4d2b009cefd49f0b9defeb.dip0.t-ipconnect.de. [2003:ea:8f4d:2b00:9cef:d49f:b9d:efeb])
        by smtp.googlemail.com with ESMTPSA id kq17sm6662098ejb.205.2022.02.22.13.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 13:13:14 -0800 (PST)
Message-ID: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
Date:   Tue, 22 Feb 2022 22:13:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] usb: core: improve handling of hubs with no ports
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I get the "hub doesn't have any ports" error message on a system with
Amlogic S905W SoC. Seems the SoC has internal USB 3.0 supports but
is crippled with regard to USB 3.0 ports.
Maybe we shouldn't consider this scenario an error. So let's change
the message to info level, but otherwise keep the handling of the
scenario as it is today. With the patch it looks like this on my
system.

dwc2 c9100000.usb: supply vusb_d not found, using dummy regulator
dwc2 c9100000.usb: supply vusb_a not found, using dummy regulator
dwc2 c9100000.usb: EPs: 7, dedicated fifos, 712 entries in SPRAM
xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 1
xhci-hcd xhci-hcd.0.auto: hcc params 0x0228f664 hci version 0x100 quirks 0x0000000002010010
xhci-hcd xhci-hcd.0.auto: irq 49, io mem 0xc9000000
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 2
xhci-hcd xhci-hcd.0.auto: Host supports USB 3.0 SuperSpeed
usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
hub 2-0:1.0: USB hub found
hub 2-0:1.0: hub has no ports, exiting

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/core/hub.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 83b5aff25..e3f40d1f4 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1423,9 +1423,8 @@ static int hub_configure(struct usb_hub *hub,
 		ret = -ENODEV;
 		goto fail;
 	} else if (hub->descriptor->bNbrPorts == 0) {
-		message = "hub doesn't have any ports!";
-		ret = -ENODEV;
-		goto fail;
+		dev_info(hub_dev, "hub has no ports, exiting\n");
+		return -ENODEV;
 	}
 
 	/*
-- 
2.35.1


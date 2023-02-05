Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFB0D68AE04
	for <lists+linux-usb@lfdr.de>; Sun,  5 Feb 2023 03:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjBECNd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Feb 2023 21:13:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjBECNc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Feb 2023 21:13:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D1722DC4
        for <linux-usb@vger.kernel.org>; Sat,  4 Feb 2023 18:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675563160;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=TxjJOlkRD9KQJJ8RtFDJbVPO6vwF/VfUk2KQLMypAoU=;
        b=KD/HbL8qKentFazK024FYXa5E35q4Iis3vuccryXkNuw2Yovk/HUl0qroeZ2oQ8g5T3a5W
        6nCXtOgbtX0aor6gYFUSsQudDB1yQ8GWg58WAnn8GFfC7HGTJNEdz25AU9X4lOWU7y+pV4
        xv55f159HGHUiVHV6UDhU9nW4wDTSC4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-111-zy-SmIvSPjyxrOlRC15NSA-1; Sat, 04 Feb 2023 21:12:38 -0500
X-MC-Unique: zy-SmIvSPjyxrOlRC15NSA-1
Received: by mail-qt1-f200.google.com with SMTP id a13-20020ac8108d000000b003b7ea9814a2so4600112qtj.2
        for <linux-usb@vger.kernel.org>; Sat, 04 Feb 2023 18:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxjJOlkRD9KQJJ8RtFDJbVPO6vwF/VfUk2KQLMypAoU=;
        b=TxX2arwLiyUBPzrpAmJCcW3OevYAOsjnFiiSNGNywtCaEN+zfd6uTKbPmb39/oxMWW
         8v/NTGQvT3zOb+DFskn6CLBkl+EstPIVb79SofcIlDBVBVRQNAA6u1IUGy7lgjQmKWa8
         JefFN0q0q5NKqQcgnObwjAU04H3RjEXwx3iPnTvsBX+PcomxLL0RD4goO2Hw5bF8XmNb
         uKzFuPQjkrt+wHYSTqTiPhAUASO0W605ijqbXQWhSFqk2+arrBJvMhOSz9JH91oyrdmG
         Vn0u+5YBQJ1z/TQ7KTEvRbIOp6q1ICE3YFfuw60acM4hKRJwAU7ANNMC7YOX2XhnERiO
         REeA==
X-Gm-Message-State: AO0yUKVmDR61di6QEggdtBHUXq/JSqeS9AuQbcFmYtl18rYDq8juHW2S
        oxwynRt55aLgZTHzpcWbHcH0iRgCu2OfjxeldeBaIpkL6Xm8lSOasK3m/fyS3NiWe8tSkEALuRS
        dLVv2H4Y0X9chaj/eNzJp
X-Received: by 2002:ac8:7dd3:0:b0:3b9:a777:3d9a with SMTP id c19-20020ac87dd3000000b003b9a7773d9amr28666320qte.44.1675563158500;
        Sat, 04 Feb 2023 18:12:38 -0800 (PST)
X-Google-Smtp-Source: AK7set9g2HQ6czvVeGwBxMrcctOOmsHCimOzFUbYG6cWZmHqZ0y22vTjElFS6ahjksrz7A2cD7+6mQ==
X-Received: by 2002:ac8:7dd3:0:b0:3b9:a777:3d9a with SMTP id c19-20020ac87dd3000000b003b9a7773d9amr28666302qte.44.1675563158283;
        Sat, 04 Feb 2023 18:12:38 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id m15-20020ac85b0f000000b003a591194221sm4648646qtw.7.2023.02.04.18.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 18:12:37 -0800 (PST)
From:   Tom Rix <trix@redhat.com>
To:     gregkh@linuxfoundation.org, arnd@arndb.de,
        linus.walleij@linaro.org, artur.bujdoso@gmail.com,
        miquel.raynal@bootlin.com, colin.i.king@gmail.com,
        biju.das.jz@bp.renesas.com, tmaimon77@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: host: USB_XHCI_RZV2M depends on USB_GADGET
Date:   Sat,  4 Feb 2023 21:12:27 -0500
Message-Id: <20230205021227.3017634-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A rand config causes this link error
ld: drivers/usb/host/xhci-rzv2m.o: in function `xhci_rzv2m_init_quirk':
xhci-rzv2m.c:(.text+0x13): undefined reference to `rzv2m_usb3drd_reset'

xhci_rzv2m_init_quirk build is controlled by USB_XHCI_RZV2M
rzv2m_usb3drd_reset build is controlled by USB_RZV2M_USB3DRD

USE_XHCI_RZV2M does select USB_RZV2M_USB3DRD, but USB_RZV2M_USB3DRD
depends on USB_GADGET, so now does USE_XHCI_RZV2M.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 2b80ce9587c1..2dd9e95a5b86 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -100,6 +100,7 @@ config USB_XHCI_RZV2M
 	tristate "xHCI support for Renesas RZ/V2M SoC"
 	depends on USB_XHCI_PLATFORM
 	depends on ARCH_R9A09G011 || COMPILE_TEST
+	depends on USB_GADGET
 	select USB_RZV2M_USB3DRD
 	help
 	  Say 'Y' to enable the support for the xHCI host controller
-- 
2.27.0


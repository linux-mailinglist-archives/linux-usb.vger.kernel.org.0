Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43A0A536DEB
	for <lists+linux-usb@lfdr.de>; Sat, 28 May 2022 19:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238843AbiE1RSL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 May 2022 13:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238811AbiE1RSK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 May 2022 13:18:10 -0400
X-Greylist: delayed 178 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 28 May 2022 10:18:09 PDT
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C59F396
        for <linux-usb@vger.kernel.org>; Sat, 28 May 2022 10:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1653757926;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=hX3oNfX/LBsPkhqcaUTqr8w7jyshppkZkYksGZs2mRQ=;
    b=RZD8ixGqijF9dm0B3LjkKPlTJRPcLSeBKjsCSc7eleJSt20VF8WrXl/ZwoIcqJaEGu
    jW/udxgCjNGeXAvfYNBE1hwX8p/4oPvYkSgdlFRh5RlVD2M4ga34ahJ0nvWwo96n2mTC
    MFuB1sTEQW5YXPXua8wX9dt4bH8mUPDaYoXxaTddECtXCzC9aSr14CCOBNTFdPzdmEIW
    x2jHpvwoTc12LC/n29AoR+PQ7Pblf37fVG0yY4ouyPPzyF6GdF2qIDalbyGXhvkqe1si
    E6W3LkuAe8AeqgAm0DwvT1QzyBqR8Yfdnxwxe9Ha/ul3q08tksIZD7xCgVTt4TE9Tnf+
    ZKeQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyL2mYw2"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.45.0 AUTH)
    with ESMTPSA id 9056edy4SHC6cYZ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sat, 28 May 2022 19:12:06 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] usb: dwc3: pci: Restore line lost in merge conflict resolution
Date:   Sat, 28 May 2022 19:09:13 +0200
Message-Id: <20220528170913.9240-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 582ab24e096f ("usb: dwc3: pci: Set "linux,phy_charger_detect"
property on some Bay Trail boards") added a new swnode similar to the
existing ones for boards where the PHY handles charger detection.

Unfortunately, the "linux,sysdev_is_parent" property got lost in the
merge conflict resolution of commit ca9400ef7f67 ("Merge 5.17-rc6 into
usb-next"). Now dwc3_pci_intel_phy_charger_detect_properties is the
only swnode in dwc3-pci that is missing "linux,sysdev_is_parent".

It does not seem to cause any obvious functional issues, but it's
certainly unintended so restore the line to make the properties
consistent again.

Cc: stable@vger.kernel.org
Fixes: ca9400ef7f67 ("Merge 5.17-rc6 into usb-next")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/usb/dwc3/dwc3-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index ba51de7dd760..6b018048fe2e 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -127,6 +127,7 @@ static const struct property_entry dwc3_pci_intel_phy_charger_detect_properties[
 	PROPERTY_ENTRY_STRING("dr_mode", "peripheral"),
 	PROPERTY_ENTRY_BOOL("snps,dis_u2_susphy_quirk"),
 	PROPERTY_ENTRY_BOOL("linux,phy_charger_detect"),
+	PROPERTY_ENTRY_BOOL("linux,sysdev_is_parent"),
 	{}
 };
 
-- 
2.36.1


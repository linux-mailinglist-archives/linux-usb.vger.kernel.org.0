Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4F7783EAA
	for <lists+linux-usb@lfdr.de>; Tue, 22 Aug 2023 13:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233200AbjHVLZC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Aug 2023 07:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbjHVLZB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Aug 2023 07:25:01 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F4BCD1
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 04:24:59 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 6F5841F85D;
        Tue, 22 Aug 2023 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1692703498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=OsvCYH2R0sewz3aWZ59WFmPijoJ5UIcJeGAPdRL+LIg=;
        b=FPqgrFZO2DdqbNtJ1hcP/CSVBye36A6iMwca9rttqy61itMuVo+XEAuHVSq9Ojf+IxOW8F
        RVPRPSWVLvV6+W1XtAKtTWQ3f1vb/zNIXKk5XOfmrkv7xclxdst7ABGAhk39D2lEIt417G
        GDLdZUTTl81/0MMVl3Ul0A0reqG++Dc=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2AEBE132B9;
        Tue, 22 Aug 2023 11:24:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id BIgrBQqb5GQwQwAAMHmgww
        (envelope-from <oneukum@suse.com>); Tue, 22 Aug 2023 11:24:58 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     hminas@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] USB: dwc2: hande irq on dead controller correctly
Date:   Tue, 22 Aug 2023 13:24:55 +0200
Message-ID: <20230822112455.18957-1-oneukum@suse.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the controller is dead, the honest answer to the
question whether it has caused an irq is: unknown
As the purpose of the irq return is to trigger switching
off an IRQ, the correct response if you cannot
determine if your device has caused the interrupt is
IRQ_HANDLED

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/dwc2/hcd_intr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd_intr.c b/drivers/usb/dwc2/hcd_intr.c
index c9740caa5974..0144ca8350c3 100644
--- a/drivers/usb/dwc2/hcd_intr.c
+++ b/drivers/usb/dwc2/hcd_intr.c
@@ -2203,11 +2203,13 @@ static void dwc2_hc_intr(struct dwc2_hsotg *hsotg)
 irqreturn_t dwc2_handle_hcd_intr(struct dwc2_hsotg *hsotg)
 {
 	u32 gintsts, dbg_gintsts;
-	irqreturn_t retval = IRQ_NONE;
+	irqreturn_t retval = IRQ_HANDLED;
 
 	if (!dwc2_is_controller_alive(hsotg)) {
 		dev_warn(hsotg->dev, "Controller is dead\n");
 		return retval;
+	} else {
+		retval = IRQ_NONE;
 	}
 
 	spin_lock(&hsotg->lock);
-- 
2.41.0


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC7E64CE9F8
	for <lists+linux-usb@lfdr.de>; Sun,  6 Mar 2022 08:58:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232418AbiCFH73 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Mar 2022 02:59:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232304AbiCFH72 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 02:59:28 -0500
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D24275FA
        for <linux-usb@vger.kernel.org>; Sat,  5 Mar 2022 23:58:35 -0800 (PST)
Received: from localhost.localdomain ([106.133.32.90])
        by smtp.orange.fr with ESMTPA
        id Qljkni9jQu3WEQlmMnB81J; Sun, 06 Mar 2022 08:58:34 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: MDU0YmViZGZmMDIzYiBlMiM2NTczNTRjNWZkZTMwOGRiOGQ4ODf3NWI1ZTMyMzdiODlhOQ==
X-ME-Date: Sun, 06 Mar 2022 08:58:34 +0100
X-ME-IP: 106.133.32.90
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Ville Syrjala <syrjala@sci.fi>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henk Vergonet <Henk.Vergonet@gmail.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Oliver Neukum <oliver@neukum.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Woojung Huh <woojung.huh@microchip.com>,
        Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Kalle Valo <kvalo@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stanislaw Gruszka <stf_xl@wp.pl>,
        Helmut Schaa <helmut.schaa@googlemail.com>,
        Duncan Sands <duncan.sands@free.fr>,
        Alan Stern <stern@rowland.harvard.edu>,
        Olav Kongas <ok@artecdesign.ee>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 10/10] usb: remove third argument of usb_maxpacket()
Date:   Sun,  6 Mar 2022 16:55:24 +0900
Message-Id: <20220306075524.706660-11-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306075524.706660-1-mailhol.vincent@wanadoo.fr>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220306075524.706660-1-mailhol.vincent@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Now that all users of usb_maxpacket() have been migrated to only use
two arguments, remove the third variadic argument which was introduced
for the transition.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 include/linux/usb.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 588aa7dc3d10..2ebab87bf867 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1969,8 +1969,7 @@ usb_pipe_endpoint(struct usb_device *dev, unsigned int pipe)
 	return eps[usb_pipeendpoint(pipe)];
 }
 
-static inline u16 usb_maxpacket(struct usb_device *dev, int pipe,
-				/* int is_out deprecated */ ...)
+static inline u16 usb_maxpacket(struct usb_device *dev, int pipe)
 {
 	return usb_endpoint_maxp(&usb_pipe_endpoint(dev, pipe)->desc);
 }
-- 
2.34.1


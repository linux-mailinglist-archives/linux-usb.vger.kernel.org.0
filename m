Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDDF4A3E1F
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jan 2022 08:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244104AbiAaHSX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jan 2022 02:18:23 -0500
Received: from cable.insite.cz ([84.242.75.189]:40922 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1357901AbiAaHSW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Jan 2022 02:18:22 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id B4F6CA1A3D401;
        Mon, 31 Jan 2022 08:18:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1643613499; bh=eezxASKZmuhpVKpsJbq86MXoLqhLRzVZwxFNduO35qs=;
        h=From:To:Cc:Subject:Date:From;
        b=jC3msp+Cv5RSXQ8MU3jG7oISlKPW2N+A/Y8Madq3CdHpQJwHUzjM1jpanXjVjRbHu
         1NAPVcmRBvAyGEIUdrZrXxahtWsTRHG2SZ/yMR5wjn6Jejk4XZBZbQdAEY1eN+1GtE
         EeESlgbypBUkDqNV1VLuPTfWetc48cXaZcQxX0xE=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dMZ5soh0sCoX; Mon, 31 Jan 2022 08:18:14 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 16A8FA1A3D400;
        Mon, 31 Jan 2022 08:18:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1643613494; bh=eezxASKZmuhpVKpsJbq86MXoLqhLRzVZwxFNduO35qs=;
        h=From:To:Cc:Subject:Date:From;
        b=MDiJ9htrIVkkROWv3e1kp/VV0gT5O60Al5y30KMaUPKmJApkk86+t8v3dzgbwo3Tv
         X9FMzy6bM//Kc5g0ajnys75dLHFrDpROTfQaNFTsqhRB6B/31DRJTtJhwoSwmn7FBp
         XaFJlSca9cdsFt3Ov7soIk6oRgCQjIwsg+AKM+W0=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: gadget: f_uac2: Define specific wTerminalType
Date:   Mon, 31 Jan 2022 08:18:13 +0100
Message-Id: <20220131071813.7433-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Several users have reported that their Win10 does not enumerate UAC2
gadget with the existing wTerminalType set to
UAC_INPUT_TERMINAL_UNDEFINED/UAC_INPUT_TERMINAL_UNDEFINED, e.g.
https://github.com/raspberrypi/linux/issues/4587#issuecomment-926567213.
While the constant is officially defined by the USB terminal types
document, e.g. XMOS firmware for UAC2 (commonly used for Win10) defines
no undefined output terminal type in its usbaudio20.h header.

Therefore wTerminalType of EP-IN is set to
UAC_INPUT_TERMINAL_MICROPHONE and wTerminalType of EP-OUT to
UAC_OUTPUT_TERMINAL_SPEAKER for the UAC2 gadget.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/gadget/function/f_uac2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index ce3ca7e62e2a..f2237bcdba7c 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -212,7 +212,7 @@ static struct uac2_input_terminal_descriptor io_in_it_desc = {
 
 	.bDescriptorSubtype = UAC_INPUT_TERMINAL,
 	/* .bTerminalID = DYNAMIC */
-	.wTerminalType = cpu_to_le16(UAC_INPUT_TERMINAL_UNDEFINED),
+	.wTerminalType = cpu_to_le16(UAC_INPUT_TERMINAL_MICROPHONE),
 	.bAssocTerminal = 0,
 	/* .bCSourceID = DYNAMIC */
 	.iChannelNames = 0,
@@ -240,7 +240,7 @@ static struct uac2_output_terminal_descriptor io_out_ot_desc = {
 
 	.bDescriptorSubtype = UAC_OUTPUT_TERMINAL,
 	/* .bTerminalID = DYNAMIC */
-	.wTerminalType = cpu_to_le16(UAC_OUTPUT_TERMINAL_UNDEFINED),
+	.wTerminalType = cpu_to_le16(UAC_OUTPUT_TERMINAL_SPEAKER),
 	.bAssocTerminal = 0,
 	/* .bSourceID = DYNAMIC */
 	/* .bCSourceID = DYNAMIC */
-- 
2.25.1


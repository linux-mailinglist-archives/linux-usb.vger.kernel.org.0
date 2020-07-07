Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C2121658D
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 06:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgGGEwf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 00:52:35 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:15659 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbgGGEwf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 00:52:35 -0400
Date:   Tue, 07 Jul 2020 04:52:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1594097554;
        bh=5q/H+8yMap6cF7suS0jVAeF0hIctFaxQAHzKYezya8s=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=gQ1PMMAejZmgITH489XmQYaurUZIRU55gU+CluReM/vrn9WpYxkt+zrvqwamIaXpQ
         xokCfT7krd3abRP1m5cGMq9JJl4cLN5MGUKKBEq3+tLkm0bEmA5B4q0zBzUUDeHYQp
         VfL6r7KciTXTUcSw58+BvOL3qMPmjwvqlOOrstQs=
To:     gregkh@linuxfoundation.og
From:   Colton Lewis <colton.w.lewis@protonmail.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        Colton Lewis <colton.w.lewis@protonmail.com>
Reply-To: Colton Lewis <colton.w.lewis@protonmail.com>
Subject: [PATCH 1/2] usb: correct kernel-doc inconsistency
Message-ID: <20200707045207.235540-1-colton.w.lewis@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Silence documentation  build warning by correcting  kernel-doc comment
for sub_validate_langid function.

./drivers/usb/gadget/usbstring.c:77: warning: Function parameter or member =
'langid' not described in 'usb_validate_langid'
./drivers/usb/gadget/usbstring.c:77: warning: Excess function parameter 'la=
ng' description in 'usb_validate_langid'

Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>
---
 drivers/usb/gadget/usbstring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/usbstring.c b/drivers/usb/gadget/usbstring.=
c
index 58a4d3325090..119505fac777 100644
--- a/drivers/usb/gadget/usbstring.c
+++ b/drivers/usb/gadget/usbstring.c
@@ -68,7 +68,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_get_string);
=20
 /**
  * usb_validate_langid - validate usb language identifiers
- * @lang: usb language identifier
+ * @langid: usb language identifier
  *
  * Returns true for valid language identifier, otherwise false.
  */
--=20
2.26.2



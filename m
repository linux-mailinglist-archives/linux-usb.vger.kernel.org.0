Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5DB5253157
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 16:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgHZOcs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 10:32:48 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59609 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727080AbgHZOcj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Aug 2020 10:32:39 -0400
Received: (qmail 401822 invoked by uid 1000); 26 Aug 2020 10:32:29 -0400
Date:   Wed, 26 Aug 2020 10:32:29 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     Till =?iso-8859-1?Q?D=F6rges?= <doerges@pre-sense.de>,
        USB mailing list <linux-usb@vger.kernel.org>,
        USB Storage list <usb-storage@lists.one-eyed-alien.net>
Subject: [PATCH] usb: storage: Add unusual_uas entry for Sony PSZ drives
Message-ID: <20200826143229.GB400430@rowland.harvard.edu>
References: <20200523203349.GA12853@rowland.harvard.edu>
 <5bd5e8be-f8a9-9456-cced-c2bc75455556@pre-sense.de>
 <20200617163734.GC11314@rowland.harvard.edu>
 <763037ac-d8fa-8697-7f75-c0bf958b4308@pre-sense.de>
 <ce4d0606-b398-d23b-1a5f-25611eb4338f@pre-sense.de>
 <364ac09a-a877-c04e-5f2f-d5a559406590@pre-sense.de>
 <20200619150527.GA49731@rowland.harvard.edu>
 <c6fe1288-08a1-4d0a-37f5-c1ca44d46c25@pre-sense.de>
 <20200825184504.GC375466@rowland.harvard.edu>
 <0c7a4975-596e-9c5a-062f-df77e8ebe969@pre-sense.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c7a4975-596e-9c5a-062f-df77e8ebe969@pre-sense.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The PSZ-HA* family of USB disk drives from Sony can't handle the
REPORT OPCODES command when using the UAS protocol.  This patch adds
an appropriate quirks entry.

Reported-and-tested-by: Till Dörges <doerges@pre-sense.de>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: <stable@vger.kernel.org>

---


[as1942]


 drivers/usb/storage/unusual_uas.h |    7 +++++++
 1 file changed, 7 insertions(+)

Index: usb-devel/drivers/usb/storage/unusual_uas.h
===================================================================
--- usb-devel.orig/drivers/usb/storage/unusual_uas.h
+++ usb-devel/drivers/usb/storage/unusual_uas.h
@@ -28,6 +28,13 @@
  * and don't forget to CC: the USB development list <linux-usb@vger.kernel.org>
  */
 
+/* Reported-by: Till Dörges <doerges@pre-sense.de> */
+UNUSUAL_DEV(0x054c, 0x087d, 0x0000, 0x9999,
+		"Sony",
+		"PSZ-HA*",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_OPCODES),
+
 /* Reported-by: Julian Groß <julian.g@posteo.de> */
 UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
 		"LaCie",

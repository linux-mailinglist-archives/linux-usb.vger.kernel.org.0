Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9ADE36D120
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 06:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234373AbhD1EKI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 00:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhD1EKI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Apr 2021 00:10:08 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32AE5C061574
        for <linux-usb@vger.kernel.org>; Tue, 27 Apr 2021 21:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=6ic0jXt/yX64Xz1GybcdSwI99arhDWBT0mgQB/ERifE=; b=d6yqiXWSbfM3M7UMeci7N41BfJ
        f/iekbB+bQ466PHTwvOYk3WKZDc6Pfz8vHt4gc3JRtN2JpLpmioi7bTgOKupLC/lO5Gx8X10TqlDu
        cfMplOvAS6w41Kk+QjHzM9Uy56f/PXDxgcSH+B/wmIE4X/87P5tgwzxuVtiUsNTgUoFE08nunWcmh
        j/9gR+1RMfBvA4NpCCM6IfCehd5Eo54AoCL1U91XbR39zSwT/syJD3Vl17rilgjR+5TysEzmyAlXI
        D9xBh22fm+I1cgKwsvSD66Uj5+xGka/nT8ifqjD2X+4XYmDJN4OCd7dtHWjYG6IuuBROqcRNOwARg
        pyAt4j9w==;
Received: from [2601:1c0:6280:3f0::df68] (helo=casper.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lbbVT-007odu-66; Wed, 28 Apr 2021 04:09:08 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-usb@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>, Li Yang <leoyang.li@nxp.com>,
        linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] usb: gadget: fsl_qe_udc: fix implicit-fallthrough warnings
Date:   Tue, 27 Apr 2021 21:08:55 -0700
Message-Id: <20210428040855.25907-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quieten implicit-fallthrough warnings in fsl_qe_udc.c:

../drivers/usb/gadget/udc/fsl_qe_udc.c: In function 'qe_ep_init':
../drivers/usb/gadget/udc/fsl_qe_udc.c:542:37: warning: this statement may fall through [-Wimplicit-fallthrough=]
  542 |    if ((max == 128) || (max == 256) || (max == 512))
../drivers/usb/gadget/udc/fsl_qe_udc.c:563:8: warning: this statement may fall through [-Wimplicit-fallthrough=]
  563 |     if (max <= 1024)
../drivers/usb/gadget/udc/fsl_qe_udc.c:566:8: warning: this statement may fall through [-Wimplicit-fallthrough=]
  566 |     if (max <= 64)
../drivers/usb/gadget/udc/fsl_qe_udc.c:580:8: warning: this statement may fall through [-Wimplicit-fallthrough=]
  580 |     if (max <= 1024)
../drivers/usb/gadget/udc/fsl_qe_udc.c:596:5: warning: this statement may fall through [-Wimplicit-fallthrough=]
  596 |     switch (max) {

This basically just documents what is currently being done.
If any of them need to do something else, just say so or
even make the change.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org
---
 drivers/usb/gadget/udc/fsl_qe_udc.c |    5 +++++
 1 file changed, 5 insertions(+)

--- linux-next-20210427.orig/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ linux-next-20210427/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -541,6 +541,7 @@ static int qe_ep_init(struct qe_udc *udc
 			case USB_SPEED_HIGH:
 			if ((max == 128) || (max == 256) || (max == 512))
 				break;
+			fallthrough;
 			default:
 				switch (max) {
 				case 4:
@@ -562,9 +563,11 @@ static int qe_ep_init(struct qe_udc *udc
 			case USB_SPEED_HIGH:
 				if (max <= 1024)
 					break;
+				fallthrough;
 			case USB_SPEED_FULL:
 				if (max <= 64)
 					break;
+				fallthrough;
 			default:
 				if (max <= 8)
 					break;
@@ -579,6 +582,7 @@ static int qe_ep_init(struct qe_udc *udc
 			case USB_SPEED_HIGH:
 				if (max <= 1024)
 					break;
+				fallthrough;
 			case USB_SPEED_FULL:
 				if (max <= 1023)
 					break;
@@ -605,6 +609,7 @@ static int qe_ep_init(struct qe_udc *udc
 				default:
 					goto en_done;
 				}
+				fallthrough;
 			case USB_SPEED_LOW:
 				switch (max) {
 				case 1:

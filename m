Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC38347A59
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 15:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236101AbhCXOLx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 10:11:53 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:40929 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236087AbhCXOLi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 10:11:38 -0400
Received: from rpi3.fritz.box ([46.90.46.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.113]) with ESMTPA (Nemesis) id
 1MsI0K-1ldyih2sKg-00tjmg; Wed, 24 Mar 2021 15:11:29 +0100
From:   Fabian Vogt <fabian@ritter-vogt.de>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Fabian Vogt <fabian@ritter-vogt.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yuan-Hsin Chen <yhchen@faraday-tech.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 5/7] fotg210-udc: Call usb_gadget_udc_reset
Date:   Wed, 24 Mar 2021 15:11:13 +0100
Message-Id: <20210324141115.9384-6-fabian@ritter-vogt.de>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20210324141115.9384-1-fabian@ritter-vogt.de>
References: <20210324141115.9384-1-fabian@ritter-vogt.de>
X-Provags-ID: V03:K1:Q1NeB63uYjp4uOtAeL2ipXlaxqnhkCOKcyq6n9e+/HVsn7d7mm+
 Q4oA8YPwwsAga+Iig56lJ0kYVtJwJggLaN2OVqxtbcWo0jcdqo2R2uSPgnLmToNmHC2JN+4
 KXYboZOCeEf5ske1extqO5cAUpIREUyFddAtq0Fc3khJx2IzZiH1p++sLzjqqessAt6hX8V
 yxDsmR7mxLHUkjxrlolEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QJwvIADzL5U=:fFgGURQsoLlf44OOAFgsSj
 WIlO4uEn5SGGA4cw7ry6mcSaMuxb0H18e5nsPVsju1h6FH9RlwviaaBfpemRFjJSUnFsepLAu
 DrcRt7/iW0fCvs5QEmeK0pZSkTY6hQclMhkbZ92nsomB7ROlXWfmmLLdjaDVrbqOmcFHcbO+T
 WTrDSRaxuNODjD7cpOob8c6+qUA6ij0K9NvcOKROGzfXApvXFOAbylqOMtvHnCDVr6zDMB7Vp
 Ujl42sPVAxDm7jYk+EEG9Kheo+++xJCgIvi/DXd3a+H2qnZ06UyxX7XwEa5ohc1AZtcFZ4EUU
 1okx8wCNcbNKx2lNmXy0XOHqE/oloWvgT+rS975zgWiITmzt6NtGJu3xIpkvR3LZQwgiEWYPn
 SrxtmpDX0YBvOJZK+9347TxyoEdJ+Wtpw5N7fF1RlRpveftECoL3xmy1lky18H0QCqQ54rClL
 GW+nidqPkA==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Notify the UDC core that a bus reset occurred.

Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>
---
 drivers/usb/gadget/udc/fotg210-udc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/udc/fotg210-udc.c b/drivers/usb/gadget/udc/fotg210-udc.c
index d7693b8d7c54..6a4c60d5b2c2 100644
--- a/drivers/usb/gadget/udc/fotg210-udc.c
+++ b/drivers/usb/gadget/udc/fotg210-udc.c
@@ -890,6 +890,8 @@ static irqreturn_t fotg210_irq(int irq, void *_fotg210)
 		int_grp2 &= ~int_msk2;
 
 		if (int_grp2 & DISGR2_USBRST_INT) {
+			usb_gadget_udc_reset(&fotg210->gadget,
+					     fotg210->driver);
 			value = ioread32(reg);
 			value &= ~DISGR2_USBRST_INT;
 			iowrite32(value, reg);
-- 
2.25.1


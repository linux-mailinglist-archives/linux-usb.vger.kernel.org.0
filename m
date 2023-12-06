Return-Path: <linux-usb+bounces-3791-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDABF807758
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 19:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59FCB281E92
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 18:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0A0675A1;
	Wed,  6 Dec 2023 18:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fFMF/HdN"
X-Original-To: linux-usb@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730D1D5B;
	Wed,  6 Dec 2023 10:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=9Jjhru2ZS2MjwSXGlS5vMOqG5oAjzFFLnSkNdJ/iC7Y=; b=fFMF/HdNhrOgP0tisubvvm+0du
	sSkWPYchdFU+7JZ81vY6FMVW3yepI6GBNfY+NNR7wyoIlrWZJt6wZU80vblBmk6OcQ3xs81SafMTA
	JxTJMZgo8gbFEVLl+GD4lyLD1jmMVQ42mMHDA1nKxouae0DEKk3mIM9OkCpy4859yi9fHpw1tIFch
	NCPunzAZLmxnRtFOlx+zDLfIOq1fUeR+tdqVcPfQC3knFGD/1x9Kr0QJQso33SaSYC2hFsbQJvVb1
	rT/329l9EJarlVw0EyMFnOc7yfWOKuQbYeRPatmOWvRWZLndP63LC1LiMrCEwAvQjanWLnTDsp4s8
	oQb/tGVg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAwOu-00B0qd-0j;
	Wed, 06 Dec 2023 18:13:36 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: fotg210-udc: fix function kernel-doc comments
Date: Wed,  6 Dec 2023 10:13:35 -0800
Message-ID: <20231206181335.27540-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct kernel-doc comments to prevent warnings from
scripts/kernel-doc.

fotg210-udc.c:1103: warning: Function parameter or member 'g' not described in 'fotg210_vbus_session'
fotg210-udc.c:1103: warning: Excess function parameter '_gadget' description in 'fotg210_vbus_session'
fotg210-udc.c:1103: warning: No description found for return value of 'fotg210_vbus_session'
fotg210-udc.c:1129: warning: No description found for return value of 'fotg210_phy_event'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
---
 drivers/usb/fotg210/fotg210-udc.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff -- a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
--- a/drivers/usb/fotg210/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -1094,10 +1094,10 @@ static int fotg210_udc_stop(struct usb_g
 
 /**
  * fotg210_vbus_session - Called by external transceiver to enable/disable udc
- * @_gadget: usb gadget
+ * @g: usb gadget
  * @is_active: 0 if should disable UDC VBUS, 1 if should enable
  *
- * Returns 0
+ * Returns: %0
  */
 static int fotg210_vbus_session(struct usb_gadget *g, int is_active)
 {
@@ -1122,7 +1122,7 @@ static const struct usb_gadget_ops fotg2
  *
  * Called by the USB Phy when a cable connect or disconnect is sensed.
  *
- * Returns NOTIFY_OK or NOTIFY_DONE
+ * Returns: NOTIFY_OK or NOTIFY_DONE
  */
 static int fotg210_phy_event(struct notifier_block *nb, unsigned long action,
 			     void *data)


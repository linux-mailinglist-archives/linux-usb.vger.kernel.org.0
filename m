Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF11A215873
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729425AbgGFNej (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729383AbgGFNeW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:34:22 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82153C061794
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:34:22 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f7so37936610wrw.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wUFrKyBE/rqHQUVcokgEiKeaeYpvOr+KJ0Q9vYwpje8=;
        b=uusCAAiMYRyZu2CfIvDS4HCRjCXdZtQhAdbkpOMuxK8zvkQgvAiWP7osHCg5j0Lxi5
         16z2up3T4hzLGYGUj30PuZuH/B1ZOaCs7UsgLTYfLAopJ+wzvauVq5wsuRkhS9mODBVO
         xu3HpYfIRTGCABdG6OuYwyuSubTIL9fv8KfITH2PVNH6p+KU2u/VSZ88VFCHVaBSnUEE
         qCSCG4xa+6MOhyRfi5aRon2mI3zyyZNLPzHx0yYiSZHLP1iZQY77tCT0GZB2yW+6Np0Z
         oepj3m1na2bZFY8S7xZRfDmdzIbt82vIVRQ30dBiAEz2EguVEQm+DlN2OGXrSjBKXDOb
         Soig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wUFrKyBE/rqHQUVcokgEiKeaeYpvOr+KJ0Q9vYwpje8=;
        b=D3HSVrawI3Xsgd4N49Jm++FeCmxco74wRM9lQSiOcNWHAyihmYdxaYyLi/wNMpO+br
         vdRt8DaCd3Gvc90hvu6q2y1900UfArQBC8+5bs7P1wrjpHSghaq/0Wfv7yNXrJW1yBfb
         H9+edcWNi2YgYPnEOTK4EzodvuqGqjaETZEClfPPS7yuQhOzC78m5W8UrawT0iVpeohc
         a0hHPwCG3nrjsz3P+CvyKsvgJnIkG770lRod4y00UNEU0Z9gsfdNpmWbgOAfrUFBAMiX
         KagbbwMUl/vtRrHLnaucDWQU39BhTKAUZ6CNmuv9AYvQRL3N0QArP/XDIT7fxg7kn8jE
         JvzA==
X-Gm-Message-State: AOAM531XDjmWcnjI0vmW9Dr+xdC9ymMDSjgAKw5JUUTB8+h2JLeoz8r+
        OnZkLyIes7YMJT71CNxUYVUZVA==
X-Google-Smtp-Source: ABdhPJyyqkr63bgakviOF8q+Q3TQCXiWUrHVNA65wDA49vqE6L9e5OtXIB/BD5KAE97IICp4FfjQqQ==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr50993618wrq.101.1594042461212;
        Mon, 06 Jul 2020 06:34:21 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:34:20 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Shlomi Gridish <gridish@freescale.com>,
        Jerry Huang <Chang-Ming.Huang@freescale.com>,
        Peter Barada <peterb@logicpd.com>,
        Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: [PATCH 30/32] usb: host: fhci-tds: Remove unused variables 'buf' and 'extra_data'
Date:   Mon,  6 Jul 2020 14:33:39 +0100
Message-Id: <20200706133341.476881-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Neither have been used since the driver's inception in 2009.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/host/fhci-tds.c: In function ‘fhci_flush_bds’:
 drivers/usb/host/fhci-tds.c:472:6: warning: variable ‘buf’ set but not used [-Wunused-but-set-variable]
 472 | u32 buf;
 | ^~~
 drivers/usb/host/fhci-tds.c:470:6: warning: variable ‘extra_data’ set but not used [-Wunused-but-set-variable]
 470 | u16 extra_data;
 | ^~~~~~~~~~
 drivers/usb/host/fhci-tds.c: In function ‘fhci_flush_actual_frame’:
 drivers/usb/host/fhci-tds.c:527:6: warning: variable ‘extra_data’ set but not used [-Wunused-but-set-variable]
 527 | u16 extra_data;
 | ^~~~~~~~~~

Cc: Shlomi Gridish <gridish@freescale.com>
Cc: Jerry Huang <Chang-Ming.Huang@freescale.com>
Cc: Peter Barada <peterb@logicpd.com>
Cc: Anton Vorontsov <avorontsov@ru.mvista.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/host/fhci-tds.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/fhci-tds.c b/drivers/usb/host/fhci-tds.c
index f3308ce250438..d98fd9e1af0bc 100644
--- a/drivers/usb/host/fhci-tds.c
+++ b/drivers/usb/host/fhci-tds.c
@@ -467,17 +467,15 @@ u32 fhci_host_transaction(struct fhci_usb *usb,
 /* Reset the Tx BD ring */
 void fhci_flush_bds(struct fhci_usb *usb)
 {
-	u16 extra_data;
 	u16 td_status;
-	u32 buf;
 	struct usb_td __iomem *td;
 	struct endpoint *ep = usb->ep0;
 
 	td = ep->td_base;
 	while (1) {
 		td_status = in_be16(&td->status);
-		buf = in_be32(&td->buf_ptr);
-		extra_data = in_be16(&td->extra);
+		in_be32(&td->buf_ptr);
+		in_be16(&td->extra);
 
 		/* if the TD is not empty - we'll confirm it as Timeout */
 		if (td_status & TD_R)
@@ -524,7 +522,6 @@ void fhci_flush_actual_frame(struct fhci_usb *usb)
 {
 	u8 mode;
 	u16 tb_ptr;
-	u16 extra_data;
 	u16 td_status;
 	u32 buf_ptr;
 	struct usb_td __iomem *td;
@@ -538,7 +535,7 @@ void fhci_flush_actual_frame(struct fhci_usb *usb)
 	td = cpm_muram_addr(tb_ptr);
 	td_status = in_be16(&td->status);
 	buf_ptr = in_be32(&td->buf_ptr);
-	extra_data = in_be16(&td->extra);
+	in_be16(&td->extra);
 	do {
 		if (td_status & TD_R) {
 			out_be16(&td->status, (td_status & ~TD_R) | TD_TO);
@@ -552,7 +549,7 @@ void fhci_flush_actual_frame(struct fhci_usb *usb)
 		td = next_bd(ep->td_base, td, td_status);
 		td_status = in_be16(&td->status);
 		buf_ptr = in_be32(&td->buf_ptr);
-		extra_data = in_be16(&td->extra);
+		in_be16(&td->extra);
 	} while ((td_status & TD_R) || buf_ptr);
 
 	fhci_td_transaction_confirm(usb);
-- 
2.25.1


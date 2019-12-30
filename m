Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE5E12D1BD
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 17:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbfL3QNB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 11:13:01 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:40479 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbfL3QNB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Dec 2019 11:13:01 -0500
Received: by mail-ed1-f68.google.com with SMTP id b8so33004826edx.7
        for <linux-usb@vger.kernel.org>; Mon, 30 Dec 2019 08:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G+IpvNYDr1r8qiuEoCpZSYzbw36vNuYa2znw2miGrDA=;
        b=WG4La9s5mhcbwYlQ2kAuW8nhMwm1/5+T0FR3m096MJaQPzYLHjRT7xh0wWL6r+JfG0
         dqvqaKQ7/avtVROEZkFXTwLj+8qXpm+15l4CfZ5e2Qr7l2VziQaJcbx9VzNLbATaH2IN
         CuaTn8d1qmh24SQEFALHaHPKdxjzpGEstOXDDVFhTZdzQj9li4/h871hduxDHhI66zDt
         J2ZuN5HuFA1i3KgrEiF7KcbSAVoPqy741saZwRzvwB3kEI1EB7hYukmNVdiSYgpXAcow
         qDR7oK+104ETHLRk/CrIyTx47c7LF9f2d/Vg9oVyPOFjkgp1Ek5iM58TGTXnsXLtImxF
         CTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G+IpvNYDr1r8qiuEoCpZSYzbw36vNuYa2znw2miGrDA=;
        b=CjjCqWmD18APEqG6y+X/+wAp1wFkn8a4mPMSXaMXYU65tPn1tr//jIrjH9nomMyp2C
         O/ADwP0ZG8USeqLXGwcTtVoEshzE1gWygoj9LqGQgMP1yKEPknjat9APuyUyyevUkwAy
         0fX2pUSXHbLVHivzCjQZur5p5Ss6yqULrxcvlf5+XLVCaRllRI97b8IY0wVh1TQRJBXo
         H4CpTiXkAtDifYo6vMOD9xcLVL0g2Ppbzzltni2wnTj68X69SgYqtHtBBakSV24awsfU
         eCljUQvo6mDivGLCO9oqP6MAROzBkiKZp2RCkvPGIlgxlX6RAExkazXADIrCphZ4byOm
         I94g==
X-Gm-Message-State: APjAAAWhympbE5A0qwoKMgJTaQzNiRyYYXuo0fbqmZ+e2WEUpzWfWmUM
        6kmra6qZMTobtx6X+JvOvWaZyg==
X-Google-Smtp-Source: APXvYqyQLdXcF5BunDhBXgm6EMm1xV9hVQs1TafRntsrA3F/atajI6uyS4ZbVKz9Z6UkPhnSuI5Jgg==
X-Received: by 2002:a17:906:4d46:: with SMTP id b6mr69483027ejv.79.1577722379278;
        Mon, 30 Dec 2019 08:12:59 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id dx7sm5624489ejb.81.2019.12.30.08.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 08:12:58 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH] usb: dwc3: gadget: Fix failure to detect end of transfer
Date:   Mon, 30 Dec 2019 16:13:21 +0000
Message-Id: <20191230161321.2738541-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A recent bugfix 8c7d4b7b3d43 ("usb: dwc3: gadget: Fix logical condition")
correctly fixes a logical error in the gadget driver but, exposes a further
bug in determining when a transfer has completed.

Prior to 8c7d4b7b3d43 we were calling dwc3_gadget_giveback() when we
shouldn't have been. Afer this change the below test fails to complete on
my hardware.

Host:
echo "host" > /dev/ttyACM0

Device:
cat < /dev/ttyGS0

This is caused by the driver incorrectly detecting end of transfer, a
problem that had previous been masked by the continuous calling of
dwc3_gadget_giveback() prior to 8c7d4b7b3d43.

Remediate by making the test <= instead of ==

Fixes: e0c42ce590fe ("usb: dwc3: gadget: simplify IOC handling")

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 0c960a97ea02..464c4d9961c7 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2467,7 +2467,7 @@ static int dwc3_gadget_ep_reclaim_trb_linear(struct dwc3_ep *dep,
 
 static bool dwc3_gadget_ep_request_completed(struct dwc3_request *req)
 {
-	return req->request.actual == req->request.length;
+	return req->request.actual <= req->request.length;
 }
 
 static int dwc3_gadget_ep_cleanup_completed_request(struct dwc3_ep *dep,
-- 
2.24.0


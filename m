Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70F1715BB07
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 09:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729531AbgBMIyJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 03:54:09 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34017 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729511AbgBMIyJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Feb 2020 03:54:09 -0500
Received: by mail-lj1-f195.google.com with SMTP id x7so5651476ljc.1
        for <linux-usb@vger.kernel.org>; Thu, 13 Feb 2020 00:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4rkGF5v8vVDO4e6MS975js5HBclxWpED/LpMGJ9Hey0=;
        b=NZZYkVhgDADY3Ce/7aWSfp11q9xMdrEsM9cTzr53u4TTDFfdWqyd1tDLbiJPEsMUIL
         nrdHXw7yMCpASuFZT8HdPBUOmSr5SiPyHGz7I4gCQxWPYEcM7fcN4IojRYzUu0vNgtoS
         KtnddPHF+VlRj2imrmImc3aduXSr+In5jlqFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4rkGF5v8vVDO4e6MS975js5HBclxWpED/LpMGJ9Hey0=;
        b=H9l3SRjrTQorPSMquSSsWuFBjaCyQNrI/OgH4BgK5wvueQOgofArsIJsnRDmQnrtT7
         83bkpLu94SRDGGTDIsKAe+yJT+OMIM6nUv9tckiFheYl0kkgj5WivFa0+PVqK0CNIY4+
         8KHh925aCT0H2Xhv0xT1EaZ0lWZbtDL97FM6q1bOXtpIwWCOA1vc4rJEqAqn1aYTT/CY
         szDfgrgV9sv0kRpAk68iIyPxujEbmeBIpEMW9k+ndBSrOJLnEjBOgEKLRwewBWu7e9Hr
         00hgwgOwBlbftSRx7ZWJsZ7wCJ+t5dWzwfZ7Jg3EqUjIItWJ4PlP16oVvgDCvn96Y89Z
         K37g==
X-Gm-Message-State: APjAAAXgPPvQjqtNENQvGji54l+Jp+Xoz2Fo7dTuLi0/++HGSq+e6HRy
        4PS4r9C4zx6oZDsOVXAPgP5JSw==
X-Google-Smtp-Source: APXvYqyy3x/KKk/OiEsGzCxn5t8PSTtiieVNqLoBgW9/07IdKWT9jsL7busLIGeSEXK6P93WeA0rug==
X-Received: by 2002:a2e:9e16:: with SMTP id e22mr10980352ljk.220.1581584047321;
        Thu, 13 Feb 2020 00:54:07 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 5sm966893lju.69.2020.02.13.00.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 00:54:06 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Timur Tabi <timur@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Anton Vorontsov <avorontsov@ru.mvista.com>,
        kbuild test robot <lkp@intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] usb: host: fhci-hcd: annotate PIPE_CONTROL switch case with fallthrough
Date:   Thu, 13 Feb 2020 09:54:00 +0100
Message-Id: <20200213085401.27862-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

After this was made buildable for something other than PPC32, kbuild
starts warning

drivers/usb/host/fhci-hcd.c:398:8: warning: this statement may fall
through [-Wimplicit-fallthrough=]

I don't know this code, but from the construction (initializing size
with 0 and explicitly using "size +=" in the PIPE_BULK case) I assume
that fallthrough is indeed intended.

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 5a35435ef4e6 (soc: fsl: qe: remove PPC32 dependency from CONFIG_QUICC_ENGINE)
Fixes: a035d552a93b (Makefile: Globally enable fall-through warning)
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---

Two different Fixes: Obviously my 5a35435ef4e6 is the one that started
making kbuild complain, but that's just because apparently kbuild
doesn't cover a PPC32+USB_FHCI_HCD .config. Note for -stable folks,
just in case 5.3.y is still maintained somewhere: a035d552a93b
appeared in 5.3, but the #define fallthrough that I'm using here
wasn't introduced until 5.4 (294f69e662d15). So either ignore this,
make it /* fallthrough */, or backport 294f69e662d15 to 5.3.y as well.

 drivers/usb/host/fhci-hcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index 04733876c9c6..a8e1048278d0 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -396,6 +396,7 @@ static int fhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
 	case PIPE_CONTROL:
 		/* 1 td fro setup,1 for ack */
 		size = 2;
+		fallthrough;
 	case PIPE_BULK:
 		/* one td for every 4096 bytes(can be up to 8k) */
 		size += urb->transfer_buffer_length / 4096;
-- 
2.23.0


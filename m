Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAE72126F9
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729943AbgGBOtj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729920AbgGBOqd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:46:33 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5C2BC08C5DD
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:46:32 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s10so28743780wrw.12
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e63YwYltHzireeUJAWeq6I/Q+T+q+YjnJiKdRakYXIQ=;
        b=hYKVXrVgkHraKOfZu3k2KQgkRHrWpQyoiVNITKkt1laLeRsQphMY2/cCQQJu6Yxeq3
         THAbytYMpx+LL+OHe5i6N7aqfDGUYS1nwUVkXo86nqmsL/g1r1+o4D2Wwlw7xa1TDcb9
         W0FNCE+rSz6eQGz46KlgSPYSL4YHs4RZlLpdVVMup84vGo0tmQSvHfVCcsPjRekNJ5wW
         vdrw4fSR2Y/feAsgx9WotHu0jT2Hbr9cs6ccIIjdBkeW/AtD7DchmnTKJHB6qWLyY16k
         twS52qFRMzmBCJOAOfwieDFpf/GDvlmB11h6Ajzx0RAxYR6IyNt/wbeNQ17pzw3BSd8F
         407g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e63YwYltHzireeUJAWeq6I/Q+T+q+YjnJiKdRakYXIQ=;
        b=lW7CpM9Pf3ujuGu8HvkffcUOF8GhS7YL1SzhS61MjksPYaXsLb46H4jjBByRN853zD
         dTcL/cTmYTO1HQBABYzsuLOGkP+IFbi6szPvMUC/32Q0s8go+AjgWk3onQr6prcq1kDl
         Xe60P/cGNx/AQPdvgLi65EwC5vhDWJqhDYBimZcxgpiRN5g+qangk4RH6loUmFFpdVd0
         3YLLrpZ5J84c5AF6OBuc4COGz3DwjlN+jikwyDyg++u+JGaL3U5ahS4gd8uI98cgYa2d
         0U/kw1nisVsqQpJbo+0G3arelWmOPx4VjxEoMOSYhLGqFLkJqVEMYgsTGdZ3kKgT8i9j
         5ktg==
X-Gm-Message-State: AOAM5327H2yA8M8Xaqbg5b4NEiayqiHe9tBbnS9rGAz6EGsVSLjPFB5x
        +I1a05StvtCZyP9mZyZvTDNLYQ==
X-Google-Smtp-Source: ABdhPJwVhXexGFtE5J767EHYTZ5ksk2T2JcVdBbrTkdpijHJTFgDlRPbD9D3pIbKZH4I57pFWKs9HA==
X-Received: by 2002:adf:aa90:: with SMTP id h16mr32393226wrc.356.1593701191570;
        Thu, 02 Jul 2020 07:46:31 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:46:30 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Martin Mares <mj@ucw.cz>, aleksey_gorelov@phoenix.com
Subject: [PATCH 02/30] usb: host: pci-quirks: Demote function header from kerneldoc to comment block
Date:   Thu,  2 Jul 2020 15:45:57 +0100
Message-Id: <20200702144625.2533530-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

quirk_usb_handoff_xhci()'s function header is the only one across
the sourcefile which is denoted as a kerneldoc header.  Despite
no attempt to document its arguments.  Drop it down in status from
kerneldoc to a standard comment block to match the other headers
in the file.

Fixes the following W=1 kernel build warning:

 drivers/usb/host/pci-quirks.c:1145: warning: Function parameter or member 'pdev' not described in 'quirk_usb_handoff_xhci'

Cc: Mathias Nyman <mathias.nyman@intel.com>
Cc: Martin Mares <mj@ucw.cz>
Cc: aleksey_gorelov@phoenix.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/host/pci-quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index 0b949acfa2589..b8961c0381cfd 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -1133,7 +1133,7 @@ void usb_disable_xhci_ports(struct pci_dev *xhci_pdev)
 }
 EXPORT_SYMBOL_GPL(usb_disable_xhci_ports);
 
-/**
+/*
  * PCI Quirks for xHCI.
  *
  * Takes care of the handoff between the Pre-OS (i.e. BIOS) and the OS.
-- 
2.25.1


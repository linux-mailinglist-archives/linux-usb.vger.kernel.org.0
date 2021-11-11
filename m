Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2420944D668
	for <lists+linux-usb@lfdr.de>; Thu, 11 Nov 2021 13:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbhKKMPm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Nov 2021 07:15:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbhKKMPm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Nov 2021 07:15:42 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D440C061766
        for <linux-usb@vger.kernel.org>; Thu, 11 Nov 2021 04:12:53 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id x131so5414997pfc.12
        for <linux-usb@vger.kernel.org>; Thu, 11 Nov 2021 04:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z7Bo+3iEWB/Cyvjdu7SemXkR6Sf83KAE2w7hembhxxA=;
        b=Fyg+F4sbJUmOXIAbGcDxMnD1ntwrvzKMaMYsiw3RH23P+LKOYvT2cIi8At0ooJzTOY
         e54h3+CodpJJ6clTPz7tfVdKoluEFKr0MCAzIyGLN3TSkzSQbHa7sXIzFnHiNO7MOrrW
         2woeJUjkpH52nvIMppo8zOTuM7PJbVmrFLDzsrh+uxyC9aDCOg9SaK9oMeedeLqvd+s+
         F2oCbE0ttiugJ3pQT37VezQT/HmFUa2w6z6Ve9yfw8ICU/J2t4qvCz5TE9e87y8V90t/
         41ezC1B5J4Dx1OXgKa96x/Y/sSLJ+UjWRxmhtb4o2rppu6mJA0lXn0RzXbg6X2DS6l7W
         9NMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z7Bo+3iEWB/Cyvjdu7SemXkR6Sf83KAE2w7hembhxxA=;
        b=QkCyWPnLfvzNFKK3tPGHZB+Dopnnn9PiYWjC9Z86Ke3jWEFVTH3uWepRT9i3Fpy9zi
         TeIJqfaQzHoxtbx1cLUcfFDQWe5/DP5ejmA8/m2ps/yp/N51R9ec6mcKRMZMt2/r01oT
         11OPUmJ6BdmSfSTm+6My8whkMTS1q/peS+6KLlKnsDopE0bl/IImn+8cKs5JpYiTuZJK
         m/KquLnUbfZMVaeg1RYi0IvQRsm9svUQUeF/nPs6BJCY4z9lfoNoQdxM4yzp/m+BIzMu
         NiABTRZW7+XmPOLMrN7+xHI7Vwj7oGTA0KHIa+IgrFdqoEBEWmc45DC0KL011WfB8tCD
         eWBA==
X-Gm-Message-State: AOAM532nMAFis6H+vhEVPWgDilCRVU98F1ivq2bvDjnw7IcDXTLwWMCX
        F9uklDnRrqbk1L5GIEU1x6E=
X-Google-Smtp-Source: ABdhPJwVS1YWBG4MxVknrL0WZfclbYiUIyzhFB0gxpWB9TC7Li39VEzQPhENcFC2hlthTFBaF81WAw==
X-Received: by 2002:a63:e107:: with SMTP id z7mr4216714pgh.294.1636632772804;
        Thu, 11 Nov 2021 04:12:52 -0800 (PST)
Received: from ELIJAHBAI-MB0.tencent.com ([103.7.29.31])
        by smtp.gmail.com with ESMTPSA id b15sm2949427pfv.48.2021.11.11.04.12.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Nov 2021 04:12:52 -0800 (PST)
From:   Haimin Zhang <tcs.kernel@gmail.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Haimin Zhang <tcs.kernel@gmail.com>,
        TCS Robot <tcs_robot@tencent.com>
Subject: [PATCH v2] USB: ehci_brcm_hub_control: filter out invalid port index
Date:   Thu, 11 Nov 2021 20:10:37 +0800
Message-Id: <20211111121037.34713-1-tcs.kernel@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Due to (wIndex & 0xff) - 1 can get an integer greater than 0xf, this
can cause array index to be out of bounds since the size of array
port_status is 0xf. Remove cases greater than 0xf, because such cases
are meaningless. It is reasonable to return -EPIPE, the caller
rh_call_control will check the return value and handle it properly.
The callee ehci_hub_control also doesn't need to deal with situations
greater than 0xf. The size of the array port_status determines that
such situations should not be handled.

Reported-by: TCS Robot <tcs_robot@tencent.com>
Signed-off-by: Haimin Zhang <tcs.kernel@gmail.com>
---
 drivers/usb/host/ehci-brcm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
index d3626bfa966b..07e6df336a08 100644
--- a/drivers/usb/host/ehci-brcm.c
+++ b/drivers/usb/host/ehci-brcm.c
@@ -63,6 +63,9 @@ static int ehci_brcm_hub_control(
 	unsigned long flags;
 	int retval, irq_disabled = 0;
 
+	if (!wIndex || wIndex > ports)
+		return -EPIPE;
+
 	status_reg = &ehci->regs->port_status[(wIndex & 0xff) - 1];
 
 	/*
@@ -70,7 +73,6 @@ static int ehci_brcm_hub_control(
 	 * of RESUME
 	 */
 	if ((typeReq == GetPortStatus) &&
-	    (wIndex && wIndex <= ports) &&
 	    ehci->reset_done[wIndex-1] &&
 	    time_after_eq(jiffies, ehci->reset_done[wIndex-1]) &&
 	    (ehci_readl(ehci, status_reg) & PORT_RESUME)) {
-- 
2.30.1 (Apple Git-130)


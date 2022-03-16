Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 976E44DBA89
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 23:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349502AbiCPWN7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 18:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbiCPWN4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 18:13:56 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A4D02BC
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 15:12:34 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id d10so7002676eje.10
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 15:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=T/NbAW0FgkZ+mseMDdzfNr0GMsaf8rvz3pB0rcu1QCg=;
        b=MM/8jrGmaZqZ8aSxIxRrCINlreNlOSRbT5mEjqFf+Vzysyq11zJdVSV8IigRf8kJdu
         Ys0G/SC/E/Ku0IlNHcN+fKt5JLHw4iqBA/2B67lCmWsqhoohEFyPqcnr92gYAeJRV2Nk
         JwH+c5gy3NLmqYRc+qP5xwU3KY7mrLchUNVWU7LQSwfTzS45V5wnocWy7VSC469gJTRY
         KuTtjDvoMJ994APRetfW3nABJg2h0LYKG/Ff5OkmwJKJ/nNs+7NiNz6uRaKk5DXS1ehE
         OThY2nK14ni/1EV0sHuBTJqf1izAm5Pp6btgVqxf7YHKP6tqxSkxQl8ECMtZZzy2WE1R
         6CsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=T/NbAW0FgkZ+mseMDdzfNr0GMsaf8rvz3pB0rcu1QCg=;
        b=a/Q83d8VyBmc69yTm762LdEoQEsmqsPJNEFcXygQRVIYral6DMUL5o9MgGny8XKK85
         xxMsOzJ6sHFisrVIl9mbvzLBhulzEfyjAzz7uyDf//hIzdy64nnbFeGUQ6+jpoH5lz4/
         xpjhsPfB6x9CYPmk8H7cLpaxclb5+5W0j8OSymrufszLVzddCU/n1c2P60cf8QXOOGN4
         +OKllIZicZRud0tI/yKRe3gvwZxdkdE5aKjgXzk96BX+202UDomhX7IyZn0+ogsPRgQU
         2y2RWkFPdWme5pE+uDQXk0Kqmq4VOP8doPaA94k18+l8YOdT4kiImmGvg/NRZPSKgVRh
         UTZg==
X-Gm-Message-State: AOAM5322IScHeVeKyYcrRm2YQJetHsB6U0mGQvYiKWHKY0feMfvGnPhT
        siqYfENVHnvM6VCvHx5C8QA=
X-Google-Smtp-Source: ABdhPJyH00337y47wFV4QGO4Oi/9sJsI+ybUJ25Gkv1b9PTirMhZEbmomJspbCXZ0F7+Z2riekyr2w==
X-Received: by 2002:a17:907:c10:b0:6db:63b1:cd17 with SMTP id ga16-20020a1709070c1000b006db63b1cd17mr1759734ejc.730.1647468752831;
        Wed, 16 Mar 2022 15:12:32 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b866:cc00:e490:2de6:a89f:9b66? (dynamic-2a01-0c23-b866-cc00-e490-2de6-a89f-9b66.c23.pool.telefonica.de. [2a01:c23:b866:cc00:e490:2de6:a89f:9b66])
        by smtp.googlemail.com with ESMTPSA id cr19-20020a170906d55300b006df6b316e29sm1433924ejc.208.2022.03.16.15.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 15:12:32 -0700 (PDT)
Message-ID: <06f0dba6-4820-7a88-41e6-be1f42725754@gmail.com>
Date:   Wed, 16 Mar 2022 23:09:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v2 1/5] xhci: factor out parts of xhci_gen_setup()
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
References: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
In-Reply-To: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Factoring out parts of xhci_gen_setup() has two motivations:
- When adding functionaliy to omit shared hcd if not needed in a
  subsequent patch, we'll have to call xhci_hcd_init_usb3_data()
  from two places.
- It reduces size of xhci_gen_setup() and makes it better readable.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/host/xhci.c | 104 +++++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 50 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 642610c78..4949de71a 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5196,6 +5196,57 @@ static int xhci_get_frame(struct usb_hcd *hcd)
 	return readl(&xhci->run_regs->microframe_index) >> 3;
 }
 
+static void xhci_hcd_init_usb2_data(struct xhci_hcd *xhci, struct usb_hcd *hcd)
+{
+	xhci->usb2_rhub.hcd = hcd;
+	hcd->speed = HCD_USB2;
+	hcd->self.root_hub->speed = USB_SPEED_HIGH;
+	/*
+	 * USB 2.0 roothub under xHCI has an integrated TT,
+	 * (rate matching hub) as opposed to having an OHCI/UHCI
+	 * companion controller.
+	 */
+	hcd->has_tt = 1;
+}
+
+static void xhci_hcd_init_usb3_data(struct xhci_hcd *xhci, struct usb_hcd *hcd)
+{
+	unsigned int minor_rev;
+
+	/*
+	 * Early xHCI 1.1 spec did not mention USB 3.1 capable hosts
+	 * should return 0x31 for sbrn, or that the minor revision
+	 * is a two digit BCD containig minor and sub-minor numbers.
+	 * This was later clarified in xHCI 1.2.
+	 *
+	 * Some USB 3.1 capable hosts therefore have sbrn 0x30, and
+	 * minor revision set to 0x1 instead of 0x10.
+	 */
+	if (xhci->usb3_rhub.min_rev == 0x1)
+		minor_rev = 1;
+	else
+		minor_rev = xhci->usb3_rhub.min_rev / 0x10;
+
+	switch (minor_rev) {
+	case 2:
+		hcd->speed = HCD_USB32;
+		hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
+		hcd->self.root_hub->rx_lanes = 2;
+		hcd->self.root_hub->tx_lanes = 2;
+		hcd->self.root_hub->ssp_rate = USB_SSP_GEN_2x2;
+		break;
+	case 1:
+		hcd->speed = HCD_USB31;
+		hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
+		hcd->self.root_hub->ssp_rate = USB_SSP_GEN_2x1;
+		break;
+	}
+	xhci_info(xhci, "Host supports USB 3.%x %sSuperSpeed\n",
+		  minor_rev, minor_rev ? "Enhanced " : "");
+
+	xhci->usb3_rhub.hcd = hcd;
+}
+
 int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 {
 	struct xhci_hcd		*xhci;
@@ -5204,7 +5255,6 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	 * quirks
 	 */
 	struct device		*dev = hcd->self.sysdev;
-	unsigned int		minor_rev;
 	int			retval;
 
 	/* Accept arbitrarily long scatter-gather lists */
@@ -5219,60 +5269,14 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	xhci = hcd_to_xhci(hcd);
 
 	if (usb_hcd_is_primary_hcd(hcd)) {
-		xhci->main_hcd = hcd;
-		xhci->usb2_rhub.hcd = hcd;
-		/* Mark the first roothub as being USB 2.0.
-		 * The xHCI driver will register the USB 3.0 roothub.
-		 */
-		hcd->speed = HCD_USB2;
-		hcd->self.root_hub->speed = USB_SPEED_HIGH;
-		/*
-		 * USB 2.0 roothub under xHCI has an integrated TT,
-		 * (rate matching hub) as opposed to having an OHCI/UHCI
-		 * companion controller.
-		 */
-		hcd->has_tt = 1;
+		xhci_hcd_init_usb2_data(xhci, hcd);
 	} else {
-		/*
-		 * Early xHCI 1.1 spec did not mention USB 3.1 capable hosts
-		 * should return 0x31 for sbrn, or that the minor revision
-		 * is a two digit BCD containig minor and sub-minor numbers.
-		 * This was later clarified in xHCI 1.2.
-		 *
-		 * Some USB 3.1 capable hosts therefore have sbrn 0x30, and
-		 * minor revision set to 0x1 instead of 0x10.
-		 */
-		if (xhci->usb3_rhub.min_rev == 0x1)
-			minor_rev = 1;
-		else
-			minor_rev = xhci->usb3_rhub.min_rev / 0x10;
-
-		switch (minor_rev) {
-		case 2:
-			hcd->speed = HCD_USB32;
-			hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
-			hcd->self.root_hub->rx_lanes = 2;
-			hcd->self.root_hub->tx_lanes = 2;
-			hcd->self.root_hub->ssp_rate = USB_SSP_GEN_2x2;
-			break;
-		case 1:
-			hcd->speed = HCD_USB31;
-			hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
-			hcd->self.root_hub->ssp_rate = USB_SSP_GEN_2x1;
-			break;
-		}
-		xhci_info(xhci, "Host supports USB 3.%x %sSuperSpeed\n",
-			  minor_rev,
-			  minor_rev ? "Enhanced " : "");
-
-		xhci->usb3_rhub.hcd = hcd;
-		/* xHCI private pointer was set in xhci_pci_probe for the second
-		 * registered roothub.
-		 */
+		xhci_hcd_init_usb3_data(xhci, hcd);
 		return 0;
 	}
 
 	mutex_init(&xhci->mutex);
+	xhci->main_hcd = hcd;
 	xhci->cap_regs = hcd->regs;
 	xhci->op_regs = hcd->regs +
 		HC_LENGTH(readl(&xhci->cap_regs->hc_capbase));
-- 
2.35.1



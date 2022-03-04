Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 573894CDCB4
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 19:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241497AbiCDSi0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 13:38:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241800AbiCDSiI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 13:38:08 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 963911D67C6
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 10:37:19 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id s1so11829134edd.13
        for <linux-usb@vger.kernel.org>; Fri, 04 Mar 2022 10:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=mGk3B+K5X2U3dvLx49arF2t8VsVYc/Id6UewkzTupAo=;
        b=e2qFauSTQG/Loa6Oix2tFUduzULhvcwiVp79xPGKWN6L/ilCJ9l+/eBUPaqQTcfysf
         O1SnQkIGxeTRPC8GCDd5LasU4WLq190RqZeESWliMvfkjtofDAHR3k6IagXREs/r18UW
         DqrUtZH3cl8mL5oCa5zHjN9FA6rF+nOlNbz1T9J4Z5wQWIpfI49zjxp/HIOdwNehx8bb
         EGuCoobOoAz1BFhMHKzMxE3qKdIo550uRMMjKQRsxFjWnO7sRP2RQAHtfLIhJWXEGR7y
         UJhYsEcZD24kEFIPMybPNRVKlxfRFmXq4Vn6W4AfOp1tiusHQN8EQeNyHCWS5iyFxvyv
         hwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=mGk3B+K5X2U3dvLx49arF2t8VsVYc/Id6UewkzTupAo=;
        b=m8qN2KHdIM9XL+78ivk+uWY44DJsbOctoK7uPT9w0pAAINUCQ9mgu3jRMDCbT69vjI
         Eokycnvh8jxZcjfe4KL+SCEtYlaQk86BgRNXE4D8h/zyZS6OAKNxoOmPDY47ggR1u8wo
         cECQIcMtNG1VEccQagxM0yQ+ElMytEaFm7dEJ8q2NNWUkEU/e9ww6TDlYPGIurguDhtY
         cdJii/Y54UXwomiTHlY4d/wE/OdoVJE/omW2E4PUnjWogqOSeYmESM60uoSKJR3401Zu
         2rohJr39oGFfmVOVPMe7C0S4Z032HcPEQx4mrZodmqewK5b1NcBsLKy8ut0dEb8tNid8
         iT5Q==
X-Gm-Message-State: AOAM532gmQtcMsjDcM4CRXWR2Xkz7BxDKFlWfMzAbXcvXjJEAtgBL1Sw
        J3jafN9HPJrxGU+InamoCRJhMGJ3D6s=
X-Google-Smtp-Source: ABdhPJzYMYDDT5Ov/FZHvyxLPinCXEOOwQE5zvU6h91XO1oiBb6BS0hplIqImKaO9CUthAy2Ho5Fcw==
X-Received: by 2002:a05:6402:270a:b0:410:63d:a66d with SMTP id y10-20020a056402270a00b00410063da66dmr40653526edd.48.1646419038088;
        Fri, 04 Mar 2022 10:37:18 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9fb:2800:c56d:9b34:f61c:e318? (dynamic-2a01-0c23-b9fb-2800-c56d-9b34-f61c-e318.c23.pool.telefonica.de. [2a01:c23:b9fb:2800:c56d:9b34:f61c:e318])
        by smtp.googlemail.com with ESMTPSA id r11-20020aa7cfcb000000b00412c58c43ccsm2434601edy.37.2022.03.04.10.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Mar 2022 10:37:17 -0800 (PST)
Message-ID: <816c881a-dca4-7730-54b5-85cc640ea88e@gmail.com>
Date:   Fri, 4 Mar 2022 19:35:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 2/5] xhci: factor out parts of xhci_gen_setup()
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
References: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
In-Reply-To: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
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
index a1c781f70..824b833ae 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5195,6 +5195,57 @@ static int xhci_get_frame(struct usb_hcd *hcd)
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
@@ -5203,7 +5254,6 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	 * quirks
 	 */
 	struct device		*dev = hcd->self.sysdev;
-	unsigned int		minor_rev;
 	int			retval;
 
 	/* Accept arbitrarily long scatter-gather lists */
@@ -5218,60 +5268,14 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
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



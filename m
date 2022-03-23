Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE5044E5B3B
	for <lists+linux-usb@lfdr.de>; Wed, 23 Mar 2022 23:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344480AbiCWW0S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Mar 2022 18:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345234AbiCWW0R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Mar 2022 18:26:17 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C37A8FE54
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 15:24:46 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id u3so3869107ljd.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=9rkG7WcnwMrwtSbSTNjbzfaDimXYJol6aLhdNQP/ujo=;
        b=PO6sZyheQspi6iHP8hrYDsjC2Py9SoGU4VzmUt04VpS09ePjF8TfJXAnPmkpVLYYhi
         8YDcFqTI4fTh/uDJB9wSEJIqwy0nHxzOzalVcwKSFmwJnsYwvbDFYAhnMoimqF8WMvr7
         gU1oTX6qGI/Hc7Ys3Y8FnGqcpqYrG5ejcJXyuJv1mkdBJhKa6jPTY9poV4Q5xkRCr1N8
         37tEhPRs2/c32susMBh6GT2Q3s2VAXhuel6mXIVexYdMQUSImKoxfYPhX/DejDIyVWHZ
         56vsTUW3pGwPUqg4e+YegZcdyWGoRTs8yFKp/zxnC+CV0fsGfrzEDr5uTWOXO8obnKaS
         CAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=9rkG7WcnwMrwtSbSTNjbzfaDimXYJol6aLhdNQP/ujo=;
        b=Zd+9sNVySzRmrg3HAZndT/v6vYufyLtIVP/hmheErQhNg+rTQGpkG83HtUAG7+NfjI
         TOPKt67WwprXFAcuESdfydnqxFMCT6dPP8PPZaJZqGFRw4IMNSnwoAwEgY5/+7Yyjw10
         g4S4HW3TH7+sBPR7K39TN3iOyC9caQMJRKIsf+SGqd12i2oVXrV1ypDJrN+OYFJqIy2P
         IW61EFNwVlj0GgtR2Anwkv3bfcnaIRxyfFb2IP4ziuVCydJhTQlMTQcTh/vWyLxOdCiI
         W0NAqzagnXb6sxRouSWZD8rdWRwzigkhwGWcWoZZJhm9AmPtFmlrFPgbwbx509feE1K/
         M5Ug==
X-Gm-Message-State: AOAM533TCN5JeiUOcOTRd63kw0cXcw6czRsuCcq+zv2SlIT2oLmYB1QP
        k8T4r7N1//igmWRYSECliT0I71Phqk2xs8kc
X-Google-Smtp-Source: ABdhPJxvOKqNHrrpia+4z8lz8540IIVX2zKhJ5Gpu6cZPEOECFvXXD9yuW67TnTcDte4hkqSHBVxfg==
X-Received: by 2002:a2e:ba15:0:b0:247:d9d3:a937 with SMTP id p21-20020a2eba15000000b00247d9d3a937mr1761362lja.233.1648074284126;
        Wed, 23 Mar 2022 15:24:44 -0700 (PDT)
Received: from reki (broadband-95-84-198-152.ip.moscow.rt.ru. [95.84.198.152])
        by smtp.gmail.com with ESMTPSA id y17-20020a2e95d1000000b002463d2595f0sm123602ljh.135.2022.03.23.15.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 15:24:43 -0700 (PDT)
Date:   Thu, 24 Mar 2022 01:24:39 +0300
From:   Maxim Devaev <mdevaev@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, hminas@synopsys.com
Subject: usb: dwc2: Problem with remote wakeup implementation
Message-ID: <20220324012439.65ef4823@reki>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello. I'm trying to implement remote wakeup signalling for dwc2.
The dwc3 driver in gadget mode has the ability to send a remote
wakeup signal to the host by writing 1 to the srp file:

echo 1 > /sys/class/udc/XXX/srp

My naive implementation was able to wake up the host on 5.10 kernel,
but it's not working anymore on 5.15, it's just does nothing now.
I tried to roll back all the changes in drivers/usb/dwc2 to the 5.10,
but it didn't help.

I don't have any DesignWare documentation, so I hope someone
can help me to make it work in the right way.

I will be very grateful.


diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 3146df6e6510..c64e573af7ca 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4683,6 +4683,52 @@ static int dwc2_hsotg_vbus_draw(struct usb_gadget *gadget, unsigned int mA)
 	return usb_phy_set_power(hsotg->uphy, mA);
 }
 
+/**
+ * dwc2_hsotg_wakeup - send wakeup signal to the host
+ * @gadget: The usb gadget state
+ *
+ * If the gadget is in device mode and in the L1 or L2 state,
+ * it sends a wakeup signal to the host.
+ */
+static int dwc2_hsotg_wakeup(struct usb_gadget *gadget)
+{
+	struct dwc2_hsotg *hsotg = to_hsotg(gadget);
+	int ret = -1;
+	unsigned long flags;
+
+	spin_lock_irqsave(&hsotg->lock, flags);
+
+	if (!hsotg->remote_wakeup_allowed) {
+		dev_dbg(hsotg->dev,
+			"wakeup signalling skipped: is not allowed by host\n");
+		goto skip;
+	}
+	if (hsotg->lx_state != DWC2_L1 && hsotg->lx_state != DWC2_L2) {
+		dev_dbg(hsotg->dev,
+			"wakeup signalling skipped: gadget not in L1/L2 state\n");
+		goto skip;
+	}
+	if (!dwc2_is_device_mode(hsotg)) {
+		dev_dbg(hsotg->dev,
+			"wakeup signalling skipped: gadget not in device mode\n");
+		goto skip;
+	}
+
+	dev_dbg(hsotg->dev, "sending wakeup signal to the host");
+
+	dwc2_set_bit(hsotg, DCTL, DCTL_RMTWKUPSIG);
+	mdelay(10);
+	dwc2_clear_bit(hsotg, DCTL, DCTL_RMTWKUPSIG);
+
+	/* After the signalling, the USB core wakes up to L0 */
+	hsotg->lx_state = DWC2_L0;
+
+	ret = 0;
+skip:
+	spin_unlock_irqrestore(&hsotg->lock, flags);
+	return ret;
+}
+
 static const struct usb_gadget_ops dwc2_hsotg_gadget_ops = {
 	.get_frame	= dwc2_hsotg_gadget_getframe,
 	.set_selfpowered	= dwc2_hsotg_set_selfpowered,
@@ -4691,6 +4737,7 @@ static const struct usb_gadget_ops dwc2_hsotg_gadget_ops = {
 	.pullup                 = dwc2_hsotg_pullup,
 	.vbus_session		= dwc2_hsotg_vbus_session,
 	.vbus_draw		= dwc2_hsotg_vbus_draw,
+	.wakeup			= dwc2_hsotg_wakeup,
 };
 
 /**



Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB045956DF
	for <lists+linux-usb@lfdr.de>; Tue, 16 Aug 2022 11:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233902AbiHPJod (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Aug 2022 05:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233909AbiHPJn4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Aug 2022 05:43:56 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C5C1FCD3
        for <linux-usb@vger.kernel.org>; Tue, 16 Aug 2022 01:39:06 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-333f0d49585so8989507b3.9
        for <linux-usb@vger.kernel.org>; Tue, 16 Aug 2022 01:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=qW4FpPn+3U6rWBjf7f7ZHOYJOIjzLtnGkLPoxDCEiqo=;
        b=PcLu0Pjn7hJcarJlBUUfD59TZO6YllkuNLqEkpOvYOBrZiRYizQWXRTIWEsPSKaB/b
         h05wxNQy+Y/vuxoIQd8q0jesq9TRfz2hDHPWW4l8SmNYJGUQE5pNOY6KNh2sQvafro2x
         naxUGO/uIcR+Kk6Co3VJCXd7NtA+lvj+SFYxw/KculVDjhcKNxFWCrVITzM/240ghQrc
         DTpXdF2hEccRuwMu/1ngAGcpLPcsWd1TDlk+UNkoTh4K13o7XUZ/xfELjbRnZR92nnn6
         saPDPi1CyZSJYq9Tq8Wt+dnb78SKxmFZqk6K8EvHyU+F5Id12rvafFRDhkQTLjyp96nU
         msqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=qW4FpPn+3U6rWBjf7f7ZHOYJOIjzLtnGkLPoxDCEiqo=;
        b=i9B0URB6zqMnqAOLy6d1LXRRna1ymcCxCTAaJiXHWEOW9EHJASQKXLgJLXNKa19BWD
         5XRJRfRfdfWgB/IB4LI06OMkLclYWxYLU5MXDKNCU4UAkHhZd3OqHAh4wtXOqcloSMOo
         m8+MQHbMMSnphL2B0xbXLnJoHeTUB3+giBrf43ifcfcso4wMoP40SxMayzLpOeefX4ci
         dh77dhFUgWsphbx+UGfMouCe7Z8ZLik+rhK4ln0sW9iR4tI0UuQbqUvmpg1aPIlWxVmd
         421WWmhgwc1SPAllqWPu5kxvzxE6sg5HBaq5Dat1EYt2TekQ5jveG4hFLMM34u145+Sg
         W4Ww==
X-Gm-Message-State: ACgBeo0fXe3lDBuV0t2AclO1clq1BvulK0F8ESMY6o+uHyZTRcN+TgBx
        pLX1/4v9cxNJnZtZMA+SkzGIC1P4mDw=
X-Google-Smtp-Source: AA6agR5THf29zvJ3EExhdVRpGCeWm8v3qH+6f6RsLDJEdTyDlC+jve0nJf4SN1Yr9fHCyeLFWEXEilhrMqs=
X-Received: from raychi.tao.corp.google.com ([2401:fa00:fc:202:5bfb:2ce6:1e1b:f496])
 (user=raychi job=sendgmr) by 2002:a81:8414:0:b0:323:e952:eb8a with SMTP id
 u20-20020a818414000000b00323e952eb8amr16321867ywf.103.1660639146073; Tue, 16
 Aug 2022 01:39:06 -0700 (PDT)
Date:   Tue, 16 Aug 2022 16:38:53 +0800
In-Reply-To: <20220816083854.1491886-1-raychi@google.com>
Message-Id: <20220816083854.1491886-2-raychi@google.com>
Mime-Version: 1.0
References: <20220816083854.1491886-1-raychi@google.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH 1/2] usb: core: add a hook to check port init status
From:   Ray Chi <raychi@google.com>
To:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        stern@rowland.harvard.edu
Cc:     badhri@google.com, albertccwang@google.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ray Chi <raychi@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch add a hook to check the port init status. Currently, only
usbcore knows port init status even if the result is bad. It will cause
a USB host keep doing USB enumeration for a long time when the USB host
connects to a broken USB accessory.

The hc_driver could use the hook to know port init status and do possible
error handling according to platform requirements or limitations.

Signed-off-by: Ray Chi <raychi@google.com>
---
 drivers/usb/core/hub.c  | 14 ++++++++++++++
 include/linux/usb/hcd.h |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 2633acde7ac1..6ce6092816cb 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -4659,6 +4659,16 @@ static int hub_enable_device(struct usb_device *udev)
 	return hcd->driver->enable_device(hcd, udev);
 }
 
+static int hub_port_check_init_status(struct usb_device *udev, int r)
+{
+	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
+
+	if (!hcd->driver->check_init_status)
+		return 0;
+
+	return hcd->driver->check_init_status(hcd, udev, r);
+}
+
 /* Reset device, (re)assign address, get device descriptor.
  * Device connection must be stable, no more debouncing needed.
  * Returns device in USB_STATE_ADDRESS, except on error.
@@ -4855,6 +4865,10 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 					buf->bMaxPacketSize0;
 			kfree(buf);
 
+			retval = hub_port_check_init_status(udev, r);
+			if (retval < 0)
+				goto fail;
+
 			retval = hub_port_reset(hub, port1, udev, delay, false);
 			if (retval < 0)		/* error or disconnect */
 				goto fail;
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 67f8713d3fa3..8fa30b4a6b7d 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -297,6 +297,14 @@ struct hc_driver {
 				   gfp_t mem_flags);
 	void    (*unmap_urb_for_dma)(struct usb_hcd *hcd, struct urb *urb);
 
+	/*
+	 * (optional) HCD could get the information of GET_DESCRIPTOR by this hook.
+	 * In general, it is not necessary unless the enumeration takes long
+	 * time to do. The host controller could know the enumeration status by
+	 * this hook and do some error handlings.
+	 */
+	int	(*check_init_status)(struct usb_hcd *hcd, struct usb_device *udev, int r);
+
 	/* hw synch, freeing endpoint resources that urb_dequeue can't */
 	void	(*endpoint_disable)(struct usb_hcd *hcd,
 			struct usb_host_endpoint *ep);
-- 
2.37.1.595.g718a3a8f04-goog


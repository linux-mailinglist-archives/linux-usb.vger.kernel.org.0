Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B84F53F49FF
	for <lists+linux-usb@lfdr.de>; Mon, 23 Aug 2021 13:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236494AbhHWLqk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Aug 2021 07:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236269AbhHWLqi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Aug 2021 07:46:38 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17997C061575
        for <linux-usb@vger.kernel.org>; Mon, 23 Aug 2021 04:45:56 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id a15so21375392iot.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Aug 2021 04:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=KJu/I1cZp2hC204Cwit5TZ7RvFYdkED6XXclTII8e/U=;
        b=KTrZFeSfxh0R65dwRhmBdQ1BiZ2NPD3+O4mbaJ2suoiZ9W0rRfHBNFSvQw0qeVNf51
         vcdCtO+lSovjbhWy5/gz+KqunXmM8Rm454WnZ06iO8Bd2YRMJtI9NgntYpvc1y0GTvNX
         sB84AwR03R8aLszKnKJAvFm+hZxzXAbVeepfx8oSAMYlmAzSOknOL6Si4TEcr7dGH+uZ
         BH/otIzKIUb5pAj24bUG8nO8RuQE46SFnUvNpDYPpJih6RPBkqIEh1qDlWgxFEpPIzh7
         W8gX+cfF5TjEKbRdfGMvx9EjVYH+qtT92c1lFJeZL8o5qX0qKN4Xm2JXaKdXE149Diig
         sVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=KJu/I1cZp2hC204Cwit5TZ7RvFYdkED6XXclTII8e/U=;
        b=K02mlUqdvUnTjcKHS2v0FhrQP8vlNiy6ios3iAfESfc5Lcaegh1JziG5veFuA/CClv
         UF3YZ59xT+BCB8oJ1s+PLpxMcZmQYgQrdsAI2URb+OjgN3yhGwliNPJYJRgnsX9EgSWk
         Hpd9SCe1Eo7mZpB1YHS04LyEcEvh3vzrwD4xyV2Tm9oSkpSVHAGAhWsuIu/C6yd2sS4j
         2b3dGUhIWHN5MOv1MtjtczvD570VwuUhEgMzk4qsNOlPoVhogb/3n8YnchIeYDpUdiZF
         f4W2NL7gV1WxEKdFWm3dvCqzMteV5dma+AyvxnPRAyxZfcKa+9wYRnSNvtqhvixH/9iT
         VKrQ==
X-Gm-Message-State: AOAM5315fRhAcuBYakuHMu3GIsWbr/ZC4cKGJ6iY0ThH2dv6iKcACsG7
        B8xaYjp/Oy+KpKGofQx59Z9Y2YQioPtEcvJ0NlUo5ZDsHQ==
X-Google-Smtp-Source: ABdhPJyfkssTh+LGNbISLSiter4RV10Hzv3w2RBXrQPIfkkDystYweKw2B3R62rJ/HFM3MsH176+19T0IUnTi+ozsWo=
X-Received: by 2002:a6b:e90c:: with SMTP id u12mr24547872iof.95.1629719153108;
 Mon, 23 Aug 2021 04:45:53 -0700 (PDT)
MIME-Version: 1.0
From:   "N. Chen" <takhv1@gmail.com>
Date:   Mon, 23 Aug 2021 14:45:42 +0300
Message-ID: <CADA1JhOe89Q7iQtb7vwK6utigpKfo+UfuW6o2GdMBMo5rAz7=A@mail.gmail.com>
Subject: uac2/hid gadget issues on Win10 hosts
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I'm attempting to create a composite gadget device that uses uac2 and
hid functions (speakerphone), using the latest kernel branch
(rpi-5.14.y) on a rpi4 device.
Windows10 host does not recognize the device as an audio usb device.
In order to get it recognized, I had to use c_sync in adaptive mode,
as well as make the following adjustments:

diff --git a/drivers/usb/gadget/function/f_uac2.c
b/drivers/usb/gadget/function/f_uac2.c
index ae29ff2b2b68..74a221939ca0 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -177,7 +177,7 @@ static struct uac2_input_terminal_descriptor
io_in_it_desc = {

        .bDescriptorSubtype = UAC_INPUT_TERMINAL,
        /* .bTerminalID = DYNAMIC */
-       .wTerminalType = cpu_to_le16(UAC_INPUT_TERMINAL_UNDEFINED),
+       .wTerminalType = cpu_to_le16(UAC_INPUT_TERMINAL_MICROPHONE),
        .bAssocTerminal = 0,
        /* .bCSourceID = DYNAMIC */
        .iChannelNames = 0,
@@ -205,7 +205,7 @@ static struct uac2_output_terminal_descriptor
io_out_ot_desc = {

        .bDescriptorSubtype = UAC_OUTPUT_TERMINAL,
        /* .bTerminalID = DYNAMIC */
-       .wTerminalType = cpu_to_le16(UAC_OUTPUT_TERMINAL_UNDEFINED),
+       .wTerminalType = cpu_to_le16(UAC_OUTPUT_TERMINAL_SPEAKER),
        .bAssocTerminal = 0,
        /* .bSourceID = DYNAMIC */
        /* .bCSourceID = DYNAMIC */
@@ -216,7 +216,7 @@ static struct uac2_ac_header_descriptor ac_hdr_desc = {
        .bLength = sizeof ac_hdr_desc,
        .bDescriptorType = USB_DT_CS_INTERFACE,

-       .bDescriptorSubtype = UAC_MS_HEADER,
+       .bDescriptorSubtype = UAC_HEADER,
        .bcdADC = cpu_to_le16(0x200),
        .bCategory = UAC2_FUNCTION_IO_BOX,
        /* .wTotalLength = DYNAMIC */
@@ -400,7 +400,7 @@ static struct usb_endpoint_descriptor fs_epin_desc = {
        .bDescriptorType = USB_DT_ENDPOINT,

        .bEndpointAddress = USB_DIR_IN,
-       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
+       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_SYNC,
        /* .wMaxPacketSize = DYNAMIC */
        .bInterval = 1,
 };
@@ -409,7 +409,7 @@ static struct usb_endpoint_descriptor hs_epin_desc = {
        .bLength = USB_DT_ENDPOINT_SIZE,
        .bDescriptorType = USB_DT_ENDPOINT,

-       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
+       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_SYNC,
        /* .wMaxPacketSize = DYNAMIC */
        .bInterval = 4,
 };
@@ -419,7 +419,7 @@ static struct usb_endpoint_descriptor ss_epin_desc = {
        .bDescriptorType = USB_DT_ENDPOINT,

        .bEndpointAddress = USB_DIR_IN,
-       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
+       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_SYNC,
        /* .wMaxPacketSize = DYNAMIC */
        .bInterval = 4,
 };
--

For the hid function report descriptor, I used the telephony led page
with off-hook, mute and ring. I was not able to get any hid packets
when tested using Teams. I made the following change, and it allowed
me to get the ring hid alone, but not the led and the off-hook, so I
guess this hack is incorrect:

diff --git a/drivers/usb/gadget/function/f_hid.c
b/drivers/usb/gadget/function/f_hid.c
index bb476e121eae..10882e18cb88 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -549,7 +549,9 @@ static int hidg_setup(struct usb_function *f,
        case ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
                  | HID_REQ_SET_REPORT):
                VDBG(cdev, "set_report | wLength=%d\n", ctrl->wLength);
-               goto stall;
+               req->context  = hidg;
+               req->complete = hidg_set_report_complete;
+               goto respond;
                break;

        case ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
--

I'm aware that the aforementioned changes to uac2 function might be
incorrect as well, but it allowed me to get through the first hurdle.
I have no objections to making it more correct.
I especially value an opinion on this matter from someone that has
worked with Windows10 hosts before, as it is a specific issue with
this OS (it works well for Ubuntu hosts, yet to be tested on Macs).

Thanks,
Tak

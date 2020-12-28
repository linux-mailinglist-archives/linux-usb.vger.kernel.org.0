Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999162E6791
	for <lists+linux-usb@lfdr.de>; Mon, 28 Dec 2020 17:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441808AbgL1Q0m convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 28 Dec 2020 11:26:42 -0500
Received: from mail.msweet.org ([173.255.209.91]:54776 "EHLO mail.msweet.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730998AbgL1Q0B (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Dec 2020 11:26:01 -0500
Received: from [10.0.1.64] (host-148-170-144-200.public.eastlink.ca [148.170.144.200])
        by mail.msweet.org (Postfix) with ESMTPSA id 5528281BF3;
        Mon, 28 Dec 2020 16:25:20 +0000 (UTC)
From:   Michael Sweet <msweet@msweet.org>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: [PATCH] USB printer gadget (usb_f_printer) to use default q_len value
Message-Id: <38D8A36C-BD7B-4072-B608-D5E36D8523E2@msweet.org>
Date:   Mon, 28 Dec 2020 11:25:18 -0500
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[Resending as requested]

Hi,

I've been doing some work on Linux-based printer firmware lately (https://www.msweet.org/pappl) and part of that includes support for USB printer gadgets - right now the legacy printer class 1/2 stuff, but soon class 4 IPP-USB.  Since I also want to support functions other than printing (serial for debugging, mass storage for access to SD cards, etc.) I've been working to configure the printer gadget using configfs. After spending a few days puzzling over why the legacy g_printer gadget worked but usb_f_printer didn't I discovered that the default q_len value for the new driver is *0*, which prevents any IO from occurring!  Moreover, once you've configured things and assigned the UDC it is basically impossible to change q_len, so if your Linux distro of choice does any "helpful" initialization for you then you are out of luck...

The following patch uses a default q_len value of 10 (which is what the legacy g_printer driver uses) to minimize the possibility that you end up with a non-working printer gadget.


diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 9c7ed2539ff7..4f3161005e4f 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -50,6 +50,8 @@
#define GET_PORT_STATUS		1
#define SOFT_RESET		2

+#define DEFAULT_Q_LEN		10 /* same as legacy g_printer gadget */
+
static int major, minors;
static struct class *usb_gadget_class;
static DEFINE_IDA(printer_ida);
@@ -1317,6 +1319,9 @@ static struct usb_function_instance *gprinter_alloc_inst(void)
	opts->func_inst.free_func_inst = gprinter_free_inst;
	ret = &opts->func_inst;

+	/* Make sure q_len is initialized, otherwise the bound device can't support read/write! */
+	opts->q_len = DEFAULT_Q_LEN;
+
	mutex_lock(&printer_ida_lock);

	if (ida_is_empty(&printer_ida)) {


________________________
Michael Sweet




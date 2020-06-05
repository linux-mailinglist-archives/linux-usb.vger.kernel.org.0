Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 072531EF643
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jun 2020 13:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgFELOB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jun 2020 07:14:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:39466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726225AbgFELOB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jun 2020 07:14:01 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D83A8206DC;
        Fri,  5 Jun 2020 11:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591355640;
        bh=B56LkDT4uadJJKK5s7dfdxW9sDk/65KFLSL2vl69z84=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=W0icm60zqzChdi2FXyl936ylO6vjnZP25qR8lZoNXpg22I4VZq4tuuyIE3ArajHmy
         Fp3fk9t1dg46Dvlsb/G7DKoeHbQ9NteMjwEeEtDvTDEuzMP3TWEORIdS2KA1C0TVF3
         kkasIVNk8XXgBvAMyY7Ugk+46S6OY3LbxUbLsmH8=
Date:   Fri, 5 Jun 2020 13:13:55 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     mani@kernel.org
Cc:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        patong.mxl@gmail.com
Subject: Re: [PATCH v3 0/2] Add support for MaxLinear/Exar USB to serial
 converters
Message-ID: <20200605131355.18107dbb@coco.lan>
In-Reply-To: <20200430184924.31690-1-mani@kernel.org>
References: <20200430184924.31690-1-mani@kernel.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Em Fri,  1 May 2020 00:19:22 +0530
mani@kernel.org escreveu:

> From: Manivannan Sadhasivam <mani@kernel.org>
> 
> Hello,
> 
> This series adds support for MaxLinear/Exar USB to serial converters.
> This driver only supports XR21V141X series but it can easily be extended
> to other series in future.
> 
> This driver is inspired from the initial one submitted by Patong Yang:
> 
> https://patchwork.kernel.org/patch/10543261/
> 
> While the initial driver was a custom tty USB driver exposing whole
> new serial interface ttyXRUSBn, this version is completely based on USB
> serial core thus exposing the interfaces as ttyUSBn. This will avoid
> the overhead of exposing a new USB serial interface which the userspace
> tools are unaware of.

Hmm... I guess you also need the enclosed patch, to ensure that cdc_acm
won't try to hijack it, when the Kernel is built with both drivers.

Thanks,
Mauro

[PATCH] usb: cdc-acm: ignore Exar XR21V141X when serial driver is
 built

The RTS/CTS line discipline for this device doesn't follow
the standard. So, in order to properly support TX, a separate
driver is needed.

Ensure that cdc_acm will ignore it during probe time, if the
Kernel is built with support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index ded8d93834ca..f87288834ded 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1889,7 +1889,11 @@ static const struct usb_device_id acm_ids[] = {
 	.driver_info = IGNORE_DEVICE,
 	},
 #endif
-
+#if IS_ENABLED(CONFIG_USB_SERIAL_XR)
+	{ USB_DEVICE(0x04e2, 0x1410),   /* XR21V141X uses a different rts/cts discipline */
+	.driver_info = IGNORE_DEVICE,
+	},
+#endif
 	/*Samsung phone in firmware update mode */
 	{ USB_DEVICE(0x04e8, 0x685d),
 	.driver_info = IGNORE_DEVICE,


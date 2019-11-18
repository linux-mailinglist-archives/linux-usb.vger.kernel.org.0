Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF956100112
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 10:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfKRJVW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 04:21:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:33826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726460AbfKRJVW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Nov 2019 04:21:22 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 70D8620692;
        Mon, 18 Nov 2019 09:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574068882;
        bh=MoFFydwu/grMmA0oEyrFodrQP1vzKcnb7EsrZaec0sY=;
        h=Date:From:To:Cc:Subject:From;
        b=NCu59VMyACDBuXEtQLrYWULn7F0XIB6OJShxzoY0pknzytEnUffJdBcf+nQulIuNj
         p9sl3YnBNX0k6MYlzNrShQfn5IBJnFiRVuy54j5quVCMd21SznUhqDZhszBae2XS2m
         1vDkTXgD4qxDleAMhVHNuY7LX1qos63q7VzjW308=
Date:   Mon, 18 Nov 2019 10:21:19 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Joel Jennings <joel.jennings@makeitlabs.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb-serial: cp201x: support Mark-10 digital force gauge
Message-ID: <20191118092119.GA153852@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for the Mark-10 digital force gauge device to the cp201x
driver.

Based on a report and a larger patch from Joel Jennings

Reported-by: Joel Jennings <joel.jennings@makeitlabs.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable <stable@vger.kernel.org>
---

Johan, I can queue this up in my tree directly if you want me to, so as to get
into the larger 5.5-rc1 merge if that's ok with you.

thanks,

greg k-h

--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -125,6 +125,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x10C4, 0x8341) }, /* Siemens MC35PU GPRS Modem */
 	{ USB_DEVICE(0x10C4, 0x8382) }, /* Cygnal Integrated Products, Inc. */
 	{ USB_DEVICE(0x10C4, 0x83A8) }, /* Amber Wireless AMB2560 */
+	{ USB_DEVICE(0x10C4, 0x83AA) }, /* Mark-10 Digital Force Gauge */
 	{ USB_DEVICE(0x10C4, 0x83D8) }, /* DekTec DTA Plus VHF/UHF Booster/Attenuator */
 	{ USB_DEVICE(0x10C4, 0x8411) }, /* Kyocera GPS Module */
 	{ USB_DEVICE(0x10C4, 0x8418) }, /* IRZ Automation Teleport SG-10 GSM/GPRS Modem */

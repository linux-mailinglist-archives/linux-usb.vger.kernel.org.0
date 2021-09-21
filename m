Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5424134A1
	for <lists+linux-usb@lfdr.de>; Tue, 21 Sep 2021 15:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233401AbhIUNoC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Sep 2021 09:44:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:58750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233448AbhIUNoB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Sep 2021 09:44:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4A5061159;
        Tue, 21 Sep 2021 13:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632231752;
        bh=+vkRjBOB4stl7U6W0aJJppigkyRk9cK3TtGppMIE0mA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dvzaRC3ayM2AuFzkIjGNuyWKThk7MX+VfQB2hTaFE8jP3GPKobYUyHcZWMVE9PMKN
         SA46OC2VTF2+394cnDznvnvvluigl0NoowC/4+WumonkBe6F+w+HBRtxpwX7Q6x8zq
         M+r+mcBL5yOZukgq2zGkL1mobaszK93yVyj+sjf9mFjjHOmSvvsdcpbZCMRxeG5mVn
         QPlTV1gW+pEo3S5YlqOQrtX6VWAA0wCtE5xPsnTaH/8LzYRVCo0rne3kP/NrKv8zSQ
         UIDXC1Ndv9Etf5sfomxqT2rXm2LVoHoxxDrzONqAhCA+/WqEEUNFSWJMbNsGwHRbDs
         gxEOlXuN2UXnA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mSg2Z-0003fQ-At; Tue, 21 Sep 2021 15:42:31 +0200
Date:   Tue, 21 Sep 2021 15:42:31 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Uwe Brandt <uwe.brandt@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: cp210x: add ID for GW Instek GDM-834x
 Digital Multimeter
Message-ID: <YUnhR/L8XOmWLFUQ@hovoldconsulting.com>
References: <CAPui18kK+MCv1uO8h3es3rpZdzztukJVh+3oub9H+53ncp-Usw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPui18kK+MCv1uO8h3es3rpZdzztukJVh+3oub9H+53ncp-Usw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 21, 2021 at 01:41:40PM +0200, Uwe Brandt wrote:
> Hi Johan,
> 
> included is a patch to make the GW Instek GDM-834x Multimeter accessible
> via ttyUSBx
> https://www.gwinstek.com/en-global/products/detail/GDM-8342_GDM-8341
> 
> lsusb output:
> Bus 001 Device 002: ID 2184:0030 GW Instek GDM834X VCP PORT
> 
> dmesg output:
> [ 1102.650572] usb 1-2: cp210x converter now attached to ttyUSB0
> 
> patch:
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index f5143eedbc..38f2b6be24 100644
> --- a/drivers/usb/serial/cp210x.c
> +++ b/drivers/usb/serial/cp210x.c
> @@ -228,6 +228,7 @@ static const struct usb_device_id id_table[] = {
>        { USB_DEVICE(0x1FB9, 0x0602) }, /* Lake Shore Model 648 Magnet Power
> Supply */
>        { USB_DEVICE(0x1FB9, 0x0700) }, /* Lake Shore Model 737 VSM
> Controller */
>        { USB_DEVICE(0x1FB9, 0x0701) }, /* Lake Shore Model 776 Hall Matrix
> */
> +       { USB_DEVICE(0x2184, 0x0030) }, /* GW Instek GDM-834x Digital
> Multimeter */
>        { USB_DEVICE(0x2626, 0xEA60) }, /* Aruba Networks 7xxx USB Serial
> Console */
>        { USB_DEVICE(0x3195, 0xF190) }, /* Link Instruments MSO-19 */
>        { USB_DEVICE(0x3195, 0xF280) }, /* Link Instruments MSO-28 */

Thanks for the patch. Patch Subject and content looks good, but the
formatting needs a little work.

First, anything you put in the body goes in the commit message so
greetings, etc. should go below a --- line before the diff.

Second, the diff appears to be whitespace damaged (tabs replaced by
spaces), possibly by your mail client. Try sending the patch to yourself
first and make sure you can apply it with git-am. Also have a look at
git-format-patch and git-send-email.

Third, you need to sign-off on your patches. More details can be found
here:

	Documentation/process/submitting-patches.rst

Here's an example of what a patch adding a device-id could look like:

	https://lore.kernel.org/all/20210803194711.3036-1-dnlplm@gmail.com/

Care to send a v2?

Johan

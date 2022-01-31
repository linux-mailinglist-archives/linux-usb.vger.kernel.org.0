Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76AB4A4056
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jan 2022 11:39:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358281AbiAaKjC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jan 2022 05:39:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358276AbiAaKjA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jan 2022 05:39:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68957C061714
        for <linux-usb@vger.kernel.org>; Mon, 31 Jan 2022 02:38:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 25E08B82A43
        for <linux-usb@vger.kernel.org>; Mon, 31 Jan 2022 10:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4AA9C340E8;
        Mon, 31 Jan 2022 10:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643625536;
        bh=LNP8WmI/YQwcqm9kuqpbtVoHNuQPw/nHos07aJ6gSjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bmWOFwJAMPvHQTIvC39kyFlxDtKPUx7pbLEEbdnjBpM91KCl6MK8DwWZ18ZcoBvt/
         JWLfk1rljvYSgReBu/ySp8oPQjwiMdxe8M8XB9AQZssS8NYxewZb/ym0FpBaMB9irL
         dQqjcs//pqa/k3nPd92I5fzqs3YKWVVDEnl6OEBeOB3ySgQw3QSu7zhMs+qXuKnAgX
         hj4+YSzTKUTofSEJZdNdYDkzzqlfCl4YqxtBDn5Y5eQRmUSzmMcbpzRazadpJuddI4
         armYkUOBjdIoYmFhSTU9rtIIN3oU6+7BIOAAEeTrC0XEzj6Z2opWb+uYAsWmFjhSqx
         dgVrwdzaTWLHA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nEU54-0002cB-69; Mon, 31 Jan 2022 11:38:42 +0100
Date:   Mon, 31 Jan 2022 11:38:42 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Stephan Brunner <s.brunner@stephan-brunner.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/1] USB: serial: ch341: Add support for GW Instek
 USB2.0-Serial devices
Message-ID: <Yfe8MlsSjHgrXPuq@hovoldconsulting.com>
References: <1e424713710d318a76b00d9ff40f4005204dd60b.camel@stephan-brunner.net>
 <cover.1641643125.git.s.brunner@stephan-brunner.net>
 <4a47b864-0816-6f6a-efee-aa20e74bcdc6@stephan-brunner.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a47b864-0816-6f6a-efee-aa20e74bcdc6@stephan-brunner.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jan 08, 2022 at 01:00:20PM +0100, Stephan Brunner wrote:
> Programmable lab power supplies made by GW Instek, such as the
> GPP-2323, have a USB port exposing a serial port to control the device.
> 
> Stringing the supplied Windows driver, references to the ch341 chip are
> found. Binding the existing ch341 driver to the VID/PID of the GPP-2323
> ("GW Instek USB2.0-Serial" as per the USB product name) works out of the
> box, communication and control is now possible.
> 
> This patch should work with any GPP series power supply due to
> similarities in the product line.
> 
> Signed-off-by: Stephan Brunner <s.brunner@stephan-brunner.net>
> ---
>  drivers/usb/serial/ch341.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index 29f4b87a9e74..c871fc905140 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -87,6 +87,7 @@ static const struct usb_device_id id_table[] = {
>  	{ USB_DEVICE(0x1a86, 0x7523) },
>  	{ USB_DEVICE(0x4348, 0x5523) },
>  	{ USB_DEVICE(0x9986, 0x7523) },
> +	{ USB_DEVICE(0x2184, 0x0057) }, /* GW Instek USB2.0-Serial */

I dropped the comment (for consistency) and fixed up the sort order when
applying.

>  	{ },
>  };
>  MODULE_DEVICE_TABLE(usb, id_table);

Now applied, thanks.

Johan

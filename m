Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFB4415AAA
	for <lists+linux-usb@lfdr.de>; Thu, 23 Sep 2021 11:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239943AbhIWJQd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Sep 2021 05:16:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:42314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239801AbhIWJQd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Sep 2021 05:16:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B80E61242;
        Thu, 23 Sep 2021 09:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632388502;
        bh=vMYvixEgUWdnWa+2gaNyq7I03Go3AKuf919kIzUDE3g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q9A14e/yyL0c3X2pFSd7BIFo1fYgLMeL1xNr/5NDLyTwAuzTMXS3+IYak4+LmxJzR
         M7ZnrSNntuyKfhrYGNn6emdtPDhPVwvf2jJKrirh/U1ZTTfggF0ljxkUnp2/oiehu7
         l6zuGPrH127iWoW/2D9wu6ayrR7VzgJ3WH2jDI/rJNcko7+dmcoNkK8FOFLGiz0EDP
         9ap+AMX5uAJlB0KNiIaehW/BGHG+HIAODu8yjEWHOpc0MwgrUFDuKnezGfGaCfjC0/
         oaYe7C2IG023QK2kAxXfdtDCVIichCiXADk+del7MpakokYyssOMiMa0GA4AG+l3Ji
         2niWkOSDV4MzQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mTKop-0002Aj-7V; Thu, 23 Sep 2021 11:15:03 +0200
Date:   Thu, 23 Sep 2021 11:15:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     uwe.brandt@post.rwth-aachen.de
Cc:     uwe.brandt@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: cp210x: add ID for GW Instek GDM-834x
 Digital Multimeter
Message-ID: <YUxFl3YUCPGJZd8Y@hovoldconsulting.com>
References: <217af179-c16d-ffe1-d204-3cbd17128dfa@post.rwth-aachen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <217af179-c16d-ffe1-d204-3cbd17128dfa@post.rwth-aachen.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 21, 2021 at 07:54:46PM +0200, Uwe Brandt wrote:
> Add the USB serial device ID for the GW Instek GDM-834x Digital Multimeter
> 
> Signed-off-by: Uwe Brandt <uwe.brandt@gmail.com>
> ---
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

Thanks for the v2, looks good now!

When you switched to sending from the t-online account the commit author
mail address also changed so that it no longer matches the Signed-off-by
address. We generally prefer them to match and tools like
scripts/checkpatch.pl also warns about this.

I changed back the author mail address to you gmail address which you
used in v1 when applying. Let me know if you prefer it the other way
round instead and I'll drop the patch so you can resend.

For next time, git-send-email can usually deal with this by inserting
a From: line at the start of the patch body if configured correctly (or
you can do so manually).

Also note that the second v2 you sent last night appeared to be
whitespace damaged again for some reason (empty lines inserted between
every line). But this one from Tuesday night was fine and I didn't
notice any other differences.

> ---
>   drivers/usb/serial/cp210x.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index 66a6ac50a4..7c6a4f6948 100644
> --- a/drivers/usb/serial/cp210x.c
> +++ b/drivers/usb/serial/cp210x.c
> @@ -233,6 +233,7 @@ static const struct usb_device_id id_table[] = {
>   	{ USB_DEVICE(0x1FB9, 0x0602) }, /* Lake Shore Model 648 Magnet Power Supply */
>   	{ USB_DEVICE(0x1FB9, 0x0700) }, /* Lake Shore Model 737 VSM Controller */
>   	{ USB_DEVICE(0x1FB9, 0x0701) }, /* Lake Shore Model 776 Hall Matrix */
> +	{ USB_DEVICE(0x2184, 0x0030) }, /* GW Instek GDM-834x Digital Multimeter */
>   	{ USB_DEVICE(0x2626, 0xEA60) }, /* Aruba Networks 7xxx USB Serial Console */
>   	{ USB_DEVICE(0x3195, 0xF190) }, /* Link Instruments MSO-19 */
>   	{ USB_DEVICE(0x3195, 0xF280) }, /* Link Instruments MSO-28 */

Now applied.

Johan

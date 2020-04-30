Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C1C1BF153
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 09:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgD3H1G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 03:27:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:39394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726411AbgD3H1G (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Apr 2020 03:27:06 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 55A3C20838;
        Thu, 30 Apr 2020 07:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588231625;
        bh=bOmIYMr+sxB2f9rBSEQip5w8gemuabrKXpI945kMq7c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yKChSJEo8FK6Me++a10PwnT8czvfun7/ZyeiE0c9S/0VyzM/puJiIMvWtTTN44Ols
         tHfVv3cb6RZrJ+7riKVpnu4ByP3BoRa/5tvz55kwHtF4iQaJl4+bYF9Q0ZnkZqH3GL
         Q+EBgoH7s/M3IFWx0ycfUFFBbf4+4OUP2veyWmFM=
Date:   Thu, 30 Apr 2020 09:27:03 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCHv3] UAS: add quirk for LaCie 2Big Quadra
Message-ID: <20200430072703.GA2447382@kroah.com>
References: <20200429155218.7308-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200429155218.7308-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 29, 2020 at 05:52:18PM +0200, Oliver Neukum wrote:
> This device needs US_FL_NO_REPORT_OPCODES to avoid going
> through prolonged error handling on enumeration.
> 
> v2: correct sorting order
> v3: really correct ordering
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Reported-by: Julian Groﬂ <julian.g@posteo.de>
> ---
>  drivers/usb/storage/unusual_uas.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index cfdec74e0f4a..4f4c134f0ffd 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -32,6 +32,14 @@
>   * Apricorn USB3 dongle sometimes returns "USBSUSBSUSBS" in response to SCSI
>   * commands in UAS mode.  Observed with the 1.28 firmware; are there others?
>   */
> +
> +/* Reported-by: Julian Groﬂ <julian.g@posteo.de> */
> +UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
> +		"LaCie",
> +		"2Big Quadra USB3",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_REPORT_OPCODES),
> +

Dude, you need more sleep.  The comment needs to say at the entry for
the Apricorn device below:

>  UNUSUAL_DEV(0x0984, 0x0301, 0x0128, 0x0128,
>  		"Apricorn",
>  		"",

Let me fix this up by hand...


greg k-h

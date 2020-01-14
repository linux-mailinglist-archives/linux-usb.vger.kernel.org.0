Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99D9A13A42E
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 10:48:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729073AbgANJsR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 04:48:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:44656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbgANJsQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jan 2020 04:48:16 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D322324672;
        Tue, 14 Jan 2020 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578995296;
        bh=1tsxNS4ftModIWouK+V8XJz2eklKjlSQ1vE4SAvDOfU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=juXa0SRap6zIxTSRJ6h3BnfgSZPem5mn6AsDHnCKUPVVVG5xHR7XYQzTe0AYPZ7NX
         Tw6CEUsJwqzC0GwwCCkpA1db3d5rZcvyHKouka4ZNn1dFIIRI4XKZRpACKCA+bfHUQ
         Hvc04ZzsbaitACI/E2lWI1gB9pJLCTu2IK1QmqAU=
Date:   Tue, 14 Jan 2020 10:48:13 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v3 2/2] Doc: ABI: add usb charger uevent
Message-ID: <20200114094813.GB1422952@kroah.com>
References: <1578994738-8872-1-git-send-email-peter.chen@nxp.com>
 <1578994738-8872-2-git-send-email-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578994738-8872-2-git-send-email-peter.chen@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 14, 2020 at 05:38:58PM +0800, Peter Chen wrote:
> When the USB charger is inserted or removed, the users could get
> USB charger state and type through the uevent.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> Changes for v3:
> - Change kernel version for 5.6, and delete the kernel printk time
> 
>  Documentation/ABI/testing/usb-charger-uevent | 45 ++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/ABI/testing/usb-charger-uevent
> 
> diff --git a/Documentation/ABI/testing/usb-charger-uevent b/Documentation/ABI/testing/usb-charger-uevent
> new file mode 100644
> index 000000000000..94ab16768e49
> --- /dev/null
> +++ b/Documentation/ABI/testing/usb-charger-uevent
> @@ -0,0 +1,45 @@
> +What:		Raise a uevent when a USB charger is inserted or removed
> +Date:		2020-01-14
> +KernelVersion:	5.6
> +Contact:	linux-usb@vger.kernel.org
> +Description:	There are two USB charger states:
> +		USB_CHARGER_ABSENT
> +		USB_CHARGER_PRESENT
> +		There are five USB charger types:
> +		USB_CHARGER_UNKNOWN_TYPE
> +		USB_CHARGER_SDP_TYPE
> +		USB_CHARGER_CDP_TYPE
> +		USB_CHARGER_DCP_TYPE
> +		USB_CHARGER_ACA_TYPE

Any explaination for what these different types really are?  What is a
"CDP"?  "ACA"?  where would one find that information out?

thanks,

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C361200743
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 12:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732408AbgFSKuy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 06:50:54 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:55419 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732362AbgFSKux (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jun 2020 06:50:53 -0400
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id CC69C1BF208;
        Fri, 19 Jun 2020 10:50:49 +0000 (UTC)
Message-ID: <484c84b62140f6536f841e7027ddd9ddcf179a72.camel@hadess.net>
Subject: Re: [PATCH 1/8] USB: rename USB quirk to USB_QUIRK_ENDPOINT_IGNORE
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Richard Dodd <richard.o.dodd@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jonathan Cox <jonathan@jdcox.net>,
        =?ISO-8859-1?Q?Thi=E9baud?= Weksteen <tweek@google.com>,
        Nishad Kamdar <nishadkamdar@gmail.com>
Date:   Fri, 19 Jun 2020 12:50:49 +0200
In-Reply-To: <20200618094300.1887727-2-gregkh@linuxfoundation.org>
References: <20200618094300.1887727-1-gregkh@linuxfoundation.org>
         <20200618094300.1887727-2-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2020-06-18 at 11:42 +0200, Greg Kroah-Hartman wrote:
> The USB core has a quirk flag to ignore specific endpoints, so rename
> it
> to be more obvious what this quirk does.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Richard Dodd <richard.o.dodd@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Jonathan Cox <jonathan@jdcox.net>
> Cc: Bastien Nocera <hadess@hadess.net>
> Cc: "Thiébaud Weksteen" <tweek@google.com>
> Cc: Nishad Kamdar <nishadkamdar@gmail.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

If the driver API change below is agreeable, you can add my:
Reviewed-by: Bastien Nocera <hadess@hadess.net>

Good job.

<snip>
> diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
> index 22c1f579afe3..5e4c497f54d6 100644
> --- a/include/linux/usb/quirks.h
> +++ b/include/linux/usb/quirks.h
> @@ -69,7 +69,7 @@
>  /* Hub needs extra delay after resetting its port. */
>  #define USB_QUIRK_HUB_SLOW_RESET		BIT(14)
>  
> -/* device has blacklisted endpoints */
> -#define USB_QUIRK_ENDPOINT_BLACKLIST		BIT(15)
> +/* device has endpoints that should be ignored */
> +#define USB_QUIRK_ENDPOINT_IGNORE		BIT(15)
>  
>  #endif /* __LINUX_USB_QUIRKS_H */




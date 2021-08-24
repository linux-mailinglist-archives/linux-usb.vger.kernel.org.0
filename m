Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0305D3F610D
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 16:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237931AbhHXO5C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 10:57:02 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56565 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S237803AbhHXO5C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Aug 2021 10:57:02 -0400
Received: (qmail 158471 invoked by uid 1000); 24 Aug 2021 10:56:17 -0400
Date:   Tue, 24 Aug 2021 10:56:17 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        chris.chiu@canonical.com
Subject: Re: [RFC PATCH 2/5] usb: core: hcd: Let usb_add_hcd() indicate if
 roothub has to be registered
Message-ID: <20210824145617.GA157491@rowland.harvard.edu>
References: <20210824105302.25382-1-kishon@ti.com>
 <20210824105302.25382-3-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824105302.25382-3-kishon@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 24, 2021 at 04:22:59PM +0530, Kishon Vijay Abraham I wrote:
> No functional change. Add __usb_add_hcd() which takes "register_hub"
> flag that indicates if roothub has to be registered or not. This is in
> preparation for allowing xhci to register roothub after the shared hcd
> is created. The interface for usb_add_hcd() is not modified to make sure
> there is no USB subsystem wide changes.
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  drivers/usb/core/hcd.c  | 20 +++++++++++---------
>  include/linux/usb/hcd.h |  8 ++++++--
>  2 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index c036ba5311b3..4d7a9f0e2caa 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2788,13 +2788,14 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
>   * @hcd: the usb_hcd structure to initialize
>   * @irqnum: Interrupt line to allocate
>   * @irqflags: Interrupt type flags
> + * @register_hub: Flag to indicate if roothub has to be registered.
>   *
>   * Finish the remaining parts of generic HCD initialization: allocate the
>   * buffers of consistent memory, register the bus, request the IRQ line,
>   * and call the driver's reset() and start() routines.
>   */
> -int usb_add_hcd(struct usb_hcd *hcd,
> -		unsigned int irqnum, unsigned long irqflags)
> +int __usb_add_hcd(struct usb_hcd *hcd, unsigned int irqnum, unsigned long irqflags,
> +		  bool register_hub)

For future reference: When you change the name of a function, be 
sure to update the name in the kerneldoc comment as well.

Alan Stern

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3CEE400C02
	for <lists+linux-usb@lfdr.de>; Sat,  4 Sep 2021 18:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236807AbhIDQKy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Sep 2021 12:10:54 -0400
Received: from netrider.rowland.org ([192.131.102.5]:60343 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232298AbhIDQKy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Sep 2021 12:10:54 -0400
Received: (qmail 493669 invoked by uid 1000); 4 Sep 2021 12:09:51 -0400
Date:   Sat, 4 Sep 2021 12:09:51 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Florian Faber <faber@faberman.de>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_mass_storage: Shut down mass storage
 device when USB connection is shut, down.
Message-ID: <20210904160951.GA493355@rowland.harvard.edu>
References: <5f9fbabd-2e2c-9389-446d-3bd1dd954a82@faberman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f9fbabd-2e2c-9389-446d-3bd1dd954a82@faberman.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 04, 2021 at 05:32:58PM +0200, Florian Faber wrote:
> f_mass_storage continues to send out packets after the connection to the USB
> host has been terminated, ignoring the error status.

The driver doesn't send packets after the connection has been terminated -- 
that would be impossible.  It may _try_ to send packets, but it can't 
actually send anything unless the hosts asks for the data.  There's nothing 
wrong with trying and failing.

> Signed-off-by: Florian Faber <faber@faberman.de>
> 
> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c
> b/drivers/usb/gadget/function/f_mass_storage.c
> index 6ad669dde41c..1e73ba629e43 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -529,6 +529,10 @@ static int start_transfer(struct fsg_dev *fsg, struct
> usb_ep *ep,
>  		/* We can't do much more than wait for a reset */
>  		req->status = rc;
> 
> +		if (rc==-ESHUTDOWN) {
> +			fsg->common->running = 0;
> +		}
> +

This is wrong because it isn't what common->running means.  common->running 
means that the mass-storage configuration has been set by the host; it has 
nothing to do with whether or not the USB cable is connected.

Also the new code doesn't conform to the kernel's programming style (missing 
spaces around the "==" sign and braces not needed for a single-line 
conditional statement).  And if it were a serious change, it should be 
merged with the conditional statement that follows, which also tests whether 
rc is -ESHUTDOWN.

Alan Stern

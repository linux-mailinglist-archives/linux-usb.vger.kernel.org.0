Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 321DEF04B5
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 19:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390608AbfKESHg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 13:07:36 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:45810 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2388711AbfKESHf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 13:07:35 -0500
Received: (qmail 5754 invoked by uid 2102); 5 Nov 2019 13:07:34 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 5 Nov 2019 13:07:34 -0500
Date:   Tue, 5 Nov 2019 13:07:34 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
cc:     gregkh@linuxfoundation.org, <mathias.nyman@intel.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: Allow USB device to be warm reset in suspended
 state
In-Reply-To: <20191105165447.22608-1-kai.heng.feng@canonical.com>
Message-ID: <Pine.LNX.4.44L0.1911051200570.1678-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 6 Nov 2019, Kai-Heng Feng wrote:

> On Dell WD15 dock, sometimes USB ethernet cannot be detected after plugging
> cable to the ethernet port, the hub and roothub get runtime resumed and
> runtime suspended immediately:
> ...

> ...
> 
> As Mathias pointed out, the hub enters Cold Attach Status state and
> requires a warm reset. However usb_reset_device() bails out early when
> the device is in suspended state, as its callers port_event() and
> hub_event() don't always resume the device.
> 
> Since there's nothing wrong to reset a suspended device, allow
> usb_reset_device() to do so to solve the issue.

I was sure I remembered reading somewhere that suspended devices were
not allowed to be reset, but now I can't find that requirement anywhere
in the USB spec.

> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/usb/core/hub.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 05a2d51bdbe0..f0194fdbc9b8 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -5877,8 +5877,7 @@ int usb_reset_device(struct usb_device *udev)
>  	struct usb_host_config *config = udev->actconfig;
>  	struct usb_hub *hub = usb_hub_to_struct_hub(udev->parent);
>  
> -	if (udev->state == USB_STATE_NOTATTACHED ||
> -			udev->state == USB_STATE_SUSPENDED) {
> +	if (udev->state == USB_STATE_NOTATTACHED) {
>  		dev_dbg(&udev->dev, "device reset not allowed in state %d\n",
>  				udev->state);
>  		return -EINVAL;

You forgot to update the kerneldoc for this function.

Alan Stern


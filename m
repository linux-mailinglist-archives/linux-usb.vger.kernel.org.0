Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45757F198D
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2019 16:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbfKFPHR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 10:07:17 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:35176 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727202AbfKFPHR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Nov 2019 10:07:17 -0500
Received: (qmail 1857 invoked by uid 2102); 6 Nov 2019 10:07:15 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 6 Nov 2019 10:07:15 -0500
Date:   Wed, 6 Nov 2019 10:07:15 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
cc:     gregkh@linuxfoundation.org, <mathias.nyman@intel.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: Allow USB device to be warm reset in suspended
 state
In-Reply-To: <20191106062710.29880-1-kai.heng.feng@canonical.com>
Message-ID: <Pine.LNX.4.44L0.1911061006480.1694-100000@iolanthe.rowland.org>
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
> [  433.315169] xhci_hcd 0000:3a:00.0: hcd_pci_runtime_resume: 0
> [  433.315204] usb usb4: usb auto-resume
> [  433.315226] hub 4-0:1.0: hub_resume
> [  433.315239] xhci_hcd 0000:3a:00.0: Get port status 4-1 read: 0x10202e2, return 0x10343
> [  433.315264] usb usb4-port1: status 0343 change 0001
> [  433.315279] xhci_hcd 0000:3a:00.0: clear port1 connect change, portsc: 0x10002e2
> [  433.315293] xhci_hcd 0000:3a:00.0: Get port status 4-2 read: 0x2a0, return 0x2a0
> [  433.317012] xhci_hcd 0000:3a:00.0: xhci_hub_status_data: stopping port polling.
> [  433.422282] xhci_hcd 0000:3a:00.0: Get port status 4-1 read: 0x10002e2, return 0x343
> [  433.422307] usb usb4-port1: do warm reset
> [  433.422311] usb 4-1: device reset not allowed in state 8
> [  433.422339] hub 4-0:1.0: state 7 ports 2 chg 0002 evt 0000
> [  433.422346] xhci_hcd 0000:3a:00.0: Get port status 4-1 read: 0x10002e2, return 0x343
> [  433.422356] usb usb4-port1: do warm reset
> [  433.422358] usb 4-1: device reset not allowed in state 8
> [  433.422428] xhci_hcd 0000:3a:00.0: set port remote wake mask, actual port 0 status  = 0xf0002e2
> [  433.422455] xhci_hcd 0000:3a:00.0: set port remote wake mask, actual port 1 status  = 0xe0002a0
> [  433.422465] hub 4-0:1.0: hub_suspend
> [  433.422475] usb usb4: bus auto-suspend, wakeup 1
> [  433.426161] xhci_hcd 0000:3a:00.0: xhci_hub_status_data: stopping port polling.
> [  433.466209] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> [  433.510204] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> [  433.554051] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> [  433.598235] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> [  433.642154] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> [  433.686204] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> [  433.730205] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> [  433.774203] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> [  433.818207] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> [  433.862040] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> [  433.862053] xhci_hcd 0000:3a:00.0: xhci_hub_status_data: stopping port polling.
> [  433.862077] xhci_hcd 0000:3a:00.0: xhci_suspend: stopping port polling.
> [  433.862096] xhci_hcd 0000:3a:00.0: // Setting command ring address to 0x8578fc001
> [  433.862312] xhci_hcd 0000:3a:00.0: hcd_pci_runtime_suspend: 0
> [  433.862445] xhci_hcd 0000:3a:00.0: PME# enabled
> [  433.902376] xhci_hcd 0000:3a:00.0: restoring config space at offset 0xc (was 0x0, writing 0x20)
> [  433.902395] xhci_hcd 0000:3a:00.0: restoring config space at offset 0x4 (was 0x100000, writing 0x100403)
> [  433.902490] xhci_hcd 0000:3a:00.0: PME# disabled
> [  433.902504] xhci_hcd 0000:3a:00.0: enabling bus mastering
> [  433.902547] xhci_hcd 0000:3a:00.0: // Setting command ring address to 0x8578fc001
> [  433.902649] pcieport 0000:00:1b.0: PME: Spurious native interrupt!
> [  433.902839] xhci_hcd 0000:3a:00.0: Port change event, 4-1, id 3, portsc: 0xb0202e2
> [  433.902842] xhci_hcd 0000:3a:00.0: resume root hub
> [  433.902845] xhci_hcd 0000:3a:00.0: handle_port_status: starting port polling.
> [  433.902877] xhci_hcd 0000:3a:00.0: xhci_resume: starting port polling.
> [  433.902889] xhci_hcd 0000:3a:00.0: xhci_hub_status_data: stopping port polling.
> [  433.902891] xhci_hcd 0000:3a:00.0: hcd_pci_runtime_resume: 0
> [  433.902919] usb usb4: usb wakeup-resume
> [  433.902942] usb usb4: usb auto-resume
> [  433.902966] hub 4-0:1.0: hub_resume
> ...
> 
> As Mathias pointed out, the hub enters Cold Attach Status state and
> requires a warm reset. However usb_reset_device() bails out early when
> the device is in suspended state, as its callers port_event() and
> hub_event() don't always resume the device.
> 
> Since there's nothing wrong to reset a suspended device, allow
> usb_reset_device() to do so to solve the issue.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v2:
> - Update kerneldoc.
> 
>  drivers/usb/core/hub.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 05a2d51bdbe0..eaf28eed51b0 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -5849,7 +5849,7 @@ static int usb_reset_and_verify_device(struct usb_device *udev)
>  
>  /**
>   * usb_reset_device - warn interface drivers and perform a USB port reset
> - * @udev: device to reset (not in SUSPENDED or NOTATTACHED state)
> + * @udev: device to reset (not in NOTATTACHED state)
>   *
>   * Warns all drivers bound to registered interfaces (using their pre_reset
>   * method), performs the port reset, and then lets the drivers know that
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

Acked-by: Alan Stern <stern@rowland.harvard.edu>


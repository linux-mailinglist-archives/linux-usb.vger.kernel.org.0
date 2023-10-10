Return-Path: <linux-usb+bounces-1350-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D127BF8B4
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 12:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 970631C20D41
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 10:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4575D301;
	Tue, 10 Oct 2023 10:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FB9182A7
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 10:31:54 +0000 (UTC)
Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A87A4;
	Tue, 10 Oct 2023 03:31:50 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
	by hi1smtp01.de.adit-jv.com (Postfix) with ESMTP id C687752058C;
	Tue, 10 Oct 2023 12:31:47 +0200 (CEST)
Received: from vmlxhi-118.adit-jv.com (10.72.93.77) by hi2exch02.adit-jv.com
 (10.72.92.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.32; Tue, 10 Oct
 2023 12:31:47 +0200
Date: Tue, 10 Oct 2023 12:31:43 +0200
From: Hardik Gajjar <hgajjar@de.adit-jv.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: Hardik Gajjar <hgajjar@de.adit-jv.com>, <mathias.nyman@intel.com>,
	<stern@rowland.harvard.edu>, <yangyingliang@huawei.com>,
	<jinpu.wang@ionos.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <erosca@de.adit-jv.com>
Subject: Re: [PATCH v2] usb: core: hub: Add quirks for reducing device
 address timeout
Message-ID: <20231010103143.GA107162@vmlxhi-118.adit-jv.com>
References: <--in-reply-to=20231006153808.9758-1-hgajjar@de.adit-jv.com>
 <20231009161402.104224-1-hgajjar@de.adit-jv.com>
 <2023100921-likeness-possible-032c@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2023100921-likeness-possible-032c@gregkh>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.72.93.77]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 09, 2023 at 07:43:09PM +0200, Greg KH wrote:
> On Mon, Oct 09, 2023 at 06:14:02PM +0200, Hardik Gajjar wrote:
> > Currently, the timeout for the set address command is fixed at
> > 5 seconds in the xhci driver. This means the host waits up to 5
> > seconds to receive a response for the set_address command from
> > the device.
> > 
> > In the automotive context, most smartphone enumerations, including
> > screen projection, should ideally complete within 3 seconds.
> > Achieving this is impossible in scenarios where the set_address is
> > not successful and waits for a timeout.
> > 
> > The shortened address device timeout quirks provide the flexibility
> > to align with a 3-second time limit in the event of errors.
> > By swiftly triggering a failure response and swiftly initiating
> > retry procedures, these quirks ensure efficient and rapid recovery,
> > particularly in automotive contexts where rapid smartphone enumeration
> > and screen projection are vital.
> 
> So you have known-broken devices where you want a shorter error timeout?
> But you don't list those devices in this patch adding the quirk
> settings, shouldn't that be required, otherwise this looks like an
> unused quirk.
Yes, we have identified the device (hub) that is causing the issue. However,
I would prefer not to force this timeout globally. Instead, I can dynamically
control it by writing to the /sys/bus/usb/drivers/hub/module/parameter/quirks
file from init.rc (Android) during the boot-up process.
> 
> > The quirk will set the timeout to 500 ms from 5 seconds.
> > 
> > To use the quirk, please write "vendor_id:product_id:p" to
> > /sys/bus/usb/drivers/hub/module/parameter/quirks
> > 
> > For example,
> > echo "0x2c48:0x0132:p" > /sys/bus/usb/drivers/hub/module/parameter/quirks"
> > 
> > Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> > ---
> > changes since version 1:
> > 	- implement quirk instead of new API in xhci driver
> > ---
> >  drivers/usb/core/hub.c       | 15 +++++++++++++--
> >  drivers/usb/core/quirks.c    |  3 +++
> >  drivers/usb/host/xhci-mem.c  |  1 +
> >  drivers/usb/host/xhci-ring.c |  3 ++-
> >  drivers/usb/host/xhci.c      |  9 +++++----
> >  drivers/usb/host/xhci.h      |  1 +
> >  include/linux/usb/hcd.h      |  3 ++-
> >  include/linux/usb/quirks.h   |  3 +++
> >  8 files changed, 30 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 3c54b218301c..975449b03426 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -54,6 +54,9 @@
> >  #define USB_TP_TRANSMISSION_DELAY_MAX	65535	/* ns */
> >  #define USB_PING_RESPONSE_TIME		400	/* ns */
> >  
> > +#define USB_DEFAULT_ADDR_DEVICE_TIMEOUT		(HZ * 5) /* 5000ms */
> > +#define USB_SHORT_ADDR_DEVICE_TIMEOUT		125  /* ~500ms */
> > +
> >  /* Protect struct usb_device->state and ->children members
> >   * Note: Both are also protected by ->dev.sem, except that ->state can
> >   * change to USB_STATE_NOTATTACHED even when the semaphore isn't held. */
> > @@ -4626,8 +4629,16 @@ EXPORT_SYMBOL_GPL(usb_ep0_reinit);
> >  static int hub_set_address(struct usb_device *udev, int devnum)
> >  {
> >  	int retval;
> > +	int timeout = USB_DEFAULT_ADDR_DEVICE_TIMEOUT;
> >  	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
> >  
> > +	struct usb_hub *hub = usb_hub_to_struct_hub(udev->parent);
> > +
> > +	if (hub->hdev->quirks & USB_QUIRK_SHORT_DEVICE_ADDR_TIMEOUT)
> > +		timeout = USB_SHORT_ADDR_DEVICE_TIMEOUT;
> > +
> > +	dev_dbg(&udev->dev, "address_device timeout %d\n", timeout);
> 
> Is this debugging code still needed?
will remove in patch v3
> 
> >  	/*
> >  	 * The host controller will choose the device address,
> >  	 * instead of the core having chosen it earlier
> > @@ -4639,11 +4650,11 @@ static int hub_set_address(struct usb_device *udev, int devnum)
> >  	if (udev->state != USB_STATE_DEFAULT)
> >  		return -EINVAL;
> >  	if (hcd->driver->address_device)
> > -		retval = hcd->driver->address_device(hcd, udev);
> > +		retval = hcd->driver->address_device(hcd, udev, timeout);
> >  	else
> >  		retval = usb_control_msg(udev, usb_sndaddr0pipe(),
> >  				USB_REQ_SET_ADDRESS, 0, devnum, 0,
> > -				NULL, 0, USB_CTRL_SET_TIMEOUT);
> > +				NULL, 0, jiffies_to_msecs(timeout));
> >  	if (retval == 0) {
> >  		update_devnum(udev, devnum);
> >  		/* Device now using proper address. */
> > diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> > index 15e9bd180a1d..01ed26bd41f0 100644
> > --- a/drivers/usb/core/quirks.c
> > +++ b/drivers/usb/core/quirks.c
> > @@ -138,6 +138,9 @@ static int quirks_param_set(const char *value, const struct kernel_param *kp)
> >  			case 'o':
> >  				flags |= USB_QUIRK_HUB_SLOW_RESET;
> >  				break;
> > +			case 'p':
> > +				flags |= USB_QUIRK_SHORT_DEVICE_ADDR_TIMEOUT;
> > +				break;
> >  			/* Ignore unrecognized flag characters */
> >  			}
> >  		}
> > diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> > index 8714ab5bf04d..492433fdac77 100644
> > --- a/drivers/usb/host/xhci-mem.c
> > +++ b/drivers/usb/host/xhci-mem.c
> > @@ -1729,6 +1729,7 @@ struct xhci_command *xhci_alloc_command(struct xhci_hcd *xhci,
> >  	}
> >  
> >  	command->status = 0;
> > +	command->timeout = 0;
> >  	INIT_LIST_HEAD(&command->cmd_list);
> >  	return command;
> >  }
> > diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> > index 1dde53f6eb31..0bd19a1efdec 100644
> > --- a/drivers/usb/host/xhci-ring.c
> > +++ b/drivers/usb/host/xhci-ring.c
> > @@ -4301,7 +4301,8 @@ static int queue_command(struct xhci_hcd *xhci, struct xhci_command *cmd,
> >  	/* if there are no other commands queued we start the timeout timer */
> >  	if (list_empty(&xhci->cmd_list)) {
> >  		xhci->current_cmd = cmd;
> > -		xhci_mod_cmd_timer(xhci, XHCI_CMD_DEFAULT_TIMEOUT);
> > +		xhci_mod_cmd_timer(xhci, (cmd->timeout) ? cmd->timeout :
> > +				XHCI_CMD_DEFAULT_TIMEOUT);
> >  	}
> >  
> >  	list_add_tail(&cmd->cmd_list, &xhci->cmd_list);
> > diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > index e1b1b64a0723..1d088ceb2b74 100644
> > --- a/drivers/usb/host/xhci.c
> > +++ b/drivers/usb/host/xhci.c
> > @@ -4002,7 +4002,7 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
> >   * SetAddress request to the device.
> >   */
> >  static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
> > -			     enum xhci_setup_dev setup)
> > +			     enum xhci_setup_dev setup, int timeout)
> 
> What is the units of timeout here?
The timeout is in jiffies. Should we consider adding 'jiffies' in the variable name
for clarity? I searched the kernel source code but couldn't find a reference for the
unit of timeout in jiffies.
Nevertheless, I will add a comment in patch v3 for clarification.
> 
> >  {
> >  	const char *act = setup == SETUP_CONTEXT_ONLY ? "context" : "address";
> >  	unsigned long flags;
> > @@ -4059,6 +4059,7 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
> >  	}
> >  
> >  	command->in_ctx = virt_dev->in_ctx;
> > +	command->timeout = timeout;
> >  
> >  	slot_ctx = xhci_get_slot_ctx(xhci, virt_dev->in_ctx);
> >  	ctrl_ctx = xhci_get_input_control_ctx(virt_dev->in_ctx);
> > @@ -4185,14 +4186,14 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
> >  	return ret;
> >  }
> >  
> > -static int xhci_address_device(struct usb_hcd *hcd, struct usb_device *udev)
> > +static int xhci_address_device(struct usb_hcd *hcd, struct usb_device *udev, int timeout)
> >  {
> > -	return xhci_setup_device(hcd, udev, SETUP_CONTEXT_ADDRESS);
> > +	return xhci_setup_device(hcd, udev, SETUP_CONTEXT_ADDRESS, timeout);
> >  }
> >  
> >  static int xhci_enable_device(struct usb_hcd *hcd, struct usb_device *udev)
> >  {
> > -	return xhci_setup_device(hcd, udev, SETUP_CONTEXT_ONLY);
> > +	return xhci_setup_device(hcd, udev, SETUP_CONTEXT_ONLY, 0);
> 
> 0 is no timeout at all?  Or max timeout?  Where is this documented?
> 
> And why is this only added to the xhci driver and not all other host
> controllers?
Because 'address_device' is only assigned in the xHCI driver, other host
drivers (OHCI, EHCI) issue 'set_address' requests directly from 'hub.c'
and utilize the timeout

I have already updated that API in this patch to utilize timeout.
> 
> >  }
> >  
> >  /*
> > diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> > index 7e282b4522c0..ebdca8dd01c2 100644
> > --- a/drivers/usb/host/xhci.h
> > +++ b/drivers/usb/host/xhci.h
> > @@ -818,6 +818,7 @@ struct xhci_command {
> >  	struct completion		*completion;
> >  	union xhci_trb			*command_trb;
> >  	struct list_head		cmd_list;
> > +	int				timeout;
> 
> What is the units here.
The timeout is in jiffies. Should we consider adding 'jiffies' in the variable name
for clarity? I searched the kernel source code but couldn't find a reference for the
unit of timeout in jiffies.
Nevertheless, I will add a comment in patch v3 for clarification.
> 
> >  };
> >  
> >  /* drop context bitmasks */
> > diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
> > index 61d4f0b793dc..b0fda87ad3a2 100644
> > --- a/include/linux/usb/hcd.h
> > +++ b/include/linux/usb/hcd.h
> > @@ -373,7 +373,8 @@ struct hc_driver {
> >  		 */
> >  	void	(*reset_bandwidth)(struct usb_hcd *, struct usb_device *);
> >  		/* Returns the hardware-chosen device address */
> > -	int	(*address_device)(struct usb_hcd *, struct usb_device *udev);
> > +	int	(*address_device)(struct usb_hcd *, struct usb_device *udev,
> > +				  int timeout);
> 
> Again, units please.
The timeout is in jiffies. Should we consider adding 'jiffies' in the variable name
for clarity? I searched the kernel source code but couldn't find a reference for the
unit of timeout in jiffies.
Nevertheless, I will add a comment in patch v3 for clarification.
> 
> >  		/* prepares the hardware to send commands to the device */
> >  	int	(*enable_device)(struct usb_hcd *, struct usb_device *udev);
> >  		/* Notifies the HCD after a hub descriptor is fetched.
> > diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
> > index eeb7c2157c72..0cb464e3eaf4 100644
> > --- a/include/linux/usb/quirks.h
> > +++ b/include/linux/usb/quirks.h
> > @@ -72,4 +72,7 @@
> >  /* device has endpoints that should be ignored */
> >  #define USB_QUIRK_ENDPOINT_IGNORE		BIT(15)
> >  
> > +/* short device address timeout */
> > +#define USB_QUIRK_SHORT_DEVICE_ADDR_TIMEOUT	BIT(16)
> 
> Don't you also need to have a Documentation/ update for the new
> user/kernel api you are adding?
> 
When you recommend Documentation, I assume you suggest to add the
detailed comment in quirks.h to clear intention of the change.
I will update it in patch v3.
> thanks,
> 
> greg k-h


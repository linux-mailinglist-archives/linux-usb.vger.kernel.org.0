Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F033F1457FC
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 15:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgAVOiA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 09:38:00 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33897 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgAVOh7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 09:37:59 -0500
Received: by mail-pl1-f193.google.com with SMTP id c9so3105802plo.1
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2020 06:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qrPi65Ugm5ZQFBRPydA5hshJUDM7DHdK9tTcv81Sej8=;
        b=MNg6oyumO+IktAkmG1BzF49wnKYnuShntP8ctlRge6Nkday2ragqKvoGJbaCkDOUHZ
         BVoIyQi5V/6AigpcQsp0sSv856Eu0uDMk2RKA6tnstNZeWeXZBZ92nQbIZSbrUthyDEC
         nx1Bcqa5hwTHSQhsq6LmLdeVASdYPo/+27qEYU5GecjhR2oJX0d0WvZ3w4P3kqUZyVxC
         0hXSphRjqQi7siqFWPLWZecFsW5jMJvTLZwuMqzbj0jYxuzWHdaguqsjcwiyAar/A2ii
         DsFV3i52cKWHk5PhPVGqCgXqLrYnS/nSqG8LVWV5clIltACermeSbol6GvM1FOxkQ74b
         eRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qrPi65Ugm5ZQFBRPydA5hshJUDM7DHdK9tTcv81Sej8=;
        b=Dy8O4bpMkD5ZZR3jDsYl14ArPi3hBis/5ChcRITtVrtfYIFoHzx0uAvg/bygcG0ehx
         D6VRMHJEPdaoWtFgDQAufHQDAFD7CCbeaNqzQcTMquxCL5qtxBM0lRtbBVcw2ndbK01j
         V2llEv6Eckr7uFqzPJkIchtejq7sGOvrtQ5ICeSBt+eTi4LfqzOMyVdjRShgs6pigxDL
         0Zjva2cLALubErAs/Jy6e0pJAugM6PnF9/qy8nMTAKB73FgbBvwZYwj1u3B3aoPIBFEl
         98pO9K1FcbG271C6P0LsWAXWUkeeqYJrDsUaW78CKAaHbl0MG5YyqlKGICZR5aykDINh
         P3MA==
X-Gm-Message-State: APjAAAXrOSvb+1CdUhU535JGBcYLAVU2PL6B+OShvLC+0gsvoOwd/z+E
        GJc9u036ob0mb3OL71Rx5UuwoAT0EiqrtoKxi+lU9Q==
X-Google-Smtp-Source: APXvYqw7MZ4ZAKBkKHjmFWwK1pDRneDDVBkkrbN6kTVHgB6rkIDk/AO7vCUus0jrih1tvF96dUxE/brhUDzFIUXGEYE=
X-Received: by 2002:a17:902:ab95:: with SMTP id f21mr10850964plr.336.1579703877607;
 Wed, 22 Jan 2020 06:37:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579007786.git.andreyknvl@google.com> <461a787e63a9a01d83edc563575b8585bc138e8d.1579007786.git.andreyknvl@google.com>
In-Reply-To: <461a787e63a9a01d83edc563575b8585bc138e8d.1579007786.git.andreyknvl@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 22 Jan 2020 15:37:46 +0100
Message-ID: <CAAeHK+wGijhTaCdoD+xcUY=PRWLUOv5uwg7OjD=uMrU8nqqrdw@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] usb: gadget: add raw-gadget interface
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 14, 2020 at 2:24 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> USB Raw Gadget is a kernel module that provides a userspace interface for
> the USB Gadget subsystem. Essentially it allows to emulate USB devices
> from userspace. Enabled with CONFIG_USB_RAW_GADGET. Raw Gadget is
> currently a strictly debugging feature and shouldn't be used in
> production.
>
> Raw Gadget is similar to GadgetFS, but provides a more low-level and
> direct access to the USB Gadget layer for the userspace. The key
> differences are:
>
> 1. Every USB request is passed to the userspace to get a response, while
>    GadgetFS responds to some USB requests internally based on the provided
>    descriptors. However note, that the UDC driver might respond to some
>    requests on its own and never forward them to the Gadget layer.
>
> 2. GadgetFS performs some sanity checks on the provided USB descriptors,
>    while Raw Gadget allows you to provide arbitrary data as responses to
>    USB requests.
>
> 3. Raw Gadget provides a way to select a UDC device/driver to bind to,
>    while GadgetFS currently binds to the first available UDC.
>
> 4. Raw Gadget uses predictable endpoint names (handles) across different
>    UDCs (as long as UDCs have enough endpoints of each required transfer
>    type).
>
> 5. Raw Gadget has ioctl-based interface instead of a filesystem-based one.
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> ---
>
> Greg, I've assumed your LGTM meant that I can add a Reviewed-by from you.
>
> Felipe, looking forward to your review, thanks!

Hi Greg and Felipe,

I was wondering if it's feasible to get this reviewed and merged
during the upcoming merge window? This patch is the only piece missing
to enable USB fuzzing for Android common kernels on syzbot.

Thanks!

>
>  Documentation/usb/index.rst            |    1 +
>  Documentation/usb/raw-gadget.rst       |   59 ++
>  drivers/usb/gadget/legacy/Kconfig      |   11 +
>  drivers/usb/gadget/legacy/Makefile     |    1 +
>  drivers/usb/gadget/legacy/raw_gadget.c | 1068 ++++++++++++++++++++++++
>  include/uapi/linux/usb/raw_gadget.h    |  167 ++++
>  6 files changed, 1307 insertions(+)
>  create mode 100644 Documentation/usb/raw-gadget.rst
>  create mode 100644 drivers/usb/gadget/legacy/raw_gadget.c
>  create mode 100644 include/uapi/linux/usb/raw_gadget.h
>
> diff --git a/Documentation/usb/index.rst b/Documentation/usb/index.rst
> index e55386a4abfb..90310e2a0c1f 100644
> --- a/Documentation/usb/index.rst
> +++ b/Documentation/usb/index.rst
> @@ -22,6 +22,7 @@ USB support
>      misc_usbsevseg
>      mtouchusb
>      ohci
> +    raw-gadget
>      rio
>      usbip_protocol
>      usbmon
> diff --git a/Documentation/usb/raw-gadget.rst b/Documentation/usb/raw-gadget.rst
> new file mode 100644
> index 000000000000..cbedf5451ed3
> --- /dev/null
> +++ b/Documentation/usb/raw-gadget.rst
> @@ -0,0 +1,59 @@
> +==============
> +USB Raw Gadget
> +==============
> +
> +USB Raw Gadget is a kernel module that provides a userspace interface for
> +the USB Gadget subsystem. Essentially it allows to emulate USB devices
> +from userspace. Enabled with CONFIG_USB_RAW_GADGET. Raw Gadget is
> +currently a strictly debugging feature and shouldn't be used in
> +production, use GadgetFS instead.
> +
> +Comparison to GadgetFS
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +Raw Gadget is similar to GadgetFS, but provides a more low-level and
> +direct access to the USB Gadget layer for the userspace. The key
> +differences are:
> +
> +1. Every USB request is passed to the userspace to get a response, while
> +   GadgetFS responds to some USB requests internally based on the provided
> +   descriptors. However note, that the UDC driver might respond to some
> +   requests on its own and never forward them to the Gadget layer.
> +
> +2. GadgetFS performs some sanity checks on the provided USB descriptors,
> +   while Raw Gadget allows you to provide arbitrary data as responses to
> +   USB requests.
> +
> +3. Raw Gadget provides a way to select a UDC device/driver to bind to,
> +   while GadgetFS currently binds to the first available UDC.
> +
> +4. Raw Gadget uses predictable endpoint names (handles) across different
> +   UDCs (as long as UDCs have enough endpoints of each required transfer
> +   type).
> +
> +5. Raw Gadget has ioctl-based interface instead of a filesystem-based one.
> +
> +Userspace interface
> +~~~~~~~~~~~~~~~~~~~
> +
> +To create a Raw Gadget instance open /dev/raw-gadget. Multiple raw-gadget
> +instances (bound to different UDCs) can be used at the same time. The
> +interaction with the opened file happens through the ioctl() calls, see
> +comments in include/uapi/linux/usb/raw_gadget.h for details.
> +
> +The typical usage of Raw Gadget looks like:
> +
> +1. Open Raw Gadget instance via /dev/raw-gadget.
> +2. Initialize the instance via USB_RAW_IOCTL_INIT.
> +3. Launch the instance with USB_RAW_IOCTL_RUN.
> +4. In a loop issue USB_RAW_IOCTL_EVENT_FETCH calls to receive events from
> +   Raw Gadget and react to those depending on what kind of USB device
> +   needs to be emulated.
> +
> +Potential future improvements
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +- Implement ioctl's for setting/clearing halt status on endpoints.
> +
> +- Reporting more events (suspend, resume, etc.) through
> +  USB_RAW_IOCTL_EVENT_FETCH.
> diff --git a/drivers/usb/gadget/legacy/Kconfig b/drivers/usb/gadget/legacy/Kconfig
> index 119a4e47681f..55e495f5d103 100644
> --- a/drivers/usb/gadget/legacy/Kconfig
> +++ b/drivers/usb/gadget/legacy/Kconfig
> @@ -489,3 +489,14 @@ config USB_G_WEBCAM
>
>           Say "y" to link the driver statically, or "m" to build a
>           dynamically linked module called "g_webcam".
> +
> +config USB_RAW_GADGET
> +       tristate "USB Raw Gadget"
> +       help
> +         USB Raw Gadget is a kernel module that provides a userspace interface
> +         for the USB Gadget subsystem. Essentially it allows to emulate USB
> +         devices from userspace. See Documentation/usb/raw-gadget.rst for
> +         details.
> +
> +         Say "y" to link the driver statically, or "m" to build a
> +         dynamically linked module called "raw_gadget".
> diff --git a/drivers/usb/gadget/legacy/Makefile b/drivers/usb/gadget/legacy/Makefile
> index abd0c3e66a05..4d864bf82799 100644
> --- a/drivers/usb/gadget/legacy/Makefile
> +++ b/drivers/usb/gadget/legacy/Makefile
> @@ -43,3 +43,4 @@ obj-$(CONFIG_USB_G_WEBCAM)    += g_webcam.o
>  obj-$(CONFIG_USB_G_NCM)                += g_ncm.o
>  obj-$(CONFIG_USB_G_ACM_MS)     += g_acm_ms.o
>  obj-$(CONFIG_USB_GADGET_TARGET)        += tcm_usb_gadget.o
> +obj-$(CONFIG_USB_RAW_GADGET)   += raw_gadget.o
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
> new file mode 100644
> index 000000000000..51796af48069
> --- /dev/null
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -0,0 +1,1068 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * USB Raw Gadget driver.
> + * See Documentation/usb/raw-gadget.rst for more details.
> + *
> + * Andrey Konovalov <andreyknvl@gmail.com>
> + */
> +
> +#include <linux/compiler.h>
> +#include <linux/debugfs.h>
> +#include <linux/delay.h>
> +#include <linux/kref.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/semaphore.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +#include <linux/wait.h>
> +
> +#include <linux/usb.h>
> +#include <linux/usb/ch9.h>
> +#include <linux/usb/ch11.h>
> +#include <linux/usb/gadget.h>
> +
> +#include <uapi/linux/usb/raw_gadget.h>
> +
> +#define        DRIVER_DESC "USB Raw Gadget"
> +#define DRIVER_NAME "raw-gadget"
> +
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_AUTHOR("Andrey Konovalov");
> +MODULE_LICENSE("GPL");
> +
> +/*----------------------------------------------------------------------*/
> +
> +#define RAW_EVENT_QUEUE_SIZE   128
> +
> +struct raw_event_queue {
> +       /* See the comment in raw_event_queue_fetch() for locking details. */
> +       spinlock_t              lock;
> +       struct semaphore        sema;
> +       struct usb_raw_event    *events[RAW_EVENT_QUEUE_SIZE];
> +       int                     size;
> +};
> +
> +static void raw_event_queue_init(struct raw_event_queue *queue)
> +{
> +       spin_lock_init(&queue->lock);
> +       sema_init(&queue->sema, 0);
> +       queue->size = 0;
> +}
> +
> +static int raw_event_queue_add(struct raw_event_queue *queue,
> +       enum usb_raw_event_type type, size_t length, const void *data)
> +{
> +       unsigned long flags;
> +       struct usb_raw_event *event;
> +
> +       spin_lock_irqsave(&queue->lock, flags);
> +       if (WARN_ON(queue->size >= RAW_EVENT_QUEUE_SIZE)) {
> +               spin_unlock_irqrestore(&queue->lock, flags);
> +               return -ENOMEM;
> +       }
> +       event = kmalloc(sizeof(*event) + length, GFP_ATOMIC);
> +       if (!event) {
> +               spin_unlock_irqrestore(&queue->lock, flags);
> +               return -ENOMEM;
> +       }
> +       event->type = type;
> +       event->length = length;
> +       if (event->length)
> +               memcpy(&event->data[0], data, length);
> +       queue->events[queue->size] = event;
> +       queue->size++;
> +       up(&queue->sema);
> +       spin_unlock_irqrestore(&queue->lock, flags);
> +       return 0;
> +}
> +
> +static struct usb_raw_event *raw_event_queue_fetch(
> +                               struct raw_event_queue *queue)
> +{
> +       unsigned long flags;
> +       struct usb_raw_event *event;
> +
> +       /*
> +        * This function can be called concurrently. We first check that
> +        * there's at least one event queued by decrementing the semaphore,
> +        * and then take the lock to protect queue struct fields.
> +        */
> +       if (down_interruptible(&queue->sema))
> +               return NULL;
> +       spin_lock_irqsave(&queue->lock, flags);
> +       if (WARN_ON(!queue->size))
> +               return NULL;
> +       event = queue->events[0];
> +       queue->size--;
> +       memmove(&queue->events[0], &queue->events[1],
> +                       queue->size * sizeof(queue->events[0]));
> +       spin_unlock_irqrestore(&queue->lock, flags);
> +       return event;
> +}
> +
> +static void raw_event_queue_destroy(struct raw_event_queue *queue)
> +{
> +       int i;
> +
> +       for (i = 0; i < queue->size; i++)
> +               kfree(queue->events[i]);
> +       queue->size = 0;
> +}
> +
> +/*----------------------------------------------------------------------*/
> +
> +struct raw_dev;
> +
> +#define USB_RAW_MAX_ENDPOINTS 32
> +
> +enum ep_state {
> +       STATE_EP_DISABLED,
> +       STATE_EP_ENABLED,
> +};
> +
> +struct raw_ep {
> +       struct raw_dev          *dev;
> +       enum ep_state           state;
> +       struct usb_ep           *ep;
> +       struct usb_request      *req;
> +       bool                    urb_queued;
> +       bool                    disabling;
> +       ssize_t                 status;
> +};
> +
> +enum dev_state {
> +       STATE_DEV_INVALID = 0,
> +       STATE_DEV_OPENED,
> +       STATE_DEV_INITIALIZED,
> +       STATE_DEV_RUNNING,
> +       STATE_DEV_CLOSED,
> +       STATE_DEV_FAILED
> +};
> +
> +struct raw_dev {
> +       struct kref                     count;
> +       spinlock_t                      lock;
> +
> +       const char                      *udc_name;
> +       struct usb_gadget_driver        driver;
> +
> +       /* Reference to misc device: */
> +       struct device                   *dev;
> +
> +       /* Protected by lock: */
> +       enum dev_state                  state;
> +       bool                            gadget_registered;
> +       struct usb_gadget               *gadget;
> +       struct usb_request              *req;
> +       bool                            ep0_in_pending;
> +       bool                            ep0_out_pending;
> +       bool                            ep0_urb_queued;
> +       ssize_t                         ep0_status;
> +       struct raw_ep                   eps[USB_RAW_MAX_ENDPOINTS];
> +
> +       struct completion               ep0_done;
> +       struct raw_event_queue          queue;
> +};
> +
> +static struct raw_dev *dev_new(void)
> +{
> +       struct raw_dev *dev;
> +
> +       dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> +       if (!dev)
> +               return NULL;
> +       /* Matches kref_put() in raw_release(). */
> +       kref_init(&dev->count);
> +       spin_lock_init(&dev->lock);
> +       init_completion(&dev->ep0_done);
> +       raw_event_queue_init(&dev->queue);
> +       return dev;
> +}
> +
> +static void dev_free(struct kref *kref)
> +{
> +       struct raw_dev *dev = container_of(kref, struct raw_dev, count);
> +       int i;
> +
> +       kfree(dev->udc_name);
> +       kfree(dev->driver.udc_name);
> +       if (dev->req) {
> +               if (dev->ep0_urb_queued)
> +                       usb_ep_dequeue(dev->gadget->ep0, dev->req);
> +               usb_ep_free_request(dev->gadget->ep0, dev->req);
> +       }
> +       raw_event_queue_destroy(&dev->queue);
> +       for (i = 0; i < USB_RAW_MAX_ENDPOINTS; i++) {
> +               if (dev->eps[i].state != STATE_EP_ENABLED)
> +                       continue;
> +               usb_ep_disable(dev->eps[i].ep);
> +               usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
> +               kfree(dev->eps[i].ep->desc);
> +               dev->eps[i].state = STATE_EP_DISABLED;
> +       }
> +       kfree(dev);
> +}
> +
> +/*----------------------------------------------------------------------*/
> +
> +static int raw_queue_event(struct raw_dev *dev,
> +       enum usb_raw_event_type type, size_t length, const void *data)
> +{
> +       int ret = 0;
> +       unsigned long flags;
> +
> +       ret = raw_event_queue_add(&dev->queue, type, length, data);
> +       if (ret < 0) {
> +               spin_lock_irqsave(&dev->lock, flags);
> +               dev->state = STATE_DEV_FAILED;
> +               spin_unlock_irqrestore(&dev->lock, flags);
> +       }
> +       return ret;
> +}
> +
> +static void gadget_ep0_complete(struct usb_ep *ep, struct usb_request *req)
> +{
> +       struct raw_dev *dev = req->context;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       if (req->status)
> +               dev->ep0_status = req->status;
> +       else
> +               dev->ep0_status = req->actual;
> +       if (dev->ep0_in_pending)
> +               dev->ep0_in_pending = false;
> +       else
> +               dev->ep0_out_pending = false;
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +
> +       complete(&dev->ep0_done);
> +}
> +
> +static int gadget_bind(struct usb_gadget *gadget,
> +                       struct usb_gadget_driver *driver)
> +{
> +       int ret = 0;
> +       struct raw_dev *dev = container_of(driver, struct raw_dev, driver);
> +       struct usb_request *req;
> +       unsigned long flags;
> +
> +       if (strcmp(gadget->name, dev->udc_name) != 0)
> +               return -ENODEV;
> +
> +       set_gadget_data(gadget, dev);
> +       req = usb_ep_alloc_request(gadget->ep0, GFP_KERNEL);
> +       if (!req) {
> +               dev_err(&gadget->dev, "usb_ep_alloc_request failed\n");
> +               set_gadget_data(gadget, NULL);
> +               return -ENOMEM;
> +       }
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       dev->req = req;
> +       dev->req->context = dev;
> +       dev->req->complete = gadget_ep0_complete;
> +       dev->gadget = gadget;
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +
> +       /* Matches kref_put() in gadget_unbind(). */
> +       kref_get(&dev->count);
> +
> +       ret = raw_queue_event(dev, USB_RAW_EVENT_CONNECT, 0, NULL);
> +       if (ret < 0)
> +               dev_err(&gadget->dev, "failed to queue event\n");
> +
> +       return ret;
> +}
> +
> +static void gadget_unbind(struct usb_gadget *gadget)
> +{
> +       struct raw_dev *dev = get_gadget_data(gadget);
> +
> +       set_gadget_data(gadget, NULL);
> +       /* Matches kref_get() in gadget_bind(). */
> +       kref_put(&dev->count, dev_free);
> +}
> +
> +static int gadget_setup(struct usb_gadget *gadget,
> +                       const struct usb_ctrlrequest *ctrl)
> +{
> +       int ret = 0;
> +       struct raw_dev *dev = get_gadget_data(gadget);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       if (dev->state != STATE_DEV_RUNNING) {
> +               dev_err(&gadget->dev, "ignoring, device is not running\n");
> +               ret = -ENODEV;
> +               goto out_unlock;
> +       }
> +       if (dev->ep0_in_pending || dev->ep0_out_pending) {
> +               dev_dbg(&gadget->dev, "stalling, request already pending\n");
> +               ret = -EBUSY;
> +               goto out_unlock;
> +       }
> +       if ((ctrl->bRequestType & USB_DIR_IN) && ctrl->wLength)
> +               dev->ep0_in_pending = true;
> +       else
> +               dev->ep0_out_pending = true;
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +
> +       ret = raw_queue_event(dev, USB_RAW_EVENT_CONTROL, sizeof(*ctrl), ctrl);
> +       if (ret < 0)
> +               dev_err(&gadget->dev, "failed to queue event\n");
> +       goto out;
> +
> +out_unlock:
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +out:
> +       return ret;
> +}
> +
> +/* These are currently unused but present in case UDC driver requires them. */
> +static void gadget_disconnect(struct usb_gadget *gadget) { }
> +static void gadget_suspend(struct usb_gadget *gadget) { }
> +static void gadget_resume(struct usb_gadget *gadget) { }
> +static void gadget_reset(struct usb_gadget *gadget) { }
> +
> +/*----------------------------------------------------------------------*/
> +
> +static struct miscdevice raw_misc_device;
> +
> +static int raw_open(struct inode *inode, struct file *fd)
> +{
> +       struct raw_dev *dev;
> +
> +       dev = dev_new();
> +       if (!dev)
> +               return -ENOMEM;
> +       fd->private_data = dev;
> +       dev->state = STATE_DEV_OPENED;
> +       dev->dev = raw_misc_device.this_device;
> +       return 0;
> +}
> +
> +static int raw_release(struct inode *inode, struct file *fd)
> +{
> +       int ret = 0;
> +       struct raw_dev *dev = fd->private_data;
> +       unsigned long flags;
> +       bool unregister = false;
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       dev->state = STATE_DEV_CLOSED;
> +       if (!dev->gadget) {
> +               spin_unlock_irqrestore(&dev->lock, flags);
> +               goto out_put;
> +       }
> +       if (dev->gadget_registered)
> +               unregister = true;
> +       dev->gadget_registered = false;
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +
> +       if (unregister) {
> +               ret = usb_gadget_unregister_driver(&dev->driver);
> +               if (ret != 0)
> +                       dev_err(dev->dev,
> +                               "usb_gadget_unregister_driver() failed with %d\n",
> +                               ret);
> +               /* Matches kref_get() in raw_ioctl_run(). */
> +               kref_put(&dev->count, dev_free);
> +       }
> +
> +out_put:
> +       /* Matches dev_new() in raw_open(). */
> +       kref_put(&dev->count, dev_free);
> +       return ret;
> +}
> +
> +/*----------------------------------------------------------------------*/
> +
> +static int raw_ioctl_init(struct raw_dev *dev, unsigned long value)
> +{
> +       int ret = 0;
> +       struct usb_raw_init arg;
> +       char *udc_driver_name;
> +       char *udc_device_name;
> +       unsigned long flags;
> +
> +       ret = copy_from_user(&arg, (void __user *)value, sizeof(arg));
> +       if (ret)
> +               return ret;
> +
> +       switch (arg.speed) {
> +       case USB_SPEED_UNKNOWN:
> +               arg.speed = USB_SPEED_HIGH;
> +               break;
> +       case USB_SPEED_LOW:
> +       case USB_SPEED_FULL:
> +       case USB_SPEED_HIGH:
> +       case USB_SPEED_SUPER:
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       udc_driver_name = kmalloc(UDC_NAME_LENGTH_MAX, GFP_KERNEL);
> +       if (!udc_driver_name)
> +               return -ENOMEM;
> +       ret = strscpy(udc_driver_name, &arg.driver_name[0],
> +                               UDC_NAME_LENGTH_MAX);
> +       if (ret < 0) {
> +               kfree(udc_driver_name);
> +               return ret;
> +       }
> +       ret = 0;
> +
> +       udc_device_name = kmalloc(UDC_NAME_LENGTH_MAX, GFP_KERNEL);
> +       if (!udc_device_name) {
> +               kfree(udc_driver_name);
> +               return -ENOMEM;
> +       }
> +       ret = strscpy(udc_device_name, &arg.device_name[0],
> +                               UDC_NAME_LENGTH_MAX);
> +       if (ret < 0) {
> +               kfree(udc_driver_name);
> +               kfree(udc_device_name);
> +               return ret;
> +       }
> +       ret = 0;
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       if (dev->state != STATE_DEV_OPENED) {
> +               dev_dbg(dev->dev, "fail, device is not opened\n");
> +               kfree(udc_driver_name);
> +               kfree(udc_device_name);
> +               ret = -EINVAL;
> +               goto out_unlock;
> +       }
> +       dev->udc_name = udc_driver_name;
> +
> +       dev->driver.function = DRIVER_DESC;
> +       dev->driver.max_speed = arg.speed;
> +       dev->driver.setup = gadget_setup;
> +       dev->driver.disconnect = gadget_disconnect;
> +       dev->driver.bind = gadget_bind;
> +       dev->driver.unbind = gadget_unbind;
> +       dev->driver.suspend = gadget_suspend;
> +       dev->driver.resume = gadget_resume;
> +       dev->driver.reset = gadget_reset;
> +       dev->driver.driver.name = DRIVER_NAME;
> +       dev->driver.udc_name = udc_device_name;
> +       dev->driver.match_existing_only = 1;
> +
> +       dev->state = STATE_DEV_INITIALIZED;
> +
> +out_unlock:
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +       return ret;
> +}
> +
> +static int raw_ioctl_run(struct raw_dev *dev, unsigned long value)
> +{
> +       int ret = 0;
> +       unsigned long flags;
> +
> +       if (value)
> +               return -EINVAL;
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       if (dev->state != STATE_DEV_INITIALIZED) {
> +               dev_dbg(dev->dev, "fail, device is not initialized\n");
> +               ret = -EINVAL;
> +               goto out_unlock;
> +       }
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +
> +       ret = usb_gadget_probe_driver(&dev->driver);
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       if (ret) {
> +               dev_err(dev->dev,
> +                       "fail, usb_gadget_probe_driver returned %d\n", ret);
> +               dev->state = STATE_DEV_FAILED;
> +               goto out_unlock;
> +       }
> +       dev->gadget_registered = true;
> +       dev->state = STATE_DEV_RUNNING;
> +       /* Matches kref_put() in raw_release(). */
> +       kref_get(&dev->count);
> +
> +out_unlock:
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +       return ret;
> +}
> +
> +static int raw_ioctl_event_fetch(struct raw_dev *dev, unsigned long value)
> +{
> +       int ret = 0;
> +       struct usb_raw_event arg;
> +       unsigned long flags;
> +       struct usb_raw_event *event;
> +       uint32_t length;
> +
> +       ret = copy_from_user(&arg, (void __user *)value, sizeof(arg));
> +       if (ret)
> +               return ret;
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       if (dev->state != STATE_DEV_RUNNING) {
> +               dev_dbg(dev->dev, "fail, device is not running\n");
> +               spin_unlock_irqrestore(&dev->lock, flags);
> +               return -EINVAL;
> +       }
> +       if (!dev->gadget) {
> +               dev_dbg(dev->dev, "fail, gadget is not bound\n");
> +               spin_unlock_irqrestore(&dev->lock, flags);
> +               return -EBUSY;
> +       }
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +
> +       event = raw_event_queue_fetch(&dev->queue);
> +       if (!event) {
> +               dev_dbg(&dev->gadget->dev, "event fetching interrupted\n");
> +               return -EINTR;
> +       }
> +       length = min(arg.length, event->length);
> +       ret = copy_to_user((void __user *)value, event,
> +                               sizeof(*event) + length);
> +       return ret;
> +}
> +
> +static void *raw_alloc_io_data(struct usb_raw_ep_io *io, void __user *ptr,
> +                               bool get_from_user)
> +{
> +       int ret;
> +       void *data;
> +
> +       ret = copy_from_user(io, ptr, sizeof(*io));
> +       if (ret)
> +               return ERR_PTR(ret);
> +       if (io->ep >= USB_RAW_MAX_ENDPOINTS)
> +               return ERR_PTR(-EINVAL);
> +       if (!usb_raw_io_flags_valid(io->flags))
> +               return ERR_PTR(-EINVAL);
> +       if (io->length > PAGE_SIZE)
> +               return ERR_PTR(-EINVAL);
> +       if (get_from_user)
> +               data = memdup_user(ptr + sizeof(*io), io->length);
> +       else {
> +               data = kmalloc(io->length, GFP_KERNEL);
> +               if (!data)
> +                       data = ERR_PTR(-ENOMEM);
> +       }
> +       return data;
> +}
> +
> +static int raw_process_ep0_io(struct raw_dev *dev, struct usb_raw_ep_io *io,
> +                               void *data, bool in)
> +{
> +       int ret = 0;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       if (dev->state != STATE_DEV_RUNNING) {
> +               dev_dbg(dev->dev, "fail, device is not running\n");
> +               ret = -EINVAL;
> +               goto out_unlock;
> +       }
> +       if (!dev->gadget) {
> +               dev_dbg(dev->dev, "fail, gadget is not bound\n");
> +               ret = -EBUSY;
> +               goto out_unlock;
> +       }
> +       if (dev->ep0_urb_queued) {
> +               dev_dbg(&dev->gadget->dev, "fail, urb already queued\n");
> +               ret = -EBUSY;
> +               goto out_unlock;
> +       }
> +       if ((in && !dev->ep0_in_pending) ||
> +                       (!in && !dev->ep0_out_pending)) {
> +               dev_dbg(&dev->gadget->dev, "fail, wrong direction\n");
> +               ret = -EBUSY;
> +               goto out_unlock;
> +       }
> +       if (WARN_ON(in && dev->ep0_out_pending)) {
> +               ret = -ENODEV;
> +               dev->state = STATE_DEV_FAILED;
> +               goto out_done;
> +       }
> +       if (WARN_ON(!in && dev->ep0_in_pending)) {
> +               ret = -ENODEV;
> +               dev->state = STATE_DEV_FAILED;
> +               goto out_done;
> +       }
> +
> +       dev->req->buf = data;
> +       dev->req->length = io->length;
> +       dev->req->zero = usb_raw_io_flags_zero(io->flags);
> +       dev->ep0_urb_queued = true;
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +
> +       ret = usb_ep_queue(dev->gadget->ep0, dev->req, GFP_ATOMIC);
> +       if (ret) {
> +               dev_err(&dev->gadget->dev,
> +                               "fail, usb_ep_queue returned %d\n", ret);
> +               spin_lock_irqsave(&dev->lock, flags);
> +               dev->state = STATE_DEV_FAILED;
> +               goto out_done;
> +       }
> +
> +       ret = wait_for_completion_interruptible(&dev->ep0_done);
> +       if (ret) {
> +               dev_dbg(&dev->gadget->dev, "wait interrupted\n");
> +               usb_ep_dequeue(dev->gadget->ep0, dev->req);
> +               wait_for_completion(&dev->ep0_done);
> +               spin_lock_irqsave(&dev->lock, flags);
> +               goto out_done;
> +       }
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       ret = dev->ep0_status;
> +
> +out_done:
> +       dev->ep0_urb_queued = false;
> +out_unlock:
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +       return ret;
> +}
> +
> +static int raw_ioctl_ep0_write(struct raw_dev *dev, unsigned long value)
> +{
> +       int ret = 0;
> +       void *data;
> +       struct usb_raw_ep_io io;
> +
> +       data = raw_alloc_io_data(&io, (void __user *)value, true);
> +       if (IS_ERR(data))
> +               return PTR_ERR(data);
> +       ret = raw_process_ep0_io(dev, &io, data, true);
> +       kfree(data);
> +       return ret;
> +}
> +
> +static int raw_ioctl_ep0_read(struct raw_dev *dev, unsigned long value)
> +{
> +       int ret = 0;
> +       void *data;
> +       struct usb_raw_ep_io io;
> +       unsigned int length;
> +
> +       data = raw_alloc_io_data(&io, (void __user *)value, false);
> +       if (IS_ERR(data))
> +               return PTR_ERR(data);
> +       ret = raw_process_ep0_io(dev, &io, data, false);
> +       if (ret < 0) {
> +               kfree(data);
> +               return ret;
> +       }
> +       length = min(io.length, (unsigned int)ret);
> +       ret = copy_to_user((void __user *)(value + sizeof(io)), data, length);
> +       kfree(data);
> +       return ret;
> +}
> +
> +static bool check_ep_caps(struct usb_ep *ep,
> +                               struct usb_endpoint_descriptor *desc)
> +{
> +       switch (usb_endpoint_type(desc)) {
> +       case USB_ENDPOINT_XFER_ISOC:
> +               if (!ep->caps.type_iso)
> +                       return false;
> +               break;
> +       case USB_ENDPOINT_XFER_BULK:
> +               if (!ep->caps.type_bulk)
> +                       return false;
> +               break;
> +       case USB_ENDPOINT_XFER_INT:
> +               if (!ep->caps.type_int)
> +                       return false;
> +               break;
> +       default:
> +               return false;
> +       }
> +
> +       if (usb_endpoint_dir_in(desc) && !ep->caps.dir_in)
> +               return false;
> +       if (usb_endpoint_dir_out(desc) && !ep->caps.dir_out)
> +               return false;
> +
> +       return true;
> +}
> +
> +static int raw_ioctl_ep_enable(struct raw_dev *dev, unsigned long value)
> +{
> +       int ret = 0, i;
> +       unsigned long flags;
> +       struct usb_endpoint_descriptor *desc;
> +       struct usb_ep *ep = NULL;
> +
> +       desc = memdup_user((void __user *)value, sizeof(*desc));
> +       if (IS_ERR(desc))
> +               return PTR_ERR(desc);
> +
> +       /*
> +        * Endpoints with a maxpacket length of 0 can cause crashes in UDC
> +        * drivers.
> +        */
> +       if (usb_endpoint_maxp(desc) == 0) {
> +               dev_dbg(dev->dev, "fail, bad endpoint maxpacket\n");
> +               kfree(desc);
> +               return -EINVAL;
> +       }
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       if (dev->state != STATE_DEV_RUNNING) {
> +               dev_dbg(dev->dev, "fail, device is not running\n");
> +               ret = -EINVAL;
> +               goto out_free;
> +       }
> +       if (!dev->gadget) {
> +               dev_dbg(dev->dev, "fail, gadget is not bound\n");
> +               ret = -EBUSY;
> +               goto out_free;
> +       }
> +
> +       for (i = 0; i < USB_RAW_MAX_ENDPOINTS; i++) {
> +               if (dev->eps[i].state == STATE_EP_ENABLED)
> +                       continue;
> +               break;
> +       }
> +       if (i == USB_RAW_MAX_ENDPOINTS) {
> +               dev_dbg(&dev->gadget->dev,
> +                               "fail, no device endpoints available\n");
> +               ret = -EBUSY;
> +               goto out_free;
> +       }
> +
> +       gadget_for_each_ep(ep, dev->gadget) {
> +               if (ep->enabled)
> +                       continue;
> +               if (!check_ep_caps(ep, desc))
> +                       continue;
> +               ep->desc = desc;
> +               ret = usb_ep_enable(ep);
> +               if (ret < 0) {
> +                       dev_err(&dev->gadget->dev,
> +                               "fail, usb_ep_enable returned %d\n", ret);
> +                       goto out_free;
> +               }
> +               dev->eps[i].req = usb_ep_alloc_request(ep, GFP_ATOMIC);
> +               if (!dev->eps[i].req) {
> +                       dev_err(&dev->gadget->dev,
> +                               "fail, usb_ep_alloc_request failed\n");
> +                       usb_ep_disable(ep);
> +                       ret = -ENOMEM;
> +                       goto out_free;
> +               }
> +               dev->eps[i].ep = ep;
> +               dev->eps[i].state = STATE_EP_ENABLED;
> +               ep->driver_data = &dev->eps[i];
> +               ret = i;
> +               goto out_unlock;
> +       }
> +
> +       dev_dbg(&dev->gadget->dev, "fail, no gadget endpoints available\n");
> +       ret = -EBUSY;
> +
> +out_free:
> +       kfree(desc);
> +out_unlock:
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +       return ret;
> +}
> +
> +static int raw_ioctl_ep_disable(struct raw_dev *dev, unsigned long value)
> +{
> +       int ret = 0, i = value;
> +       unsigned long flags;
> +       const void *desc;
> +
> +       if (i < 0 || i >= USB_RAW_MAX_ENDPOINTS)
> +               return -EINVAL;
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       if (dev->state != STATE_DEV_RUNNING) {
> +               dev_dbg(dev->dev, "fail, device is not running\n");
> +               ret = -EINVAL;
> +               goto out_unlock;
> +       }
> +       if (!dev->gadget) {
> +               dev_dbg(dev->dev, "fail, gadget is not bound\n");
> +               ret = -EBUSY;
> +               goto out_unlock;
> +       }
> +       if (dev->eps[i].state != STATE_EP_ENABLED) {
> +               dev_dbg(&dev->gadget->dev, "fail, endpoint is not enabled\n");
> +               ret = -EINVAL;
> +               goto out_unlock;
> +       }
> +       if (dev->eps[i].disabling) {
> +               dev_dbg(&dev->gadget->dev,
> +                               "fail, disable already in progress\n");
> +               ret = -EINVAL;
> +               goto out_unlock;
> +       }
> +       dev->eps[i].disabling = true;
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +
> +       usb_ep_disable(dev->eps[i].ep);
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
> +       desc = dev->eps[i].ep->desc;
> +       dev->eps[i].ep = NULL;
> +       dev->eps[i].state = STATE_EP_DISABLED;
> +       kfree(desc);
> +       dev->eps[i].disabling = false;
> +
> +out_unlock:
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +       return ret;
> +}
> +
> +static void gadget_ep_complete(struct usb_ep *ep, struct usb_request *req)
> +{
> +       struct raw_ep *r_ep = (struct raw_ep *)ep->driver_data;
> +       struct raw_dev *dev = r_ep->dev;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       if (req->status)
> +               r_ep->status = req->status;
> +       else
> +               r_ep->status = req->actual;
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +
> +       complete((struct completion *)req->context);
> +}
> +
> +static int raw_process_ep_io(struct raw_dev *dev, struct usb_raw_ep_io *io,
> +                               void *data, bool in)
> +{
> +       int ret = 0;
> +       unsigned long flags;
> +       struct raw_ep *ep = &dev->eps[io->ep];
> +       DECLARE_COMPLETION_ONSTACK(done);
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       if (dev->state != STATE_DEV_RUNNING) {
> +               dev_dbg(dev->dev, "fail, device is not running\n");
> +               ret = -EINVAL;
> +               goto out_unlock;
> +       }
> +       if (!dev->gadget) {
> +               dev_dbg(dev->dev, "fail, gadget is not bound\n");
> +               ret = -EBUSY;
> +               goto out_unlock;
> +       }
> +       if (ep->state != STATE_EP_ENABLED) {
> +               dev_dbg(&dev->gadget->dev, "fail, endpoint is not enabled\n");
> +               ret = -EBUSY;
> +               goto out_unlock;
> +       }
> +       if (ep->disabling) {
> +               dev_dbg(&dev->gadget->dev,
> +                               "fail, endpoint is already being disabled\n");
> +               ret = -EBUSY;
> +               goto out_unlock;
> +       }
> +       if (ep->urb_queued) {
> +               dev_dbg(&dev->gadget->dev, "fail, urb already queued\n");
> +               ret = -EBUSY;
> +               goto out_unlock;
> +       }
> +       if ((in && !ep->ep->caps.dir_in) || (!in && ep->ep->caps.dir_in)) {
> +               dev_dbg(&dev->gadget->dev, "fail, wrong direction\n");
> +               ret = -EINVAL;
> +               goto out_unlock;
> +       }
> +
> +       ep->dev = dev;
> +       ep->req->context = &done;
> +       ep->req->complete = gadget_ep_complete;
> +       ep->req->buf = data;
> +       ep->req->length = io->length;
> +       ep->req->zero = usb_raw_io_flags_zero(io->flags);
> +       ep->urb_queued = true;
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +
> +       ret = usb_ep_queue(ep->ep, ep->req, GFP_ATOMIC);
> +       if (ret) {
> +               dev_err(&dev->gadget->dev,
> +                               "fail, usb_ep_queue returned %d\n", ret);
> +               spin_lock_irqsave(&dev->lock, flags);
> +               dev->state = STATE_DEV_FAILED;
> +               goto out_done;
> +       }
> +
> +       ret = wait_for_completion_interruptible(&done);
> +       if (ret) {
> +               dev_dbg(&dev->gadget->dev, "wait interrupted\n");
> +               usb_ep_dequeue(ep->ep, ep->req);
> +               wait_for_completion(&done);
> +               spin_lock_irqsave(&dev->lock, flags);
> +               goto out_done;
> +       }
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       ret = ep->status;
> +
> +out_done:
> +       ep->urb_queued = false;
> +out_unlock:
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +       return ret;
> +}
> +
> +static int raw_ioctl_ep_write(struct raw_dev *dev, unsigned long value)
> +{
> +       int ret = 0;
> +       char *data;
> +       struct usb_raw_ep_io io;
> +
> +       data = raw_alloc_io_data(&io, (void __user *)value, true);
> +       if (IS_ERR(data))
> +               return PTR_ERR(data);
> +       ret = raw_process_ep_io(dev, &io, data, true);
> +       kfree(data);
> +       return ret;
> +}
> +
> +static int raw_ioctl_ep_read(struct raw_dev *dev, unsigned long value)
> +{
> +       int ret = 0;
> +       char *data;
> +       struct usb_raw_ep_io io;
> +       unsigned int length;
> +
> +       data = raw_alloc_io_data(&io, (void __user *)value, false);
> +       if (IS_ERR(data))
> +               return PTR_ERR(data);
> +       ret = raw_process_ep_io(dev, &io, data, false);
> +       if (ret < 0) {
> +               kfree(data);
> +               return ret;
> +       }
> +       length = min(io.length, (unsigned int)ret);
> +       ret = copy_to_user((void __user *)(value + sizeof(io)), data, length);
> +       kfree(data);
> +       return ret;
> +}
> +
> +static int raw_ioctl_configure(struct raw_dev *dev, unsigned long value)
> +{
> +       int ret = 0;
> +       unsigned long flags;
> +
> +       if (value)
> +               return -EINVAL;
> +       spin_lock_irqsave(&dev->lock, flags);
> +       if (dev->state != STATE_DEV_RUNNING) {
> +               dev_dbg(dev->dev, "fail, device is not running\n");
> +               ret = -EINVAL;
> +               goto out_unlock;
> +       }
> +       if (!dev->gadget) {
> +               dev_dbg(dev->dev, "fail, gadget is not bound\n");
> +               ret = -EBUSY;
> +               goto out_unlock;
> +       }
> +       usb_gadget_set_state(dev->gadget, USB_STATE_CONFIGURED);
> +
> +out_unlock:
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +       return ret;
> +}
> +
> +static int raw_ioctl_vbus_draw(struct raw_dev *dev, unsigned long value)
> +{
> +       int ret = 0;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&dev->lock, flags);
> +       if (dev->state != STATE_DEV_RUNNING) {
> +               dev_dbg(dev->dev, "fail, device is not running\n");
> +               ret = -EINVAL;
> +               goto out_unlock;
> +       }
> +       if (!dev->gadget) {
> +               dev_dbg(dev->dev, "fail, gadget is not bound\n");
> +               ret = -EBUSY;
> +               goto out_unlock;
> +       }
> +       usb_gadget_vbus_draw(dev->gadget, 2 * value);
> +
> +out_unlock:
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +       return ret;
> +}
> +
> +static long raw_ioctl(struct file *fd, unsigned int cmd, unsigned long value)
> +{
> +       struct raw_dev *dev = fd->private_data;
> +       int ret = 0;
> +
> +       if (!dev)
> +               return -EBUSY;
> +
> +       switch (cmd) {
> +       case USB_RAW_IOCTL_INIT:
> +               ret = raw_ioctl_init(dev, value);
> +               break;
> +       case USB_RAW_IOCTL_RUN:
> +               ret = raw_ioctl_run(dev, value);
> +               break;
> +       case USB_RAW_IOCTL_EVENT_FETCH:
> +               ret = raw_ioctl_event_fetch(dev, value);
> +               break;
> +       case USB_RAW_IOCTL_EP0_WRITE:
> +               ret = raw_ioctl_ep0_write(dev, value);
> +               break;
> +       case USB_RAW_IOCTL_EP0_READ:
> +               ret = raw_ioctl_ep0_read(dev, value);
> +               break;
> +       case USB_RAW_IOCTL_EP_ENABLE:
> +               ret = raw_ioctl_ep_enable(dev, value);
> +               break;
> +       case USB_RAW_IOCTL_EP_DISABLE:
> +               ret = raw_ioctl_ep_disable(dev, value);
> +               break;
> +       case USB_RAW_IOCTL_EP_WRITE:
> +               ret = raw_ioctl_ep_write(dev, value);
> +               break;
> +       case USB_RAW_IOCTL_EP_READ:
> +               ret = raw_ioctl_ep_read(dev, value);
> +               break;
> +       case USB_RAW_IOCTL_CONFIGURE:
> +               ret = raw_ioctl_configure(dev, value);
> +               break;
> +       case USB_RAW_IOCTL_VBUS_DRAW:
> +               ret = raw_ioctl_vbus_draw(dev, value);
> +               break;
> +       default:
> +               ret = -EINVAL;
> +       }
> +
> +       return ret;
> +}
> +
> +/*----------------------------------------------------------------------*/
> +
> +static const struct file_operations raw_fops = {
> +       .open =                 raw_open,
> +       .unlocked_ioctl =       raw_ioctl,
> +       .compat_ioctl =         raw_ioctl,
> +       .release =              raw_release,
> +       .llseek =               no_llseek,
> +};
> +
> +static struct miscdevice raw_misc_device = {
> +       .minor = MISC_DYNAMIC_MINOR,
> +       .name = DRIVER_NAME,
> +       .fops = &raw_fops,
> +};
> +
> +module_misc_device(raw_misc_device);
> diff --git a/include/uapi/linux/usb/raw_gadget.h b/include/uapi/linux/usb/raw_gadget.h
> new file mode 100644
> index 000000000000..00cbded71061
> --- /dev/null
> +++ b/include/uapi/linux/usb/raw_gadget.h
> @@ -0,0 +1,167 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * USB Raw Gadget driver.
> + *
> + * See Documentation/usb/raw-gadget.rst for more details.
> + */
> +
> +#ifndef _UAPI__LINUX_USB_RAW_GADGET_H
> +#define _UAPI__LINUX_USB_RAW_GADGET_H
> +
> +#include <asm/ioctl.h>
> +#include <linux/types.h>
> +#include <linux/usb/ch9.h>
> +
> +/* Maximum length of driver_name/device_name in the usb_raw_init struct. */
> +#define UDC_NAME_LENGTH_MAX 128
> +
> +/*
> + * struct usb_raw_init - argument for USB_RAW_IOCTL_INIT ioctl.
> + * @speed: The speed of the emulated USB device, takes the same values as
> + *     the usb_device_speed enum: USB_SPEED_FULL, USB_SPEED_HIGH, etc.
> + * @driver_name: The name of the UDC driver.
> + * @device_name: The name of a UDC instance.
> + *
> + * The last two fields identify a UDC the gadget driver should bind to.
> + * For example, Dummy UDC has "dummy_udc" as its driver_name and "dummy_udc.N"
> + * as its device_name, where N in the index of the Dummy UDC instance.
> + * At the same time the dwc2 driver that is used on Raspberry Pi Zero, has
> + * "20980000.usb" as both driver_name and device_name.
> + */
> +struct usb_raw_init {
> +       __u8    driver_name[UDC_NAME_LENGTH_MAX];
> +       __u8    device_name[UDC_NAME_LENGTH_MAX];
> +       __u8    speed;
> +};
> +
> +/* The type of event fetched with the USB_RAW_IOCTL_EVENT_FETCH ioctl. */
> +enum usb_raw_event_type {
> +       USB_RAW_EVENT_INVALID = 0,
> +
> +       /* This event is queued when the driver has bound to a UDC. */
> +       USB_RAW_EVENT_CONNECT = 1,
> +
> +       /* This event is queued when a new control request arrived to ep0. */
> +       USB_RAW_EVENT_CONTROL = 2,
> +
> +       /* The list might grow in the future. */
> +};
> +
> +/*
> + * struct usb_raw_event - argument for USB_RAW_IOCTL_EVENT_FETCH ioctl.
> + * @type: The type of the fetched event.
> + * @length: Length of the data buffer. Updated by the driver and set to the
> + *     actual length of the fetched event data.
> + * @data: A buffer to store the fetched event data.
> + *
> + * Currently the fetched data buffer is empty for USB_RAW_EVENT_CONNECT,
> + * and contains struct usb_ctrlrequest for USB_RAW_EVENT_CONTROL.
> + */
> +struct usb_raw_event {
> +       __u32           type;
> +       __u32           length;
> +       __u8            data[0];
> +};
> +
> +#define USB_RAW_IO_FLAGS_ZERO  0x0001
> +#define USB_RAW_IO_FLAGS_MASK  0x0001
> +
> +static int usb_raw_io_flags_valid(__u16 flags)
> +{
> +       return (flags & ~USB_RAW_IO_FLAGS_MASK) == 0;
> +}
> +
> +static int usb_raw_io_flags_zero(__u16 flags)
> +{
> +       return (flags & USB_RAW_IO_FLAGS_ZERO);
> +}
> +
> +/*
> + * struct usb_raw_ep_io - argument for USB_RAW_IOCTL_EP0/EP_WRITE/READ ioctls.
> + * @ep: Endpoint handle as returned by USB_RAW_IOCTL_EP_ENABLE for
> + *     USB_RAW_IOCTL_EP_WRITE/READ. Ignored for USB_RAW_IOCTL_EP0_WRITE/READ.
> + * @flags: When USB_RAW_IO_FLAGS_ZERO is specified, the zero flag is set on
> + *     the submitted USB request, see include/linux/usb/gadget.h for details.
> + * @length: Length of data.
> + * @data: Data to send for USB_RAW_IOCTL_EP0/EP_WRITE. Buffer to store received
> + *     data for USB_RAW_IOCTL_EP0/EP_READ.
> + */
> +struct usb_raw_ep_io {
> +       __u16           ep;
> +       __u16           flags;
> +       __u32           length;
> +       __u8            data[0];
> +};
> +
> +/*
> + * Initializes a Raw Gadget instance.
> + * Accepts a pointer to the usb_raw_init struct as an argument.
> + * Returns 0 on success or negative error code on failure.
> + */
> +#define USB_RAW_IOCTL_INIT             _IOW('U', 0, struct usb_raw_init)
> +
> +/*
> + * Instructs Raw Gadget to bind to a UDC and start emulating a USB device.
> + * Returns 0 on success or negative error code on failure.
> + */
> +#define USB_RAW_IOCTL_RUN              _IO('U', 1)
> +
> +/*
> + * A blocking ioctl that waits for an event and returns fetched event data to
> + * the user.
> + * Accepts a pointer to the usb_raw_event struct.
> + * Returns 0 on success or negative error code on failure.
> + */
> +#define USB_RAW_IOCTL_EVENT_FETCH      _IOR('U', 2, struct usb_raw_event)
> +
> +/*
> + * Queues an IN (OUT for READ) urb as a response to the last control request
> + * received on endpoint 0, provided that was an IN (OUT for READ) request and
> + * waits until the urb is completed. Copies received data to user for READ.
> + * Accepts a pointer to the usb_raw_ep_io struct as an argument.
> + * Returns length of trasferred data on success or negative error code on
> + * failure.
> + */
> +#define USB_RAW_IOCTL_EP0_WRITE                _IOW('U', 3, struct usb_raw_ep_io)
> +#define USB_RAW_IOCTL_EP0_READ         _IOWR('U', 4, struct usb_raw_ep_io)
> +
> +/*
> + * Finds an endpoint that supports the transfer type specified in the
> + * descriptor and enables it.
> + * Accepts a pointer to the usb_endpoint_descriptor struct as an argument.
> + * Returns enabled endpoint handle on success or negative error code on failure.
> + */
> +#define USB_RAW_IOCTL_EP_ENABLE                _IOW('U', 5, struct usb_endpoint_descriptor)
> +
> +/* Disables specified endpoint.
> + * Accepts endpoint handle as an argument.
> + * Returns 0 on success or negative error code on failure.
> + */
> +#define USB_RAW_IOCTL_EP_DISABLE       _IOW('U', 6, __u32)
> +
> +/*
> + * Queues an IN (OUT for READ) urb as a response to the last control request
> + * received on endpoint usb_raw_ep_io.ep, provided that was an IN (OUT for READ)
> + * request and waits until the urb is completed. Copies received data to user
> + * for READ.
> + * Accepts a pointer to the usb_raw_ep_io struct as an argument.
> + * Returns length of trasferred data on success or negative error code on
> + * failure.
> + */
> +#define USB_RAW_IOCTL_EP_WRITE         _IOW('U', 7, struct usb_raw_ep_io)
> +#define USB_RAW_IOCTL_EP_READ          _IOWR('U', 8, struct usb_raw_ep_io)
> +
> +/*
> + * Switches the gadget into the configured state.
> + * Returns 0 on success or negative error code on failure.
> + */
> +#define USB_RAW_IOCTL_CONFIGURE                _IO('U', 9)
> +
> +/*
> + * Constrains UDC VBUS power usage.
> + * Accepts current limit in 2 mA units as an argument.
> + * Returns 0 on success or negative error code on failure.
> + */
> +#define USB_RAW_IOCTL_VBUS_DRAW                _IOW('U', 10, __u32)
> +
> +#endif /* _UAPI__LINUX_USB_RAW_GADGET_H */
> --
> 2.25.0.rc1.283.g88dfdc4193-goog
>

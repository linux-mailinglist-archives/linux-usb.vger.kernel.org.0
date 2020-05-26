Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98BB31BED76
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 03:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgD3BKL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 21:10:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbgD3BKL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 21:10:11 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18629C035494
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 18:10:11 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d3so1943638pgj.6
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 18:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=950klWqsmWXAo16CE1uiE3ke5ub1fWMjNh+DpVbr7dA=;
        b=ZOV872q8zS3uaTxjcsOe9n3fk/ZvZUlXcdjMn9GG9OVK8qTaiUNLnlEXCQ70mcA1ni
         4a00Beu/rjDoWW6JsLk3MGQ1Vahs7R9czuQDuLgp90sD2faLDK8VhRw8W5lnyJWrRYHf
         che347H3yb2Vinv3wKXZui4ZEhmdZWTOQDpeve2ErBcFmPaKu5rkBSdu3+jhKs3djarw
         9WMwvIU/q40DTKiAsYUbfx2v0IyUuQKMiVe00g8lXtLajevAMywfQ2Cxx73D9GpDaI0m
         RKhrS/YytTS4BJ7txqx4O0N/8eRvXchkP3N9Xgt85vGUXgx6HiQxx3RNUAeuVkDeXZbc
         PBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=950klWqsmWXAo16CE1uiE3ke5ub1fWMjNh+DpVbr7dA=;
        b=ZXiDCj7+R5DpqR6ace4guV6mMY3Dloc/CTrRL850len7HqYLXJdhWF8lcKfPuHqLf+
         HWdZAhr2XJI59dODTdKIh5VXGvFqt2zC42IYxA+cYxGM/ujDI4UJeSR1yNpKTxZsBT50
         6iOdLSc9y1aFnI7LsdOSLySifIcwMG/9bSaYNCc99t1bvAXSvtbQLmXIwRTcM8wwwXTN
         PWv1WcVOqOAbCXlqep5+X/QXad5BFY4aiMZBL14cUY1FI2M0oFwWBAPMA9yL/zJrzvNH
         v8N6oUJXwfIZS+RrhM2HNAn30LG8xEFuZbF+sW2eDAwj+dCHg2nkMy9bl1j3LqWoXwRU
         q6wQ==
X-Gm-Message-State: AGi0PuYPJaOwj6xF1G7C5PQZgS2gnrmY8j/aLJ7JT5XbF78gGtfFOXLh
        pJIXZP4/1A5+zGN0uBNZMasopE2bfiUfRW/IiAVZiA==
X-Google-Smtp-Source: APiQypJ3v7hSl/IwpvOXHeUQscO5kmjITadqcyO8QjON9j1/weeMm6XSk9xWjRQDSy7BRtH6TaDTkFwrXLPAFF345Pg=
X-Received: by 2002:a62:5289:: with SMTP id g131mr1015586pfb.318.1588209010171;
 Wed, 29 Apr 2020 18:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <68e7b62aa7439e3346742b1153d18f65f3e8e388.1588208726.git.andreyknvl@google.com>
In-Reply-To: <68e7b62aa7439e3346742b1153d18f65f3e8e388.1588208726.git.andreyknvl@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 30 Apr 2020 03:09:59 +0200
Message-ID: <CAAeHK+y98BHSfMtEOZaE3dSBgfZBqaYb4v_UP95QEr5PUV9aQg@mail.gmail.com>
Subject: Re: [PATCH USB] usb: raw-gadget: support stalling/halting/wedging endpoints
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 30, 2020 at 3:08 AM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> Raw Gadget is currently unable to stall/halt/wedge gadget endpoints,
> which is required for proper emulation of certain USB classes.
>
> This patch adds a few more ioctls:
>
> - USB_RAW_IOCTL_EP0_STALL allows to stall control endpoint #0 when
>   there's a pending setup request for it.
> - USB_RAW_IOCTL_SET/CLEAR_HALT/WEDGE allow to set/clear halt/wedge status
>   on non-control non-isochronous endpoints.
>
> Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> ---
>
> This goes on top of:
>
> [PATCH v2] usb: raw-gadget: fix gadget endpoint selection
>
> which in turns goes on top of:
>
> [PATCH USB v2 1/2] usb: raw-gadget: fix return value of ep read ioctls
> [PATCH USB v2 2/2] usb: raw-gadget: fix typo in uapi headers
>
> ---
>  Documentation/usb/raw-gadget.rst       |   2 -
>  drivers/usb/gadget/legacy/raw_gadget.c | 131 ++++++++++++++++++++++++-
>  include/uapi/linux/usb/raw_gadget.h    |  15 +++
>  3 files changed, 144 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/usb/raw-gadget.rst b/Documentation/usb/raw-gadget.rst
> index 42bd446d72b2..f70aa635e11d 100644
> --- a/Documentation/usb/raw-gadget.rst
> +++ b/Documentation/usb/raw-gadget.rst
> @@ -49,8 +49,6 @@ The typical usage of Raw Gadget looks like:
>  Potential future improvements
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> -- Implement ioctl's for setting/clearing halt status on endpoints.
> -
>  - Reporting more events (suspend, resume, etc.) through
>    USB_RAW_IOCTL_EVENT_FETCH.
>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
> index e6abbc15341a..9ceeecac5ee0 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -204,7 +204,7 @@ static void dev_free(struct kref *kref)
>         }
>         raw_event_queue_destroy(&dev->queue);
>         for (i = 0; i < dev->eps_num; i++) {
> -               if (dev->eps[i].state != STATE_EP_ENABLED)
> +               if (dev->eps[i].state == STATE_EP_DISABLED)
>                         continue;
>                 usb_ep_disable(dev->eps[i].ep);
>                 usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
> @@ -704,6 +704,50 @@ static int raw_ioctl_ep0_read(struct raw_dev *dev, unsigned long value)
>         return ret;
>  }
>
> +static int raw_ioctl_ep0_stall(struct raw_dev *dev, unsigned long value)
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
> +       if (dev->ep0_urb_queued) {
> +               dev_dbg(&dev->gadget->dev, "fail, urb already queued\n");
> +               ret = -EBUSY;
> +               goto out_unlock;
> +       }
> +       if (!dev->ep0_in_pending && !dev->ep0_out_pending) {
> +               dev_dbg(&dev->gadget->dev, "fail, no request pending\n");
> +               ret = -EBUSY;
> +               goto out_unlock;
> +       }
> +
> +       ret = usb_ep_set_halt(dev->gadget->ep0);
> +       if (ret < 0)
> +               dev_err(&dev->gadget->dev,
> +                               "fail, usb_ep_set_halt returned %d\n", ret);
> +
> +       if (dev->ep0_in_pending)
> +               dev->ep0_in_pending = false;
> +       else
> +               dev->ep0_out_pending = false;
> +
> +out_unlock:
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +       return ret;
> +}
> +
>  static int raw_ioctl_ep_enable(struct raw_dev *dev, unsigned long value)
>  {
>         int ret = 0, i;
> @@ -810,7 +854,7 @@ static int raw_ioctl_ep_disable(struct raw_dev *dev, unsigned long value)
>                 ret = -EBUSY;
>                 goto out_unlock;
>         }
> -       if (dev->eps[i].state != STATE_EP_ENABLED) {
> +       if (dev->eps[i].state == STATE_EP_DISABLED) {
>                 dev_dbg(&dev->gadget->dev, "fail, endpoint is not enabled\n");
>                 ret = -EINVAL;
>                 goto out_unlock;
> @@ -848,6 +892,74 @@ static int raw_ioctl_ep_disable(struct raw_dev *dev, unsigned long value)
>         return ret;
>  }
>
> +static int raw_ioctl_ep_set_clear_halt_wedge(struct raw_dev *dev,
> +               unsigned long value, bool set, bool halt)
> +{
> +       int ret = 0, i = value;
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
> +       if (i < 0 || i >= dev->eps_num) {
> +               dev_dbg(dev->dev, "fail, invalid endpoint\n");
> +               ret = -EBUSY;
> +               goto out_unlock;
> +       }
> +       if (dev->eps[i].state == STATE_EP_DISABLED) {
> +               dev_dbg(&dev->gadget->dev, "fail, endpoint is not enabled\n");
> +               ret = -EINVAL;
> +               goto out_unlock;
> +       }
> +       if (dev->eps[i].disabling) {
> +               dev_dbg(&dev->gadget->dev,
> +                               "fail, disable is in progress\n");
> +               ret = -EINVAL;
> +               goto out_unlock;
> +       }
> +       if (dev->eps[i].urb_queued) {
> +               dev_dbg(&dev->gadget->dev,
> +                               "fail, waiting for urb completion\n");
> +               ret = -EINVAL;
> +               goto out_unlock;
> +       }
> +       if (usb_endpoint_xfer_isoc(dev->eps[i].ep->desc)) {
> +               dev_dbg(&dev->gadget->dev,
> +                               "fail, can't halt/wedge ISO endpoint\n");
> +               ret = -EINVAL;
> +               goto out_unlock;
> +       }
> +
> +       if (set && halt) {
> +               ret = usb_ep_set_halt(dev->eps[i].ep);
> +               if (ret < 0)
> +                       dev_err(&dev->gadget->dev,
> +                               "fail, usb_ep_set_halt returned %d\n", ret);
> +       } else if (!set && halt) {
> +               ret = usb_ep_clear_halt(dev->eps[i].ep);
> +               if (ret < 0)
> +                       dev_err(&dev->gadget->dev,
> +                               "fail, usb_ep_clear_halt returned %d\n", ret);
> +       } else if (set && !halt) {
> +               ret = usb_ep_set_wedge(dev->eps[i].ep);
> +               if (ret < 0)
> +                       dev_err(&dev->gadget->dev,
> +                               "fail, usb_ep_set_wedge returned %d\n", ret);
> +       }
> +
> +out_unlock:
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +       return ret;
> +}
> +
>  static void gadget_ep_complete(struct usb_ep *ep, struct usb_request *req)
>  {
>         struct raw_ep *r_ep = (struct raw_ep *)ep->driver_data;
> @@ -1144,6 +1256,21 @@ static long raw_ioctl(struct file *fd, unsigned int cmd, unsigned long value)
>         case USB_RAW_IOCTL_EPS_INFO:
>                 ret = raw_ioctl_eps_info(dev, value);
>                 break;
> +       case USB_RAW_IOCTL_EP0_STALL:
> +               ret = raw_ioctl_ep0_stall(dev, value);
> +               break;
> +       case USB_RAW_IOCTL_EP_SET_HALT:
> +               ret = raw_ioctl_ep_set_clear_halt_wedge(
> +                                       dev, value, true, true);
> +               break;
> +       case USB_RAW_IOCTL_EP_CLEAR_HALT:
> +               ret = raw_ioctl_ep_set_clear_halt_wedge(
> +                                       dev, value, false, true);
> +               break;
> +       case USB_RAW_IOCTL_EP_SET_WEDGE:
> +               ret = raw_ioctl_ep_set_clear_halt_wedge(
> +                                       dev, value, true, false);
> +               break;
>         default:
>                 ret = -EINVAL;
>         }
> diff --git a/include/uapi/linux/usb/raw_gadget.h b/include/uapi/linux/usb/raw_gadget.h
> index 722124fff290..12ed9fa9ad97 100644
> --- a/include/uapi/linux/usb/raw_gadget.h
> +++ b/include/uapi/linux/usb/raw_gadget.h
> @@ -244,4 +244,19 @@ struct usb_raw_eps_info {
>   */
>  #define USB_RAW_IOCTL_EPS_INFO         _IOR('U', 11, struct usb_raw_eps_info)
>
> +/*
> + * Stalls a pending control request on endpoint 0.
> + * Returns 0 on success or negative error code on failure.
> + */
> +#define USB_RAW_IOCTL_EP0_STALL                _IO('U', 12)
> +
> +/*
> + * Sets or clears halt or wedge status of the endpoint.
> + * Accepts endpoint handle as an argument.
> + * Returns 0 on success or negative error code on failure.
> + */
> +#define USB_RAW_IOCTL_EP_SET_HALT      _IOW('U', 12, __u32)

Eh, messed up ioctl numbers, will send v2 shortly.

> +#define USB_RAW_IOCTL_EP_CLEAR_HALT    _IOW('U', 13, __u32)
> +#define USB_RAW_IOCTL_EP_SET_WEDGE     _IOW('U', 14, __u32)
> +
>  #endif /* _UAPI__LINUX_USB_RAW_GADGET_H */
> --
> 2.26.2.303.gf8c07b1a785-goog
>

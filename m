Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 425B719FCF7
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2020 20:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgDFSUC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Apr 2020 14:20:02 -0400
Received: from netrider.rowland.org ([192.131.102.5]:40793 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726530AbgDFSUC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Apr 2020 14:20:02 -0400
Received: (qmail 21603 invoked by uid 500); 6 Apr 2020 14:20:01 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 6 Apr 2020 14:20:01 -0400
Date:   Mon, 6 Apr 2020 14:20:01 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] usb: raw-gadget: fix raw_event_queue_fetch locking
In-Reply-To: <178e01023f2e6664908f7c9660fa6527a55a22d6.1586191134.git.andreyknvl@google.com>
Message-ID: <Pine.LNX.4.44L0.2004061417050.19877-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 6 Apr 2020, Andrey Konovalov wrote:

> If queue->size check in raw_event_queue_fetch() fails (which normally
> shouldn't happen, that check is a fail-safe), the function returns
> without reenabling interrupts. This patch fixes that issue, along with
> propagating the cause of failure to the function caller.
> 
> Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface"
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> ---
> 
> Greg, this should apply cleanly on top of Dan's "usb: raw-gadget: Fix
> copy_to/from_user() checks" patch.
> 
> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
> index e490ffa1f58b..1582521ec774 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -81,6 +81,7 @@ static int raw_event_queue_add(struct raw_event_queue *queue,
>  static struct usb_raw_event *raw_event_queue_fetch(
>  				struct raw_event_queue *queue)
>  {
> +	int ret;
>  	unsigned long flags;
>  	struct usb_raw_event *event;
>  
> @@ -89,11 +90,14 @@ static struct usb_raw_event *raw_event_queue_fetch(
>  	 * there's at least one event queued by decrementing the semaphore,
>  	 * and then take the lock to protect queue struct fields.
>  	 */
> -	if (down_interruptible(&queue->sema))
> -		return NULL;
> +	ret = down_interruptible(&queue->sema);
> +	if (ret)
> +		return ERR_PTR(ret);
>  	spin_lock_irqsave(&queue->lock, flags);
> -	if (WARN_ON(!queue->size))
> +	if (WARN_ON(!queue->size)) {
> +		spin_unlock_irqrestore(&queue->lock, flags);
>  		return NULL;

Suppose the WARN_ON triggers, and you return NULL here.  Then where do 
you reverse the down_interruptible() on queue->sema?

> +	}
>  	event = queue->events[0];
>  	queue->size--;
>  	memmove(&queue->events[0], &queue->events[1],
> @@ -522,10 +526,17 @@ static int raw_ioctl_event_fetch(struct raw_dev *dev, unsigned long value)
>  	spin_unlock_irqrestore(&dev->lock, flags);
>  
>  	event = raw_event_queue_fetch(&dev->queue);
> -	if (!event) {
> +	if (PTR_ERR(event) == -EINTR) {
>  		dev_dbg(&dev->gadget->dev, "event fetching interrupted\n");
>  		return -EINTR;
>  	}
> +	if (IS_ERR_OR_NULL(event)) {
> +		dev_err(&dev->gadget->dev, "failed to fetch event\n");
> +		spin_lock_irqsave(&dev->lock, flags);
> +		dev->state = STATE_DEV_FAILED;
> +		spin_unlock_irqrestore(&dev->lock, flags);
> +		return -ENODEV;
> +	}

Not here, obviously.  Does the semaphore ever get released?

Alan Stern


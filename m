Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12F6B17E02
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 18:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbfEHQWU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 May 2019 12:22:20 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:40404 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727971AbfEHQWS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 May 2019 12:22:18 -0400
Received: (qmail 5576 invoked by uid 2102); 8 May 2019 12:22:17 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 8 May 2019 12:22:17 -0400
Date:   Wed, 8 May 2019 12:22:17 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     EJ Hsu <ejh@nvidia.com>
cc:     balbi@kernel.org, <linux-usb@vger.kernel.org>
Subject: Re: [V2] usb: gadget: storage: Remove warning message
In-Reply-To: <1557303384-69873-1-git-send-email-ejh@nvidia.com>
Message-ID: <Pine.LNX.4.44L0.1905081203410.1699-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 8 May 2019, EJ Hsu wrote:

> This change is to fix below warning message in following scenario:
> usb_composite_setup_continue: Unexpected call
> 
> When system tried to enter suspend, the fsg_disable() will be called to
> disable fsg driver and send a signal to fsg_main_thread. However, at
> this point, the fsg_main_thread has already been frozen and can not
> respond to this signal. So, this signal will be pended until
> fsg_main_thread wakes up.
> 
> Once system resumes from suspend, fsg_main_thread will detect a signal
> pended and do some corresponding action (in handle_exception()). Then,
> host will send some setup requests (get descriptor, set configuration...)
> to UDC driver trying to enumerate this device. During the handling of "set
> configuration" request, it will try to sync up with fsg_main_thread by
> sending a signal (which is the same as the signal sent by fsg_disable)
> to it. In a similar manner, once the fsg_main_thread receives this
> signal, it will call handle_exception() to handle the request.
> 
> However, if the fsg_main_thread wakes up from suspend a little late and
> "set configuration" request from Host arrives a little earlier,
> fsg_main_thread might come across the request from "set configuration"
> when it handles the signal from fsg_disable(). In this case, it will
> handle this request as well. So, when fsg_main_thread tries to handle
> the signal sent from "set configuration" later, there will nothing left
> to do and warning message "Unexpected call" is printed.
> 
> Signed-off-by: EJ Hsu <ejh@nvidia.com>
> ---
> v2: remove the copyright info
> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 17 ++++++++++++++---
>  drivers/usb/gadget/function/storage_common.h |  1 +
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 043f97a..ba1d827 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -2294,7 +2294,7 @@ static void fsg_disable(struct usb_function *f)
>  {
>  	struct fsg_dev *fsg = fsg_from_func(f);
>  	fsg->common->new_fsg = NULL;

That line is no longer needed.

> -	raise_exception(fsg->common, FSG_STATE_CONFIG_CHANGE);
> +	raise_exception(fsg->common, FSG_STATE_DISCONNECT);
>  }
>  
>  
> @@ -2307,6 +2307,7 @@ static void handle_exception(struct fsg_common *common)
>  	enum fsg_state		old_state;
>  	struct fsg_lun		*curlun;
>  	unsigned int		exception_req_tag;
> +	struct fsg_dev		*fsg;
>  
>  	/*
>  	 * Clear the existing signals.  Anything but SIGUSR1 is converted
> @@ -2413,9 +2414,19 @@ static void handle_exception(struct fsg_common *common)
>  		break;
>  
>  	case FSG_STATE_CONFIG_CHANGE:
> -		do_set_interface(common, common->new_fsg);
> -		if (common->new_fsg)
> +		fsg = common->new_fsg;
> +		/*
> +		 * Add a check here to double confirm if a disconnect event
> +		 * occurs and common->new_fsg has been cleared.
> +		 */
> +		if (fsg) {
> +			do_set_interface(common, fsg);
>  			usb_composite_setup_continue(common->cdev);
> +		}
> +		break;
> +
> +	case FSG_STATE_DISCONNECT:
> +		do_set_interface(common, NULL);
>  		break;
>  
>  	case FSG_STATE_EXIT:
> diff --git a/drivers/usb/gadget/function/storage_common.h b/drivers/usb/gadget/function/storage_common.h
> index e5e3a25..12687f7 100644
> --- a/drivers/usb/gadget/function/storage_common.h
> +++ b/drivers/usb/gadget/function/storage_common.h
> @@ -161,6 +161,7 @@ enum fsg_state {
>  	FSG_STATE_ABORT_BULK_OUT,
>  	FSG_STATE_PROTOCOL_RESET,
>  	FSG_STATE_CONFIG_CHANGE,
> +	FSG_STATE_DISCONNECT,
>  	FSG_STATE_EXIT,
>  	FSG_STATE_TERMINATED
>  };

You forgot to change fsg_unbind() to use FSG_STATE_DISCONNECT.  And
when that's done, it will no longer need to set common->new_fsg to NULL
either.

This is sort of a band-aid approach.  The real problem is that the
original design of the driver never intended for there to be more than
one outstanding CONFIG_CHANGE event, so naturally there are scenarios
where it doesn't work right when that assumption is violated.  This
patch addresses one of those scenarios, but there may be others
remaining.

Ultimately the problem boils down to synchronization with the composite
core.  Some of the callbacks made by the core take time to fully
process, so what should happen if the core makes a second callback 
before the first one is completely processed?

On the other hand, I can't think of anything better at the moment.

Alan Stern


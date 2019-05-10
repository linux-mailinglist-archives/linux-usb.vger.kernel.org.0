Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA0419F29
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2019 16:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbfEJO36 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 May 2019 10:29:58 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:47788 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727790AbfEJO36 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 May 2019 10:29:58 -0400
Received: (qmail 2243 invoked by uid 2102); 10 May 2019 10:29:57 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 10 May 2019 10:29:57 -0400
Date:   Fri, 10 May 2019 10:29:57 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     EJ Hsu <ejh@nvidia.com>
cc:     balbi@kernel.org, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH V3] usb: gadget: storage: Remove warning message
In-Reply-To: <1557486130-50945-1-git-send-email-ejh@nvidia.com>
Message-ID: <Pine.LNX.4.44L0.1905101023400.1516-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 10 May 2019, EJ Hsu wrote:

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
> v3: change fsg_unbind() to use FSG_STATE_DISCONNECT
> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 21 +++++++++++++++------
>  drivers/usb/gadget/function/storage_common.h |  1 +
>  2 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 043f97a..982c3e8 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -2293,8 +2293,7 @@ static int fsg_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
>  static void fsg_disable(struct usb_function *f)
>  {
>  	struct fsg_dev *fsg = fsg_from_func(f);
> -	fsg->common->new_fsg = NULL;
> -	raise_exception(fsg->common, FSG_STATE_CONFIG_CHANGE);
> +	raise_exception(fsg->common, FSG_STATE_DISCONNECT);
>  }
>  
>  
> @@ -2307,6 +2306,7 @@ static void handle_exception(struct fsg_common *common)
>  	enum fsg_state		old_state;
>  	struct fsg_lun		*curlun;
>  	unsigned int		exception_req_tag;
> +	struct fsg_dev		*fsg;
>  
>  	/*
>  	 * Clear the existing signals.  Anything but SIGUSR1 is converted
> @@ -2413,9 +2413,19 @@ static void handle_exception(struct fsg_common *common)
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
> @@ -2989,8 +2999,7 @@ static void fsg_unbind(struct usb_configuration *c, struct usb_function *f)
>  
>  	DBG(fsg, "unbind\n");
>  	if (fsg->common->fsg == fsg) {
> -		fsg->common->new_fsg = NULL;
> -		raise_exception(fsg->common, FSG_STATE_CONFIG_CHANGE);
> +		raise_exception(fsg->common, FSG_STATE_DISCONNECT);
>  		/* FIXME: make interruptible or killable somehow? */
>  		wait_event(common->fsg_wait, common->fsg != fsg);
>  	}
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

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Although at this point the comment you have added to the CONFIG_CHANGE
case and the following test are useless.  Since common->new_fsg doesn't
get cleared any more, it will never be NULL at this point.

What really matters is that the FSG_STATE_DISCONNECT case doesn't call
usb_composite_setup_continue().

Alan Stern


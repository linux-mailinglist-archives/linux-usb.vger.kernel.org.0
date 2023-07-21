Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E30875CCD3
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jul 2023 17:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbjGUP6Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jul 2023 11:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232308AbjGUP57 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jul 2023 11:57:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 327691BD
        for <linux-usb@vger.kernel.org>; Fri, 21 Jul 2023 08:57:57 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0083373D;
        Fri, 21 Jul 2023 17:56:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1689955020;
        bh=IlXIExcbBvo6k4XNPA4lf3EWoW0Cl5RwI1BH5qpDlLQ=;
        h=Date:To:References:From:Subject:In-Reply-To:From;
        b=laxoJqGoMCLowK/jcDyBOLXKPqRG3/qfRTOM2n3UikBAvSk8lXxAtak6WDdGk7d4x
         n1Cu3aK35gHYgnWI5HtTxEZPqEZojhe0Qoprv8dc2MI0o5zwj+CYT0FxVczCeEg7Fs
         lRtv/+sl4OF7FM9rLtXZZSvTjsp3ireAUKQqvMLI=
Message-ID: <8de4bb54-8daa-73c0-b5eb-4aa4b9675ce5@ideasonboard.com>
Date:   Fri, 21 Jul 2023 16:57:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To:     Avichal Rakesh <arakesh@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Badhri Jagan Sridharan <badhri@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <4d7aa3f4-22d9-9f5a-3d70-1bd7148ff4ba@google.com>
Content-Language: en-US
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: Kernel panic when unbinding UVC gadget function
In-Reply-To: <4d7aa3f4-22d9-9f5a-3d70-1bd7148ff4ba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Avichal - thanks for all the detail

On 20/07/2023 02:28, Avichal Rakesh wrote:
> Hey all,
>
> I recently ran into a kernel panic when testing the UVC Gadget Driver.
> The device ramdumps with the following stack when removing the UVC config from
> configfs:
>
> KP: Oops - BUG: Fatal exception: comm:Thread-6 PC:__list_del_entry_valid+0xb0/0xc4 LR:__list_del_entry_valid+0xb0/0xc4
> PC: __list_del_entry_valid+0xb0 <FFFFFFE685330294>
> LR: __list_del_entry_valid+0xb0 <FFFFFFE685330294>
>
> [<FFFFFFE685330294>] __list_del_entry_valid+0xb0
> [<FFFFFFE6857E50AC>] v4l2_fh_del+0x78
> [<FFFFFFE685769774>] uvc_v4l2_release+0xd0
> [<FFFFFFE6857D9B10>] v4l2_release+0xcc
> [<FFFFFFE684EE192C>] __fput+0xf8
> [<FFFFFFE684EE17CC>] ____fput+0xc
> [<FFFFFFE684B5C9E0>] task_work_run+0x138
>
> This looks like a side effect of
> https://lore.kernel.org/lkml/20230608204517.105396-1-badhri@google.com/.
> Effectively, UVC function tried to disconnect the gadget before
> cleaning up resources. However, usb_gadget_unregister_driver which is
> removing the function prevents the gadget from disconnecting until the
> function is unbound.
>
> As of the patch mentioned above, gadget_unbind_driver holds
> udc->connect_lock and calls both usb_gadget_disconnect_locked and
> udc->driver->unbind one after the other.
>
> usb_gadget_disconnect_locked calls into UVC Gadget driver as follows:
>
> 1. usb_gadget_disconnect_locked
> 2. configfs_composite_disconnect
> 3. __composite_disconnect
> 4. uvc_function_disable
>
> udc->driver->unbind calls into UVC Gadget driver as follows:
>
> 1. udc->driver->unbind
> 2. configfs_composite_unbind
> 3. purge_configs_funcs
> 4. uvc_function_unbind
>
> uvc_function_disable notifies the userspace application with
> UVC_EVENT_DISCONNECTED which causes the V4L2 node to be released
> (or unsubscribed to). Either on unsubscribe or on release, the UVC Gadget
> Driver calls uvc_function_disconnect before cleaning up resources. Following
> is the problematic stack from uvc_v4l2_disable.
>
> 1. uvc_v4l2_disable
> 2. uvc_function_disconnect
> 3. usb_function_deactivate
> 4. usb_gadget_deactivate
>
> usb_gadget_deactivate attempts to lock udc->connect_lock as of the patch
> mentioned above.
>
> This means that attempting to unregister the UVC Gadget Driver results in the
> V4L2 resource cleanup being stuck behind udc->connect_lock, which will only
> be released after uvc_function_unbind finishes. This results in either the
> gadget deactivating after the unbind process has finished, or in a Kernel Panic
> as it tries to cleanup a V4L2 node that has been purged.
>
> This leaves us with two options:
> 1. We "fix" the locking in core.c to restore old behavior, and let the
>     usb_gadget_deactivate call go through without locking. However,
>     I am not sure about the specifics of the patch were and what exact issue it
>     was trying to fix.
>
>     Badhri, would you know if relaxing the constraints on
>     usb_gadget_deactivate is feasible? It is possible that other gadget drivers
>     run into similar issues as UVC driver.
>
> 3. UVC Gadget Driver calls usb_function_deactivate to take down the gadget if
>     the userspace application stops listening to the V4L2 node. However, AFAICT
>     disable is called as a part of the gadget resetting. So, if the V4L2 node
>     is released because of UVC_EVENT_DISCONNECT, we can skip calling
>     usb_function_deactivate as the gadget will be reset anyway.
>
>     usb_function documentation seems to agree that if 'disable' is called,
>     the gadget will be reset/reconfigured shortly:
>
>       @disable: (REQUIRED) Indicates the function should be disabled.  Reasons
>        *	  include host resetting or reconfiguring the gadget, and disconnection.
>
> A dirty Patch for option 2 is attached below which skips calling
> usb_function_deactivate if uvc_function_disable was called before. It seems
> to work okay in testing. Let me know if the analysis and solutions seems okay
> and I can upload a formal patch.


For what it's worth the analysis makes sense; the patch looks ok to me so if the conclusion is to 
fix the problem that way I think it's fine, but I'm more inclined to consider this a locking problem 
in core - it'd be better to fix it there I think.

> Thank you!
>
> ---
>   drivers/usb/gadget/function/f_uvc.c | 12 ++++++++++--
>   drivers/usb/gadget/function/uvc.h   |  1 +
>   2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index 5e919fb65833..cef92243f1f7 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -385,7 +385,7 @@ uvc_function_disable(struct usb_function *f)
>   	v4l2_event.type = UVC_EVENT_DISCONNECT;
>   	v4l2_event_queue(&uvc->vdev, &v4l2_event);
>   
> -	uvc->state = UVC_STATE_DISCONNECTED;
> +	uvc->state = UVC_STATE_HOST_DISCONNECTED;
>   
>   	usb_ep_disable(uvc->video.ep);
>   	if (uvc->enable_interrupt_ep)
> @@ -410,8 +410,16 @@ uvc_function_disconnect(struct uvc_device *uvc)
>   {
>   	int ret;
>   
> -	if ((ret = usb_function_deactivate(&uvc->func)) < 0)
> +	if (uvc->state == UVC_STATE_HOST_DISCONNECTED) {
> +		/*
> +		 * Don't deactivate gadget as this is being called in
> +		 * response to the host resetting. Gadget will be deactivated
> +		 * anyway. Just update to state as acknowledgement
> +		 */
> +		uvc->state = UVC_STATE_DISCONNECTED;
> +	} else if ((ret = usb_function_deactivate(&uvc->func)) < 0) {
>   		uvcg_info(&uvc->func, "UVC disconnect failed with %d\n", ret);
> +	}
>   }
>   
>   /* --------------------------------------------------------------------------
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index 100475b1363e..f1e2bc98dc61 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -120,6 +120,7 @@ struct uvc_video {
>   };
>   
>   enum uvc_state {
> +	UVC_STATE_HOST_DISCONNECTED,
>   	UVC_STATE_DISCONNECTED,
>   	UVC_STATE_CONNECTED,
>   	UVC_STATE_STREAMING,

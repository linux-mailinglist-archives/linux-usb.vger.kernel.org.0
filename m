Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58F5C2A7BF6
	for <lists+linux-usb@lfdr.de>; Thu,  5 Nov 2020 11:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbgKEKhN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Nov 2020 05:37:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:44076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbgKEKhN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Nov 2020 05:37:13 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2AB13206E3;
        Thu,  5 Nov 2020 10:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604572630;
        bh=ObOQtJ5/x0uOtTDXpdRr8XT0Mw7WNwsh4CnjbzNvdMM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S6MAOM/FDZaEpRc64GCe+kdLbIqw7UT/Ms5jexGoRmGhticUegG9iU4I0xOL3UjOh
         ilsQg3humpWb3Ne3JiEaS+ICPTb0Me04YudpeaedPZKLZ0munStjX0xkJHeT/ugXW/
         7PtzPZclXPgzfu3axlVdyC4dkJ4ooqyhIB/YNkHY=
Date:   Thu, 5 Nov 2020 11:37:58 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     thomas.haemmerle@wolfvision.net
Cc:     laurent.pinchart@ideasonboard.com, balbi@kernel.org,
        linux-usb@vger.kernel.org, m.tretter@pengutronix.de
Subject: Re: [PATCH] usb: gadget: uvc: fix multiple opens
Message-ID: <20201105103758.GA4033354@kroah.com>
References: <20201105103119.11419-1-thomas.haemmerle@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105103119.11419-1-thomas.haemmerle@wolfvision.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 05, 2020 at 11:31:19AM +0100, thomas.haemmerle@wolfvision.net wrote:
> From: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
> 
> Currently, the UVC function is activated when open on the corresponding
> v4l2 device is called.
> On another open the activation of the function fails since the
> deactivation counter in `usb_function_activate` equals 0. However the
> error is not returned to userspace since the open of the v4l2 device is
> successful.
> 
> On a close the function is deactivated (since deactivation counter still
> equals 0) and the video is disabled in `uvc_v4l2_release`, although
> another process potentially is streaming.
> 
> Move activation of UVC function to subscription on UVC_EVENT_SETUP and
> keep track of the number of subscribers (limited to 1) because there we
> can guarantee for a userspace program utilizing UVC.
> Extend the `struct uvc_file_handle` with member `bool setup_subscriber`
> to tag it for a deactivation of the function.
> 
> With this a process is able to check capabilities of the v4l2 device
> without deactivating the function for another process actually using the
> device for UVC streaming.
> 
> Signed-off-by: Thomas Haemmerle <thomas.haemmerle@wolfvision.net>
> ---
>  drivers/usb/gadget/function/uvc.h      |  2 +
>  drivers/usb/gadget/function/uvc_v4l2.c | 57 +++++++++++++++++++++-----
>  2 files changed, 49 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index 23ee25383c1f..deeec2b80786 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -117,6 +117,7 @@ struct uvc_device {
>  	enum uvc_state state;
>  	struct usb_function func;
>  	struct uvc_video video;
> +	unsigned int connections;
>  
>  	/* Descriptors */
>  	struct {
> @@ -147,6 +148,7 @@ static inline struct uvc_device *to_uvc(struct usb_function *f)
>  struct uvc_file_handle {
>  	struct v4l2_fh vfh;
>  	struct uvc_video *device;
> +	bool connected;
>  };
>  
>  #define to_uvc_file_handle(handle) \
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index 4ca89eab6159..c0c2588b0efb 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -227,17 +227,60 @@ static int
>  uvc_v4l2_subscribe_event(struct v4l2_fh *fh,
>  			 const struct v4l2_event_subscription *sub)
>  {
> +	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
> +	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
> +	int ret;
> +
>  	if (sub->type < UVC_EVENT_FIRST || sub->type > UVC_EVENT_LAST)
>  		return -EINVAL;
>  
> -	return v4l2_event_subscribe(fh, sub, 2, NULL);
> +	if ((sub->type == UVC_EVENT_SETUP) && (uvc->connections >= 1))
> +		return -EBUSY;
> +
> +	ret = v4l2_event_subscribe(fh, sub, 2, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (sub->type == UVC_EVENT_SETUP) {
> +		uvc->connections++;
> +		handle->connected = true;
> +		uvc_function_connect(uvc);
> +	}
> +
> +	return 0;
> +}
> +
> +static void uvc_v4l2_disable(struct uvc_device *uvc)
> +{
> +	if (--uvc->connections)
> +		return;
> +
> +	uvc_function_disconnect(uvc);
> +
> +	mutex_lock(&uvc->video.mutex);
> +	uvcg_video_enable(&uvc->video, 0);
> +	uvcg_free_buffers(&uvc->video.queue);
> +	mutex_unlock(&uvc->video.mutex);
>  }
>  
>  static int
>  uvc_v4l2_unsubscribe_event(struct v4l2_fh *fh,
>  			   const struct v4l2_event_subscription *sub)
>  {
> -	return v4l2_event_unsubscribe(fh, sub);
> +	struct uvc_device *uvc = video_get_drvdata(fh->vdev);
> +	struct uvc_file_handle *handle = to_uvc_file_handle(fh);
> +	int ret;
> +
> +	ret = v4l2_event_unsubscribe(fh, sub);
> +	if (ret < 0)
> +		return ret;
> +
> +	if ((sub->type == UVC_EVENT_SETUP) && handle->connected) {
> +		uvc_v4l2_disable(uvc);
> +		handle->connected = false;
> +	}
> +
> +	return 0;
>  }
>  
>  static long
> @@ -292,7 +335,6 @@ uvc_v4l2_open(struct file *file)
>  	handle->device = &uvc->video;
>  	file->private_data = &handle->vfh;
>  
> -	uvc_function_connect(uvc);
>  	return 0;
>  }
>  
> @@ -302,14 +344,9 @@ uvc_v4l2_release(struct file *file)
>  	struct video_device *vdev = video_devdata(file);
>  	struct uvc_device *uvc = video_get_drvdata(vdev);
>  	struct uvc_file_handle *handle = to_uvc_file_handle(file->private_data);
> -	struct uvc_video *video = handle->device;
> -
> -	uvc_function_disconnect(uvc);
>  
> -	mutex_lock(&video->mutex);
> -	uvcg_video_enable(video, 0);
> -	uvcg_free_buffers(&video->queue);
> -	mutex_unlock(&video->mutex);
> +	if (handle->connected)
> +		uvc_v4l2_disable(uvc);

What prevents connected from changing between the test and the next
call?

I think you need a lock somewhere, a simple integer isn't going to
protect you from anything (hint, and neither will an atomic variable...)

thanks,

greg k-h

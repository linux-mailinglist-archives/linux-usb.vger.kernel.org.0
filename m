Return-Path: <linux-usb+bounces-22444-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 570C6A77DB2
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 16:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 653B53A64A6
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 14:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024F0204C0A;
	Tue,  1 Apr 2025 14:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ELMMGA8q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0195C1E47A9
	for <linux-usb@vger.kernel.org>; Tue,  1 Apr 2025 14:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517682; cv=none; b=CJcsqto+Wg1yb/rADk1cLhkW3dX3SyDIRGy9cLQrmQZTt9JzeSJvqUwd90bpCTYC3jjuyPNzt3tfddssoba2CnGzuhJUo2ct0i5o96JaYDOeCcfsPkrbZ9bKyyEwFBA9yqxjY/tynQUFBwKX1kFLOWSqh3g1jAh1WRlqjWuz/1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517682; c=relaxed/simple;
	bh=IqeR4+j070w8clCsixhEuqi570LmTfs1Y4J3Lw6IgJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kd2xKDGITlyst8KEvHA3myZcVYsw+fVKU10px1DwdtcoPrFeCHb0bKnmftul9TIZUaIxy/DQW8nG8l2lu0ObgatqkWIjWlTSQwL4YhGsh0wKcLNR/AjxqaPZVeUzxqJIUdR7uZE7V1a5UktjrYmSK5aSbUhQKfsWaqso8k6li7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ELMMGA8q; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6ecf99dd567so65193936d6.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Apr 2025 07:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743517680; x=1744122480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tBsGxdJPH/E8qU+Rqu4TXW0stjGoPerhX8EEobjMDSs=;
        b=ELMMGA8qZzm5vwxFzb2+nSUG/Dri4BZJt56lL03E00KOZ6rEsRJFtiHUKuQ+3GMztZ
         oqFAoZYQuFIRNgDWWoR02G5U9cyWEnYO8obNHz2+RH3zRTYcF1sr8H/oF0appHvPVV5V
         eAXAb0/jQC93sQGAZPBOQoG6kUm7YrsNBbVtTpNG548ovqs85d7iOzyMwBWqmBwGklvU
         ZAW8p9aEgR3075eBRQACHEGruYQr6wtJBwTAN04H48ywIaCo5CkE97N1v+7r9PFOepVh
         l8oBUesjtfRIlCQWPy/mcDsfi0kTF3P9vJFKLOZK8inUfxuRO0shiZY8ynbm2wqs9D1c
         XYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517680; x=1744122480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBsGxdJPH/E8qU+Rqu4TXW0stjGoPerhX8EEobjMDSs=;
        b=WsprhRwqB4bxcEPcjLADyTzPGR21fYsv5qnw8BbKVQARL8xOg3+cArH9VYZU5U+sXk
         Nw+NnB5sYF8N76eA0PpRS0N2ZgN6NwLYfRpfaymC6Ceh/AMiIcenXf32d9l1d8f7B96U
         WSeXeKK7Vaoi8mRaDWSS2Brxcv9KMyzH6hsK/gUKeW7XXQ7htdgfqP48vAiWtViz07K1
         0PnLAe9Pvq2cuX0ayfTK37aY96cIaHNW/cSvfmWYVQ1ClaFPDbHQ4FwE9hpHjmzfl7Lp
         doTps45iCUaBnnSK5wgTTRjxAk/v6Iolq8Y3BuQ7viu2wWfwro6O6DdzYX8IxZL2WS1b
         sYQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWWWTN4ohZBar4nAzC7EZkpoM+Z500jXDQNOZIzgxel4XrUbNeFBUcn5zNHvHEy3A6rTKwI1yTW40=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKRR9F7QExxOCt6KGQzLZonzfEbK9sYey4ognbjKwbFl5p0VsM
	248E0eRffazATSOYqCW3k3y6/e6oYXynQVdhz/NprUV4S6X2/hHVc/01Z15jWg==
X-Gm-Gg: ASbGnctE7Ir2qKHvETNg8sapoNnufykKs8+O45T9CwLmDurQ/vG67x0tToWi7TYdsi3
	ZDLogN5x3rLgr7qKwnvXOzSqQ/ddgWAaovpXx+0OM2iFUCqqMStl63S5q53vkyIwJnwTxFSNmaY
	K7Fb+O8nkV71EqmfDSHmGUzA6VeE0hD+TWMNPbmf6VkEQRCbHzHZf2uAWNMWLqwLIBQrkbXbdwG
	H5z0Y4qEAzNEA9I2jGfMfNrB0N5JUgXvsLyGsZXI2n2o9+kqWUEkvMjdYQjsAXsnBpxuUq4zqDs
	RVMtUNTcSazLZatPwOlcY+sMVVbShsO5b3Ku4IeNj/L8+Vzt++pUiWox1LX9sLQ=
X-Google-Smtp-Source: AGHT+IFEKmOpPUSraS63vAvOPCVai+Xm/1BBClBbiL0zWd5LKZcI80Wj5NNyxFqzsAbFWw7hs2psnw==
X-Received: by 2002:ad4:5caa:0:b0:6e5:a0fc:f663 with SMTP id 6a1803df08f44-6eed5e2f0a1mr151164496d6.0.1743517680004;
        Tue, 01 Apr 2025 07:28:00 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9771c2bsm62030206d6.84.2025.04.01.07.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:27:59 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:27:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com,
	sumit.garg@kernel.org, kekrby@gmail.com,
	jeff.johnson@oss.qualcomm.com, elder@kernel.org,
	quic_zijuhu@quicinc.com, ben@decadent.org.uk,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 4/4] usb: host: enable USB offload during system sleep
Message-ID: <cc96ceae-304e-4113-86f8-06b6037ffd4b@rowland.harvard.edu>
References: <20250401062951.3180871-1-guanyulin@google.com>
 <20250401062951.3180871-5-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401062951.3180871-5-guanyulin@google.com>

On Tue, Apr 01, 2025 at 06:22:42AM +0000, Guan-Yu Lin wrote:
> Sharing a USB controller with another entity via xhci-sideband driver
> creates power management complexities. To prevent the USB controller
> from being inadvertently deactivated while in use by the other entity, a
> usage-count based mechanism is implemented. This allows the system to
> manage power effectively, ensuring the controller remains available
> whenever needed.
> In order to maintain full functionality of an offloaded USB devices,
> several changes are made within the suspend flow of such devices:
> - skip usb_suspend_device() so that the port/hub are still active for
>   USB transfers via offloaded path.
> - not suspending the endpoints which are used by USB interfaces marked
>   with needs_remote_wakeup. Namely, skip usb_suspend_interface() and
>   usb_hcd_flush_endpoint() on associated USB interfaces. This reserves a
>   pending interrupt urb during system suspend for handling the interrupt
>   transfer, which is necessary since remote wakeup doesn't apply in the
>   offloaded USB devices when controller is still active.
> - not flushing the endpoints of actively offloaded USB devices. Given
>   that the USB devices is used by another entity, unilaterally flush the
>   endpoint might lead to unexpected behavior on another entity.
> - not suspending the xhci controller. This is done by skipping the
>   suspend/resume callbacks in the xhci platform driver.
> 
> Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> ---

> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -1420,11 +1420,20 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
>  			udev->state == USB_STATE_SUSPENDED)
>  		goto done;
>  
> +	if (msg.event == PM_EVENT_SUSPEND && usb_offload_check(udev)) {
> +		dev_dbg(&udev->dev, "device offload active, skip suspend.\n");
> +		udev->offload_at_suspend = 1;
> +	}
> +
>  	/* Suspend all the interfaces and then udev itself */
>  	if (udev->actconfig) {
>  		n = udev->actconfig->desc.bNumInterfaces;
>  		for (i = n - 1; i >= 0; --i) {
>  			intf = udev->actconfig->interface[i];
> +			if (udev->offload_at_suspend && intf->needs_remote_wakeup) {

Why is intf->needs_remote_wakeup part of this test?  There should be a 
comment explaining this.

> +				dev_dbg(&intf->dev, "active interface on offloaded devices\n");
> +				continue;
> +			}
>  			status = usb_suspend_interface(udev, intf, msg);
>  
>  			/* Ignore errors during system sleep transitions */

> @@ -1524,17 +1536,26 @@ static int usb_resume_both(struct usb_device *udev, pm_message_t msg)
>  	udev->can_submit = 1;
>  
>  	/* Resume the device */
> -	if (udev->state == USB_STATE_SUSPENDED || udev->reset_resume)
> -		status = usb_resume_device(udev, msg);
> +	if (udev->state == USB_STATE_SUSPENDED || udev->reset_resume) {
> +		if (!udev->offload_at_suspend)
> +			status = usb_resume_device(udev, msg);
> +		else
> +			dev_dbg(&udev->dev, "device offload active, skip resume.\n");
> +	}
>  
>  	/* Resume the interfaces */
>  	if (status == 0 && udev->actconfig) {
>  		for (i = 0; i < udev->actconfig->desc.bNumInterfaces; i++) {
>  			intf = udev->actconfig->interface[i];
> +			if (udev->offload_at_suspend) {
> +				dev_dbg(&intf->dev, "active interface on offloaded devices\n");
> +				continue;

If intf->needs_remote_wakeup wasn't set above then the interface was 
suspended.  But here you're not going to resume it.  That can't be 
right.

> +			}
>  			usb_resume_interface(udev, intf, msg,
>  					udev->reset_resume);
>  		}
>  	}
> +	udev->offload_at_suspend = 0;
>  	usb_mark_last_busy(udev);
>  
>   done:

Alan Stern


Return-Path: <linux-usb+bounces-36809-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLS3DcUL9Gk1+AEAu9opvQ
	(envelope-from <linux-usb+bounces-36809-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 04:11:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A27F44A9C1C
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 04:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25158301A412
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2026 02:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A7B28727D;
	Fri,  1 May 2026 02:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tmosR55J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C72A21773D
	for <linux-usb@vger.kernel.org>; Fri,  1 May 2026 02:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777601471; cv=none; b=US//apCxhq2zd2vulWua70FgkxU6nTvclnPdrvaIrqqHQmIah7q6uixumTt7mTp2yD7suXXm8t1vrq8H4EEMqGrzVbacc7HU7NJ5hgHCWM7gqVkFM5LiUW0t1mXZVvix8BgrCO9K1+aTsNwoGtJ15wUPNLFFZkCNZ0vZNnQ8LFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777601471; c=relaxed/simple;
	bh=ZBIg5e09zRyCbSbCRZ3u7zHONoi8L7mUO2CiFGFHEe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxJlAol2FWFvnbM81el0UIW1x3su8fUCR56eRazJJOt53Mqm89TD19PayJpc/ypzMW52JqrgxnCat6AJXomU61ODp6ZLLwkI7V1y+sFbNSVgVAU3Djp1XgL358cXXs921v8R6lErMWrPB4rGLw8NU3onb9crtsp0J0NwNNyRr4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tmosR55J; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50e63771eb0so14138461cf.3
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 19:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777601469; x=1778206269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W0eYKCpwk9cbGy5hbUA4nlbcwIxb8W7yg+4Lb6YiW2k=;
        b=tmosR55JdsieUr4usWAkIQHO3Yjmd6njLRsGnKJz4K9efaver3kTtVcvccgOHDP8J4
         QUmtFMZ9gTe4ON6heM9y2YTEZJSrUCbgNQBI+R5WY40cFx8wCpLYQgmRW4ghyE6owDuq
         nZ41E+bklV/vj6M7kORY4lVX38UrIUBhVDL+EL57WS0vAxXZ5B6oRscsuDfBShRK/m6P
         cAW75Uac0wj/TB5HtBzfcUcja20NVi1oXW2u/ZNVsX2nzncVYf7o50tI7/Ky8GO2uc4Y
         S8rsI0qGpORaDszCr/aGHeO/uHy4U97aWtEpwhzKXKf4iTi8xAhZUfB4facvYhdWgQrM
         LpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777601469; x=1778206269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W0eYKCpwk9cbGy5hbUA4nlbcwIxb8W7yg+4Lb6YiW2k=;
        b=m08OZjmIfyMIZAh02tELM4JFqYakW+eI27Ub2TOat2c1h5dLfnkzCoHUHIr+Z7bVJy
         1+qMS86/vyuGWwIV43Mx+p59fof7BM6YTNc4IvseJWauQ+9EGXbEyJYfsbg/lFBfO0hN
         2qNY67+hKKIjGCJEoIxBsyTC100Rvw5feivHsl3q0bb8K3UAOMxSURDLkFQAWTxQSP/V
         yQAUEiBpoZjQj38oeyHPDwB4qtHXc36EhwfskQEMCrgxW5l/i8baghNhnlzpsuwojU1B
         BeTzPO2ni8Cre/KPEcfGLBBzW3l4rx7X4T871Gokk4a5dXsQ6RECiSfv/cJagPFpmWTT
         hWpw==
X-Gm-Message-State: AOJu0YwlNEgIfNyKmTkAFERBMUfcmEb1yoqTIQwjesLiLuRokAuURkAi
	oYEl+QusAywPP24+MtqPums5QZtgz7zwzz+e8INtY5Ms8DquLKodi52XqEVd/Fz6jaB09w6dPk6
	KPcI=
X-Gm-Gg: AeBDiev13EklKEvwiPRROycoXoiMOe7NeG7zyHvfhyhhF3tS6cOr9Kr/7Ec9DfQH+02
	HQldwdiz6kr8c8hUQT23tKj7s08pI/MxK+DPtJs+BFV5pFzttiyxzBbw5le3BPGiIzojwIy1X1m
	a9DFC0yvXz4Hl/piuGtTJ5FHtjMlcwF1tZZWxNam/gWQLAh2E38A5F5pojY3dfi+wWPUjzNWiO1
	96uWk0G8dEwJsuM4nzVpF8IkJVtJGo/KpfeCsdeWwWgFSgTyGkRDB1xZAi0ye/1ikLECMJCuDcY
	FEOGUXU7MaJXPNqVMWC5xU2cvVOR2C32Du/bkQoqCj5drKIV3s7sBWgME0yFDJKTk253ZfbCidj
	mUIVY4IBAl1dOTRxTMLZQ/ag+OpdZkFykrTbLb1xMRrBVbmUv8dXk8+GMMnszuC5IKdbv4rpIxy
	H4BcF5wjJjy/ED6gmgZrOVA8g+TvZYFB7WWuQrx2MhlR0XLQ==
X-Received: by 2002:a05:622a:1354:b0:50d:5f34:9a with SMTP id d75a77b69052e-5102add7284mr81875851cf.28.1777601469072;
        Thu, 30 Apr 2026 19:11:09 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::a0bd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b35795sm2992071cf.16.2026.04.30.19.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 19:11:08 -0700 (PDT)
Date: Thu, 30 Apr 2026 22:11:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: USB list <linux-usb@vger.kernel.org>
Subject: Re: Clear change log now?
Message-ID: <146c7731-22a8-4433-a274-17252b795348@rowland.harvard.edu>
References: <9bb3ac22-b0e4-4ae3-854b-8fac8fda1003@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bb3ac22-b0e4-4ae3-854b-8fac8fda1003@suse.com>
X-Rspamd-Queue-Id: A27F44A9C1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TAGGED_FROM(0.00)[bounces-36809-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:email]

On Fri, May 01, 2026 at 12:31:17AM +0200, Oliver Neukum wrote:
> Hi,
> 
> does this explanation why the patch is necessary clarify the issue?

Yes, it's much better.

However, I'm still not entirely convinced that this is necessary, 
because a device undergoing SCSI error handling should already be 
powered up.  There won't be any need to wait for some other thread to 
resume it.

On the other hand, I don't think the patch will hurt anything very much.

Alan Stern

> From 427990a43583f3a0b443f14ea92c4ffcdafba578 Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Tue, 28 Apr 2026 15:38:17 +0200
> Subject: [PATCH] usb: core: hcd: fix possible deadlock in rh control transfers
> 
> From within the SCSI error handler memory allocations must not
> trigger IO. Handling errors in UAS and the storage driver may
> involve resetting a device. The thread doing the reset itself
> relies on VM magic to make sure its own allocations do not
> trigger IO.
> 
> In addition to its own allocations, however, a task that
> is not allowed to trigger IO must also not wait for other tasks
> that can trigger IO. Resetting a device involves resuming
> the device. Resuming a device can race with other tasks
> doing PM operations. In such cases the task must wait
> for the other task to finish its PM operations. That task
> is not benefitting from VM magic. Hence it needs to use
> GFP_NOIO while doing PM operations.
> That means that GFP_NOIO must be heeded doing control transfers
> to root hubs, because PM operations involve commands
> to root hubs, if a device is directly attached to a root hub.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/core/hcd.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 89221f1ce769..29c74ed40526 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -448,7 +448,8 @@ rh_string(int id, struct usb_hcd const *hcd, u8 *data, unsigned len)
>  
>  
>  /* Root hub control transfers execute synchronously */
> -static int rh_call_control (struct usb_hcd *hcd, struct urb *urb)
> +static int rh_call_control(struct usb_hcd *hcd,
> +		struct urb *urb, gfp_t mem_flags)
>  {
>  	struct usb_ctrlrequest *cmd;
>  	u16		typeReq, wValue, wIndex, wLength;
> @@ -483,8 +484,8 @@ static int rh_call_control (struct usb_hcd *hcd, struct urb *urb)
>  	 * tbuf should be at least as big as the
>  	 * USB hub descriptor.
>  	 */
> -	tbuf_size =  max_t(u16, sizeof(struct usb_hub_descriptor), wLength);
> -	tbuf = kzalloc(tbuf_size, GFP_KERNEL);
> +	tbuf_size = max_t(u16, sizeof(struct usb_hub_descriptor), wLength);
> +	tbuf = kzalloc(tbuf_size, mem_flags);
>  	if (!tbuf) {
>  		status = -ENOMEM;
>  		goto err_alloc;
> @@ -809,12 +810,13 @@ static int rh_queue_status (struct usb_hcd *hcd, struct urb *urb)
>  	return retval;
>  }
>  
> -static int rh_urb_enqueue (struct usb_hcd *hcd, struct urb *urb)
> +static int rh_urb_enqueue(struct usb_hcd *hcd,
> +		struct urb *urb, gfp_t mem_flags)
>  {
>  	if (usb_endpoint_xfer_int(&urb->ep->desc))
>  		return rh_queue_status (hcd, urb);
>  	if (usb_endpoint_xfer_control(&urb->ep->desc))
> -		return rh_call_control (hcd, urb);
> +		return rh_call_control(hcd, urb, mem_flags);
>  	return -EINVAL;
>  }
>  
> @@ -1535,7 +1537,7 @@ int usb_hcd_submit_urb (struct urb *urb, gfp_t mem_flags)
>  	 */
>  
>  	if (is_root_hub(urb->dev)) {
> -		status = rh_urb_enqueue(hcd, urb);
> +		status = rh_urb_enqueue(hcd, urb, mem_flags);
>  	} else {
>  		status = map_urb_for_dma(hcd, urb, mem_flags);
>  		if (likely(status == 0)) {
> -- 
> 2.54.0
> 



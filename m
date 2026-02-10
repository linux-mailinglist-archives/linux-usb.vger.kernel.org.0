Return-Path: <linux-usb+bounces-33234-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GnkNiXyimnUOwAAu9opvQ
	(envelope-from <linux-usb+bounces-33234-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 09:53:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C6F1186C1
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 09:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D7BF3058540
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 08:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D986533A9E5;
	Tue, 10 Feb 2026 08:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XZ7aeMSj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399DA1CEAC2
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770713520; cv=none; b=R9ZxgGtCe9K6RvQgPKjrGj2joo4aPBMMJlVoRo1oNrAnMUcEigX75Vjs9B5X99753U8uezFkCPXHxQSNTBilY09WxSc85hOTA3uJRCrDoqUcJc1QmDQDqyqVqYSF9MnpJo0HBQJR2fhr+CSYOLGQrBqyrEXL19247cAhNC668Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770713520; c=relaxed/simple;
	bh=wsDouzEuFywJC1fs7fG3Tykm7XddbLec6GZLDLH+hi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YcOOjd7Z7XaIPWmZVN2FBy9m6Veu4BUAI+ljkZJrhXedJiF61Jyt5tcQCaNW8UpTOsdrDwXUGuhIvkJl+XhaLWekh6cKqMJHAGb1Vvf/jp5Sc54Krt0PXhnli3DzvPL3hWW3+gMwzvERDuPBsKHiflwEt0eQOlVAkvQ3vYgS/Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XZ7aeMSj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so50603675e9.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 00:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770713518; x=1771318318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kld79VBlx0/KGGADDBMFM0GxEh6j3pQr6Y/QQVtDOEU=;
        b=XZ7aeMSjC7N1ioL+N2Yhq87xMaMK8i9WLSiQPbJkvpShgNR+h8b0MR1h9VN1JtZAPj
         DF92l4Zc5oeOs4GtN4JvOXt8n6OO7owMVe+IH1DrtQaz9ksrH0Rtovj61i0r4QmpuynM
         a+IPxFr4rByf2JF3IN7KriRlKiVJu6B4o0F8dmEThsIag6zxWJVDuDc++s8lHdKZOZ7B
         +V6KGiuPMyD5KJUQxwBaFt4/h6RWmfO+QWGWKdN0rGrSotDyV7gVgdKFPm2W7a+UDtxE
         JztNszPJHkVsDmpYTAvLQw/2nnnVI75jfrZIggybRGZuF3GyAHTPMKlCm/gHAKKymTkp
         o0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770713518; x=1771318318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kld79VBlx0/KGGADDBMFM0GxEh6j3pQr6Y/QQVtDOEU=;
        b=WmNlPpqC9BplGLKdzSEOVxGL6ZtPUnxTdk8pcoUjgn6aUwcUWHo5VPw3ynkYR563Jt
         i0uLR9SbIpMP64j4nv0sIUENLVpD68rd1svIcy2yRWlmM7ASTahkB7MG+Ce5mg/fMFKP
         bBFSgKebGeag3it3OvW/BNRMzMMh5LJZ3GA3eTw8aJ1H/34IkSLMgAqkuANBRbYIDtAI
         0r1IcE2SD14j8UK9gJ7Zcs/Z6h5jBYdLALMuTXlXwgg/9WWvitxOxUN99QDMKy5ODKEr
         hi6ZaeM1a3O1wVMrg9j6yKHuEHJDjRjyMrWCOo5/CgviY5f6URfmYLCx8r+DTedAe16x
         LDhg==
X-Gm-Message-State: AOJu0Yx94dLha0Vvv5j7dCCpo2uHNO9syArtS147iucPIkWLaqgvoHWi
	njPdxnQUD1nnNS2yoF2qO3PIkQmUJsucZE8ZpCVVvNVPURZcGXC+cOWYwz2M5a1Cny0cC7Mb66i
	XRRyI
X-Gm-Gg: AZuq6aImKJfnCB5u43f2kNqp3zPwg4dnU9fRUnrXsfFS93kN89LSJstWCzcTDd43UWD
	KYb4/8Ff8dvIeLQnODkss5i91Hy9Y6ZrLt8++gVH1N5dHiGTLtNR6YSLynXU55wB0RZWkcrSVCH
	j90R7Q0sFJlsiRYl2zQY1MgOVXnwCh+FwXck6FhKUWC1M7FBX8szfV0hT8vcize7f6782UyoMA/
	6PSDAgD6XZiFMHIbRqdu9tnZwOzptBG/Nb8g/ymMdPuh0l8l+I16/RqweJp3iNOlUJqi2BJsIu2
	ycw+H08xwqnjkYx/yfb1zax2vI87MtC/AO33MfUFpFsNjwmvmJ6BAK6a0rn7UGXbu8fuGLlVEGE
	vXW57XWVQDJiKjSxVXqn2qYKFNSclBPeRboaR831XrVo3Ns2Aw5xUhEmemtByTEEppJjz11337q
	XxB+u3bIoP1IS09fQp44IoRgVUA+V8tEzEMMtSGYhU72uw+cMmU92BX7V7TZnFGKRoU+U=
X-Received: by 2002:a05:600c:c050:b0:47e:e452:ec12 with SMTP id 5b1f17b1804b1-4834ffa5efamr13226145e9.15.1770713517463;
        Tue, 10 Feb 2026 00:51:57 -0800 (PST)
Received: from ?IPV6:2a02:3033:271:6136:26bf:3287:7b26:bb30? ([2a02:3033:271:6136:26bf:3287:7b26:bb30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5e1a8esm43259635e9.5.2026.02.10.00.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 00:51:56 -0800 (PST)
Message-ID: <a57d602d-9868-4dc0-9983-9543903a0130@suse.com>
Date: Tue, 10 Feb 2026 09:51:55 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usbcore: Reject excessively long uninterruptible
 timeouts
To: Alan Stern <stern@rowland.harvard.edu>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
References: <9a7f1f3d-7063-426e-85be-e32a5e2dc431@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <9a7f1f3d-7063-426e-85be-e32a5e2dc431@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-33234-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: 58C6F1186C1
X-Rspamd-Action: no action



On 09.02.26 20:59, Alan Stern wrote:

> Note that this will affect the timeouts accepted by the
> USBDEVFS_CONTROL and USBDEVFS_BULK ioctls in usbfs, since they rely on
> the synchronous message API.

That means you cannot just change the semantics of the call.

> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Link: https://lore.kernel.org/linux-usb/3acfe838-6334-4f6d-be7c-4bb01704b33d@rowland.harvard.edu/
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> CC: stable@vger.kernel.org
> 
> ---
> 
>   drivers/usb/core/message.c |   23 ++++++++++++++---------
>   include/linux/usb.h        |    3 +++
>   2 files changed, 17 insertions(+), 9 deletions(-)
> 
> Index: usb-devel/drivers/usb/core/message.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/message.c
> +++ usb-devel/drivers/usb/core/message.c
> @@ -46,6 +46,9 @@ static void usb_api_blocking_completion(
>    * is NOT interruptible. Many device driver i/o requests should be
>    * interruptible and therefore these drivers should implement their
>    * own interruptible routines.
> + *
> + * Because the wait is uninterruptible, we enforce a maximum limit on
> + * the length of the timeout.
>    */
>   static int usb_start_wait_urb(struct urb *urb, int timeout, int *actual_length)

If you are touching this at all, we might look into the fundamental question
of why a timeout can be negative at all.

>   {
> @@ -56,11 +59,17 @@ static int usb_start_wait_urb(struct urb
>   	init_completion(&ctx.done);
>   	urb->context = &ctx;
>   	urb->actual_length = 0;
> +
> +	if (timeout <= 0 || timeout > USB_MAX_SYNCHRONOUS_TIMEOUT) {

You are rejecting values that used to be acceptable. That is unavoidable,
but somebody was surely foolish enough to pass 0 from user space in every
case and got away with it until now.

It would seem to me that you need to at least convert 0 to
USB_MAX_SYNCHRONOUS_TIMEOUT, if not outright capping the
timeout instead of erroring out.

	Regards
		Oliver



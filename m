Return-Path: <linux-usb+bounces-31368-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 874FBCB323B
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 15:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8911B3004CFE
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 14:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F39A3233FA;
	Wed, 10 Dec 2025 14:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b="MkcH4VSO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.kernel-space.org (v2202511311555398556.powersrv.de [46.38.245.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545632E92B4
	for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 14:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.245.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765376780; cv=none; b=kAOVfEvD0pW+9D5iy/GSM7Eu3nK8H88AgNJn1v4re7dC70YIL9jvOL9wm8BSWEbyrHFMzdz3x8uJ8ORvkjOMIAPV2mdweMFpKhchAdkvtSbJ44x7t0tC+AckKKCnL3SruXWLuarIHbU7U7Rxp4PJ8iujqxvxc6vq46e5TU7Byj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765376780; c=relaxed/simple;
	bh=pYUhUcRTkTChSG61Fbzr7/0JibstPRX9XddhLldFgzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Si5W1nGQUcVPmpDISi/6fNSysDgKGM/8/GFklWuPGYHMnzWvaSTO6BIATfJjqhR6MbwkwRjoIMwxIEzh/nNrq+c3gWuJ902e8rVERmsP52FdBzs6eH1HOUgvNGI7Wny/qRJI068iqkyfLceBbB2BalvSemO0kEGAX5Lek68uRm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel-space.org; spf=pass smtp.mailfrom=kernel-space.org; dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b=MkcH4VSO; arc=none smtp.client-ip=46.38.245.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernel-space.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel-space.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
	s=s1; t=1765376375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iKBHrXxL4yGb7kqfSw6JlHOQbCHiitIUewV/B52KDrA=;
	b=MkcH4VSOWDXSWsX3h+Wr7Z6INa88VevsKKtG6h004qN1j5DuiR1sVJvL1HujMmzZNdwvUu
	dLuOKqyotalJGw99lcq6ATnCZuHYYFVHj+HK2PEei82P9UTgjOxL58lXvkZeHha4ZPuhZR
	MihfZlls4TkPShZFre4RHHEJzzIOzvo=
Received: from [IPV6:2a07:7e81:7daa:0:62cf:84ff:feee:627] (<unknown> [2a07:7e81:7daa:0:62cf:84ff:feee:627])
	by oreshnik (OpenSMTPD) with ESMTPSA id 03020e42 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 10 Dec 2025 14:19:35 +0000 (UTC)
Message-ID: <6ca433ef-5395-4143-8203-504f9237339e@kernel-space.org>
Date: Wed, 10 Dec 2025 15:20:18 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: testusb: epipe errors on test 9 and 10
To: Alan Stern <stern@rowland.harvard.edu>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>
 <c17c0821-3dd8-47b3-b795-f42675fb0a75@rowland.harvard.edu>
 <d8aa2f1e-fc44-4bb9-8245-d6ac76047dc3@kernel-space.org>
 <9776c9fb-8fed-4e79-b312-0b1a872911b8@rowland.harvard.edu>
 <bcc4f76a-985b-4932-a455-b4fedcafcd97@rowland.harvard.edu>
 <20251201232911.s5diakt3w7ztzjv2@synopsys.com>
 <82bc662b-70c6-46f8-acc7-3a666965d13e@rowland.harvard.edu>
 <20251202042305.wl2uvxoe55ay5vxw@synopsys.com>
 <5daaa7f3-7c51-4f72-b6e9-cf4f015f758b@rowland.harvard.edu>
 <20251202232237.w624ilc24wad7chg@synopsys.com>
 <06229e27-db5f-410c-8c80-39cd2a18aed7@rowland.harvard.edu>
Content-Language: en-US, it
From: Angelo Dureghello <angelo@kernel-space.org>
In-Reply-To: <06229e27-db5f-410c-8c80-39cd2a18aed7@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alan,

On 12/4/25 23:26, Alan Stern wrote:
> On Tue, Dec 02, 2025 at 11:22:38PM +0000, Thinh Nguyen wrote:
>> On Tue, Dec 02, 2025, Alan Stern wrote:
>>> On Tue, Dec 02, 2025 at 04:23:13AM +0000, Thinh Nguyen wrote:
>>>> On Mon, Dec 01, 2025, Alan Stern wrote:
>>>>> Are we talking about the same thing?  Clear-Feature is different from
>>>>> Get-Interface-Status.
>>>>>
>>>> Ah... I just saw the subject line testusb -EPIPE and assumed that it's
>>>> related to ClearFeature(halt_ep)..
>>>>
>>>> The Get-Interface-Status should be hand-off and handled by gzero right?
>>>> The gadget driver knows about the status of the interface, not UDC
>>>> driver.
>>> For USB-2 devices, Get-Interface-Status is always supposed to return two
>>> bytes of 0.  For USB-3 devices, it returns information about Function
>>> Remote Wakeup and Function Remote Wakeup Capable, which is handled
>>> already by the composite core.
>>>
>>> So for SuperSpeed and above, the request should be delegated.  For high
>>> speed and below, it could be done either way.  (dummy-hcd makes the
>>> opposite mistake; it always returns zeros for Get-Interface-Status and
>>> never delegates.)
>>>
>>> If you think it's best always to delegate the request then composite.c
>>> needs to be changed; it should handle the reply for non-SuperSpeed
>>> connections.  A simple change; I can do it.  What do you prefer?
>>>
>> Right this change is simple. I think it's probably easier to delegate
>> and enforce this in the composite library instead of auditing all the
>> UDC drivers.
> Here's a patch to try.  Angelo, can you test this?
>
> Alan Stern
>
>
>
> Index: usb-devel/drivers/usb/gadget/composite.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/gadget/composite.c
> +++ usb-devel/drivers/usb/gadget/composite.c
> @@ -1966,25 +1966,27 @@ composite_setup(struct usb_gadget *gadge
>   			break;
>   		}
>   
> -		/*
> -		 * USB 3.0 additions:
> -		 * Function driver should handle get_status request. If such cb
> -		 * wasn't supplied we respond with default value = 0
> -		 * Note: function driver should supply such cb only for the
> -		 * first interface of the function
> -		 */
> -		if (!gadget_is_superspeed(gadget))
> -			goto unknown;
> +		/* UDC driver should handle device and endpoint recipients */
>   		if (ctrl->bRequestType != (USB_DIR_IN | USB_RECIP_INTERFACE))
>   			goto unknown;
> -		value = 2;	/* This is the length of the get_status reply */
> -		put_unaligned_le16(0, req->buf);
>   		if (!cdev->config || intf >= MAX_CONFIG_INTERFACES)
>   			break;
>   		f = cdev->config->interface[intf];
>   		if (!f)
>   			break;
>   
> +		value = 2;	/* This is the length of the get_status reply */
> +		put_unaligned_le16(0, req->buf);
> +		if (!gadget_is_superspeed(gadget))
> +			break;	/* USB-2 always returns zeros */
> +
> +		/*
> +		 * USB 3.0 additions:
> +		 * Function driver should handle get_status request. If such cb
> +		 * wasn't supplied we respond with default value = 0
> +		 * Note: function driver should supply such cb only for the
> +		 * first interface of the function
> +		 */
>   		if (f->get_status) {
>   			status = f->get_status(f);
>   
thanks a lot.

I am actually stuck working in 5-4 kernel, where the issue was detected, 
but will do my best to test this
as soon as i can .

Regards,
angelo




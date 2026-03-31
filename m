Return-Path: <linux-usb+bounces-35747-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIbiHjFWzGn/SQYAu9opvQ
	(envelope-from <linux-usb+bounces-35747-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 01:18:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DD0372A8E
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 01:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 495A13027B47
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 23:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2FA3B47F0;
	Tue, 31 Mar 2026 23:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BVCnSKrM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFC8225417
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 23:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774999069; cv=none; b=K8xvYHNe3EHstQoAO9ETChp9MMDwg1dT5ovuzv4gEHZbY5bYRizdeYbnOfitryEu0/G2hC+YhVjP9VPPILMtYyWyqGfLNE93UrPEeG/MOHBC+GMOCLxSPraCVYueS4xfi5RPwNlxHccJDvh7P+bFIXzHM3+NHwjkyWpl1kXxpnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774999069; c=relaxed/simple;
	bh=aHZRNoTvbdlI/EombGoD9iP8bTf4Aj4gSIgmhshYEx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iU1yuzA6CS+UPNgC1N2bZEznxie4HcfDkFgvT4tgK6qkU6Y3wAAagTlJn7q1sC9AUHupNnHiME/kOvpzqxdkebPI8kl+tqZ/sc1JHDgfXPAtudvtuB3kjBeNWeRbYDdmlpgj4DhESObTC54oicX5PPN0D8bRGM889G7+X5AFTMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BVCnSKrM; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d7447778b9so3376529a34.2
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 16:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774999066; x=1775603866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mwEv/M/xQBFIbRAjlXXEdV7PZOOUIQNp5LFHgoTzio=;
        b=BVCnSKrM9DvXuhNrDHYF8dDrfGbTXc2b0h1u9bjWhhnjlsXyWtBmxEtuabf990UrNj
         eaDlMMn2mlxlOjD0/0hHNXrIMucgm7hBPEitUVBRBWrddwtnmMAcf2pCbrVXit+f+lxP
         fNBQwGNOezu93ALYcvJ80bPQPJ0d36Cz384xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774999066; x=1775603866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mwEv/M/xQBFIbRAjlXXEdV7PZOOUIQNp5LFHgoTzio=;
        b=FUFOkSNcsn2IhnIkza6TsFZeZ6+KvF0861j7YRmhrLNYxlcuxFLSSk1Bszz0F44XRU
         U9sDn5rG0KbWU34zFPWcLxj/+xSZl1B0aCaBXQYbri/csM89u8z/AJelvF7H+4KbWzvz
         bORaQfuMaBGZjzWU8EXWCH75N/AG8p9SwCTQapVk3B/6pCi1BaoJKG0TOlT9BNgscTgC
         3fJE3zlsxRw7CIP7Yr2Yt6Ia03lX/ZW/LBOhG4Ksy5WKmlE4xzQ7v4s3QNBWUGd3pGNY
         JDSPUh4GURHKHVHSt/oZ2IOp31jWOwbwoW42lGnFIHrpbuN12tAPYtC0lLyGjq6q4WpN
         XguQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqdI6GB4k0GB8CYurTI1ak5SUy1v/fpa2zs9nRs2WMXk6Xz2ckMY/CP+ogJocfxVqA/yZcjapIpds=@vger.kernel.org
X-Gm-Message-State: AOJu0YynW/7yreunHjM8dC51zK1GAZ7ySuXzN8u5nDnV7hB/lc7+gQhJ
	PWqmWr8hMfhaD95ScIICsEBEt128gXUFBvj+F8C4RhQBnuqRzK4tCzoBd3PsVrhMghDOWJz392Q
	vH31PRWo=
X-Gm-Gg: ATEYQzz4tRzuynnp6/SKSJB5QyTLBpcfKYKoMxXH0B0MB960BdZ2icDpASzZXzj1FzF
	0xMbkalJRtue+T+IZNqkqSKBJvFYQqz8/0Ji73u+tABTHNIbAXOB7ekPzf6qXCnhWKq0MFFS6Rt
	0DKtQeNfwLrc/PbzMxAiwGX+crqvegnkIcYih2YZRFn0BmsDwdnn+z3Qed8vXbSM6ztJiXva/bz
	dUHS9D1EwZOfEf8PPRxMwMFDptDwNq3YFmOs4OW08sjo4faJXQyRhWflmUBjmVl6idjSOsJLK4L
	hWa0041iNUM0p6fZENz+zQePrsr5bVDXOdCmnDVVVl7POYmIBVPLhF5ZLmyFA7BkA3DBm391Qw8
	3piz9p5jL+Y/mItHK/lh3xSpqTutriZXeqpFsvEDMCuoMInoHt4I0tlorUmNy+PY2Ba4NJzO4+K
	wcfmDjjz/p1cAjZNPVIYYB0OSoiqyQuNgeMn4=
X-Received: by 2002:a05:6830:7009:b0:7d7:ecef:1460 with SMTP id 46e09a7af769-7db9946a0d8mr1102070a34.31.1774999065919;
        Tue, 31 Mar 2026 16:17:45 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a335440sm9117890a34.4.2026.03.31.16.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 16:17:45 -0700 (PDT)
Message-ID: <34da1928-f6e7-43fb-a436-6bc02e262698@linuxfoundation.org>
Date: Tue, 31 Mar 2026 17:17:44 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: vhci: reject RET_SUBMIT with inflated
 number_of_packets
To: Nathan Rebello <nathan.c.rebello@gmail.com>, linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, addcontent08@gmail.com,
 kyungtae.kim@dartmouth.edu, stable@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260327064449.735-1-nathan.c.rebello@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260327064449.735-1-nathan.c.rebello@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,dartmouth.edu,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35747-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email,linuxfoundation.org:mid]
X-Rspamd-Queue-Id: 01DD0372A8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 00:44, Nathan Rebello wrote:
> When a USB/IP client receives a RET_SUBMIT response,
> usbip_pack_ret_submit() unconditionally overwrites
> urb->number_of_packets from the network PDU. This value is
> subsequently used as the loop bound in usbip_recv_iso() and
> usbip_pad_iso() to iterate over urb->iso_frame_desc[], a flexible
> array whose size was fixed at URB allocation time based on the
> *original* number_of_packets from the CMD_SUBMIT.
> 
> A malicious USB/IP server can set number_of_packets in the response
> to a value larger than what was originally submitted, causing a heap
> out-of-bounds write when usbip_recv_iso() writes to
> urb->iso_frame_desc[i] beyond the allocated region.
> 
> KASAN confirmed this with kernel 7.0.0-rc5:
> 
>    BUG: KASAN: slab-out-of-bounds in usbip_recv_iso+0x46a/0x640
>    Write of size 4 at addr ffff888106351d40 by task vhci_rx/69
> 
>    The buggy address is located 0 bytes to the right of
>     allocated 320-byte region [ffff888106351c00, ffff888106351d40)
> 
> The server side (stub_rx.c) and gadget side (vudc_rx.c) already
> validate number_of_packets in the CMD_SUBMIT path since commits
> c6688ef9f297 ("usbip: fix stub_rx: harden CMD_SUBMIT path to handle
> malicious input") and b78d830f0049 ("usbip: fix vudc_rx: harden
> CMD_SUBMIT path to handle malicious input"). The server side validates
> against USBIP_MAX_ISO_PACKETS because no URB exists yet at that point.
> On the client side we have the original URB, so we can use the tighter
> bound: the response must not exceed the original number_of_packets.
> 
> This mirrors the existing validation of actual_length against
> transfer_buffer_length in usbip_recv_xbuff(), which checks the
> response value against the original allocation size.
> 
> Kelvin Mbogo's series ("usb: usbip: fix integer overflow in
> usbip_recv_iso()", v2) hardens the receive-side functions themselves;
> this patch complements that work by catching the bad value at its
> source -- in usbip_pack_ret_submit() before the overwrite -- and
> using the tighter per-URB allocation bound rather than the global
> USBIP_MAX_ISO_PACKETS limit.
> 
> Fix this by checking rpdu->number_of_packets against
> urb->number_of_packets in usbip_pack_ret_submit() before the
> overwrite. On violation, clamp to zero so that usbip_recv_iso() and
> usbip_pad_iso() safely return early.
> 
> Fixes: 0775a9cbc798 ("staging: usbip: vhci extension: modifications to the client side")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nathan Rebello <nathan.c.rebello@gmail.com>
> ---
>   drivers/usb/usbip/usbip_common.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
> --- a/drivers/usb/usbip/usbip_common.c
> +++ b/drivers/usb/usbip/usbip_common.c
> @@ -470,7 +470,18 @@ static void usbip_pack_ret_submit(struct usbip_header *pdu, struct urb *urb,
>   		urb->status		= rpdu->status;
>   		urb->actual_length	= rpdu->actual_length;
>   		urb->start_frame	= rpdu->start_frame;
> -		urb->number_of_packets = rpdu->number_of_packets;
> +		/*
> +		 * The number_of_packets field determines the length of
> +		 * iso_frame_desc[], which is a flexible array allocated
> +		 * at URB creation time. A response must never claim more
> +		 * packets than originally submitted; doing so would cause
> +		 * an out-of-bounds write in usbip_recv_iso() and
> +		 * usbip_pad_iso(). Clamp to zero on violation so both
> +		 * functions safely return early.
> +		 */
> +		if (rpdu->number_of_packets < 0 ||
> +		    rpdu->number_of_packets > urb->number_of_packets)
> +			rpdu->number_of_packets = 0;
> +		urb->number_of_packets = rpdu->number_of_packets;
>   		urb->error_count	= rpdu->error_count;
>   	}
>   }

Look good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>


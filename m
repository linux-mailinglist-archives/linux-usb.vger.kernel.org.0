Return-Path: <linux-usb+bounces-36675-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKCiKs/E8WkbkQEAu9opvQ
	(envelope-from <linux-usb+bounces-36675-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 10:43:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A354914C7
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 10:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A4213055E8C
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 08:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E1A3B95F9;
	Wed, 29 Apr 2026 08:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f16KYBLM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9323B47CD
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777452186; cv=none; b=fPTy9fpAs0iEjizNO2oXaX1WjLIuT16/x0/HlHjX6nMFqqyupRIOo98nylerZ0J0JO1d2dv1Ws+JNtVPqqH7cksZEoSY/pUf4mgOQ2Uf6YMbbj13zuXkh9zIIHHHxkdyBdhZp9mMAQkyJ2MDgtksYYfRF85wTw8iCW7ivf0lSxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777452186; c=relaxed/simple;
	bh=tupiD11ATds5ekAH11VAwc8M0ubbtZCVy5mgO77Hq00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=unVa1y1sZuY9KLG7rrMJMvZvasHktv2yI8fzAtncbV9oTeh3bJ1/8D0Ru7FWjnqTDJhjIAA5OkVrUbGEZuqnafFwHi1H1b1gSiXuviDCTV5ewnLGx4mcKitPWiGvSc+a6AUMs6Rsdi0cJ+74gMS/vAjRMkZde6q4AGg1IkYbzls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f16KYBLM; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d73422431so11404523f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 01:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777452184; x=1778056984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aEw2E2UxluXLM5FnKmomLkyyPldPWoTTdKM8dvkkUPc=;
        b=f16KYBLMIzZYLjPY3dRyCZf1zyHDvtBrrzWgpNSuIqO3GcXITs6GeAqF0JvIrgqkOW
         mX0wW+l86BtExzi1nnlBSa0GbxrigLA/1+FOKxZFU+9c9UjDQr6ZvA9jDjA+uV8fn4ns
         KhAaNI6HSY1HC8QWkqRRNRXSFzE/UselxsNwC9h3S7iOUnLmRSaczB34jxi7vLGL1oRJ
         S/dfS4BgGBgZq83+tKaPpycbUtul/xS/tABFk6t9VdkHUqjCWvX0vd7kCJrxNCB/bZD3
         WhDJ5QXHc+0wBjsqdnj1zCUkp6C/UM6djT04HvAaWIrsdBp8uhA5a4Y7EId83T/DpVc1
         /8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777452184; x=1778056984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEw2E2UxluXLM5FnKmomLkyyPldPWoTTdKM8dvkkUPc=;
        b=iz3ACyXnIllVSY7pG4Ll6C4BUGLRRvd6UDbNA7zj9S83kP2+17uPrbNxfRf6H14G9o
         /Pt9KEOG7IAmM+u82fVzJ1NQnXnMJWIt6xF9NnDVJIi1hJtxJeqxPdLuTsQg368qPO8G
         glzv3QrjMnf5N8WMDm1D7fam1XlK+UP6vHGIdHguH1VCwfyKI+fQonqUUJWPm5ZT07Zj
         Ni6g8izwj9hDmGuWHyPt9T20eW9wBI27VE/xVqY5MWW2JemoLFB5+2Do2gUiaFi60Bbf
         dW+FnN+tJM9EijelZQ/2rElN6VkXBlvHEZQeFyLNVxH1vcq5KqoKUbPt59QDbX6hkOp1
         lQeA==
X-Gm-Message-State: AOJu0YzQoMbricvVwPn3f8B0FCODZEzE8rVQ/E8OHQkK9wtLXaUcALB3
	Tn6ZfI7HNPrnHcIuIh0N2yskzmZWiHGDh19svlGOvE/fvRXK2a69cHY3qNvDwUxDg5E=
X-Gm-Gg: AeBDietXNHfYNMRsty3sjctPyQ591UHTnuvIdbsyL1NhhMt9Y+jfhTQvLnUUi3r0aQs
	YdzBaaEbR/35IG0lZXrQE1VLPiMbAcvgjh6wXGUal+3ju2B8AuzR6bM07/LRuNtCvubMtdgDPPx
	0/qgAqJBhGQmREhNwnTgNotCj1O2/Yewdw7OdXi8y25h6uD494SUA3u3W/2vFTPrWqTJu2xmzHB
	775ZLJbbIbD/XGnLmafb0YSyV5KCFk3YCpZmm+zcYi1dzO1gvSmggoE/gUWxJXWWkDAei0+dAek
	onI7jyiNcs8NTUz4+uERNu11BIO0LnfuAue4/486smYKij6DGMfyzRlppzIbZljtJ17N9XYYbGT
	EucqVkqDquPWIc58D41ltkmN2MMZCML3I/D63lHfqZ8QVTWMpOeQjwNhGE5rdncwTq6h8Meo7w3
	iBJYUVZgQtxLKbgGHlyLQGvlhiqhVSAuW8PgTheZL0s2rLDjOw/IFYud/NAbyKbzCUMQT+m9s8D
	0W88w==
X-Received: by 2002:a5d:5d08:0:b0:43f:e7fe:421f with SMTP id ffacd0b85a97d-44790efd49fmr4716396f8f.40.1777452183598;
        Wed, 29 Apr 2026 01:43:03 -0700 (PDT)
Received: from ?IPV6:2001:a61:13a6:c701:bf3c:e2f0:87b2:c525? ([2001:a61:13a6:c701:bf3c:e2f0:87b2:c525])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b3d48131sm4260624f8f.3.2026.04.29.01.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:43:03 -0700 (PDT)
Message-ID: <6d0f7bdc-bdb8-4d9c-887e-8a5f3d4c6b98@suse.com>
Date: Wed, 29 Apr 2026 10:42:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] USB/PM: should USB interface drivers distinguish
 hibernation THAW from RESTORE?
To: Haowen Tu <tuhaowen@uniontech.com>, gregkh@linuxfoundation.org,
 rafael@kernel.org
Cc: linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org,
 pavel@kernel.org, lenb@kernel.org, oneukum@suse.com, kernel@uniontech.com
References: <20260429033617.1954257-1-tuhaowen@uniontech.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260429033617.1954257-1-tuhaowen@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 15A354914C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36675-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:dkim,suse.com:mid]

On 29.04.26 05:36, Haowen Tu wrote:
  
First, to which extent is the issue specific to USB? I suppose
you'd see the same issue on a camera connected via PCI.

> In the hibernation flow, after the memory snapshot has been created, the
> kernel briefly resumes devices in order to write the image to storage.

Yes. But you cannot just restrict the thaw to storage devices.
You also want

a) displays (to show the user what is going on)
b) keyboards (sysrq key)
c) anything used for logging
d) devices for the visually impaired

> On the successful hibernation path, the system is then powered off. For

Keyword: successful

> a USB camera that was actively streaming before hibernation, this means
> the USB resume path runs during that intermediate THAW phase, even
> though the final RESTORE path has not happened yet.

Yes, though it will not happen if the writeout fails.

>  From the driver's point of view, that THAW phase is not semantically the
> same as the later RESTORE path after booting from the image.

That is the key point. In the error case it is.
  
> The difficulty is that USB interface drivers currently get
> 
>      int (*suspend)(struct usb_interface *intf, pm_message_t message);
> 
> but resume-side callbacks are only
> 
>      int (*resume)(struct usb_interface *intf);
>      int (*reset_resume)(struct usb_interface *intf);

That depends on whether the device has lost state.
  
> so by the time a USB interface driver's resume path runs, it has no
> direct way to distinguish a hibernation image-write THAW from the later
> RESTORE path.

That is not true. A thaw should call resume(). A restore after STD
should call reset_resume().
  
> The immediate trigger here is UVC, where resuming the streaming path
> during that THAW phase can turn the camera LED back on and cause other
> visible device activity even though the system is about to power off.
> More generally, review feedback on that patch was that solving this in
> individual leaf drivers would not scale well if other USB interface
> drivers ever need similar behavior.

Storage and UAS devices need to thaw. As well as the devices listed above.

> So the question is whether USB interface drivers should be able to
> distinguish these two phases, and if so, what the right interface would
> be.
> 
> Possible directions could include:
> 
>    1. Exposing the phase distinction to USB interface drivers
>    2. Handling it inside usbcore

Not possible. Some devices need to be thawed. Writing an image
to a USB device must work. At the very minimum you need a flag
and a mechanism to handle a failed writeout.

>    3. Adding a USB-specific callback or other mechanism for this
>       transition
> 
> I'm intentionally not proposing a concrete API in this RFC yet. I'd
> first like to understand whether this should be considered a real USB PM
> interface issue, and if so, which direction would be the least
> intrusive and most maintainable.

I am sorry, but your basic assumption that all USB devices can be handled
in the same way is not correct.

	Regards
		Oliver




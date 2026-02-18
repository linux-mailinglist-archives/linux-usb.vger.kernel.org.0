Return-Path: <linux-usb+bounces-33437-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKu1KpK2lWk/UQIAu9opvQ
	(envelope-from <linux-usb+bounces-33437-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 13:54:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C86156720
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 13:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18ED13014C6D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 12:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A102F31D36B;
	Wed, 18 Feb 2026 12:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AFfFXVBx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC93F31B838
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 12:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771419280; cv=none; b=dL0O6t6yNUq+h3rKsxME1XI+PrxhDMjAyEYzWuL3DEWQ/v/7Pr9msFcplaR9qGJeneXqe8zy8uH67euYlLTOagQsRq71ZUpQfLpHlTsdYcD62PA9eV/YlqbrAM6hysZiBfma+0tVwBS6krfC6cI3REIAY7ABSCKTNQ5uWgSohwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771419280; c=relaxed/simple;
	bh=w6Y1MxZB5sjEjDFExZYownfoBMtoaK4hKFqLXSch3U4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLnHMuh+GPDtDVrvM5NTv96Li9VgM8+vx7gyEnBSnKJMPG7HRSTiKwPIdN0b10qIo1jUNO64CuaF6hGMkFgn0XPesVxQLdOtwF7uj3qo2c/TwgQObjgHqAsi2QR2IAnVBljKjcDHBEvum95cZYz/e6qPzE6mTDGK72eTXHpCo04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AFfFXVBx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48371119eacso50061755e9.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 04:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771419277; x=1772024077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FjeE7PqDr7351kVQWclFJfgOvuFkC7MKEZjls/Ix3ao=;
        b=AFfFXVBxtgcvMcWOy2zURxIsLSIqeDw28k3J5RWCXvGIZrghK5jSh3uiXtP75KVk9O
         UzJtCPtp3vUEAKIgA92D3rEs1aQ5nMBugDD2KiHiFO6RgLfHA6Oaa4rc0LymFsN36Qqy
         MAHSyo9gsmu/zVZ6zRSw0fgALivOtEYwpLd3SvDp0Cc3sI6B9gOkDzTuHU9X9OpgLl0T
         j0VbMzjbN44KXuo/O/Go/U4BB0sLshMUqeTXO5PVJeRXzp/tNRWJtlIe93HV1ePQQU3L
         za2cl5QytTDRMvHWNXhgDV8qos43nkpNnuESZ1ISLQnjJbn0OVUz/o7IQGHLXYiAdl8r
         w9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771419277; x=1772024077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjeE7PqDr7351kVQWclFJfgOvuFkC7MKEZjls/Ix3ao=;
        b=QnTiEx0a+BjVZVxeM7OkbzU2ThEIS3rHTiX6wVxkl3dVZTSyRDVXPjWQFW7/Qc716A
         FfmWub5wIirnP554VSyr3iQDUktRKyEyyjxjSS3MrSzDJXtTqb8zn1On1kqKrW0Jwovv
         JSWsxry176bNgVO340vrrq7rtJISb+M4o3aAfIAAxsztgI3k9h6Gg+qsJDz7MRnp2xxA
         bMof98POITHsNGFl8iO13a7T0EHX6Nb76bsiI7xiHiLG+AIkElptuM0xGMcEQSmxK7py
         vNN0/EGuxeOOfIFsv+qcTTNaig5pemgiFM9HFqu5KCfxFskUxr8z/BsIWbagL/DJ4SJA
         T9yQ==
X-Gm-Message-State: AOJu0Yy5uFm3ZlSwscmS5utd/USlJCerjWcXsraMP7NJUg+18wRiAIW0
	OQfDFJnBe+t2H48QC+YW6dEz68F+qykY7bUAy3YENAq+1/mATTxxRD5NJib4xr1U7cGwiwizT2x
	WJTht
X-Gm-Gg: AZuq6aIgn0rkVJVHXBA4ZmHEdNYbpj5FY86TSXZZTvZ63iihQC3HYULSfELkrzZfqGq
	BmNlEAvoi1nxHVVAyD2c9A86ypkAB/6dOQ+vreKhgoUK+30goXftHngqhj7hPgw1Laz6bt1F0xi
	n0vdkNzeSyLGPhSyAf+wTWljejKPozTwMYGfwwLvCu7p4InJqZflsizlfKTRHCL1MrFfJSvOZUG
	NXupC96GYaOJZBO/HdvTjJEsPVbshBjv1ahBo7khsSydM4nzRXmwyJXXBt5GOoTre9ETedMXsCg
	bkpSML6XOUUJV50GH/RO/11on0oDXqn16LlUXzXxAe7ISWo5xf3hjaZUNzhh9tgJYhYS5M1fhxF
	66Oiil19UVjn/x/Mi4KH362fuXxXXDmSCbkQXYgFoQYR+ywMivxqm6VFm5WEP94joSyXmEhCnjm
	eLFfmA+Xrk6CljF6SzD0M1b2MGBC1mAlb/tQc9MjSFln/0AY4MNDSxkIHqGXssoNfi40n7QKtFq
	JD22A==
X-Received: by 2002:a05:600c:c492:b0:483:8e43:6dce with SMTP id 5b1f17b1804b1-48398b6e014mr29493005e9.29.1771419277113;
        Wed, 18 Feb 2026 04:54:37 -0800 (PST)
Received: from ?IPV6:2001:a61:13d1:a401:31a6:f06b:8297:f001? ([2001:a61:13d1:a401:31a6:f06b:8297:f001])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4afsm1037070525e9.11.2026.02.18.04.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 04:54:36 -0800 (PST)
Message-ID: <7cbb32ef-944d-4d03-9209-5249bd7ae1d0@suse.com>
Date: Wed, 18 Feb 2026 13:54:31 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] USB: usbcore: Introduce usb_bulk_msg_killable()
To: Alan Stern <stern@rowland.harvard.edu>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
References: <32a96517-104c-423a-b1b1-8dd139192900@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <32a96517-104c-423a-b1b1-8dd139192900@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-33437-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email,harvard.edu:email]
X-Rspamd-Queue-Id: 24C86156720
X-Rspamd-Action: no action



On 17.02.26 17:22, Alan Stern wrote:
> The synchronous message API in usbcore (usb_control_msg(),
> usb_bulk_msg(), and so on) uses uninterruptible waits.  However,
> drivers may call these routines in the context of a user thread, which
> means it ought to be possible to at least kill them.
> 
> For this reason, introduce a new usb_bulk_msg_killable() function
> which behaves the same as usb_bulk_msg() except for using
> wait_for_completion_killable_timeout() instead of
> wait_for_completion_timeout().  The same can be done later for
> usb_control_msg() later on, if it turns out to be needed.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Suggested-by: Oliver Neukum <oneukum@suse.com>
> Link: https://lore.kernel.org/linux-usb/3acfe838-6334-4f6d-be7c-4bb01704b33d@rowland.harvard.edu/
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> CC: stable@vger.kernel.org
> 
> ---
> 
>   drivers/usb/core/message.c |   79 +++++++++++++++++++++++++++++++++++++++------
>   include/linux/usb.h        |    5 +-
>   2 files changed, 72 insertions(+), 12 deletions(-)
> 
> Index: usb-devel/drivers/usb/core/message.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/message.c
> +++ usb-devel/drivers/usb/core/message.c
> @@ -42,16 +42,17 @@ static void usb_api_blocking_completion(
>   
>   
>   /*
> - * Starts urb and waits for completion or timeout. Note that this call
> - * is NOT interruptible. Many device driver i/o requests should be
> - * interruptible and therefore these drivers should implement their
> - * own interruptible routines.
> + * Starts urb and waits for completion or timeout.
> + * Whether or not the wait is killable depends on the flag passed in.
> + * For example, compare usb_bulk_msg() and usb_bulk_msg_killable().
>    */
> -static int usb_start_wait_urb(struct urb *urb, int timeout, int *actual_length)
> +static int usb_start_wait_urb(struct urb *urb, int timeout, int *actual_length,
> +		bool killable)

This still leaves the quesion why a timeout can be negative.

	Regards
		Oliver



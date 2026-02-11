Return-Path: <linux-usb+bounces-33278-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WD+wNVVajGnelgAAu9opvQ
	(envelope-from <linux-usb+bounces-33278-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 11:30:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B8A1235AB
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 11:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E599305AA82
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 10:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE97D367F46;
	Wed, 11 Feb 2026 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="E1DfDCe3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137BC33120D
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805722; cv=none; b=OMQDvNdX/nBxx6y7YzvwqGHlYI7PcBnMZhyFJuDp5S+VFIeeKMyNOwmiUG1M3QXiuac3rSL2jfmJW6RusHujyLuhykQYuuCpHfVAE4n6kt/CpzNhE9Mgk3Nl4QFhnPoEFe8MkAUIXdmRzDDmiWtcL0fWbejwPbl7gjBMaVe+0Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805722; c=relaxed/simple;
	bh=+5SFKNIu+t6eS/3hG4WQ1m9c10fpzzcmX9M2L8Lvovs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AN7Yg11M5sa5yJ56d4dkRm6pc4+P9+fBb6ryoOcZJOB7AYcQp7gT8yuC50Fbw3CyEErNkZrikMCeFKbO/gJRwgX201iwUkYZvQvp5DKrjKPMK38V+OKgq2CESO0v7IVAXc1+nD1+DP3e/NPPbaWjsS5oqMvUl8xVyGykKz8Rti0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=E1DfDCe3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801bc32725so38577835e9.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 02:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770805719; x=1771410519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CR9U7YEgjyhmr1jN6fyal9B63gAZQTRajOaVXeoTvF4=;
        b=E1DfDCe3VDD91I0eSpB/8jL0AbxaMihTGuSuYiRF+x+XsAXUAzAfW0qfge/1ikthoP
         Af6BRVEcZO/5QwjPGyHPCGJ8awPpNXiDfEbXVHTULbQHOBDHHZrSvSEMEf1lk+L3nXpr
         ErdVsgneDk7bwavUS/0zH43265XG9vXNNLxyvqTx6ShkeKMGDaCoFOJ+XXVfqFE3DEVT
         l0oWCRytTVZoCXbY8eQbzJ3ankGoJiPhGM6QQvXB7cxQalWeef4z0/HHAZbd6BpKxAOk
         W7rZA7fLfZqU67fpkcqy3PxRUbkBttLXYblf1s3UXr5FogGqAcX9rtBGab6QL1m7S8e0
         qDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770805719; x=1771410519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CR9U7YEgjyhmr1jN6fyal9B63gAZQTRajOaVXeoTvF4=;
        b=Lnlq5SmliNWfaFFoSXdCGAqH8Xobd5wbR7/gOGsKeIqEcYYyo9nadXoAzwFDP4fE/2
         oOAn3rz3zAa1Y7PKH+pvPqJ4WKEG6DqwQ3WIQjrpnchjwT5FCgr15uPaifSM7xcZn4MD
         dOp2rIvxjnhdc+ltMey+3DX0Ke1Udl4HPcqw5+M7fvZbbGHZTqW/rAb/7wZOXJ/jauYH
         Xw6cBce3y3yZG81CYM1/G1GMjNIb6c8rylz2Zv0xeXvNceft9oNZt0idnQ5D0uNovrtN
         lOwHOfh4MqjpbEMgWJf0FJq5hulFSIk3Rrzf3Vr3LvxpP8HKLG4CI8F7YODl8oO1okGa
         mIRg==
X-Forwarded-Encrypted: i=1; AJvYcCVTc3qR4nG9mCIvpsXriFXWqW/o6PKwcfZ9DhZQ57z5T+Bgm8Cv8EVmULZ8Q4/WAYYbbWmrkPuDfv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+48yFrJrDNkWf7V7xv5JHlmgiXXyfVO1cmBOv2AjwpUzOfmHB
	ep3Mpe1DEL0xtqdwlyT5rZZAaoiZU1rNX3Uqya5FOJceBs5G/Vt+fg6a7QVqv/H6cvs=
X-Gm-Gg: AZuq6aLjfvdEgy0tHSboFDntzFcnE3tFqFWjriMrFtiHwtUQLxCGXprgqZUUw1O1H+0
	ZrVdJ7uBKgH+7HiUNRnhm5BAe7Pua3439RbIzsHrth2vKtTvj5lqZ3fcfVZmhkvjafPuktYP2BZ
	SW7274VOauyY5KZZHjHzXD4HcsoXDSznITJ8zk5Nd0cwopRgrkBF7kRJsTynZ515YeOZMOJ2xY7
	lYzbARv1UsndgR5FfBAtWZ99ute9p067+zEP2Ze2xFGBERUWUdT78+7kGjydVLibsBPHfJvAhAx
	07trB1UXdq9jS1rH91YyZBMiyYosoMclokTOEu/O4isC2xM8D5L6PLok1KgerOSWPQ/q75oorki
	d/ESP/Ui2m1bUvlzNTIlnj0Z+UeYbWIuzCSTNykrs68noR5jRXELLVgpk0fRd42RWBKnvXaOLVI
	ysde7byInCie/An/UNKj470jQ/cChy7m3xFWlvTeX+jLj2sNWG5/s5FzrL/9ln/g==
X-Received: by 2002:a05:600c:3f12:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-4835b952eb1mr22764875e9.19.1770805719324;
        Wed, 11 Feb 2026 02:28:39 -0800 (PST)
Received: from ?IPV6:2001:a61:138e:301:e4a1:47e:3f5f:5d09? ([2001:a61:138e:301:e4a1:47e:3f5f:5d09])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835b958b6csm43021365e9.1.2026.02.11.02.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 02:28:39 -0800 (PST)
Message-ID: <79868062-41e5-414b-a0b7-7aa162dbf4d6@suse.com>
Date: Wed, 11 Feb 2026 11:28:38 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: usbtmc: Don't accept very long timeouts
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 USB mailing list <linux-usb@vger.kernel.org>
References: <237c76a9-fcf5-418b-a3a7-51929af1d69f@rowland.harvard.edu>
 <fa1e3282-0559-4ddc-97ec-be07a41ab27e@suse.com>
 <c6802a96-33d4-453a-b1b6-e74b4911555b@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <c6802a96-33d4-453a-b1b6-e74b4911555b@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-33278-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40B8A1235AB
X-Rspamd-Action: no action

Hi,

I am glad that you can take it.

On 11.02.26 04:25, Alan Stern wrote:
  
> How about accepting the value from the user, but limiting the timeout to
> USBTMC_MAX_TIMEOUT in the usb_bulk_msg() calls without changing the
> wait_event_interruptible_timeout() calls?

That would presumably work. Yet I am not happy with it.

> It probably would help to know something about how this class and driver
> were meant to work...

Indeed. But we have to work with what we have.

This pushes me to take a step back, figuratively speaking, and
try to look at the situation in general. And I must say that
at this point, you seem to me to no longer be coding to produce
the optimal result, but so that you can keep using
usb_bulk_msg() with regards to TMC.

The issue exists in general so the first patch in your series
is necessary in any case, even if it may need improvements,
but in case of the second patch, I think you should go for
the full solution. That is, use an URB and wait for it to complete
in interruptible sleep without usage of a helper.
We know this will work.

	Regards
		Oliver



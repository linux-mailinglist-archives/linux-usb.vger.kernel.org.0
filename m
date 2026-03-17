Return-Path: <linux-usb+bounces-34936-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIybHB1luWkyDgIAu9opvQ
	(envelope-from <linux-usb+bounces-34936-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:28:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF3E2ABEEC
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1240B302204C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C424D3E2741;
	Tue, 17 Mar 2026 14:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TWVNuZiM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083F93E3D8C
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756860; cv=none; b=IsA0b6kOdft9hzMpVvRfr/kjQdLXBTlo0u4zm/vSVNg/kSHxRHfnjRaFtRKBiaRxyHSiBfHe0cFRgE1tCsB0BDX3J4EFqRfSKZI/r6IftubTJA4DyGLudxCRCGmfQUy4pR7Xds0EN7wUheStzhdeijePUcE1fq1GyXdHfqIpu3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756860; c=relaxed/simple;
	bh=x6++69YVpS1AWl3pxJ89oY/DYFyDmV+hw4OXmeLZSxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VKWcOjSfhDsLrqFay/L4lZt72+Bwj2gXyl2zZXhSmmx+UtsYiU8nNccDyEyF9PmU21yoJlgQZzNO5Ee05UYqBfQQQJFdruJ5tTU7iuwIbls0DL6RBhjLZ2rxXM/FwiMajd2Ebog+wXHlQSH3X/Dc+1c2NnCYArAPVP/KIjO18Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TWVNuZiM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486b9675d36so5175675e9.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773756857; x=1774361657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y0KRGaMU3qW3l/uUCD6QQy1QnhhW4PWYDbQHGKikGCw=;
        b=TWVNuZiMxAxwjZZ+QE2cC8Oa/OY9dq9dMHA2UVDdLpac5NNWN2II0TZBIOdM0+AUdx
         Kr0Bn9RlAobmGlbzN3OvwNEnHPKhiej5TxYy15deY2ZM51k62blCKjUnflNii987fJaC
         h/CGc+FPefpR+J/yrOYeBfRxuOw36UbMiEUjsL8qAAtkMnI4dbWZcD5s7eZpIB7HlID7
         knpM71rjlFyOR8DavFzD0vLHBL6dvmGUGkNmHNgTd+f4VvVgi099ExmoFz8xNj5O/rMv
         P9Te+1SHhqXw2aBTuySINwRYWbfSKeNvsrpe0iDwHGIOsWkimnFnk7kyYFe+8XDnEfhO
         pGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756857; x=1774361657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0KRGaMU3qW3l/uUCD6QQy1QnhhW4PWYDbQHGKikGCw=;
        b=ESfufRTXjxQon8uLB5p3Ewub6FxH7WDfsZXZUdsGfZ7+s5RH3G5gmrTdF4HNtQlv16
         MvcpnlMDtn3FZdbGjmqOmb1NlmafeIv7uYHUCENl8jYQL4653we8l6PKvd6OY3d4Sa4a
         IzfTeKYbIKD6LD343fiih2EX0Mj2RMMq0qocw81eQUS4ncshHGXI35je7YeiCgNmDUgb
         2jeSkJt+v6sIgZk7N4M+HbmU0kpEzKKp7xxCWlVBjGPyOcvpUjMgFxMT9iEZWGNOpUvk
         h9MTjVplSgxwmXlk/ntPQ9+5Da5GGMmJy1fUqrKoaJqA4iklQ5P47Foz7zJnqdt5F1Y9
         W0mQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/YTqfi/HykS1v09+MXO23UiyfCJpOnR1TDuHCBC6QIj8VYrE2t5hVxeF+eTmoZcDvl/DjUe33LxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTK7uIyHiqKVQGosLS8n9+cdxnRpN6QGJOU58Ty+WMs0BWEj93
	AQf1U67VVkWjqlqRPKoHnqoNEHQp9duS/qa7Rs5nM/EFve67BaAbrTniRsx1KRbe/Vl7FamZq22
	Wg26C
X-Gm-Gg: ATEYQzwdOy3nWcJr/ZIlsi4LSutjTDnjyDNstGrdHbKC8IyVShDE+Z9Q+JMJa21ygFM
	aSfLKeQRJUzPFp7Muiy5bF8yC7z8VsGubDsFG37AkP4MeyXpRt5wMa1PX9Zd4clwF+lg/RaFKh9
	AxAXdLTF+LI3bcxWj03V7l9XGWX/BdBCVqmVhWdLlOMB5O/IlVrCZRi8+fV8jKtfYScODdqZBpZ
	0CKvBgLf3/v05SYyCSYXsGmgrOw93wFG3rxB/seM+DNKVDEKcQIUWsEAiMeU8x3/lwvCJDa1HFf
	BMnCsyAcy7Y2ReuAvU4p9IfczWGtUvhYBNgRpyRnSQMYvsqlw8urBPV7mixevPfh0XdBEhpzq5s
	mY3VmAcQMDVJqAoNbuZgT051UwKnI2g3BOiowGykW9w6eKWi3sqTdnASio7VGf4SrFd6RKSbzJP
	bswq5gHxmTPoHTQDeo7ntQvjHvhNABjGBhC0Sn7c0oGQErpK3m/Ij+u8U8AfpQXSmKQ0E=
X-Received: by 2002:a05:600c:4f54:b0:485:49c5:8eb7 with SMTP id 5b1f17b1804b1-485566fd0eamr285035755e9.22.1773756857173;
        Tue, 17 Mar 2026 07:14:17 -0700 (PDT)
Received: from ?IPV6:2001:a61:13ea:b101:88d5:cd46:69d7:10e4? ([2001:a61:13ea:b101:88d5:cd46:69d7:10e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3b0e9b99sm28443266f8f.18.2026.03.17.07.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 07:14:16 -0700 (PDT)
Message-ID: <da512301-2c87-4e02-ae92-02e2d856d4ff@suse.com>
Date: Tue, 17 Mar 2026 15:14:15 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATH v2] usb: usblp: add the reset_resume function interface
To: Greg KH <gregkh@linuxfoundation.org>, shitao <shitao@kylinos.cn>
Cc: zaitcev@redhat.com, linux-usb@vger.kernel.org
References: <20260317125614.3215254-1-shitao@kylinos.cn>
 <2026031730-fanatic-alias-3d85@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2026031730-fanatic-alias-3d85@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34936-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: 1AF3E2ABEEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17.03.26 14:28, Greg KH wrote:
> On Tue, Mar 17, 2026 at 08:56:14PM +0800, shitao wrote:
>> Add reset_resume callback to prevent premature device unbinding during
>> S4 (hibernation) thaw phase, which would otherwise cause usblp to require
>> a re-probe — a process that is slow and trigger error -517, and even
>> has a high probability of causing use-after-free bugs and kernel panics.

Hi,

I am sorry but this patch is fundamentally broken. Let me explain.

Implementing reset_resume() means that a driver has to guarantee
that the device is restored to the same state it had when suspend()
was called. For a printer you cannot do that. Its state depends
on the data you sent to it before suspend() was called and that
data is gone and the driver does not understand it.

Implementing reset_resume() for usblp is basically impossible.
Instead we need to fix the issue you are seeing. Do you have
a call trace?

NACKED-BY: Oliver Neukum <oneukum@suse.com>

	Regards
		Oliver



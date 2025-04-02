Return-Path: <linux-usb+bounces-22481-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B80E1A795AD
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 21:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE3C43B2566
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 19:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71D21DFD83;
	Wed,  2 Apr 2025 19:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N7/bHMpd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9711C861F
	for <linux-usb@vger.kernel.org>; Wed,  2 Apr 2025 19:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743621190; cv=none; b=PmUfu6yQCCrEbeu1SNtDPROm8F5MlOIjJn7EgSOscUkv/qybPk5tMc2UNpseqJXWpV91otYRQWrhK7EK6MiZXa9rhb4zcurRT36frSaBCkWkOzWqzgFjBfulvS6QbyYl6WhDbdKJQUidaGWnDPnA1b3U+wnK0KKqTBzFm6fubxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743621190; c=relaxed/simple;
	bh=5r+rbj2XV/0aANbrABTtoy7ZJJQ1J5hZT8Pt1gKDlos=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IqVbCRG/cC0Is+pAaVDf15f9buUqF3P4D5M5+YZ9G4hxoxiESMUxlXzzFAJvBl01EHx/Thvi55X9olsBb4+z0MmikD6/zSB66VQ1NqeqAK7qIlyffqbNIEac0nJdTAOhPKDFKGazaiL7+QXGrCdkOFvAOYC2+FdDtAX/r/KN77o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N7/bHMpd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf848528aso600965e9.2
        for <linux-usb@vger.kernel.org>; Wed, 02 Apr 2025 12:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743621186; x=1744225986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c306CUN7mA+7WFDXatdyPRYVNSoONJxreWOipEliqys=;
        b=N7/bHMpdpaKlNWMXviaNeBrnOnW2LhINwGq6/jFkxuXkxMLvvpzI9IZaI63QQs1iXE
         5fYDQdYdfoOIZPKODYUtifaZtUvVC4Iqyric8ri1zVmbOBNTUc2wlE0fO8i5eZ4GXvDi
         KHF5KV3btN1ddNAck6QfJqXCKJ9Tg4VRRJOn0f9F1zctJrhXJHj/mIyIqe23JGi0dNYd
         jfHrFrF9F2vaEUnYWWynNA+ONlqE5QopNnVC4vU0IffL4bHsNxlRRzIPQGptgkqqpr5T
         EsJ/tpBUm1GDqoIOI1PA8CtnLhFig9QgXFOALfHgpqXpQbajn8aZcKwAQl3toK91qq+0
         hnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743621186; x=1744225986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c306CUN7mA+7WFDXatdyPRYVNSoONJxreWOipEliqys=;
        b=U8HnjEHQNfjyW/4A9XoA5Tc2kX1MRxjRCoFIJf5yRzk/CLwdCUQnmpMqArTnZCkTKp
         YD/hjdGXBPzyOBnOeGGzYMfbDeroC29A/JoLANaW+tu6sE21+BgIGS+UM98H+bzeSx0V
         fT5U/dfYwKx2ribhohirOY8OIqJYkRU+9aES83ANRe2MMXlx3NSrw9reCkZYCmKP8SD7
         OY5V1CCEka+PTnBjAqao8c5td5Xen6l7Byjn2tgbCmL2CBDjcslqUoOtc0s4JAxCCdya
         Nb3lB5HpV4s4uk79Fh6A3879JTTWeMGOIJGj81k2zOiROkSUy+P/3ULjbldH1Gp0IAli
         RHeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNxjqf2tjlCpzBqoeldejCdonJSLb8I+wuRpI4PDEdvs5YezxvKiSjKCj1kUyOnFaTPQfIMFrDFKE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1n3EE4YWv8znUhUnjwW0SmcSkxRi+sBZIR+b0IFz9XKj8nPhb
	U/MFcEOLyExcrSFXqGjyv6oWcsw0VkBgtSwPyKzgOnQLjW2AzzFX68t+fEGyc4qkSe7v9aRRBWD
	q5z8=
X-Gm-Gg: ASbGnctJ7DxFiSTFcJonMGW+PDgXua2xfwp74OqzbB18CUN4mQ8Smn/3IWO8XJnrKfd
	k5sATAwkm6OBPSo7CUSX9OKakfa6ZoClkB7StvyvES9bFfduzXiPEdquUBT0HCYowDhpOJqovRj
	qMkYW6sZ0h1RYcu/YEG9HmB8Lrnplie3jzwQtBvX7ecrrQGb45hcv8abt4/uPsC+YhISmjz/wYv
	pLJgd/Grj9Gkk6uDB28Eu+cdvx9zfaiPPgnRp+mzYJFG80uhal+v6KLwHnyDumJwsAs8SZFbGgI
	+vZw2x/unmTj5WglW7HNCI+zsnf2QlJ4JfbTFvbDxQHgLgEq/NKEY1rnwcLC0x+qIRnAlX48FtO
	nJPiWKTvNXw5vzcFi1g==
X-Google-Smtp-Source: AGHT+IE6b/NI1VhuZfLr9pFKMZDyKM2hFxWlamK2tGP3My4DNWDIWVP1X9yBkG8RZylxXwgvkkWCzA==
X-Received: by 2002:a05:600c:1d88:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-43eb5c180b8mr41523755e9.2.1743621185797;
        Wed, 02 Apr 2025 12:13:05 -0700 (PDT)
Received: from [192.168.178.20] (ppp-212-114-229-10.dynamic.mnet-online.de. [212.114.229.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fd1194sm29516765e9.11.2025.04.02.12.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 12:13:05 -0700 (PDT)
Message-ID: <3296aaff-a591-4fcd-b421-9cfcc6291d2b@suse.com>
Date: Wed, 2 Apr 2025 21:13:04 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Handling incoming ZLP in cdc-wdm
To: Robert Hodaszi <robert.hodaszi@digi.com>, Oliver Neukum
 <oneukum@suse.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
References: <bd07dc48-d6f5-4a95-9dc4-c738640349d1@digi.com>
 <ade69712-836c-4cd9-ba79-79b2d97fba83@digi.com>
 <dc8500a8-df6a-45d4-8ce3-1dad4b8f2413@suse.com>
 <a9bc14f2-7f07-44c0-96fa-0616402792e7@digi.com>
 <d1a9bfca-0c94-4770-b5a9-c7d0432dd476@suse.com>
 <e73dd429-55c1-499c-82f1-f9553ce06cda@digi.com>
 <28a5c207-6c2e-42e1-9568-2f949554026e@suse.com>
 <8de930f3-2e87-443d-9e8f-9d6f16f7a399@digi.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <8de930f3-2e87-443d-9e8f-9d6f16f7a399@digi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02.04.25 17:01, Robert Hodaszi wrote:

> 
> But we cannot return with -EAGAIN. If we do that, we're back to sqrt(1), and get stuck again.

Then we have a problem. If we are servicing a read() syscall,
we have to either return data, or, if we cannot do that
we either sleep or return -EAGAIN depending on O_NONBLOCK.

There is nothing we can do about that. This makes me think
that the issue here is poll() rather than in wdm_read()

> So what about modifying the service_interrupt_work to no simply set WDM_READ if resp_count is 0, but instead to check if there's any real message in the buffer, to not confuse consumers. Something like this:

That specific proposal will not work because the issue
is in service_interrupt_work() which can already be scheduled.
We cannot prevent that.

>     diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
>     index 37873acd18f4..9037379f3603 100644
>     --- a/drivers/usb/class/cdc-wdm.c
>     +++ b/drivers/usb/class/cdc-wdm.c
>     @@ -1010,7 +1010,7 @@ static void service_interrupt_work(struct
>     work_struct *work)
> 
>              spin_lock_irq(&desc->iuspin);
>              service_outstanding_interrupt(desc);
>     -       if (!desc->resp_count) {
>     +       if (!desc->resp_count && (desc->length || desc->rerr)) {
>                      set_bit(WDM_READ, &desc->flags);
>                      wake_up(&desc->wait);

And what happens if wdm_read() wakes up because a signal is delivered?

	Regards
		Oliver



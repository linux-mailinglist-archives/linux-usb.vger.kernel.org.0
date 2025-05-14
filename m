Return-Path: <linux-usb+bounces-23946-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A9CAB69F3
	for <lists+linux-usb@lfdr.de>; Wed, 14 May 2025 13:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2499018933CC
	for <lists+linux-usb@lfdr.de>; Wed, 14 May 2025 11:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9941F276053;
	Wed, 14 May 2025 11:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fg6kBvOf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212FA2741D3
	for <linux-usb@vger.kernel.org>; Wed, 14 May 2025 11:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222044; cv=none; b=FfieQbpHs1PpBF7Lv5TyqFQJ6hLL2crbrzkxbtHWgqVGaNi1jLaF19RjwhySE1Aid3rEjka9eFoaP8Rdvc4cYUBiyVpQrbNRStt+41/UHqFREfNkrZQt94um+eFlubX+SmI/oYNrr4LUtTZJGSSSdLu9fJUGx5wyTJ6mvacI/dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222044; c=relaxed/simple;
	bh=af/G9WTfMF23Jy4En+6bEXKIOPkb9aB3nfmPTx6hg7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hj873j367gv8QHfBXRQhRT9FbWryWf4POOa5bTdXbs5tQiNTLEh1splhsZ/oRvSIACLA4KW/fmU3qBJU/x5QORmKIvadbXqFlEsyHMs+0wsHMBhj4GmirQPLzFyyNLihFeVzPgKD/f4T0j2FKJiutraW5TO7qy2QTr/o1cm13+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fg6kBvOf; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5fca2805ca4so8258616a12.1
        for <linux-usb@vger.kernel.org>; Wed, 14 May 2025 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747222040; x=1747826840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sZDaDYhFbMcyrsLhuZ6zLqO4Xp55KCZvGoT+6gmy9YU=;
        b=fg6kBvOfadLWQDVSy9KTR1mS58el9Z/A0+K5KnVIIuHCAQYtJ8gKowsqBadhzyysr3
         AQL8+e7GtYMj5c47gXPgOyWuweYmIFxM9q5Z4xHPR42aS4VikntMh4cobzAqhb2FqzQu
         De7qBmXVASH6KjvmoRKmub72eTCDQ2vK67KosTEFH4ygTIorgj3cf8xmXIxJ0bYD6IDz
         0T4vnboOnaZiESNFQkQOPUSYVkOnqVtr4Fjl0XSajFjcCYxbFdzYeZUGxxOiP0n8Gw4i
         b5Gbz7wCrGrBLJ0YDMeMVoUZ0vY5bboK6PcZVgHUd9HIqHFwiFbn8CngGwhy/qeSEv8U
         qsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747222040; x=1747826840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZDaDYhFbMcyrsLhuZ6zLqO4Xp55KCZvGoT+6gmy9YU=;
        b=Y9nV071Jj4GPscxpwJ5TrluvXY8UIw3RX/kTfPqQ2KDVDR7jtYKVs7Rn1GYu8AwZiU
         yUtrkzlRMTPb0DJGnl1fS9CY4GkIVLR05AzafGeyM334G5IO1TlHypOu3XzJSVmo5Qrg
         zbj+8aozbSE9PYyFYrF242t/wixmLWGq72Mt7DLpOJB+vj6tNSoBeLMOPRy2IO1wxWWY
         0Dt9lucrszBIYPy+IWkFMwYSYGByMwD3i2IpBAUHgsPK3MneDkBlH6yhgoebxMpac+sB
         10htS8DD6cJkaZxEpNf3GHjECCyT48Tb+Al9ps6bNHHWU1gax0M9Rw+vAGBSE8iklZ+i
         Tl7w==
X-Forwarded-Encrypted: i=1; AJvYcCXlEPIH3Enokm1zBPumDUabkVNwDagz2aErB1QjWc6IW0csk5luU4IdFEffD/ZtIYdQZ95MJzZKC9g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm0PRG7NRMVdgKxDrt60dg092KiQVPaz23HAvX0ALibSpT7uAM
	+sJ7VCm24ex59dA8y8qnFm4IVBJh8cORbXQd6XJjW4pfIsWV1CcObbik8ZqyvAg=
X-Gm-Gg: ASbGncujOxGWy+i0KsNqUHzPThLGj21jnV4VrcBYbgLgMTJ7DZCKpAfrikq1GkZz73R
	4Shtnr4kzS56XEQOV1W8Cf2gnuMRzHm+sngGwyVuhd5dwxyikzNTt9bXjXUtDRgbL/ynX4zVDPI
	5sGkfN6SPxFIisd4IGur4vW8JWVlT6IuJ0qXCoWMYnNeupWpKHHmzAEDOgaohls0IZ+5vXMnb6p
	6ow9kmu5QEJ5t0AiyioMOiNK9i8FW5d2UwblDHjZGlyaymd9HnX3eZBCPa5tdiIdIYAJxq3SBF0
	A9N00xYc9Jn777gX/5r6JJr3LdSLZgWi6ctLJ92tOVq4nclTEVoR78gaKbpsjDBkB5HWXzwwfp3
	yHHsODWqMg83uLpteKA==
X-Google-Smtp-Source: AGHT+IEpsaX/cnJ6LSldGoemMCtF84xxBm+4NqJ/vWTxQbM4bwutDqFNHPwbHB9wTn9MjFgZGoVwmQ==
X-Received: by 2002:a17:907:2d21:b0:ad2:4817:6375 with SMTP id a640c23a62f3a-ad4f712a12fmr326543666b.15.1747222040313;
        Wed, 14 May 2025 04:27:20 -0700 (PDT)
Received: from ?IPV6:2001:a61:133d:b101:9ea2:16fa:3380:8e40? ([2001:a61:133d:b101:9ea2:16fa:3380:8e40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8508sm912627166b.9.2025.05.14.04.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 04:27:19 -0700 (PDT)
Message-ID: <29cc1ccb-4922-43fe-8d63-bc8333cc6049@suse.com>
Date: Wed, 14 May 2025 13:27:19 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
To: Alan Stern <stern@rowland.harvard.edu>, David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, oneukum@suse.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
 <8c963ad0-a38f-4627-be11-80ccb669d006@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <8c963ad0-a38f-4627-be11-80ccb669d006@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.05.25 16:25, Alan Stern wrote:
  
> Instead of having an URB keep ownership of its extra memory after it
> completes, xhci-hcd can put the memory area onto a free list.  Then
> memory areas on the free list can be reused with almost no overhead when
> URBs are enqueued later on.

The number of URBs in flight is basically unlimited.
When would you shrink the number of cached privates?
That would seem to be the basic question if you do
not link this with URBs.

	Regards
		Oliver



Return-Path: <linux-usb+bounces-29480-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A53B0BF565B
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 11:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82C2D467202
	for <lists+linux-usb@lfdr.de>; Tue, 21 Oct 2025 09:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D0E32AAA9;
	Tue, 21 Oct 2025 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JXqgQRiC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5025628725A
	for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 09:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761037351; cv=none; b=RhqRrvU1m95mO1vb720R9jBepbPngIq+GUldaXU9GIs4bJeSAUc+XrJRW4JR4ce2wAQOuRAORt02R9+o35oTWVl3oMvtcjNO1gsP/ZLufAkmQ1+sRPX0GSjeuJ0XbE63kQePgna1wbvupcRWAXUJwCw9BLFR9hO1MEqiZvxJFIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761037351; c=relaxed/simple;
	bh=OffQ204+Nyj5VGiYdW6PGJRNUJ3xhRI9Iw3cpA0RNp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HEV/aumAxKKOKO3KalIs4wP4FQyI3HsObCd/jWBiTVFv+L2J5aEYE6usLEVhyZrVg81grZODr61B8vu7BmYhNkg7ByV2yrG+1WRu8C1zgEvbPVrlN6NcknRheSWthfcp9cN6+qg07d9Q2sYTFmqmOG4Qu8O8ZUOVcLgatBxnwm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JXqgQRiC; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42706c3b7cfso1774543f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 21 Oct 2025 02:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761037347; x=1761642147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uV95Izl15icyzjNabiyKCGR1CIjMB77dOSJKauGty+Q=;
        b=JXqgQRiCeO/6bZC53J0LtiasJjjfxtp7weqhbCvhvkJRsME2Uo4sLgIb5X3jKHDL7w
         MoOv88N18VE/CP8yIPTL2pV+vGyUGhGAgaEVr/how2NtaFpsi9zsu74gBChM3S+g6UDw
         R59c69MOghHXFoywwC7yDdFc/QoAqfelLaBxbt/Os01BpwqmJG0uxWbTSwAQ6GwbNmkX
         piPGYdocSnbvwq3j8PRMkhQAUzTDRET5mLsXercyiRb2R0eFxCkIm11aevDhawPzf4ZF
         Kf1YrESL6oTZMuFqNCmAZvh1xAox6lyaK6yxAS461WzJIjQaevvRJEYMoOMLycRAB4eb
         l+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761037347; x=1761642147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uV95Izl15icyzjNabiyKCGR1CIjMB77dOSJKauGty+Q=;
        b=kIw/i30OX3eoe0kXZgNPFQ7BEt89W8TpKJmUneRe+7hZNFIsOkxO5GdDA+SXP5ViJe
         nZuxYVKpsLZjFCyGkuAOZXsNTragj+GeLA0Vop4rnszLESldjopxmjZoOVup03FFLUzP
         d0W0SEQ54fHz9+T+zMgh9HAgsmlg/9KFtVRdXHyrZ7w4dg5Cx7ZKDF1gUFQDmbsSTVgh
         Jyl3+dXjSRxY1yhGiDQQSJrIQ3tjz+QaAQWvzUU0q+6aSICgKJGq3YL3pj+WkCa2T8wi
         xJ6z9ZD5XxQVkW76NHYGKeQFAbhdlZXmYgvw+aZEyYXi0sBY/Xmm7tC29cnjjqC2OmDA
         P9Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVMy1ZG5ncbNK+PlE5CgeWIheRk2B8KajSdU/OHc6vXICjEsCzkzXN3RTFSOozLmSCmceErbcDD7Mk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuaOG+6OhpTxar6XAIoAS63Edi8mSUD4/lfgPrXAttXbs43eyZ
	Ptb35D2ueq8DfIXfMc4vLex0pk1wasmiSBesX8o8B0pAuhw/X8RCe9T0s3U/GvVLtSQ=
X-Gm-Gg: ASbGncs7hSf9SI3OJyilv6Da625pgm1HiL0FIjoPhe6K2g73U/uZ0AjOMXNca6SADnt
	CTPMpvUFcWfBhSBmeroNlYMJUJdDOvMn33So3ICH9jizkr6uZFh9RwyZwkSSeUpN6yXdwPT6cX3
	lGZUmqoUnJ2jqrtwemn+XU6KC+ci0EIZUHZc7ZuILJBaqZY76iVOhtQijzzVfKegCfDPi5ZaZIe
	fHTD7FhvekEDHH3vlxgD26H6n+xSeN8lUtcXnQuylUtybd+3R3cM4AqQt7oUe6S2u5WSqFKQUNs
	0iPU2qSlhrZu30QomCyHQgV6SZs2nGqevOpEC98VAmMk58PHqOFU57W00Vu+xW20OQMyCcDhNmQ
	NujdCyhYACE3UDRMxn+Xtm0NQbJPsSXe17H9CeGKnywDe02mN7MUwzERyzkgucKHrLa5rdZHOCd
	d7tCqdFs8esAJ4cZQeo0iEm9uB07UEw2ny0hH1wF+xfkpF4tJtSaLm
X-Google-Smtp-Source: AGHT+IFq6w36inwR7PpG+ZkZbBwkFGa55fsBXWBVdNad663sGiVEFpxwXvkazBKvYy9SUPhOCmUAYg==
X-Received: by 2002:a05:6000:40df:b0:3ec:42ad:591 with SMTP id ffacd0b85a97d-42704d9899emr12228828f8f.36.1761037346574;
        Tue, 21 Oct 2025 02:02:26 -0700 (PDT)
Received: from ?IPV6:2001:a61:1369:8e01:d78f:5536:188:1544? ([2001:a61:1369:8e01:d78f:5536:188:1544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ba070sm19511194f8f.42.2025.10.21.02.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:02:26 -0700 (PDT)
Message-ID: <806d82e6-6db6-4ec8-a49c-665a97ea36f8@suse.com>
Date: Tue, 21 Oct 2025 11:02:25 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5 2/3] net: usb: ax88179_178a: add USB device driver
 for config selection
To: Michal Pecio <michal.pecio@gmail.com>, Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, yicongsrfy@163.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 pabeni@redhat.com
References: <20251013110753.0f640774.michal.pecio@gmail.com>
 <20251017024229.1959295-1-yicongsrfy@163.com>
 <db3db4c6-d019-49d0-92ad-96427341589c@rowland.harvard.edu>
 <20251017191511.6dd841e9.michal.pecio@gmail.com>
 <bda50568-a05d-4241-adbe-18efb2251d6e@rowland.harvard.edu>
 <20251018172156.69e93897.michal.pecio@gmail.com>
 <2fae9966-5e3a-488b-8ab5-51d46488e097@suse.com>
 <20251020175921.37f35e5a.michal.pecio@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20251020175921.37f35e5a.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.10.25 17:59, Michal Pecio wrote:
> On Mon, 20 Oct 2025 11:59:06 +0200, Oliver Neukum wrote:
>> On 18.10.25 17:21, Michal Pecio wrote:

>>> @@ -1255,6 +1257,8 @@ struct usb_driver {
>>>    
>>>    	void (*shutdown)(struct usb_interface *intf);
>>>    
>>> +	bool (*preferred)(struct usb_device *udev);
>>
>> I am sorry, but this is a bit clunky. If you really want to
>> introduce such a method, why not just return the preferred
>> configuration?
> 
> Because I wanted to introduce exactly such a method, rather than one
> which returns the configuration ;)

Well, then I have to state that your patch perfectly implements
your wish. >:->
Would you allow me a follow up question, though? Why have you
developed that wish?

> The point was to pull configuration selection *out* of those drivers.

While I appreciate the goal, it is not clear to me how adding
a method to the generic interface driver template achieves that goal.
In fact this approach seems counterproductive.

In particular a bool will not work for the generic case.
If you really want to make this generic, you'll have to face
the unfortunate possibility that a configuration have
multiple interfaces whose drivers disagree in that regard.
At a minimum you'd have to be able to return a "don't care"
value to compute a reasonable pick.
  > They already do it, and it makes them copy-paste the same trivial loop
> which iterates through configs until it finds the vendor interface.

If the concern is simply getting the code centralized (which
is not wrong), then Alan's original proposal of having a flag
(let's not call it a quirk) in usbcore for devices that need
the logic in the heuristic for picking a configuration to be
inverted would seem to be the simplest approach.

> The idea is to have a maximally simple check for a known-good vendor
> interface driver before making unfounded assumptions like:
> 
> /* From the remaining configs, choose the first one whose
>   * first interface is for a non-vendor-specific class.
>   * Reason: Linux is more likely to have a class driver
>   * than a vendor-specific driver. */
> 
> Unfortunately, that's only half the battle. The other half is forcing
> configuration reevaluation when such a driver is loaded. I hoped it

Exactly. Hence don't put the information that the assumption
must not be made into a driver but into usbcore. Problem avoided.

It looks like this is an issue we are not going to find a perfect
solution for. Hence our priority should be finding the simplest
change. IMHO that's a new quirk just inverting existing logic.
Sure, it is a bit ugly because it depends on the kernel configuration,
but that is what we have a preprocessor for.

	Regards
		Oliver




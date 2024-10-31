Return-Path: <linux-usb+bounces-16885-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED269B761D
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 09:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 420141C217B6
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 08:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357C9154426;
	Thu, 31 Oct 2024 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsJe8mH5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1681531D2
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 08:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730362438; cv=none; b=KsfgW1Lk+041uWogk84FhWowB+8rD9gGeQX8F0SFGIpVDWrutOcgwSKU+vgu5JZv++kPySZOGnKFI04H+xoSMJofPdqn1+0q96NS7LncTsHBB/z0NnOnF+UHrWRJeIn+tgO5uqxHo+CJCQP3Jvi/0GRG2oUdFl3l/T9HvkWH1cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730362438; c=relaxed/simple;
	bh=gImVW4DNAf6lMNeAy/2Zpx0XJeOqV29u7ulIzcbl/rs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OxhsNV6HndPkrCyr/Odez+X08DOmu2YkNo8hPiCGX39CdLPhgX5TpqqwMNTKefEyfktVffgOf9H53t0ZaMJjNxhBA3t3oq7wRbVeUQTosbWifBgkYJwD6f88RQkiSKcUiTjF6eoTS9hlJXSDjC0Ue7Ws66K53trGobbocJRSKy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsJe8mH5; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53c779ef19cso699771e87.3
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 01:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730362434; x=1730967234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9n2iBVwWi1z4rPZTbW/61X3m9xu/0GmSD6PuIr+SDs=;
        b=NsJe8mH5pbq/kxFV422N9lc9hcdBi3IAbxVWQ6TFbkyvd/POsdSRM6g0YFgTjeJwqQ
         a52WJIhzql3YmOguIKbS1fArrwatH8uNJAS9+oYOztc2Eh07vpDdfvrlH9gXiFWdGJcf
         rnGFZ7WbsPRP+aYkXHRbmRSx3Ej9ampZArbyyTGyYYxjR18rRYMshUwEuX169e6KQSxX
         F2LArHWlAFza1ONtU22238GiO6lMqrtN/oulLq1KGCXJ1+9LidK9cSEVKLLDMBukKKUh
         tEdzogF6MJqdcI+DnqihU9wnWXybZysfbohp3TRsVe28rQ6DKCQs+gpBMEEKSv3hLzTW
         3rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730362434; x=1730967234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9n2iBVwWi1z4rPZTbW/61X3m9xu/0GmSD6PuIr+SDs=;
        b=vpMBQ02UQFGoS4SZoBDWHj9DLAjRrZrdQQjr8/5aSnKZpwEf+gpLrghNwCc1Bb5qLz
         IIgQsc9AKEqPFvASLXaOpe1gpQE93TJCiTgkyohny7KWyeiT4S00Zjc+xGYlBVPlsBYn
         fH2Z1HSwoHMrNH37SRsPlCdeAU9O5OQNHp8UAvCXsV8cvjVuIeDeNnqRRk4MbODj1+y2
         ULwf8bOZNGPLq9H46C5L2tKu/mBoiBLSQx4SqIF+JV1FU15dLXQ6VD24MPtg7Ei/J3bQ
         9OwQxvliA+H5zP/6/EfAgii/IhlDoOUn3KuaftuZ1pPDAlyMMTH0CZLzbypeKnHBeGgy
         sDGg==
X-Forwarded-Encrypted: i=1; AJvYcCXv3QB0fJjO74S+KLf1LJJZQCqny6NdragWyO3h2tRM0rUbtaj16wSkzzrIO1KFulG8kIUG4C1Ey8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzXxIC8z9EUd+GvErf8fK8u9dUlURQiZRFS5f1k/jE7BfOaF7r
	YwO0pTLKnpx4MmTHY5CoJkLyNoCq2DOtqFhI1Uyz73uU8+hUI65G09h66Q==
X-Google-Smtp-Source: AGHT+IGH1are59rxdHDSopDhu0eIxf6qApQg1pwuuypA3WrUXfMIHcMxs7mznON6rq31wj0RbWhKYw==
X-Received: by 2002:a05:6512:68f:b0:539:f807:ad93 with SMTP id 2adb3069b0e04-53c79e91287mr1190578e87.38.1730362434030;
        Thu, 31 Oct 2024 01:13:54 -0700 (PDT)
Received: from foxbook (bfh123.neoplus.adsl.tpnet.pl. [83.28.45.123])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bccd6d4sm124188e87.130.2024.10.31.01.13.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 31 Oct 2024 01:13:53 -0700 (PDT)
Date: Thu, 31 Oct 2024 09:13:47 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 "Neronin, Niklas" <niklas.neronin@intel.com>
Subject: Re: [PATCH 0/2] xhci: Fix the NEC stop bug workaround
Message-ID: <20241031091347.29b6ffdd@foxbook>
In-Reply-To: <35fdb2a4-8514-4b4d-9332-127d6ed07908@linux.intel.com>
References: <20241025121806.628e32c0@foxbook>
	<20241028083351.655d54cf@foxbook>
	<f6dcf205-e8eb-4ba8-91d9-24fa0f769739@intel.com>
	<20241029092800.32eccf3b@foxbook>
	<7c2abdd1-c209-4616-9d18-be5fc99fc527@linux.intel.com>
	<35fdb2a4-8514-4b4d-9332-127d6ed07908@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I will send out v3 of my own patches soon.

I also plan to research a radically different solution, which is simply
to prevent failed Stop Endpoint in the first place. General idea:

1. If commands pending, "outsource" the work to their handlers.
2. If EP stopped for other reason, invalidate/giveback immediately.
3. If Context State != Stopped, queue Stop Endpoint.
4. If Context State == Stopped but shouldn't, set up a delayed work.
5. The work looks at Context State and goto 3.
6. The work may choose to give up retrying after some time.
7. The work could even act as watchdog and call hc_died() if Set Deq
   or Reset EP get stuck in retry or abort loops (not seen so far).

On Wed, 30 Oct 2024 10:29:12 +0200, Mathias Nyman wrote:
> 1st patch avoids stopping endpoint in urb cancel if Set TR Deq is
> pending
> 2nd patch handles Set TR Deq command ctx error due to running ep.
> 3rd patch tracks doorbell ring with a flag. It's for now only
> used to prevent infinite stop ep retries. Flag is not properly
> cleared in other cases.

Quick comments:

1. To be specific, my suggestion was to make the function work even
   if called under SET_DEQ_PENDING rather than try to avoid this. It
   ends up simpler IMO and solves any risk of calls from other places.

   Then the change in xhci_urb_dequeue() becomes an optimization only,
   which is not required for correct operation, may be combined with
   other similar optimizations, or even reverted if necessary without
   breaking multiple stream cancellations again.

2. Mixed feelings. Adds complexity, obviously. Shouldn't be necessary
   if the retries prove to work on other chips (I have never had a Set
   TR Deq error on NEC with the workaround). Could help otherwise.

3. No need to pollute handle_tx_event() at all, because the flag only
   needs to be guaranteed false when the EP is Stopped, and this can
   only happen by *successful* execution of Stop EP or Reset EP. Easy
   to detect this in handle_cmd_completion().

   But I'm not sure if a new flag is needed at all. Its value will
   simply be negation of the condition in xhci_ring_ep_doorbell(),
   except for cases when we "forget" to ring EP doorbell, which are
   probably bugs that should be fixed.

Bugs need to be handled some other way, because hardware has them too
and it's impossible to predict when they bite. See below.

> Series can be found in my tree in a fix_stop_ep_race branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=fix_stop_ep_race
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git
> fix_stop_ep_race branch
> 
> Do these help in your NEC host case?

This looks like it should work on semi-well-behaved HC like NEC, but it
doesn't account for hardware not restarting an EP "just because".


while true; do ifconfig eth0 up; ifconfig eth0 down; done

locks up on ASM3142 with AX88179 adapter as expected, and when the NIC
is disconnected I get those 'ep ctx error, ep still running' every few
seconds. It seems lots of network code got locked up and I can't even
ssh into the box anymore to copy exact dmesg output.

> I'll see if I can set up some system to trigger this myself

Good idea, lot's of fun ;)

Michal


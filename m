Return-Path: <linux-usb+bounces-27370-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D20CB3B57B
	for <lists+linux-usb@lfdr.de>; Fri, 29 Aug 2025 10:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E69A2983BD8
	for <lists+linux-usb@lfdr.de>; Fri, 29 Aug 2025 08:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3514F286402;
	Fri, 29 Aug 2025 08:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jv92dV2n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBE35CDF1
	for <linux-usb@vger.kernel.org>; Fri, 29 Aug 2025 08:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756454818; cv=none; b=TvlYK5Fcl9pPgbMVcEuL9i5vr++IFaTOieIo3ZQX3wyDvfWJ6Q7L04H8APV8yCxBpkU+z2gousNhAkX/InMlcm7PnWA7aw2zpubNwdkZTgegBv6CtOkcBAdGfeq8XpiqtKw+OhrMsmgw3dDeCP0TZsI/h1N2hK2KjXOu7tlzl2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756454818; c=relaxed/simple;
	bh=l83ijJev/tO159Mr1oTBaYfjk9AK8yOCG88wkAXbGDA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lYLKk1v6EXSWxajqHBitTlql0n73oGuftmYQCuXX3r/6j2xVW5fwKQeXB+cYTC+peo4KKLuaofOo+GKbO56hqli7fMBLk+nLwBMxF2OWOoQ9BD4KYTcHM1c+CyrDA9ltagl5iMDS8oPu8R1EgZIxdE/cSnznNUhhfbo/GLmUNYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jv92dV2n; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f469ad067so1940470e87.0
        for <linux-usb@vger.kernel.org>; Fri, 29 Aug 2025 01:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756454815; x=1757059615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZduPW0Y951VOmeUWa/SfvTHMSkWcIxcHq37QLlSCdk=;
        b=Jv92dV2nFpYH/0h+Q1gpDvHM7QqmOt73hhYDNUw4FVOfctL+rh1lLQgRXsFvrv/QVO
         e96xhDwgAUldy/64eQjT/4CgnXlYBf0kJdJtMiKWpugO/l/V+lbU+xK4+f3TZW1xpz28
         02eEXL2PTJJHGT7WzgbDO5CcUhR+dDAoHk++X2bxokghaPKLs9sPqDDiDkjeuHeNoYAy
         WqRZb6nstH6oKXfyf3oa2AoChCyp+iQozpHcJpckGeJGfqrbiIsJnQkZ9OI4INuk9SvV
         PQJVrT3Uj7L7TVWA/f4mFVvufdkcfMS9Qug7vN8Psf/aOCNOKHouK/p5L7Slzrn8gk5Y
         N9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756454815; x=1757059615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZduPW0Y951VOmeUWa/SfvTHMSkWcIxcHq37QLlSCdk=;
        b=uJ4+aEkHmXWe4pxYc9L5MdXwyAcnlHeHVhbCnAXjSgxn2EOtsMHzBNavsPq9koXaPY
         xPdKDgu1fQCqz2H6wVZmVvDXlgfp5AUWdIlGM6GT9BYod4i76dGHkoyS0M8bKERbCHTJ
         URB4ORnnMao3+gSSjXkEfsJXBrBptthbLL1ty7ODL64TZyNPstcBtrilF2JGRGcC7gLH
         0xPbedki6Dczk7QE2Qx55llaaYzOewFNWjsO0KUaCVyWCOFAl0mwW8Eeox2htsuSio7m
         h2+XQ6yTFqFfGixmuctbweBggVCoJlqtzn/eTHFJBqEmru/7Kph4lAQ60QIqCLw4IHjI
         eQkQ==
X-Gm-Message-State: AOJu0Yyj+eFnIgylfl0RdQYIF8mEsoOx+HvztFn8AtXyoCxdahYCU7qN
	R2a1UMQfJHA4HSpruYEW0tFBxNhP13trgj8PySXB1I5RGPO+zNm/IMkH
X-Gm-Gg: ASbGncuLpgJTDLg+81zyYuvQgR+kvkVrrlcg0vvHJH9FN7f40U0lMjSG76amQovsoU4
	cUw4OOr2Ap/6BppsshWVcWdJb1RHSVNpJaO92CoWo5tArABw6JRKGXOzsjCxkaiIs6UoaziF6ez
	8a4ju9pN2GkO6fjuOdDxjVDIgJwqr8j+vi3S4op4gCNqqjEb4pqznMWcOdZLS1C/iLFSXHH3/kr
	gCK9NyVX9p3T5vtsUhagFtOtPlrsVcrQIVYRhAmTdAmxBHn8EVDuh6ozAm0HOUwQv3hwB1eJKKE
	grcfcq2l/RULl2j0pjE1VFCN6Q0qB45/U4pY2eEgDbLTmIJGIrimgnhHy7jPsZwAWzq1Fqk1Q7n
	y0YGg68X/nmEnGyUeEfROCxk8G/JRY6t16lgJdOGVmva8Vw==
X-Google-Smtp-Source: AGHT+IGEnRmn46f+X0b3BhdQsDHokm44kf9n4ltVPJDGcIq7sKM2jPQB4LbtR29qjIDssNhShq+Ieg==
X-Received: by 2002:a05:6512:3249:b0:55f:6b08:e60 with SMTP id 2adb3069b0e04-55f6b081193mr112733e87.5.1756454814443;
        Fri, 29 Aug 2025 01:06:54 -0700 (PDT)
Received: from foxbook (bhd106.neoplus.adsl.tpnet.pl. [83.28.93.106])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6772c63asm442134e87.56.2025.08.29.01.06.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 29 Aug 2025 01:06:54 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:06:49 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 4/4] usb: xhci: handle Set TR Deq Context State Error
 due to Endpoint state
Message-ID: <20250829100649.6eaa94e9.michal.pecio@gmail.com>
In-Reply-To: <7b70c5d1-b83a-4bce-8d3f-9e181a0329a6@linux.intel.com>
References: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
	<20250818125742.3572487-5-niklas.neronin@linux.intel.com>
	<20250822101514.3a730f4f.michal.pecio@gmail.com>
	<20250825091552.350d027e.michal.pecio@gmail.com>
	<7b70c5d1-b83a-4bce-8d3f-9e181a0329a6@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 27 Aug 2025 14:53:14 +0300, Neronin, Niklas wrote:
> Thank you for the thorough review and the additional debugging efforts;
> they are greatly appreciated. :)
> 
> 
> I want to clarify my intentions with this patch set:
> 1. Add exit points for as many error cases as possible. The function
>    xhci_handle_cmd_set_deq() is tightly interwoven, causing any change to
>    impact all completion cases. By adding exit points to error cases,
>    future modifications can be more precise and targeted.

I think the flow can be quite linear and with little duplication:

1. Start with gathering information. Does the endpoint still exist,
   does a TD in TD_CLEARING_CACHE state exist, what's EP Ctx state.

   The TD can be found once and saved on a variable with some clever
   name like 'td' for later use by different switch cases. The loop
   doesn't actually need to give back this TD because later we call
   xhci_giveback_invalidated_tds(). Not sure why I didn't clean it
   up when I added this call, maybe becasue it was a -stable patch.

2. If success, update ep_ring->dequeue and td->cancel_status. The TD
   is supposed to exist, success practically guarantees that endpoint
   is stopped so the TD couldn't complete and nobody else should give
   it back in TD_CLEARING_CACHE state, so !td here would be a bug.

3. If failure, report it with any relevant information from step 1.
   Then decide what to do with the TD, because somebody expected it
   to be given back when this command completes:
   - if !td then nothing left to do, though it's still a bug
   - maybe mark it TD_CLEARED (current behavior, not great)
   - maybe mark it TD_DIRTY for a retry if there is hope it will work
   - maybe try some crazy desperate error recovery means

   - or maybe give it back and never restart the endpoint again?

     It's not a regression if it never happens or the xHC is unhappy
     and the endpoint will not work afterwards anyway. This would
     need some thinking about the exact definition of "never again".

4. Clear SET_DEQ_PENDING and related stuff.

5. Call xhci_process_cancelled_tds() or equivalent. If there are any
   cancelled TDs left at this point, this step is not optional. Anyone
   could add new TDs while the command was pending and this handler is
   responsible for ensuring that they are invalidated and given back.

> 2. Keep it simple. Handle errors that do not require "fixing" and handle
>    them simply. For example, Set TR Deq commands that failed because the
>    command is no longer needed. In this case, the logical coding pattern
>    is to free the command and return. This approach does not require the
>    reader to know that a completion handler for some other command has
>    freed the TDs.

If "no longer needed" means "the TD in TD_CLEARING_CACHE state is gone"
then this case is already covered by existing code. And a new command
may still be needed for other cancelled TDs, so the hanler can't just
do nothing and return. A bigger problem is that in this situation we
most likely got a Context State Error and the endpoint is now running.

It is virtually impossible for other handler to give back a TD waiting
for Set TR Dequeue because handlers use xhci_giveback_invalidated_tds()
which wouldn't touch a TD in this state.

> 
> 3. Assume the cause of the errors are according to the xHCI specification,
>    section 4.6.10.
>
> With the above in mind, this is how each error IMO should be handled:
> 
> case COMP_TRB_ERROR:
> 	No known fix, print warning without specifying a reason.

The ugly question is what to do with the TD. We know that the command
failed, the endpoint is probably stopped and if we restart it, the TD
may execute from xHC cache. But it may also not execute because it has
been turned into No-Ops, or it may execute in a corrupted form (partly
from cache, partly from the ring.

And somebody wanted this TD to be given back ASAP.

> case COMP_SLOT_NOT_ENABLED_ERROR:
> 	The Set TR Deq command is no longer needed, free and exit.
> case COMP_CONTEXT_STATE_ERROR:
> 	case SLOT_STATE_ENABLED:
> 		The Set TR Deq command is no longer needed, free and exit.
> 
> 	case EP_STATE_DISABLED:
> 		The Set TR Deq command is no longer needed, free and exit.

As far as I see, in these cases it is practically guaranteed that the
virtual endpoint no longer exists, so this code wouldn't even execute.

And if the xHCI slot has been disabled, what might be the state of USB
core at this point? Could 'struct usb_device' be freed as well, maybe
the driver unloaded too? Basically somebody leaked an URB which is now
filled with dangling pointers?

> 	case EP_STATE_RUNNING:
> 	case EP_STATE_HALTED:
> 		No simple fix, print detailed warning and proceed as usual.

Halted may be OK to log an error and ignore. We will get a completion
event and things will perhaps get back on track, although it's still
WTF that we got here and unsure if it won't happen again in the future.

Running is problematic, because we may have more cancelled TDs pending
and we clearly lost control of the endpoint for unknown reason.

> 	case EP_STATE_STOPPED:
> 	case EP_STATE_ERROR:
> 		IMO it is worthwhile to retry the Set TR Deq command.
> 		If we don't retry, the driver and hardware will become out
> 		of sync, which eventually leads to a crash. By retrying,
> 		we either succeed or still face a potential crash.
> 		But I'm open to simply printing a warning, as this should
> 		be an extremely uncommon error case.

Possibly makes sense in Stopped. Which is also not likely to happen,
because Stop Endpoint shouldn't be queued with Set TR Dequeue pending.

But maybe we could get there through Reset Endpoint with only one bug:
1. BUG: the endpoint runs while Set TR Dequeue is pending
2. then it halts for some reason before the command executes
3. transfer event handler queues Reset Endpoint
4. the command fails (Halted) and writes a Context State Error event
5. Reset Endpoint completes before this event is handled

We generally try not to queue multiple commands on the same endpoint
to reduce race condition headache, but Reset Endpoint is an exception.
I don't remember why, but I thought this exception is necessary evil.

As for Error, I don't know. The driver makes no effort to recover from
transfer TRB Errors. If it ever happens, handle_tx_event() gives back
the TD normally without attempting to fix the endpoint.

This also means that the TD which xhci_get_hw_deq() currently points to
has either already been given back or will be given back soon.

It would take a whole separate work to enable TRB Error recovery, and
why bother? Apparently nobody is complaining, and if it ever happens,
just fix the real bug which caused it.

Restarting an endpoint after TRB Error risks that we get it again when
the class driver retries the same or similar URB.

> > 1. I'm not aware of any known cases leading to this situation.  
> 
> If that's the case, then we have successfully prevented the error,
> which is the best outcome. :)
> However, if it happens or a future unrelated change causes it to happen,
> we have at least some error handling in place.
> 
> > 2. A loop which finds and updates the TD_CLEARING_CACHE item already
> >    exists, so I think it would be better to modify this loop instead
> >    of adding another one. And the loop prints some xhci_dbg(), so it
> >    would be nice if they showed up in this case as well.  
> 
> To keep things simple, it's better to keep them separate for now. 
> This patch set is not the final version of the function; instead,
> it's a small step.
> However, adding a debug message to the 'td_cleanup' is a good idea.
> 
> 
> That being said, I'll do some more testing for the cases you mentioned.
> And it might be better as a first step to just print a detailed warning
> and promptly exit the function for all error cases. Then in separate
> patch sets add handling for specific error cases.
> 
> Best Regards
> Niklas


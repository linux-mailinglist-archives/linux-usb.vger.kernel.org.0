Return-Path: <linux-usb+bounces-36306-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFrrJZnu4mlLAQEAu9opvQ
	(envelope-from <linux-usb+bounces-36306-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 04:38:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C0841FB3C
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 04:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73EF230B3F90
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 02:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8E2330B09;
	Sat, 18 Apr 2026 02:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="E5d4WD2A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A5432470E
	for <linux-usb@vger.kernel.org>; Sat, 18 Apr 2026 02:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776479704; cv=none; b=mzD33oqbhpvfvlBYbkWIp7cNTbWLjsaPZEY27NFTOodYa7oYfAhewPsZkxWiL/kcQ7HZEOzIq7IQLQRQTOLGpvoHzZxzODGqTyksteyzT/cULRJMK9LUF25HP/WcWn60W7dO7smMHtaHLa8TRfX+tolw3KXMHWHxqy0/PXNX7SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776479704; c=relaxed/simple;
	bh=R7Ceb6L48ow5uSGfUnSj0/B4/WceoqVmBK0QwALbJuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skXBIBLe0HUX602R3PNrXEF5+/oWWQirsGz2YTPCjNNQDrZYYcfmq6OLq0gjTobBdcqb1kYWFnZ5HqGcDpqvkhyTT4CCNM9d59rGlMkO5CiL6tqkxfR+sorhqcedyowRDAsY2L03v2wb3eu9ra8tGdTeKASAIewawCSIQmsS0RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=E5d4WD2A; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8d424af6282so140015085a.0
        for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 19:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776479702; x=1777084502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k3RpLt6YZRJTexrE0XEFoY9Z7CJnQO6lPu+1lOtOsVU=;
        b=E5d4WD2A6pQWEkuFHBLJXKzIi+Wz/1oNr/qMLUgYRUhToOR/z9jCYgKtI3/Ztxpg32
         COYhseOKj17X+v/a7PeHGU7gXMS+g/3KjlCBvFMxvRsTwylekWjeUh4w5YNzomA0qYwp
         ltfsoaOHCmnefSbLUyoqAjkYarXaNkAhdkMv3yko/SScREsMZAoUkB5jW4aCL5apTFTb
         O+qOxoBf/D077cHb4bDXclj5kF7TeT/QwmgWZaEzpJiOYQkrk1l+N6lzu3TLjuZNwbES
         t6JKvnV7QuRw1vez+EKED5zrV+f0H8n0kkp5CWWgei8S6M1mqkhfGbqVWneZz1eB0D9X
         Hmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776479702; x=1777084502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3RpLt6YZRJTexrE0XEFoY9Z7CJnQO6lPu+1lOtOsVU=;
        b=NVYBSV2froJPDH82X2xJsEGHgZtMlLtY3a0bH9W2iJ/YhLIYGogolqjI1d+NtBbErQ
         TEYmBsO1uaH6ulqTvcFF7iKg85520CAQTrckQkCD6GH0F15FXgqztMrK5NTuyhBc7oHU
         vN38BVE/C/M5J+pmIAoWkSL6l4bCUksj3FJgyHOZEthy0goL/AteomuC/1Pduw4GqpCt
         WFNmyixoKJTHhypzbhafyzq23gIPtdgWVYVV/7jalan3iAQ7I8Ny6vqTEfU5VPDSo8Y3
         kXrKzLKDWXzNr2SGWvqzzaRYEnBjAPLvhY54iKKVA0+HkuRRxX4C4b3idDoXUyBWsRFL
         WhJg==
X-Forwarded-Encrypted: i=1; AFNElJ+ImVTOxaTQUJcwmusGnHqBhSf3ipkcziXNL+TYhyA63+aN31H4lWUQYkIiUz1NLCU9zWNMHLqUAlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIPni3tUX7G0qTMOt/cA3MDOqKm77aMe+TudIxkE0kJXGENHVd
	UVGFcFLw3uV7a6ZrPzNNyAiqv+BQz2984LTIUHTfOmOC7iywJSG2By5I968hr59eG5CYEYL1Odp
	pApcAFg==
X-Gm-Gg: AeBDievx/qh+JE3tHQMar4uqAmPzKDcynpWdC9LIT+DG8ioCOuLyibJ4erC/9WXObi8
	sCUxGpzxqX7XAgHjxLtJdYqqx2KCVcOxkEUjhy/Z6C/EONY1hWc68AN3tClHtj8ca3hz7FWg+a2
	1fab5nxJgWF9wHzb8kw8nUCADQDdD/lf4t7ruOkkYcg0RaKCurnWpQPedvWJlAm/kYpZhal+tST
	LR0Mu6gixkwGiCEOnc4F6dYh9KtUI4q3USZYsn1JqRtIK1iGcP6a3o6y+hpU68CnaRvQgsBkPQl
	zTsmk2c30l4vzd7pxomSO5MgGW2f5ifLceKhBg4HyAmLvLVA26Q2mtKHa7cGZ+xaS/mmD5xikI6
	hcyYL23VGVkOmba/Y9pe00pBmLXwsH4Pl1ufFScr8LTCqIE3LDDSn+VciglaTrMvzkVmGm+brPk
	iI+cndjc8ujJJVFU/RBho868/Xc+xOHdN/Ef2yisOOXvPkag==
X-Received: by 2002:a05:620a:1a26:b0:8cf:d565:fcbb with SMTP id af79cd13be357-8e78f44328amr782520385a.11.1776479701892;
        Fri, 17 Apr 2026 19:35:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d95d4282sm268802685a.42.2026.04.17.19.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 19:35:00 -0700 (PDT)
Date: Fri, 17 Apr 2026 22:34:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <e89a6683-4570-4ca6-95ea-0e9932614974@rowland.harvard.edu>
References: <20260404204133.3mcizeeokw3ln5r4@synopsys.com>
 <243af5f2-3925-4960-be7b-8d0c273ae629@rowland.harvard.edu>
 <20260404221533.woepax7jxwefy3fq@synopsys.com>
 <20260404222818.t5y52gnd2gvalvp5@synopsys.com>
 <b4e2edd9-2616-4cfe-90a5-438fb6625706@rowland.harvard.edu>
 <20260405030954.32jbg3fphi5xdla3@synopsys.com>
 <74ac9ea2-34d1-4999-9048-c03a0f978b5d@rowland.harvard.edu>
 <65682e07-e18c-4674-bfa7-2cc27abb5ede@linux.intel.com>
 <4a484a89-f52a-48c2-af43-c0029878ddaf@rowland.harvard.edu>
 <20260417234846.41a24089.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417234846.41a24089.michal.pecio@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36306-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 10C0841FB3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 11:48:46PM +0200, Michal Pecio wrote:
> On Fri, 17 Apr 2026 13:38:46 -0400, Alan Stern wrote:
> > The behavior for control endpoints isn't clear.  When a transaction 
> > error occurs in a control transfer, does xHCI stop the endpoint
> > queue? Presumably usb_clear_halt() isn't needed, but what about 
> > usb_reset_endpoint()?
> > 
> > I will assume that all stalls for control endpoints are protocol
> > stalls and therefore do not need to be cleared (the device will
> > automatically clear the halt condition when it receives the next
> > SETUP packet for the endpoint).  But does xhci-hcd still require a
> > usb_reset_endpoint() after a control stall?
> 
> Nope.
> 
> The host endpoint halts on every STALL handshake or non-isoc protocol
> error, but the driver immediately resets every halted endpoint because
> it's a precondition to even remove the failed URB from the HW queue
> before giving it back, which looks like a prudent thing to do.

Okay, good, we'll require all HCDs to reset control endpoints 
automatically after every error and stall.

> Currently, by the time the URB is given back, its endpoint is already
> in a "stopped but runnable" state and its sequence state is zeroed.
> And it may have already been restarted if there are more pending URBs.

Ah, I was going to ask about that.  This will be different from the way 
bulk and interrupt endpoints will behave, but I think it is acceptable.  
Control endpoints aren't used for anything that requires high 
throughput; if a driver wants an error to prevent later transfers from 
starting right away then it can simply avoid submitting those later 
transfers until the earlier ones have completed.

> This seems to need no change for control endpoints?

No change needed.

> For bulk/interrupt it also means that if we delay the restart until
> endpoint_reset() then endpoint_reset() has nothing to do besides
> restarting the endpoint, which is a good thing because this method
> under normal conditions requires no URBs to be present.

That could be an issue, because there may well be some URBs that were on 
the queue when the error occurred and were not unlinked, or were added 
afterward but before usb_endpoint_reset() could be called.

> > Recovery from a transaction error on a bulk or interrupt endpoint 
> > involves sending a Clear-Halt request to the device.  But if the
> > error was caused by some sort of transient interference that hasn't
> > ended yet, the Clear-Halt might itself fail with the same error. To
> > handle this, we should retry the Clear-Halt at increasing time
> > intervals.  At what point should the core give up?
> 
> Good question, I don't know. One thing I noticed is that Windows does
> tend to lose patience with completely unresponsive devices and kicks
> them out, but I don't know the exact criteria.

Two reasonable possibilities are 250 ms (because that's about how long 
an intermediate hub might take to notify the core about a disconnect) or 
5 seconds (the normal timeout for control transfers).  Of course, 5 
seconds is an awfully long time to wait for a mouse or keyboard to 
recover, so maybe something in between would be best.

> And if core is to clear halt autonomously, things may get interesting
> if a driver tries to do the same, or something else like removing the
> endpoint with usb_set_interface().

I will set things up so that an extraneous clear-halt (such as one 
submitted by the driver) will prevent the core from doing its own.  This 
leaves the possibility of the core clearing the halt and restarting the 
endpoint and then the driver doing it again, while the endpoint is 
running and the queue is nonempty.  Hopefully drivers avoid doing this.  
But if it helps, I could print a warning if usb_clear_halt() is called 
for an endpoint that isn't stopped and has a nonempty queue.

Also I will be careful to make the core's actions mutually exclusive 
with: suspend/resume, reset, disconnect, set-config, and set-interface.
Should anything else be added to this list?

> A related issue is clearing TT buffers. AFAIK this has no retries, it
> fails silently and leaves the endpoint potentially broken, and it is
> waited for to complete in case of usb_set_interface().

Is there anything we can do besides calling usb_clear_halt() and 
usb_reset_endpoint()?  If not, and data loss is unavoidable, then so be 
it.

Alan Stern


Return-Path: <linux-usb+bounces-33293-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO2QE9mgjGmPrgAAu9opvQ
	(envelope-from <linux-usb+bounces-33293-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 16:31:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD74C125B0B
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 16:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E8883012E9C
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 15:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563BE2E0412;
	Wed, 11 Feb 2026 15:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZLW+Zy0Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59502D94A3
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 15:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770823890; cv=none; b=ltKBGugP7AoThJY/4RJbVKY18+VRJxfyXMaRQQdJ1JzPILHR+nS+/tYjNNho1ATLQ769pouDuLerSEQVW7urZcZJuO4Y8JdSAdmr4lwgtkuJdIvOTwRknp5BhwOvVcxSnfABLi2GCtpTJJE4zgWBLqmCmC6uZam3K56F/WqHmew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770823890; c=relaxed/simple;
	bh=RFYkZrMyxGNdpTgS+Rrg5Nbark0PsK0OE0eKHasuCmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVSpbLzlkSNqxEVqtPdio5a5emDc0rXo5VJSUD4z+5YpaAGqhxFWXZL9aIgedVWfSwAk7MM+asytmFxlKMh/x2Pg2h0nTjcwCTetn0aU/eHrAExoPsFURzT2tcyOfsSKCKKHy9GRlh920wD2Rt6UHLp4/hBI/sWvYJN2Zg9vMBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZLW+Zy0Z; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8c6a7638f42so725550285a.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 07:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770823888; x=1771428688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2DPizJHDpByN85Dw1d6viBsgdf3j/JzTi1whjje/4is=;
        b=ZLW+Zy0ZO0q86Un4fpyXPl4fg1ISgXAljr1lZACSkETRR/Y+jG/LOvGVs4EVIXVoIK
         /hgPmT5M6zPYIdr2xtqOghAeUKt/LqHrs/HeK/No+o2D5H7/5YnVi7kFEJTtZZhYweK3
         Uhm/zA9q5EZqKxIQnn3bIHJVB0rGljPOvCymRPHe8o6grUoH0LzdAyI7aIbSR+hXbZ/s
         ooe41mn7Q6hMPpqypjDwNFVEWf+r4CjZ1+ANqQJHDn5FDrOR8e1Sw+vdqUqh++oxOdru
         LwDS4PwwGXHj4d0CGn4MqS/aJ222KFCH0EEThAdYYhqxPmoJHV/8XJO0/dROuYjKjqku
         FXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770823888; x=1771428688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DPizJHDpByN85Dw1d6viBsgdf3j/JzTi1whjje/4is=;
        b=vrql1w4W+FM6dO9iexDu0rqjjtNYDjExocM3iHVz7wXcDqtzcQrmzgmMbyf69NGNV2
         2zvZpy2UJBSeYyePzfxyuyxvVwc+LQB8tV4+lYbTfdfK1KewkjpWeUOtZXoHEV+v8aVj
         kQccsg6ChUmoDKXOjl8aCjaAD6LJMcCBYICwOV7Gk5tiuhhlVGeQe+WLu3I+mJLagk92
         0+8kH3RIF2pNVb0xXtaWYDmHZveJy0CC8I9TZ3QSJPjgvyjBxMTblGBzdiMSJeTbwxW5
         wuhLuGW9zw3MvSN+FANM768oqjL56KNiDQkwiQRQ01kj0DJVELAeCDpfzArLT/b6f288
         WDYw==
X-Forwarded-Encrypted: i=1; AJvYcCWcYxGJHD/M3v6o0fdf3BJ5tjBU9mdNTy9VuU2jgjWq2pRVV/bHqBSRP6nbdrKDxYflEz7jBRzehLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHqkmIX2p74OnhboKki55P2a57521y1B16Xq5Wa3Bv+OiOWSQx
	8S+DKLUWm9t0FvSsOZRs9A3TPz2I9FsWY7xI2nZmovf/PB5FX0jdP7EGpLUBDZTzd+rQneHkWIM
	s2II=
X-Gm-Gg: AZuq6aLQ8fLsL1t8DW7AEhbzS/qmBcdsHHsmMEeUf8wTX2aOS23QTl2I8AL0p14NwED
	JzWxMkX0NIQY1nxqmn8Enfza8pB8SnEmSXOeBxnBj9cH6WgHxBw8orAoMlTR2kED3h48nQi/ury
	PTGpfcLS5AEbifNaK9LNAfMHo33XBNX+9Z9Rc8HcSdKjeXjH3ibQ8qrc9SP3t0RqhofkY+lWSgE
	YvnCRjsuEkx7b5z/yv2EtjvA9IkxisjB9Mayh877WuzezccCJROK8aD7KSDh0E070Xw+nm5+N+E
	PhtU3eNZorKNUYOSlWz7xcklpYzvrOgAo58GkJ5cIFRB34yxNxUvKcbqv/7rMlYG8Is3NuBXH1o
	EQAORUZbq1Uu6KTyrHznK3ZadDv4b7QUxCK1JOR3lSK+weet7VpB2p/ROT8KUuT5w7fNERQ/b6o
	9btKQv/MWzyDrcqZpdbWAHFGHz7zHPQoctGvOX7lOOnQ==
X-Received: by 2002:a05:620a:4410:b0:8c5:2e83:d016 with SMTP id af79cd13be357-8cb2808132bmr442556685a.72.1770823888250;
        Wed, 11 Feb 2026 07:31:28 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0f38afsm138914485a.22.2026.02.11.07.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 07:31:27 -0800 (PST)
Date: Wed, 11 Feb 2026 10:31:25 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] USB: usbtmc: Don't accept very long timeouts
Message-ID: <313e86fd-0870-4b6b-b4ee-1ba3eb9d9d0b@rowland.harvard.edu>
References: <237c76a9-fcf5-418b-a3a7-51929af1d69f@rowland.harvard.edu>
 <fa1e3282-0559-4ddc-97ec-be07a41ab27e@suse.com>
 <c6802a96-33d4-453a-b1b6-e74b4911555b@rowland.harvard.edu>
 <79868062-41e5-414b-a0b7-7aa162dbf4d6@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79868062-41e5-414b-a0b7-7aa162dbf4d6@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TAGGED_FROM(0.00)[bounces-33293-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: AD74C125B0B
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 11:28:38AM +0100, Oliver Neukum wrote:
> On 11.02.26 04:25, Alan Stern wrote:
> > How about accepting the value from the user, but limiting the timeout to
> > USBTMC_MAX_TIMEOUT in the usb_bulk_msg() calls without changing the
> > wait_event_interruptible_timeout() calls?
> 
> That would presumably work. Yet I am not happy with it.
> 
> > It probably would help to know something about how this class and driver
> > were meant to work...
> 
> Indeed. But we have to work with what we have.
> 
> This pushes me to take a step back, figuratively speaking, and
> try to look at the situation in general. And I must say that
> at this point, you seem to me to no longer be coding to produce
> the optimal result, but so that you can keep using
> usb_bulk_msg() with regards to TMC.
> 
> The issue exists in general so the first patch in your series
> is necessary in any case, even if it may need improvements,
> but in case of the second patch, I think you should go for
> the full solution. That is, use an URB and wait for it to complete
> in interruptible sleep without usage of a helper.
> We know this will work.

So there are two issues to consider.

First, the change to usbcore.  Rather than giving an error if the 
requested timeout is too large, I suggest decreasing it to 
USB_MAX_UNINTERRUPTIBLE_TIMEOUT and continuing.  Does that seem 
reasonable for the synchronous usbfs ioctls?  (Note that the 
USBDEVFS_SUBMITURB ioctl is not subject to this problem, since it is 
asynchronous.)

Second, what to do for usbtmc.  One approach is to do nothing and rely 
on the change to usbcore.  The simplest alternative seems to be 
something you suggested earlier: Add a usb_bulk_msg_interruptible() API 
to the core and make usbtmc use it instead of usb_bulk_msg().  Of 
course, this also has the potential problem you mentioned: The transfer 
could be interrupted by a random unblocked signal.

Which leads me to ask: Which consideration do you think is more 
important for usbtmc: Having a timeout that is possibly too short, or 
being subject to interruptions by unimportant signals?  I can't think of 
any way to avoid both.

(Actually, I can: Use an interruptible wait, but restart from where it 
left off whenever it is interrupted.  This seems rather ridiculous.  For 
one thing, the user would not be able to cut the call short, which 
defeats the main reason for making something interruptible.  For 
another, it could consume a signal without the user's knowledge.)

My opinion is that if usbtmc would really be worried about limiting 
timeouts to 60 seconds for its usb_bulk_msg() calls then it shouldn't 
have used usb_bulk_msg() in the first place.  That API was never 
intended for any transfer that might delay more than 10 seconds or so.  
For this reason I favor the first approach: Do nothing.

Alan Stern


Return-Path: <linux-usb+bounces-28479-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 492F3B91C7D
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 16:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 333217A6399
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 14:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF31285C9D;
	Mon, 22 Sep 2025 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="m5beQl3I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A532848BE
	for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758552220; cv=none; b=aAGa5cT8Sg4voBia3rOxYUA5KtfzGAHW5YBSmm/s01gW3WOsQd/3A7mlZt6OpYibwa4hCohlEp93EztxArgUPZLZqAhW1vfdnPbw6JkdpHBVeqmJrIhGC45YKI5RTPOaIsFeWTInvAeEon1qHYsh0ZDPijQmNcSyMgxyvLcMD/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758552220; c=relaxed/simple;
	bh=Q3kLQCaIvYYJf6xlRWObzEGiwfONSpiaAH87tcTyL14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0k3UGrTPhVQu1/PKuTLEeigottL498iaYpkak01OMm79jCkXdo0PB/cCrWBWuQaCWqBZIwlf/5Ux7fe6NTQ4eo7PL3vejuwfYM8SDK7mVAnTKzUyOVtaJlIr63cmW1i2Rt1nADFDwHujVq79XzKpbx9eBi3mRRsv6TYfChZKmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=m5beQl3I; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b109c6b9fcso41603431cf.3
        for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 07:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1758552218; x=1759157018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1LLzN3mv0nLxny9W19+UFcnjGMe87oUqmZYuDWStCc0=;
        b=m5beQl3Ihm5+uyITTANGj3joSlX44tV2nqqn962DR3Aaji0c+iA4dtZoWK84eoxOJb
         eXRPt6Y7F2uxkb7F9G6bdlnnMPlkupHpVXd9NFoEeDhdwHxHYKFEHus9TyZ9Vp8KSOmN
         E4/dmd9bkIyc7vKB++vqwHcgSkmqqEVHlx3mpciSHRDFRVEXBvPaV+NLgt+SEHx1Cwxs
         4fNDOWu7XgmJiH5BSUdtKZ3guLLB1ATkqLPbaEHfTJldxNs+HOslrcxXGlx2MFPq6FY7
         MlE8xCKbxNfqep0cS/mS/CgMlW1Lmv+SNIQmUGJs20Yn3l1Pj88K/66unPYm0c3ouFcZ
         hlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758552218; x=1759157018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LLzN3mv0nLxny9W19+UFcnjGMe87oUqmZYuDWStCc0=;
        b=J/eGueZ+h8l1GPO1U02ZzLcuhR1WiENe8ez+Fb3BeStGB7t5mepfXaktaKOycGAA+1
         wS040HDGIiU1Uxh5Ai1aIZ06dTJBoXKVeXapIjtPtsDnmxOvcT5tdgschxO/ET/jlSil
         iGntGMhtwKiZehqFkzrZkeapqd9Ut0crypPWQyVjI721p94oAKBZU+2yfSaw7dQi3TyA
         57LWOCRryhKYf+TSKePZ0IN0OxiLU15rkf3OoROlkKPiBINiKk1+c6/YKiHdzH58KoEI
         D2AaEJ+JxpRLhfqLBqOZrIzwD8OwT/Y92qXPQDSyvQPHtNPIaU1giq5ATQO5r8y6JXYn
         ommg==
X-Forwarded-Encrypted: i=1; AJvYcCX7C99zrIYRzQYb+6xYC11PQPltzxLsT6XqtPY3V8L8YCXz0CdLL51yG2aTNUt/WKBkREqBTIuger8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMx7nFpcws+MHXnAnM3lX0Vu1cdBjdSP/Q1BcQ5QMzhGfQXyT+
	aBvQX3F2+EJ2Y2y+EcPnZXq4OZkMJdTP48SvCcZrBkAcjEiJ7enqFT02wwGozCD9PA==
X-Gm-Gg: ASbGncul4ADL0/A5mQ7sEqmOTE2gYx33c2ifA2myOXPkmq2m4Mqn8xOpZieMuord1be
	YnRN/kRUe4vKcEHSlS23WX9H9e8q6HqHBJvAZ6l1jfwK0dBpO5CC+ydCPeeoKJhdIPfcbKrkHSp
	cjU02snGk0Qex5a4AuJFAaGNhS5fLENmIQZFh97emOGjDWCjU1CtQOgrRU1n9BtKPM0n1zYNC9D
	ZgQgCBTgnOdF1DMhInjIYXlxaauqIocSqDhmvsmKkE7A7Ew+BPwuFYW62sPZo0OtUyZrQxnZ/oe
	SFY32sRvEdU3SWWLOUQ1L2hOnub89N0p/ZXqwFTeSFhA4piceGNI+on6jscaAbrf7F5FTXsBD/x
	ublbxsd5k8s1HCDPaBlu1ljFgh2EpIjnkjXPE8DPlZg==
X-Google-Smtp-Source: AGHT+IGE/Trvm5RZ9qbPb7Yo+zgZCsaCT3TVjKLS4xacZcoolZLczcqITHzNMHzg8+/2KKPItGykLA==
X-Received: by 2002:a05:622a:8b:b0:4b7:a6e7:655 with SMTP id d75a77b69052e-4c0720ad9e8mr164298691cf.52.1758552217610;
        Mon, 22 Sep 2025 07:43:37 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bdaa89796csm71321101cf.52.2025.09.22.07.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 07:43:37 -0700 (PDT)
Date: Mon, 22 Sep 2025 10:43:34 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: ValdikSS <iam@valdikss.org.ru>
Cc: Greg KH <greg@kroah.com>, linux-usb@vger.kernel.org
Subject: Re: USB 1.1 Full Speed OHCI slow/high latency
Message-ID: <78c2bf8d-e67f-4520-a7fb-7a9f3db159d6@rowland.harvard.edu>
References: <d41d8488-9438-430a-88ab-f845df3655e1@rowland.harvard.edu>
 <2bf5c54e-7dac-4673-a696-e09eb8d459d5@valdikss.org.ru>
 <7bfaeea9-6eb1-4e49-af8a-77940fdb70fc@rowland.harvard.edu>
 <e5d73b85-9c7f-4c74-9a00-700b4b6e7d70@valdikss.org.ru>
 <da6326e4-9b47-4347-a044-879b4be58560@rowland.harvard.edu>
 <9013fce0-6764-49b1-9e54-68e915e12d7c@valdikss.org.ru>
 <4e83d098-19e8-45aa-94e7-9ef005a0c8ab@rowland.harvard.edu>
 <6214afad-51c5-46ee-90bc-8625312609a7@valdikss.org.ru>
 <d689fcb8-20c7-4a81-a466-7492eaa23567@rowland.harvard.edu>
 <c8e00367-35c8-49df-9fef-a93cdcde354a@valdikss.org.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8e00367-35c8-49df-9fef-a93cdcde354a@valdikss.org.ru>

On Mon, Sep 22, 2025 at 05:38:38PM +0300, ValdikSS wrote:
> On 22.09.2025 5:16 PM, Alan Stern wrote:
> > On Mon, Sep 22, 2025 at 02:11:43AM +0300, ValdikSS wrote:
> > > Alan, Greg, I found the reason for 1 ms delay: it is artificial, added in
> > > v2.5.21 as a possible race condition fix:
> > 
> > Good work tracking that down!
> > 
> > > I removed "+ 1" and it removed that 1ms delay. Doesn't seem to break
> > > anything in my setup. UHCI code doesn't seem to have any similar delays.
> > > 
> > > Could it be relevant only for hardware of its era? If I add "no +1" code
> > > quirk as a module option, disabled by default, does it sounds sane to you?
> > 
> > I'm not sure that there is any OHCI hardware from later than that era.
> > But regardless...
> > 
> > Module options are frowned upon these days.  Instead you could add a
> > sysfs (or even debugfs) attribute file for controlling that "+ 1".
> 
> I just implemented another approach: do not unlink the ED right away,
> instead mark it IDLE and unlink only if no consecutive transfers are
> performed after the timeout. This still preserves one-frame delay while
> unlinking, should be safe.

That does indeed sound like a better approach.

> Please take a look if you have free time.

Feel free to post your patch on the mailing list for review.

>  I'm no kernel developer by any
> means :)

Seems like you're becoming one, like it or not!  Welcome to the 
community.

Alan Stern


Return-Path: <linux-usb+bounces-33673-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NN/EVTxnWkWSwQAu9opvQ
	(envelope-from <linux-usb+bounces-33673-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 19:43:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DA14018B87B
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 19:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27A55300824E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 18:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243FF3AA1A4;
	Tue, 24 Feb 2026 18:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZFpalA3M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8472326ED3D
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 18:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771958609; cv=none; b=LfVor+RGAguxiUrD2e4sW0OLV5HzGdi47S/zhu/z3IA/oGNDbFjpreu04tQNl16nJH/qZcFSErlGg3xp9NQjWcaeE3HMIXVdE4MAgVkBSBnjw1L934Jk3QaPjQuE+HlhDJy8qaOGu+SLusqqEIIM0lZ/qzLb+9iSzNMnPlw8A6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771958609; c=relaxed/simple;
	bh=YifzaPPcgSwFXTqCHy7OI9Rxd0VFydbArEP/w9HnikI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0KTVkrEtJAhYA2MsAlZbCii1nOrk61NcclL95W7hiR/G2fjFj7CUcadIvAXUQ/gFUlOIXzt8JfCDfkuYID9FEtB4hLeRhR3vLRIw5PURpZw2YyKFq7WC2MQZaRP1LsJphiULHxWtI1tBKDRGbb2Ga5eXwCnCMtdbpQenGmW18c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZFpalA3M; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8c711959442so9088685a.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 10:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1771958607; x=1772563407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jIhXP+Jl8Fq58lhRkL0hrTZvKs4fP1u9Q/pOSkHexQ4=;
        b=ZFpalA3MRop7dEAr2+k0RZwKV94LcVYLJmC/tZJpG6r/CFlMXAS3KujqS9EjGZYc9H
         qBhuTnIh2MThhyRCSUTBFm9JQyB74mLNLuOLu6jEEtmDjbdcdbkwOf6O+CICHl4hTK1L
         QbJDawn/QaRRmA4DY/VgnjzUOOJB4fn0pZmuIwFSUh7TDwcguzw9zrs9z7ZA/aOAdIdV
         QBwoM3lwxyOBCccSfBkG+ApKvln1VldpjKjkf7BPGqsSVp6T+sHWtaAjuVX50u9KMmeC
         mV3HYMy76mX8C5R+GoJEDLycZekPbmu99B68D27p0REpgsMOigbpb/t0hAgCR+w314qb
         B2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771958607; x=1772563407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIhXP+Jl8Fq58lhRkL0hrTZvKs4fP1u9Q/pOSkHexQ4=;
        b=WkcM3CJM+aJ/jb6Opy97960Q4Rcg+ekv0JO01zFty9ophe9S8jkCCNSfOMRn4GwRhC
         kFe8IFGePSCaQAeniVgukcjP5YuGE7BVkdxdgNmCaHwKy4SmnRa1AS4q6eYMYKuPk8XR
         iijo60Dvzoye1XdGNPpkmzLmqb6o+d7sgQk2Ggdf2Lqa51NNR1pSQegJbPmD2hJNf0zt
         9tFm2dGbQlB9UCdNzBCUta95VEy+grdGo1ay/elD7XdFJ/8OtO0kzESRqkU6D7hJjwJi
         9ZBCk9e2oN8mMAIWY09pUBUWvPMRuDtcdJTPL/Q4/mAkeQheTQVjLFVd61EIigoKZfYU
         IjRw==
X-Forwarded-Encrypted: i=1; AJvYcCVaAkVXhctNg8TEriDZJ3mWAy7XQrxr+ZrwqQaMGDQtu5MipYtFgrGRyrY6894OYolOkWF+BzQ8fR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHIwToFHqxwU/dgA+Q9OZn3cgmBwDYj0UII9Df/XR5xfC5DnER
	6xCi7N9Yc5RuJ4rhMUmFLEOXWXpxJdM7ZIM0WbMmXFKKKc7deQcDq1AB9VCXxSx84C932LvwTqV
	0J7U=
X-Gm-Gg: AZuq6aLqgMP870eJTQHPGp30/L09KVflnf/ipV8kquv9xCNv9W8dXd2fRt6E9MCevgA
	FdE8SwgrfA2EJQ53Hb7xnLDzv05dMft/N/Uw7NwDFRqTPnX2SMUSho9qnnxZqeZxZfoRypH4rB8
	ZQeMD7ecDk51xH+jQaqG7sS/+GP/+FqqskufSsQ17HgVzI5kwnpqvlHdRlmpjiXeHg/1avULF6x
	cMdwsOAljctKLnCWUlx7OTzaf3v22kW8biOYX66CAJ9Z7tbuVDKzq3bMpdYYqzP0wp6MqtVeu3S
	Wc3VlB0EiO4ccOdzMAkXD16utyTwX+5wF7AK91Fd9Ii80pLvuWsEsR+0yisgdgWsSlvw1viWgFy
	aXiKe/d1Lwey7sYw5hDHiZwuDkLHkhy2Gj1nsOM5EY9Ev+jta5D05lDa0oYWBWpd1yYWqZQjHnR
	6EI9MySDEm8EotbIASqTaL537M
X-Received: by 2002:a05:620a:4049:b0:8c7:87a6:b25f with SMTP id af79cd13be357-8cbb200b1dcmr145525285a.10.1771958607335;
        Tue, 24 Feb 2026 10:43:27 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d101d77sm1045370185a.37.2026.02.24.10.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:43:26 -0800 (PST)
Date: Tue, 24 Feb 2026 13:43:24 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Nicholas Carlini <npc@anthropic.com>, linux-usb@vger.kernel.org
Subject: Re: Stack buffer overflow (write) in kvaser_usb_leaf_wait_cmd via
 malicious USB
Message-ID: <862abc70-18ce-422c-bdf2-f02b984193c0@rowland.harvard.edu>
References: <CAOt5ifARcQqqGc65hHXR2JNTDg0hT0cF55Kb-6USEsqjEPM1nA@mail.gmail.com>
 <2026021847-acclaim-coil-fe7a@gregkh>
 <a38ccefc-6233-4be4-bbae-0ae0d4f4499b@suse.com>
 <eb96e0e4-b02a-48e5-ae07-bc31584f0855@rowland.harvard.edu>
 <e63ee746-dee7-4b3c-9360-95e96fadb765@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e63ee746-dee7-4b3c-9360-95e96fadb765@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33673-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rowland.harvard.edu:mid,rowland.harvard.edu:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DA14018B87B
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 05:04:28PM +0100, Oliver Neukum wrote:
> 
> 
> On 24.02.26 16:52, Alan Stern wrote:
> > On Tue, Feb 24, 2026 at 09:44:35AM +0100, Oliver Neukum wrote:
> 
> > > What is the logic behind that? If we can trust that a device
> > > is what it claims to be and operates like it is supposed to
> > > be, why do we verify?
> > 
> > Greg said that we trust the hardware once a driver is bound to the
> > device.  However, the endpoint-verification tests occur before the
> > binding is complete.  At this point we do not yet fully trust the
> > hardware.
> 
> Why? If we do not trust the hardware, we cannot depend on it
> telling the truth about itself, can we?

The purpose of the endpoint testing is to avoid warnings triggered by 
driver submitting URBs to endpoints that are known not to exist.  Such 
submissions are generally considered to be signs of a bug in the driver, 
not of a deception by the device.

Legitimate example: A new revision of a device uses different endpoint 
numbers from the original version, but the driver isn't aware of this 
and doesn't check.  The problem would then lie in the driver, not in the 
revised device firmware.

Even if a device lies about itself, the tests will prevent these 
warnings from triggering.  (The endpoint in question might not in fact 
exist on the device, but as long as the device's descriptors claim that 
the endpoint does exist, usbcore won't know any better and so won't 
issue a warning.)

Of course we can't detect all cases in which a device lies about itself.  
The hope is that drivers will be robust enough to handle devices that do 
not behave as expected...

> > While it's always possible that some real device somewhere will fail
> > these tests, a much more likely reason for a failure is because the
> > driver is being fuzzed.  We do know that these fuzzing tests occur in
> > real life and that they will crash the kernel being tested if the tests
> > aren't present.
> 
> Now, if we are looking at regular hardware, we need to ask ourselves:
> Is it likelier that some devices are different from all others,
> or may they have a race condition with a small window that leads
> to faulty data packages rarely being generated?

... such as by occasionally generating faulty data packets.  Drivers 
should be able to handle such things gracefully, without crashing the 
kernel.

Alan Stern


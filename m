Return-Path: <linux-usb+bounces-26207-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CD5B1288A
	for <lists+linux-usb@lfdr.de>; Sat, 26 Jul 2025 04:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E42B1C26C3D
	for <lists+linux-usb@lfdr.de>; Sat, 26 Jul 2025 02:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649541D90AD;
	Sat, 26 Jul 2025 02:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="JAl16UCB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B404A11
	for <linux-usb@vger.kernel.org>; Sat, 26 Jul 2025 02:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753495816; cv=none; b=pvQjlAQKV3DVQPlzMRIp5FEmlWD6EVGj6UvrIUtEmp+LzREXmS+HdtM13UZrX9/7gmj0B64F9awkKxhF/MkA4HyWsoch0tGvX85fUZPvIcVTOUnucEgADKlZUG7Ds0SJ2U6c95UFcbiATsOSrozWbe2uIItbVdjr0ai07nRea3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753495816; c=relaxed/simple;
	bh=PULKyoQPfoJBUREloodC53J6LvdB2Nf9AZX03v3VUNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uohBEhl8GSDnsrCk34F7OoP4kj5JEAa8g/zh+UZgUlDS2COCnzsK11vsnI6EqhEJUANBcmPksCj92/LsFrzS54bQ0N+Gd7mdrazI/VkGxPeO1n+gNL4ibtSCbBTfB1zsTyy7u2VCnP2wKOCemeawMu7mNjWl1+KuvAYWVqczsOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=JAl16UCB; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6fb1be9ba89so18843706d6.2
        for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 19:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1753495814; x=1754100614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qQ7SXOragRTIX4LIzQZOTZXKs9RiWGmIsBpnIAlkZMg=;
        b=JAl16UCBWi8OLPPf4pIRVwZigMoaiuk9N1jlQj49CCriK6Cnjk6LfLCypQq3se6/ES
         Qw05f7fRlIr0DVEyr28WPtbUF1C7PiWnYEJCLbspVY+v0T4AVg1n6/sGCl4+I2aeLmMJ
         gm9GYP50kVcq0ss89lNFlsQHGWE8QrXKKWAX5niu2zV0eiyIDGuZPnAyqcYyIRED/Nbx
         hw7jQVPoL0cXUhISqW9GdzRThYQvXOBCDsc5xVOABSuzegSTdVaCBnZSDFQUmT+RcfF0
         nn48b/ASYLEQvT6SJfV1awxPPyNTbIgv8nuk3lK1mI1uL5au+xluF6nscthAos6g7oWB
         4qCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753495814; x=1754100614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQ7SXOragRTIX4LIzQZOTZXKs9RiWGmIsBpnIAlkZMg=;
        b=Wb1sOmaBeDEELEzr8LEvb3sAua988fjPcgN0ru9Ncm6q3OGypWbbEEo+oIiXzOUPI8
         96jUKP4+GP2qBse6zzRBBA2cNIRVF9BgSU5TGcSrRXa9u61oXW/n1UpJOTBjFBDhF/pI
         T8hp8kL1oLnlpP3nM2lgEy0xZfuWmNKxLsWNN2STBrhT+ZnvbLYT3rUbNR/bapMeK6rh
         kJdBuET0hvmtKP6XT64Gb8ssjdVgzKm/qQ7TzNksNTj9mDMQMWf/yWKnlFQz65rogI7e
         mUEafbNpDTmq6ssABb7Xw5k/rlXsGWd3gXuc9an/qxTPfAIkGqbKtasTwMOdpnoto9D0
         JHcg==
X-Forwarded-Encrypted: i=1; AJvYcCVga5ILIcClfXQ9kfyM7hoAwZbWB/3LFwXWtA4yyFbu/DWMl6l8JBytBQ90qdQig8n4V0uYKh7UYSY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzccd+tbfXZZZc3hDjJVSXzruEahTEh22bS3Rf3vMFblmi80wMz
	XKDOdesKRIUMaOBiBOONZuMYMCNTx3Ls8eEzLmEa4DcU6cMb8/OnHhY++2raPqzrzPKWCTpvZdi
	Y0ns=
X-Gm-Gg: ASbGncsHKZhv5Q6BdS8ZrviG30+T15kkuXXW8gE3cTVw1A1A4aXdqpYGmZs3PbUBilx
	4wPPoq/vMN8POnVSIlr/9UVQX5C6x/OMQrTZnvqRHkelPvm32lX5roh5KxQvOT1uHvit9mkSVMy
	gd6V9XaRLDFip2iSHqFJ7iOOP4HzFrII23DPDAO2job4m1g07UghpURwmgENFqWW/nmEAqP9oaN
	GigU+LCtwgsRqz4HHX+31QHHqJb/+H0aKtwWd1s7QRXzwgLR/S6OBpT834F1nMOs6f0M6hMp8qO
	qzbT+REe1g/4/X7u2wQu+Fum9JrTh/lLIxQyMLfNV4JQkrrYdaaUb//JKUwJovRWDfXHNJfOblq
	6mfQcS6sfJRVwhat2yMjP0xc=
X-Google-Smtp-Source: AGHT+IGzVgC7zSPm77RvN7HmL7AuYbfj2Q2hSHE5FaAmz4RBfNyLkVHyW8mGDSfY2XCDjy3dmKWnzw==
X-Received: by 2002:a05:6214:1942:b0:707:2b04:b04c with SMTP id 6a1803df08f44-7072b04b19dmr24997336d6.30.1753495814078;
        Fri, 25 Jul 2025 19:10:14 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::317e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70729a63136sm6683706d6.24.2025.07.25.19.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 19:10:13 -0700 (PDT)
Date: Fri, 25 Jul 2025 22:10:11 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Olivier Tuchon <tcn@google.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: Add gadgetmon traffic monitor
Message-ID: <1e4a2aca-cde2-45ea-aebd-408fe9bf9672@rowland.harvard.edu>
References: <CALU+5Va_zeqS5YK7v3HNvDKkg8srqc87P5ZaQUK5tGFUMyNrkg@mail.gmail.com>
 <42f4753a-f7db-49a3-ba40-8743a78684b4@rowland.harvard.edu>
 <CALU+5VYnZfp2CqXqn7X14J5pGsXyHDOcC5mOCZx4nKA6tjzO2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALU+5VYnZfp2CqXqn7X14J5pGsXyHDOcC5mOCZx4nKA6tjzO2Q@mail.gmail.com>

On Fri, Jul 25, 2025 at 10:45:29PM +0200, Olivier Tuchon wrote:
> > There should be a similar optimization for IN givebacks.  The data to
> > be transferred to the host was already recorded by the submission
> > hook, so you can save space by not copying it a second time during the
> > giveback.
> 
> After a couple of tests, I found that the payload at the Submit ('S') stage
> is often meaningless (zero-filled) for both IN and OUT transfers or the
> payload size is already set to zero.

That doesn't sound right at all.  Maybe your tests only covered 
situations where no data was being sent?  Certainly the response to a 
Get-Device-Descriptor or Get-Config-Descriptor IN request would not have 
a meaningless, zero-filled, or zero-length payload.

> I simplified the logic to drop the payload for ALL Submit events.
> Fixed in the next patch.

usbmon takes the opposite approach, omitting the payload for OUT 
transfers during the giveback event rather than the submit event, and so 
that's what I'm used to.  But I suppose you could reasonably do it 
either way.

Also, Greg will no doubt complain about some problems with the v2 patch 
email.  The most notable one was that formatting was messed up again 
(tab characters replaced by a single space) -- you should try mailing 
the patch to yourself first and then verifying that you can apply it as 
received.  In addition, it wasn't really a v2 patch because it applies 
on top of the original patch, not as a replacement for the original.

Alan Stern


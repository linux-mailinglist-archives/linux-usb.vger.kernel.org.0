Return-Path: <linux-usb+bounces-29541-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1EBBFDE48
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 20:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CE763A9386
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 18:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5590B34CFB9;
	Wed, 22 Oct 2025 18:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ucg8IIe+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44C134DCCE
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 18:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761158368; cv=none; b=S2gx2mLaqnYGrEzIz+8RtmfWG7La5cAmYLb7113cmdceaa8O4XBUPPXOVC3LX/RT85BTlQIuimf0bBZo3zlqnA7MavYQ0JicCjGbElSi+Zu/CinZK/auhe3I7HdDuxVXaRDzXkPMvn+EDT+4oFgnQ/rJllipU1z3uKJ7XbxkeRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761158368; c=relaxed/simple;
	bh=rlvhE0G/yCujJuBtuUT8uW1GIkDrwZQS9eo16LcqzbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgGUxLm+KHED/WVnYXM2MaA+Ci3PIeWsyocHqP7gNqcYOln8aJB6NCbFoTvPFgRhR+B/bACyWJSPcOx3BcMXCUpOLyVE5iK9AQg+G7zrRPHOe8DJUb+0/XUGoQDAPkUNL6SGjz5HiCf3bDcittvMzWad0kJLs+TgAJpLXZU3ieY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ucg8IIe+; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-87c148fb575so104031226d6.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 11:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1761158366; x=1761763166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cL4wCTebb1o0Zx29ivDAX7cV6bT/OTiDz6JMc1ObXZQ=;
        b=ucg8IIe+CwhhYMB78CTdE5qak46cFw68KY38hztpao5SXPFXnvFJKDsTECtqreYTjf
         roc3JQ45y/k62XsoN7LZ3oDDbE+z5E68nPC271ELl3160azWh/H2IvO3oqm/GGYU0D6f
         Lar3aMjphNzFDdO1lLgiHphGcZStBGhyNG5+ijbCg2z0llMlH9aI842rBqWiA4anVREV
         TjczZ4m9jJ4JOy8uIg2kNtVdWE++FXzAInSxygnL/9esPpDn1H4EKhNEt1tFP4T3gItP
         v6Jnuig00XN/Hq0AcSus85Q7llyEaaP49x1C9b+o0M40ZDHoZdvuFZY7SqEOpvIdOkwg
         CHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761158366; x=1761763166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cL4wCTebb1o0Zx29ivDAX7cV6bT/OTiDz6JMc1ObXZQ=;
        b=B5HEil+FrsDFLCFmmHhF+lBduKFlyPuZ0VPRKjo5sW7YPF+1vTUuyP0OXFKxu7E9b5
         z3SMChcom7pkMSSt0i/B8Yq78K7nQYI6euXwdO2KakojvCtJKSNxGjRsdOQfRl/qla0n
         ZCrA7BkPDHuT4sisQnWPIABb5I9BKR2HXnCOXuXnb0iXYiW1+3WTFndqu3QfaYQZ8BqI
         gjXQ3FsscyNKvGreM7fX299TgSsEQKrIANS4q+sOzFf7/jKEDnrgdDRAEleOAxoACejR
         KZBlNsmSI1AkE61NzQXzhaOu9YgWbG23kM66vrCn/lw79uuHEhmpm+8+lFXbsNYyVVnO
         a+JQ==
X-Gm-Message-State: AOJu0YykvSuV0HCKh/3/m6eiUfRi8lSbQUq71qetEmWsRlA7/lDdpGcU
	3twHXImtBbjcdphiKXDTMpXrSVpuQUBdg27lIIsPjmNQQvJbctgqHRDPV9Zy+Y006Q==
X-Gm-Gg: ASbGncvtz2Gfml9mIduNpgTDPkLRq8VEX1RzS/VW7U4AqSRiuGSua6Y037896kdjrpq
	vGKXaL4CF6fNa7gdKGMU6HCoXIpToe986/SEer42B8nTQzkZNOzC37YEVV/Pu53BpONLVx0Wqi5
	HOTxww3ULQN8kXh8NGIOduZne85q7noDq5cSpdF1siKTxTt2dIyNaM0BFKwi1zpaC6yF0u/XaaJ
	sxiyuMuUVvHNYRCW/NSzH31vV3TkAngr6OLaASQ2/RpbXtjg1w5LjSOHTa9cNajFvZ6qLY5PMIf
	y1QT9ub99BKArh1BfA2eb4qx6Kc42RBPz2i19lqUzosbHu1yt6K5nGTih74uGQZB41UqxCcoCxB
	mWCl5fJp4nGWz5Z/sAN1rhf1Y1ag3fzUlPPT8/WlASht9TJ97SOi+4oc7t1JuENtdFzzyz/4dZO
	SupdfItK0LPyZWnqQdYzVs+5JqBejKP7X6sg3scf4Wilf1De26KJV/IEu95IFyhW728oimSA==
X-Google-Smtp-Source: AGHT+IHwWgDe2mIBWIuxgBpQx5fFTzrSlUNpyKSP0XLyZOQ4JZpK/ntBicAuPi/u54h0CYCGs7Pp2A==
X-Received: by 2002:a05:6214:f63:b0:81d:8926:a9d8 with SMTP id 6a1803df08f44-87c205ed12cmr286794606d6.36.1761158365700;
        Wed, 22 Oct 2025 11:39:25 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-19.harvard-secure.wrls.harvard.edu. [65.112.8.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87f9de7beafsm39036d6.14.2025.10.22.11.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 11:39:25 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:39:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Julian Sikorski <belegdol@gmail.com>
Cc: USB list <linux-usb@vger.kernel.org>
Subject: Re: USB A 3.0 port on Asus Zenbook not recognising the TipToi pen
Message-ID: <f251379a-38ad-4b58-af88-34c8bae07f78@rowland.harvard.edu>
References: <1393a6c5-3430-49cb-95e6-b18c0f5328b0@gmail.com>
 <cfc6d2ba-a820-4bd3-990e-7800bce171e2@rowland.harvard.edu>
 <967e7681-c9ff-4421-ba89-d83bb40f1af3@gmail.com>
 <4c6bbcd1-0ed2-496d-82c4-3fc9a1c2660e@rowland.harvard.edu>
 <1a960051-b1e8-49a5-bdea-1ddd719cd0ec@gmail.com>
 <38586fb0-a60b-44c6-a04c-70f19ec36c61@rowland.harvard.edu>
 <efa1bc45-9782-455a-8ff4-26e081a5e5cb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efa1bc45-9782-455a-8ff4-26e081a5e5cb@gmail.com>

On Wed, Oct 22, 2025 at 06:35:00PM +0200, Julian Sikorski wrote:
> Am 22.10.25 um 15:59 schrieb Alan Stern:
> > If you still think it's a software issue rather than hardware, you can
> > try posting a usbmon trace showing what happens when the device is
> > plugged in.  I suspect it won't reveal much, but you never know.
> > 
> > Alan Stern
> 
> Here is the usbmon output:
> 
> 420a8780 0.869369 S Ci:3:001:0 s a3 00 0000 0001 0004 4 <
> 420a8780 0.869393 C Ci:3:001:0 0 4 =
>     00010000
> 420a8780 0.869404 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
> 420a8780 0.869411 C Ci:3:001:0 0 4 =
>     01010100
> 420a8780 0.869418 S Co:3:001:0 s 23 01 0010 0002 0000 0
> 420a8780 0.869425 C Co:3:001:0 0 0
> 420a8780 0.869431 S Ci:3:001:0 s a3 00 0000 0003 0004 4 <
> 420a8780 0.869437 C Ci:3:001:0 0 4 =
>     00010000
> 420a8780 0.869442 S Ci:3:001:0 s a3 00 0000 0004 0004 4 <
> 420a8780 0.869448 C Ci:3:001:0 0 4 =
>     00010000
> 412663c0 0.975195 S Ii:3:001:1 -:2048 4 <
> 420a8780 0.975231 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
> 420a8780 0.975247 C Ci:3:001:0 0 4 =
>     01010000

Okay, that part is just the initial detection that something was plugged 
into the laptop's port.

> 420a8780 0.975373 S Co:3:001:0 s 23 03 0004 0002 0000 0
> 420a8780 0.975395 C Co:3:001:0 0 0
> 420a8780 1.037181 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
> 420a8780 1.037200 C Ci:3:001:0 0 4 =
>     01011100

That's the key value; it's the USB port's status.  The 1 bits
indicate: connected, powered, reset finished, and connect status
change (meaning there was a connection and/or disconnection since the
last time the port's status was read).

> 420a8780 1.037210 S Co:3:001:0 s 23 01 0010 0002 0000 0
> 420a8780 1.037218 C Co:3:001:0 0 0
> 420a8780 1.037222 S Co:3:001:0 s 23 03 0004 0002 0000 0
> 420a8780 1.037229 C Co:3:001:0 0 0
> 412663c0 1.190218 C Ii:3:001:1 0:2048 1 =
>     04
> 412663c0 1.190231 S Ii:3:001:1 -:2048 4 <
> 420a8780 1.238195 S Ci:3:001:0 s a3 00 0000 0002 0004 4 <
> 420a8780 1.238216 C Ci:3:001:0 0 4 =
>     01011100
> 420a8780 1.238227 S Co:3:001:0 s 23 01 0010 0002 0000 0
> 420a8780 1.238233 C Co:3:001:0 0 0

This part repeats over and over.  It shows the port being reset,
during which the device disconnects and reconnects, every single time.
It's those disconnections which cause the initialization procedure to
fail.  Normally a device remains connected during the entire reset,
and when the reset finishes, the port gets enabled so the computer can
communicate with the device.  That didn't happen here.

There's no way to know from this what causes those disconnections to
occur, but it looks like something is wrong at the hardware level.

Alan


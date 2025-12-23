Return-Path: <linux-usb+bounces-31716-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1724CDA640
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 20:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C203304075B
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 19:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9715234B438;
	Tue, 23 Dec 2025 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TN8dE+kP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7651F322B96
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 19:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766519048; cv=none; b=PZ6p0xeNxQtrPmiD+Bhu/dMgWtjJKmVJoFpOUUvww9ggnDnLMBctp64vjN/1pqBt8Fpk6TPSbE+NiUlpDVaBQuJ3JXErdVMMZlR/EkvgHHhT6yX8BPBHRWk9jVdUnZjttz+YUW1+WpVniWMKxfFBnDKoFx8SovU9xLiJMQNGGDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766519048; c=relaxed/simple;
	bh=bhPkIxjr5QonV1NiJwCZCMmc5Hdd6ExIKm7f35w1bTw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F+hF8uh33hx2rV9mdPVwSJoiMFB7r3Nv+DquVwzDsVT0RL6JtqBarmCl3FCfAIIFq0lC5DNK8PInZogXVi//hjRneyxsWrMgJN/BBbW2sLvpTmiP/mLlsC13bRmZBaNEc+g7iA4NPwssdGVKh6fRMgg3Shynph0p/+L+kpJh3t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TN8dE+kP; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64b7b737eddso6260225a12.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 11:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766519044; x=1767123844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVXjC/5Kqtd7TCP13ncle8giJLPf231wN+xT/bbGPW8=;
        b=TN8dE+kPGVi0rrH6oS7YBqQJP1GU+nYv78mEIC0RJLG4eR+evvY8Zn2cQS1ssZHAAi
         BAcbG+K72p/noWnJdx+TbtfK/c1ZTTt6tT0WyN06TX5z3jfSLbQLUALzUFo1QQDxLHUJ
         17t8p3DMnjv7j5X9hIrHMIofYr/xDhhPvjB4y8gUbIQC0Vro58k1XzK4hiFYy6EKdEBw
         3w/hyZprJSAAnIYP2VTta7iwFlU89m0JQDCYwJAtlkCcA2tSP6Diwd5Wvf1ZlWDESD8j
         OTk3yzyIgnmqciC2Fr208215J03/lL7FmSPOFAjFoilTFeDCGJmN2tEz8N1xa83jYR1A
         0EnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766519044; x=1767123844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yVXjC/5Kqtd7TCP13ncle8giJLPf231wN+xT/bbGPW8=;
        b=nIGsbn10kv2ySEqR0U0sI9qUBRyN/oZs3QYjDFuJr34aZ68zcJOuUKCQ3OxoE6oR6n
         3QaTmUKO78UsxK68W+4Z5UmMgSvprNI/0P10i5hEAI4BNZv0iX3SwPLJmnzOR2+HL/zz
         5trqp4Nzp0SKg2H+eEg4GyM0Y59ge7pyrj5GkvCjw3MAlumXpgln3pdUW/jPMQVoZwCq
         CVQYWpWEq3ORIhEQwWlXGrFb0yC+/8fXqXg+UUu8+E/y6CSkcrvTPYPgQthwqiroRbXZ
         rUF6MHokZ4313soMCOdhiXEaX707eJRPbGfj0y9Mzyd6+kkI/rXOzYNrS6S9pP1BnGyW
         +thA==
X-Forwarded-Encrypted: i=1; AJvYcCVTfjk4Pk1PBj+iNf+wdgTwkn1oS0QTZ02j5a6mTp5qeK7JzyURyYJrmV9LS0tgR5tdB90BiQHBUso=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2jf8cBMZbvwwT1axSTjPzmFMve6lTTUBP9IbqbOf8L5OCRm3R
	GZl7Rnd4etvIHnqalTRBSYr7kjCkXnLdLrXxz52SLq+nmUY5LJh9CsAl
X-Gm-Gg: AY/fxX5LnfSetUkAegfF8aulFjvRTKMgZhJs5XFh7B3T4ouxTXonGf2RJ0aA9BvT8CU
	DDKtEelEirFLhy99JVMVQ9To18JUK4L5FGN1gcX+53hcsrgnrDjm9WvzIx1eHg/7cW7b1wRP4uA
	InRnFnALw6uqUCeJm30fRtcyFhPZhbFCCS3HVRDHa8kqZqf4sMT0IrTqBNTbsX4v5aYMOxBvT9h
	FLwRxvFDNBMe/wSkXcCQGq+y78F1oqDiZI+rJrwS+RNsawTbhKgbex/a3ytRDxxS2KTW/1CDjxG
	DY/mDKAAvfMD8vDloXBOZgs5fZbZYgrI6S3GAraaeTvHJiKk9Pb5b9/WGH6tvgmp27N2pVZzUIk
	zhB5SXeBHF9sUH6hX8jrt8MSY1ggy9Ndj2xaRPOC8PLQ7Jy24QSFTHh66AaEV0aepOhsxKoowH2
	ldMBXQwP1Xbcjh24JJky5pTWE=
X-Google-Smtp-Source: AGHT+IE4Ng6o8iSNIIbTrXTbC/qQWl68toPKF+Lw078aOBmUlm/XlL1hQP7yVmKyAVtbql9pFKCdnQ==
X-Received: by 2002:a05:6402:1461:b0:64c:9e19:9831 with SMTP id 4fb4d7f45d1cf-64c9e199bd0mr12729240a12.12.1766519043454;
        Tue, 23 Dec 2025 11:44:03 -0800 (PST)
Received: from foxbook (bfd193.neoplus.adsl.tpnet.pl. [83.28.41.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6d0sm14608822a12.28.2025.12.23.11.44.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 23 Dec 2025 11:44:03 -0800 (PST)
Date: Tue, 23 Dec 2025 20:43:59 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: check Null pointer in segment alloc
Message-ID: <20251223204359.49141a2b.michal.pecio@gmail.com>
In-Reply-To: <ce74e3b4-ec01-4d99-9080-41dc15a13977@rowland.harvard.edu>
References: <20251222064252.GA1196800@google.com>
	<2025122253-stopper-tweed-6e68@gregkh>
	<20251222085543.4d7430d5.michal.pecio@gmail.com>
	<TYUPR06MB6217CB438F21763401A93E6ED2B4A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<eb5715b5-613a-4610-9852-1a6ae67b4153@rowland.harvard.edu>
	<20251222174934.4c9b62d2.michal.pecio@gmail.com>
	<38822950-6d69-4ad6-be28-fb8f328c8ae5@rowland.harvard.edu>
	<20251222220349.2d6c1a43.michal.pecio@gmail.com>
	<e2ec66ae-2516-4030-8bb2-51ed5c8918db@rowland.harvard.edu>
	<20251223110621.2b53f63d.michal.pecio@gmail.com>
	<ce74e3b4-ec01-4d99-9080-41dc15a13977@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 23 Dec 2025 13:37:41 -0500, Alan Stern wrote:
> > So in the light of your explanation, the fact that xhci_resume()
> > sets HW_ACCESSIBLE before actually completing resume and thus
> > allows root hub resume to pretend to work, is obviously a bug.  
> 
> No, not really.  The proper time to set HW_ACCESSIBLE is when it
> becomes possible to do I/O to the HC's registers, i.e., when the
> controller changes from D3 to D0 (and maybe a few other things like 
> pci_set_master() have been done).  By the time xhci_resume() gets
> called this should already have happened, so setting the flag
> immediately is the right thing for it to do.

OK, so no problem here, thanks.

> Agreed, we can't do anything without more and better logs.  Adding 
> dev_info() lines to the start and end of the various xhci-hcd suspend 
> and resume routines, as well as xhci_mem_cleanup() and
> xhci_mem_init() and whatever else you can think of, would be a good
> start.

That code is packed with dev_dbg(), so seeing this reproduced with
dynamic debug enabled would be a good start. It was the first thing
I suggested before trying to find problems with USB or xHCI code.

Regards,
Michal


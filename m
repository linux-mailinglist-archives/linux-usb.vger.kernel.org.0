Return-Path: <linux-usb+bounces-31376-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4EFCB45B9
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 01:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C14D6300EA37
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 00:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B741C21CA13;
	Thu, 11 Dec 2025 00:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jD8H1fXU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D111E9B37
	for <linux-usb@vger.kernel.org>; Thu, 11 Dec 2025 00:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765413584; cv=none; b=NzURdj6sPx+sqUqd5+s6kOk4TnJyCgf80XurSMY2nrm6wZMb1pMTLN4uf7A+XOKwFUjzjjkoRpWcE230GUOLcSpv6RoU9gVlSFapggpC3hVtDWkjBIabcXv+PxUI6lWxYs/AR9fMO/XAu8m7jFIxRo7e3A8/mDak7ONVoc5OTFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765413584; c=relaxed/simple;
	bh=Zm++eM/Y4Y4Mw3cr2RFaF779TF5CMVf3HozqFbdbsqw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GCYm4bohYhc0SR0N6yDVwtBEAdCf6oAR+T1vFJEolCGjAeHx3JwN7fyP8lyglwlMRK4jGCXXnUt90XCTNGHhJHEFWcHR8tsXEkhUHOEjeGRsFEwRr+L3Abmf+CjAmmZ86LU/PFW5muQgSETzrfJuf2OfnoLcC+wE9C8Ry+QBZS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jD8H1fXU; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7bd8b170e0so45872366b.3
        for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 16:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765413581; x=1766018381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5IMWQm5sz3Fn5h8gxR9KjhSHgtxoVBDtTdmB7LD/rY=;
        b=jD8H1fXUGmPPbZXo0ZGJlirOfR0RTCCg7u75pn/8+0E4z9BXMltTGgHD8nWVGXIdfl
         Bhhaz7AoPeDekMfrV6VkKpnz9kcNGXHgZcBrNS8k00QUsYF0xxykZd/PbIBB2q4Icd6Q
         XPFxOr95ksa8zyIOPE2F8Ec3OqSwHJJ2zL+ra9oxZ27Nz9wGMtMby0RSyqXxD1w7RIU1
         2ZRFirPkQ6Zx42Fx5Y6i0MW0sbkxSZMw1AUmBZcX3FtDHo7zvRu2rQ26o8S67R4AC9m1
         t3gsHhQ/I5jSB1pi4oZK2DztcvMEln14/8YoYbvM9izZv7PbDtE9RToxh1FooxensjWI
         FFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765413581; x=1766018381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B5IMWQm5sz3Fn5h8gxR9KjhSHgtxoVBDtTdmB7LD/rY=;
        b=GewQNcszWboMVLYmW+fjX1sUH+sl51SLcxA8HBYeYcq5HABHSXcjt9ww33s1WMx5VP
         EEHiyeUNRwM3+hIYNNRrI6Hh1FsDpRWAmKMz8jhGLV09fccP1WjwRSsz5Ht+lsnJbT1P
         b3J0gWYDSYICgjx0BadKxFZc+6aukC86YHp7PBaP/Xtz86EkSSFsVGtZPei2Xb3XME2U
         uwviFOIJGYmVwubdcgk9umpwdftbO2xpMgdfA+/tFtH7fXwltmBHsYWkwuVcJeQgIG+5
         LKfuSCihmiC6BRtWyImjaWIowcEyXItENkIeumNnD8jkcwcO+TdbGcdp6aYMmoq9Dz2P
         kBpA==
X-Forwarded-Encrypted: i=1; AJvYcCUXCs1paH4elZjZlUfI6AypTkvy2jbZf9xTIWWSQ8TBRDY7tJGUKAlvnnyMVWDvenWeGQqPjcn0+us=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVtBzeuW6zqPd6HId+bD7FL18YzARKEyUtY0OELav1dYSUydfu
	rwRQIcRnuBCW4q6v1jGHdrRKZrEByCq2kj3u2yE2Amcvd9Ip2r3IvuR+VBY26g==
X-Gm-Gg: ASbGnctoG9Dxe6GoNUp5AhGc4ldGhhN9jW4O7otv3g+8oVcD5GGrcVbkvJ8KEvNR5yj
	Krznxy62wNiR5GUe79AQbLHHsqm95fhg2fEGesx86F6xsMAL7gPXj/qIM16Xr/VQuS5CsjnF82W
	A6UBhHBVzRTiAfiniX79JLumOV4w3lpezO+tSttTa/GC+SSm2o1VPabhCiHpFKKO4msSfMgdR8Z
	+EELoAZCen+V5rDjZoVOxd8ykjK7mfS8OYxy6gStdzh2apY0SA3+9YLh4iVbLhdjr1Arvzbr3gh
	LHJ2pQoBdVuHHGt5WCI3QzeZtdqObWcT3sD/2mlWSXAAUn9iTLdSDwRw8Fx0kCxF7z8iHQ94gSM
	4tmJJ2JKS5iKOlWKnBrSX+IEafzbpw2dToVJB4Ta4x8euQ0/G7PyfjJ6Qupw8/aC4oFmKbzF9q2
	DbZktb09aMlRljxwGYs6wg5hOGVHFzYRIT0Fso4SZcND8KC/Q4+U0v
X-Google-Smtp-Source: AGHT+IHJ5unPIP4qklvnNP+tvcAVqaSk7cuFkEwR0o5WYQPqgnyOEHIo7FqFLamdSrbYRL5Ra9cg8w==
X-Received: by 2002:a05:6000:2901:b0:429:b8e2:1064 with SMTP id ffacd0b85a97d-42fa3b05105mr4387383f8f.47.1765406443112;
        Wed, 10 Dec 2025 14:40:43 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a66b1fsm1691501f8f.9.2025.12.10.14.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 14:40:42 -0800 (PST)
Date: Wed, 10 Dec 2025 22:40:41 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Geert Uytterhoeven
 <geert+renesas@glider.be>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Crt Mori <cmo@melexis.com>, Richard Genoud
 <richard.genoud@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Luo Jie <quic_luoj@quicinc.com>, Peter
 Zijlstra <peterz@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Simon
 Horman <simon.horman@netronome.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Andreas Noever
 <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 0/9] bitfield: tidy up bitfield.h
Message-ID: <20251210224041.36bbde25@pumpkin>
In-Reply-To: <aTm54HCyCTm5k5ci@yury>
References: <20251209100313.2867-1-david.laight.linux@gmail.com>
	<aTm54HCyCTm5k5ci@yury>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Dec 2025 13:20:16 -0500
Yury Norov <yury.norov@gmail.com> wrote:

> On Tue, Dec 09, 2025 at 10:03:04AM +0000, david.laight.linux@gmail.com wrote:
> > From: David Laight <david.laight.linux@gmail.com>
> > 
> > Re-send with patches going to everyone.
> > (I'd forgotten I'd set 'ccCover = 0'.)  
> 
> And this one again appeared in my spambox. Have you any ideas why?

I'm getting the copies sent to my gmail account, but gmail has a mind of its own.
It bounces and spams a lot of list emails (never might the emails/minute limit
that meany you only get 'some of' lkml).

The email headers are a slight lie, the From: doesn't match the 'envelope from'.
Basically you can't send more than 100 emails/day (count of To: and Cc:) from a
'free' gmail address, so they are sent from elsewhere (with a 500/day limit).
But I don't want that address appearing in the emails - hence the subterfuge.
But the 'envelope from' is correct for where the emails come from.
(A test email to xxx.gmail.com with an envelope from of xxx.gmail.com sent
from a different smtp server confused gmail! The mail was errored, but it sent
the bounce to itself!)

	David


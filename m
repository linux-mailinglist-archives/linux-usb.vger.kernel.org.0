Return-Path: <linux-usb+bounces-31106-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 37558C9C0A0
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 16:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A9F6E349043
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 15:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0223B322C89;
	Tue,  2 Dec 2025 15:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="j4JjL6We"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0296232143C
	for <linux-usb@vger.kernel.org>; Tue,  2 Dec 2025 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764690797; cv=none; b=VakqBiO3BYe4zVnDYmv9xe9fZOemgml4ynBg5h0e2Cuz6leWU0IRA4cr/k5x9GPHnZt8LmFN2+CIFsHa0V5llH5vR1aIbkHZyKunc2flyL4uZYwV8YwUBFgUdd+mIEp9ZXlFYX8S8//nHK2h2ebrPLpK1Z0Y+BarjXClvhtsH10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764690797; c=relaxed/simple;
	bh=bLoq+0J4Pdz2yimFi9dyvez+MengAB4dZYv5B3C1McM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuaCGfvdq5hRJ4rV8Rt8lDY+UYvTDZ2zBRN11oDgnqjpS9kAYLyQlycucP0u9if0xaGnTJRBPEZsdnsIrOkXqJWaBaS+nChJYoOmGp7s8yz+SGmATNE2+B6j+Exjiaz53R4dZqUmBRIN5abopHCfKJJX7TEpISHaLZlJ+j31saU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=j4JjL6We; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b2d56eaaceso547107085a.0
        for <linux-usb@vger.kernel.org>; Tue, 02 Dec 2025 07:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1764690795; x=1765295595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ein3D251E2lqfEtSiRGhRdTfSxeVBVJFtAWknaD20lQ=;
        b=j4JjL6WeU9rD/or1bsRybL/GFfdJBGjnQilc0zWYUiBJ6OIal/OjoI3o06ziKg3ZYi
         yV4XkbjeXMJwozh1ZQ2SIZz908cMP1jlEFrKupQ5Y8HNbvxohb6npr3E/Zp1NyBN1kuO
         pRV+qDjegCdbwQLf41MqiM9K0VHVK9OGGIil7/WPdC2d9kcLPQHVeihGXH/45eG4gBTb
         fOPx8P+5mtCcy3BEiB3cF4/ixf81PW+z2NVq6oEesd2t57iM7c5Df3DxEzBaQKaWvZhB
         GOMvrFObrfFRZTpNZM7fHLRKjb5WKdSqrt7E6co/PV7rnMgxVzRr8RKOUnqHThmg9LIz
         Pplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764690795; x=1765295595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ein3D251E2lqfEtSiRGhRdTfSxeVBVJFtAWknaD20lQ=;
        b=P7Pyn2vo5RcceE9ZpkrSYgsZqDJQK1ND2OSfGR4RXt1nHGQXYRfElK4xqmX8ELiSqp
         d/vb6Rwkq7PS0OBPUlsfOaSsqCBHF7FLRkBOT85Vfmm2E2gV6PrxTdD4vYhwHDqkKw5d
         EBIiJyJIweCPL6gh0W0LMN5M0IA2TfLT0v9gnUxTAfVbuYx7s0GEIgX2RSwJl9OW97Yh
         7n+yMtjs++9sEhh67IuyIlT0tyLanO43SHXlsa/bUOYt+wMlUeJzy/z2N9k2oV6Ge4TI
         w+DS66l9qDUzHa/k7/1f1yQUnu5a50u4PonknxvTsr77hkzwaD5XN5aF62nqIvm0Rxzs
         nPpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPSCF9NwjkdTWKR9S02oUKe8KXTNwddjiArui4+UE+R0+xgxFOW9qYvwq9WCqlfA6zVmRvgue0IYM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3DF9xtKsPPfVsS4SnmQgEXfC40h7rlF1V4eb+gzRYWhHsGO6N
	zmYhB8pEQJIQzzHYuL1u9ecAZbxihpLQCwt9DCA01K1a8uIz9gLT5ZXcZkdIm9Yaog==
X-Gm-Gg: ASbGnctiQDONHb904i5P0dLnGRytyoX2N68XZP3ampZXRdaqO98IX05vX3WBZBb2JAV
	6vXGdRAv5Glp8Y1KQWh+SX/glK3tMOUxQGNIAiCIqqvr0efSunMnwt8TzM1KPbke9IO71rlEhx1
	N/fKEYCv8dnGhqBsLfNcpTEKrJitugHADtQPb3uNiqos+CAKwLE0AgZh45dMN0GceQxxr9RcaLO
	68VlYHKjXJ2vyAQnaFA2C8BvftIibYxbzQzuLaLE0qLK+WDx3QGSjeMLe46kxlFbldpa9iCBwuk
	Asy/1Ti4GsTr9ZUMiyzbNqpLXBRl35oiTOm4U4nD699OuLTb95TFJeDAdaZFSy0Qmp0dPElvWCT
	dcY5w2/11gY7e+aR9NqlN+PEJY8eNIkDUzIcvEnUWkr7LWrUZX9BdEbyOdQ87PposNGKvgn9O3u
	XCtnb39EfEe+VY
X-Google-Smtp-Source: AGHT+IG7imMaW6P034ogai9juXD7cZWXeGPG/KXNDrCibNV7M+DiAwK7QmWiAcjFYeItiAklgvwKWw==
X-Received: by 2002:a05:620a:1a8f:b0:8b2:ea3f:2f91 with SMTP id af79cd13be357-8b33d48169emr5525748285a.81.1764690794744;
        Tue, 02 Dec 2025 07:53:14 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::eaae])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b52a1ddd36sm1088799885a.51.2025.12.02.07.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 07:53:14 -0800 (PST)
Date: Tue, 2 Dec 2025 10:53:11 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Clint George <clintbgeorge@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	khalid@kernel.org
Subject: Re: [PATCH v2 0/6] usb: gadget: dummy_hcd: coding style improvements
Message-ID: <17845408-4a9c-470d-8949-f4cd0a847615@rowland.harvard.edu>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
 <2025120200-backslid-endocrine-e64d@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025120200-backslid-endocrine-e64d@gregkh>

On Tue, Dec 02, 2025 at 06:27:46AM +0100, Greg KH wrote:
> On Tue, Dec 02, 2025 at 02:07:09AM +0530, Clint George wrote:
> > As part of my LKMP mentorship i have to complete 5 patches as a criteria
> > for graduation and thus have focused on working on such
> > beginner-friendly patches so that not only do i get the required number
> > of patches but also get familiar with the process of kernel
> > developement.
> 
> The LKMP internship should be done in drivers/staging/ as generally
> coding style cleanups are NOT accepted in other parts of the kernel,
> unless you get approval from the maintainer ahead of time.
> 
> Does the maintainer of this driver want this to be used for the intern
> project?

In fact, Clint's changes are small and inoffensive enough, I wouldn't 
mind having them applied to dummy-hcd.

However, Greg is perfectly right that this kind of stylistic update is 
not something that should be submitted for most parts of the kernel.  It 
just bulks up the Git history with essentially meaningless cruft, making 
it all that much harder to see the changes that really matter.  That's 
part of the reason for the suggestion that interns and beginners should 
confine their efforts to drivers/staging.

Also, remember that trivial changes like this are fine for learning the 
procedure of submitting kernel patches, but the effects they have on the 
kernel itself are minimal.  A patch that actually fixes a bug or adds a 
functional enhancement would be a different story.

Alan Stern


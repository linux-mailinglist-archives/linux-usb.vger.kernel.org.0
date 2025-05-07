Return-Path: <linux-usb+bounces-23783-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA71AAE90D
	for <lists+linux-usb@lfdr.de>; Wed,  7 May 2025 20:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69E9F987786
	for <lists+linux-usb@lfdr.de>; Wed,  7 May 2025 18:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6493B28DF52;
	Wed,  7 May 2025 18:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="B9cGLONt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5281220408A
	for <linux-usb@vger.kernel.org>; Wed,  7 May 2025 18:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746642576; cv=none; b=RZ3hDtrcwqva9LC/Zf4kL+098agsgv1Dz8J7FVGfOIglyvfwaZWNn4AJp1x8o7mgJhNYa90bOSVPkcE0++2dPfL5j6xG7xHXfi9ptE77v4+L7BMWO87K2xV27ukMmzZ5lvjdnzd+aQVRhrTW7gaC4ImRAGko2naC3V0PbBxdYSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746642576; c=relaxed/simple;
	bh=slydqQQYSrYdyznpu6ZdFVyoYlYPGOAm6+qhysaDu0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZl4sXfF76HmMqXlFv51QjhI4C8YTMuX5oOsBuxriYFKvnB/aEXkivqQExmyWWtFuLK/8Q/7imcK3q2SSw2BK0SF9LNI610j8HREqjbM/h78doBahHEUKOGtERyTcetGeK7LMsCFr0Pk/hUFUgLNUFQQnYiUi0XCdJWGh4SKWMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=B9cGLONt; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f535b11824so2113236d6.2
        for <linux-usb@vger.kernel.org>; Wed, 07 May 2025 11:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1746642574; x=1747247374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2eLxeAZWz5DWy39hfAWzq0GbOK4A+xTpArBWabUxQtg=;
        b=B9cGLONtY0F3Uetu+wAPAQwYWdyyQomAhJd08opNbRHoinygF+QXQJS+Wxus13rgGG
         Zv6iT6cmh/R1RKEMsY9XBhQqu52Va4IG0LyyrDoeYk69kvMLm+TuI8JV3ujfUIg0oEai
         QdnSryLcNuFwQyyeRLnliCxXEDbAfp2tgtB5pgoJ54QBTdwYL4Tta/wZcWXosoZnDaKo
         nC1ZNnTkYPfynB1s0vtBIP0PKJFi+IoYBtvL8KJVI40QdbH7cmTZ6A9JBEVi/Ry5wXPe
         Rgxlr5ETc9lCeqMUoHrpHszO35t7U9cJvV0KGwD6cBSt1kmXpWRXRmWuVK0AR/VU9DmJ
         /1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746642574; x=1747247374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eLxeAZWz5DWy39hfAWzq0GbOK4A+xTpArBWabUxQtg=;
        b=NYSha9amU5scpqCvOdOA3e2VNGgVli0cIpaSFHy2rSUUg0qLp1QzRm+KyCvN6ZYLvw
         H9DrbvMBJofBATCRrPGQOtpQO7+0ieaLp87woISgBkoiFSfCMnD60/rNVutzxRWHaT1W
         K9KM2/YABQLUQGAxc0PRS4GfYL7OLjgILuHtRGuEuACBnokzYrxUQG12QuN6kMdBkchc
         FkVh/sWlnsyscur+xW4v0dOJZDR35Z2vXMSZ1aaLoqM4BVOoDgzwIyq6ecTWi4uhQq9o
         3xbvMuhqK89K1p223Iy1wHEHgYCm1RqCx1P4n9L+M0rE1CNjrX9O5XrvRk/gEYx/8Rsd
         6BzQ==
X-Gm-Message-State: AOJu0YzrVf37phHvrCm8ChU3jLopQCB3ZNb2Er8C8IpaT74tUnkto8sD
	wrETK0BSjMXKX1mB/zmSHDOyjN/LGlaUEUmz5VdTT8QCJnb50848BvpTHRicten61+Za/736LnA
	=
X-Gm-Gg: ASbGncv6FjfnQ/UNdJsKxE1By00+3Aau1cCwZfPmj+mhPXdAAsSkdFYeotE4hdLuJen
	cINiFpRTx6n7rB98LXOUf4UN/v+iQL+GAhANbHDrxxfqelPMZe9WHG/eDG/7R9rxeyQ4aK2OhmF
	8VLKH/Wyb1ILu3V1lc1NOtGpsOph/6SlfLbDxrpnBRd+X2z+UKC4QA32svbGL2FFCaNqqoy5ZWW
	3JP9DYrmnRyZwP5JNLOGh6nZyDkmOOnB3UnON+aapGHzYhgZU4dVJoIB67/OYqWPOyTKGMmxsaQ
	FdVfziTcfKsGSuYviVNkRQaRI7KW/i8+OsfmVdTCyc7/T0J9JsjUxs4rY2gnzI1RPH/tarlBCbI
	Q/+YBkxkb13yBsSEoO+GkcsuuaH8w36tReA==
X-Google-Smtp-Source: AGHT+IGQv5tQ5SQMRSX/sa6n2hgD/zAItfZYRP+U1sy0D5EJbaPN9BTFNJhkO7Ja8MeJLyw/QLJenw==
X-Received: by 2002:ad4:5aa2:0:b0:6f5:107c:7db2 with SMTP id 6a1803df08f44-6f5429b1457mr58288666d6.9.1746642574245;
        Wed, 07 May 2025 11:29:34 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-52.harvard-secure.wrls.harvard.edu. [65.112.8.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f542623ef8sm17522416d6.19.2025.05.07.11.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 11:29:33 -0700 (PDT)
Date: Wed, 7 May 2025 14:29:31 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jake Rice <jake@jakerice.dev>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] usb: storage: Add blockbuffer ptr to info struct of
 sddr09 driver
Message-ID: <c71aa977-d58d-4eee-9ab9-e9fbdca121bf@rowland.harvard.edu>
References: <20250506191531.3326-1-jake@jakerice.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506191531.3326-1-jake@jakerice.dev>

On Tue, May 06, 2025 at 03:15:31PM -0400, Jake Rice wrote:
> Hi all,
> 
> This patch updates the sddr09 driver to allocate a reusable block
> buffer. Unfortunately, I don't have access to the SDDR-00 hardware
> (which I know is pretty ancient), so I'm requesting testing from anyone who does. 
> Please let me now if the patch causes any issues or improves performance.
> 
> Best,
> Jake
> 
> ---
> Currently, upon every write the block buffer is allocated and freed which is
> computationally expensive. With this implementation, a buffer pointer
> is added as a member to the info struct and allocated when the card
> information is read. The buffer is freed during desconstruction if
> necessary.

This isn't a high-priority sort of thing.  SDDR-09 is indeed very old 
and likely quite slow (by comparison with current hardware); the time 
required for the memory allocations and deallocations probably doesn't 
have much effect on the overall I/O rate.

Still, I guess it doesn't hurt to do this.  However, I don't have time 
to review the patch properly right now, and I don't have the hardware to 
test it with.

Alan Stern


Return-Path: <linux-usb+bounces-27984-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DABB5405F
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 04:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61D333AC398
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 02:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A2E1FBEAC;
	Fri, 12 Sep 2025 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Wfq4yWJ/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7981E3DDB
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 02:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757644217; cv=none; b=hWE/14yXIhY+g+NuYpwtFch5Zhg9Fqq9tSs7FqhZW55xS0sfGPDyuyGovfyH14hgxMCEUCSMj5hL4Gc41Ot/ZmykiCqkVmFwGmPs9DVoCqybv+CjxUl3ggc7So4QbLteoK/+/1Go4EuRrXA/QaqXh7rCY/ifFxZhASJO+SY995U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757644217; c=relaxed/simple;
	bh=vQQIU6ckHc2+RvHHnlo2eleJNpXZev81qLhetlXEw2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9ur7suCDXHJ9TU3zTzBBUbWZojpwVA35CWtMCsK3MPSiKJjTw+SG5r32rmAXQT7OB4eRF+yOspJileHk6i+8vUAuioxOul4HYp3NFaWBLBLf8rgpAyWeJDO4Jh8eGPHJE5NlGi9OzlU6//t/lGjQ1CoAikmR3wT+oLBElLFJqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Wfq4yWJ/; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-7639af4c4acso14158336d6.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 19:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1757644214; x=1758249014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bOcBl4BVZOSZI/RGkDZyOTuzjiM4ERqznZpinFtbvyg=;
        b=Wfq4yWJ/5fRvTYXWHplP2tcJqgI4K5WhBq7exprxaW8O9GnbMVmnQ+WyHtXgyGfoZm
         qFaaMQ3X/vTI0zZA/7YyhB6ZxyrqgXvEr495XVxOxW0xNtX/Bh+JDkwP4P+neeOQQiHi
         dXPIgz9l7wEbaiUNqzp+UbdFXOlWSiLmBnjtVwHpkga+6vplDydwiVbt1v323n9qIixg
         /mzQlk81GgqKDqfrYI7Z3150UXzl6iBlAUkgNfY8oO0K/hz9Mf4vGjCd77NKUlo9MFkU
         trZdi5ItiDQeB4+ODoTvYS9SJtB1+4dqL7oyaYH3kSDQcHLFwh0/eNK9g9fviC2SVJZs
         q6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757644214; x=1758249014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOcBl4BVZOSZI/RGkDZyOTuzjiM4ERqznZpinFtbvyg=;
        b=djOnbfUgWGxNQ3Gufnys9TvXbSqyv96DhamhZc3O5fR8Rom41kzYUPRd5w24FM8W9e
         xLhSQ6aqeHzvNFy8tweOJUQKld4FoR1Prwfu5ASGw4549jVGA2e3SEx0nocOqg5IxkeF
         EWMVSdh7NuWwM5ajs8E3dQ7UmsVttwdEGHwuOmpAd0s8c8v2Uvb2h0Fy3lh50CMV0+hS
         bwMz52+c5VvBsM2dkFg1voCQteFV5upJqVNsBdoWfPNZP6evXLjQ2idwFhwMre1RBxU1
         ZUSZUr6NSWfZUAPzbrgvOg2Gujr43Xal20iq0gcWxuSBb9nODeOWfth/ozS9umKNLbtW
         HbJA==
X-Forwarded-Encrypted: i=1; AJvYcCVxtahEMalRroEX8wUYGgDJPlSjTlbVGhPw65CZfWaW/akCLg1m15v/Pi8rekmVTHkGf0HsjGniQ/I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/chIb8ChbhuJHlYHuLnRtlbEv9lBHDonoKBp/7G8zMYkBk242
	2SKqpQvaowcdte19vE18pPeXQezENGlR5lJvSIykxHm7kvU1PY+tTQWr2mwhaEyLOQ==
X-Gm-Gg: ASbGncvk9HAOCVsV1kGvxUwrqAu+5J9rnsq9jjMji8mjlWrRh08jd4O/n/0vWM9NyCv
	F8mye6VoM2cslnwYFRBYdmG38qQFP2/NaeI5PF22pVShNgrKl73R0s8a2QM++AMdJ6+slvco7e0
	4D3q3KDCrl4XhhWEGJ7EqqVE/HzWei2NrLD1hH/7ouod0uX2v883QFx/nTFV81H0C6xIJmrsNBd
	8PM4H2w7ELIVZHCJzfftfgNv9TgaK36mEEmRrPv4/WxSZ3MAOI24/+HYqfm1SbjnGL+CYdKuxBV
	SihcntfaeLPKXMhbI0tSlrHYCwX+IYqmRX//qX9mMCvCTMj9DcQl/mXEAfuWlGonXpEqX4jGAMB
	ftts30SoFBVquYPJCCb1rdL5EMp/+ZT3SC9g=
X-Google-Smtp-Source: AGHT+IF3YJcN8fftkWAXBvp5e8ChiQTwvDs2PYP+e/p5pRC3qGnSYo/pJ7OVH35ncvR4Bc8YEDrv+A==
X-Received: by 2002:a05:6214:230c:b0:70d:b2cb:d015 with SMTP id 6a1803df08f44-767c88fae6bmr22357036d6.67.1757644213876;
        Thu, 11 Sep 2025 19:30:13 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::6aa9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-763bdd3773bsm19545826d6.36.2025.09.11.19.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:30:13 -0700 (PDT)
Date: Thu, 11 Sep 2025 22:30:09 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Hubert =?utf-8?Q?Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>,
	stable@vger.kernel.org, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>, Xu Yang <xu.yang_2@nxp.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH net v1 1/1] net: usb: asix: ax88772: drop phylink use in
 PM to avoid MDIO runtime PM wakeups
Message-ID: <22773d93-cbad-41c5-9e79-4d7f6b9e5ec0@rowland.harvard.edu>
References: <20250908112619.2900723-1-o.rempel@pengutronix.de>
 <CGME20250911135853eucas1p283b1afd37287b715403cd2cdbfa03a94@eucas1p2.samsung.com>
 <b5ea8296-f981-445d-a09a-2f389d7f6fdd@samsung.com>
 <aMLfGPIpWKwZszrY@shell.armlinux.org.uk>
 <20250911075513.1d90f8b0@kernel.org>
 <aMM1K_bkk4clt5WD@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMM1K_bkk4clt5WD@shell.armlinux.org.uk>

On Thu, Sep 11, 2025 at 09:46:35PM +0100, Russell King (Oracle) wrote:
> On Thu, Sep 11, 2025 at 07:55:13AM -0700, Jakub Kicinski wrote:
> > We keep having issues with rtnl_lock taken from resume.
> > Honestly, I'm not sure anyone has found a good solution, yet.
> > Mostly people just don't implement runtime PM.
> > 
> > If we were able to pass optional context to suspend/resume
> > we could implement conditional locking. We'd lose a lot of
> > self-respect but it'd make fixing such bugs easier..
> 
> Normal drivers have the option of separate callbacks for runtime PM
> vs system suspend/resume states. It seems USB doesn't, just munging
> everything into one pair of suspend and resume ops without any way
> of telling them apart. I suggest that is part of the problem here.
> 
> However, I'm not a USB expert, so...

The USB subsystem uses only one pair of callbacks for suspend and resume 
because USB hardware has only one suspend state.  However, the callbacks 
do get an extra pm_message_t parameter which they can use to distinguish 
between system sleep transitions and runtime PM transitions.

Alan Stern


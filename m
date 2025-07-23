Return-Path: <linux-usb+bounces-26118-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1610EB0F567
	for <lists+linux-usb@lfdr.de>; Wed, 23 Jul 2025 16:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 423F5AC372D
	for <lists+linux-usb@lfdr.de>; Wed, 23 Jul 2025 14:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E68C2F4315;
	Wed, 23 Jul 2025 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="J8aC342I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370D22EF297
	for <linux-usb@vger.kernel.org>; Wed, 23 Jul 2025 14:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753281250; cv=none; b=gSr0xw/mPmVjfXvS6oxLM6GDbB/HcPwoCq6aYuNsQ0WrEc28VZJ5YzI3F9r6gEbn9yXb22sEKX/E9Kx+w2vnQjLn4o2Dz5SxfJeP6u3BiUR2vQ0EjRLqYn3bhhGPj6pa/P5q3Oyl8tZs46MPQrkwmJpDFIbgLs3oiFa7FAsP7bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753281250; c=relaxed/simple;
	bh=1ULuyti9Kn4FcMH3MUItWYZpR0G6mq8RJGPSkQjQpYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hqw4pdqm5E5V098xs+P73OUf68bBAyRYyL6hgo26SMSeg3ShpIhmpLnbFxzQKe1lBoLvBaah4LVfR1p9KH00IBrh6XlLfqLOFgHuc4D5wqoKKnxlljhpL0Odz0yHFMKkwMz4jxziTebixhfrgP7u3Wc0Lp9opDE5dP6CC5iElmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=J8aC342I; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ab6b3e8386so71914681cf.3
        for <linux-usb@vger.kernel.org>; Wed, 23 Jul 2025 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1753281248; x=1753886048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DpVfUmI1KeHlRdksG5/hlr6v6bC/FgYZRIQLfFzPySo=;
        b=J8aC342I5csm64SBHVemOrTwBaimpllITWbF8sZ4uCOCbZ+EWKbiI6RFv6hApLnxeJ
         DWalxAxi5/yP7w5f73t7SOnblE8fOPzOHf4UHzuC3r/ntWQo0yymNHupjnVTAPrnRcrf
         GCJogHwhfIMkzaIbxBG9Lym0SMkE/zuJVR8cV7fzAM67a/LGshdXNELkF78SJdv9uSwL
         g3ebtrka5s8GTpJYtkFdvce3gq6aSM3MdYu933lczBHEn2xayc9syBdnSCTi+kIj6B1U
         bk6iiCXWpkY2WPOwjXY2/dojj28U5ozZzV6AWmV9P/kYNPoybS5yi3ALgTyzfrF6cKPO
         yASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753281248; x=1753886048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpVfUmI1KeHlRdksG5/hlr6v6bC/FgYZRIQLfFzPySo=;
        b=jl+yg0OQ26mTfaLh9rtQq4M3dunLNcby0i/kHvrGhFAngIXBmmNYim+968WetFkK0l
         5K6NshI9g36JnmDjbX5af/OT5KOdqwv0ZWPDt5GqKTy03uu7HT6ZbvgkHmqLvBlIMrII
         cQyXrJ1/DAP3nAyNOduer6i/qyOLst9dggtzLcsZdh1bHDRKOK9kH5GeDkGLjOpczobz
         xgLA5cj6m7DsjUBbrIrbNjmqBZhFiGmjkwo/nnnOOVItxwWH+Ssxx+pYPdq+IwF14HEi
         WbDnpUHyIOaPfrZICOYdUDYNru2xFRlbFj8hFTL5WnMsq3gqlZ2KlOi0VKnPob5vWOs/
         Sv0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUX4UGvI3TjQG97Z9ByNnmt3fXwbVPG8kC6bvawaQ0lv789aL4DwGg4hPBHTfR7/MY4H8R0kZ3BWxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP7oxjnNS6N0I5xm1p0B2+rAz5vP1RYYoym+6eeEnjNmTpVvo8
	cKk52ox6xeYQomHHGdYiPRkApCo69huBs/CwdH9dywmHeeTVtbZoasUnSkZv2CuztA==
X-Gm-Gg: ASbGncuR2RQBJAIS3ExhWEPv+7YHnvf15sQFzfYC2C//m8lrfg1MtFTfhB58fEP+Npj
	F+x4yT68LCAk7hpWSOQ02F706qcv2asDn9vCptP7kvAT2Im6iW3TkAtaGV+bi0AbYonHrRB0PwR
	zn/i0aJvnWoBWkJWFTQRs9T5Qzb1pP7cl/h6oFbOZWFo7h+5L3b9QuoaZdcVZWwVxgQqIEUJWCW
	xkS8fTg3Wv1Da1lkjlT5Kj85wQaCr3L3QOOu2l5i0YLqjwA5hNjWjPCVtxXymh9QtiVqg8EAc9N
	oytbCpqiyiMdGub8sJXbDkboXoLgX3T/zoMlbmPH8JV0CPQowEUR9Z2kNXonHz0xaDfwkl3arQV
	196WEHn7ihD06B6TEQXbJLqkj4JwOuPVWbMcCAKiYd1hnyGz68XM=
X-Google-Smtp-Source: AGHT+IHpNXlDJG0Cf2V8A8Oz1qR6u5Q6ICaQoF7lbGkGS7QpFGO8kmzSUKcIsA361heT2XOuYduEYQ==
X-Received: by 2002:a05:622a:cb:b0:4ab:5e1f:ca8a with SMTP id d75a77b69052e-4ae6de54cffmr43546971cf.14.1753281247645;
        Wed, 23 Jul 2025 07:34:07 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb4b24930sm67046841cf.51.2025.07.23.07.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:34:07 -0700 (PDT)
Date: Wed, 23 Jul 2025 10:34:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>,
	jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] HID: core: Reject report fields with a size or count of 0
Message-ID: <750377a5-b5df-4b2b-8e38-0001bfbeb30f@rowland.harvard.edu>
References: <68791b6f.a70a0220.693ce.004b.GAE@google.com>
 <8a4eb6b0-f640-4207-9f05-83e06080410b@rowland.harvard.edu>
 <lrhydvc7huuqck2kvqzobqt7hhwt36zwsa2i3fpegbpykt5q43@2md6gfitjlb3>
 <a2c3537a-8ddc-467f-a9f4-b4d413914914@rowland.harvard.edu>
 <voiysrjm3okjtaz7axqupr2jk5yyvxsqgagbwrsey4z24g6rf4@xb75ss3bwol5>
 <bd033800-53f0-4d5a-a52b-b0e01ac48c12@rowland.harvard.edu>
 <34ks6futbrmunsq2tbz75jwqg64lpk4pg6udbbk3yo2exm657b@3fivbjjdcyl4>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34ks6futbrmunsq2tbz75jwqg64lpk4pg6udbbk3yo2exm657b@3fivbjjdcyl4>

On Wed, Jul 23, 2025 at 11:32:14AM +0200, Benjamin Tissoires wrote:
> On Jul 21 2025, Alan Stern wrote:
> > On Mon, Jul 21, 2025 at 03:05:58PM +0200, Benjamin Tissoires wrote:
> > > > So then would it be better to accept these report fields (perhaps with a 
> > > > warning) and instead, harden the core HID code so that it doesn't choke 
> > > > when it runs across one of them?
> > > > 
> > > 
> > > Yeah, that seems like the best plan forward.
> > > 
> > > [sorry on reduced setup for the next 3 weeks, so I can't really debug
> > > the entire thing now.]
> > > 
> > > Though, we should probably not annoy users unless we are trying to do
> > > something that won't be needed. I doubt that Saitek gamepad will ever
> > > call the faulty functions, so why putting an error in the logs when it's
> > > working fine?
> > 
> > All right.
> > 
> > Probably the best way to do this is simply to revert the commit that's 
> > already applied and then merge a new patch to harden the core.  Would 
> > you like me to post the reversion patch or do you prefer to do it 
> > yourself?
> 
> Given that the faulty commit is on top of for-6.17/core, I can simply
> force push to the parent, and also force push the for-next branch. That
> should do the trick.
> 
> Can you post your s32ton fix on top of that then?

Sure.  Patch coming up shortly...

Alan Stern


Return-Path: <linux-usb+bounces-31085-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 956ABC99F1B
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 04:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55A323A42A7
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 03:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846F826E14C;
	Tue,  2 Dec 2025 03:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="FxgUGI6g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CD3125A0
	for <linux-usb@vger.kernel.org>; Tue,  2 Dec 2025 03:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764644976; cv=none; b=mQJnLWEAETC/AN0SW4pnPYsM7JiDH7wmMWvxhw07jwUHUTh/YDpqdLQ9uUEdYQPqa7sA4folM8YOg76/b+l9hONySTSlXWI5DR5Dyh2BLsg1IFvB6+YeElDpqFlgHF2Pl5onhgTitFyuaTGK0w96aR+xps91RgxMuBHcAzcKFJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764644976; c=relaxed/simple;
	bh=c3GTfQAkjVthbOyvxqB3PNeIVgKlcI/1Fz0+CWJ4Mq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxYK1eHa4gXOgrjBOGgpXaeai+3R4qFiyjWURg34Ubwftfg91Nw5HS7bkNC9zkr/l4XcMG4M9hK186ficwfyZsnPrzu53oJ3AEyybY+51jlyGe4W986f2yN11Hz5xQlQux5T8ZEePZFZ0Dp+5OTMNjd03EvL/4iSUMA71AS7JX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=FxgUGI6g; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8b22624bcdaso572514585a.3
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 19:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1764644973; x=1765249773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r/CN2vGlYmCqPjAqC8j+1rXqduC999vaUjkyiLe6i1s=;
        b=FxgUGI6gHPcamvjElYm5/9ET8676I0zeM+dRT+QVGYnksmO2Awg/sG1cPeNWqWHjRJ
         kFMSIhG7dXNj6cv7WGOZSE2DWP2D9IX61L4OKrmPtReSrZBCulnGX/rIUOf+mYzL0fb7
         elwjTWAa/yWS7AwTHncXWOtz/32KEgCkvxQZZ/3EAumpF8VTvAi5a51wiD9rfWTPokOm
         mJkEDMebB7MtTTJknnyGNIiGJNmNK/rzB23iqaFBIn68T5ico454xVxXRIkT/wME7ruR
         E/jsGkZ8XE3RjDeqFZ1o4oOyac7jZvbZ8QI2Mh1aEXjavihgkSHW+ljAC5Zd2QrkEtbU
         I5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764644973; x=1765249773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/CN2vGlYmCqPjAqC8j+1rXqduC999vaUjkyiLe6i1s=;
        b=XhXt7pMl3AooxG0z3Yh2cCM13tgnIvkE095fh9BooynYDX4ZTh+s33LBjnqo9gnk1s
         lIi8/pf4ZDLtpIBVAQSA6fEuU07NL7rqN83E1GCe3ZFU5HSREnZrrx++Pkp6HkZnDHNM
         x70CCboChAGWRHg6GHSttamES8cwAxs11KzTGn/0VnAGm/+CO9+2ddc1OhhfS+HP+Z3R
         BQfyrQqea126bLO8BCj4/Y3vdzhW868Bg5F5+hJ5eSvPqJNUpbOJnuH9WerI4eSlgYdI
         hWAz2fimV4uynASh4Ggl4GrDEkPgVHb0TEpO86BnYU+z6PwxDnfq+OLSkRLISL4njszf
         pQhw==
X-Forwarded-Encrypted: i=1; AJvYcCU1Ft1VGnCsGVUTmrPiPFFPETor5xBxV1MntRBunpnSshKWcih59fR2ihnvao/YEuZ1Bt+nHBGEVmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoZ2u6TtxUYsbHmlocvRiRaiCrtRzXP1Kjvd706yursyWcOfXs
	0JFIcpIaOQbUXxIU9A0+wXVwi7mzYh8O4fUkil1yOGCjDk3XYY6Z+6ZC+2rxQST7mg==
X-Gm-Gg: ASbGncsonJjzRGctX431qgqE0cfxGMxBsYRxQ3rMsm8l9SEJgzNQ6EukXWI6CW7Ljv6
	XjWTlPECSxyn6rdrnMCLAdzgV9LT4oSJGo/xPpVKN4Ubuf0U50ZnoPZ3qWw+GhEjNTT7VVbSvjf
	SFxG9GKBKkd4bTZ8fjWNy7WX4xEm90EWiLL3s2YFYU7WsOLy8Vk4tpN7kv2FzAK2CTfVooPpobs
	xwbYuEvYp/m+yPoGKCxto0q25R1lXKXj6N1j4yPXKGVgAkEi8xGrrJixHz830M+b3oXWJaDS55g
	uWfAOu8ZlnRFnqKfVooYLxwpgM37e+5ZvTIcp8Sy1LNvmMZQEqbGqIQHwgKhWNBk6LkFUZSC6fX
	LbsEL0geqT/hOiekXsOsyzsv5LmN37LreoZLpV4lRFj4ZOo+j5OG/UBActMK8JAuY96GCrdWSbZ
	VK7rgGysTBmANT
X-Google-Smtp-Source: AGHT+IG1PRVdbB8ZdEK4dYi035yurNIqbtFvRZiaurlO+XBjPagw9C0HxtF8AaXUpEsCkl2v5cv1Kw==
X-Received: by 2002:a05:620a:4146:b0:8b2:edfc:bb9a with SMTP id af79cd13be357-8b33d49884amr5398678585a.59.1764644973175;
        Mon, 01 Dec 2025 19:09:33 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::eaae])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b529c920c9sm986675085a.24.2025.12.01.19.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 19:09:32 -0800 (PST)
Date: Mon, 1 Dec 2025 22:09:30 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Angelo Dureghello <angelo@kernel-space.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: testusb: epipe errors on test 9 and 10
Message-ID: <82bc662b-70c6-46f8-acc7-3a666965d13e@rowland.harvard.edu>
References: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>
 <c17c0821-3dd8-47b3-b795-f42675fb0a75@rowland.harvard.edu>
 <d8aa2f1e-fc44-4bb9-8245-d6ac76047dc3@kernel-space.org>
 <9776c9fb-8fed-4e79-b312-0b1a872911b8@rowland.harvard.edu>
 <bcc4f76a-985b-4932-a455-b4fedcafcd97@rowland.harvard.edu>
 <20251201232911.s5diakt3w7ztzjv2@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201232911.s5diakt3w7ztzjv2@synopsys.com>

On Mon, Dec 01, 2025 at 11:29:14PM +0000, Thinh Nguyen wrote:
> On Fri, Nov 28, 2025, Alan Stern wrote:
> > This was wrong; I had forgotten that Get-Status requests are mostly 
> > handled by the UDC driver, not by the gadget drivers.  In your case, I 
> > guess that's dwc3?
> > 
> > In the current kernel, these requests are handled in 
> > drivers/usb/dwc3/ep0.c:dwc3_ep0_handle_status().  The problem is that 
> > this routine doesn't handle Get-Interface-Status requests at all; 
> > instead it passes them through to the composite core, which doesn't 
> > handle many of them either.  Other UDC drivers do a better job.
> > 
> > Fixing this should be pretty easy, but I'm not not an expert on dwc3.
> > The maintainer, Thinh Nguyen, will know what to do.
> > 
> 
> This is a known issue. Often, hosts don't send ClearFeature(halt_ep)
> unless there's a problem with a transfer. Back then, I had implemented
> such that ClearFeature request would trigger a dequeue outstanding
> requests from dwc3. It was to inter-op with Windows drivers for their
> handling of transaction errors. This was the wrong way to go about it. I
> recall after discussion with Alan and reviewing further that the
> recovery mechanism Windows UASP driver uses was forcing an overlapping
> command failure to trigger the function driver to dequeue requests (not
> coming from ClearFeature and dwc3).

Are we talking about the same thing?  Clear-Feature is different from 
Get-Interface-Status.

Alan Stern


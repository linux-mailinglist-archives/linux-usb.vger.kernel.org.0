Return-Path: <linux-usb+bounces-27545-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D73DB43E79
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 16:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A666A416B1
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 14:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277E8304BBC;
	Thu,  4 Sep 2025 14:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="mzH7wtM8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1B91E7C34
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 14:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756995561; cv=none; b=iI9DTvs6/2+3MQmJYUHNI84wDP37mtKB6xmeIRD2lS1QCxnHrP7JVg3XHicgDCdQ98taif/J592uRGSYaSAG/JIpEK+yGfo4SdRj9Y6rsBo/WY5yHZrdx2d2Z1vnDoE8bDffYdkpG0ANv9RnpTZ8yj7KhLH0Xb+JqV7CNKfHEhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756995561; c=relaxed/simple;
	bh=OhyqlkDXqAwyk3qIkBNkgdfcSlDgcq1z4qqf8YH4nGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEUE8XNbeuzTAXmW44ZDxvN3udU/aCC7ZC1YCVDhlZXQ8i8qCLjVY2/v18UoSIAB19gRP+/2uuFa4JcxPhgBwyGhTxnu/UMgdEvPDO4goqXvbNrTimx+NRTPgt2GTVNmu225Ndk4X1A+UGYYf9MUgvokBmtcTHzTmxX2kitDQkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=mzH7wtM8; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b38d4de61aso13703431cf.0
        for <linux-usb@vger.kernel.org>; Thu, 04 Sep 2025 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1756995559; x=1757600359; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=os668Zi3t9oEXy37ZDBT4QnlUqvdJGafqkWhoBmHyBw=;
        b=mzH7wtM8LRBpN8z2tf5AS/fsksHbsjzQd0Ni1fVRDngXOCz9reuYZ43ND4IRVtVqBM
         krKb/QWsGpkYlHuQ23VkAtPiI3jjIo1HOxPvnpCMHI1hdoRG/Qu51lZmCe0rwvrqm4up
         j2Emygcq11ldkiXnqNHF8nfOeclq7ezQN7Q+XLr9OaQ0ODs9zCGu/sXScXbuAId0TM7+
         csWGyvz3nw5a4Y8UNrSSkAYIZQNbcgnB3LuG47oQo288MHCDlyBRf8eA2OJIi18RcQ2q
         q9/TfyqIrlCQzP66GrmJZ2W5vwK5BVnP6bDqCX+ijO4AMvxc7+86Jyt75VG+sfGc5nxq
         DiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756995559; x=1757600359;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=os668Zi3t9oEXy37ZDBT4QnlUqvdJGafqkWhoBmHyBw=;
        b=FTCAeoloSLyxXLXPjTIraAf5u0i5dLlhjwgs4T74bxa6Qwfgr5krIi0Of0Q0npiWPw
         L7q7NgN45SaklCv6tmwQxsHlSLAdYRYlhcG2GjMf7K8jkXhVz3nElEPOjMn8RIRnbxig
         HumhKQMc/vKgilC5ifxzqIWdv4aaKe8Moro3aNT4lTYRRdZbKn4DCPKRCw+QmNfG3j2n
         A1vqgzWDd989OFntkKEJq0l7QCAIbXhxnjtxzGGahgqlOQQNKWIdgLfCjCMcHas64slz
         tlSu1cIjQNRfbBJhIQjZOXEDwGg+apnFIstklqXIb787hs8k9o9KWT/AN/pQDDimf3l+
         tVoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUW90ChgNGxnTeyQoTd/t79Zmu8eztQTp5qoMSO884qex1bVSDApqz7Qfx6s3VA/+IQtIgX/cvnXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YynpoDklVBNHdeXzT9c5TQnOuTLfD1NeK0DEeamrJbttiY7CDc5
	xlVUzHeJAynUjgXY6cHcFgb/QE0trf/VClpqE3kaQgwl4fn4JtbliHBI19P62IThXQ==
X-Gm-Gg: ASbGncv4+aN6bHUBxOdLn0T3KzJzfy7Fnw0Alz/H27XLabbHzOQCV/IqzQaMF0H8b/f
	2W1zC9Yf3nnm8WvjoOl31fbZOHB8dphlYcK0kHhSO2W1NxuJ6wxKM7HKNmckOOpkBP6fFJJWfGB
	NluhIhMMY3+nJpvGfRKDLMQjykXYgNjS+mMv83QIz5PlEADijblBeAxZBZbkexjO/q5z0FYBXEZ
	7UBAwA3YGtPYzI+JlSWfAbfUbn8TbekJB7sDHySw9yNzJI4DBZ8M/EwuOjEVaSMsR1AEX8/4ME3
	DXd/HFvRN3pe4x/Q4Fg0e7Gr3uRUlC8/g/ITqzewoyoS2A2702kzpAJBmUBcMAReQJAO+4IrLxz
	MyZwZoan6cZSPuQeclgHYYoG8CyHY02Pt1Hm8l1o47lM39adE
X-Google-Smtp-Source: AGHT+IH3d9KCd5699cMvzIImFFxxSmLhwFgLiEUFfrqOmZQE8LWgYxYeAUxsHZedzMXKyo1oAqRaaA==
X-Received: by 2002:a05:622a:4207:b0:4b0:7d41:1c15 with SMTP id d75a77b69052e-4b31d89e60fmr236236071cf.13.1756995558533;
        Thu, 04 Sep 2025 07:19:18 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80bdedfeaedsm214037085a.70.2025.09.04.07.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:19:17 -0700 (PDT)
Date: Thu, 4 Sep 2025 10:19:14 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	ryan zhou <ryanzhou54@gmail.com>, Roy Luo <royluo@google.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH] drvier: usb: dwc3: Fix runtime PM trying to activate
 child device xxx.dwc3 but parent is not active
Message-ID: <24a69e4d-2f10-43fb-81d4-f7eea44a6b8d@rowland.harvard.edu>
References: <20250829004312.5fw5jxj2gpft75nx@synopsys.com>
 <e3b5a026-fe08-4b7e-acd1-e78a88c5f59c@rowland.harvard.edu>
 <CAJZ5v0gwBvC-y0fgWLMCkKdd=wpXs2msf5HCFaXkc1HbRfhNsg@mail.gmail.com>
 <f8965cfe-de9a-439c-84e3-63da066aa74f@rowland.harvard.edu>
 <CAJZ5v0g9nip2KUs2hoa7yMMAow-WsS-4EYX6FvEbpRFw10C2wQ@mail.gmail.com>
 <CAJZ5v0gzFWW6roYTjUFeL2Tt8kKJ_g5Q=tp2=s87dy05x-Hvww@mail.gmail.com>
 <38b706cc-5966-4766-9165-51935fdcd790@rowland.harvard.edu>
 <CAJZ5v0h=i9XF_SQMOhz3P+4SAH3Qy-r1oUiiw7Bp=PcRnJjVbQ@mail.gmail.com>
 <59951c2d-60e8-47a8-a43c-00b92e095043@rowland.harvard.edu>
 <CAJZ5v0i6aFarDU8OTZ_3VS9dp4SaqKJ0SuiN4gFSxrRoAAV5CQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0i6aFarDU8OTZ_3VS9dp4SaqKJ0SuiN4gFSxrRoAAV5CQ@mail.gmail.com>

On Thu, Sep 04, 2025 at 04:08:47PM +0200, Rafael J. Wysocki wrote:
> On Wed, Sep 3, 2025 at 11:54 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Wed, Sep 03, 2025 at 09:30:47PM +0200, Rafael J. Wysocki wrote:
> > > I personally think that it would be reasonable to simply preserve
> > > device states in error paths unless they have been changed already
> > > before the error (or suspend abort due to a wakeup signal).
> >
> > The problem is complicated by the interaction between runtime-PM states
> > and system-sleep states.  In the case, we've been considering, B changes
> > from runtime-suspended to runtime-suspended + system-suspended.
> > Therefore the error path is allowed to modify B's state.
> 
> Yes, it is, but retaining the B's state in an error path is also fine
> so long as no changes have been made to it so far.
> 
> If B was runtime-suspended to start with and none of the suspend
> callbacks invoked for it so far has done anything to it, then it is de
> facto still runtime-suspended and its state need not be changed in an
> error path.
> 
> > > By this rule, B would be left in runtime suspend if it were still in
> > > runtime suspend when the error (or suspend abort in general) occurred
> > > and then it doesn't matter what happens to A.
> >
> > More fully, B would be changed from runtime-suspended + system-suspended
> > back to simply runtime-suspended.  Unfortunately, none of the PM
> > callbacks in the kernel are defined to make this change -- at least, not
> > without some cooperation from the driver.
> 
> Except when runtime-suspended + system-suspended is effectively the
> same as runtime-suspended.
> 
> Say this is not the case and say that the device is runtime-suspended
> to start with.  Then the "suspend" callback has two choices: either
> (1) it can runtime-resume the device before doing anything to it,
> which will also cause the device's parent and suppliers to
> runtime-resume, or (2) it can update the device's state without
> resuming it.
> 
> If it chooses (1), then "resume" is straightforward.  If it chooses
> (2), "resume" may just reverse the changes made by "suspend" and
> declare that the device is runtime-suspended.  And if it really really
> wants to resume the device then, why not call runtime_resume() on it?

That's what I meant by needing "cooperation from the driver".  The 
driver's ->resume callback needs to do this check to see which pathway 
to follow: (1) or (2).

I bet that right now almost none of the drivers in the kernel do 
anything like that.  I know that the USB drivers always follow (1) 
during ->resume, even if they followed (2) during suspend.  What do the 
PCI drivers do?

> > > The PM core can do something like that for the drivers opting in for
> > > runtime PM integration assistance, so to speak.  That is, drivers that
> > > point their ->suspend() and ->resume() callbacks to
> > > pm_runtime_force_suspend() and pm_runtime_force_resume(),
> > > respectively, or set DPM_FLAG_SMART_SUSPEND (or both at the same time
> > > which is now feasible).  Otherwise, it is hard to say what the
> > > expectations of the driver are and some code between the driver and
> > > the PM core may be involved (say, the PCI bus type).
> >
> > Setting DPM_FLAG_SMART_SUSPEND really does sound like the best answer.
> >
> > But there still should be some way the PM core can make resumes easier
> > for drivers that don't set the flag.  Something like: If the device is
> > in runtime suspend with SMART_SUSPEND clear, perform a runtime resume on
> > the device's parent (and anything else the device depends on) before
> > invoking ->resume.
> 
> Say that ->resume() does nothing to the device (because it is
> runtime-suspended and there's no need to resume it).  Why would the
> core resume the parent etc then?

You're right.  I'm just trying to figure out a way to fix this problem 
in general without the need for updating every driver in the kernel.  
Maybe that's not possible.  :-(

Alan Stern


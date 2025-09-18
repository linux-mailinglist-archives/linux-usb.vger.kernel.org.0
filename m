Return-Path: <linux-usb+bounces-27363-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 405C0B3B073
	for <lists+linux-usb@lfdr.de>; Fri, 29 Aug 2025 03:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55D7F1897852
	for <lists+linux-usb@lfdr.de>; Fri, 29 Aug 2025 01:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C171E32BE;
	Fri, 29 Aug 2025 01:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="dXOdN69+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62DE288A2
	for <linux-usb@vger.kernel.org>; Fri, 29 Aug 2025 01:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756430715; cv=none; b=gPY0n4RnaocRsNshCsxD4EF3otVtnlW4InCB7qwSzkKZC3bgXqJAATRi8kJAbLvKww0jXilRdmK5sKW5dGU1t4FIz7yWc/2YxyhuURMbOcGeHw4Xvj6vKT4+uIX+QSD9YU1vgbfV3KWw460jYCYa/eyLiAt5VGqpSZQNaVmk89Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756430715; c=relaxed/simple;
	bh=R7vjd0wBz6aMJy4yFCFQLfU8yYwPpDlaJtuLy0IbUOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAKB5R4cgq0fb1tD88zQv7xCstPse9HIFw7TM8iwK/nBHyUCnuMIGjIhx7/FEhJOvWXRSld50dNuLsG6n8Tdhnh7A7DF+NT15j2Nbv3sic17T82x5fybKDy5CPPoqh/N5OkXVndPgN1/JvufcuoGV73eiFY01udyIWzJ2evk6so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=dXOdN69+; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b2979628f9so16264131cf.2
        for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 18:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1756430713; x=1757035513; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F1wIkigKDgiJC+Jf5G0D/QH1Jb94/jY8JZZUei/RI90=;
        b=dXOdN69+AVOW4Aq6phzLIF4f+E8QXu0FTgHXd8lH2DOyeUQXQs0MgGr1HmcaI6lxk4
         H91yxneG4SLvCEErWJDHrjacukspDlf/YpvgpkuKYgR/2RDop88r/i5mmb6IhRUkww0n
         ba6F6KWKRn8jXaVO4IE5HChfEeXh/Tsi366a4/ucP32MVBPbBbGKEIyCiAkzb+GLu9ij
         5eoJYJpJ43k1xmyjFIX73ScRrAnRDg+YBJIYc1Sq+SRVrux+NE0WrcWDZNhir5TpAQtN
         RywNzH69bqLsWBwr7WCyO8C1v/hXLi/yjXQytj6XSqpf+D+UPQmNutWJX6GON3DwGI33
         RmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756430713; x=1757035513;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F1wIkigKDgiJC+Jf5G0D/QH1Jb94/jY8JZZUei/RI90=;
        b=lYCFipvP3hANAymTbSM9EPbtJ1yvwJwUzmxMj4tNKst9ydy+1xz69BMqQG0a5BSQJU
         yLYYtbuEdIa0yFUG7s3+Z+ZMasPVvhhuzb2Dn+KFaTV6TU8tX5I/P0lD2+O6H9Yq3y/1
         l220mrQnvGWysw27QpXorj4HQwgbN2JK1oO7fmkmomWfM+JaJ6oLmay7paQsEUR5+z7r
         Q1bYxzMVmWwrYo0JLvl6ddvD44KyWF/hwxFh4On/xF7kqmtgQvyqjXxEcQhZ2ZM61d9w
         0BWz/QuSmhihdeKwg8NfRJDkhV7gCb2vVet8kQvbszPZRdu+pf9xRdLcN/0lQjT0Lfcb
         WojA==
X-Forwarded-Encrypted: i=1; AJvYcCWms6cUSVfcZodBq1AST6ytaZ9s+XRKeGG1+JRNSO9OT6iI0BW2oNAY2gpOwHPQwsnz6eBuYjddevU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhb5dFSO4iiDx+qUBuYa6j6kJOn7ePLZiPa197GNuG9TmWqr5q
	T2STLZPV51EB224wjVwxBHDctYx+sd9VHoHQ64QA8IW3T1HxW4QHhK3DeVW5m1ugGQ==
X-Gm-Gg: ASbGncvVQgfjSYoEAQQDRTQ49VXRC7jvk2KxHv8xPrLTmLc57BJEkaByOpqR7HfcN3b
	cxrb9BmE3OZQb1MPItCz2ClA3DTP1NByE5SmNCmr8DX0rCyzCZ1M7BNXm6fP1jv5RwnEZ3Xqsyx
	6/k78CzhvQBe1vwL/kAQEKB6xTJJIibvduFwn8OsaZHck9GJJXg2mvrP6vmFcHOtlTAu148en0g
	ENigvd2HhrD6LXfKgsMpEUdfOUSQ1rHjvJilgbRE5ACFDwtV+JjoE3gU/oImS5W56Dt0qCp4EUA
	WgFAVzi4LAA67MLRDVf4AwNALGVEPUt3Q9RbSz9x+7haF4/5FdMlCSyRGxI3hY7Hmms5YqryEe/
	oQREmAeKH2UUkdQvlkINaQthppTuIjmMzPJrqAPSB
X-Google-Smtp-Source: AGHT+IHIoeiHIXravgkhAkWNHbKj4hqY+RfdsgMzDsXdZJC2XOL96Dya9HG3awMsdODJ7/4pobbnzQ==
X-Received: by 2002:a05:622a:248c:b0:4b0:eb79:931d with SMTP id d75a77b69052e-4b2aaa561b3mr319454961cf.2.1756430712871;
        Thu, 28 Aug 2025 18:25:12 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::fd35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b30b55504fsm7357811cf.15.2025.08.28.18.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 18:25:12 -0700 (PDT)
Date: Thu, 28 Aug 2025 21:25:09 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	ryan zhou <ryanzhou54@gmail.com>, Roy Luo <royluo@google.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH] drvier: usb: dwc3: Fix runtime PM trying to activate
 child device xxx.dwc3 but parent is not active
Message-ID: <e3b5a026-fe08-4b7e-acd1-e78a88c5f59c@rowland.harvard.edu>
References: <20250826150826.11096-1-ryanzhou54@gmail.com>
 <CA+zupgwnbt=5Oh28Chco=YNt9WwKzi2J+0hQ04nqyZG_7WUAYg@mail.gmail.com>
 <CAPwe5RMpdG1ziRAwDhqkxuzHX0x=SdFQRFUbPCVuir1OgE90YQ@mail.gmail.com>
 <5d692b81-6f58-4e86-9cb0-ede69a09d799@rowland.harvard.edu>
 <CAJZ5v0jQpQjfU5YCDbfdsJNV=6XWD=PyazGC3JykJVdEX3hQ2Q@mail.gmail.com>
 <20250829004312.5fw5jxj2gpft75nx@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250829004312.5fw5jxj2gpft75nx@synopsys.com>

On Fri, Aug 29, 2025 at 12:43:17AM +0000, Thinh Nguyen wrote:
> On Wed, Aug 27, 2025, Rafael J. Wysocki wrote:
> > On Wed, Aug 27, 2025 at 4:52 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > Ryan:
> > >
> > > You should present your questions to the maintainer of the kernel's
> > > Power Management subsystem, Rafael Wysocki (added to the To: list for
> > > this email).
> > 
> > Thanks Alan!
> > 
> > 
> > > On Wed, Aug 27, 2025 at 10:09:10PM +0800, ryan zhou wrote:
> > > > Hi Roy,
> > > > Thank you for reviewing my patch.
> > > > >
> > > > > Wouldn't the parent glue dev already resume before resuming the child dwc3?
> > > > >
> > > > No, in the following case, the parent device will not be reviewed
> > > > before resuming the child device.
> > > > Taking the 'imx8mp-dwc3' driver as an example.
> > > > Step 1.usb disconnect trigger: the child device dwc3 enter runtime
> > > > suspend state firstly, followed by
> > > > the parent device imx8mp-dwc3 enters runtime suspend
> > > > flow:dwc3_runtime_suspend->dwc3_imx8mp_runtime_suspend
> > > > Step2.system deep trigger:consistent with the runtime suspend flow,
> > > > child enters pm suspend and followed
> > > > by parent
> > > > flow: dwc3_pm_suspend->dwc3_imx8mp_pm_suspend
> > > > Step3: After dwc3_pm_suspend, and before dwc3_imx8mp_pm_suspend, a
> > > > task terminated the system suspend process
> > > > . The system will resume from the checkpoint, and resume devices in
> > > > the suspended state in the reverse
> > > > of pm suspend, but excluding the parent device imx8mp-dwc3 since it
> > > > did not execute the suspend process.
> > > >
> > > > >
> > > > >Why would 'runtime PM trying to activate child device xxx.dwc3 but parent is not active' happen in the first place?
> > > > >
> > > > Following the above analysis, dwc3_resume calls
> > 
> > I assume that dwc3_pm_resume() is meant here.
> > 
> > > > pm_runtime_set_active(dev), it checks the
> > > > parent.power->runtime_status is not RPM_ACTIVE and outputs the error log.
> > 
> > And it does so because enabling runtime PM for the child with
> > runtime_status == RPM_ACTIVE does not make sense when the parent has
> > runtime PM enabled and its status is not RPM_ACTIVE.
> > 
> > It looks like the runtime PM status of the parent is not as expected,
> 
> So is the scenario Ryan brought up unexpected? What are we missing here
> and where should the fix be in?
> 
> > but quite frankly I don't quite follow the logic in dwc3_pm_resume().
> > 
> > Why does it disable runtime PM just for the duration of
> > dwc3_resume_common()?  If runtime PM is functional before the
> > pm_runtime_disable() call in dwc3_pm_resume(), the device may as well
> > be resumed by calling pm_runtime_resume() on it without disabling
> > runtime PM.  In turn, if runtime PM is not functional at that point,
> > it should not be enabled.
> 
> Base on git-blame, I hope this will answer your question:
> 
>     68c26fe58182 ("usb: dwc3: set pm runtime active before resume common")
> 
>     For device mode, if PM runtime autosuspend feature enabled, the
>     runtime power status of dwc3 may be suspended when run dwc3_resume(),
>     and dwc3 gadget would not be configured in dwc3_gadget_run_stop().
>     It would cause gadget connected failed if USB cable has been plugged
>     before PM resume. So move forward pm_runtime_set_active() to fix it.
> 
> 
> In certain platforms, they probably need the phy to be active to perform
> dwc3_resume_common().

It sounds like the real question is how we should deal with an 
interrupted system suspend.  Suppose parent device A and child device B 
are both in runtime suspend when a system sleep transition begins.  The 
PM core invokes the ->suspend callback of B (and let's say the callback 
doesn't need to do anything because B is already suspended with the 
appropriate wakeup setting).

But then before the PM core invokes the ->suspend callback of A, the 
system sleep transition is cancelled.  So the PM core goes through the 
device tree from parents to children, invoking the ->resume callback for 
all the devices whose ->suspend callback was called earlier.  Thus, A's 
->resume is skipped because A's ->suspend wasn't called, but B's 
->resume callback _is_ invoked.  This callback fails, because it can't 
resume B while A is still in runtime suspend.

The same problem arises if A isn't a parent of B but there is a PM 
dependency from B to A.

It's been so long since I worked on the system suspend code that I don't 
remember how we decided to handle this scenario.

Alan Stern


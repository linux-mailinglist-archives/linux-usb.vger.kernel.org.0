Return-Path: <linux-usb+bounces-14128-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1F895F56D
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 17:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39326B21BDD
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 15:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3F81946A2;
	Mon, 26 Aug 2024 15:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Vh8H+ftH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C295194096
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 15:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724686987; cv=none; b=mSQPw1mc7LZ2TC8HcyGIrIn2TGRZXnUPTqKVA6Be5XkR0gBVOOv1B89tXbY2f6S1cfCPjSTaMEqAzV5ALUCpSwCiJs+VUDfr9XHWHgvx4VSICcIlxiVtYVcX1BurTgt+KU5p2HvRdk2U7qYWUIsiz3XYTE6GFs8MjHCtqG23J0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724686987; c=relaxed/simple;
	bh=Y1MWjJgVWPA3HWnRpA5bjVr87aPr6F48YDVRmpaPeaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d18CjClmP/yaeDwL259Z1ldD1CFQyma/UvDXq3LBvqFtRrqGs03/3V6LD62Z3IgLgN1THNcKAWz8k29/CVrJuoeZfCbDvOSlDilQErJhrwh3CQW5dQkAtHw1/GVoz/f7lc4NEbf4Snndcdrub1a6A1CCBZ+p0JmScHaWb1s7o1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Vh8H+ftH; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-45006bcb482so22385161cf.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 08:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1724686983; x=1725291783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yP4Fw/lMMClOSx02WHfgPFt+EBlGP0U2oDKxLWoWZtU=;
        b=Vh8H+ftHwSpEbe2JD75yP831cv+/rUHoB/2xuhwpL9zkJ3RmXzNbBfInz+OY2s/616
         F17BxAwYFL/gFMAY2H3jdrvGwYkmDYJkHoMtKqUiUXduMI5bMANXHQn1Qq/Euy9sHiEv
         mmFe1M1CIU207kBvicBQay1LKg8WQR3E+fLD9oyRCwNiqIKO/2FmGWDgV6gRMZ3GFJ2c
         F4vktV6IWNxEF1LnpKS8wdsD1cg1qOB2EcMKmTuWy+uIdcg8yFKc9Q7CYbpb/3y2C1qt
         NAMv+mvLrPf1lORlXaWeXCKo1InSr4NApIWnm/lIOylojRqFzWAl0bxFlL7IO0A88/FY
         RoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724686983; x=1725291783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yP4Fw/lMMClOSx02WHfgPFt+EBlGP0U2oDKxLWoWZtU=;
        b=IIMufOep8FK/KH9GaQYNUlaN7HXXbFMR+npYRtZrOdQnBv3jaeuE6KAscJ2fag5Wy0
         MFwedl5yfTK8F+tiByZIAvGAo6PDrvC/ledhMe2r2g7DznvUWf2IxtJl8tNKpQF0fo4A
         /KsVpOt5WM76TWQiWlDdcRoFAmQE8Elgtlyg0Ulm0wC89YjZ1DvWfjP35T29TJADY2BV
         QCue1ZiLM56iit1joHmuGBFUq3l7uqptz9fQ/7yUOTqytOD8ImsYtN37vL2RlbUZCFuk
         QrxfBddPOMhVQS62KOX68V60+2olcy+cFH6kPyqA1zIsvXBOqKl+0BKaThcpHZISaSua
         ywwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd7QNkqJO03Haxe0CiNXMbq9rXhEamBwPGANSzGv7IQTH2LdSPhKL4ESHtmzp0sHu9bjWdvQJePGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwL9r7k8OkHuxsOL2E2DjpVGVQSDAlWVm0xlTz6HyJRaxgu+2T
	2d42urHci4Mm3eANdCE5KsfFyxJoPmyDJKisehSObKz63OTiZV/h3iDKFZ/8ZQ==
X-Google-Smtp-Source: AGHT+IFwV8p413g5+5hIWLDjV4l8fIiqXTk+f4Q0QVc5D9QSE14Dcyc4aw1/2HSLEYL592tN+kGS3Q==
X-Received: by 2002:a05:622a:1bac:b0:454:e80f:1457 with SMTP id d75a77b69052e-455095f1c4dmr105372841cf.12.1724686983166;
        Mon, 26 Aug 2024 08:43:03 -0700 (PDT)
Received: from rowland.harvard.edu (wrls-249-137-9.wrls-client.fas.harvard.edu. [140.247.12.9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-454fdfc097csm44414501cf.12.2024.08.26.08.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 08:43:02 -0700 (PDT)
Date: Mon, 26 Aug 2024 11:42:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: WangYuli <wangyuli@uniontech.com>, leoliu-oc@zhaoxin.com,
	dlemoal@kernel.org, arnd@kernel.org, schnelle@linux.ibm.com,
	WeitaoWang-oc@zhaoxin.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, mathias.nyman@linux.intel.com,
	ulf.hansson@linaro.org, vkoul@kernel.org, hslester96@gmail.com,
	Carsten_Schmid@mentor.com, efremov@linux.com, tonywwang@zhaoxin.com,
	weitaowang@zhaoxin.com, CobeChen@zhaoxin.com, TimGuo@zhaoxin.com,
	wwt8723@163.com, alex.williamson@redhat.com,
	guanwentao@uniontech.com, xuerpeng@uniontech.com
Subject: Re: [PATCH v2] USB: Fix kernel NULL pointer when unbind UHCI form
 vfio-pci
Message-ID: <88f2c959-7b88-4d97-81a4-11902dddd19a@rowland.harvard.edu>
References: <42A38D045199FD79+20240826085455.1525536-1-wangyuli@uniontech.com>
 <2024082631-resort-stays-b065@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024082631-resort-stays-b065@gregkh>

All right, I see what's going on...

On Mon, Aug 26, 2024 at 11:30:14AM +0200, Greg KH wrote:
> On Mon, Aug 26, 2024 at 04:54:55PM +0800, WangYuli wrote:
> > From: leoliu-oc <leoliu-oc@zhaoxin.com>
> > 
> > This bug is found in Zhaoxin platform, but it's a commom code bug.
> 
> To be fair, this is not a normal "common" code path at all :)
> 
> > 
> > Fail sequence:
> > step1: Unbind UHCI controller from native driver;
> 
> First off, you all know this is really an "unsupported" thing to do.  I
> love it how the vfio people abuse this interface for their main code
> path, but remember that is NEVER what it was designed for at all.  The
> fact that it could possibly work at all is a miracle and everyone gets
> lucky if nothing dies when they attempt to manually do the gyrations you
> are doing here.

Still, it would be good to support this properly.

The big assumption in hcd-pci.c has always been that if a UHCI device is 
bound to a driver, then that driver must be uhci-hcd.  That assumption 
is no longer true here, because now the driver could be vfio-pci 
instead.

> > step2: Bind UHCI controller to vfio-pci, which will put UHCI controller in
> > 	   one vfio group's device list and set UHCI's dev->driver_data to
> > 	   struct vfio-pci(for UHCI)
> 
> Who sets the driver_data here?

The vfio-pci driver does.  Since it's a PCI virtualization driver, it 
doesn't behave like a normal USB host controller driver and it doesn't 
set the drvdata to point to the hcd structure.

> > step3: Unbind EHCI controller from native driver, will try to tell UHCI
> > 	   native driver that "I'm removed by set
> > 	   companion_hcd->self.hs_companion to NULL. However, companion_hcd
> > 	   get from UHCI's dev->driver_data that has modified by vfio-pci
> > 	   already. So, the vfio-pci structure will be damaged!
> 
> Damaged how?  Attempting to assign random PCI drivers to the vfio-pci
> driver is again, really really not supported (despite what the vfio
> authors think), so again, it's amazing this works, as you are finding
> out.

A partial workaround for this problem might be to do steps 2 and 3 in 
the opposite order: unbind both controllers (UHCI, then EHCI) and 
afterwards bind both controllers (EHCI, then UHCI).  Then nothing would 
get damaged.

> > step4: Bind EHCI controller to vfio-pci driver, which will put EHCI
> > 	   controller in the same vfio group as UHCI controller;
> >        ... ...
> > step5: Unbind UHCI controller from vfio-pci, which will delete UHCI from
> > 	   vfio group device list that has been damaged in step 3. So, delete
> > 	   operation can random result into a NULL pointer dereference with
> > 	   the below stack dump.
> > step6: Bind UHCI controller to native driver;
> > step7: Unbind EHCI controller from vfio-pci, which will try to remove EHCI
> > 	   controller from the vfio group;
> > step8: Bind EHCI controller to native driver;

Likewise, do both unbind operations first and afterwards do both the 
bind operations.  However, that might not be enough to solve the problem 
here.

> That's crazy, why would you be doing all of that in the first place?  Is
> it common to add host controller drivers to virtual machines like this?
> Why not just use usbip instead?
> 
> > [  929.114641] uhci_hcd 0000:00:10.0: remove, state 1
> > [  929.114652] usb usb1: USB disconnect, device number 1
> > [  929.114655] usb 1-1: USB disconnect, device number 2
> > [  929.270313] usb 1-2: USB disconnect, device number 3
> > [  929.318404] uhci_hcd 0000:00:10.0: USB bus 1 deregistered
> > [  929.343029] uhci_hcd 0000:00:10.1: remove, state 4
> > [  929.343045] usb usb3: USB disconnect, device number 1
> > [  929.343685] uhci_hcd 0000:00:10.1: USB bus 3 deregistered
> > [  929.369087] ehci-pci 0000:00:10.7: remove, state 4
> > [  929.369102] usb usb4: USB disconnect, device number 1
> > [  929.370325] ehci-pci 0000:00:10.7: USB bus 4 deregistered
> > [  932.398494] BUG: unable to handle kernel NULL pointer dereference at 0000000000000000
> > [  932.398496] PGD 42a67d067 P4D 42a67d067 PUD 42a65f067 PMD 0
> > [  932.398502] Oops: 0002 [#2] SMP NOPTI
> > [  932.398505] CPU: 2 PID: 7824 Comm: vfio_unbind.sh Tainted: P   D  4.19.65-2020051917-rainos #1
> 
> Note, this is a very old kernel, and one that has closed source in it
> making it such that none of us can debug it at all.
> 
> And are you sure this happens on 6.10?
> 
> > diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
> > index a08f3f228e6d..5a63d7a772ae 100644
> > --- a/drivers/usb/core/hcd-pci.c
> > +++ b/drivers/usb/core/hcd-pci.c
> > @@ -48,6 +48,7 @@ static void for_each_companion(struct pci_dev *pdev, struct usb_hcd *hcd,
> >  	struct pci_dev		*companion;
> >  	struct usb_hcd		*companion_hcd;
> >  	unsigned int		slot = PCI_SLOT(pdev->devfn);
> > +	struct pci_driver	*drv;
> >  
> >  	/*
> >  	 * Iterate through other PCI functions in the same slot.
> > @@ -60,6 +61,13 @@ static void for_each_companion(struct pci_dev *pdev, struct usb_hcd *hcd,
> >  				PCI_SLOT(companion->devfn) != slot)
> >  			continue;
> >  
> > +		drv = companion->driver;
> > +		if (drv &&
> > +		    strncmp(drv->name, "uhci_hcd", sizeof("uhci_hcd") - 1) &&
> > +		    strncmp(drv->name, "ohci-pci", sizeof("ohci-pci") - 1) &&
> > +		    strncmp(drv->name, "ehci-pci", sizeof("ehci-pci") - 1))
> 
> Attempting to rely on kernel module names within kernel code just is not
> going to work, sorry.
> 
> What exactly are you trying to do here?  Please at least comment it.

It definitely should be commented.  The idea here is to verify the 
assumption mentioned earlier, namely, to find out whether the driver 
bound to this UHCI device really is uhci-hcd.  Testing the driver's 
name is a pretty ad-hoc way of doing it, but I can't think of anything 
better.

However, this check really should be done later, after determining 
whether the companion device is a UHCI, OHCI, or EHCI host controller.  
Then only one comparison would be needed in each case.

> > +			continue;
> 
> Do you just want to fail the binding?  If so, why?  And what is
> precenting a driver to be bound after you do the check?

This won't cause the binding to fail; it will merely skip calling the 
notification function.

Races are prevented by the companions_rwsem in hcd-pci.c.  It is held 
whenever for_each_companion() gets called.

> > +
> >  		/*
> >  		 * Companion device should be either UHCI,OHCI or EHCI host
> >  		 * controller, otherwise skip.
> 
> Why doesn't this check suffice?

The question WangYuli wants to answer isn't whether the companion device 
is UHCI, OHCI, or EHCI.  Rather, it is whether the companion device is 
bound to the uhci-hcd (or ohci-pci or ehci-pci) driver -- as opposed to 
the vfio-pci driver.

Alan Stern


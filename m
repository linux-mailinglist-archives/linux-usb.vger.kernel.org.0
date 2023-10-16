Return-Path: <linux-usb+bounces-1702-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CC07CB34D
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 21:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF7742816D7
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 19:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA876341B1;
	Mon, 16 Oct 2023 19:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D59B34197
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 19:23:40 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id DE16B83
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 12:23:38 -0700 (PDT)
Received: (qmail 154609 invoked by uid 1000); 16 Oct 2023 15:23:38 -0400
Date: Mon, 16 Oct 2023 15:23:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Li, Meng" <Meng.Li@windriver.com>, Ingo Molnar <mingo@redhat.com>,
  USB mailing list <linux-usb@vger.kernel.org>,
  Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
  linux-rt-users <linux-rt-users@vger.kernel.org>
Subject: Re: USB: add check to detect host controller hardware removal
Message-ID: <62fdcf97-11c6-4dee-8db1-74752d6949f3@rowland.harvard.edu>
References: <PH0PR11MB5191464B2F01511D2ADECB3BF1D2A@PH0PR11MB5191.namprd11.prod.outlook.com>
 <9a1074e2-c1ae-485b-b5e7-a34442c98c0b@rowland.harvard.edu>
 <20231016125624.1096766a@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016125624.1096766a@gandalf.local.home>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 16, 2023 at 12:56:24PM -0400, Steven Rostedt wrote:
> On Fri, 13 Oct 2023 13:17:52 -0400
> Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> > --- a/drivers/usb/core/hcd-pci.c
> > +++ b/drivers/usb/core/hcd-pci.c
> > @@ -292,6 +292,14 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
> >         if (!hcd)
> >                 return;
> >  
> > +       /* Fake an interrupt request in order to give the driver a chance
> > +        * to test whether the controller hardware has been removed (e.g.,
> > +        * cardbus physical eject).
> > +        */
> > +       local_irq_disable();
> > +       usb_hcd_irq(0, hcd);
> > +       local_irq_enable();
> > +
> >         usb_remove_hcd(hcd);
> >         if (hcd->driver->flags & HCD_MEMORY) {
> >                 iounmap(hcd->regs);
> > 
> > The local_irq_disable() is there so that the irq handler will be invoked 
> > in the state that it expects (i.e., with interrupts disabled).  
> > Apparently Meng's RT kernel doesn't like it when the handler then 
> > calls spin_lock(); I don't know why.
> 
> Because in RT, spin_lock()s are actually mutexes.
> 
> In RT, interrupt handlers do not even run with interrupts disabled (they
> run as threads), so the assumption that they run with interrupts disabled
> on RT is incorrect. One hack would simply be:
> 
> 	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> 		local_irq_disable();
> 	usb_hcd_irq(0, hcd);
> 	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> 		local_irq_enable();
> 
> But that's rather ugly. We use to have that as a wrapper of just:
> 
> 	local_irq_disable_nort();
> 
> but I don't know if we removed that or not.
> 
> Sebastian?

Thanks for the information.  I guess a simple approach would be to add 
the wrapper back in, since it's not present in the current kernel.

Alan Stern


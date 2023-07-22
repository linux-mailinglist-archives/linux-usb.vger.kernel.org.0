Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC10C75DD37
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jul 2023 17:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbjGVP1b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Jul 2023 11:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjGVP12 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Jul 2023 11:27:28 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id B04DF2733
        for <linux-usb@vger.kernel.org>; Sat, 22 Jul 2023 08:27:25 -0700 (PDT)
Received: (qmail 1790072 invoked by uid 1000); 22 Jul 2023 11:27:24 -0400
Date:   Sat, 22 Jul 2023 11:27:24 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Avichal Rakesh <arakesh@google.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Badhri Jagan Sridharan <badhri@google.com>,
        "Eino-Ville Talvala \(Eddy\)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Kernel panic when unbinding UVC gadget function
Message-ID: <8242fba3-ebcc-481e-92bb-e25a3516853a@rowland.harvard.edu>
References: <4d7aa3f4-22d9-9f5a-3d70-1bd7148ff4ba@google.com>
 <8de4bb54-8daa-73c0-b5eb-4aa4b9675ce5@ideasonboard.com>
 <fa11d883-2c72-486f-9b7b-46f238e2e03f@rowland.harvard.edu>
 <CAMHf4WJ4QyvFfnAWSk_D3VuPOe7+if=pgQvunjLXOHTcBgi4Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMHf4WJ4QyvFfnAWSk_D3VuPOe7+if=pgQvunjLXOHTcBgi4Qw@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 21, 2023 at 03:44:52PM -0700, Avichal Rakesh wrote:
> Thank you both, Dan and Alan, for your comments!
> 
> On Fri, Jul 21, 2023 at 12:32 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Fri, Jul 21, 2023 at 04:57:51PM +0100, Dan Scally wrote:
> > > Hi Avichal - thanks for all the detail
> > >
> > > > A dirty Patch for option 2 is attached below which skips calling
> > > > usb_function_deactivate if uvc_function_disable was called before. It seems
> > > > to work okay in testing. Let me know if the analysis and solutions seems okay
> > > > and I can upload a formal patch.
> > >
> > >
> > > For what it's worth the analysis makes sense; the patch looks ok to me so if
> > > the conclusion is to fix the problem that way I think it's fine, but I'm
> > > more inclined to consider this a locking problem in core - it'd be better to
> > > fix it there I think.
> >
> > I'm not so sure that handling this in the core is feasible.  Removing
> > the driver obviously needs to be synchronized with deactivation, since
> > the two actions affect the same parts of the state (i.e., the pull-ups
> > and the "connected" flag).
> 
> I don't have the full context on what caused the locking to be added,
> but now that it
> in place, it seems like there needs to be a clarification of
> expectation between core
> and the gadget drivers. Is it valid for the gadget drivers to call
> usb_gadget_deactivate (and similar functions) as a part of disable/unbind
> (in terms of API/expectations)?
> 
> 1. If yes, maybe core can track when it is in the middle of resetting and
> drop calls to usb_gadget_deactivate if called in the middle of the
> disconnect--->unbind sequence. This is effectively what the patch above
> does in UVC driver, but core might (with some extra state) have stronger
> guarantees of when a call is redundant and can be safely dropped.
> 
> 2. If no, then it becomes the gadget's responsibility to ensure that it doesn't
> call any of the usb_gadget_* functions when disabling/unbinding. However, it
> does require core to provide some concrete rules around when things are safe
> to call, and when they aren't.
> 
> >
> > Consequently I don't see how to avoid a deadlock if the driver's unbind
> > callback does a deactivate.  Besides, as the patch mentions, doing so is
> > never necessary.
> >
> > However, even with that call removed we could still have a problem.  I
> > don't know much about how the UVC function driver works, but it would be
> > reasonable for the driver to have a private mutex that gets held both
> > during unbind and when the user application closes the V4L2 node.  Then
> > there's an ABBA locking issue:
> >
> >         Unbind: The UDC core holds connect_lock while calling the UVC
> >         unbind handler, which needs to acquire the private mutex.
> >
> >         Close node: The UVC driver holds the private mutex while doing
> >         a deactivate, which needs to acquire connect_lock.
> >
> > Any ideas on how to clear this up?
> >
> 
> I think my question above gives us two options out based on the answer:
> 
> 1. Core handling redundant calls is the more bullet-proof solution IMO. It
> means that the gadget driver never holds connect_lock when it shouldn't.
> No more ABBA!
> 
> One potential implementation is to track when core is resetting in a protected
> flag. All functions related to resetting/disconnecting would check the
> flag before
> locking connect_lock and would become no-ops if gadget is in the middle of
> resetting.
> 
> 2. Some stronger guarantees will let the gadget driver's state machine decide
> if it can call usb_gadget_* functions. For example, if we can say for sure that
> disable call will always be followed by the unbind call, and that usb_gadget_*
> functions are disallowed between the two, then UVC driver can handle ABBA
> situation by tracking when it is between a disable and unbind call and skip
> calling usb_gadget_* function until unbind finishes.
> 
> The downside of (2), is that a poorly written (or malicious) gadget driver can
> grind the gadget to a halt with a somewhat simple deadlock.
> 
> Unfortunately, I am travelling over the next week, but I'll try to
> create and attach
> a dirty patch for core to handle redundant calls to usb_gadget_* over the next
> week.
> 
> I am fairly new and don't know the full semantics around core, so if I
> am missing
> something simple here, please do let me know!

Here's a proposal, along the lines of your first suggestion above.  The 
idea is to avoid holding the connect_lock mutex while invoking a gadget 
driver's callbacks.

Unfortunately, this is unavoidable in the case of the ->disconnect() 
callback, but that's okay because the kerneldoc already says that 
->disconnect() may be called in_interrupt, so it's not allowed to call 
any core routines that may sleep.  Just to make this perfectly clear, 
the patch adds a couple of comments along these lines.

As far as I can tell, there is no real reason to hold connect_lock 
during the ->unbind() callback.  Not doing so should fix the problem in 
the UVC function driver.

Let me know if this works.

Alan Stern



 drivers/usb/gadget/udc/core.c |    9 +++++++++
 1 file changed, 9 insertions(+)

Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -822,6 +822,9 @@ EXPORT_SYMBOL_GPL(usb_gadget_disconnect)
  * usb_gadget_activate() is called.  For example, user mode components may
  * need to be activated before the system can talk to hosts.
  *
+ * This routine may sleep; it must not be called in interrupt context
+ * (such as from within a gadget driver's disconnect() callback).
+ *
  * Returns zero on success, else negative errno.
  */
 int usb_gadget_deactivate(struct usb_gadget *gadget)
@@ -860,6 +863,8 @@ EXPORT_SYMBOL_GPL(usb_gadget_deactivate)
  * This routine activates gadget which was previously deactivated with
  * usb_gadget_deactivate() call. It calls usb_gadget_connect() if needed.
  *
+ * This routine may sleep; it must not be called in interrupt context.
+ *
  * Returns zero on success, else negative errno.
  */
 int usb_gadget_activate(struct usb_gadget *gadget)
@@ -1639,7 +1644,11 @@ static void gadget_unbind_driver(struct
 	usb_gadget_disable_async_callbacks(udc);
 	if (gadget->irq)
 		synchronize_irq(gadget->irq);
+	mutex_unlock(&udc->connect_lock);
+
 	udc->driver->unbind(gadget);
+
+	mutex_lock(&udc->connect_lock);
 	usb_gadget_udc_stop_locked(udc);
 	mutex_unlock(&udc->connect_lock);
 


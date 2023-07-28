Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30681767760
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jul 2023 23:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbjG1VDL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jul 2023 17:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233279AbjG1VDK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jul 2023 17:03:10 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C79ED449E
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 14:03:08 -0700 (PDT)
Received: (qmail 51440 invoked by uid 1000); 28 Jul 2023 17:03:08 -0400
Date:   Fri, 28 Jul 2023 17:03:08 -0400
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
Message-ID: <fe501805-2eec-4cd1-be61-ad446002af9c@rowland.harvard.edu>
References: <4d7aa3f4-22d9-9f5a-3d70-1bd7148ff4ba@google.com>
 <8de4bb54-8daa-73c0-b5eb-4aa4b9675ce5@ideasonboard.com>
 <fa11d883-2c72-486f-9b7b-46f238e2e03f@rowland.harvard.edu>
 <CAMHf4WJ4QyvFfnAWSk_D3VuPOe7+if=pgQvunjLXOHTcBgi4Qw@mail.gmail.com>
 <8242fba3-ebcc-481e-92bb-e25a3516853a@rowland.harvard.edu>
 <CAMHf4W+d1P8_Ahgc=Wj5K7BJa2Oi+cfXozd8e0_cdzioAjHeBg@mail.gmail.com>
 <7a71a4c9-324e-44a9-b38b-31ea87d60e6e@rowland.harvard.edu>
 <b55b51b3-7632-4ba5-b4fc-ea0384321149@rowland.harvard.edu>
 <CAMHf4WL8jWhkeDsLpH1z9sXi4-42+WExtCeJWjXNKy9R85oJQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMHf4WL8jWhkeDsLpH1z9sXi4-42+WExtCeJWjXNKy9R85oJQg@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 28, 2023 at 11:41:19PM +0530, Avichal Rakesh wrote:
> On Fri, Jul 28, 2023 at 9:07 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > It's not clear that the patch will fix the problem entirely.  Your
> > original analysis of the bug stated:
> >
> > > This means that attempting to unregister the UVC Gadget Driver results in the
> > > V4L2 resource cleanup being stuck behind udc->connect_lock, which will only
> > > be released after uvc_function_unbind finishes. This results in either the
> > > gadget deactivating after the unbind process has finished, or in a Kernel Panic
> > > as it tries to cleanup a V4L2 node that has been purged.
> >
> > My patch removes the locking issue.  But if an execution path can
> > occur with a lock present, it can also occur when the lock has been
> > removed.  That means it may still be possible for the UVC gadget driver
> > to try deactivating the UDC after the unbind process has finished or for
> > it to try cleaning up a V4L2 node that has been purged.
> >
> > If either of those really could have happened (as opposed to just
> > getting stuck in a deadlock, waiting for a mutex that would never be
> > released), then it can still happen with the patch.  Fixing them would
> > require changes to the UVC gadget driver.  So the problem may not be
> > gone entirely.
> >
> The current situation can theoretically happen without the deadlock,
> yes, but shouldn't happen in practice. UVC's disable/unbind code flow
> looks as follows:
> 
> 1. When disable callback is called, the gadget driver signals the
> userspace application to close the V4L2 node.
> 2. Closing the V4L2 node calls the release callback to clean up
> resources. It is this callback that calls into gadget_deactivate and
> gets blocked currently (without your patch).
> 3. Separately, the unbind callback waits on release callback to finish
> for 500ms, assuming the userspace application to behave well and close
> the node in a reasonable amount of time.
> 4. If the release callback still hasn't been called, the V4L2 node is
> forcefully removed and UVC driver waits for another 1000ms for the
> release callback to clean up any pending resources.
> 5. The unbind process continues regardless of the status of release
> callback after waiting at most 1.5s for release.
> 
> So the only way to run into the current issue is if the release
> callback fails to finish in both step 3 and step 4 (for example, due
> to a deadlock) in the span of 1.5s. It is possible, but fairly
> unlikely (at least in my limited understanding) for the release
> callback to be delayed for quite that long.
> 
> Hope that makes some sense!

Yes, and it shows that there really is a bug in the UVC driver.  In 
kernel programming, fairly unlikely == not impossible == bound to happen 
eventually!

I don't know enough about the driver to make any detailed 
recommendations.  But you might consider, for example, that if the 
unbind routine can get along with forcibly removing the V4L2 node and 
not waiting for the release callback to finish, then why not have it 
behave that way all the time?  In other words, shorten the timeouts from 
500 ms and 1000 ms to 0 ms.

Whether you do that or not, someone definitely should fix up the release 
routine so that it won't get into trouble if it is called after (or 
concurrently with) all of the cleanup operations -- which is quite 
likely to happen if those timeouts are eliminated!  In particular, it 
shouldn't call gadget_deactivate unless it knows that an unbind hasn't 
happened yet.  And if that is the case, it should block the unbind 
routine until gadget_deactivate returns.  Basically, it's a bug for a 
function driver to call any gadget core routine after its unbind 
callback has returned.

Alan Stern

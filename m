Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F84D766F03
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jul 2023 16:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236088AbjG1OFn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jul 2023 10:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232825AbjG1OFm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jul 2023 10:05:42 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 14F5230E2
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 07:05:39 -0700 (PDT)
Received: (qmail 38299 invoked by uid 1000); 28 Jul 2023 10:05:39 -0400
Date:   Fri, 28 Jul 2023 10:05:39 -0400
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
Message-ID: <7a71a4c9-324e-44a9-b38b-31ea87d60e6e@rowland.harvard.edu>
References: <4d7aa3f4-22d9-9f5a-3d70-1bd7148ff4ba@google.com>
 <8de4bb54-8daa-73c0-b5eb-4aa4b9675ce5@ideasonboard.com>
 <fa11d883-2c72-486f-9b7b-46f238e2e03f@rowland.harvard.edu>
 <CAMHf4WJ4QyvFfnAWSk_D3VuPOe7+if=pgQvunjLXOHTcBgi4Qw@mail.gmail.com>
 <8242fba3-ebcc-481e-92bb-e25a3516853a@rowland.harvard.edu>
 <CAMHf4W+d1P8_Ahgc=Wj5K7BJa2Oi+cfXozd8e0_cdzioAjHeBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMHf4W+d1P8_Ahgc=Wj5K7BJa2Oi+cfXozd8e0_cdzioAjHeBg@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 28, 2023 at 01:57:15PM +0530, Avichal Rakesh wrote:
> On Sat, Jul 22, 2023 at 8:57 PM Alan Stern <stern@rowland.harvard.edu> wrote:

> > Here's a proposal, along the lines of your first suggestion above.  The
> > idea is to avoid holding the connect_lock mutex while invoking a gadget
> > driver's callbacks.
> >
> > Unfortunately, this is unavoidable in the case of the ->disconnect()
> > callback, but that's okay because the kerneldoc already says that
> > ->disconnect() may be called in_interrupt, so it's not allowed to call
> > any core routines that may sleep.  Just to make this perfectly clear,
> > the patch adds a couple of comments along these lines.
> >
> > As far as I can tell, there is no real reason to hold connect_lock
> > during the ->unbind() callback.  Not doing so should fix the problem in
> > the UVC function driver.
> 
> Thank you for the patch (and apologies for the delay)! This is a neat
> fix I completely glossed over. Looked around at other places where
> unbind is called, and it looks like the lock isn't held anywhere else
> either, so dropping the lock before calling unbind shouldn't break any
> existing assumptions around the callback.

> Tried the patch, and it fixes the issue for UVC Gadget Driver! UVC
> driver can now be unbound without locking up with the V4L2 release
> callback. Logs confirm that the calls are still being interleaved, but
> don't result in a deadlock now.

Thanks for trying it out.  Is it okay for me to add your "Tested-by:"  
tag when the patch is submitted?

Alan Stern

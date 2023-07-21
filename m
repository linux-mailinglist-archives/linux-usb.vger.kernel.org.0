Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 112CD75D512
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jul 2023 21:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbjGUTdm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jul 2023 15:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjGUTdl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jul 2023 15:33:41 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 3633A3C1D
        for <linux-usb@vger.kernel.org>; Fri, 21 Jul 2023 12:32:44 -0700 (PDT)
Received: (qmail 1766193 invoked by uid 1000); 21 Jul 2023 15:32:41 -0400
Date:   Fri, 21 Jul 2023 15:32:41 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     Avichal Rakesh <arakesh@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Badhri Jagan Sridharan <badhri@google.com>,
        "Eino-Ville Talvala \(Eddy\)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Kernel panic when unbinding UVC gadget function
Message-ID: <fa11d883-2c72-486f-9b7b-46f238e2e03f@rowland.harvard.edu>
References: <4d7aa3f4-22d9-9f5a-3d70-1bd7148ff4ba@google.com>
 <8de4bb54-8daa-73c0-b5eb-4aa4b9675ce5@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8de4bb54-8daa-73c0-b5eb-4aa4b9675ce5@ideasonboard.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 21, 2023 at 04:57:51PM +0100, Dan Scally wrote:
> Hi Avichal - thanks for all the detail
> 
> On 20/07/2023 02:28, Avichal Rakesh wrote:

> > This looks like a side effect of
> > https://lore.kernel.org/lkml/20230608204517.105396-1-badhri@google.com/.
> > Effectively, UVC function tried to disconnect the gadget before
> > cleaning up resources. However, usb_gadget_unregister_driver which is
> > removing the function prevents the gadget from disconnecting until the
> > function is unbound.

> > A dirty Patch for option 2 is attached below which skips calling
> > usb_function_deactivate if uvc_function_disable was called before. It seems
> > to work okay in testing. Let me know if the analysis and solutions seems okay
> > and I can upload a formal patch.
> 
> 
> For what it's worth the analysis makes sense; the patch looks ok to me so if
> the conclusion is to fix the problem that way I think it's fine, but I'm
> more inclined to consider this a locking problem in core - it'd be better to
> fix it there I think.

I'm not so sure that handling this in the core is feasible.  Removing 
the driver obviously needs to be synchronized with deactivation, since 
the two actions affect the same parts of the state (i.e., the pull-ups 
and the "connected" flag).

Consequently I don't see how to avoid a deadlock if the driver's unbind 
callback does a deactivate.  Besides, as the patch mentions, doing so is 
never necessary.

However, even with that call removed we could still have a problem.  I 
don't know much about how the UVC function driver works, but it would be 
reasonable for the driver to have a private mutex that gets held both 
during unbind and when the user application closes the V4L2 node.  Then 
there's an ABBA locking issue:

	Unbind: The UDC core holds connect_lock while calling the UVC
	unbind handler, which needs to acquire the private mutex.

	Close node: The UVC driver holds the private mutex while doing
	a deactivate, which needs to acquire connect_lock.

Any ideas on how to clear this up?

Alan Stern

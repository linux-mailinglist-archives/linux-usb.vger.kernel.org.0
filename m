Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D23178D09C
	for <lists+linux-usb@lfdr.de>; Wed, 30 Aug 2023 01:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241151AbjH2X3B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Aug 2023 19:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240698AbjH2X3A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Aug 2023 19:29:00 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id A8F8611B
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 16:28:56 -0700 (PDT)
Received: (qmail 404448 invoked by uid 1000); 29 Aug 2023 19:28:55 -0400
Date:   Tue, 29 Aug 2023 19:28:55 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: alauda_check_media() doubts
Message-ID: <16bc533a-d581-4aea-a7b7-6d88a51ca73e@rowland.harvard.edu>
References: <eee774db-0cd1-5870-8909-b616d962791f@suse.com>
 <001562e9-bc84-498f-a15a-8b4a01f172a7@rowland.harvard.edu>
 <16964970-5f7a-c80c-ad30-0a09fef9dc2f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16964970-5f7a-c80c-ad30-0a09fef9dc2f@suse.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 29, 2023 at 11:42:07PM +0200, Oliver Neukum wrote:
> 
> 
> On 29.08.23 20:49, Alan Stern wrote:
> > On Tue, Aug 29, 2023 at 08:14:05PM +0200, Oliver Neukum wrote:
> > > Hi Alan,
> > > 
> > > as you did something on this driver, doesn't
> > > this condition:
> > > 
> > > (status[0] & 0x80) ||
> > >                  ((status[0] & 0x1F) == 0x10) || ((status[1] & 0x01) == 0)
> > > 
> > > look odd to you? Especially the parentheses?
> > 
> > (The actual text in my copy of the file is:
> 
> Yes, I rearranged it by the parantheses.
> 
> > 	if ((status[0] & 0x80) || ((status[0] & 0x1F) == 0x10)
> > 		|| ((status[1] & 0x01) == 0)) {
> > 
> > This probably doesn't affect your point...)
> > 
> > Certainly the layout is a little peculiar, and the extra parentheses
> > don't help any.  But they don't really hurt, either, and the meaning is
> > clear.  It doesn't look obviously wrong.
> 
> Ok, then this is just me. THe parantheses would make perfect sense
> if the actual intent were:
> 
> (status[0] & 0x80) ||
> 		((status[0] & 0x1F) == 0x10) && ((status[1] & 0x01) == 0)

In fact, if I were writing that expression, I would do:

(status[0] & 0x80) ||
		((status[0] & 0x1F) == 0x10 && (status[1] & 0x01) == 0)

simply because I don't like relying on the relative precedence of || and 
&&.  That's just my own neurosis.  (On the other hand I have no qualms 
about the relative precedence of && and ==, because that combination of 
operators gets used all the time.  Maybe Daniel Drake preferred not to 
rely on it?)

For all we know, this is what the code _should_ be.  Without any 
documentation on the meaning of the status bits, there's no way to tell.

> > Those two lines go back to the original version of the driver, added in
> > 2005 by commit e80b0fade09e ("[PATCH] USB Storage: add alauda support"),
> > written by Daniel Drake and edited by Matt Dharm.  So it's been around
> > for quite a while and there may not be many devices left that need this
> > driver.
> 
> Yes, I know. Hence my question.
> 
> > Did you want to change it?
> 
> Nope. I just looked through the log and saw your patch for the
> failure of the transfer and the subsequent test looked
> messed up.

At this point, I don't think it matters much.

Alan Stern

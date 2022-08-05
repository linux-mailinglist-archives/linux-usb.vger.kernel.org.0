Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6611A58AC74
	for <lists+linux-usb@lfdr.de>; Fri,  5 Aug 2022 16:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240962AbiHEOmg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Aug 2022 10:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238666AbiHEOmf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Aug 2022 10:42:35 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 34EF332449
        for <linux-usb@vger.kernel.org>; Fri,  5 Aug 2022 07:42:34 -0700 (PDT)
Received: (qmail 698508 invoked by uid 1000); 5 Aug 2022 10:42:33 -0400
Date:   Fri, 5 Aug 2022 10:42:33 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [RFC v2 1/2] USB: core: add a way to revoke access to open USB
 devices
Message-ID: <Yu0sWfKrMRM7thIA@rowland.harvard.edu>
References: <20220804160306.134014-1-hadess@hadess.net>
 <20220804160306.134014-2-hadess@hadess.net>
 <YuwdR19MtO+xzJjk@rowland.harvard.edu>
 <b53642751c7bcf313f57eec54a455f579004828d.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b53642751c7bcf313f57eec54a455f579004828d.camel@hadess.net>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 05, 2022 at 02:38:13PM +0200, Bastien Nocera wrote:
> On Thu, 2022-08-04 at 15:25 -0400, Alan Stern wrote:
> > Have you considered what should happen if two processes share the
> > same 
> > file descriptor (and hence the same usb_dev_state structure) and you
> > want 
> > to revoke access for one of the processes but not the other?
> 
> No, because this isn't something that happens in practice, as it's
> simpler for each programme to open their own file descriptor and claim
> the interfaces they need on their own.

But it is possible for a program to open a USB device and then fork 
several children.  The children would all share the same file descriptor.

I have no idea how often this happens in practice.  But kernel design is 
supposed to be based on correctness, not on handling only things that 
crop up "in practice".

> > I have the feeling that this part of the function (matching the
> > busnum 
> > and devnum values) doesn't belong here but rather with the iteration 
> > routines in your 2/2 patch.  Filtering of devices generally is done
> > as 
> > part of the iteration.  As an added bonus, doing it that way means
> > you 
> > don't need to pass around pointers to usb_revoke_match structures.
> 
> I felt it better to have the filtering done in one place, to avoid
> passing just a uid to check to that function.

There's nothing wrong with passing just a uid.  Especially since the same 
device might be open multiple times, for varying uids.

> Should I rename the function something like usb_revoke_for_uid() ?

Up to you.

Alan Stern

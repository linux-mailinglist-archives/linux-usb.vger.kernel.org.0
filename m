Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A664758D601
	for <lists+linux-usb@lfdr.de>; Tue,  9 Aug 2022 11:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbiHIJKU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 9 Aug 2022 05:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiHIJKS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Aug 2022 05:10:18 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32588C38
        for <linux-usb@vger.kernel.org>; Tue,  9 Aug 2022 02:10:16 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id CBFD0E0003;
        Tue,  9 Aug 2022 09:10:10 +0000 (UTC)
Message-ID: <51fa03a4dbed7d6dbb1f1d59c20817345524cea6.camel@hadess.net>
Subject: Re: [RFC v2 1/2] USB: core: add a way to revoke access to open USB
 devices
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Date:   Tue, 09 Aug 2022 11:10:09 +0200
In-Reply-To: <Yu0sWfKrMRM7thIA@rowland.harvard.edu>
References: <20220804160306.134014-1-hadess@hadess.net>
         <20220804160306.134014-2-hadess@hadess.net>
         <YuwdR19MtO+xzJjk@rowland.harvard.edu>
         <b53642751c7bcf313f57eec54a455f579004828d.camel@hadess.net>
         <Yu0sWfKrMRM7thIA@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2022-08-05 at 10:42 -0400, Alan Stern wrote:
> > On Fri, Aug 05, 2022 at 02:38:13PM +0200, Bastien Nocera wrote:
> > > > On Thu, 2022-08-04 at 15:25 -0400, Alan Stern wrote:
> > > > > > Have you considered what should happen if two processes
> > > > > > share the
> > > > > > same 
> > > > > > file descriptor (and hence the same usb_dev_state
> > > > > > structure) and > > > you
> > > > > > want 
> > > > > > to revoke access for one of the processes but not the
> > > > > > other?
> > > > 
> > > > No, because this isn't something that happens in practice, as
> > > > it's
> > > > simpler for each programme to open their own file descriptor
> > > > and > > claim
> > > > the interfaces they need on their own.
> > 
> > But it is possible for a program to open a USB device and then fork
> > several children.  The children would all share the same file >
> > descriptor.
> > 
> > I have no idea how often this happens in practice.  But kernel
> > design > is 
> > supposed to be based on correctness, not on handling only things
> > that
> > crop up "in practice".

Given that the API makes no such promises, I think we're fine. The end
goal is "user can't use device" or possibly "user in namespace can't
use device" to cut sandboxes off from their USB devices.

We don't need surgical precision revocation, but I would be happy to
implement this API if we can come up with a good way to target specific
programs.

> > > > > > I have the feeling that this part of the function (matching
> > > > > > the
> > > > > > busnum 
> > > > > > and devnum values) doesn't belong here but rather with the
> > > > > > > > > iteration 
> > > > > > routines in your 2/2 patch.  Filtering of devices generally
> > > > > > is > > > done
> > > > > > as 
> > > > > > part of the iteration.  As an added bonus, doing it that
> > > > > > way > > > means
> > > > > > you 
> > > > > > don't need to pass around pointers to usb_revoke_match > >
> > > > > > > structures.
> > > > 
> > > > I felt it better to have the filtering done in one place, to
> > > > avoid
> > > > passing just a uid to check to that function.
> > 
> > There's nothing wrong with passing just a uid.  Especially since
> > the > same 
> > device might be open multiple times, for varying uids.
> > 
> > > > Should I rename the function something like
> > > > usb_revoke_for_uid() ?
> > 
> > Up to you.

I've done that now.

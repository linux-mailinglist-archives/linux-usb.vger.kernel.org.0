Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F804726270
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 16:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241042AbjFGOME (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 10:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240340AbjFGOMD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 10:12:03 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 2FDE119D
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 07:11:59 -0700 (PDT)
Received: (qmail 226589 invoked by uid 1000); 7 Jun 2023 10:11:59 -0400
Date:   Wed, 7 Jun 2023 10:11:59 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     David Disseldorp <ddiss@suse.de>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: gadget: f_mass_storage: remove unnecessary open
 check
Message-ID: <aaa95d90-1673-4b6d-a3ec-032cfb939592@rowland.harvard.edu>
References: <20230606221518.7054-1-ddiss@suse.de>
 <cc56d8bf-a634-46bb-b874-5847bd4b3bf3@rowland.harvard.edu>
 <20230607101503.1e5a6ef6@echidna.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607101503.1e5a6ef6@echidna.fritz.box>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 07, 2023 at 10:15:03AM +0200, David Disseldorp wrote:
> Thanks for the feedback, Alan...
> 
> On Tue, 6 Jun 2023 18:33:22 -0400, Alan Stern wrote:
> 
> > On Wed, Jun 07, 2023 at 12:15:18AM +0200, David Disseldorp wrote:
> > > fsg_lun_is_open() will always and only be true after a successful
> > > fsg_lun_open() call, so drop the unnecessary conditional.  
> > 
> > I don't follow the reasoning.  The relevant code is:
> > 
> > 	if (cfg->filename) {
> > 		rc = fsg_lun_open(lun, cfg->filename);
> > 		if (rc)
> > 			goto error_lun;
> > 	}
> > 	...
> > 	if (fsg_lun_is_open(lun)) {
> > 
> > So at this point, the fsg_lun_is_open() condition is true iff 
> > cfg->filename was set upon entry.  What makes this test unnecessary?
> 
> The fsg_lun_is_open() test is unnecessary as it will always be true
> following a successful fsg_lun_open() call and will always be false if
> cfg->filename is unset. This means that the logic from the
> fsg_lun_is_open() conditional block can be appended directly after the
> error_lun goto. pathbuf allocation ('...' above) is only needed for
> the open case, so can also be wrapped into the conditional block.
> 
> I'd be happy to update the commit message if the explanation above
> makes things clearer. I should probably also mention that I've tested
> this using dummy-hcd.

Yes, please do that.  All you have to say is that the fsg_lun_is_open() 
test can be eliminated and the code merged with the preceding 
conditional, because the LUN won't be open if cfg->filename wasn't set.

Alan Stern

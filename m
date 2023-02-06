Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37FB668BA4B
	for <lists+linux-usb@lfdr.de>; Mon,  6 Feb 2023 11:35:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjBFKfk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 05:35:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbjBFKfL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 05:35:11 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E12C199C3
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 02:34:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 77B40B80E71
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 10:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F0EC433EF;
        Mon,  6 Feb 2023 10:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675679351;
        bh=SdHUP0SuwvX/TRcKeFw78VyF//2adYKq+Juzxn5gQLQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lL1aDuGY8Omph99fY1pSrd+q0/O8pxzWdzUZGQ2AGDPT6cDMD7EKSqss9vsEhBSqV
         Sq4R/yXg6+qgMfpURPP0eTA/jlkR5qnb/p9itfQPdMmPUBEC/PgcQAo+ErpSLlaiv4
         zjprRLn8k/TuR3iPxhJ5SwX7LORRMNE3/dKquc38=
Date:   Mon, 6 Feb 2023 11:29:08 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu
Subject: Re: [PATCH v4 00/11] Add XU support to UVC Gadget
Message-ID: <Y+DWdLJng2IW7vAe@kroah.com>
References: <20230202135508.447109-1-dan.scally@ideasonboard.com>
 <Y+DQJ3tWRljP33f8@kroah.com>
 <18f2b583-b355-9f6a-fb0f-fcfb41c168d9@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18f2b583-b355-9f6a-fb0f-fcfb41c168d9@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 06, 2023 at 10:24:03AM +0000, Dan Scally wrote:
> Hi Greg
> 
> On 06/02/2023 10:02, Greg KH wrote:
> > On Thu, Feb 02, 2023 at 01:54:57PM +0000, Daniel Scally wrote:
> > > Hello all
> > > 
> > > This series adds support for the definition of extension units in configfs for
> > > the UVC Gadget. The XUs are modelled as config_items within a new "extensions"
> > > group under control, which seemed like an appropriate place to put them.
> > > 
> > > To allow the XU's to be inserted in the function graph, the bSourceID attribute
> > > for the default output terminal is made writeable - users will need to configure
> > > it with the bUnitID of the XU that they want to use as the OT's source. This does
> > > mean that the XUs can _only_ be placed immediately preceding the OT, but I think
> > > that that's fine for now.
> > > 
> > > The XUs configured through this series have been tested via uvc-gadget, uvcvideo
> > > and uvcdynctrl.
> > > 
> > > This version is almost identical to v3 but rebased onto usb-testing, with minor
> > > changes to 6/11 and 7/11.
> > > 
> > > v2 of the series here: https://lore.kernel.org/linux-usb/0ae65812-c937-d071-455b-7c1d6418b080@ideasonboard.com/
> > This series conflicts with the previous patch series you sent, how did
> > you create this?
> 
> 
> Do you mean conflicts with the previous version of this series, or with the
> "UVC Gadget: Extend color matching support" series? If the latter I rebased
> them separately onto usb-testing, so neither series knew about the other.

The latter.  And if they know nothing about each other, how is anyone
supposed to be able to apply both of them?

Please please please make my life easy to take your changes, not
difficult, as this just makes me want to ignore your patches as I will
inherently assume they are going to cause me problems...

What would you do if you were in my place here?

thanks,

greg k-h

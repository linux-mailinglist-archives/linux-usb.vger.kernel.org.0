Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB929683818
	for <lists+linux-usb@lfdr.de>; Tue, 31 Jan 2023 21:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231865AbjAaU5R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Jan 2023 15:57:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231815AbjAaU46 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Jan 2023 15:56:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5423B41B6D
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 12:56:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DD38FB81EC4
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 20:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D06C433D2;
        Tue, 31 Jan 2023 20:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675198568;
        bh=cCh6LcWp6XRm1bTstcY/0Jt3nGGDf3DWReW0/zDt0Jg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DLHQS2OwB4o3sjtH381a/R3nG+TF7zEcTpZAtGwzyOX20DTrhK7md9vuqF9gK4sBd
         KB58O1ZBdT9Qe3eaXMe9dj9LiFtMMdASRiJUI/6RM7ED/Ol9cXLaUcFDJqgD2RF83Q
         EtIQ5vA8727nu6xg3bIpNLAxTpW49J9BX1frabZg=
Date:   Tue, 31 Jan 2023 21:56:00 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Troels Liebe Bentsen <troels@connectedcars.dk>,
        linux-usb@vger.kernel.org
Subject: Re: All USB tools hang when one descriptor read fails and needs to
 timeout
Message-ID: <Y9mAYH7L/CcTTSw6@kroah.com>
References: <CAHHqYPMHBuPZqG9Rd9i+hN9Mq89pRn6M_0PLsyWkcK_hZr3xAA@mail.gmail.com>
 <Y9Jwv1ColWNwH4+0@kroah.com>
 <CAHHqYPONhyKrqMWiw29TRETtiBatNaej8+62Z40fvuj3LX4RWQ@mail.gmail.com>
 <Y9J8VncWSJdVURgB@kroah.com>
 <CAHHqYPO_A=7V_8Z-qrGy0-eOkPEpyv+vU_8Jpz-ABGg60t244w@mail.gmail.com>
 <Y9KnnH+5O6MtO6kz@rowland.harvard.edu>
 <CAHHqYPNtVkHoiX1LrxUDa32BgVsgymcPtKVODcVGxEh2f=tYRw@mail.gmail.com>
 <Y9P2tvPkdwHrbPXd@rowland.harvard.edu>
 <CAHHqYPPWvxMvSU=HMS9C2aPk08j25MBKXS7XC6im5_oz_nXTuw@mail.gmail.com>
 <Y9l85PAcc/i/tgnS@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9l85PAcc/i/tgnS@rowland.harvard.edu>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 31, 2023 at 03:41:08PM -0500, Alan Stern wrote:
> On Tue, Jan 31, 2023 at 04:59:36PM +0100, Troels Liebe Bentsen wrote:
> > On Fri, 27 Jan 2023 at 17:07, Alan Stern <stern@rowland.harvard.edu> wrote:
> > > Now that I know the config descriptors won't get reallocated after all,
> > > I can remove the locking from the descriptors file entirely.  A patch to
> > > do this is below.  It ought to fix your problem.  Try it and see.
> > 
> > Thank you very much, I built a new kernel with the patch and can confirm
> > that it fixes my issue.
> > 
> > Will the patch make it into any of the LTS kernels as it could seem like a
> > bugfix depending on how you look at it or is it only destined mainline, fx. 6.2
> > or 6.3?
> 
> I don't know.  I will submit it for the -stable kernels, but the 
> decision on whether to accept it will be up to Greg KH.

I'll backport it, as it can help out with systems as Troels said.  But
will wait until 6.3-rc1 is out as this should get some testing.

thanks,

greg k-h

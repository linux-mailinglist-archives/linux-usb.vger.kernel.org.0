Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18C8F6CD34A
	for <lists+linux-usb@lfdr.de>; Wed, 29 Mar 2023 09:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjC2He3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Mar 2023 03:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjC2HeC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Mar 2023 03:34:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08584492
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 00:31:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3AE1B61AE4
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 07:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50295C433D2;
        Wed, 29 Mar 2023 07:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1680075075;
        bh=ExdG+HBSxCLvs7VpLscd/lwcL2pvL4d/qZzhPTJcovg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yDsMCyvtffh+iTLHWf8XuYzDPm2I95+fvMxYY1R5L+nk/PdNeQp0cS2oGjkjH+H1U
         SQLEFw4lKfAk59HUD11ON1EvFb2oODAzd2soQBZP0YShlINbR2sP7euiLKENS0147v
         nY01xQVboI3qLu9r8f7+dVc8nORknUlGMLn6dAP8=
Date:   Wed, 29 Mar 2023 09:31:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 5/6] usb: gadget: f_fs: replace private pr_vdebug()
 with dev_vdbg
Message-ID: <ZCPpQcgU_7glBQUC@kroah.com>
References: <1679911940-4727-1-git-send-email-quic_linyyuan@quicinc.com>
 <1679911940-4727-5-git-send-email-quic_linyyuan@quicinc.com>
 <ZCPg4U-DwidG3xf1@kroah.com>
 <b7e7e88c-0288-a3fa-49f2-b3956ea8a021@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7e7e88c-0288-a3fa-49f2-b3956ea8a021@quicinc.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 29, 2023 at 03:01:49PM +0800, Linyu Yuan wrote:
> 
> On 3/29/2023 2:55 PM, Greg Kroah-Hartman wrote:
> > On Mon, Mar 27, 2023 at 06:12:19PM +0800, Linyu Yuan wrote:
> > > Use command dev_vdbg() macro to show some debug message.
> > > 
> > > Also replace some pr_debug/err/warn/info() to dev_dbg/err/warn/info().
> > > 
> > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > ---
> > > v3: new patch in this version
> > > 
> > >   drivers/usb/gadget/function/f_fs.c | 98 +++++++++++++++++++-------------------
> > >   drivers/usb/gadget/function/u_fs.h |  6 ---
> > >   2 files changed, 49 insertions(+), 55 deletions(-)
> > > 
> > > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > > index 25461f1..0761eaa 100644
> > > --- a/drivers/usb/gadget/function/f_fs.c
> > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > @@ -317,12 +317,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
> > >   static int __ffs_ep0_stall(struct ffs_data *ffs)
> > >   {
> > >   	if (ffs->ev.can_stall) {
> > > -		pr_vdebug("ep0 stall\n");
> > > +		dev_vdbg(ffs->dev, "ep0 stall\n");
> > >   		usb_ep_set_halt(ffs->gadget->ep0);
> > >   		ffs->setup_state = FFS_NO_SETUP;
> > >   		return -EL2HLT;
> > >   	} else {
> > > -		pr_debug("bogus ep0 stall!\n");
> > > +		dev_dbg(ffs->dev, "bogus ep0 stall!\n");
> > >   		return -ESRCH;
> > >   	}
> > >   }
> > > @@ -361,7 +361,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
> > >   		/* Handle data */
> > >   		if (ffs->state == FFS_READ_DESCRIPTORS) {
> > > -			pr_info("read descriptors\n");
> > > +			dev_info(ffs->dev, "read descriptors\n");
> > When a driver works properly, it should be quiet.  Why is this driver
> > being noisy for normal operations?  Shouldn't these types of messages be
> > moved to be debugging only?
> 
> 
> just keep original design, if you accept, will change to dev_dbg().

Please do.

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34B6D6C92CA
	for <lists+linux-usb@lfdr.de>; Sun, 26 Mar 2023 08:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbjCZG3Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Mar 2023 02:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjCZG3Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Mar 2023 02:29:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90178A4E
        for <linux-usb@vger.kernel.org>; Sat, 25 Mar 2023 23:29:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 03EA960E97
        for <linux-usb@vger.kernel.org>; Sun, 26 Mar 2023 06:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A8EC433D2;
        Sun, 26 Mar 2023 06:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679812162;
        bh=cH1L6RSAl73a/9LRssBnCN8ju0qrG7lZfSUB8VtAFY8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rmiw8Qr5V5pdKT2OkLwwpwUv0SK4iY6F5qNFivrJLGkWtudGE4X1y60TFMi6NH7D/
         PmPtOc9zFOGwTT9plT1Aptimsi2q3AZaCWTAKLQBrvizhzpWDyW7q2Cp8LvSLCz/bR
         BRvJCUx+LArxW4nogV4aWbxnoc/6mdmCpANVgyHs=
Date:   Sun, 26 Mar 2023 08:29:18 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/3] usb: gadget: f_fs: add dev name as prefix for
 pr_vdebug()
Message-ID: <ZB/mPh9cVCtp04k/@kroah.com>
References: <1679638227-20496-1-git-send-email-quic_linyyuan@quicinc.com>
 <1679638227-20496-3-git-send-email-quic_linyyuan@quicinc.com>
 <ZB64J50M4RmkPJSD@kroah.com>
 <f5ca9b0d-8e15-c8e3-1b17-9a7bbc8bba04@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5ca9b0d-8e15-c8e3-1b17-9a7bbc8bba04@quicinc.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 26, 2023 at 10:55:18AM +0800, Linyu Yuan wrote:
> 
> On 3/25/2023 5:00 PM, Greg Kroah-Hartman wrote:
> > On Fri, Mar 24, 2023 at 02:10:27PM +0800, Linyu Yuan wrote:
> > > when multiple instances in use, the debug message is hard to understand
> > > as there is no instance name show.
> > > 
> > > this change will show each instance name for debug messages.
> > > 
> > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > ---
> > > v2: split to several changes according to v1 comments
> > > v1: https://lore.kernel.org/linux-usb/1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com/
> > > 
> > >   drivers/usb/gadget/function/f_fs.c | 136 +++++++++++++++++++------------------
> > >   1 file changed, 69 insertions(+), 67 deletions(-)
> > > 
> > > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > > index a4051c8..df67ab5 100644
> > > --- a/drivers/usb/gadget/function/f_fs.c
> > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > @@ -317,12 +317,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
> > >   static int __ffs_ep0_stall(struct ffs_data *ffs)
> > >   {
> > >   	if (ffs->ev.can_stall) {
> > > -		pr_vdebug("ep0 stall\n");
> > > +		pr_vdebug("%s: ep0 stall\n", ffs->dev_name);
> > Again, no, please use dev_dbg() instead.  Do NOT roll your own debugging
> > macros.  You have access to a struct device pointer for this device that
> > the driver is controlling, so please always use that instead.
> 
> 
> thanks for your suggestion, i didn't know dev_dbg can accept NULL dev
> pointer
> 
> as this driver have no real struct device.

That is not true, you have access to a struct usb_gadget, which is a
struct device.  Use that please.

> will change to dev_dbg with NULL dev pointer.

No, that is pointless, please do not do that.

thanks,

greg k-h

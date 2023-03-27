Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0F986C9B11
	for <lists+linux-usb@lfdr.de>; Mon, 27 Mar 2023 07:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjC0Fqv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Mar 2023 01:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjC0Fqv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Mar 2023 01:46:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD964C1F
        for <linux-usb@vger.kernel.org>; Sun, 26 Mar 2023 22:46:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CE35F60FA5
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 05:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7FAC433D2;
        Mon, 27 Mar 2023 05:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679896009;
        bh=QHaYHN2Fe1U60FYDvKTYx15x9OE1r9LH54U3god/nTg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=md2WJu/lk9FbjL8OrTXHFUEJr+XrAWbFyn2pir8Aww2Q4j018TaP8JlS2L4LhcMXB
         w8XQnkuW1wwZeV0lUTzeuXUa0ND6WEXcRvxz0liOcITylxPZNKYJTWBo6B6+J/tEJP
         ejOmrGkFPjVDHjoOHb6xHVRzpdbYJ09OcsRy6FEo=
Date:   Mon, 27 Mar 2023 07:46:45 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/3] usb: gadget: f_fs: add dev name as prefix for
 pr_vdebug()
Message-ID: <ZCEtxdztUHWMMQXg@kroah.com>
References: <1679638227-20496-1-git-send-email-quic_linyyuan@quicinc.com>
 <1679638227-20496-3-git-send-email-quic_linyyuan@quicinc.com>
 <ZB64J50M4RmkPJSD@kroah.com>
 <f5ca9b0d-8e15-c8e3-1b17-9a7bbc8bba04@quicinc.com>
 <ZB/mPh9cVCtp04k/@kroah.com>
 <951911a6-4ef7-00c8-a442-31336f472980@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <951911a6-4ef7-00c8-a442-31336f472980@quicinc.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 27, 2023 at 09:54:11AM +0800, Linyu Yuan wrote:
> 
> On 3/26/2023 2:29 PM, Greg Kroah-Hartman wrote:
> > On Sun, Mar 26, 2023 at 10:55:18AM +0800, Linyu Yuan wrote:
> > > On 3/25/2023 5:00 PM, Greg Kroah-Hartman wrote:
> > > > On Fri, Mar 24, 2023 at 02:10:27PM +0800, Linyu Yuan wrote:
> > > > > when multiple instances in use, the debug message is hard to understand
> > > > > as there is no instance name show.
> > > > > 
> > > > > this change will show each instance name for debug messages.
> > > > > 
> > > > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > > > ---
> > > > > v2: split to several changes according to v1 comments
> > > > > v1: https://lore.kernel.org/linux-usb/1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com/
> > > > > 
> > > > >    drivers/usb/gadget/function/f_fs.c | 136 +++++++++++++++++++------------------
> > > > >    1 file changed, 69 insertions(+), 67 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > > > > index a4051c8..df67ab5 100644
> > > > > --- a/drivers/usb/gadget/function/f_fs.c
> > > > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > > > @@ -317,12 +317,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
> > > > >    static int __ffs_ep0_stall(struct ffs_data *ffs)
> > > > >    {
> > > > >    	if (ffs->ev.can_stall) {
> > > > > -		pr_vdebug("ep0 stall\n");
> > > > > +		pr_vdebug("%s: ep0 stall\n", ffs->dev_name);
> > > > Again, no, please use dev_dbg() instead.  Do NOT roll your own debugging
> > > > macros.  You have access to a struct device pointer for this device that
> > > > the driver is controlling, so please always use that instead.
> > > 
> > > thanks for your suggestion, i didn't know dev_dbg can accept NULL dev
> > > pointer
> > > 
> > > as this driver have no real struct device.
> > That is not true, you have access to a struct usb_gadget, which is a
> > struct device.  Use that please.
> 
> but this is not good, as for gadget/udc, from my view, there are two layer,
> 
> one configfs driver, one lower UDC, only after bind, there will be a
> reference to usb_gadget.
> 
> but configuration to driver can happen before bind, if so the usb_gadget
> will be NULL.

But is that where this debug message is being called?  This is a
function while the driver is bound to a device, so you have a usb_gadget
pointer here.

If you have messages that could happen before the device is bound, sure,
don't use the device there.

thanks,

greg k-h

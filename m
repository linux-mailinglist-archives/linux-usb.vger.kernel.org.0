Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5012A6CD36A
	for <lists+linux-usb@lfdr.de>; Wed, 29 Mar 2023 09:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjC2Hio (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Mar 2023 03:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbjC2HiY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Mar 2023 03:38:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ADDB10DE
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 00:37:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 25965B81E55
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 07:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD64C433D2;
        Wed, 29 Mar 2023 07:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1680075471;
        bh=XsTRsHfpPfNTyWCiMbSSOyBuOudBskRNdpBlkxzLn9E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ssA7xq91X1hRCCIxB/D7h/WROdakOCGTjSpo018zlVn31vAh6WFydzXs+WSR0hbjY
         h3HlbjDjzRRE7fJ0gjytkeVg/GUKNrW8Bhw9ZiWDQnZBJgh6BpkZv3lhX8mJrj6LdA
         T/MKZNzpQTHy/5OxIindOfBbIYDzi8LVNVMsAkXY=
Date:   Wed, 29 Mar 2023 09:37:49 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 6/6] usb: gadget: f_fs: show instance name in debug
 message
Message-ID: <ZCPqzTXHJJRUTCvc@kroah.com>
References: <1679911940-4727-1-git-send-email-quic_linyyuan@quicinc.com>
 <1679911940-4727-6-git-send-email-quic_linyyuan@quicinc.com>
 <ZCPgr1SY94UuBfdX@kroah.com>
 <d01ae388-0768-420c-e244-8c270ccb00e4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d01ae388-0768-420c-e244-8c270ccb00e4@quicinc.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 29, 2023 at 03:11:14PM +0800, Linyu Yuan wrote:
> 
> On 3/29/2023 2:54 PM, Greg Kroah-Hartman wrote:
> > On Mon, Mar 27, 2023 at 06:12:20PM +0800, Linyu Yuan wrote:
> > > show ffs->dev_name in all possible debug message.
> > > 
> > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > ---
> > > v3: change according comments
> > > v2: split to several changes according to v1 comments
> > > v1: https://lore.kernel.org/linux-usb/1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com/
> > > 
> > >   drivers/usb/gadget/function/f_fs.c | 141 ++++++++++++++++++++-----------------
> > >   1 file changed, 75 insertions(+), 66 deletions(-)
> > > 
> > > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > > index 0761eaa..383343d 100644
> > > --- a/drivers/usb/gadget/function/f_fs.c
> > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > @@ -317,12 +317,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
> > >   static int __ffs_ep0_stall(struct ffs_data *ffs)
> > >   {
> > >   	if (ffs->ev.can_stall) {
> > > -		dev_vdbg(ffs->dev, "ep0 stall\n");
> > > +		dev_vdbg(ffs->dev, "%s: ep0 stall\n", ffs->dev_name);
> > You already have the name here, it's in the usb-gadget structure, why do
> > you need to print it out again?
> > 
> > What is the before and after output of this change?  I think it should
> > have the same information already in it.
> 
> 
> you have wrong understanding of usb_gadget->dev and ffs->dev_name,
> 
> this is output example,
> 
> [11.046519] configfs-gadget.g1 gadget.0: adb: interface descriptor
> 
> usb_gadget->dev is gadget.0,
> 
> but ffs->dev_name is adb.

Isn't there some mapping of gadget name to "dev_name" somewhere else in
the logs?  And what sets dev_name, why isn't that part of the gadget
name already?

thanks,

greg k-h

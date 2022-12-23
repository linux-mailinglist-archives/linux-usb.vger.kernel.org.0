Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DED66551F2
	for <lists+linux-usb@lfdr.de>; Fri, 23 Dec 2022 16:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236311AbiLWPMx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Dec 2022 10:12:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiLWPMv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Dec 2022 10:12:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A10DED4
        for <linux-usb@vger.kernel.org>; Fri, 23 Dec 2022 07:12:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 934DDB82047
        for <linux-usb@vger.kernel.org>; Fri, 23 Dec 2022 15:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF77FC433D2;
        Fri, 23 Dec 2022 15:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1671808368;
        bh=VPlHFPzyhh2tlJ8vuFTVbQtHuPIUBcIjY3PGq/V7PxM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZQQDvxV5v1Qw3RtjnOoC2Y8CkjiFRxofl2MJklnrgfQdIgATR84oM9CjMgIpbUT2+
         oVlrpebteYxOxd2pB2kuIbXhgyel4QFfAUPUoeaTFDGOOEKS7ikFZTL1Yny5K1DDw2
         jAk3RdYM/+EW6+gPCPr20fpTjaZq87+pN1zUyM20=
Date:   Fri, 23 Dec 2022 16:12:45 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: SMMU Fault after setting RUN_STOP during gadget_pullup
Message-ID: <Y6XFbc4aSOh7KnsO@kroah.com>
References: <fa94cbc9-e637-ba9b-8ec8-67c6955eca98@quicinc.com>
 <Y6W6eF7lDSp/bssp@kroah.com>
 <b116d857-572c-8fd5-d6d8-04ef3af7920c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b116d857-572c-8fd5-d6d8-04ef3af7920c@quicinc.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 23, 2022 at 08:34:08PM +0530, Krishna Kurapati PSSNV wrote:
> 
> 
> On 12/23/2022 7:56 PM, Greg KH wrote:
> > On Fri, Dec 23, 2022 at 07:26:49PM +0530, Krishna Kurapati PSSNV wrote:
> > > Hi all,
> > > 
> > > I am facing one SMMU fault with FAR=0x00 on current targets running on 5.10
> > > and 5.15 with following signature:
> > 
> > What about 6.1?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Hi Greg,
> 
>  Current mobile targets are running on 5.10 and 5.15 only till now. No
> target on 6.1 hasn't come up completely yet. So not sure if this issue is
> there on 6.1.
> 
>  I can try putting 6.1 on a minimal busybox ramdisk image on the mobile
> target and see if the issue comes up but seeing that the issue is random and
> seen only after long duration, I might take some time to get back with the
> results.
> 
> In the meantime, I would be happy to try out any ideas coming up from
> community in the meantime on current 5.15 build.

We can't do much about older kernels, as you know, sorry.  If you can
reproduce the issue on a modern kernel (i.e. 6.1), then we can look into
it.  If you can't, then 'git bisect' is your friend :)

good luck!

greg k-h

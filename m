Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2382B6B1188
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 19:58:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjCHS6m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 13:58:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjCHS6i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 13:58:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC334D610
        for <linux-usb@vger.kernel.org>; Wed,  8 Mar 2023 10:58:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 76742B81D7E
        for <linux-usb@vger.kernel.org>; Wed,  8 Mar 2023 18:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5344C433EF;
        Wed,  8 Mar 2023 18:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678301908;
        bh=qDtu0CecwIUD1qwqA77Q43gIm4kLnCSQ1oCurQySnzI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=edGImLfs52lqf/YUXedr2vRIR5RZl+cvTsBYjlgZtKxmyRB39pIFzgfQB7OiZYgfY
         YoX0mUNfUByFYv+48CQPBV9OpboEJwAzCVOe51R9CqvcoySfqHhJOU6sfzodC6610j
         pqge04ydW+rkT5vuZvqGxWO1cCMwP+IajzB2jD/s=
Date:   Wed, 8 Mar 2023 19:58:25 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: dwc3 gadget and USB3
Message-ID: <ZAja0So7EDH5FfI0@kroah.com>
References: <c604031d4e3aa215b90f73e9a2dd55e7e116186f.camel@infinera.com>
 <ZAjE+p4IoXk/kvXu@kroah.com>
 <d4be672670da6b06456b5a82624e3db0128fdae8.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4be672670da6b06456b5a82624e3db0128fdae8.camel@infinera.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 08, 2023 at 06:12:51PM +0000, Joakim Tjernlund wrote:
> On Wed, 2023-03-08 at 18:25 +0100, Greg KH wrote:
> > On Wed, Mar 08, 2023 at 05:10:17PM +0000, Joakim Tjernlund wrote:
> > > we are using fsl-ls1043a-rdb based design but with a ls1023a SOC and
> > > use USB0 in gadget mode running either NCM or RNDIS ethernet on top.
> > > 
> > > When we connect the gadget to a PC(Linux of Windows) over an USB2 hub,
> > > networking(NCM or RNDIS) works well.
> > > 
> > > However, when we connect the gadget directly to the PC/laptop which uses USB3
> > > we see something odd:
> > >   Ping from PC to gadget works.
> > >   Ping from gadget to laptop does not. However if we also ping from PC at the same time we
> > >   see gadget to PC start working.
> > > Seems like ping from the PC tiggers the gadget to see incoming pkgs somehow.
> > > 
> > > Any idea what might be wrong or how to debug this?
> > > Kernel 5.15.87
> > 
> > 5.15.y is very old, does this also happen on 6.2?
> > 
> 
> I just tried 6.1.15 and the problem remains, I hope that is close enough ?

It's good enough :)

Have any logs at all that show any problems?  Also, you might want to
 cc:  the dwc3 maintainer...

 thanks,

 greg k-hj

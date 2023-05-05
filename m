Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB60C6F7D98
	for <lists+linux-usb@lfdr.de>; Fri,  5 May 2023 09:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbjEEHQQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 May 2023 03:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbjEEHQP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 May 2023 03:16:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11B51637A
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 00:16:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 66A8E63A7A
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 07:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF451C433EF;
        Fri,  5 May 2023 07:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683270973;
        bh=dpvu8dXm1BYIfuHAch0A0DQKt4KwyLsS/SqsKq0/SZw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lbk8UUOT6hMpLRlJSUwcfZOzQrZYsS60KbDPRfz5UvAyCiErcW2CFZE+Gwus7/Zlb
         4X390ED7M8xs8mhkD8xaVscTCwo5aWlEDp8LuxYbbuY75Qv5C4nzKfc8p4SNf30k9x
         7Qe71wG9MQ7hHKYalhBYb8RKxbluLuxFYPhs9TgE5TMaz+z+0kDAs6pYkgsUzAPzTP
         5ArzHf3d4bhSTUSwcnylbtKc1/0J1hYD96A+Rl13vSImhtRAlNGjaZkJubMC2Hy/6/
         dmZ62GXUMNcCY3vDa0VuRiEW//F2wyBQV/iyWZVKvsjGAcpOFxJWU1yhaY5yDMg+XM
         BPrCTkffagTxw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pupfz-0006ZK-P0; Fri, 05 May 2023 09:16:24 +0200
Date:   Fri, 5 May 2023 09:16:23 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     qianfanguijin@163.com, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bin Liu <b-liu@ti.com>, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v1] drivers: usb: wwan: treat any error as a fatal error
Message-ID: <ZFStRzPPek8OrJUx@hovoldconsulting.com>
References: <20230414055306.8805-1-qianfanguijin@163.com>
 <ZDj6Vhv6XHUADSFQ@hovoldconsulting.com>
 <a0226d7b-c03a-5e45-4ecb-2748c25126a2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0226d7b-c03a-5e45-4ecb-2748c25126a2@suse.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Oliver,

and sorry about the late follow-up on this. Was travelling last week.

On Mon, Apr 17, 2023 at 11:50:34AM +0200, Oliver Neukum wrote:
> 
> 
> On 14.04.23 09:01, Johan Hovold wrote:
> > On Fri, Apr 14, 2023 at 01:53:06PM +0800, qianfanguijin@163.com wrote:
> >> From: qianfan Zhao <qianfanguijin@163.com>
> >>
> >> Kernel print such flood message when the modem dead (the device is not
> >> disconnected but it doesn't response anything):
> >>
> >> option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: -71 on endpoint 05.
> >> option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: -71 on endpoint 05.
> >> ...
> >>
> >> So treat any error that doesn't recognized as a fatal error and do not
> >> resubmit again.
> > 
> > This could potentially break setups that are currently able to recover
> > from intermittent errors.
> 
> Yes. The basic issue is that a physically disconnected device
> produces the same errors as an intermittent failure for a short
> time before the disconnection is detected.
> 
> Hence the correct way to handle this would be like usbhid does
> with hid_io_error(), that is a delay before resubmitting
> and eventually a device reset.
> 
> > Try adding the missing known fatal ones as you suggested in your other
> > thread first.
> > 
> > There could still be an issue with -EPROTO (-71) error that would
> > require some kind of back-off or limit, but that would need to be
> > implemented in a more central place rather than in each and every usb
> > driver (as has been discussed in the past).
> 
> Exactly. How would that look like conceptually?
> A centralized work with a pool of URBs to be retried after a delay
> and eventually a device reset?

I haven't tried to solve this yet, so I don't have a solution, but
ideally this would work seamlessly for drivers either by handling it in
core or possibly in the affected host-controller drivers if it's just
some of them.

If that's not doable, we should at least try to provide a generic
implementation which we'd then need to hook up each and every driver to
use.
 
> Handling unbinding a driver would be tough, though.

Why would that be a problem? We should be able to differentiate a
stopped URB from other errors, right?

Johan

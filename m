Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1410B774207
	for <lists+linux-usb@lfdr.de>; Tue,  8 Aug 2023 19:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbjHHRco (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Aug 2023 13:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234728AbjHHRby (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Aug 2023 13:31:54 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 1CA9421E6A
        for <linux-usb@vger.kernel.org>; Tue,  8 Aug 2023 09:13:51 -0700 (PDT)
Received: (qmail 162238 invoked by uid 1000); 8 Aug 2023 11:13:08 -0400
Date:   Tue, 8 Aug 2023 11:13:08 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH 2/2] usb: ehci: unlink itd/sitds from hardware
 list if the controller has stopped periodic schedule
Message-ID: <1d06506b-e610-4aba-8449-8be87c3bd5f6@rowland.harvard.edu>
References: <20230718112600.3969141-1-xu.yang_2@nxp.com>
 <20230718112600.3969141-2-xu.yang_2@nxp.com>
 <52e62d2e-a82a-4c9f-86ce-3ddad3efffb5@rowland.harvard.edu>
 <DB7PR04MB4505A7CDE9FC53EFEFD3D9F58C07A@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <fbd403ba-b6aa-47f3-a361-b122a028334e@rowland.harvard.edu>
 <DB7PR04MB45059312D4FB6ED356E0A7958C0DA@DB7PR04MB4505.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR04MB45059312D4FB6ED356E0A7958C0DA@DB7PR04MB4505.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 08, 2023 at 10:03:39AM +0000, Xu Yang wrote:
> Hi Alan,
> 
> > On Sat, Jul 29, 2023 at 06:55:07AM +0000, Xu Yang wrote:
> > > Many thanks for your comments and suggestions.
> > >
> > > Yes, there is a "live" variable in scan_isoc() to handle the case where
> > > root hub has stopped periodic schedule. I have rechecked the root cause
> > > of the issue , that is the USB controller has disabled the port (PE cleared)
> > > and asserted USBERRINT when frame babble is detected, but PEC is not
> > > asserted. Therefore, the SW didn't aware that port has been disabled.
> > > The periodic schedule keeps running at this moment. Then the SW keeps
> > > sending packets to this port, but all of the transfers will fail. But periodic
> > > schedule will also be disabled after a period of time. Finally, all of the linked
> > > itds are penging there. The code can't enter into scan_isoc() if only USBERRINT
> > > is asserted.
> > 
> > That's not true.  The io_watchdog timer continues to fire periodically
> > (at 100 ms intervals) as long as isoc_count > 0.  The timer's handler is
> > ehci_work(), which calls scan_isoc() if isoc_count > 0.
> 
> Yes, the io_watchdog timer will cleanup the isoc periodically as long as
> isoc_count > 0. 
> 
> I did see all of the linked itds are pending there in my case at the end. After my
> debug, I found the chipidea/host.c had set ehci->need_io_watchdog to 0 which
> will have impact on turn_on_io_watchdog().
> 
> The host has enabled 1 intr endpoint and 2 isoc endpoints from USB camera.
> Therefore, ehci->intr_count is always 1 and ehci->isoc_count is changing from
> time to time during camera is running. When PE is cleared by HW, isoc_count
> may be decreased to 0 after scan_isoc(). When turn_on_io_watchdog() is called,
> EHCI_HRTIMER_IO_WATCHDOG event will not be enabled due to isoc_count=0
> and need_io_watchdog=0 too. When isoc urb is submited again, enable_periodic()
> will still not enable EHCI_HRTIMER_IO_WATCHDOG event due to periodic_count>0.

Ooh, that's a bug.  enable_periodic() should call turn_on_io_watchdog() 
no matter what value periodic_count has.  Would you like to fix it?

Alan Stern

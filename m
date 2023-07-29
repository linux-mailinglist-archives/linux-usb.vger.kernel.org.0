Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E86EC768027
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jul 2023 16:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjG2Oxo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Jul 2023 10:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbjG2Oxn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Jul 2023 10:53:43 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 61DB935B3
        for <linux-usb@vger.kernel.org>; Sat, 29 Jul 2023 07:53:41 -0700 (PDT)
Received: (qmail 69887 invoked by uid 1000); 29 Jul 2023 10:53:40 -0400
Date:   Sat, 29 Jul 2023 10:53:40 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH 2/2] usb: ehci: unlink itd/sitds from hardware
 list if the controller has stopped periodic schedule
Message-ID: <fbd403ba-b6aa-47f3-a361-b122a028334e@rowland.harvard.edu>
References: <20230718112600.3969141-1-xu.yang_2@nxp.com>
 <20230718112600.3969141-2-xu.yang_2@nxp.com>
 <52e62d2e-a82a-4c9f-86ce-3ddad3efffb5@rowland.harvard.edu>
 <DB7PR04MB4505A7CDE9FC53EFEFD3D9F58C07A@DB7PR04MB4505.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR04MB4505A7CDE9FC53EFEFD3D9F58C07A@DB7PR04MB4505.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 29, 2023 at 06:55:07AM +0000, Xu Yang wrote:
> Many thanks for your comments and suggestions.
> 
> Yes, there is a "live" variable in scan_isoc() to handle the case where
> root hub has stopped periodic schedule. I have rechecked the root cause
> of the issue , that is the USB controller has disabled the port (PE cleared)
> and asserted USBERRINT when frame babble is detected, but PEC is not
> asserted. Therefore, the SW didn't aware that port has been disabled. 
> The periodic schedule keeps running at this moment. Then the SW keeps
> sending packets to this port, but all of the transfers will fail. But periodic
> schedule will also be disabled after a period of time. Finally, all of the linked
> itds are penging there. The code can't enter into scan_isoc() if only USBERRINT
> is asserted.

That's not true.  The io_watchdog timer continues to fire periodically 
(at 100 ms intervals) as long as isoc_count > 0.  The timer's handler is 
ehci_work(), which calls scan_isoc() if isoc_count > 0.

> For this issue, I think the SW needs to aware that the port has been disabled
> although PEC not asserted by HW. I will send another patch to fix this issue
> later.

Yes, that sounds like a nasty problem.  The kernel wouldn't realize 
that the device had disconnected.

Alan Stern

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D03874DB6EA
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 18:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240248AbiCPRKe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 13:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbiCPRKe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 13:10:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DFDE3BBF8
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 10:09:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 12FA6B81AA4
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 17:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45254C340E9;
        Wed, 16 Mar 2022 17:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1647450556;
        bh=pXHanu1jPecynhrlezuQ7RecO3KeWabVU412hsrJ3As=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n0J3f8nmnIeqVotPzjkhBjz96EMSln3NKIL41CT2hmVCw1/sCpfqNbmskJxf3DNlS
         ZUoLtjyr8t3UkvpvdkmdPfDTXeY3j9uxnogg0L5OfXLOFt3GlrA/Jpec5bBAsVrz38
         n0iPLjxOfs78uwSfblq6felT+M8QD8iZyK3crC2A=
Date:   Wed, 16 Mar 2022 18:09:13 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: refcount underflow on stm32mp1
Message-ID: <YjIZuY2qXGD/Toqf@kroah.com>
References: <20220316164724.uic3azim4mhp6jvl@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220316164724.uic3azim4mhp6jvl@pengutronix.de>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 16, 2022 at 05:47:24PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> on an stm32mp157a based machine I encounter the following problem during
> boot:
> 
> [    2.031752] using random self ethernet address
> [    2.034869] using random host ethernet address
> [    2.039329] using random self ethernet address
> [    2.043986] using random host ethernet address
> [    2.049186] usb0: HOST MAC 6a:74:a8:25:a5:f9
> [    2.052482] usb0: MAC f6:83:b5:19:02:4f
> [    2.056631] Mass Storage Function, version: 2009/09/11
> [    2.061408] LUN: removable file: (no medium)
> [    2.065652] no file given for LUN0
> [    2.111423] g_multi 49000000.usb-otg: failed to start g_multi: -22
> [    2.116359] ------------[ cut here ]------------
> [    2.120762] WARNING: CPU: 0 PID: 7 at lib/refcount.c:28 dwc2_hsotg_remove+0x1c/0x2c
> [    2.128541] refcount_t: underflow; use-after-free.
> [    2.133214] Modules linked in:
> [    2.136229] CPU: 0 PID: 7 Comm: kworker/u4:0 Not tainted 5.17.0-rc8-dirty #10
> [    2.143351] Hardware name: STM32 (Device Tree Support)
> [    2.148482] Workqueue: events_unbound deferred_probe_work_func
> [    2.154314]  unwind_backtrace from show_stack+0x18/0x1c
> [    2.159515]  show_stack from dump_stack_lvl+0x40/0x4c
> [    2.164555]  dump_stack_lvl from __warn+0xd8/0x17c
> [    2.169334]  __warn from warn_slowpath_fmt+0x98/0xc8
> [    2.174287]  warn_slowpath_fmt from dwc2_hsotg_remove+0x1c/0x2c
> [    2.180196]  dwc2_hsotg_remove from dwc2_driver_probe+0x59c/0x790
> [    2.186278]  dwc2_driver_probe from platform_probe+0x64/0xc0
> [    2.191926]  platform_probe from really_probe+0x1ac/0x470
> [    2.197312]  really_probe from __driver_probe_device+0xa8/0x20c
> [    2.203220]  __driver_probe_device from driver_probe_device+0x3c/0xcc
> [    2.209650]  driver_probe_device from __device_attach_driver+0xac/0x124
> [    2.216254]  __device_attach_driver from bus_for_each_drv+0x84/0xc8
> [    2.222511]  bus_for_each_drv from __device_attach+0xcc/0x1d4
> [    2.228245]  __device_attach from bus_probe_device+0x8c/0x94
> [    2.233894]  bus_probe_device from deferred_probe_work_func+0x9c/0xdc
> [    2.240324]  deferred_probe_work_func from process_one_work+0x210/0x584
> [    2.246929]  process_one_work from worker_thread+0x214/0x544
> [    2.252576]  worker_thread from kthread+0xf0/0x120
> [    2.257356]  kthread from ret_from_fork+0x14/0x2c
> [    2.262047] Exception stack(0xc190ffb0 to 0xc190fff8)
> [    2.267089] ffa0:                                     00000000 00000000 00000000 00000000
> [    2.275260] ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    2.283426] ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    2.290196] ---[ end trace 0000000000000000 ]---
> 
> This happens on v5.15 and on v5.17-rc8.
> 
> I didn't try to debug this further, just wanted to let you know ...

So it's always been an issue?

git bisect?

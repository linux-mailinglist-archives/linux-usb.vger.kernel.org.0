Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA28B78D897
	for <lists+linux-usb@lfdr.de>; Wed, 30 Aug 2023 20:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235304AbjH3Saw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Aug 2023 14:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243159AbjH3KNv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Aug 2023 06:13:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC4B1B0
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 03:13:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2D847628E6
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 10:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F22C433C8;
        Wed, 30 Aug 2023 10:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1693390427;
        bh=lvs6fSVJlVDaE94eRD/FlJeZ9oOuL8z7xTGSQ0EB5Wg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VzRLVTGt3SpGnl6a0CG2Ms7Ihv92Kn/N9BT1LvVi/bK5u+4nJP7rolZweEiBbVbc0
         e2qbjMDdX6J+1tsIS6RCf+tNgIqpS4zr4cG2kXH9iIE5iiGUz7ELT77lgrW44wjxtR
         Ux9kVHFVD4ceOO3zBksog6TuWQrQxlZ8e45kRQVI=
Date:   Wed, 30 Aug 2023 12:13:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux@roeck-us.net, kernel@collabora.com
Subject: Re: [PATCH] usb: hub: Guard against accesses to uninitialized BOS
 descriptors
Message-ID: <2023083007-vowed-latitude-acef@gregkh>
References: <20230830100418.1952143-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230830100418.1952143-1-ricardo.canuelo@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 30, 2023 at 12:04:18PM +0200, Ricardo Cañuelo wrote:
> Many functions in drivers/usb/core/hub.c and drivers/usb/core/hub.h
> access fields inside udev->bos without checking if it was allocated and
> initialized. If usb_get_bos_descriptor() fails for whatever
> reason, udev->bos will be NULL and those accesses will result in a
> crash:
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000018
> PGD 0 P4D 0
> Oops: 0000 [#1] PREEMPT SMP NOPTI
> CPU: 5 PID: 17818 Comm: kworker/5:1 Tainted: G W 5.15.108-18910-gab0e1cb584e1 #1 <HASH:1f9e 1>
> Hardware name: Google Kindred/Kindred, BIOS Google_Kindred.12672.413.0 02/03/2021
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:hub_port_reset+0x193/0x788
> Code: 89 f7 e8 20 f7 15 00 48 8b 43 08 80 b8 96 03 00 00 03 75 36 0f b7 88 92 03 00 00 81 f9 10 03 00 00 72 27 48 8b 80 a8 03 00 00 <48> 83 78 18 00 74 19 48 89 df 48 8b 75 b0 ba 02 00 00 00 4c 89 e9
> RSP: 0018:ffffab740c53fcf8 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffffa1bc5f678000 RCX: 0000000000000310
> RDX: fffffffffffffdff RSI: 0000000000000286 RDI: ffffa1be9655b840
> RBP: ffffab740c53fd70 R08: 00001b7d5edaa20c R09: ffffffffb005e060
> R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
> R13: ffffab740c53fd3e R14: 0000000000000032 R15: 0000000000000000
> FS: 0000000000000000(0000) GS:ffffa1be96540000(0000) knlGS:0000000000000000
> CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000018 CR3: 000000022e80c005 CR4: 00000000003706e0
> Call Trace:
> hub_event+0x73f/0x156e
> ? hub_activate+0x5b7/0x68f
> process_one_work+0x1a2/0x487
> worker_thread+0x11a/0x288
> kthread+0x13a/0x152
> ? process_one_work+0x487/0x487
> ? kthread_associate_blkcg+0x70/0x70
> ret_from_fork+0x1f/0x30

Did you mean to loose the indentation here?

> Fall back to a default behavior if the BOS descriptor isn't accessible
> and skip all the functionalities that depend on it: LPM support checks,
> Super Speed capabilitiy checks, U1/U2 states setup.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> Cc: stable <stable@vger.kernel.org>

What commit id does this fix?

thanks,

greg k-h

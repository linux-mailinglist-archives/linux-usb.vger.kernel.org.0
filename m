Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC0B56CBCB7
	for <lists+linux-usb@lfdr.de>; Tue, 28 Mar 2023 12:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232355AbjC1KmR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Mar 2023 06:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbjC1KmP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Mar 2023 06:42:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC8F57A9F
        for <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 03:42:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3B766616C4
        for <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 10:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AD7C433D2;
        Tue, 28 Mar 2023 10:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1680000132;
        bh=lYenctFbmynjU3acu8B3MCDMUrfaEMrtqmakXRTrb5I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xoHJXHOhIS+ZkVOpon2sLHFvnE5wJmumJ7iEMgQAqVcPELD0ha6GzNNYe1BcctGMa
         CtDrwVFeDr0hV0YiNJP0572ZI/QmD6TB9OqTl5OcHGQ0OgTVdw3PuqLc+UJdTsRA2F
         yRUgWLlGpYfb7NGiuzgHZKEtf8iLrDlqWcBujK1o=
Date:   Tue, 28 Mar 2023 12:42:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "YoungJun.Park" <her0gyugyu@gmail.com>
Cc:     linux-usb@vger.kernel.org, youngjun.park@ahnlab.com,
        her0gyu@naver.com
Subject: Re: Question of possible concurrent xhci debugfs file
Message-ID: <ZCLEgXfzbsEb75lN@kroah.com>
References: <20230328063020.GA1824187@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328063020.GA1824187@ubuntu>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 27, 2023 at 11:30:20PM -0700, YoungJun.Park wrote:
> I got a panic dump which happend on kernel(
> I check the both of CentOS and mainline kernel
> And I assume it could be happend on mainline kernel.
> (like I said assume)

Note, CentOS uses a very old and obsolete kernel, nothing we can do
about that mess, please get support for that from the company that
provided it.

> I think xhci-debugfs file creation check the creation of
> NULL parent dentry. Is it right? (drivers/usb/host/xhci-debugfs.c)

Why is that needed?

> The contents below is the what I analyze.
> 
> 1. A lot of usb error
> ...
> [1994159.974407] usb 1-2: device descriptor read/64, error -71
> [1994160.187902] usb 1-2: new low-speed USB device number 36 using xhci_hcd
> [1994160.302634] usb 1-2: device descriptor read/64, error -71
> [1994160.562027] usb 1-2: device descriptor read/64, error -71
> [1994160.663789] usb usb1-port2: unable to enumerate USB device
> [1994162.256029] usb 1-2: new low-speed USB device number 37 using xhci_hcd
> [1994162.370764] usb 1-2: device descriptor read/64, error -71
> [1994162.585258] usb 1-2: device descriptor read/64, error -71
> [1994162.797751] usb 1-2: new low-speed USB device number 38 using xhci_hcd
> [1994162.912484] usb 1-2: device descriptor read/64, error -71
> [1994163.141944] usb 1-2: device descriptor read/64, error -71
> [1994163.243712] usb usb1-port2: attempt power cycle.
> ...

That has nothing to do with debugfs.

> 2. After that panic happend and I got a dump.
> The cause of panic reading "/sys/kernel/debug/trbs" which is abnormal.
> (which have bad xhci_ring private data)
> the file must be on the "/sys/kernel/debug/usb/~~~".
> 
> sh> bt
> PID: 91416  TASK: ffff8d68fcc54200  CPU: 1   COMMAND: "fbmons"
>  #0 [ffff8d679a6cbad0] machine_kexec at ffffffff9e2662c4
>  #1 [ffff8d679a6cbb30] __crash_kexec at ffffffff9e322a32
>  #2 [ffff8d679a6cbc00] crash_kexec at ffffffff9e322b20
>  #3 [ffff8d679a6cbc18] oops_end at ffffffff9e98d798
>  #4 [ffff8d679a6cbc40] no_context at ffffffff9e275d14
>  #5 [ffff8d679a6cbc90] __bad_area_nosemaphore at ffffffff9e275fe2
>  #6 [ffff8d679a6cbce0] bad_area_nosemaphore at ffffffff9e276104
>  #7 [ffff8d679a6cbcf0] __do_page_fault at ffffffff9e990750
>  #8 [ffff8d679a6cbd60] do_page_fault at ffffffff9e990975
>  #9 [ffff8d679a6cbd90] page_fault at ffffffff9e98c778
>     [exception RIP: xhci_ring_trb_show+29]
>     RIP: ffffffff9e76005d  RSP: ffff8d679a6cbe40  RFLAGS: 00010246
>     RAX: ffff8d497b0fe018  RBX: 0000000000000000  RCX: 0000001309207f9b
>     RDX: fffffffffffffff4  RSI: 0000000000000001  RDI: ffff8d6939b8fd40
>     RBP: ffff8d679a6cbe60   R8: ffff8d49ffa5f1a0   R9: ffff8d3b3fc07300
>     R10: ffff8d3b3fc07300  R11: ffffffff9e3de9fd  R12: 0000000000000000
>     R13: 0000000000000000  R14: ffff8d6939b8fd40  R15: ffff8d6939b8fd40
>     ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0018
> #10 [ffff8d679a6cbe68] seq_read at ffffffff9e476d10
> #11 [ffff8d679a6cbed8] vfs_read at ffffffff9e44e3ff
> #12 [ffff8d679a6cbf08] sys_read at ffffffff9e44f27f
> #13 [ffff8d679a6cbf50] system_call_fastpath at ffffffff9e995f92
>     RIP: 00007f5f9749f6fd  RSP: 00007f5f84c73700  RFLAGS: 00000293
>     RAX: 0000000000000000  RBX: 00007f5f7066a390  RCX: ffffffffffffffff
>     RDX: 0000000000000400  RSI: 00007f5f706d2270  RDI: 0000000000000016
>     RBP: 00007f5f706d2270   R8: 00007f5f953e73a0   R9: 00007f5f953e7388
>     R10: 0000000000000040  R11: 0000000000000293  R12: 0000000000000400
>     R13: 00007f5f84c7354c  R14: 0000000022100004  R15: 00007f5f866c5368
>     ORIG_RAX: 0000000000000000  CS: 0033  SS: 002b

So the xhci driver is crashing here?

> 3. I found a another abnormal xhci debugfs file ep_context in dump. 
> Check xhci_slot_priv is alive and find the root is NULL.
> 
> crash> files -d 0xffff8d68fe8f0000
>      DENTRY           INODE           SUPERBLK     TYPE PATH
> ffff8d68fe8f0000 ffff8d489e979e10 ffff8d3b19169800 REG  /sys/kernel/debug/ep-context
> 
> crash > struct xchi_slot_priv 0xffff8d4812492c0
> struct xhci_slot_priv {
> ...
>   root = 0x0, 
> ...
>   dev = 0xffff8d497b0fe000
> }
> 
> 4. Looking into the mainline kernel code, I finally concluded that
> /sys/fs/debug/"interface file" could be made.
> 
> drivers/usb/host/xhci-debugfs.c
> xhci_debugfs_create_slot function
> ...
> priv->root = debugfs_create_dir(priv->name, xhci->debugfs_slots); // root can be NULL

How is root NULL here?  What caused that to happen?  Shouldn't you fix
that issue here, that's not a general debugfs problem.

thanks,

greg k-h

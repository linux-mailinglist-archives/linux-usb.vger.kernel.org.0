Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57B366CB72B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Mar 2023 08:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjC1Ga1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Mar 2023 02:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjC1Ga0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Mar 2023 02:30:26 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A70C7
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 23:30:25 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id le6so10679320plb.12
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 23:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679985024;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qqbcwIOgRTbuBMbuvPExQ8FvDcu52HzRYtuXdsAKAaQ=;
        b=Jlbua3G4mn6e8irv/4Z3djma6FOEIBil6ys1UkvKIZe9ZZivwLCdzXvDvaqVsItj3w
         NYk0rkBr3BiLUpLPdqBL4W+9LxiIlv1EuatRft2O24IOm1ToLKX0tc0YcOktPzO8eQFA
         ILfE7aYtU2P/sjzEPIGzfIUL0BIxl3faCD6b1EKuIUP+mqKvNJ1gui9NqtHap6HefmjD
         SJ7JIlsUYseAs95ZoX1EH6DerWBF07sU5nL8CjNT9s5veZecHDTBSjR9/x5pDsxbXmbc
         jGqPvRvUjWkpH/UQuZpONmi9QatzPN32VyX9gVNfJI6yXu1m4/nt+U0WBShkGAeueQtm
         4Kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679985024;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qqbcwIOgRTbuBMbuvPExQ8FvDcu52HzRYtuXdsAKAaQ=;
        b=QzyZbC7hhFCZJ3SdnrnHZvO5bZXObQaNDPFgwJU0ot1dazmcUeLtqfXXWgg0Pl/L70
         L09AimrEVZKWTPYYF6KCr8xEjwmo5ZbI/0b5/B5/62dwyiXcYMv4yxXiqZWGaoeKDezv
         FemBPA25TmfyhpZKUgeVcL1xNuWqhphSQRR1JhJrkiMnx+2MyIvnLO/CAmYzqPu9tAVV
         H8N1OH9RR0BwVdeUEeplCJ3Y3C+OgxxSgsVrqzhHBiKdz+5w3H4ZjbNnYpsJxpbJ6PiZ
         U7y2ImXgwpp/aUYVhy8YNCWT3f3y7uy8Qp+Is2I6WNmj7Aj9RgKIZaWOdN6xiT513tQD
         M+Sw==
X-Gm-Message-State: AO0yUKVfKejEcNJ3OSJneeYNA55dc3Jj9MNfw5lqlunY7A6l3Cs0C1ae
        Fee6HdTpZWQfBEoXdo/rTZgyvsYpOaA=
X-Google-Smtp-Source: AK7set/aAUXCXbRS9U7WToKZNT8Pl+WQmxijVRRtORJnGhQ45+azDqXHtOulFs9DOM80JeuGhojupg==
X-Received: by 2002:a05:6a20:6d04:b0:d7:5cf7:9019 with SMTP id fv4-20020a056a206d0400b000d75cf79019mr10771569pzb.25.1679985024343;
        Mon, 27 Mar 2023 23:30:24 -0700 (PDT)
Received: from ubuntu ([1.221.137.163])
        by smtp.gmail.com with ESMTPSA id i12-20020aa787cc000000b00580e3917af7sm13177660pfo.117.2023.03.27.23.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 23:30:23 -0700 (PDT)
Date:   Mon, 27 Mar 2023 23:30:20 -0700
From:   "YoungJun.Park" <her0gyugyu@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     youngjun.park@ahnlab.com, her0gyu@naver.com
Subject: Question of possible concurrent xhci debugfs file
Message-ID: <20230328063020.GA1824187@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I got a panic dump which happend on kernel(
I check the both of CentOS and mainline kernel
And I assume it could be happend on mainline kernel.
(like I said assume)

I think xhci-debugfs file creation check the creation of
NULL parent dentry. Is it right? (drivers/usb/host/xhci-debugfs.c)

The contents below is the what I analyze.

1. A lot of usb error
...
[1994159.974407] usb 1-2: device descriptor read/64, error -71
[1994160.187902] usb 1-2: new low-speed USB device number 36 using xhci_hcd
[1994160.302634] usb 1-2: device descriptor read/64, error -71
[1994160.562027] usb 1-2: device descriptor read/64, error -71
[1994160.663789] usb usb1-port2: unable to enumerate USB device
[1994162.256029] usb 1-2: new low-speed USB device number 37 using xhci_hcd
[1994162.370764] usb 1-2: device descriptor read/64, error -71
[1994162.585258] usb 1-2: device descriptor read/64, error -71
[1994162.797751] usb 1-2: new low-speed USB device number 38 using xhci_hcd
[1994162.912484] usb 1-2: device descriptor read/64, error -71
[1994163.141944] usb 1-2: device descriptor read/64, error -71
[1994163.243712] usb usb1-port2: attempt power cycle.
...

2. After that panic happend and I got a dump.
The cause of panic reading "/sys/kernel/debug/trbs" which is abnormal.
(which have bad xhci_ring private data)
the file must be on the "/sys/kernel/debug/usb/~~~".

sh> bt
PID: 91416  TASK: ffff8d68fcc54200  CPU: 1   COMMAND: "fbmons"
 #0 [ffff8d679a6cbad0] machine_kexec at ffffffff9e2662c4
 #1 [ffff8d679a6cbb30] __crash_kexec at ffffffff9e322a32
 #2 [ffff8d679a6cbc00] crash_kexec at ffffffff9e322b20
 #3 [ffff8d679a6cbc18] oops_end at ffffffff9e98d798
 #4 [ffff8d679a6cbc40] no_context at ffffffff9e275d14
 #5 [ffff8d679a6cbc90] __bad_area_nosemaphore at ffffffff9e275fe2
 #6 [ffff8d679a6cbce0] bad_area_nosemaphore at ffffffff9e276104
 #7 [ffff8d679a6cbcf0] __do_page_fault at ffffffff9e990750
 #8 [ffff8d679a6cbd60] do_page_fault at ffffffff9e990975
 #9 [ffff8d679a6cbd90] page_fault at ffffffff9e98c778
    [exception RIP: xhci_ring_trb_show+29]
    RIP: ffffffff9e76005d  RSP: ffff8d679a6cbe40  RFLAGS: 00010246
    RAX: ffff8d497b0fe018  RBX: 0000000000000000  RCX: 0000001309207f9b
    RDX: fffffffffffffff4  RSI: 0000000000000001  RDI: ffff8d6939b8fd40
    RBP: ffff8d679a6cbe60   R8: ffff8d49ffa5f1a0   R9: ffff8d3b3fc07300
    R10: ffff8d3b3fc07300  R11: ffffffff9e3de9fd  R12: 0000000000000000
    R13: 0000000000000000  R14: ffff8d6939b8fd40  R15: ffff8d6939b8fd40
    ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0018
#10 [ffff8d679a6cbe68] seq_read at ffffffff9e476d10
#11 [ffff8d679a6cbed8] vfs_read at ffffffff9e44e3ff
#12 [ffff8d679a6cbf08] sys_read at ffffffff9e44f27f
#13 [ffff8d679a6cbf50] system_call_fastpath at ffffffff9e995f92
    RIP: 00007f5f9749f6fd  RSP: 00007f5f84c73700  RFLAGS: 00000293
    RAX: 0000000000000000  RBX: 00007f5f7066a390  RCX: ffffffffffffffff
    RDX: 0000000000000400  RSI: 00007f5f706d2270  RDI: 0000000000000016
    RBP: 00007f5f706d2270   R8: 00007f5f953e73a0   R9: 00007f5f953e7388
    R10: 0000000000000040  R11: 0000000000000293  R12: 0000000000000400
    R13: 00007f5f84c7354c  R14: 0000000022100004  R15: 00007f5f866c5368
    ORIG_RAX: 0000000000000000  CS: 0033  SS: 002b

3. I found a another abnormal xhci debugfs file ep_context in dump. 
Check xhci_slot_priv is alive and find the root is NULL.

crash> files -d 0xffff8d68fe8f0000
     DENTRY           INODE           SUPERBLK     TYPE PATH
ffff8d68fe8f0000 ffff8d489e979e10 ffff8d3b19169800 REG  /sys/kernel/debug/ep-context

crash > struct xchi_slot_priv 0xffff8d4812492c0
struct xhci_slot_priv {
...
  root = 0x0, 
...
  dev = 0xffff8d497b0fe000
}

4. Looking into the mainline kernel code, I finally concluded that
/sys/fs/debug/"interface file" could be made.

drivers/usb/host/xhci-debugfs.c
xhci_debugfs_create_slot function
...
priv->root = debugfs_create_dir(priv->name, xhci->debugfs_slots); // root can be NULL
...
 xhci_debugfs_create_ring_dir(xhci, &dev->eps[0].ring,
                                     "ep00", priv->root); // make a file
...

fs/debugfs/inode
start_creating function
...
if (!parent) 
	parent = debugfs_mount->mnt_root; // make a file on /sys/kernel/debug
...

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3109A4AF802
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 18:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238126AbiBIRZP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 12:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237350AbiBIRZN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 12:25:13 -0500
Received: from smtp1.lauterbach.com (smtp1.lauterbach.com [62.154.241.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBFC9C05CB86
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 09:25:15 -0800 (PST)
Received: (qmail 6855 invoked by uid 484); 9 Feb 2022 17:25:14 -0000
X-Qmail-Scanner-Diagnostics: from ingpc2.intern.lauterbach.com by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.44):. 
 Processed in 0.362476 secs); 09 Feb 2022 17:25:14 -0000
Received: from ingpc2.intern.lauterbach.com (Authenticated_SSL:irohloff@[10.2.10.44])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <gregkh@linuxfoundation.org>; 9 Feb 2022 17:25:12 -0000
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v3 0/1] Zerocopy for USB Gadget FunctionFS
Date:   Wed,  9 Feb 2022 18:25:06 +0100
Message-Id: <20220209172507.97659-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The commit f7d34b445abc00e979b7 ("USB: Add support for usbfs zerocopy.")
added support for zerocopy operations for an USB Host via devio.c

The idea is to mmap buffers into user space, which are then filled
with data (either by the kernel for reads or by the user for writes).

Using these mmapped buffers avoids copying data between kernel space
and user space.

The patch proposed here, tries to do the same for a USB Gadget and a
user space application using USB Gaget FunctionFS.

Note: As long as you do not use mmap and/or libaio, FunctionFS should
behave exactly as before.

If you want to try out, user space demonstration code is here:

   https://github.com/trace32/test_usb_ffs



V3:
As requested: Use a spinlock instead of atomic64 to
tally the amount of used kernel memory by mmap calls.

ADDITIONALLY (compared to V2, meaning of limit == 0 changed):
The amount of memory user space processes might mmap, is per default
limited to 16 MiB per FunctionFS mount point.

This limit can be modified at the time FunctionFS is mounted, by using
the mount option "mmap_memory_mb=<value>", specifying the allowed mmap
space in MiB.  Example:

   mount -t functionfs -ommap_memory_mb=1 usb0 /usbfunc

In V3, a value of 0 for "mmap_memory_mb", means that mmap functionality
is DISABLED: All calls to mmap will return with -ENOMEM.

Rationale:
I can't think of a reason, why you should ever want to have UNLIMITED
mmap calls (this just means user-space can easily force the kernel to
kmalloc all space available).
Additionally: If you want a real high limit, just use
  mmap_memory_mb=1000000
or some similar big number.

In contrast: I think being able to forbid mmap might be useful.
So for V3: "mmap_memory_mb=0" means no mmap allowed (will always return
-ENOMEM).




V2:
The mmapped buffers are now associated with a "struct file *".

This is achieved by adding another in-between 
"struct ffs_ep_listener", which is allocated per "struct file *".

I believe I botched that up in the previous V1 proposal;

It seems using a list of mmapped segments associated to a 
"struct file *" is the right approach?



Ingo Rohloff (1):
  usb: gadget: f_fs: Support zerocopy transfers via mmap.

 drivers/usb/gadget/function/f_fs.c | 280 ++++++++++++++++++++++++++++-
 drivers/usb/gadget/function/u_fs.h |   7 +
 2 files changed, 281 insertions(+), 6 deletions(-)

-- 
2.17.1


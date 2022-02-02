Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB3D24A76B7
	for <lists+linux-usb@lfdr.de>; Wed,  2 Feb 2022 18:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbiBBRVF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Feb 2022 12:21:05 -0500
Received: from smtp1.lauterbach.com ([62.154.241.196]:58023 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiBBRVF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Feb 2022 12:21:05 -0500
Received: (qmail 12744 invoked by uid 484); 2 Feb 2022 17:21:03 -0000
X-Qmail-Scanner-Diagnostics: from ingpc2.intern.lauterbach.com by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.44):. 
 Processed in 0.345257 secs); 02 Feb 2022 17:21:03 -0000
Received: from ingpc2.intern.lauterbach.com (Authenticated_SSL:irohloff@[10.2.10.44])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <gregkh@linuxfoundation.org>; 2 Feb 2022 17:21:02 -0000
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     gregkh@linuxfoundation.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v2 0/1] Zerocopy for USB Gadget FunctionFS
Date:   Wed,  2 Feb 2022 18:20:55 +0100
Message-Id: <20220202172056.44722-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The
commit f7d34b445abc00e979b7 ("USB: Add support for usbfs zerocopy.")
added support for zerocopy operations for an USB Host via devio.c

The idea is to mmap buffers into user space, which are then filled
with data (either by the kernel for reads or by the user for writes).

Using these mmapped buffers avoids copying data between kernel space
and user space.

The patch proposed here, tries to do the same for a USB Gadget and a
user space application using USB Gaget FunctionFS.

Note: As long as you do not use mmap and/or libaio, FunctionFS should
behave exactly as before.

V2:

The mmapped buffers are now associated with a "struct file *".

This is achieved by adding another in-between 
"struct ffs_ep_listener", which is allocated per "struct file *".

I believe I botched that up in the previous V1 proposal;

It seems using a list of mmapped segments associated to a 
"struct file *" is the right approach?

To limit the amount of memory user space processes might mmap, per
default this is limited to 16 MiB per FunctionFS mount point.  This
limit can be modified at the time FunctionFS is mounted, by using the
mount option "mmap_memory_mb=<value>", specifying the allowed mmap
space in MiB.
Example:

   mount -t functionfs -ommap_memory_mb=1 usb0 /usbfunc

A value of 0 means there is NO LIMIT on the amount of memory a user
space application might mmap in total.

If you want to try out, I updated the demonstration code accordingly:

   https://github.com/trace32/test_usb_ffs

so long
  Ingo

Ingo Rohloff (1):
  usb: gadget: f_fs: Support zerocopy transfers via mmap.

 drivers/usb/gadget/function/f_fs.c | 268 ++++++++++++++++++++++++++++-
 drivers/usb/gadget/function/u_fs.h |   4 +
 2 files changed, 266 insertions(+), 6 deletions(-)

-- 
2.17.1


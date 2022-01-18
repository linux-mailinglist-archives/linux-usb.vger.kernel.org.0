Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB015492E44
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jan 2022 20:16:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245384AbiARTPx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jan 2022 14:15:53 -0500
Received: from smtp1.lauterbach.com ([62.154.241.196]:47993 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245370AbiARTPx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jan 2022 14:15:53 -0500
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 Jan 2022 14:15:53 EST
Received: (qmail 20673 invoked by uid 484); 18 Jan 2022 19:09:10 -0000
X-Qmail-Scanner-Diagnostics: from ingpc2.intern.lauterbach.com by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.44):. 
 Processed in 0.342122 secs); 18 Jan 2022 19:09:10 -0000
Received: from ingpc2.intern.lauterbach.com (Authenticated_SSL:irohloff@[10.2.10.44])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <balbi@kernel.org>; 18 Jan 2022 19:09:09 -0000
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH 0/1] Zerocopy for USB Gadget FunctionFS
Date:   Tue, 18 Jan 2022 20:08:48 +0100
Message-Id: <20220118190849.22084-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The
commit f7d34b445abc00e979b7 ("USB: Add support for usbfs zerocopy.")
added support for zerocopy operations for an USB Host via devio.c

The idea is to mmap buffers into user space, which are then filled
with data (either by the kernel for reads or by the user for writes).

Using these mmapped buffers avoids copying data between 
kernel space and user space.

The proposed patch here, does the same for a USB Gadget and an 
application using USB FunctionFS.

The proposed patch keeps one big list of mmaped buffers for the
whole f_fs.c module, rather then binding them to a particular
file descriptor.
The rational behind this is, that you then might even pass around
buffers between different endpoints and even different functions.

If you want to test this patch, I have some demonstration code here:

   https://github.com/trace32/test_usb_ffs

so long
  Ingo

Ingo Rohloff (1):
  usb: gadget: f_fs: Support zerocopy transfers via mmap.

 drivers/usb/gadget/function/f_fs.c | 230 ++++++++++++++++++++++++++++-
 1 file changed, 226 insertions(+), 4 deletions(-)

-- 
2.17.1


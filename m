Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 494412AF73C
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 18:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgKKROK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 12:14:10 -0500
Received: from smtp1.lauterbach.com ([62.154.241.196]:35761 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgKKROH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Nov 2020 12:14:07 -0500
X-Greylist: delayed 399 seconds by postgrey-1.27 at vger.kernel.org; Wed, 11 Nov 2020 12:14:07 EST
Received: (qmail 18554 invoked by uid 484); 11 Nov 2020 17:07:25 -0000
X-Qmail-Scanner-Diagnostics: from 10.2.10.44 by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.44):. 
 Processed in 0.088101 secs); 11 Nov 2020 17:07:25 -0000
Received: from unknown (HELO ingpc2.intern.lauterbach.com) (Authenticated_SSL:irohloff@[10.2.10.44])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <balbi@kernel.org>; 11 Nov 2020 17:07:24 -0000
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH 0/2] usb: gadget: User space URBs for FunctionFS
Date:   Wed, 11 Nov 2020 18:07:16 +0100
Message-Id: <20201111170718.3381-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I am working on a platform (Xilinx Zynq Ultrascale+), which
is supposed to work as a pure USB Device (not dual-role).

To get fast USB bulk transfers I wanted to have something similar
like USBDEVFS_SUBMITURB/USBDEVFS_REAPURB, but for an USB Device.

I now implement two new ioctls for FunctionFS:
  FUNCTIONFS_SUBMITBULKURB
  FUNCTIONFS_REAPBULKURB
which provide simliar functionality.

A similar functionality is already implemented via AIO. But: To use this
API, your user space environment needs to know how to use these system
calls.
Additionally the semantics of the ioctls is slightly different:
Usually you can only access a FunctionFS file if the FunctionFS is
already bound to an UDC (USB Device Controller) and the USB Device is
connected to a USB Host (which then enables the appropriate configuration
and USB endpoints).
These new ioctls behave different: You already can submit URBs before the
Function is bound to an UDC and before the USB Device is connected.
These "pending" URBs will be activated once the endpoints become active.

When the endpoints become deactivated (either by a disconnect from the
USB Host or by unbinding the UDC), active URBs are cancelled.

A user space program will then get a notification, that the URBs have
been cancelled and the status will indicate to the user space program,
that the connection was lost.
Via this mechanism a user space program can keep precise track, which
URBs succeeded and which URBs failed.

The final goal here is to be able to directly let user space provide data
buffers (via mmap I guess), which are then transferred via USB; but this
is the next step.

I implemented test code to demonstrate how to use these new ioctls.

Ingo Rohloff (2):
  usb: gadget: ffs: Implement user URBs for USB bulk endpoints
  usb: gadget: ffs: tools: test applications for user URBs.

 drivers/usb/gadget/function/f_fs.c            | 478 ++++++++++++++++++
 include/uapi/linux/usb/functionfs.h           |  14 +
 .../device_app/usb_func_echo.c                | 474 +++++++++++++++++
 .../ffs-urb-example/device_app/usb_gadget_mk  |  79 +++
 .../ffs-urb-example/host_app/usb_test_echo.c  | 370 ++++++++++++++
 5 files changed, 1415 insertions(+)
 create mode 100644 tools/usb/ffs-urb-example/device_app/usb_func_echo.c
 create mode 100644 tools/usb/ffs-urb-example/device_app/usb_gadget_mk
 create mode 100644 tools/usb/ffs-urb-example/host_app/usb_test_echo.c

-- 
2.17.1


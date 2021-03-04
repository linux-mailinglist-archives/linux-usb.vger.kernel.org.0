Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F079F32D69C
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 16:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234796AbhCDP0r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 10:26:47 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:62157 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234111AbhCDP0Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Mar 2021 10:26:24 -0500
Received: from fsav302.sakura.ne.jp (fsav302.sakura.ne.jp [153.120.85.133])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 124FP2XR030900;
        Fri, 5 Mar 2021 00:25:02 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav302.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp);
 Fri, 05 Mar 2021 00:25:02 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 124FOtn0030882
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Mar 2021 00:25:02 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH v4 00/12] usb: usbip: serialize attach/detach operations
Date:   Fri,  5 Mar 2021 00:24:43 +0900
Message-Id: <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <df337d16-2a6e-f671-7134-449d7da6a9cb@linuxfoundation.org>
References: <df337d16-2a6e-f671-7134-449d7da6a9cb@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/02/27 0:04, Shuah Khan wrote:
> I will send it out later on today.

Since I haven't received it, here comes an update.

Changes since v1:

  Tetsuo Handa found that the PTR_ERR() access in usbip_prepare_threads()
  in v1 was wrong, and fixed it in v2.

Changes since v2:

  The kernel test robot <lkp@intel.com> found the same error using
  scripts/coccinelle/tests/odd_ptr_err.cocci and
  Julia Lawall <julia.lawall@inria.fr> sent us a patch, but nothing
  changed because that error was already fixed in v2.

Changes since v3:

  Reduce lines changed in drivers/usb/usbip/stub_dev.c .
  Split into 12 patches.

Tetsuo Handa (12):
  usb: usbip: introduce usbip_event_mutex for serialization
  usb: usbip: vhci: serialize attach_store()/detach_store() against event_handler()
  usb: usbip: vudc: serialize usbip_sockfd_store() against event_handler()
  usb: usbip: stub: serialize usbip_sockfd_store() against event_handler()
  usb: usbip: don't reset tcp_socket at vhci_device_reset()
  usb: usbip: fix error handling of kthread_get_run()
  usb: usbip: preallocate kernel threads for consistent attach operation
  usb: usbip: check that stream socket is used
  usb: usbip: vhci: add automatic recovery to attach_store()
  usb: usbip: vudc: add automatic recovery to usbip_sockfd_store()
  usb: usbip: stub: add automatic recovery to usbip_sockfd_store()
  usb: usbip: remove unused kthread_get_run()

 drivers/usb/usbip/stub_dev.c     | 44 ++++++++++++++-----------
 drivers/usb/usbip/usbip_common.c | 55 ++++++++++++++++++++++++++++++++
 drivers/usb/usbip/usbip_common.h | 25 ++++++++-------
 drivers/usb/usbip/usbip_event.c  | 15 +++++++++
 drivers/usb/usbip/vhci_hcd.c     |  6 ----
 drivers/usb/usbip/vhci_sysfs.c   | 50 +++++++++++++++++++++--------
 drivers/usb/usbip/vudc_sysfs.c   | 50 +++++++++++++++++------------
 7 files changed, 176 insertions(+), 69 deletions(-)

-- 
2.18.4


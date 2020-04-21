Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD381B28FC
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2020 16:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgDUOGJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Apr 2020 10:06:09 -0400
Received: from mga03.intel.com ([134.134.136.65]:63242 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbgDUOGJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Apr 2020 10:06:09 -0400
IronPort-SDR: kELDaTvf+TKCQ8vgpx4AYUAsjN64F51y63uUAWlrJVtscvTjMkdbgW9rUpdMyKEf2yakxg5sle
 VBne96YnW8ew==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 07:05:49 -0700
IronPort-SDR: 1ymki/9n7usUjQrF2l61EH9rM971WXMXAtNSkeNIFI/lUMpqDqWbKLjCkA2uaXr4wHYpdVIZ7M
 KtFIBKcM2zgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,410,1580803200"; 
   d="scan'208";a="300618760"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2020 07:05:47 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/3] xhci fixes for usb-linus
Date:   Tue, 21 Apr 2020 17:08:19 +0300
Message-Id: <20200421140822.28233-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

These xhci fixes for usb-linus sort out halted empty endpoint handling,
protocol stall handling, and overcurrent handling.

Theses issues have caused usb devices to appear as if they stop working
suddenly, failed to enumerate LS/FS devices behind HS hubs (seen on some
audio devices), and host from freezing in case of suspend on over-current.

-Mathias 

Mathias Nyman (3):
  xhci: Fix handling halted endpoint even if endpoint ring appears empty
  xhci: prevent bus suspend if a roothub port detected a over-current
    condition
  xhci: Don't clear hub TT buffer on ep0 protocol stall

 drivers/usb/host/xhci-hub.c  |  9 +++++++
 drivers/usb/host/xhci-ring.c | 46 +++++++++++++++++++++++++++++++-----
 drivers/usb/host/xhci.c      | 14 +++++------
 drivers/usb/host/xhci.h      |  5 ++--
 4 files changed, 59 insertions(+), 15 deletions(-)

-- 
2.17.1


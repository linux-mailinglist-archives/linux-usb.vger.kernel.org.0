Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B679BEF40
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 12:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbfIZKH3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 06:07:29 -0400
Received: from mga14.intel.com ([192.55.52.115]:2189 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbfIZKH3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Sep 2019 06:07:29 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Sep 2019 03:07:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,551,1559545200"; 
   d="scan'208";a="203825676"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2019 03:07:27 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 00/14] usb: typec: UCSI driver overhaul
Date:   Thu, 26 Sep 2019 13:07:18 +0300
Message-Id: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ajay,

Here's the pretty much complete rewrite of the I/O handling that I was
talking about. The first seven patches are not actually related to
this stuff, but I'm including them here because the rest of the series
is made on top of them. I'm including also that fix patch I send you
earlier.

After this it should be easier to handle quirks. My idea how to handle
the multi-instance connector alt modes is that we "emulate" the PPM in
ucsi_ccg.c in order to handle them, so ucsi.c is not touched at all.

We can now get the connector alternate modes that the actual
controller supplies during probe - before registering the ucsi
interface - and squash all alt modes with the same SVID into one that
we supply to the ucsi.c when ever it sends GET_ALTERNATE_MODES
command. Also other alt mode commands like SET_NEW_CAM can have
special processing in ucsi_ccg.c and ucsi_ccg.c alone. There should
not be any problem with that anymore.

thanks,

Heikki Krogerus (14):
  usb: typec: Copy everything from struct typec_capability during
    registration
  usb: typec: Introduce typec_get_drvdata()
  usb: typec: Separate the operations vector
  usb: typec: tcpm: Start using struct typec_operations
  usb: typec: tps6598x: Start using struct typec_operations
  usb: typec: ucsi: Start using struct typec_operations
  usb: typec: Remove the callback members from struct typec_capability
  usb: typec: ucsi: ccg: Remove run_isr flag
  usb: typec: ucsi: Simplified interface registration and I/O API
  usb: typec: ucsi: acpi: Move to the new API
  usb: typec: ucsi: ccg: Move to the new API
  usb: typec: ucsi: Remove the old API
  usb: typec: ucsi: Remove struct ucsi_control
  usb: typec: ucsi: Remove all bit-fields

 drivers/usb/typec/class.c            | 125 +++---
 drivers/usb/typec/tcpm/tcpm.c        |  47 +--
 drivers/usb/typec/tps6598x.c         |  49 +--
 drivers/usb/typec/ucsi/displayport.c |  26 +-
 drivers/usb/typec/ucsi/trace.c       |  11 -
 drivers/usb/typec/ucsi/trace.h       |  79 +---
 drivers/usb/typec/ucsi/ucsi.c        | 592 ++++++++++++++-------------
 drivers/usb/typec/ucsi/ucsi.h        | 410 +++++++------------
 drivers/usb/typec/ucsi/ucsi_acpi.c   |  96 ++++-
 drivers/usb/typec/ucsi/ucsi_ccg.c    | 214 ++++------
 include/linux/usb/typec.h            |  38 +-
 11 files changed, 785 insertions(+), 902 deletions(-)

-- 
2.23.0


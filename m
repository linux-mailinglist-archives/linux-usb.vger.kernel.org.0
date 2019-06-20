Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 442984CA62
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 11:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbfFTJND (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 05:13:03 -0400
Received: from mga12.intel.com ([192.55.52.136]:40630 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725889AbfFTJND (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Jun 2019 05:13:03 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jun 2019 02:13:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,396,1557212400"; 
   d="scan'208";a="154060824"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga008.jf.intel.com with ESMTP; 20 Jun 2019 02:13:01 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB: fixes for v5.2-rc5
Date:   Thu, 20 Jun 2019 12:13:01 +0300
Message-ID: <87h88kbowy.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi Greg,

Just one pending fix this time.

Let me know if you need anything to be changed

cheers


The following changes since commit 9e0babf2c06c73cda2c0cd37a1653d823adb40ec:

  Linux 5.2-rc5 (2019-06-16 08:49:45 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-for-v5.2-rc5

for you to fetch changes up to 42de8afc40c97002fceb500e2331f6a722be3c14:

  usb: dwc2: Use generic PHY width in params setup (2019-06-18 10:27:14 +0300)

----------------------------------------------------------------
usb: fixes for v5.2-rc5

A single fix to take into account the PHY width during initialization of
dwc2 driver. This change allows deviceTree to pass PHY width if
necessary.

Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>

----------------------------------------------------------------
Jules Maselbas (1):
      usb: dwc2: Use generic PHY width in params setup

 drivers/usb/dwc2/params.c   | 9 +++++++++
 drivers/usb/dwc2/platform.c | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

-- 
balbi

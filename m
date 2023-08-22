Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C33D2784217
	for <lists+linux-usb@lfdr.de>; Tue, 22 Aug 2023 15:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233274AbjHVNcL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Aug 2023 09:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbjHVNcL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Aug 2023 09:32:11 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E2FA1
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 06:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692711129; x=1724247129;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QVhfhs/u7r5FOc588BfoBuVU5dUt1/3rhvcZIU1nKe0=;
  b=FIrAMjHBGc1/ALnDRpY82K0V6k2AVGQsx+1HAhO5W4lGjz1mC/m/4h6c
   BJIEZvqJCtrwtS5Vypc7TwweXVOXDuFWooFLfP0ud2PvHwCOh9JNDpVBN
   +j4cikik4qSKXzr/EBL82uvITkohfuSEKHU2yK3eEE5vH1uNtSz5JbgG2
   LeXdp00a+Ieo86VBz1R0dVshOIAOBtoresbB5zmnN0ieup7L9/u1SxUKs
   K2qUgEHoFij+Xp0zWoy/qSHqTyJdP2pvUMUryXW4oF0afB5hZd0cB1chi
   6WNFvOOFfHoGuKU43D0n4Deo9+JYoBVhdrHl+s3ZBkQQ/I2QlQuLCkq4l
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="440243743"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="440243743"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 06:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="879955041"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2023 06:32:10 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Benson Leung <bleung@google.com>
Cc:     Jameson Thies <jthies@google.com>,
        Prashant Malani <pmalani@google.com>,
        Won Chung <wonchung@google.com>, linux-usb@vger.kernel.org
Subject: [RFC PATCH 0/2] usb: Link USB devices with their USB Type-C partner counterparts
Date:   Tue, 22 Aug 2023 16:32:03 +0300
Message-Id: <20230822133205.2063210-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Benson,

RFC for now. I can't test these properly. If you guys could take over
this, I would much appreciated. I hope this is at least close to your
proposal.

With this (or something like it) you should be able to get
notification about USB connections and disconnections to your port
driver by implementing the new "attach" and "deattach" callbacks in
struct typec_partner_desc. The typec partner devices will also have
symlinks to the enumerated USB devices and vise versa.

I took a little shortcut and did not implement a proper device list.
Instead there is now only a member for the USB2 device and a member
for the USB3 device in struct typec_port, so with this only USB is
supported. But the API does not deal with struct usb_device, so
extending this to support other devices (TBT, Displayport, etc.) by
adding the actual device list should be fairly easy.

thanks,

Heikki Krogerus (2):
  usb: typec: Link enumerated USB devices with Type-C partner
  usb: Inform the USB Type-C class about enumerated devices

 drivers/usb/core/hub.c          |   4 ++
 drivers/usb/core/hub.h          |   3 +
 drivers/usb/core/port.c         |  19 +++++-
 drivers/usb/typec/class.c       | 108 +++++++++++++++++++++++++++++---
 drivers/usb/typec/class.h       |  16 +++++
 drivers/usb/typec/port-mapper.c |   9 ++-
 include/linux/usb/typec.h       |  37 +++++++++++
 7 files changed, 184 insertions(+), 12 deletions(-)

-- 
2.40.1


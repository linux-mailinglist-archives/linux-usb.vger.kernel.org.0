Return-Path: <linux-usb+bounces-1457-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7657C50AB
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 12:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48838282374
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 10:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463A6199A9;
	Wed, 11 Oct 2023 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4nYORMs"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ECD354FE
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 10:58:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8776F92
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 03:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697021908; x=1728557908;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H1OOcQnzxRLEeNXJ7lBq6Wt3dVxmSPcPecExllaliu0=;
  b=B4nYORMsAdfkIMPrlGdhwwZzL8zyDI1HJIxgLRSWtBLpBY2jIE27CTX4
   5mN+Ces24RLJ22PElzuIdjp/W37tiuMnZ94bUSVJfua5EqGRDtbgIK0FJ
   y31ulfMYpYsFe3+3JQUNMFU2xNrW3uzA52aS8O9bPv82o+3/LXveypQEj
   q2izaCLNogqKmJgWw8rZon28TgV2PM4hazjZdDBF76juwKMmXEOGSuqTs
   86Ozehq3zy+3PxrQfvgSuQrgPOL15vU/TPwT3SpXVpz91HkbFvzQFPNVo
   LtpzviR212W37FqW0WhF60fXf4G+tgFFeEEbhbLy361HbKmkw2arg/sZn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="6190638"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="6190638"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 03:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897589184"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="897589184"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2023 03:56:41 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jameson Thies <jthies@google.com>,
	Prashant Malani <pmalani@google.com>,
	Won Chung <wonchung@google.com>,
	linux-usb@vger.kernel.org,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH 0/2] usb: Link USB devices with their USB Type-C partner counterparts
Date: Wed, 11 Oct 2023 13:58:23 +0300
Message-Id: <20231011105825.320062-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

The idea for these comes from Benson. By letting the typec drivers
know what exactly was enumerated, they can power off everything that's
not needed.

The USB device and USB Type-C partner device will also be linked
together with symlinks in sysfs. If I uderstood correctly, you guys
(from ChromiumOS team) have already user for that. Let me know if I
got that wrong.

The original RFC:
https://lore.kernel.org/linux-usb/ZPCGnL4zgAKh1mGA@kuha.fi.intel.com/T/

thanks,

Heikki Krogerus (2):
  usb: typec: Link enumerated USB devices with Type-C partner
  usb: Inform the USB Type-C class about enumerated devices

 Documentation/ABI/testing/sysfs-bus-usb |   9 ++
 drivers/usb/core/hub.c                  |   4 +
 drivers/usb/core/hub.h                  |   3 +
 drivers/usb/core/port.c                 |  19 ++++-
 drivers/usb/typec/class.c               | 108 ++++++++++++++++++++++--
 drivers/usb/typec/class.h               |  16 ++++
 drivers/usb/typec/port-mapper.c         |   9 +-
 include/linux/usb/typec.h               |  37 ++++++++
 8 files changed, 193 insertions(+), 12 deletions(-)

-- 
2.40.1



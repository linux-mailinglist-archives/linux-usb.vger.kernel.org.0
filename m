Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD47B4116C9
	for <lists+linux-usb@lfdr.de>; Mon, 20 Sep 2021 16:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234538AbhITOZo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Sep 2021 10:25:44 -0400
Received: from mga07.intel.com ([134.134.136.100]:20391 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230089AbhITOZn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Sep 2021 10:25:43 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="286817088"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
   d="scan'208";a="286817088"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2021 07:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
   d="scan'208";a="612524843"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2021 07:24:14 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Benjamin Berg <bberg@redhat.com>,
        Ulrich Huber <ulrich@huberulrich.de>, linux-usb@vger.kernel.org
Subject: [PATCH 0/7] usb: typec: ucsi: Driver improvements
Date:   Mon, 20 Sep 2021 17:24:12 +0300
Message-Id: <20210920142419.54493-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

The goal of this series was to improve the alt mode handling in the
driver, but now it seems that we can use the "poll worker" that was
introduced for that to handle other tasks better as well.

Ulrich reported some problems that are caused by the second
GET_CONNECTOR_STATUS right after the first one that was introduced in
217504a05532 ("usb: typec: ucsi: Work around PPM losing change
information"). In the last patch I try to improve that workaround by
extracting it out of the generic event handler into its own task and
executing it only when it's really needed. That seems to improve the
situation.

These patches definitely improve the quality of the driver by making
it a bit more readable, but they also appear to make the behaviour a
bit more predictably and uniform on different platforms.

Benjamin, can you test these?

thanks,

Heikki Krogerus (7):
  usb: typec: ucsi: Always cancel the command if PPM reports BUSY
    condition
  usb: typec: ucsi: Don't stop alt mode registration on busy condition
  usb: typec: ucsi: Add polling mechanism for partner tasks like alt
    mode checking
  usb: typec: ucsi: acpi: Reduce the command completion timeout
  usb: typec: ucsi: Check the partner alt modes always if there is PD
    contract
  usb: typec: ucsi: Read the PDOs in separate work
  usb: typec: ucsi: Better fix for missing unplug events issue

 drivers/usb/typec/ucsi/ucsi.c      | 337 ++++++++++++++---------------
 drivers/usb/typec/ucsi/ucsi.h      |   3 +-
 drivers/usb/typec/ucsi/ucsi_acpi.c |   2 +-
 3 files changed, 167 insertions(+), 175 deletions(-)

-- 
2.33.0


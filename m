Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7C1CF9B8
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 14:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730764AbfJHM0E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 08:26:04 -0400
Received: from mga02.intel.com ([134.134.136.20]:30802 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730316AbfJHM0E (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Oct 2019 08:26:04 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Oct 2019 05:26:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; 
   d="scan'208";a="206626803"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Oct 2019 05:26:01 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v2 0/2]  extcon: axp288: Move to swnodes
Date:   Tue,  8 Oct 2019 15:25:58 +0300
Message-Id: <20191008122600.22340-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Hans,

Fixed the compiler warning in this version. No other changes.

The original cover letter:

That AXP288 extcon driver is the last that uses build-in connection
description. I'm replacing it with a code that finds the role mux
software node instead.

I'm proposing also here a little helper
usb_role_switch_find_by_fwnode() that uses
class_find_device_by_fwnode() to find the role switches.

thanks,

Heikki Krogerus (2):
  usb: roles: Add usb_role_switch_find_by_fwnode()
  extcon: axp288: Remove the build-in connection description

 drivers/extcon/extcon-axp288.c | 38 ++++++++++++++++++++--------------
 drivers/usb/roles/class.c      | 21 +++++++++++++++++++
 include/linux/usb/role.h       |  3 +++
 3 files changed, 47 insertions(+), 15 deletions(-)

-- 
2.23.0


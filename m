Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 547E9A0635
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2019 17:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbfH1PXN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Aug 2019 11:23:13 -0400
Received: from mga02.intel.com ([134.134.136.20]:7524 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726429AbfH1PXN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Aug 2019 11:23:13 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2019 08:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; 
   d="scan'208";a="188251257"
Received: from saranya-h97m-d3h.iind.intel.com ([10.66.247.130])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2019 08:23:11 -0700
From:   Saranya Gopal <saranya.gopal@intel.com>
To:     hdegoede@redhat.com, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org, Saranya Gopal <saranya.gopal@intel.com>
Subject: [PATCH v2 0/2] usb: roles: intel: Use static mode by default
Date:   Wed, 28 Aug 2019 20:38:50 +0530
Message-Id: <1567004932-16967-1-git-send-email-saranya.gopal@intel.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Hans and Heikki,

I have addressed the review comments of Hans and resubmitting this
patch series of enabling static DRD mode for role switch in all
platforms except Cherrytrail.

Saranya Gopal (2):
  xhci-ext-caps.c: Add property to disable Intel SW switch
  usb: roles: intel: Enable static DRD mode for role switch

 drivers/usb/host/xhci-ext-caps.c               | 18 +++++++++++++++++
 drivers/usb/roles/intel-xhci-usb-role-switch.c | 28 +++++++++++++++++++++++---
 2 files changed, 43 insertions(+), 3 deletions(-)

-- 
1.9.1


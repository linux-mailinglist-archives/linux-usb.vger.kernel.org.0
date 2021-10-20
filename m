Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE944348E8
	for <lists+linux-usb@lfdr.de>; Wed, 20 Oct 2021 12:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhJTKa0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Oct 2021 06:30:26 -0400
Received: from mga09.intel.com ([134.134.136.24]:6891 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229900AbhJTKaZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 Oct 2021 06:30:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="228621962"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="228621962"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 03:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="575280529"
Received: from saranya-nuc10i7fnh.iind.intel.com ([10.223.216.64])
  by fmsmga002.fm.intel.com with ESMTP; 20 Oct 2021 03:27:54 -0700
From:   Saranya Gopal <saranya.gopal@intel.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        hdegoede@redhat.com
Cc:     heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        rajaram.regupathy@intel.com,
        Saranya Gopal <saranya.gopal@intel.com>
Subject: [PATCH 0/2] Fix IRQ flood issue in TI PD controller
Date:   Wed, 20 Oct 2021 07:56:18 +0530
Message-Id: <20211020022620.21012-1-saranya.gopal@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

There was an issue reported that the TI PD controller driver is causing 
high CPU load due to a flood of interrupts. So, a patch was added in 
the i2c-multi-instantiate driver to stop the TI PD driver from loading 
in devices with INT3515 ACPI nodes.
We identified that required event interrupts are not being set in the interrupt 
mask register from the driver to the register of the controller.
We enabled only the necessary events like data status update, power status update 
and plug events in the interrupt mask register of the TI PD controller. 
After enabling these events in the interrupt mask register, there is no interrupt flood.
This patch series contains the fix for the interrupt flood issue 
in the TI PD driver and another patch to re-enable the INT3515 platform device.
I prefer this patch series to be taken through usb tree since the fix is in 
the TI USB PD driver and the second patch is just a revert patch.

Hi Hans,
Could I get your Ack to take this series through the usb tree?

Saranya Gopal (2):
  usb: typec: tipd: Enable event interrupts by default
  Revert "platform/x86: i2c-multi-instantiate: Don't create platform
    device for INT3515 ACPI nodes"

 drivers/platform/x86/i2c-multi-instantiate.c | 31 +++++---------------
 drivers/usb/typec/tipd/core.c                |  8 +++++
 2 files changed, 16 insertions(+), 23 deletions(-)

-- 
2.17.1


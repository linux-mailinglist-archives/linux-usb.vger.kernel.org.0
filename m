Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E066D38475
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 08:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbfFGGht (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 02:37:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:57977 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726048AbfFGGht (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jun 2019 02:37:49 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jun 2019 23:37:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,562,1557212400"; 
   d="scan'208";a="182572394"
Received: from intel.iind.intel.com ([10.66.245.146])
  by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2019 23:37:44 -0700
From:   Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
To:     linux-usb@vger.kernel.org
Cc:     mathias.nyman@intel.com, rajaram.regupathy@intel.com,
        abhilash.k.v@intel.com, prabhat.chand.pandey@intel.com,
        m.balaji@intel.com
Subject: [PATCH 0/5] usb: xhci: dbc: make modular and add RAW interface
Date:   Fri,  7 Jun 2019 12:03:01 +0530
Message-Id: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch-set adds the following features to dbc driver:

- show the active dbc function and dbc descriptors, allowing
  user space to dynamically modify the descriptors.

- modularize dbc core to enable it to expose different function
  interfaces, till now only TTY interface was exposed.

- use the new framework to expose RAW interface that can be
  used by any user-space application to directly read from and 
  write into dbc bulk end-points.


Abhilash K V (1):
  usb: xhci: dbc: Add a dbc raw driver to provide a raw interface on DbC

K V, Abhilash (1):
  usb: xhci: dbc: Provide sysfs option to configure dbc descriptors

Prabhat Chand Pandey (3):
  usb: xhci: dbc: make DbC modular, introducing dbc_function structure
  usb: xhci: dbc: DbC TTY driver to use new interface
  usb: xhci: dbc: Document describe about dbc raw interface

 .../testing/sysfs-bus-pci-drivers-xhci_hcd    | 112 ++++
 Documentation/usb/dbc_raw.rst                 | 136 +++++
 Documentation/usb/index.rst                   |  16 +
 drivers/usb/host/Kconfig                      |  24 +-
 drivers/usb/host/Makefile                     |   5 +-
 drivers/usb/host/xhci-dbgcap.c                | 498 ++++++++++++++++--
 drivers/usb/host/xhci-dbgcap.h                |  36 +-
 drivers/usb/host/xhci-dbgraw.c                | 365 +++++++++++++
 drivers/usb/host/xhci-dbgtty.c                |  81 ++-
 9 files changed, 1206 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/usb/dbc_raw.rst
 create mode 100644 Documentation/usb/index.rst
 create mode 100644 drivers/usb/host/xhci-dbgraw.c

-- 
2.21.0


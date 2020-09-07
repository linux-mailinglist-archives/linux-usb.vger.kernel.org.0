Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C34A25FF69
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 18:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729841AbgIGQbx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 12:31:53 -0400
Received: from mga09.intel.com ([134.134.136.24]:34562 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729594AbgIGOWF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 10:22:05 -0400
IronPort-SDR: 5vdADB9GgX9uVkBLpdHzqz6QpdoZ+PkSuMnxNIwOlSOYhph8gdKy+y5kx0yXRIYyd7bSW3Lf0E
 NR822N/vCWhQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="158987043"
X-IronPort-AV: E=Sophos;i="5.76,402,1592895600"; 
   d="scan'208";a="158987043"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 07:21:55 -0700
IronPort-SDR: MtZZ5OKoeLz4JREC8HHteqKhBSg/4J9i7zyVkN8p/0xWtnGtMeTXFsmF/q7o26wGg06+gYMMII
 cPwAL57zPmhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,402,1592895600"; 
   d="scan'208";a="406850907"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2020 07:21:53 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Utkarsh Patel <utkarsh.h.patel@intel.com>,
        linux-usb@vger.kernel.org
Subject: [RESEND PATCH 0/2] [PATCH 0/2] Fixes for the Intel PMC mux driver
Date:   Mon,  7 Sep 2020 17:21:50 +0300
Message-Id: <20200907142152.35678-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Here are two of fixes from Utkarsh. Both deal with alternate mode
issues. Let me know if you want anything to be changed.

Sorry again about the wrong list. I send these first accidentally to
linux-acpi@vger.kernel.org

thanks,

Utkarsh Patel (2):
  usb: typec: intel_pmc_mux: Do not configure Altmode HPD High
  usb: typec: intel_pmc_mux: Do not configure SBU and HSL Orientation in
    Alternate modes

 drivers/usb/typec/mux/intel_pmc_mux.c | 12 ------------
 1 file changed, 12 deletions(-)

-- 
2.28.0


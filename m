Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBA5CB7CC
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 12:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730767AbfJDKCX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 06:02:23 -0400
Received: from mga02.intel.com ([134.134.136.20]:15524 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726927AbfJDKCW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Oct 2019 06:02:22 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Oct 2019 03:02:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; 
   d="scan'208";a="205821753"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 04 Oct 2019 03:02:20 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: [PATCH 0/2] UCSI driver fixes
Date:   Fri,  4 Oct 2019 13:02:17 +0300
Message-Id: <20191004100219.71152-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here are two fixes for the ucsi drivers. The first patch removes a
potential deadlock from ucsi_ccg.c, and the second fixes
ucsi_displayport_enter() function so that it does not return error if
the mode has already been entered by the time the function is called.

Let me know if you want anything to be changed.

thanks,

Heikki Krogerus (2):
  usb: typec: ucsi: ccg: Remove run_isr flag
  usb: typec: ucsi: displayport: Fix for the mode entering routine

 drivers/usb/typec/ucsi/displayport.c |  2 ++
 drivers/usb/typec/ucsi/ucsi_ccg.c    | 42 +++-------------------------
 2 files changed, 6 insertions(+), 38 deletions(-)

-- 
2.23.0


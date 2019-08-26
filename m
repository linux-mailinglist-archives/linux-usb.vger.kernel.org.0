Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2E29D1AF
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 16:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731386AbfHZOcd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Aug 2019 10:32:33 -0400
Received: from mga18.intel.com ([134.134.136.126]:18240 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbfHZOcd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Aug 2019 10:32:33 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Aug 2019 07:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; 
   d="scan'208";a="197067721"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2019 07:32:31 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 0/2] usb: roles: intel: Use static mode by default
Date:   Mon, 26 Aug 2019 17:32:28 +0300
Message-Id: <20190826143230.59807-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Hans,

These have been in my queue for a while now. For some reason I've been
under the impression that there was still an issue with them, but that
was a misunderstanding. Saranya and Balaji, I'm really sorry about
that.

Hans, I don't know if you remember these, but they address an issue
where the device mode does not work (I think on APL). I believe static
mode is used always except on Cherrytrail. You had reported that using the
static mode creates a conflict on some CHT boards that have ACPI tables that
also write to the mux registers. To prevent the use of the static mode on
Cherrytrail the property is used.

thanks,

Saranya Gopal (2):
  usb: xhci: ext-caps: Add property to disable Intel SW switch
  usb: roles: intel: Enable static DRD mode for role switch

 drivers/usb/host/xhci-ext-caps.c              | 18 +++++++++++++
 .../usb/roles/intel-xhci-usb-role-switch.c    | 26 ++++++++++++++++++-
 2 files changed, 43 insertions(+), 1 deletion(-)

-- 
2.23.0.rc1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0ED6497AED
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jan 2022 10:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242552AbiAXJCR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jan 2022 04:02:17 -0500
Received: from mga11.intel.com ([192.55.52.93]:18482 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236415AbiAXJCQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Jan 2022 04:02:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643014936; x=1674550936;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V6aLG5vCjdD3Xc+Z1v8VgrvqH7FlaDNXCE93Osm7bfI=;
  b=AFQcAuIRGTiUfGeW3vjcr4tTJkpFh7BHfh8GZBqEoZQc08eAuIb++UfQ
   XaE/iPQBcqyBH8g/6mUhLqklFlRPS26m6UeM43WndBdbqj54ckZrI9ohW
   n9pbaFBfW3XFyDkIQKWbo92kn83mDZg1P1jya8Ag5cO7VOtpZ/XuXC01Q
   qM/BYQjdx5mJjQSs49UtciCJuaahRaEg2HsTvDKDwh695YTQJVfIkqXPZ
   ILXMx1ZPpdRDuuwQ14nPoIWH5nVxpN5Uk4hBz9JcgvhGPawYNat9q32Gd
   82kotjGLx1nmr+W9XRYHekwAJKYMlBanCp3SKAzsE6RAIkmWOwUn3r+on
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="243596445"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="243596445"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 01:02:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="673561131"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2022 01:02:15 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 0/2] usb: typec: Two fixes
Date:   Mon, 24 Jan 2022 12:02:26 +0300
Message-Id: <20220124090228.41396-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

The commit 730b49aac426 ("usb: typec: port-mapper: Convert to the
component framework") had two issues. These fix them.

thanks,

Heikki Krogerus (2):
  usb: typec: Only attempt to link USB ports if there is fwnode
  usb: typec: Don't try to register component master without components

 drivers/usb/typec/port-mapper.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.34.1


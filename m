Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCB52B3482
	for <lists+linux-usb@lfdr.de>; Sun, 15 Nov 2020 12:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgKOLAI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Nov 2020 06:00:08 -0500
Received: from mga17.intel.com ([192.55.52.151]:62640 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726537AbgKOLAH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 15 Nov 2020 06:00:07 -0500
IronPort-SDR: I9hfJEUNM9pxiws/b8v380lLwFdgOou/arrXPrloOmOAzQtR9WQvHIT/pc9KRDjBF1nAFoT3MH
 Mw5WsMXmB8zQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9805"; a="150488474"
X-IronPort-AV: E=Sophos;i="5.77,480,1596524400"; 
   d="scan'208";a="150488474"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2020 03:00:07 -0800
IronPort-SDR: l5ob/pnlrq4CTnh4Q0dIva+uK9ANxBk7Xk96g3UULQYR5F8VGTSGdtMAPqoq1aV6ovOXIAMKZJ
 2+bROaj3Uhhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,480,1596524400"; 
   d="scan'208";a="309610523"
Received: from lkp-server01.sh.intel.com (HELO 2e68b9ba5db3) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Nov 2020 03:00:06 -0800
Received: from kbuild by 2e68b9ba5db3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1keFlN-00009b-J0; Sun, 15 Nov 2020 11:00:05 +0000
Date:   Sun, 15 Nov 2020 18:59:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ingo Rohloff <ingo.rohloff@lauterbach.com>, balbi@kernel.org
Cc:     kbuild-all@lists.01.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [RFC PATCH] usb: gadget: ffs: async_bulkurb_active_lock can be static
Message-ID: <20201115105912.GA59036@a7d5672ee687>
References: <20201111170718.3381-2-ingo.rohloff@lauterbach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111170718.3381-2-ingo.rohloff@lauterbach.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 f_fs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 194d45d940313..b59e144ad7e0e 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -237,7 +237,7 @@ enum {
 	FFS_BULKURB_STATE_PENDING  = 1,
 	FFS_BULKURB_STATE_ACTIVE   = 2
 };
-DEFINE_SPINLOCK(async_bulkurb_active_lock);
+static DEFINE_SPINLOCK(async_bulkurb_active_lock);
 struct async_bulkurb {
 	struct ffs_epfile *epfile;
 	struct list_head urblist;

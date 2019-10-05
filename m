Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80A5ACCCED
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2019 23:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbfJEV6I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Oct 2019 17:58:08 -0400
Received: from mga17.intel.com ([192.55.52.151]:59666 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725801AbfJEV6I (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 5 Oct 2019 17:58:08 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Oct 2019 14:58:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,261,1566889200"; 
   d="scan'208";a="392650085"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Oct 2019 14:58:06 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iGs3x-0008eg-WE; Sun, 06 Oct 2019 05:58:05 +0800
Date:   Sun, 6 Oct 2019 05:57:27 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     kbuild-all@01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH usb] usb: typec: hd3ss3220_irq() can be static
Message-ID: <20191005215727.qfypxoswkiyu45ak@332d0cec05f4>
References: <201910060507.cCblZmu7%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201910060507.cCblZmu7%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 hd3ss3220.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index b8f247e792b87..1900910c637e3 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -120,7 +120,7 @@ static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
 	}
 }
 
-irqreturn_t hd3ss3220_irq(struct hd3ss3220 *hd3ss3220)
+static irqreturn_t hd3ss3220_irq(struct hd3ss3220 *hd3ss3220)
 {
 	int err;
 

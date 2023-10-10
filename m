Return-Path: <linux-usb+bounces-1373-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA277BFEEE
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 16:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6888A281D19
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 14:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB7424C94;
	Tue, 10 Oct 2023 14:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntS2s6g9"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9684824C8A
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 14:17:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D7899
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 07:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696947472; x=1728483472;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YAN1wCWhljNqNSa23ujZ4gOdwZabH01d7Wws+/3B0JE=;
  b=ntS2s6g9rJGWMUmkABRC0/GUDgTiQ8P4Uw4k/5KgwifClUNfQEZFCHxb
   z8yohZv4EaxBEtx25WZSE7hn+QMMcSumxBACFzF2eRbSQBfAJBJTGRD6x
   VPgSm39jIvG3PO1ILdps9jUPKwitZEYlZ2nUhAXuBB9r+Jlm1veQnIxaL
   zoL2WMRoUkZI1e+2Rp5bH4aTKqYE9JnvNcSsgZ/U0cyrB9uDZToGht9ci
   hAJLf/qBOBDmWYqpK2NOE+G6Y9b9C7uFDa0w9owiTu6CpOsWWAWddgxbw
   Ivvfrimb4eSuhGAKcwRhqCUGAKqdhoWup2Qwy2rXwo6ESaAWkp5XAszP8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="363758325"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="363758325"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 07:17:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897204279"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="897204279"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Oct 2023 07:16:07 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Douglas Gilbert <dgilbert@interlog.com>
Subject: [PATCH] usb: typec: ucsi: Fix missing link removal
Date: Tue, 10 Oct 2023 17:17:49 +0300
Message-Id: <20231010141749.3912016-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The link between the partner device and its USB Power
Delivery instance was never removed which prevented the
device from being released. Removing the link always when
the partner is unregistered.

Fixes: b04e1747fbcc ("usb: typec: ucsi: Register USB Power Delivery Capabilities")
Reported-by: Douglas Gilbert <dgilbert@interlog.com>
Closes: https://lore.kernel.org/linux-usb/ZSUMXdw9nanHtnw2@kuha.fi.intel.com/
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index f3ba2997004a..c9a032a5dbd0 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -787,6 +787,7 @@ static void ucsi_unregister_partner(struct ucsi_connector *con)
 
 	typec_set_mode(con->port, TYPEC_STATE_SAFE);
 
+	typec_partner_set_usb_power_delivery(con->partner, NULL);
 	ucsi_unregister_partner_pdos(con);
 	ucsi_unregister_altmodes(con, UCSI_RECIPIENT_SOP);
 	typec_unregister_partner(con->partner);
-- 
2.40.1



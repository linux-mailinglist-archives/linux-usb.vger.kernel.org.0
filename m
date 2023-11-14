Return-Path: <linux-usb+bounces-2873-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E294E7EAFAA
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 13:12:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9C3D1C2087E
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 12:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FD33E486;
	Tue, 14 Nov 2023 12:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEqBocKr"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C283E479
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 12:12:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78AD2181
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 04:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699963928; x=1731499928;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YDpC/cus29rCYqsWzZsWq7h4fDSCS/7uHz4X/LtHCCI=;
  b=QEqBocKrGA+4BxzcK/0MJ88KDd6eEqI18x7ydcNxsWUeABN59e7T7eXm
   LvvGnN5Ku44HYlf981/343qeFp6yyDblgPQXc7AKrkmbug5i5Zy48Rb38
   cG4hpmUbBFJkIXXQkgPkPC5z4bPryUMgkZW9AqzxsrWlHoGTmYEXNf8F1
   waD4EtfxI035rV5cvn305ivre3Azy3TgtJMaV95wCvEd5dDufaSNSq3J3
   hzvBcR+q6nW5+fVIKH+eFZex+6N3lTgqThhdpZ2hQB2PUQRxtN/0fKWzO
   98+DSq2cctj+DOL0nUV/qUGYA8eDVmVoJ5+PN+B/HIhF36koLcs/jepB5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="421740651"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="421740651"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 04:12:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="764645532"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="764645532"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 14 Nov 2023 04:12:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id ABA4C5C2; Tue, 14 Nov 2023 14:12:03 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Gil Fine <gil.fine@linux.intel.com>,
	Pengfei Xu <pengfei.xu@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/3] thunderbolt: Set lane bonding bit only for downstream port
Date: Tue, 14 Nov 2023 14:12:01 +0200
Message-ID: <20231114121203.203762-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gil Fine <gil.fine@linux.intel.com>

Fix the lane bonding procedure to follow the steps described in USB4
Connection Manager guide. Hence, set the lane bonding bit only for
downstream port. This is needed for certain ASMedia device, otherwise
lane bonding fails and the device disconnects.

Cc: stable@vger.kernel.org
Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 1e15ffa79295..9e5cc285cc8d 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1143,7 +1143,7 @@ int tb_port_lane_bonding_enable(struct tb_port *port)
 	 * Only set bonding if the link was not already bonded. This
 	 * avoids the lane adapter to re-enter bonding state.
 	 */
-	if (width == TB_LINK_WIDTH_SINGLE) {
+	if (width == TB_LINK_WIDTH_SINGLE && !tb_is_upstream_port(port)) {
 		ret = tb_port_set_lane_bonding(port, true);
 		if (ret)
 			goto err_lane1;
-- 
2.42.0



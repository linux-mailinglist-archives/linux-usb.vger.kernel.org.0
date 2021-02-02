Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A47A530B5FE
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 04:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhBBDnz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 22:43:55 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:36136 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231492AbhBBDny (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 22:43:54 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A12EAC00AC;
        Tue,  2 Feb 2021 03:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612237373; bh=bz4s3LuLdOlAcfCOeipNcR5oIEIkcUJOh0ECP3P09cg=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=Vo7MLCko8mGRZ0p/B9FSMuZJgps6TUy55mM6lZUgfkBIhOjq8OQuH7/gQAD7qgh+w
         RvYFwE7stSjVSGzzwrd2GAsdQxxNvNuiymot5zexME5OhpYipWH/vUbzzJ2CjGFoME
         FaNP84m8bb7UVjPR9DaK9UMETuoReFKU9gbGrIpKmsL+haVnBuhR78Qfl2cYfY5aAu
         rlBBH2DNF6f70BT1B6M3bCsRbcisaG/NYJTftUVmIu2KzODt4eHPZ8fqg8gMYcPwJx
         MaI/zJZtBPPkMPwTevGQPgH4p8rxqkbS7W2FNm8D2uqPGeENknX5WeejirQgTUvteU
         La8EMOLaQIz5w==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 7489DA006F;
        Tue,  2 Feb 2021 03:42:52 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 01 Feb 2021 19:42:52 -0800
Date:   Mon, 01 Feb 2021 19:42:52 -0800
Message-Id: <4627ca7e922019cd9a37073db90e4e9cd585c97e.1612237179.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 6/8] usb: xhci: Fix port minor revision
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some hosts incorrectly use sub-minor version for minor version (i.e.
0x02 instead of 0x20 for bcdUSB 0x320 and 0x01 for bcdUSB 0x310).
Currently the xHCI driver works around this by just checking for minor
revision > 0x01 for USB 3.1 everywhere. With the addition of USB 3.2,
checking this gets a bit cumbersome. Since there is no USB release with
bcdUSB 0x301 to 0x309, we can assume that sub-minor version 01 to 09 is
incorrect. Let's try to fix this and use the minor revision that matches
with the USB/xHCI spec to help with the version checking within the
driver.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/host/xhci-mem.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index f2c4ee7c4786..34105b477c62 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2129,6 +2129,15 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
 
 	if (major_revision == 0x03) {
 		rhub = &xhci->usb3_rhub;
+		/*
+		 * Some hosts incorrectly use sub-minor version for minor
+		 * version (i.e. 0x02 instead of 0x20 for bcdUSB 0x320 and 0x01
+		 * for bcdUSB 0x310). Since there is no USB release with sub
+		 * minor version 0x301 to 0x309, we can assume that they are
+		 * incorrect and fix it here.
+		 */
+		if (!(minor_revision & 0xf0) && (minor_revision & 0x0f))
+			minor_revision = minor_revision << 4;
 	} else if (major_revision <= 0x02) {
 		rhub = &xhci->usb2_rhub;
 	} else {
-- 
2.28.0


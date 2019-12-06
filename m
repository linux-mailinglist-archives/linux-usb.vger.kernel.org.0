Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B49531151E9
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 15:07:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbfLFOHA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 09:07:00 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42012 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfLFOG7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 09:06:59 -0500
Received: by mail-wr1-f67.google.com with SMTP id a15so7859314wrf.9;
        Fri, 06 Dec 2019 06:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g9e15ylUWWD8Md/O9KWguZs6ua1GwDKvgMSQEsgrXeQ=;
        b=R64rYywV+IOXy6kh7mVtxd2ABqigMMC4hjAIflbWG7i/9NS6NrSEE4a0KeuXc9omcV
         V6y+TckPo977DOAnSpRV2QTIBPpPu62Cl6CdiDX2fby6JikyZe8cc1106jm+lP17V9Lf
         frQszqKok/UBsr3iInVkEMB06iqQvKZTbv9qKgBwDOgthzwQMqko+Q8RKqBh1tZ975Ln
         hfW5Cu4pWPUe77vVmh6i8LIpJXAMQ3H2lT0dzSc6Umof4uDtPvq69UXo5XIh8tsZKs/9
         /Mk+P6HUPTVHC1XzztxOeHadcTbS/CLGi/lj89vyENgebxAfEId9+Wp9qF4dJVromdLo
         Mh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g9e15ylUWWD8Md/O9KWguZs6ua1GwDKvgMSQEsgrXeQ=;
        b=R4WvGmF5hVas7buA26upL9pgTHilIG0nIp0/BKNY0V76OVnzQehGPrlCMBrJ2zU9Y2
         rMqYghss25VhNa6dHTfk6/REMmmB0CzU62AMw6OFolza71iitCXDym8vyjZRS7Q1CbeY
         W/2TDLR/TZtN+2CbisFwKnEioZwmkKYIx2aotZZ47f0BDrEWcaKMZ0CuM8OD5H3Ls7t2
         mZU5n8wueGF7UUlL/P9Kxny+4355rZkrCDKgLjHukfrgUtbfRk4GRk+5j83EBtHs7Wyf
         zUVzq41T0BVf0krQUyr3RBx+FUmJyu+kf2n/UoI7ufmY+4QuAn1oEnbXohKusicdqZrN
         cDqg==
X-Gm-Message-State: APjAAAVUXMFj6YGePXagk1caSjBUpMGItTLkkCKdKjL1oRDlno/TYnhi
        P2ZJcEIqep84v+pAMaM1MHE=
X-Google-Smtp-Source: APXvYqzpx0vSNXTcgy24SN9ur5IvEaGQ7NWCoXm3ob+h2G24ja4aTbdV7g8yilvXa90t9QD2xqbJyg==
X-Received: by 2002:adf:f70b:: with SMTP id r11mr17110475wrp.388.1575641217484;
        Fri, 06 Dec 2019 06:06:57 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id f16sm3083485wrm.65.2019.12.06.06.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 06:06:56 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 01/10] usb: host: xhci-tegra: Fix "tega" -> "tegra" typo
Date:   Fri,  6 Dec 2019 15:06:44 +0100
Message-Id: <20191206140653.2085561-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191206140653.2085561-1-thierry.reding@gmail.com>
References: <20191206140653.2085561-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The tegra_xusb_mbox_regs structure was misspelled tega_xusb_mbox_regs.
Fortunately this was done consistently so it didn't cause any issues.

Reviewed-by: JC Kuo <jckuo@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index bf9065438320..aa1c4e5fd750 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -145,7 +145,7 @@ struct tegra_xusb_phy_type {
 	unsigned int num;
 };
 
-struct tega_xusb_mbox_regs {
+struct tegra_xusb_mbox_regs {
 	u16 cmd;
 	u16 data_in;
 	u16 data_out;
@@ -166,7 +166,7 @@ struct tegra_xusb_soc {
 		} usb2, ulpi, hsic, usb3;
 	} ports;
 
-	struct tega_xusb_mbox_regs mbox;
+	struct tegra_xusb_mbox_regs mbox;
 
 	bool scale_ss_clock;
 	bool has_ipfs;
-- 
2.23.0


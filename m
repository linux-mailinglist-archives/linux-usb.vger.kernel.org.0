Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99EE5108DE9
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 13:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbfKYMcQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 07:32:16 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34892 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbfKYMcQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 07:32:16 -0500
Received: by mail-wr1-f68.google.com with SMTP id s5so17796266wrw.2;
        Mon, 25 Nov 2019 04:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vm4lxT7DIRCaDo7VZPEDNhEMDj6D6gJ7QlAT92qzc0o=;
        b=Qv2ifQpTfQyLY+NsQAIW7s3uW5yZMHHp+AjNj/Aguu2n9swZoQZ+VcmlhVq/g6vKad
         7fUUn+mM12VXPATCREYdq3H/cnutRsmMV+AaRJyh0K6vdxyA2kskSkoCRd9SV5+OW6An
         zY9G/8LcBfdxBxbMizCDe+NcRN+ZX9DBRiPDQsoU7UvECVs+xtNGUSQKGD/Q3jbDmKVB
         gtMEb0m/KCiqrw1vvaxdKQp8thvQ6B/k5AQkH6PoGytOW3H16Z9o8+h0iybHv7Vrb0B0
         cLz2D5I109BmTSLyFNq0UaaQRm+DIRLv+DTuzi2WvN/Ul77UdQQWQ/ZQzduvOElEh52g
         bUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vm4lxT7DIRCaDo7VZPEDNhEMDj6D6gJ7QlAT92qzc0o=;
        b=tUXTj5TD52qbdT5riaAjgUK8nkUURK/OSefqASfuMsUbh8C6eatWKn3iLDi522/jrL
         OyL+ZQJfvSV77WYhs+ZEwnLzHBsRDJ/q/knel0n+/vSHBCU3OpBxqvT6FYkFrAEa9v4V
         m9ez/ExAIIflj8PWEII/1HTjsH2OMLRI0+FRkq/h7zllYpC5sFkgGXa2df3rgjgjyKjK
         dKD9sWCXz+DHgvvbiLbxCY96+TGUdlHKYbm5PCaUOuFM+HmqpyMmr62VKpr6scUxydIS
         pXEWyD/7+qQSOkFMfhYgXkg1AciEHmEQLWXYkI+COEQOpaka4Wp6dRsBYXVSRRWBzsqT
         Ewgw==
X-Gm-Message-State: APjAAAWM46YOO0GbzFFklR5NhwzrWtN5hvEmb1k+VO2/i56M4QWWBjzr
        KzLsibbzKRQYqmoujkuucSM=
X-Google-Smtp-Source: APXvYqw169kj38JIdtLw8AtEOV6yCSePMs+g3UWry8PXyMEEQfJLGNWskxt8XvP8Vb8exyf4xjin7A==
X-Received: by 2002:adf:9cc9:: with SMTP id h9mr30161371wre.137.1574685134210;
        Mon, 25 Nov 2019 04:32:14 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id 72sm10630103wrl.73.2019.11.25.04.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 04:32:13 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 01/10] usb: host: xhci-tegra: Fix "tega" -> "tegra" typo
Date:   Mon, 25 Nov 2019 13:32:01 +0100
Message-Id: <20191125123210.1564323-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191125123210.1564323-1-thierry.reding@gmail.com>
References: <20191125123210.1564323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The tegra_xusb_mbox_regs structure was misspelled tega_xusb_mbox_regs.
Fortunately this was done consistently so it didn't cause any issues.

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


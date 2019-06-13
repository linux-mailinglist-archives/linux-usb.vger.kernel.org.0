Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3E7144B77
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2019 20:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729383AbfFMS6o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jun 2019 14:58:44 -0400
Received: from mail-yb1-f201.google.com ([209.85.219.201]:53195 "EHLO
        mail-yb1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbfFMS6n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jun 2019 14:58:43 -0400
Received: by mail-yb1-f201.google.com with SMTP id w6so158486ybp.19
        for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2019 11:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ntyU81TkyEJi0U0KfIlv21oVqbkT3seZuV3ZHEbCLg0=;
        b=ofFUL+LiZ9kIXWQ4J7Dcze8i6L5hceX6pezSH7NhdnkCZJ85S5vnKlqsL0BcEzQPiW
         qlP4ktK+B1nc3Pi4fONorwTU/VA4iBZJDHqakw7eHXQuYApUDcyLmLRCllFsd5QFXqQB
         r+t2VQDJjE6EhXkRCkLMRd73dCxseToUguQ7awSocYdQetAYlPbp7ZhiDGgtkSdZEBqP
         P1j3qsQzDs2LUgJB4scduWO/S2EYLSdCRlV/VuBds7UhQ8Ki+flUvyyCwdyzLnRBOFmL
         AfBOTxj/o7lQeAVq9xE8+1o/HmgYetiDmrgLTh8eVHxDNJ2MgLZKaIBoc2C0CKQoGvGN
         g/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ntyU81TkyEJi0U0KfIlv21oVqbkT3seZuV3ZHEbCLg0=;
        b=AGfqu2lMXMUSM87HzUCy4rtFeXURbbbNybuSbNGid9S718WyIcyc6D3ZyCSYv7aaMy
         aKaopsAzNZ1aMxfX9+z66f7zkbnhIzPASDQrWlzqf89pKxizBMaqTZ3F8ThN2z78fu76
         xmvVIbjIYdFIatdEIuxssirC572SAxL9JR2WhHfNNuD+JfJuhF+aboiroTbqP8A5OEt4
         U6jqnXbHNcec8dcn4yL6KROi8e0po/MAShBBO7ho/JV9Q/Y4J4tz4GvIZoseoDf84Ueo
         d+EL8PwM+cQqZmwgABryBjJ9AQwAN3Jbhv+WI4T6046zhc+w2UqqNKukLWvs/m5NJ2R/
         EMpg==
X-Gm-Message-State: APjAAAWGT58iiFlbIALbwsey02iGbUhcWomvSKKG1mcUi8CFBLJP1mPD
        gZ/eDGyYvtiqbK2PBBEJ16Qss+xiPg==
X-Google-Smtp-Source: APXvYqxjBX8LnwyXeiyTURsJrIQW3A2EGmGNcDL2ydL2gF/CBr+jJ3LhGWPYKiqfVbKMGzkKhV8fhOf1Ow==
X-Received: by 2002:a0d:db08:: with SMTP id d8mr29509096ywe.242.1560452322698;
 Thu, 13 Jun 2019 11:58:42 -0700 (PDT)
Date:   Thu, 13 Jun 2019 11:58:38 -0700
In-Reply-To: <20190613184450.GA896@kroah.com>
Message-Id: <20190613185838.251806-1-nhuck@google.com>
Mime-Version: 1.0
References: <20190613184450.GA896@kroah.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH] usb: host: xhci-tegra: Fix Wunused-const-variable
From:   Nathan Huckleberry <nhuck@google.com>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        Nathan Huckleberry <nhuck@google.com>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Clang produces the following warning

drivers/usb/host/xhci-tegra.c:357:27: warning: unused variable
'mbox_cmd_name' [-Wunused-const-variable]
static const char * const mbox_cmd_name[] = {

Looks like it was intended for logging or debugging, but was
never implemented. Removing mbox_cmd_name.

Cc: clang-built-linux@googlegroups.com
Link: https://github.com/ClangBuiltLinux/linux/issues/533
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/usb/host/xhci-tegra.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 294158113d62..dafc65911fc0 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -354,29 +354,6 @@ enum tegra_xusb_mbox_cmd {
 	MBOX_CMD_NAK
 };
 
-static const char * const mbox_cmd_name[] = {
-	[  1] = "MSG_ENABLE",
-	[  2] = "INC_FALCON_CLOCK",
-	[  3] = "DEC_FALCON_CLOCK",
-	[  4] = "INC_SSPI_CLOCK",
-	[  5] = "DEC_SSPI_CLOCK",
-	[  6] = "SET_BW",
-	[  7] = "SET_SS_PWR_GATING",
-	[  8] = "SET_SS_PWR_UNGATING",
-	[  9] = "SAVE_DFE_CTLE_CTX",
-	[ 10] = "AIRPLANE_MODE_ENABLED",
-	[ 11] = "AIRPLANE_MODE_DISABLED",
-	[ 12] = "START_HSIC_IDLE",
-	[ 13] = "STOP_HSIC_IDLE",
-	[ 14] = "DBC_WAKE_STACK",
-	[ 15] = "HSIC_PRETEND_CONNECT",
-	[ 16] = "RESET_SSPI",
-	[ 17] = "DISABLE_SS_LFPS_DETECTION",
-	[ 18] = "ENABLE_SS_LFPS_DETECTION",
-	[128] = "ACK",
-	[129] = "NAK",
-};
-
 struct tegra_xusb_mbox_msg {
 	u32 cmd;
 	u32 data;
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AB82F9DDB
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 12:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389744AbhARLRv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 06:17:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:56354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389979AbhARLOU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 06:14:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE534229F0;
        Mon, 18 Jan 2021 11:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610968420;
        bh=FaNYiPjAGg/QnjcQ8R+Hc0QGlon7ZsvUQCbNGw43r2w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UwyZeLOyo7xn/6f/Jp1MFLoJxO8BlkuVgOHejdXdWsofVi22LwVRZz6IdomTmNp5y
         mwqylAgxyNKc6yFg5zSTjrxxjltbSR6uS0fwtHDJa/Ly1z/WFZqUMAd4lZEegxaZFt
         C09ejjnNOOOmVI0v6ccb4MYT2TKBXAVWvizt1gL9rNMTEel5F68UDxmfA1JKIryago
         2KCuuv5YvtoNdMzvgb+TmzhMUy7dyjjNdGgZRDe8lh/fzZsyltMAQLTab8EWDMQdyP
         wqIizhUgxGBNf9hGwkiHKMXVTJrpUQXOS+TuXegxtokf9JsiVXzb6ABM+1AIWStkZn
         PFCwVs9bimC0A==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1STi-0001Ka-CO; Mon, 18 Jan 2021 12:13:46 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Sheng Long Wang <china_shenglong@163.com>,
        Wang Sheng Long <shenglong.wang.ext@siemens.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 5/6] USB: serial: cp210x: drop unused includes
Date:   Mon, 18 Jan 2021 12:13:30 +0100
Message-Id: <20210118111331.5048-6-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118111331.5048-1-johan@kernel.org>
References: <20210118111331.5048-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop include directives that are no longer used.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cp210x.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 360398665c17..0d0fc1f9e99b 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -16,13 +16,10 @@
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
-#include <linux/moduleparam.h>
 #include <linux/usb.h>
-#include <linux/uaccess.h>
 #include <linux/usb/serial.h>
 #include <linux/gpio/driver.h>
 #include <linux/bitops.h>
-#include <linux/mutex.h>
 
 #define DRIVER_DESC "Silicon Labs CP210x RS232 serial adaptor driver"
 
-- 
2.26.2


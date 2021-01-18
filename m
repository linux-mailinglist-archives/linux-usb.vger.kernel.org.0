Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E706D2F9DDD
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 12:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390027AbhARLSC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 06:18:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:56320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389976AbhARLOU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 06:14:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFF87223E8;
        Mon, 18 Jan 2021 11:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610968419;
        bh=9ZqGcNXCzHYMy8Jgu/UaRqxwkpOxvrpuzYugqsnYMDU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aEvOvpbiTYj/7zu6lYXUJp8YODj6S/WeATWHCPM+qZehdmSrww8Pa7jUD0lDdf2d6
         WmnQ7+Yyo8tofe7fn4MwzaZGbmWPH08I77x4tT62tpSuS4JuVOjMeQh7qrVphJLn7c
         mWeTMYrveszL/Uk5+7Q+Fr5frjIsfBsKWpvD92cI2IfbPFuanEGWlhzmiK9PkElvgs
         RmdWPUyfNG2c4ZCXwMS3auclrr+TTiv1XQFw/q/UkAmjO4WoVyxfFCYPXBeCWFJqXV
         AJSf+T1pF0NuU9/1ITKNMqZn2TGYOGepP4OmJSH5H095YpG4YqFocfCZlOyaK6SlFs
         Mp9NDjJbP+68A==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1STi-0001Kk-Fv; Mon, 18 Jan 2021 12:13:46 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Sheng Long Wang <china_shenglong@163.com>,
        Wang Sheng Long <shenglong.wang.ext@siemens.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 6/6] USB: serial: cp210x: add copyright notice
Date:   Mon, 18 Jan 2021 12:13:31 +0100
Message-Id: <20210118111331.5048-7-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118111331.5048-1-johan@kernel.org>
References: <20210118111331.5048-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a copyright notice for myself.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cp210x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 0d0fc1f9e99b..d813a052738f 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -3,6 +3,7 @@
  * Silicon Laboratories CP210x USB to RS232 serial adaptor driver
  *
  * Copyright (C) 2005 Craig Shelley (craig@microtron.org.uk)
+ * Copyright (C) 2010-2021 Johan Hovold (johan@kernel.org)
  *
  * Support to set flow control line levels using TIOCMGET and TIOCMSET
  * thanks to Karl Hiramoto karl@hiramoto.org. RTSCTS hardware flow
-- 
2.26.2


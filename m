Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137CE451589
	for <lists+linux-usb@lfdr.de>; Mon, 15 Nov 2021 21:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352048AbhKOUkf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Nov 2021 15:40:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:45214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344422AbhKOTYk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Nov 2021 14:24:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCD996348B;
        Mon, 15 Nov 2021 18:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1637002646;
        bh=NewOX6p9U7y1vzv/hqnyCIclbc9xLMmMqtkeHr/JZJA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Oc2uYRCwfGbyV8IGPLpXXuIn74MECTkCrbDbG4Kk1xhWRA6vxpLiNLNaoqhJbNV+C
         uSoHEtD8gkZsl7qXhABNBYfGTyrbE8+ZFZAaJ0iasarDLME+yo10ZdZH43sR9CvVE2
         ImWyOxlUiTi3SxutK85QpWqGipAaBisY5MXRjpA0=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        linux-usb@vger.kernel.org,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 646/917] usb: typec: STUSB160X should select REGMAP_I2C
Date:   Mon, 15 Nov 2021 18:02:21 +0100
Message-Id: <20211115165450.758514061@linuxfoundation.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115165428.722074685@linuxfoundation.org>
References: <20211115165428.722074685@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 8ef1e58783b9f55daa4a865c7801dc75cbeb8260 ]

REGMAP_I2C is not a user visible kconfig symbol so driver configs
should not "depend on" it. They should depend on I2C and then
select REGMAP_I2C.

If this worked, it was only because some other driver had set/enabled
REGMAP_I2C.

Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/r/20211015013609.7300-1-rdunlap@infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/typec/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index a0418f23b4aae..ab480f38523aa 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -65,9 +65,9 @@ config TYPEC_HD3SS3220
 
 config TYPEC_STUSB160X
 	tristate "STMicroelectronics STUSB160x Type-C controller driver"
-	depends on I2C
-	depends on REGMAP_I2C
 	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
+	depends on I2C
+	select REGMAP_I2C
 	help
 	  Say Y or M here if your system has STMicroelectronics STUSB160x
 	  Type-C port controller.
-- 
2.33.0




Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC7601F8C01
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 03:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgFOBGk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 14 Jun 2020 21:06:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:37910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728039AbgFOBGk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 14 Jun 2020 21:06:40 -0400
Received: from localhost.localdomain (unknown [222.65.251.6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 600FC206D7;
        Mon, 15 Jun 2020 01:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592183200;
        bh=9VIOf6lsfsVPbuFDmD1pBSLjQ3N/BX08jhYl67QMrjg=;
        h=From:To:Cc:Subject:Date:From;
        b=dKWXF92bOl9w57YUBDfQa+RHGRYYupZdTSnfeYtf0s7TAGCaBhdaedpwpqcKAnQ3/
         nfakSrFyVHGxEKmh3J011BxHuQmFyYl63RN7ZBR7c5bKqjJCEs9IDxljNPWOubPpGR
         JO0NsfAKiGqBzy3JLVTvNIFON7zpRiMkjoGO6TCo=
From:   Peter Chen <peter.chen@kernel.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, pawell@cadence.com, rogerq@ti.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] MAINTAINERS: add Cadence USB3 DRD IP driver entry
Date:   Mon, 15 Jun 2020 09:06:18 +0800
Message-Id: <20200615010618.3888-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

Add Cadence USB3 DRD IP driver entry

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Hi Greg & Felipe,

Currently, most of Cadence3 code are through Felipe's tree, I changed it
through my tree in this commit, both trees are OK for me.

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f08f290df174..9e4d3f974f9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3783,6 +3783,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
 F:	drivers/mtd/nand/raw/cadence-nand-controller.c
 
+CADENCE USB3 DRD IP DRIVER
+M:	Peter Chen <peter.chen@nxp.org>
+M:	Pawel Laszczak <pawell@cadence.com>
+M:	Roger Quadros <rogerq@ti.com>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git
+F:	Documentation/devicetree/bindings/usb/cdns-usb3.txt
+F:	drivers/usb/cdns3/
+
 CADET FM/AM RADIO RECEIVER DRIVER
 M:	Hans Verkuil <hverkuil@xs4all.nl>
 L:	linux-media@vger.kernel.org
-- 
2.17.1


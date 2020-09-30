Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDB627DF47
	for <lists+linux-usb@lfdr.de>; Wed, 30 Sep 2020 06:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725786AbgI3ETb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Sep 2020 00:19:31 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:36354 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgI3ETb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Sep 2020 00:19:31 -0400
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
        by twspam01.aspeedtech.com with ESMTP id 08U3npZA071803
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2020 11:49:51 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 08U3n6vl071701;
        Wed, 30 Sep 2020 11:49:06 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 30 Sep
 2020 12:08:29 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <bmc-sw@aspeedtech.com>
CC:     Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH 0/3] Enable USB host for AST2600
Date:   Wed, 30 Sep 2020 12:08:20 +0800
Message-ID: <20200930040823.26065-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 08U3n6vl071701
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The patches enable UHCI driver in AST2600 and also enable
USB host in aspeed-ast2600-evb.dts.

Ryan Chen (3):
  configs: aspeed: enable UHCI driver in defconfig
  usb: host: add uhci compatible support for ast2600-uhci
  ARM: dts: add ehci uhci enable in evb dts

 arch/arm/boot/dts/aspeed-ast2600-evb.dts | 8 ++++++++
 arch/arm/configs/aspeed_g5_defconfig     | 1 +
 drivers/usb/host/uhci-platform.c         | 3 ++-
 3 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.17.1


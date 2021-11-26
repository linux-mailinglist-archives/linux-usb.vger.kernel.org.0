Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB7E45EC42
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 12:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236901AbhKZLP2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Nov 2021 06:15:28 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:27716 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232665AbhKZLN2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Nov 2021 06:13:28 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1AQAjlGD048314;
        Fri, 26 Nov 2021 18:45:47 +0800 (GMT-8)
        (envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Nov
 2021 19:10:03 +0800
From:   Neal Liu <neal_liu@aspeedtech.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Cai Huoqing <caihuoqing@baidu.com>,
        Tao Ren <rentao.bupt@gmail.com>,
        Julia Lawall <julia.lawall@inria.fr>,
        "kernel test robot" <lkp@intel.com>,
        Sasha Levin <sashal@kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>
CC:     Neal Liu <neal_liu@aspeedtech.com>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 0/3] Refactor Aspeed USB vhub driver
Date:   Fri, 26 Nov 2021 19:09:51 +0800
Message-ID: <20211126110954.2677627-1-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1AQAjlGD048314
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These patch series include 2 parts. One is adding more features
to pass USB30CV compliance test, the other is fixing hw issues.
More detail descriptions are included below patchsets.

*** BLURB HERE ***

Neal Liu (3):
  usb: aspeed-vhub: add qualifier descriptor
  usb: aspeed-vhub: support remote wakeup feature
  usb: aspeed-vhub: fix ep0 OUT ack received wrong length issue

 drivers/usb/gadget/udc/aspeed-vhub/core.c |  3 ++
 drivers/usb/gadget/udc/aspeed-vhub/dev.c  | 18 ++++++--
 drivers/usb/gadget/udc/aspeed-vhub/ep0.c  |  7 ++++
 drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 51 +++++++++++++++++++----
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  2 +
 5 files changed, 68 insertions(+), 13 deletions(-)

-- 
2.25.1


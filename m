Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE8946315A
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 11:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235580AbhK3Kqj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Nov 2021 05:46:39 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:35688 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235457AbhK3Kqi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Nov 2021 05:46:38 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1AUAIVeg077384;
        Tue, 30 Nov 2021 18:18:31 +0800 (GMT-8)
        (envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 30 Nov
 2021 18:43:02 +0800
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
Subject: [PATCH v2 0/4] Refactor Aspeed USB vhub driver
Date:   Tue, 30 Nov 2021 18:42:52 +0800
Message-ID: <20211130104256.3106797-1-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1AUAIVeg077384
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These patch series include 2 parts. One is adding more features
to pass USB30CV compliance test, the other is fixing hw issues.
More detail descriptions are included below patchsets.

Change since v1:
- Remove unnecessary configs for SET_CONFIGURATION.
- Separate supporting test mode to new patch.

*** BLURB HERE ***

Neal Liu (4):
  usb: aspeed-vhub: add qualifier descriptor
  usb: aspeed-vhub: support auto remote wakeup feature
  usb: aspeed-vhub: fix ep0 OUT ack received wrong length issue
  usb: aspeed-vhub: support test mode feature

 drivers/usb/gadget/udc/aspeed-vhub/core.c |  3 ++
 drivers/usb/gadget/udc/aspeed-vhub/dev.c  | 18 +++++++--
 drivers/usb/gadget/udc/aspeed-vhub/ep0.c  |  7 ++++
 drivers/usb/gadget/udc/aspeed-vhub/hub.c  | 46 ++++++++++++++++++++---
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  1 +
 5 files changed, 65 insertions(+), 10 deletions(-)

-- 
2.25.1


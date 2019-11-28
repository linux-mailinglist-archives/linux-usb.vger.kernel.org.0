Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC9F910C273
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2019 03:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbfK1CiI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Nov 2019 21:38:08 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:44136 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727228AbfK1CiI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 Nov 2019 21:38:08 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 7FF6AA215DCE11B68DD8;
        Thu, 28 Nov 2019 10:38:06 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Thu, 28 Nov 2019
 10:37:56 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 0/2] usb: gadget: Remove unneeded semicolon
Date:   Thu, 28 Nov 2019 10:45:17 +0800
Message-ID: <1574909119-19714-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

zhengbin (2):
  usb: gadget: f_fs: Remove unneeded semicolon
  usb: gadget: udc: Remove unneeded semicolon

 drivers/usb/gadget/function/f_fs.c | 2 +-
 drivers/usb/gadget/udc/omap_udc.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
2.7.4


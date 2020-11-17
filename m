Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7981B2B569F
	for <lists+linux-usb@lfdr.de>; Tue, 17 Nov 2020 03:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgKQCMy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 21:12:54 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:7940 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726471AbgKQCMx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 21:12:53 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CZqGK6x1NzhZxY;
        Tue, 17 Nov 2020 10:12:41 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Tue, 17 Nov 2020
 10:12:50 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <peter.chen@nxp.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>, <sergei.shtylyov@gmail.com>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH v2 0/2] usb: gadget: Fix two memleaks in error handling
Date:   Tue, 17 Nov 2020 10:16:27 +0800
Message-ID: <20201117021629.1470544-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch sets fix two memleaks before error returns.
---
Changelog:
v2
- add midi_free label in f_midi_alloc and use kfree in
  gadgetfs_fill_super.

Zhang Qilong (2):
  usb: gadget: f_midi: Fix memleak in f_midi_alloc
  usb: gadget: Fix memleak in gadgetfs_fill_super

 drivers/usb/gadget/function/f_midi.c | 10 +++++++---
 drivers/usb/gadget/legacy/inode.c    |  3 +++
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.25.4


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 648852B4366
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 13:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729345AbgKPMNi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 07:13:38 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:7918 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728150AbgKPMNh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 07:13:37 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CZSdv0V6qz6wPq;
        Mon, 16 Nov 2020 20:13:23 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Nov 2020
 20:13:30 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH 0/2] usb: gadget: Fix two memleaks in error handling
Date:   Mon, 16 Nov 2020 20:17:08 +0800
Message-ID: <20201116121710.1546690-1-zhangqilong3@huawei.com>
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

Zhang Qilong (2):
  usb: gadget: f_midi: Fix memleak in f_midi_alloc
  usb: gadget: Fix memleak in gadgetfs_fill_super

 drivers/usb/gadget/function/f_midi.c | 3 +++
 drivers/usb/gadget/legacy/inode.c    | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.25.4


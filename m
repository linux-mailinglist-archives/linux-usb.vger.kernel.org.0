Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1BAFD09F4
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 10:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729575AbfJIIdd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 04:33:33 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:37890 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726068AbfJIIdd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Oct 2019 04:33:33 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id E8759EA64E1B4E4E2FBD;
        Wed,  9 Oct 2019 16:33:31 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Wed, 9 Oct 2019
 16:33:23 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 0/2] usb: gadget: Remove set but not used variable 'opts'
Date:   Wed, 9 Oct 2019 16:40:32 +0800
Message-ID: <1570610434-68293-1-git-send-email-zhengbin13@huawei.com>
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
  usb: gadget: Remove set but not used variable 'opts' in
    acm_ms_do_config
  usb: gadget: Remove set but not used variable 'opts' in msg_do_config

 drivers/usb/gadget/legacy/acm_ms.c       | 3 ---
 drivers/usb/gadget/legacy/mass_storage.c | 3 ---
 2 files changed, 6 deletions(-)

--
2.7.4


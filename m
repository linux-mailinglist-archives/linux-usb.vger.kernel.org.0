Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB0995EA9F4
	for <lists+linux-usb@lfdr.de>; Mon, 26 Sep 2022 17:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235943AbiIZPOy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Sep 2022 11:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236191AbiIZPOP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Sep 2022 11:14:15 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C303A26E1
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 06:57:12 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MbkjP3KMyz1P71d;
        Mon, 26 Sep 2022 21:52:57 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 21:57:11 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 21:57:10 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>
CC:     <gregkh@linuxfoundation.org>, <b-liu@ti.com>,
        <yangyingliang@huawei.com>
Subject: [PATCH -next 0/5] usb: musb: Switch to use dev_err_probe() helper
Date:   Mon, 26 Sep 2022 22:03:43 +0800
Message-ID: <20220926140348.2028052-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patchset is trying to replace dev_err() with dev_err_probe() in
the probe path.

Yang Yingliang (5):
  usb: musb: core: Switch to use dev_err_probe() helper
  usb: musb: da8xx: Switch to use dev_err_probe() helper
  usb: musb: cppi41: Switch to use dev_err_probe() helper
  usb: musb: jz4740: Switch to use dev_err_probe() helper
  usb: musb: sunxi: Switch to use dev_err_probe() helper

 drivers/usb/musb/da8xx.c       |  8 +++-----
 drivers/usb/musb/jz4740.c      | 10 +++-------
 drivers/usb/musb/musb_core.c   |  5 ++---
 drivers/usb/musb/musb_cppi41.c |  6 ++----
 drivers/usb/musb/sunxi.c       | 29 +++++++++--------------------
 5 files changed, 19 insertions(+), 39 deletions(-)

-- 
2.25.1


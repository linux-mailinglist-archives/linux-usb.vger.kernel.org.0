Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01CBE4D70DB
	for <lists+linux-usb@lfdr.de>; Sat, 12 Mar 2022 21:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbiCLU3u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Mar 2022 15:29:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbiCLU3u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Mar 2022 15:29:50 -0500
Received: from mxout03.lancloud.ru (mxout03.lancloud.ru [45.84.86.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B996B8EB44
        for <linux-usb@vger.kernel.org>; Sat, 12 Mar 2022 12:28:39 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 27461208F048
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
Subject: [PATCH 0/2] Switch to using scnprintf() in the UHCI driver's debugging code
Date:   Sat, 12 Mar 2022 23:28:32 +0300
Message-ID: <20220312202834.11700-1-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Here are 2 patches against the 'usb-next' branch of Greg KH's 'usb.git' repo.
The UHCI driver's debugging code uses a lot of sprintf() calls with the large
buffers, leaving some space at the end of the buffers to handle the buffer
overflow.  Using scnprntf() calls instead eliminates the very possibility of
the buffer overflow...

Sergey Shtylyov (2):
  usb: host: uhci-debug: use scnprintf() instead of sprintf()
  usb: host: uhci: remove #define EXTRA_SPACE

 drivers/usb/host/uhci-debug.c | 263 ++++++++++++----------------------
 drivers/usb/host/uhci-hcd.c   |   2 +-
 drivers/usb/host/uhci-q.c     |   2 +-
 3 files changed, 93 insertions(+), 174 deletions(-)

-- 
2.26.3

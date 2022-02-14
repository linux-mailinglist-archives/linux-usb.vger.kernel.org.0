Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 388044B5B3C
	for <lists+linux-usb@lfdr.de>; Mon, 14 Feb 2022 21:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbiBNUqt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Feb 2022 15:46:49 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:38176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbiBNUqB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Feb 2022 15:46:01 -0500
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 162B51587A0
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 12:44:20 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 5874D20A5C42
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: host: {e|o}hci-dbg: kill useless 'ret' variable
 initializers
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Organization: Open Mobile Platform
Message-ID: <901b7478-45b6-d8b3-f5c6-555712485232@omp.ru>
Date:   Mon, 14 Feb 2022 22:56:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The 'ret' local variables are often initialized to 0 but this value is
unused, thus we can kill those initializers...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.

 drivers/usb/host/ehci-dbg.c |    4 ++--
 drivers/usb/host/ohci-dbg.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

Index: usb/drivers/usb/host/ehci-dbg.c
===================================================================
--- usb.orig/drivers/usb/host/ehci-dbg.c
+++ usb/drivers/usb/host/ehci-dbg.c
@@ -931,7 +931,7 @@ static struct debug_buffer *alloc_buffer
 
 static int fill_buffer(struct debug_buffer *buf)
 {
-	int ret = 0;
+	int ret;
 
 	if (!buf->output_buf)
 		buf->output_buf = vmalloc(buf->alloc_size);
@@ -956,7 +956,7 @@ static ssize_t debug_output(struct file
 		size_t len, loff_t *offset)
 {
 	struct debug_buffer *buf = file->private_data;
-	int ret = 0;
+	int ret;
 
 	mutex_lock(&buf->mutex);
 	if (buf->count == 0) {
Index: usb/drivers/usb/host/ohci-dbg.c
===================================================================
--- usb.orig/drivers/usb/host/ohci-dbg.c
+++ usb/drivers/usb/host/ohci-dbg.c
@@ -680,7 +680,7 @@ static struct debug_buffer *alloc_buffer
 
 static int fill_buffer(struct debug_buffer *buf)
 {
-	int ret = 0;
+	int ret;
 
 	if (!buf->page)
 		buf->page = (char *)get_zeroed_page(GFP_KERNEL);
@@ -705,7 +705,7 @@ static ssize_t debug_output(struct file
 			size_t len, loff_t *offset)
 {
 	struct debug_buffer *buf = file->private_data;
-	int ret = 0;
+	int ret;
 
 	mutex_lock(&buf->mutex);
 	if (buf->count == 0) {


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6FE60E58
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2019 02:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfGFAyI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 20:54:08 -0400
Received: from gate.crashing.org ([63.228.1.57]:42805 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbfGFAyI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 20:54:08 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x660rlMN017940;
        Fri, 5 Jul 2019 19:54:02 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 06/10] usb: gadget: aspeed: Check suspend/resume callback existence
Date:   Sat,  6 Jul 2019 10:53:41 +1000
Message-Id: <20190706005345.18131-7-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190706005345.18131-1-benh@kernel.crashing.org>
References: <20190706005345.18131-1-benh@kernel.crashing.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

.. before calling them

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/udc/aspeed-vhub/dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index 71e2416858fd..5f7e3b6de531 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -458,7 +458,7 @@ static const struct usb_gadget_ops ast_vhub_udc_ops = {
 void ast_vhub_dev_suspend(struct ast_vhub_dev *d)
 {
 	d->suspended = true;
-	if (d->driver) {
+	if (d->driver && d->driver->suspend) {
 		spin_unlock(&d->vhub->lock);
 		d->driver->suspend(&d->gadget);
 		spin_lock(&d->vhub->lock);
@@ -468,7 +468,7 @@ void ast_vhub_dev_suspend(struct ast_vhub_dev *d)
 void ast_vhub_dev_resume(struct ast_vhub_dev *d)
 {
 	d->suspended = false;
-	if (d->driver) {
+	if (d->driver && d->driver->resume) {
 		spin_unlock(&d->vhub->lock);
 		d->driver->resume(&d->gadget);
 		spin_lock(&d->vhub->lock);
-- 
2.17.1


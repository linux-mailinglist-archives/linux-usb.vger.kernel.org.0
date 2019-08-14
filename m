Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 612728C7D4
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 04:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730324AbfHNC02 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Aug 2019 22:26:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:54544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730312AbfHNC01 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Aug 2019 22:26:27 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1030921721;
        Wed, 14 Aug 2019 02:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565749587;
        bh=BvDBc8ULFIJ03Qy5ImvqS1zRetsqy50NWFJ2J/Aakvo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kgHIS0j7EhH+QawRmcMXCwVrrJ1flhI1hjV/0yx/V9PYGm78GJ8YumA+0KUECzP7W
         /UV0SKNtbLZ+8S9BNkNmAAMK6u6/gy9e4JI2xp/naC2m4PX2cd5qi+oFtOSiaoj9dh
         yEPJl9XhGyrzeykDzrZI/WQ59i3Q5/iGzVyGoddc=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hillf Danton <hdanton@sina.com>,
        syzbot <syzbot+62a1e04fd3ec2abf099e@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 21/28] HID: hiddev: do cleanup in failure of opening a device
Date:   Tue, 13 Aug 2019 22:25:43 -0400
Message-Id: <20190814022550.17463-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814022550.17463-1-sashal@kernel.org>
References: <20190814022550.17463-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Hillf Danton <hdanton@sina.com>

[ Upstream commit 6d4472d7bec39917b54e4e80245784ea5d60ce49 ]

Undo what we did for opening before releasing the memory slice.

Reported-by: syzbot <syzbot+62a1e04fd3ec2abf099e@syzkaller.appspotmail.com>
Cc: Andrey Konovalov <andreyknvl@google.com>
Signed-off-by: Hillf Danton <hdanton@sina.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/usbhid/hiddev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index 0bfc2009e4071..8903ea09ac587 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -330,6 +330,10 @@ static int hiddev_open(struct inode *inode, struct file *file)
 	return 0;
 bail_unlock:
 	mutex_unlock(&hiddev->existancelock);
+
+	spin_lock_irq(&list->hiddev->list_lock);
+	list_del(&list->node);
+	spin_unlock_irq(&list->hiddev->list_lock);
 bail:
 	file->private_data = NULL;
 	vfree(list);
-- 
2.20.1


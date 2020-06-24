Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDC4207B0B
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jun 2020 19:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405538AbgFXR6T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jun 2020 13:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405377AbgFXR6S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Jun 2020 13:58:18 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BDC1C061573
        for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2020 10:58:18 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id q17so1478895pfu.8
        for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2020 10:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bg+1P63VLxUYsu4ENntJNQHEjiQ6uihm5Nk7mXeioVo=;
        b=A3AqzG26sCA4f+KdGaF7CKySAhqu82wsSL/pEiTqkD1fIRlRR6OmLuU+QKP3lA3oQE
         cqLdnKzTw/C/vRvSge7D8Q1ju5lSbrqVgU99U2YlNsdFodq/iULU0ONGuwHZagMUm5q4
         IFUK+OfCrUmNNFofOr4SHNti9rr67bs1xxUbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bg+1P63VLxUYsu4ENntJNQHEjiQ6uihm5Nk7mXeioVo=;
        b=ZWmTGZfUAQ4SnA0T/sqk5tpla5Mcw4AfqheQWPhDrLthHimy/nMMt9XORaoe/MMFty
         XF3yns1UnZPwhKxl1HqvCu9Z9A1zSfkB1FYnH7aJ32bxEv/Lktr8Bbo2Ghth2ErJ5HT5
         lDkKwEF6MK1AqjWACx+V4Iz1Lw55S/9RNO0ZoQ5Vejy6WOFVqM4NUkJSp67L9HMxQudm
         BKCq1I2AbBDAhmPa/yGPTULY9WxN+AHwFCRsKv8TX5Oak2tWu4ElFdFQZQEE7PzSWS+W
         EH5PIQLdWdYAxgLJiYktLciFlALbiPB/LsqjVTc+OgfvtI+6ImZ8eeY76aYV+1cFsxbU
         TouA==
X-Gm-Message-State: AOAM530FnHv02jmXX6fE/HXsOZEXzwVfpFhadwqgyGQmRQFs144icjgd
        6jG2uQrKrNwlCmEPXXed6vgNSg==
X-Google-Smtp-Source: ABdhPJxMjymh7nD+4h+MHOeIHifL3w9DH3b6q0GpFMzkPSla1mcQvMmiGmbtJm6MO3cAvuqQMjJtlQ==
X-Received: by 2002:a63:a843:: with SMTP id i3mr23295731pgp.190.1593021497767;
        Wed, 24 Jun 2020 10:58:17 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id r8sm20958635pfq.16.2020.06.24.10.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 10:58:17 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     rjliao@codeaurora.org, marcel@holtmann.org,
        linux-bluetooth@vger.kernel.org
Cc:     chromeos-bluetooth-upstreaming@chromium.org,
        linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: btusb: Reset port on cmd timeout
Date:   Wed, 24 Jun 2020 10:58:09 -0700
Message-Id: <20200624105737.1.Ibae403db54245c458d14297f1892c77c5055da41@changeid>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

QCA_ROME doesn't have support for the reset gpio but sometimes gets into
a state where it is unresponsive to commands. When this happens, reset
the port to attempt to revive the chip.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
On Chromebooks with this chipset, we encountered cmd_timeout after
running suspend stress test for hundreds of iterations. Without
a recovery mechanism, continued cmd_timeout failures eventually caused
the suspend stress test to fail.

This change will just reset the port that the Bluetooth chip is on when
cmd_timeout is encountered. At the very least, the driver will unload
and stop affecting suspend. It doesn't seem to restore the BT controller
to a good state however (this still requires a power cycle).

 drivers/bluetooth/btusb.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index e42fdd625eb023..b806a88702328b 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -573,6 +573,22 @@ static void btusb_rtl_cmd_timeout(struct hci_dev *hdev)
 	gpiod_set_value_cansleep(reset_gpio, 0);
 }
 
+static void btusb_generic_usb_cmd_timeout(struct hci_dev *hdev)
+{
+	struct btusb_data *data = hci_get_drvdata(hdev);
+	int err;
+
+	if (++data->cmd_timeout_cnt < 5)
+		return;
+
+	bt_dev_err(hdev, "Multiple cmd timeouts seen. Resetting usb device.");
+	err = usb_autopm_get_interface(data->intf);
+	if (!err)
+		usb_queue_reset_device(data->intf);
+	else
+		bt_dev_err(hdev, "Failed usb_autopm_get_interface with %d", err);
+}
+
 static inline void btusb_free_frags(struct btusb_data *data)
 {
 	unsigned long flags;
@@ -3964,6 +3980,7 @@ static int btusb_probe(struct usb_interface *intf,
 	if (id->driver_info & BTUSB_QCA_ROME) {
 		data->setup_on_usb = btusb_setup_qca;
 		hdev->set_bdaddr = btusb_set_bdaddr_ath3012;
+		hdev->cmd_timeout = btusb_generic_usb_cmd_timeout;
 		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
 		btusb_check_needs_reset_resume(intf);
 	}
-- 
2.27.0.111.gc72c7da667-goog


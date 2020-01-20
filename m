Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43343142D1C
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 15:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbgATOUI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 09:20:08 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:33934 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbgATOUH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jan 2020 09:20:07 -0500
Received: by mail-io1-f67.google.com with SMTP id z193so33834031iof.1;
        Mon, 20 Jan 2020 06:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XCkITs3PBe9eHkSuW9jLCvHZEhc7O5PaZef/lj9dJnw=;
        b=Z6BzsswLYTKdYv2mChidjinXbBtsRQdVCZSAnPnMaI7qJ0Ghng+0/b9RV9fydLPE5Q
         x84foME1KpuH0gnYyZ0b80ue3fHiEGtNfaT9+NRGcED4MytSVBxu9RkcMzQs6REyHmW9
         dVqCRqGpVVNdylbhyqP6mKn5yoYF/VJ/4iaPAwD+mjOmj63eSi/ll2SEXZeJRFzkrK+L
         qYydNFaTlfseYaOuluV6rg7W+OjwycIUaTUWta29ecxDVCMwsY3GkOuQL3y05MmVeX68
         JqrPmw839WCC81/Tdn1FIgd68y7b64JUKoa3pfzkoK27DzdOBX5G2rhBLnxhbhAE7ulA
         urUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XCkITs3PBe9eHkSuW9jLCvHZEhc7O5PaZef/lj9dJnw=;
        b=PpJze7UdPO7+oykcTnk+TeKxQXFIi2QdD2MLPBaN0si9MBgNuIwZydmZCbie2+mxIl
         65oZ35NEfVc8QpmBUsGaY+bSBK8zdIMhB0Y/6BVFu0mdnwXiMiStkggu/9qVog3HxuZW
         pkf05+vLbibLH9ShjiMV/xLt8VTppT4QmuMZaYcjkdofcxC/DOKY0JKBnvakwl7B3Dmc
         QCze/z/tFcZ2mE1HGyWhy7+d8XIKme760EkJXOULwxfxNTT/gimifSPK88/0ow2tcLj9
         tKGgy+aggbzs5EELuO9RB0onPosX4W7uNc7KxjFDu1zMJNgNbiDwArTjKM+hE5KcoSMd
         WDnQ==
X-Gm-Message-State: APjAAAWfQhqh/KN8yLyuy8rvOZ+MHznZV+tx02B4FI42SL0UhWIIRpGr
        TT63c/b/F+Z40KVLvkBPX0U=
X-Google-Smtp-Source: APXvYqz8t722UdEvKgdPqj5K0M49rw+ungPTR5qINz+lLKabnDklZNNf2lJ99rg7fkcGYbQK8e00tg==
X-Received: by 2002:a5d:878c:: with SMTP id f12mr42025424ion.164.1579530006570;
        Mon, 20 Jan 2020 06:20:06 -0800 (PST)
Received: from morpheus.roving-it.com ([8.46.76.46])
        by smtp.googlemail.com with ESMTPSA id u8sm8601217iol.55.2020.01.20.06.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 06:20:05 -0800 (PST)
From:   Peter Robinson <pbrobinson@gmail.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v2] usb: host: xhci-tegra: set MODULE_FIRMWARE for tegra186
Date:   Mon, 20 Jan 2020 14:19:10 +0000
Message-Id: <20200120141910.116097-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Set the MODULE_FIRMWARE for tegra186, it's registered for 124/210 and
ensures the firmware is available at the appropriate time such as in
the initrd, else if the firmware is unavailable the driver fails with
the following errors:

tegra-xusb 3530000.usb: Direct firmware load for nvidia/tegra186/xusb.bin failed with error -2
tegra-xusb 3530000.usb: failed to request firmware: -2
tegra-xusb 3530000.usb: failed to load firmware: -2
tegra-xusb: probe of 3530000.usb failed with error -2

Fixes: 5f9be5f3f899 ("usb: host: xhci-tegra: Add Tegra186 XUSB support")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---

v2: Update for usb-next and add Thierry's ack

 drivers/usb/host/xhci-tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index bf9065438320..7b0d175ad708 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1432,6 +1432,7 @@ MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
 
 static const char * const tegra186_supply_names[] = {
 };
+MODULE_FIRMWARE("nvidia/tegra186/xusb.bin");
 
 static const struct tegra_xusb_phy_type tegra186_phy_types[] = {
 	{ .name = "usb3", .num = 3, },
-- 
2.24.1


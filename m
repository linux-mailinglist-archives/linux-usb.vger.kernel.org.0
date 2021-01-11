Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87642F2276
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 23:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389353AbhAKWKl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 17:10:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58952 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388713AbhAKWKk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 17:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610402954;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=wAtnYWwrlK7tpbrs/+tnNUH4YreR07+THJRUh9/6qM8=;
        b=Xr3SyOBCz/uoEUWxRmgZJo9D4ZNDdSjfbyIuxL/5KDpa7R1DVMWCtNcTeo/DreIC+CUgTx
        +HDxYvMhjFqvLImjm5Js34noaOpmHDqRoyh5aOXenvungc/RPtp+D2dhOkzUyp+5wZQ/5n
        kKrRwRYP2laX0pqhSRvobTW5Ddsn2iI=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-FADnVDxlPSW4mpLUC8sLhg-1; Mon, 11 Jan 2021 17:09:12 -0500
X-MC-Unique: FADnVDxlPSW4mpLUC8sLhg-1
Received: by mail-io1-f70.google.com with SMTP id n9so214682iog.6
        for <linux-usb@vger.kernel.org>; Mon, 11 Jan 2021 14:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wAtnYWwrlK7tpbrs/+tnNUH4YreR07+THJRUh9/6qM8=;
        b=Lf3rtOdy/RyL+Vzujn4209skNe26r+zJfWCEZCtCVTD6O5Frb/nDItcH7ej/P2pMkW
         MqZi9JpP44cVXyEapt3mTmDdwEb0o+DaOSrJ4g+11U3nZKzCqwyPSD1iwW75sj1ZHjWm
         J0XBVEG9lknC2ARJ/fD0n7P0aBobsXTNPnAEbejrnfJVsD2Yyo8dyv6WDjj+p8Zbp7Yi
         jI+KoZkdlGum6usjXGMPiNsEdYSUTi7jG1thnLDqVJSnwwbhhsoCF7cuNYALSXyHjHRv
         LK7YkpRCH7RMcEq+iB89nsa5n+CcRbgrUY6PjCDmMcocsJZP7Wv5S8OunzxJm9eDJaeh
         tk7w==
X-Gm-Message-State: AOAM530QzO3fYjxt0tW53at/bQ7sqg6dxK+gnfZQWMwoa2MyIi8zO6Sf
        kt7dop/khMILcVM5gMA7sy0P+v54jYmgPyjm6ISJgXgwNTD4IZCUEehtqKMnQD02hIYJTXDIF6C
        T6Dpu4gN4uwLjUv3aLNuU
X-Received: by 2002:a02:bb99:: with SMTP id g25mr1555072jan.11.1610402951223;
        Mon, 11 Jan 2021 14:09:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxswd5YF7Eo0k165Z8e6I3dQ4wtHbxizYkFRXv1FPhiW6/Y1lObuf/ddgaiWUlhPY/R/ftasg==
X-Received: by 2002:a02:bb99:: with SMTP id g25mr1555056jan.11.1610402951001;
        Mon, 11 Jan 2021 14:09:11 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id m15sm692170ilh.6.2021.01.11.14.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 14:09:10 -0800 (PST)
From:   trix@redhat.com
To:     johan@kernel.org, gregkh@linuxfoundation.org,
        natechancellor@gmail.com, ndesaulniers@google.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, Tom Rix <trix@redhat.com>
Subject: [PATCH] USB: serial: mos7720: improve handling of a kmalloc failure in read_mos_reg()
Date:   Mon, 11 Jan 2021 14:09:04 -0800
Message-Id: <20210111220904.1035957-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis reports this problem

mos7720.c:352:2: warning: Undefined or garbage value returned to caller
        return d;
        ^~~~~~~~

In the parport_mos7715_read_data()'s call to read_mos_reg(), 'd' is
only set after the alloc block.

	buf = kmalloc(1, GFP_KERNEL);
	if (!buf)
		return -ENOMEM;

Although the problem is reported in parport_most7715_read_data(),
none of the callee's of read_mos_reg() check the return status.

So move the clearing of data to before the malloc.

Fixes: 0d130367abf5 ("USB: serial: mos7720: fix control-message error handling")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/serial/mos7720.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index 41ee2984a0df..23e8162c768b 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -214,6 +214,7 @@ static int read_mos_reg(struct usb_serial *serial, unsigned int serial_portnum,
 	u8 *buf;
 	int status;
 
+	*data = 0;
 	buf = kmalloc(1, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
@@ -227,7 +228,6 @@ static int read_mos_reg(struct usb_serial *serial, unsigned int serial_portnum,
 			"mos7720: usb_control_msg() failed: %d\n", status);
 		if (status >= 0)
 			status = -EIO;
-		*data = 0;
 	}
 
 	kfree(buf);
-- 
2.27.0


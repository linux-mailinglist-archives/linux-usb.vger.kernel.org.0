Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7DA514708
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbfEFJDx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:53 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41768 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfEFJDx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:53 -0400
Received: by mail-ed1-f65.google.com with SMTP id m4so14501857edd.8
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kc9SMYinDDQKsm7AY7tnE0uJjwnQRQOCedhT8zDxpy4=;
        b=SjQEi/pPCGzck3c+h1n9LFWhC4kV2pxEClmgCKhLmB2ik6pAAX555/wLckWNAVWgrm
         keBTZ+7y9TbCkLv6Z2EMVvMDIEYiF0zXq2j3g400ZfOJtPpkJBF0k1EJFk+XgRY4/nbh
         af8GaaRlVeMMyQBgyxMEBFFraiwfPoi2F44qkM/7hSLY3VR5rHIrUQCSNaQhqEKfzIbY
         +7TLv+KeY6El3FJTt7DuUnuEDN2QAPuKdQQM9Da4EI3jPEn1GVimU5UU+1d2y17aHnVQ
         k4m+D9OJHE6vlHATkgCRh0TOFzRfmfPKMQCZlGHsXALLK8hJmm4brAOEZbr0CSi+lriu
         1V9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kc9SMYinDDQKsm7AY7tnE0uJjwnQRQOCedhT8zDxpy4=;
        b=MHYWxVSdO430cuAZaYz1Wl+rhLBtJDkSMJMKwk3ZIcUgBr9aQCAnKZwxlAs4RuwfBp
         FVWpeMV9ic3KzV5f1tcAPXs1rgFquR4RtCj6cmbJ5BGJ9pBf7Y8Kv1uH4PwOjRRQO9BF
         Y0DBQRzYz54FJRor4o1ZBtmQxt+hbcplb0YK3mz+nAM9wni8MG0kBznp3Nv1ZaQlRCBI
         oweqjAeWyFhRQtUaiCsDrb7Xsg/eY2juwkywVNM+bWEwybMX0kve61pjzmKRNKHDLqke
         3fWC/6eL1HV14qlKu0JgWHGEop63h5dLurMeJQGgxVGEUcf44cb5U+Bn4kVYVz6lM29N
         70oA==
X-Gm-Message-State: APjAAAVULu66hpxsSD8ib/m6JA7xpgxl+3dgzHTzJvnRzzvuQIQfS2oY
        uRe09AQCEQfCIQKSrgCHqgnfVFha7uA=
X-Google-Smtp-Source: APXvYqxm0Vu2/w9ucc+Ouep9JUZpQiP3o0GiaX85Aoy2REfZUBm0xjZ8lcHrpKvXxWWmJHLXuIAPFQ==
X-Received: by 2002:a50:ee01:: with SMTP id g1mr24688531eds.263.1557133431136;
        Mon, 06 May 2019 02:03:51 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id n3sm1497068eja.70.2019.05.06.02.03.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:50 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 21/34] lsusb.py: allow - as well as _ when matching hci module names
Date:   Mon,  6 May 2019 12:02:28 +0300
Message-Id: <20190506090241.169665-22-grawity@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506090241.169665-1-grawity@gmail.com>
References: <20190506090241.169665-1-grawity@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
---
 lsusb.py.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 823cc8a..2c1e5e2 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -359,7 +359,7 @@ class UsbDevice:
 		except:
 			pass
 		if self.name and self.name[:5] == "Linux":
-			mch = re.match(r"Linux [^ ]* (.hci_hcd) .HCI Host Controller", self.name)
+			mch = re.match(r"Linux [^ ]* (.hci[_-]hcd) .HCI Host Controller", self.name)
 			if mch:
 				self.name = mch.group(1)
 		if not self.name:
-- 
2.21.0


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA004DC39
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 23:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbfFTVKP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 17:10:15 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36921 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbfFTVKO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 17:10:14 -0400
Received: by mail-pf1-f195.google.com with SMTP id 19so2360943pfa.4;
        Thu, 20 Jun 2019 14:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d7vMFa0RiXSgIQ7GsvInRxIKmt+saHYI+AQuO3/IDBY=;
        b=gWbcCmVMhKhfH83nz0SjOdViQ6bh80WcOh4JOq9apD0RZ3GvLo6yMIGpz6gWuRBfhg
         xyhsiwWbOmiD3O1NFP+UCB+IfcbuNYmqLr2gHzzayjHX75hby0YC+7Yz2hFuV+u1dilz
         a8NV+0xx44k5S91z/FNjzBResy8ZymC96ybQBmF0qfCTxZHf2hO6zcBw+xO2P8vgE5+R
         lcN0jQLlyI7HWxYRogLqGz5N53kMU1P3M/XoSQTHIsj5KMgGo9rzrZp3bU75W6O/PAre
         NLosSZLaNftHUl8nDeEpKppSNajoZNEcH9z2Pv/lvoRTwlzAhQZHxiz3EUS3El8OGKx4
         Mpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d7vMFa0RiXSgIQ7GsvInRxIKmt+saHYI+AQuO3/IDBY=;
        b=IOoij155dGht7F7hij+rHgnM4pTFjPQdDdNSgC4UUyCBgu0hKyip7isF9J4jciNmwx
         CeFfuVMFTBiBKRFK4OSdWRcrpJCFeDylLx/HorO+5968dwI3pVIGTQnnKQOvdEfYKNN6
         hJON/QYnZUIOgFdqtMeklAqiDWUmKKWJ9uEOL4FwQalC+Zn6PRzpgjIkkAs6vvSWjCX/
         miiuBYiEwjPyBpZAB9JCNHE9LxD5LaYCJ53/Xi5uvHHNRacswI60pk5zE02cvAbGTfDV
         bbCVF9YdL16NbRwIdYQra5fF671j5PxoSZzjZkgzYRYNrTKJ13IpfyXBVh2waN64Lz3s
         7g6g==
X-Gm-Message-State: APjAAAWeV0F3ebOujyGyKB+n2Omq+P1mWzd3uIZDYfBCpYRyCNbMWdT6
        juTmK0IaZNA9FZENF8KD1DuSGPC4DfU=
X-Google-Smtp-Source: APXvYqwPu7zJoLPZ+CyAH5QO33Bz/OAkt9kFMf1CNxrQboGzgxE1HFuV1K6F0dmYBSU8fVvnKOW7bg==
X-Received: by 2002:a17:90a:cb8e:: with SMTP id a14mr1653269pju.124.1561065013299;
        Thu, 20 Jun 2019 14:10:13 -0700 (PDT)
Received: from stbsrv-and-3.and.broadcom.com ([192.19.231.250])
        by smtp.gmail.com with ESMTPSA id p1sm386805pff.74.2019.06.20.14.10.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 14:10:12 -0700 (PDT)
From:   Al Cooper <alcooperx@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Al Cooper <alcooperx@gmail.com>, devicetree@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/6] usb: bdc: driver may fail to get USB PHY
Date:   Thu, 20 Jun 2019 17:09:48 -0400
Message-Id: <1561064991-16874-4-git-send-email-alcooperx@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
In-Reply-To: <1561064991-16874-1-git-send-email-alcooperx@gmail.com>
References: <1561064991-16874-1-git-send-email-alcooperx@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Initialization order is important for the USB PHY and the PHY clients.
The init order is based on the build order of the drivers in the
makefiles and the PHY drivers are built early to help with
dependencies, but the new SCMI based clock subsystem has the side
effect of making some additional drivers DEFER until the clock
is ready. This is causing the USB PHY driver to defer which is causing
some PHY clients to fail when they try to get the PHY. The fix is to have
the client driver return DEFER when it's "get phy" routine returns DEFER.

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 drivers/usb/gadget/udc/bdc/bdc_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 11a43de6c1c6..c794890d785b 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -543,9 +543,13 @@ static int bdc_probe(struct platform_device *pdev)
 			dev, dev->of_node, phy_num);
 		if (IS_ERR(bdc->phys[phy_num])) {
 			ret = PTR_ERR(bdc->phys[phy_num]);
+			if (ret == -EPROBE_DEFER) {
+				dev_dbg(bdc->dev, "DEFER, waiting for PHY\n");
+				return ret;
+			}
 			dev_err(bdc->dev,
 				"BDC phy specified but not found:%d\n", ret);
-			return ret;
+			goto clk_cleanup;
 		}
 	}
 
-- 
1.9.0.138.g2de3478


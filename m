Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 621F058C11
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2019 22:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfF0Uw6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jun 2019 16:52:58 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45493 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbfF0Uw6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jun 2019 16:52:58 -0400
Received: by mail-pg1-f195.google.com with SMTP id z19so1535951pgl.12
        for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2019 13:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ueb/BBqVPcgcgShNRILhcqgksfTQMKckAnG70UYWi7Y=;
        b=YpvV2Bf75JwXf8zBL791UUdonRQB1s2FnGsM4WUtvTVpxINnBkWjZ071FmocfAawdX
         NUs7QZyUSMflrdueEkKNZn9NWZ0WFSd0BMoBbgVFI5CNI3Jy/3PqRQG5CiELjJsbTe7n
         7ZKZIJxq2tyv7zO25HRedUVCmwi4yQcjKfFA0NDeRjcRQ5wRGMThZDHBuoYYiRYQZL3o
         ZVaV0DUDHhPPUU7PDFsaVBnfkwLRsHmgJ/s9bDUd8xjY0m/o3hRmWRv9fH/utDBHoYvc
         li6z6fOj2GinZGhmyoz943Bvp32xwUlZvCpgbV7dtm+ijB9ymVQJABsQzEBldCzBHOu5
         jnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ueb/BBqVPcgcgShNRILhcqgksfTQMKckAnG70UYWi7Y=;
        b=lO68dOblE7i68IJDn2Cej1Rp4U8vG3FxoW5/ZN6NPs59MZdLrYjCcEcQx0AazMQ6ku
         Ogbo4+6jU8AM5YM/7jevCxB8Sq/NQjMMZBifbzXvgM4w7eylgHcqoybzhzlpJiHW39HG
         tx0XX2KW/tsnTAx8rBfnq+hOxfiRAEbzkHE8C2sLEEqEzAQTEVBy6d5X4Esf6sgPas0N
         T1VYLWKTUZ3ttnSCJoNmbBy7hsakj+5RLaapxpMGdR/imUGpfqgivB44GVjaIvG4TNoC
         qvOXULrJgCSZ3enNzYvviLxsAQQp9zNOYJLALyycJOTBfKw7htlBMlchuJDgF43KLiez
         Sn8Q==
X-Gm-Message-State: APjAAAXda++jtMWnaUX70X7saMfl3++2cGFUGBQNyKANDxKw4bx4XYny
        Dxv6y2Zks2+uv0A7NP/JpWtm3mUjOos=
X-Google-Smtp-Source: APXvYqw6yndLJFqzJcTPdL5U8C6p4mcNBLoGKWs5pKly+0Z18tO3DXGXGcUh3kXtYe8GJ+Y6ng9frA==
X-Received: by 2002:a65:6694:: with SMTP id b20mr5506490pgw.155.1561668777440;
        Thu, 27 Jun 2019 13:52:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id 2sm3674083pff.174.2019.06.27.13.52.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 13:52:56 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     stable@vger.kernel.org
Cc:     John Stultz <john.stultz@linaro.org>,
        Fei Yang <fei.yang@intel.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH 4.19.y 8/9] Revert "usb: dwc3: gadget: Clear req->needs_extra_trb flag on cleanup"
Date:   Thu, 27 Jun 2019 20:52:39 +0000
Message-Id: <20190627205240.38366-9-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190627205240.38366-1-john.stultz@linaro.org>
References: <20190627205240.38366-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit 25ad17d692ad54c3c33b2a31e5ce2a82e38de14e,
as with other patches backported to -stable, we can now apply
the actual upstream commit that matches this.

Cc: Fei Yang <fei.yang@intel.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org
Cc: stable@vger.kernel.org # 4.19.y
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/usb/dwc3/gadget.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 879f652c5580..843586f20572 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -177,8 +177,6 @@ static void dwc3_gadget_del_and_unmap_request(struct dwc3_ep *dep,
 	req->started = false;
 	list_del(&req->list);
 	req->remaining = 0;
-	req->unaligned = false;
-	req->zero = false;
 
 	if (req->request.status == -EINPROGRESS)
 		req->request.status = status;
-- 
2.17.1


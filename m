Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3CA5A36D
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 20:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfF1SYU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 14:24:20 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35180 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfF1SYU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jun 2019 14:24:20 -0400
Received: by mail-pf1-f194.google.com with SMTP id d126so3399507pfd.2
        for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2019 11:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=80ekKnnJbJ+N9S8CSdtwlr9DiGvzY1b4sXIFJmFharo=;
        b=N7n5rsXUCKOo6iC/j6Yoz9nSlgDmhyVVXfwTfbqvI75MhNqSHBZsu4UTtnGk8jwnRF
         JqwdgJqAPKCBXPBDgBNzH9lPdRsDPtse3H4Vy+BCQxCwiDK6eWz/q4Z+H7DWjEmhmfPH
         7NMrKie2+MIA0cv9h52OEILExdLi9Hcd4CTPftfm2fuLKQXzIjSGTcRhFX//WCnMQguZ
         dEZvZpfGFB0AvGkSJHD24Fc9fN/OYEuugW6/Zde80HoCUdKux8R65Q7z2wW4ba87gjrr
         mOP+oLCf0Qr+r1i0D6AtaTcua9wlmRg2n820LMTDC32lDtniMVCg35R0eLhIUN/hDczp
         Muow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=80ekKnnJbJ+N9S8CSdtwlr9DiGvzY1b4sXIFJmFharo=;
        b=JC0SNs6sv1Rb/rADCbnUps1SxSAoJlnPABUbTqKutvgsV37QmbiSZ3a/ZjiDIpINIn
         pczUGUf0pY1mX+t6gK1u1LnzHFu2iDNcqWYYl6lmsLb9C1bzRRXrQZZvnWNZIdCeSXuC
         KhGwlbD+0UG8vZ4wk3CM0xz6v3/sCVuWt4ZSGDMDQqaBDP4+rVY4u7m7MBu4JEAIROO6
         dYFVByU+KSOuu1PrN7cUZOuVFZlaFg+rvyl/NLlSVwBR4/uhkvm1gtplY9GyRQBh1pQA
         U9PajHDxPpZ7Y/PVdsTfLlKfRFg8qUGqZTLf29WjYtTbbCYgGQnEVT2Tseg/QINjoLYy
         ZN4Q==
X-Gm-Message-State: APjAAAUOD2QHkO6x5DU+oElACIyge2Zv3gt8v+4CgcxhN7neGi6L4IfW
        tsk7wV7e8IZy3PXTr/p7sO7Qfg==
X-Google-Smtp-Source: APXvYqyYnBAyWCgFARuxspznmYO7UnkE0AX8irdmIt+l6LSBhyP2TvzeVO9riPN40MErj5bcpzk/jQ==
X-Received: by 2002:a63:db07:: with SMTP id e7mr6227730pgg.110.1561746259294;
        Fri, 28 Jun 2019 11:24:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id s15sm2916223pfd.183.2019.06.28.11.24.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 11:24:17 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     stable@vger.kernel.org
Cc:     John Stultz <john.stultz@linaro.org>,
        Fei Yang <fei.yang@intel.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH 4.19.y v2 1/9] Revert "usb: dwc3: gadget: Clear req->needs_extra_trb flag on cleanup"
Date:   Fri, 28 Jun 2019 18:24:05 +0000
Message-Id: <20190628182413.33225-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628182413.33225-1-john.stultz@linaro.org>
References: <20190628182413.33225-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit 25ad17d692ad54c3c33b2a31e5ce2a82e38de14e,
as we will be cherry-picking a number of changes from upstream
that allows us to later cherry-pick the same fix from upstream
rather than using this modified backported version.

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
index 65ba1038b111..eaa78e6c972c 100644
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


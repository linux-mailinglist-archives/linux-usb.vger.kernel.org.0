Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63338BE90D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 01:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732528AbfIYXmh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Sep 2019 19:42:37 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36804 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732377AbfIYXmg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Sep 2019 19:42:36 -0400
Received: by mail-pl1-f196.google.com with SMTP id f19so409198plr.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2019 16:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oFS6SaDoQ5fogHAHlhUMYfV/B7rrjNj6XYxhAXSXdHY=;
        b=XvDA+NkZlQlzPntPpjyLnCwo/WMpiawNV16X6mS3GsH4vcvrLxIwDzxYjPuOD4qfwe
         bTRHEmnPfk0/rdKZnFAtoCQ/uIhxYV+bdRcwqF4ULyV+nZYiAAeF3Hi+sb9L4Czig47U
         /yVBx0tgtnVfRk5pxFgslL0VtxWhQD9bw6cQnOCIGsZHsRmU5hkfrqI011qcoF/iRPYA
         i3HVbdthKqwyEnRg6KjgxzIkY/XUU6CHm6+e6rL7aUTdfykUhIvWnKW4kc9siqTAtV45
         O2D9wxGy8ZzlLJort0W50oCWJ+aH9H4HR9Veu43IDm7Sm29yvfGM/qaBLLF3Fzsi11R4
         0JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oFS6SaDoQ5fogHAHlhUMYfV/B7rrjNj6XYxhAXSXdHY=;
        b=D+ObvQaIVS5cRA2MidIBRYfRYZWJd+gifEJuPTZyaba50wyFGh6QR+TKsWekelj2v6
         UbIXM7JbMgFw8xFj81jmzqLm6TDKyU1g7WVOU+S+p9BpMUv/SLbkrYQ1mu/ij0hUK74f
         QHtLFxxIMGpZHF15Ycllf0O/TuC6F1k17NCIrY02q22qHH5MjqLJYWqRSwFiw2vU16Mu
         c1ly/EMgJaEQD05jlAP525zAoarVc8yNIvFA7uxkksTsCp5WJRnnuUCkfPcbyc10N75F
         v/STqMmSqD04cMp7+YrZxDmP/EehUeq7sYFWBIOp5wIA+gC8xDtpnSUatH97oWRLtp7P
         /QJQ==
X-Gm-Message-State: APjAAAUfj5Em3HQyC2br0uEiS6KK0RvmYoIzQHSuSfCfGTnDt+E+r4/q
        KmlbYzDuOi9CWIWh3Za27ycVaw==
X-Google-Smtp-Source: APXvYqyOtcEZXkAQw/XIO3JzERDkezLxycWYYHw08A6acjxATTtdAu3X9Fx8RAKp+WZv6SnW21J0rw==
X-Received: by 2002:a17:902:aa07:: with SMTP id be7mr738556plb.172.1569454956010;
        Wed, 25 Sep 2019 16:42:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id d1sm131127pfc.98.2019.09.25.16.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 16:42:35 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH 3/5] usb: dwc3: Increase timeout for CmdAct cleared by device controller
Date:   Wed, 25 Sep 2019 23:42:22 +0000
Message-Id: <20190925234224.95216-4-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925234224.95216-1-john.stultz@linaro.org>
References: <20190925234224.95216-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yu Chen <chenyu56@huawei.com>

It needs more time for the device controller to clear the CmdAct of
DEPCMD on Hisilicon Kirin Soc.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Yu Chen <chenyu56@huawei.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 8adb59f8e4f1..81907e163252 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -270,7 +270,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
 {
 	const struct usb_endpoint_descriptor *desc = dep->endpoint.desc;
 	struct dwc3		*dwc = dep->dwc;
-	u32			timeout = 1000;
+	u32			timeout = 5000;
 	u32			saved_config = 0;
 	u32			reg;
 
-- 
2.17.1


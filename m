Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA5D10FB92
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 11:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbfLCKPl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 05:15:41 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42351 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbfLCKPl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Dec 2019 05:15:41 -0500
Received: by mail-pf1-f193.google.com with SMTP id l22so1616962pff.9
        for <linux-usb@vger.kernel.org>; Tue, 03 Dec 2019 02:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=la8F/ukOCmlxZOPSk03ZdEI5AybzNjyoXK4eemJfXxE=;
        b=G226RTXHw3qcB+VS063+Ay6A/MbQWClSU74oKAEWlESOOxPKzIsw6XIGv1bELVqcNg
         jmYzwjk2ghqoJSwOP6SlpYxj33qgOQyzC2jq3UkuNRyXEsJNFzg0z+zIMQ9IZJ448EZd
         ctOO2I5biTxKUYaUd8ePhb5JWZ4NK5eJwEbOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=la8F/ukOCmlxZOPSk03ZdEI5AybzNjyoXK4eemJfXxE=;
        b=MbN9syhELVQEB0HK5y0S4Pf0FeHnhQKI4lUI4DvJ7ltN/VdOCFxBrCjAIlH+vlGyub
         ynS5KWldS+YnwKqRdAocCf/m0eOFgGff2X7rp9u8gkvlaCwMqwmmawBcJCzu7aM0ek91
         Ewu7E2TsjLK8ipJiKErSKLnNTsyJCY8X5PNHxFd3da+sok4f94xIxKzzZYo/I5NytUct
         T/Pi/VsAALj08ERBG4E2tDQ2qaWgy+MQZO8ZnuRcRsEwJgGuoBqv67JTsvK6bhDtKYnC
         MdPc2hzDRc/s2YqHohDf/cyhhZeRW41d0cFMKL+pYkIrz38SDcqcVQasz9U9MiNhWENk
         oFeA==
X-Gm-Message-State: APjAAAXUAsmr5wi8VaDs8veP7uskhtY51I9AMVUh8o5qsT19cNeVIWFl
        eNE/PKgycUKDOiWXce//KyXZ6Q==
X-Google-Smtp-Source: APXvYqxi6mHP/CPl92Tl/wfPvYWI3JtJFadHEo9LlGyht/c7K25YTpYXkaeEZu0Y3pG5p+MUZJWu0Q==
X-Received: by 2002:a62:b504:: with SMTP id y4mr3894348pfe.251.1575368141054;
        Tue, 03 Dec 2019 02:15:41 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id x11sm2943131pfn.53.2019.12.03.02.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 02:15:40 -0800 (PST)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     devicetree@vger.kernel.org
Cc:     GregKroah-Hartman <gregkh@linuxfoundation.org>,
        RobHerring <robh+dt@kernel.org>,
        MarkRutland <mark.rutland@arm.com>,
        AlanStern <stern@rowland.harvard.edu>,
        SuwanKim <suwan.kim027@gmail.com>,
        "GustavoA . R . Silva" <gustavo@embeddedor.com>,
        IkjoonJang <ikjn@chromium.org>, JohanHovold <johan@kernel.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        drinkcat@chromium.org
Subject: [PATCH v4 1/2] dt-bindings: usb: add "hub,interval" property
Date:   Tue,  3 Dec 2019 18:15:36 +0800
Message-Id: <20191203101536.199222-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add "hub,interval" property to usb-device, so hub device can override
endpoint descriptor's bInterval.

When we know reducing autosuspend delay for built-in HIDs is better for
power saving, we can reduce it to the optimal value. But if a parent hub
has a long bInterval, mouse lags a lot from more frequent autosuspend.
So this enables overriding bInterval for a hard wired hub device only
when we know that reduces the power consumption.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 Documentation/devicetree/bindings/usb/usb-device.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
index 036be172b1ae..44bef2ff2704 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.txt
+++ b/Documentation/devicetree/bindings/usb/usb-device.txt
@@ -66,6 +66,9 @@ Required properties for host-controller nodes with device nodes:
 - #size-cells: shall be 0
 
 
+Optional properties for hub nodes
+- hub,interval: bInterval of status change endpoint. The range is 1-255.
+
 Example:
 
 &usb1 {	/* host controller */
@@ -75,6 +78,7 @@ Example:
 	hub@1 {		/* hub connected to port 1 */
 		compatible = "usb5e3,608";
 		reg = <1>;
+		hub,interval = <8>;
 	};
 
 	device@2 {	/* device connected to port 2 */
-- 
2.24.0.393.g34dc348eaf-goog


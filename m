Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A996934B917
	for <lists+linux-usb@lfdr.de>; Sat, 27 Mar 2021 20:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhC0TP4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Mar 2021 15:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbhC0TP1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Mar 2021 15:15:27 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096DCC0613B1
        for <linux-usb@vger.kernel.org>; Sat, 27 Mar 2021 12:15:26 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id a19so8604168ybg.10
        for <linux-usb@vger.kernel.org>; Sat, 27 Mar 2021 12:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=D4BSvyULDIvQhM59Eq/aBYRm8DPbWmDg1808r3m/Wf4=;
        b=BnG8cw3ifTkS8jEwoTI35vUaDckSYmj2tZJ6miykb3li++zpgwt4/XBzq0NZtq2FHV
         NVfKlZ2hiwWeHlY0QkaYLPAlTNNLPxxrXuOiuoApYHtIdgVzZ/l0ViFd+1x4DLHqLEcz
         x81MXek+RJ5Ny2+EhB2zjoupHV1hmUgyDw6DJpo4pndlvLG9O9DkTLWy6xfEjFbaLu3u
         c8qqejYDPdAtxYzY3E/S/M9JYPmJ53CahKV44MjnkS4/M9V6X/9aKweQkefBtEFZdrJ2
         agLTjDWulCRWrKzsqu31ZdpnvPzieZBfj6Yv0cUr2VCTU2yJ6GH79BBLlICCdcy5MvZa
         18xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=D4BSvyULDIvQhM59Eq/aBYRm8DPbWmDg1808r3m/Wf4=;
        b=P9keqn5ZxATrzTjQQwKVAEPFiobvQt9kGvO1AsNnK4cQjh2RD+g+n4l4MBVxGOjJIp
         4yvDAvHtXaKoTXttTDPNHWiP/wuNKomnuG5XFE4B39j3vt+wMXjuXJUco2p2m8txDG+o
         2lG8YvWO4DEE3XZmtjWxKSsXh2AZCEp5of8tvbJOSD4UBbsZiuB1Td45jrGFP5nIxWvg
         7uqx0w/KFTDJW9sg/9N0J1utviA+AXyoyqgB5CrU+0QC5QhX0yjmfWvYLZCCAZ8OxZXS
         8x137g6wSQLk5ulFh30yCKgbKK34zQroJCjVF1JiGo0zx9DBYPqXyv8haogtT7p+HS/k
         L1Pw==
X-Gm-Message-State: AOAM533PBRPt6GuiYewN4jQm8zzVxVXcgt/Z/42gUS8NcXCRP0hjaP5T
        tA7rBA1UsISJuPOsq/mmUQbJBOh3KIc=
X-Google-Smtp-Source: ABdhPJxk73Jxat1DtHJiVFtbG+2RDBMwpE7ccTi3X8BLFbdEGElL1whuRHyYuAcFqTEKdJhDNXxHRajvcoY=
X-Received: from raychi.tao.corp.google.com ([2401:fa00:fc:202:493c:e5b:69c:54cb])
 (user=raychi job=sendgmr) by 2002:a25:af49:: with SMTP id c9mr28974925ybj.335.1616872525346;
 Sat, 27 Mar 2021 12:15:25 -0700 (PDT)
Date:   Sun, 28 Mar 2021 03:15:20 +0800
Message-Id: <20210327191520.1824466-1-raychi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH] dt-bindings: usb: dwc3: Add usb-psy-name string
From:   Ray Chi <raychi@google.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kyletso@google.com,
        badhri@google.com, Ray Chi <raychi@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This commit adds documentation for usb-psy-name string.
The string will use to find the power supply interface.
And then, DWC3 can use the interface to control charing
current with USB state and USB speed.

Signed-off-by: Ray Chi <raychi@google.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 2247da77eac1..ad62f4552fad 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -301,6 +301,13 @@ properties:
     items:
       enum: [1, 4, 8, 16, 32, 64, 128, 256]
 
+  usb-psy-name:
+    description:
+      Contains the name for power supply interface. To follow
+      BC1.2 specification, DWC3 could use power supply interface
+      to control current with corresponding USB state and USB speed.
+    minItems: 1
+
 unevaluatedProperties: false
 
 required:
-- 
2.31.0.291.g576ba9dcdaf-goog


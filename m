Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69F993DB8D3
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jul 2021 14:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238824AbhG3Mph (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jul 2021 08:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238887AbhG3Mor (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jul 2021 08:44:47 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DAC6C06179B
        for <linux-usb@vger.kernel.org>; Fri, 30 Jul 2021 05:43:57 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id z16-20020ac87cb00000b029025bf786be09so112689qtv.20
        for <linux-usb@vger.kernel.org>; Fri, 30 Jul 2021 05:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=kaUeOg4wMw2l7vTceRoyu4/OPISM5UcP9eJirJ9oM9Y=;
        b=MWnjHnvoqoYAt3FQds194USz9dVhS/WB5OxryNDxnP0BJFGA1sltN0eRhXDFJBh/om
         Dj4mlAX67YWNYYLhCbG1/tc+JtMFt4r7r+KY8MvBYe0NFSq/S4A5lVfDWxvTvAkvSIv9
         gNf1L4GdiXsjMMTMub7kTWDLtAm+XTcIbB5R9omww6cZhja4yMF5AEQudIIzX3F2g1fm
         bZYUqlzR295HVO9uYBWHqof7FSIRQkggr7QI2YcFkg4BBPmekmqdO/hyvmfQJTSxmmwH
         vuSQUWQ22AqAnK/cgsIpfLRXNrspLK6XA+frjobDHHcyW6XMsyKzetuxQ2xTceSJsye2
         1XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=kaUeOg4wMw2l7vTceRoyu4/OPISM5UcP9eJirJ9oM9Y=;
        b=CoEVv8bLZmEJ9CdzLD2jT7emFGwk5uXmCXRCfeMIdVKPJtPe6JK4YyjVDcEo9rvNbB
         C6o/wZGMrOka9mK4ee+RcEkXRcbExSJtKNdqGZEsXjX4IqfdGGAb8x0yIjr3/oT2ZLqa
         JlvjsNxedj2GrXBSxsWwHLKKq9/PlTKJXTZKBYHBa4Fu3XUeI7fDA0uXKh9mniX478rN
         P6YsG2clb4b/iySq6lpUiBMi9WpAfBPll3AGRiCbezvqTk8nFuVhjZ54o1XRpgN66ixD
         s26q07k759ZvQaZGE9GvJ2wKkYOCrHYsGCyyQoYLphslupcuuey2gJ2BG6p5GxbpBn7U
         brkw==
X-Gm-Message-State: AOAM531cJ0dCG4PCQ280qkd+GAuR3j8hEYQ6GIbZx4O5ZzOor+0o3Kdf
        JdoJZXir+Fzkw3gLhvlbYdxVFkHuZxGd
X-Google-Smtp-Source: ABdhPJw7QIaNo5xLOs4ReEDdoq0ozBmSokGCqKvMO19HHr9L4/Gush9xfvT7WQTK6GG+Cr80INWUAEzmaZFz
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:6892:a74:4970:a062])
 (user=kyletso job=sendgmr) by 2002:a05:6214:1021:: with SMTP id
 k1mr2372695qvr.4.1627649036478; Fri, 30 Jul 2021 05:43:56 -0700 (PDT)
Date:   Fri, 30 Jul 2021 20:43:47 +0800
In-Reply-To: <20210730124348.1986638-1-kyletso@google.com>
Message-Id: <20210730124348.1986638-2-kyletso@google.com>
Mime-Version: 1.0
References: <20210730124348.1986638-1-kyletso@google.com>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH v5 1/2] dt-bindings: connector: Add pd-unsupported property
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Set "pd-unsupported" property if the Type-C connector has no power
delivery support.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
Changes since v4:
- Corrected the subject

 .../devicetree/bindings/connector/usb-connector.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 92b49bc37939..21ec470117a6 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -111,6 +111,10 @@ properties:
       - 1.5A
       - 3.0A
 
+  pd-unsupported:
+    description: Set this property if the Type-C connector has no power delivery support.
+    type: boolean
+
   # The following are optional properties for "usb-c-connector" with power
   # delivery support.
   source-pdos:
-- 
2.32.0.554.ge1b32706d8-goog


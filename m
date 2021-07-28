Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6955B3D8A9C
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jul 2021 11:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235522AbhG1J3q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Jul 2021 05:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235444AbhG1J3q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Jul 2021 05:29:46 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0697DC061764
        for <linux-usb@vger.kernel.org>; Wed, 28 Jul 2021 02:29:45 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id t101-20020a25aaee0000b0290578c0c455b2so2127470ybi.13
        for <linux-usb@vger.kernel.org>; Wed, 28 Jul 2021 02:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=RUJPh6UqFvsmnaeSLFxYRKVeU3eXey0w6Oeu1NKymnI=;
        b=SAUZTquQMTOFe3oo+mO1hGfbqJlmT+2gKwTClaKYJ/O2cpkGEViRDgvq7webhvbRkC
         xCTxqkcR31iJTz1JxG7j+34DjrkTr6OqQ6fwcjYx40q+UCmvtKqa1F4vZYrtm9fBHshx
         nQNvY3FkrocKOb0ic68hEMQGjvzDUOUlNXnHFAa1tqNDz/OgB8yqpuLFf+q56oZbh+v1
         GuSRUXZUP7HDEaaX+BVTrWG63Hqd20/wIokRwncseKTd2zbe143s605qRg5QuBhD1EAX
         CjHyHrqSIcpxa5dE9dbUyuAmqkufTpkAs8eY2A46iv4525GE8P/UigjmqKpAKzMkKFH+
         KWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=RUJPh6UqFvsmnaeSLFxYRKVeU3eXey0w6Oeu1NKymnI=;
        b=s1rKFGC3ojWBKV5mgYDd8uLruE/Zcua+UIXbvfEpELpBqstxzIIG744f//Q38Z9n+k
         d9R9xprZjQv4+PVJ/BiAi6sFONEyxQnV0wU2FTn1BKMa2FrhXszTy+4WWiWdE9i2abOJ
         8qQ+8g2MC5nh0d4VamUMll8vaSylwQxrjMPud8Gq3elVqMy24FzKa9ab8IBcHtZDSt3m
         P+jA0h9BNleONLCWG6Nos6iGCuHHSawpSJGq9Tumj6jyV/nn6xaMxzbCk6rejhqxKitN
         yoHv7+PlpIBu6lj6FyziR/MUQC/WUEL/uDXtxSFoijDEXYtCJjmUOtxLvYQmckpwAaAH
         YeEA==
X-Gm-Message-State: AOAM532jBcMT9wPUQgeSyPeyi0dz2FRQz7tQLxO0N+FVmAjpYkE0bL5g
        tTG4xagWYChaReTYQqjJMTSWfqV80tJD
X-Google-Smtp-Source: ABdhPJxIed430XTN1GHV69yeSBEg8wY0pGsT1vjQrsjClecO5dJSZdfCxhtFXLHjMS6YdFjr+5AgRyclgpYp
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:da7f:a21b:ee74:66a2])
 (user=kyletso job=sendgmr) by 2002:a25:24d4:: with SMTP id
 k203mr21079840ybk.383.1627464584182; Wed, 28 Jul 2021 02:29:44 -0700 (PDT)
Date:   Wed, 28 Jul 2021 17:29:29 +0800
In-Reply-To: <20210728092930.2552619-1-kyletso@google.com>
Message-Id: <20210728092930.2552619-2-kyletso@google.com>
Mime-Version: 1.0
References: <20210728092930.2552619-1-kyletso@google.com>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
Subject: [PATCH v3 1/2] dt-bindings: connector: Add pd-supported property
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
changes since v2:
- Negated the meaning and the name of the dt property. Now the name is
  "pd-unsupported".

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
2.32.0.432.gabb21c7263-goog


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77BAF354A33
	for <lists+linux-usb@lfdr.de>; Tue,  6 Apr 2021 03:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243163AbhDFBhP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Apr 2021 21:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243186AbhDFBhJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Apr 2021 21:37:09 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94AA9C061788
        for <linux-usb@vger.kernel.org>; Mon,  5 Apr 2021 18:37:01 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id l13so9489196qtu.6
        for <linux-usb@vger.kernel.org>; Mon, 05 Apr 2021 18:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=MAtT5IENk0bC9gBQziGXRz4UgkBtlGCp0/LaMeeOCJs=;
        b=Ivh9XNG4Qutnb7/BovIsn7HjCHYJZgmeVhN28v2wxyya/IxwWx2RpOfZ/6k0qGfXGs
         TAaJ+ow+qxl47MKsWRTXkmIAv47ed07eRTnGHMfq68OPpY/iB7XRh/fQ6hzGIhAIHbWn
         vrBxvqcP8sbf395/YbRIhVNTMcJdqcpCRo33r4yObDiY4EfPMuEDlISWvKgPhdK7dPVi
         i+phbqB6tCQryjF7C/a+6MvgKzmlXJ66/IYUtxKLD13sJqfdgCCSWSYpl+qbLo8JWur1
         Y7KKacZQWu4iQqtb90V2aylEfD3NAzXT7xng/WkHU/9Ro3ULhLRjkeY++Re9WZFAmlcP
         f9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=MAtT5IENk0bC9gBQziGXRz4UgkBtlGCp0/LaMeeOCJs=;
        b=tjhe9b3yyVp88RlT5obFuF5iMgYuUJ4B8O2adn9Wcv7RV5m92sr/rjYYkKBN/DHV0k
         /TzGbWIgT/lVkeenv2EpLosoFJmPbPaW0AVis1BhRnuZ2JSTJVnh0OGhlLBTA4bNYl66
         RuHoKoWuKNvYGmlrHsrHoA20x8xxTWBWkC8AaqRQfAvOAI7lWIgwEHI1BwMl6T8tYAY3
         pZsVvi1yBHtCH5lF6svGvCoJZdVpCRxSc/Qshk/aXprNQUpTqBiXlOMKmpGaaagVtArK
         qTGDQhW7NXantewSego5qNJl1GxH1eeZPIWOkCa0vrxKZgpCtzjci7t2gqtQO1WEdWnu
         wDkw==
X-Gm-Message-State: AOAM530mzFMwj6KHSqF9gwIbK1SqWfMguqzaTe2JhQAq8/Ym2Jj9c3WO
        ihrnQzIIsXBv3WiItsMRpcDcyPH9nvU=
X-Google-Smtp-Source: ABdhPJxT7352JEwDxFYK/J/zwCsJcnIjSh6UXFP7OtRK7cfzmpG8gZNmd/0bEbVsT/QhZ8oSUN1oPKEs4xI=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:7080:32f9:cd15:6178])
 (user=badhri job=sendgmr) by 2002:a0c:fcc6:: with SMTP id i6mr3362208qvq.18.1617673020739;
 Mon, 05 Apr 2021 18:37:00 -0700 (PDT)
Date:   Mon,  5 Apr 2021 18:36:43 -0700
In-Reply-To: <20210406013643.3280369-1-badhri@google.com>
Message-Id: <20210406013643.3280369-7-badhri@google.com>
Mime-Version: 1.0
References: <20210406013643.3280369-1-badhri@google.com>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
Subject: [PATCH v1 6/6] Documentation: connector: Add slow-charger-loop definition
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Kyle Tso <kyletso@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To allow slow charger loops to comply to pSnkStby requirement,
this patch introduces slow-charger-loop which when set makes
the port request PD_P_SNK_STDBY_MW upon entering SNK_DISCOVERY
(instead of 3A or the 1.5A during SNK_DISCOVERY) and the actual
currrent limit after RX of PD_CTRL_PSRDY for PD link or during
SNK_READY for non-pd link.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 .../devicetree/bindings/connector/usb-connector.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index b6daedd62516..09ad3ad983a6 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -197,6 +197,13 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [1, 2, 3]
 
+  slow-charger-loop:
+    description: Allows slow charging loops to comply to pSnkStby. When set makes
+      the port request pSnkStby(2.5W - 5V@500mA) upon entering SNK_DISCOVERY(instead
+      of 3A or the 1.5A during SNK_DISCOVERY) and the actual currrent limit after
+      reception of PS_Ready for PD link or during SNK_READY for non-pd link.
+    type: boolean
+
 required:
   - compatible
 
-- 
2.31.0.208.g409f899ff0-goog


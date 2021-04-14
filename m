Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5415C35EB01
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 04:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345804AbhDNCkd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Apr 2021 22:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345674AbhDNCka (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Apr 2021 22:40:30 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A324AC061574
        for <linux-usb@vger.kernel.org>; Tue, 13 Apr 2021 19:40:09 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id m1-20020a17090a7f81b029014e3dc1b035so6011266pjl.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Apr 2021 19:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=qaeiP4TcmkgXReccF8JNSG63nl5JyNyZTFgqbhXpA8w=;
        b=Inaem3hvoh6bBnQ/t6s8zhXAyDUbPjoohiMB3we9nLNBh9OKJSk3yK1ERidnzbCHKZ
         8av0rHQJyFviHs3ODvVWEuBu5GgTUa02STo6Z1Vh0ois97JRYkWHQyptVwRgwoRqqdlp
         jJfbzKXePPrVxhP0YSvbNs9AJ1lvAxYtAyPxAdzq66BU8IVKBGZXLTzI+mc7OlKjsF3l
         b/8UvlKL+4XI5AlKBqS5QDBKrFGMW3hzsYog3y+O+yWhQpaO4jb6Q+GJFGG3CnCXY5zb
         LebyUhmGy0RY2GgthKz/nGW7bfOuMWsmoe1FNMfsvD7Fw+fNnuPNXzEdftYUUZVvApUC
         0olw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=qaeiP4TcmkgXReccF8JNSG63nl5JyNyZTFgqbhXpA8w=;
        b=fH/HVf4YxhL3pqh876nZxXBTRVcdEZJ9gF5Gd3aCjH1Bamfq8U7xup8MrBdtGf6zzs
         l5o8r1OkHfklIjqkOAVarxyFNBwhxKOkydT/qYfZ2MZOrXbyRmaQTeKDbnrOF3nVSHMU
         KBclktxcKP+4OzIqtAjIjLBgjEZ1LlhIt4LQMYxSU0qEhOwh3hK6ZYQO4LF3AhAtwzCN
         EcFbuADnpinngQdkq8txW+UIKgEvmZjFdD26xbu3cDw+dW24wNgvBA3PPfJtvnW8WQlZ
         /pXqb9n3F9KENy2hl8N/9NqzmflTcuR3VpLkW9b5pNyVZdz9e+gJbBCTyPaSc2kHp/Zi
         yuAA==
X-Gm-Message-State: AOAM533cMupQIFJOb3g0l+fk45ButU9gOdC3ayWZMJ84HesY5aMqCBzX
        s14ZvNkGGkRN87f3wlPnGC8JaJDVI2M=
X-Google-Smtp-Source: ABdhPJwPV18N9xjx5dwA3igxAJiFUaZL/VMUHoyaPfs+7PbKnBAcBE9xSAnWOXyldokRvRo3Bqkk4S2P2pk=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:91dd:58ac:7590:aa21])
 (user=badhri job=sendgmr) by 2002:a62:4d86:0:b029:252:c889:2dd8 with SMTP id
 a128-20020a624d860000b0290252c8892dd8mr1790835pfb.41.1618368009191; Tue, 13
 Apr 2021 19:40:09 -0700 (PDT)
Date:   Tue, 13 Apr 2021 19:40:00 -0700
In-Reply-To: <20210414024000.4175263-1-badhri@google.com>
Message-Id: <20210414024000.4175263-3-badhri@google.com>
Mime-Version: 1.0
References: <20210414024000.4175263-1-badhri@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v3 3/3] dt-bindings:: connector: Add slow-charger-loop definition
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

Allows PMIC charger loops which are slow(i.e. cannot meet the
15ms deadline) to still comply to pSnkStby i.e Maximum power
that can be consumed by sink while in Sink Standby state as defined
in 7.4.2 Sink Electrical Parameters of USB Power Delivery Specification
Revision 3.0, Version 1.2.

This patch introduces slow-charger-loop which when set makes
the port request PD_P_SNK_STDBY_MW(2.5W i.e 500mA@5V) upon entering
SNK_DISCOVERY (instead of 3A or the 1.5A during SNK_DISCOVERY) and the
actual currrent limit after RX of PD_CTRL_PSRDY for PD link or during
SNK_READY for non-pd link.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since V2:
To address Rob's comments
* Updated commit and the binding description.
* Updated subject as well.
---
 .../devicetree/bindings/connector/usb-connector.yaml   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index b6daedd62516..32509b98142e 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -197,6 +197,16 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [1, 2, 3]
 
+  slow-charger-loop:
+    description: Allows PMIC charger loops which are slow(i.e. cannot meet the 15ms deadline) to
+      still comply to pSnkStby i.e Maximum power that can be consumed by sink while in Sink Standby
+      state as defined in 7.4.2 Sink Electrical Parameters of USB Power Delivery Specification
+      Revision 3.0, Version 1.2. When the property is set, the port requests pSnkStby(2.5W -
+      5V@500mA) upon entering SNK_DISCOVERY(instead of 3A or the 1.5A, Rp current advertised, during
+      SNK_DISCOVERY) and the actual currrent limit after reception of PS_Ready for PD link or during
+      SNK_READY for non-pd link.
+    type: boolean
+
 required:
   - compatible
 
-- 
2.31.1.295.g9ea45b61b8-goog


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0887A3D7977
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 17:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237030AbhG0PNS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 11:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236931AbhG0PNR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 11:13:17 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1395FC0613C1
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 08:13:17 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id 15-20020a0562140dcfb02902e558bb7a04so314346qvt.10
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 08:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=eRPX9i2Qwxgyb840VTBcgurMoYEtKqMX2n5NCNoYN5s=;
        b=WHmyiWXjxEmfGiU9Vfl1WDVj9g7b5DFcRLrzPNPlZ2rD1seBdTFyl+uvQTVfSVf8LC
         Aojmwo6DSULDYMGPCCI/VlTIlGrFci16HL6L07bc5FNeKuoL9TjyfYzlgnYRntXOjkf1
         wXG9X/ANDybpTyqUsliQanO6Hd3tPmP5pOUb8PA5uAZKILlzyhxOAgiCIaxNf5rwFJ2G
         kr6WDJfgtNRLXSIfdqQP/WiyNHireT23a+BeIH5SWIrTjf7rPIG69MNpJy4TNq6kdY9/
         MEgIKk1HTqukO3X8mTcmCNAmJa4WUBmPU8OJSkX1CEdcp8rCFNiqV6ubDg50V1ue6jeY
         WoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=eRPX9i2Qwxgyb840VTBcgurMoYEtKqMX2n5NCNoYN5s=;
        b=pkh09uZuKBOsbtmKcmbZK8QqfxjfpJjZ6ZtVdbXHsI4H7VAdExCjfwgZeKblxJInph
         RlcrXSsfx83XDodbbbi2hTKo6dlRKypnPK1AIcxe7Jm90kvO3CiObMbjcO94Q2byLOXU
         tzKL8CsFhHDSb0O6Bas4ssFTc3NlGY3W5Gxeo3SOeoAcysZBWXykNUikgW1fEvB2miA6
         zRfkRRWIIMzDljFGVLOA2ta9/I8TPJhffrajU40Xr7vcw1O2fGd92CTMpRlwGNWEmntD
         v0bP86+4zOOqNh9n8Is5vJ4Fi9Sykh06LfQkWjXRWlWsLqtDgJ/DmtL2JxJCVSky74vF
         CQIw==
X-Gm-Message-State: AOAM530IZZfInKFvp5MM6hNHH1OLNS6ZsBPvkH3G5Wc+Deh3L6K9VEYN
        Cqa/TekFV3/N5wvvjXI8nG2knTf02rLN
X-Google-Smtp-Source: ABdhPJwP4hYxg86JWBvDQwckVtYazVArl6BotZSi0bs9vATCDKhYprIDAzbPvio67LbsImWsL5bFcO5HJoqp
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:da7f:a21b:ee74:66a2])
 (user=kyletso job=sendgmr) by 2002:a0c:ac43:: with SMTP id
 m3mr14003604qvb.5.1627398796116; Tue, 27 Jul 2021 08:13:16 -0700 (PDT)
Date:   Tue, 27 Jul 2021 23:13:06 +0800
In-Reply-To: <20210727151307.2178352-1-kyletso@google.com>
Message-Id: <20210727151307.2178352-2-kyletso@google.com>
Mime-Version: 1.0
References: <20210727151307.2178352-1-kyletso@google.com>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
Subject: [PATCH v2 1/2] dt-bindings: connector: Add pd-supported property
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

Set pd-supported property if the Type-C connector has power delivery
support.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
 .../devicetree/bindings/connector/usb-connector.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 92b49bc37939..8ed271feea08 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -111,6 +111,10 @@ properties:
       - 1.5A
       - 3.0A
 
+  pd-supported:
+    description: Set this property if the Type-C connector has power delivery support.
+    type: boolean
+
   # The following are optional properties for "usb-c-connector" with power
   # delivery support.
   source-pdos:
@@ -312,6 +316,7 @@ examples:
         label = "USB-C";
         power-role = "dual";
         try-power-role = "sink";
+        pd-supported;
         source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
         sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)
                      PDO_VAR(5000, 12000, 2000)>;
-- 
2.32.0.432.gabb21c7263-goog


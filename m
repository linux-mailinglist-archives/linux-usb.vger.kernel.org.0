Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 334017BE3C
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2019 12:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbfGaKU2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Jul 2019 06:20:28 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46118 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728268AbfGaKU1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Jul 2019 06:20:27 -0400
Received: by mail-pf1-f196.google.com with SMTP id c3so8472254pfa.13
        for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2019 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rmBxdiW7S2WiXQ4zlUGo+/gbkMEWIhLilBouSwb9Zms=;
        b=HJX07IgzuA3T2hq6Y26IP9Rn+7DO6LW+EcnXufRcqpZX4JAJUmAvVnptuZWkMbvsry
         ESPOby87HWI3S8sEhCDQLCFGNSrCq5QBUcehvat5GmpdHGUyTmtjYoR9RGB85BdPbW9I
         EpeJ7fKEpL8jHSFdoXFCCiagfU4ap+R6B8c/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rmBxdiW7S2WiXQ4zlUGo+/gbkMEWIhLilBouSwb9Zms=;
        b=qEV+NOH8uSRfdCwy5JTFEBd2tYBY77Wwge7yRhpp2+hWOKjBa/zWN8MFJdc3/1+Xgx
         6Ud9j3kFnbnYsH8ZZyqvrlleFZ/523FwWAejA7E4NfvV+VD/HwbxfbUamIt+a0T63/RK
         up+DXx5PONEyEziKyWFuG0eFuZaCJOT7ZszJYlmJZunlsHy9+UeV5X5B11r7m83DFQMg
         SCCjwJGgQgtS8EbByvcsl9kFk0LdYe27cVh8wVWDeXh0DOuAeCI6Ws1Cm7kujVjZMnzD
         f9ok8eQlNQkB0Wx+HRzjX9t+WVpZ0aRtkIfVTr/5+h+gSrQD6BSBly9HYMxERuLwzjOD
         syfg==
X-Gm-Message-State: APjAAAVu30Lg6FxIifxYvaBnoJsvZEDUg7ezTbbxYn4tgj/5j6gRTuDR
        0OBoqO8cBmQ/QGOX/kw6SxqmTA==
X-Google-Smtp-Source: APXvYqxIook3htLQsXXlA83hjcsGEZbtTQ038Kp8tgnmjDpYGMt7dCACN9TE2RD9YTyaG4BJePLbDA==
X-Received: by 2002:a17:90a:8984:: with SMTP id v4mr2166486pjn.133.1564568427244;
        Wed, 31 Jul 2019 03:20:27 -0700 (PDT)
Received: from mannams-OptiPlex-7010.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id 3sm71161776pfg.186.2019.07.31.03.20.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 31 Jul 2019 03:20:26 -0700 (PDT)
From:   Srinath Mannam <srinath.mannam@broadcom.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v2 4/5] dt-bindings: usb-xhci: Add platform specific compatible for Stingray xHCI
Date:   Wed, 31 Jul 2019 15:49:54 +0530
Message-Id: <1564568395-9980-5-git-send-email-srinath.mannam@broadcom.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564568395-9980-1-git-send-email-srinath.mannam@broadcom.com>
References: <1564568395-9980-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add Platform specific compatible, because xHCI of this SoC has an issue
with HS port which has to reset on disconnect event.

Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index 97400e8..ee1f051 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -22,6 +22,7 @@ Required properties:
       device
     - "renesas,rcar-gen3-xhci" for a generic R-Car Gen3 or RZ/G2 compatible
       device
+    - "brcm,sr-xhci" for Stingray SoC
     - "xhci-platform" (deprecated)
 
     When compatible with the generic version, nodes must list the
-- 
2.7.4


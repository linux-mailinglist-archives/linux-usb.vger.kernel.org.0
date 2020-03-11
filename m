Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB21182200
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2020 20:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731181AbgCKTOx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Mar 2020 15:14:53 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39925 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731123AbgCKTOx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Mar 2020 15:14:53 -0400
Received: by mail-wr1-f68.google.com with SMTP id r15so4125402wrx.6
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2020 12:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EP/oH4zqbp3AqvHIFfhBXfjQsrypYgAxPnkJM5h0EXA=;
        b=mnjRTfrFKXrgSmmDyMpTT1knIhywFdH3nQ0K9bHVjWaXedtctrC30bU7oMlBypGKDd
         ZlhBhan0QpqYE3fwCNSNDY/GKvqO5Lf0QLWHb8weEF8AbvBlmNeiZe4kKtYoETk1pluk
         yxcB7k+zBT6xJMCa/RQu5fnBney9MTI5CuexMEcWRZQVXYToPsR0AavAXnRUqGj9EobQ
         WvlN9px2jY8HqjL+pCfvZNYmmIC3iPZSY77m0Hrd6WkB1iQ8ntJsVSbI3KRmuL7ILHbJ
         rMrhDsxa14FrddcjTTEl94uPBH8AOBbdbgjAYMDNxfbvHjaP/7sXYvdAlCr+M+7DHVPm
         VDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EP/oH4zqbp3AqvHIFfhBXfjQsrypYgAxPnkJM5h0EXA=;
        b=QECw9VwcghBCQqKAvCle6kQDXwXPM4PuaHxEM3sild1p8QQz3aLZcqXi1KxFjdunm5
         E3UucRPCN8rTIfnbxLxfJLt15edrqKu7g9lD29zZyyjkOHs8DKvSVaIZq2LojUBjEapN
         njWEA2b7Lp4pWa49I/qA2OVzk6NeGL7vZRzcEdfNGxSskY//EHkIAyg4ccK9/naW36U8
         DhnTcyC5qz9LiW5mLeydlHotusecW5GPNuRxuizj51H6o1ucMNekTa6sDfIK3+jyWSVw
         XW9favf0MGPkFcPQAWNPCS8oHv1mAKV62Zk8fz3aEpElidff+V0249s8sDqXRQFBAcYz
         /pZw==
X-Gm-Message-State: ANhLgQ0HQdROyQ7XdrMGCsP8wmIz8a59Bkb4SrEOFZQXRRYpZdFBYTa8
        BdTd2QZipo+FdNL05Fj9QL5jcw==
X-Google-Smtp-Source: ADFU+vvZZNNbrj9lHkj7uMdtgUqUryM0PZKcnEiE6Yq6HjxAiYc3ION8wz0ZgVmL0Y1Q44j1wxDk8w==
X-Received: by 2002:adf:fad0:: with SMTP id a16mr5756694wrs.119.1583954092042;
        Wed, 11 Mar 2020 12:14:52 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id n24sm32958496wra.61.2020.03.11.12.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:14:51 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 3/7] dt-bindings: usb: dwc3: Add a usb-role-switch to the example
Date:   Wed, 11 Mar 2020 19:14:57 +0000
Message-Id: <20200311191501.8165-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
References: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds usb-role-switch to the example dwc3 given in the file.

Documentation/devicetree/bindings/usb/generic.txt makes this a valid
declaration for dwc3 this patch gives an example of how to use it.

Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 4e1e4afccee6..8c6c7b355356 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -121,6 +121,7 @@ dwc3@4a030000 {
 	interrupts = <0 92 4>
 	usb-phy = <&usb2_phy>, <&usb3,phy>;
 	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
+	usb-role-switch;
 
 	usb_con: connector {
 		compatible = "gpio-usb-b-connector";
-- 
2.25.1


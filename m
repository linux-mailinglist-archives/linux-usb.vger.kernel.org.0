Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C53766D512E
	for <lists+linux-usb@lfdr.de>; Mon,  3 Apr 2023 21:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232761AbjDCTTE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Apr 2023 15:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232793AbjDCTTA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Apr 2023 15:19:00 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D95D2737
        for <linux-usb@vger.kernel.org>; Mon,  3 Apr 2023 12:18:57 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id w9so121557590edc.3
        for <linux-usb@vger.kernel.org>; Mon, 03 Apr 2023 12:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680549535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isNsv3u/WQPEGUOOn7ipyGSt/sVwBsBoCyFZmevpR+Q=;
        b=oSx1/Bg9t4iE/8RYMxxAqE2JSP/6d8fKHXSEznlg0X9Wtd4TQT4nsqJC3BbBXU4PJd
         VAzTteCSNA1+kz0wmDVcOYWVn2/i128zqERw5e48FtoiMEaa07vr916bRe4hpnGejuHS
         KiqsyYQPRyxNJuBkpnIvaotRKaQAn9u6wVvANC+Dl2NV5xVqQ3pOJJvL7jCw9TkAraHj
         QoEp+tO8zMzTSNS9xJ6z2YPmznG8Gu56fL9IOeFDgZPrcAFl62PHyBO25D/ac4PNfINd
         LQdCGuJzRULst8sTuNbd5yhEyjyqTQ77Nl749wZYfYpdVDcbj8HE/VlkdxXPyzBrMAC5
         z5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680549535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isNsv3u/WQPEGUOOn7ipyGSt/sVwBsBoCyFZmevpR+Q=;
        b=YUvyEUaZhtafqM2NHo5a6CH7sfX+C8wMlYhWl5lqD/RnbkOM+ICukXboHOloFCf1PT
         RmadohY/q7mUk12WJjku9BrV8I1pKWkpbA6BJtsOZJIngI9361+FT9vbJ6NZsMpYr7GT
         GXcRQvhMlHpHkUFZ7AG1wES7scWM2mdMp2PjL/2//Vfon0lbb1hSlbbz2hIEbp2NV0eD
         OO6LkjQkD2XQatGOdNIVEekrElvJBZn9u7Os7sO/b5S2azYMoKo5vkstKnABprCdchoJ
         UIGoYLNLcDV+VHNSXMSJrQ4wnZCLnRB5Kf8S2M4irko0/bCZ9KERg9552CJFQgUsATS+
         kYbg==
X-Gm-Message-State: AAQBX9cucYKSWddlkiWyPinb8PqmKZNgRFfA5QZh34d6oVqCR17A1kDC
        Fu70PDs0vaqVMJFo9Gr3qONPEQ==
X-Google-Smtp-Source: AKy350bEFlIs0Zt/epbZLmsUfrkUJFQ+rThFaH41NpSM7LltpP6Ks3vxjZ12jWv067Ir2NFzU9VXSQ==
X-Received: by 2002:a05:6402:2045:b0:501:d532:d84e with SMTP id bc5-20020a056402204500b00501d532d84emr207146edb.39.1680549535263;
        Mon, 03 Apr 2023 12:18:55 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id n19-20020a509353000000b004c09527d62dsm5022999eda.30.2023.04.03.12.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 12:18:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Roger Quadros <rogerq@kernel.org>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] dt-bindings: usb: ti,keystone-dwc3: drop assigned-clocks
Date:   Mon,  3 Apr 2023 21:18:50 +0200
Message-Id: <20230403191850.374839-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403191850.374839-1-krzysztof.kozlowski@linaro.org>
References: <20230403191850.374839-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The meta schema from DT schema already defines assigned-clocks, so there
is no need for device schema to mention it at all.  There are also no
benefits of having it here.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/usb/ti,keystone-dwc3.yaml         | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml b/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml
index c1f0194ad0d5..9252d893f694 100644
--- a/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml
@@ -34,14 +34,6 @@ properties:
     minItems: 1
     maxItems: 2
 
-  assigned-clocks:
-    minItems: 1
-    maxItems: 2
-
-  assigned-clock-parents:
-    minItems: 1
-    maxItems: 2
-
   power-domains:
     maxItems: 1
     description: Should contain a phandle to a PM domain provider node
-- 
2.34.1


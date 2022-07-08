Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3040056B91D
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jul 2022 14:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238238AbiGHL7K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jul 2022 07:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238119AbiGHL7J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Jul 2022 07:59:09 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B849A698
        for <linux-usb@vger.kernel.org>; Fri,  8 Jul 2022 04:59:08 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id z12so20627757wrq.7
        for <linux-usb@vger.kernel.org>; Fri, 08 Jul 2022 04:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SFULxvwf4gE7SfzlwZfy22yCmHIJHMwmNC6ciMHj7fQ=;
        b=x+Vg4eOmUSOXHiXyQu9bHLdybthcYsodbXsycHLUV1nH+AsrHnbAQKpebIRESvSHer
         DSOoyssl1yOiBo9XGVqCPvcZ6B+ASV6BweE5PzLBCwJTWviJ1G7NHr0lxiU+xncmOiQ8
         vlpheRPAP9v5KIXHCgYaPwG2tTwnT2vquN87sERE8rjanvnbsT+Mx5lWfnScz/dN9U4M
         7ZpS8BJwjXuLQpFsO6OLIVZAwfNJ46wpmhbSBul4TCZp+XvwZWFj5PY0FoxqbN2o9ZcA
         3QD3UQtPOE43yGTPymo5+f6CvrsDkGUGQ4xuGpSYGP06BF90SF9jJnCWrQZ0gAKjZxJt
         8NEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SFULxvwf4gE7SfzlwZfy22yCmHIJHMwmNC6ciMHj7fQ=;
        b=o8kYrxqsIjSWeewJQZ/vVO8d4HVccAmpo+XdEJmTuCR0LbavyuqQ28kp1m0LklhbZ1
         k+F2zQHk+zukkwSGLOCL/Y5ATX3zUBnSTVqCQ51X4ItQwY805U1Xn1Pv2AmeOb8ZjEDF
         wY0nVR/7ENwUCJjgs/w9rTgksL2PeE9yxrX2IwRRJG+FbvzCJkouF/po6XlX7ZU9Foc1
         7/UZsp2Yaz41rHh1NMkmJ4osn7GGG6F7uRAPAVMgRYpzqWWLnDNdpZEfBzGpXXjehUhT
         5RQtyR30lQNabfDuKsC8VQcB2TaoZPIIzNzY07rxPXrBhByB0FYK35qf79flSFauwc+Z
         DhVg==
X-Gm-Message-State: AJIora9mjhu8pxArEt/t1uLrM1/OTt40AiUAcsDPd18/+nM5hfpsczXC
        GyYvd1256NWbfTqx0tDbUCPFbeeNGmS0RQ==
X-Google-Smtp-Source: AGRyM1uIEIaV5nOYy88aGpX7PKc8SuHB3IKZA0yflhw9J9lrZUpYrdtTm1EpymKA0HQd8t5cff2JMA==
X-Received: by 2002:a5d:634d:0:b0:21d:6789:3e4d with SMTP id b13-20020a5d634d000000b0021d67893e4dmr3178793wrw.321.1657281546460;
        Fri, 08 Jul 2022 04:59:06 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z5-20020adfe545000000b0021b81855c1csm49436474wrm.27.2022.07.08.04.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 04:59:06 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Cc:     faizel.kb@dicortech.com, baihaowen@meizu.com,
        bryan.odonoghue@linaro.org
Subject: [PATCH 3/3] tools: usb: testusb: Add super-plus speed reporting
Date:   Fri,  8 Jul 2022 12:58:59 +0100
Message-Id: <20220708115859.2095714-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708115859.2095714-1-bryan.odonoghue@linaro.org>
References: <20220708115859.2095714-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the ability to detect and print the USB speed as "super-plus" if/when
the kernel reports that speed.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 tools/usb/testusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/usb/testusb.c b/tools/usb/testusb.c
index d996a3819322e..cbaa1b9fdeacb 100644
--- a/tools/usb/testusb.c
+++ b/tools/usb/testusb.c
@@ -99,6 +99,7 @@ enum usb_device_speed {
 	USB_SPEED_HIGH,				/* usb 2.0 */
 	USB_SPEED_WIRELESS,			/* wireless (usb 2.5) */
 	USB_SPEED_SUPER,			/* usb 3.0 */
+	USB_SPEED_SUPER_PLUS,			/* usb 3.1 */
 };
 
 /*-------------------------------------------------------------------------*/
@@ -112,6 +113,7 @@ static char *speed (enum usb_device_speed s)
 	case USB_SPEED_HIGH:		return "high";
 	case USB_SPEED_WIRELESS:	return "wireless";
 	case USB_SPEED_SUPER:		return "super";
+	case USB_SPEED_SUPER_PLUS:	return "super-plus";
 	default:			return "??";
 	}
 }
-- 
2.36.1


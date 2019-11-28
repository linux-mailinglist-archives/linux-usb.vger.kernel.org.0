Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 054F310C9C3
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2019 14:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbfK1Nn4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Nov 2019 08:43:56 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36288 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfK1Nnx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Nov 2019 08:43:53 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so31159446wru.3
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2019 05:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qWB0GnHdmXhKLKHodka8vOS+SgvA6x8EElzWcdcx5ww=;
        b=F1DEWss5lWPIOHF1keRZXlAR8uX19LLPvRfTbPq0IGYG2LZ5nSNZFGU9oW0IZn/6Bn
         Z4zm5JyDek6NV2gKYHZxSW9rLehMcmfmekenEFg8DDGo2iN5OhWe1aDkhjoCmZx2Ir3o
         uRyeHpHi61ZR2Xdb+jeHSTXjT/eCAS/AYdOPvy2+vKFi8V1jKW0G+GG7U6aZXmUvrPwW
         OLCVvYFrZRlDM9xrAiMvDCv2T2MMlcg6+9Xcfr5hGdOTKXnyolbZyHPV37O9WcSvuMQa
         zYk+gtd4Wk8wTD190V/dklglqsiwPOPw9lAfK9LGqVTfCFI6T1mAJt0/0Lpp/Hkr4QyU
         BMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qWB0GnHdmXhKLKHodka8vOS+SgvA6x8EElzWcdcx5ww=;
        b=LAfcejIlr6CkCBJpYLz1nF/LVxhwm8ctm+yHaM+9NmlEuOX4YhKFWnM0T9+zMeQuKS
         6fsFvYLr4Ip5yMjR52vI4wKPEAuRAMzaVYcxDaxvn5tIPdCCSLnOyjBhS4/yXyTzRJlX
         z3JlCUgQtTZaXEAP18RFCotnayis/5CYu3JMtZxQCPd6XvPQKkaAcZWLJDzfUrZNU6Ct
         s90AuHGwyTb0MZCVRz8zVQU9cHgZSoeb5WGO29TfZj2NgbqdGJqOIIMdgRJULVp4HSfV
         YzeCer0xwQbFpdK0VjLn9YFzgE9l7/ukC24yws5T20MSuF4iJREI/UxAfJlzRkcF1YL8
         8gOw==
X-Gm-Message-State: APjAAAWLlpXCVT0E12cq4ktoru1mnF/cjVLCrNrSG9mfCxYEyn4VlZMz
        geYBmJWg1GGwTsCbhDam/1RHHA==
X-Google-Smtp-Source: APXvYqzBZTvoaBQhXf4XJ+7VH/b38mWo1iX1Z0B6XnUNVcuTjgKirzmpRYM5aHebl+qRmeZIJVJ/tg==
X-Received: by 2002:adf:f147:: with SMTP id y7mr48400538wro.236.1574948629807;
        Thu, 28 Nov 2019 05:43:49 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id u26sm10743407wmj.9.2019.11.28.05.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 05:43:49 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Rob Herring <robh@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: connector: Improve the english of the initial description
Date:   Thu, 28 Nov 2019 13:43:58 +0000
Message-Id: <20191128134358.3880498-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191128134358.3880498-1-bryan.odonoghue@linaro.org>
References: <20191128134358.3880498-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The description lacks a few indefinite articles when reading and as a
result is a bit clunky to read. Introduce a few indefinite articles to
appease the grammar gods.

Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/connector/usb-connector.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
index d357987181ee..88578ac1a8a7 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.txt
+++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
@@ -1,8 +1,8 @@
 USB Connector
 =============
 
-USB connector node represents physical USB connector. It should be
-a child of USB interface controller.
+A USB connector node represents a physical USB connector. It should be
+a child of a USB interface controller.
 
 Required properties:
 - compatible: describes type of the connector, must be one of:
-- 
2.24.0


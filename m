Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F2048CB9C
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 20:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356867AbiALTLx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 14:11:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356644AbiALTLG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 14:11:06 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B9BDC033278
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 11:10:57 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id oa15so7032804pjb.4
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 11:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pKeAIKPGnBe5p4mKBOYRyjPyKIPYZXrfJeUjwODaD04=;
        b=O9xzxnEyN48+XuI6KdJAjnPm1qqgTtzP1kc0YLwuJejoGCDPV/ekTNYZ/Lo7B1X01m
         jIyns4PECcoO+KuOt93ZVQfVzz2TQ38CLaZBa/EAt/RzdMN4/QVe5Qxhapej9ohQ/vod
         cZRi0OKSOXuGRzsc1zuRfbw/f5496CPT7mZZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pKeAIKPGnBe5p4mKBOYRyjPyKIPYZXrfJeUjwODaD04=;
        b=1jZhzkEuLFNZT2Jy3uEEOR+1rvImYL0Ly7oDRZhulEJaZB8JerxsbjDTckB/dS2UKj
         xQJ/8J29JbHNwZ4QUbvszlgYStEKY9U3k8nPkj1/L73myIeZ+z362A2E9Fjc1YEF56cL
         sn7067ipozWgE3hUiqsYfP/YXJ7YM36sBOyKgTnujZMW/8Y4YpBh1GVj3rd72hpIwYeW
         8YtluJ0sXVGOXsNWa2EGiA41+ophYFxV2bWDwI7/bixYMOscZpcSkCk+1E5t+zr0Jpdf
         jOfLhf7NHq04T5fc0dwi30v2wkF6S2/yKsI2zll7TmzJnTdlT/w3a1n1zCTLhsNP+RR3
         kFJg==
X-Gm-Message-State: AOAM532F2gW2cwFJ6UTlfM1ZO9u9tFKsUTUuHzXnX10GAW35vIoAp+1L
        vUNlJO7xXLg8w8Ktn2l6f+tkcw==
X-Google-Smtp-Source: ABdhPJwFVqMt/whp1hvarNmRUEpprD9igUYqty+P+1qtyx4QHrs7Sz6wMecsVhJczPLGXbJP2yPZWg==
X-Received: by 2002:a17:90b:1d0b:: with SMTP id on11mr10638905pjb.114.1642014656908;
        Wed, 12 Jan 2022 11:10:56 -0800 (PST)
Received: from localhost ([2620:15c:202:201:f6eb:5b26:28c:1ca5])
        by smtp.gmail.com with UTF8SMTPSA id z3sm381030pgc.45.2022.01.12.11.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 11:10:56 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Peter Chen <peter.chen@kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        linux-usb@vger.kernel.org, Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v19 2/5] driver core: Export device_is_bound()
Date:   Wed, 12 Jan 2022 11:10:45 -0800
Message-Id: <20220112111028.v19.2.Ie1de382686d61909e17fa8def2b83899256e8f5d@changeid>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220112191048.837236-1-mka@chromium.org>
References: <20220112191048.837236-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Export device_is_bound() to enable its use by drivers that are
built as modules.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v19:
- none

Changes in v18:
- patch added to the series

 drivers/base/dd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 68ea1f949daa..07eefddd4a77 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -370,6 +370,7 @@ bool device_is_bound(struct device *dev)
 {
 	return dev->p && klist_node_attached(&dev->p->knode_driver);
 }
+EXPORT_SYMBOL_GPL(device_is_bound);
 
 static void driver_bound(struct device *dev)
 {
-- 
2.34.1.575.g55b058a8bb-goog


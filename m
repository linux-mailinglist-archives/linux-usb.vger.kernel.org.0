Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 482AE215878
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729227AbgGFNey (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729368AbgGFNeT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:34:19 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C958C061755
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:34:19 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id s10so40900548wrw.12
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mWltuWttrG3KiDQZY2idnG8bvke04NKb60bkJdZCmM8=;
        b=FiUwhiwORfJUq6xcQw08ePbp4jFq9zkCsBOJbY5wttUElOMB2DgHr2Ko3zvst7bvYB
         Ui9P6o+mRZcelsc5C9tXcPKLLoFC/iS6qar8Ip5fBxVFMZRZJVsSsyS5ef/QT9kTop8z
         UGOpptvK9HXjs+3AGo+o6Ivd4xWy7PRMnw7Zkoe+bSm8NQQJFGxdnxnaHaktnGlOtkIN
         yfyBY5qfjjE8G+G03wwUI6G05iBnT19J8s7Ok43KhKvri0eGH7E8GHp4zy+syeBHiNS0
         n72Yictau5/AGSpOoyLakFPr6cSNAGIFJ5miYw5mNg249KRRQV1WtpJcuWU6y6G34G+9
         pVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mWltuWttrG3KiDQZY2idnG8bvke04NKb60bkJdZCmM8=;
        b=pmxkYqv7+4pqkCCH9ediv0pobxMMC050NVCqbW04Zpf9B3R4pQKA4Id4ddMd6/dEPf
         6g4h5/0i3shiHWv17vi1P9nz/ViBnyErLTZ+kM3uvTNx3eRRkgxhDiAvutwWWHy8TpUr
         lQBHTTCf6WBzrOPdqmCnSQYiRCTt/FmpWEguLgkrGCsx4EZPI6Ojw4uj+Ie8lyF/IXKO
         swNksBjjuGUMXlF/gkV+TrhvNBbqoU62P0dW2WjIdeAYwwZf9Xd3KFlHyIc1Pif7keyj
         iB23fH5kgMg8EP+HKEvt6x0S6m32Val2zFENmcKAv8GxIgGUHFGZ4lIv3sf/Ajsv9wPD
         7T+A==
X-Gm-Message-State: AOAM53294MRV6WdcQSxmta3JxIOLkckATe4OOGjG7pDkjkMB9TDcWY7h
        3JIFeQ+oiRU4XDPUaLg+rXLqJA==
X-Google-Smtp-Source: ABdhPJz2SSPMu/jcrYODKBmxh4uV8oCWzAS1ZBr1rHvKRDtTIyhN/9NwzeNIP28/M6BupUGAaPu+pg==
X-Received: by 2002:a05:6000:1290:: with SMTP id f16mr21627350wrx.66.1594042458073;
        Mon, 06 Jul 2020 06:34:18 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:34:17 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Tony Prisk <linux@prisktech.co.nz>,
        Alan Stern <stern@rowland.harvard.edu>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steven Brown <sbrown@cortland.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        de Goede <hdegoede@redhat.com>, Michael Buesch <m@bues.ch>
Subject: [PATCH 28/32] usb: host: ehci-platform: Do not define 'struct acpi_device_id' when !CONFIG_ACPI
Date:   Mon,  6 Jul 2020 14:33:37 +0100
Message-Id: <20200706133341.476881-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since ACPI_PTR() is used to NULLify the value when !CONFIG_ACPI,
struct ehci_acpi_match becomes defined by unused.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/host/ehci-platform.c:478:36: warning: ‘ehci_acpi_match’ defined but not used [-Wunused-const-variable=]
 478 | static const struct acpi_device_id ehci_acpi_match[] = {
 | ^~~~~~~~~~~~~~~

Cc: Tony Prisk <linux@prisktech.co.nz>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Steven Brown <sbrown@cortland.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: de Goede <hdegoede@redhat.com>
Cc: Michael Buesch <m@bues.ch>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/host/ehci-platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index e9a49007cce4a..006c4f6188a52 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -475,11 +475,13 @@ static const struct of_device_id vt8500_ehci_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, vt8500_ehci_ids);
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id ehci_acpi_match[] = {
 	{ "PNP0D20", 0 }, /* EHCI controller without debug */
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ehci_acpi_match);
+#endif
 
 static const struct platform_device_id ehci_platform_table[] = {
 	{ "ehci-platform", 0 },
-- 
2.25.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC7440E55B
	for <lists+linux-usb@lfdr.de>; Thu, 16 Sep 2021 19:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345471AbhIPRK7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Sep 2021 13:10:59 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54314
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347849AbhIPRIc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Sep 2021 13:08:32 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 266CE402A1
        for <linux-usb@vger.kernel.org>; Thu, 16 Sep 2021 17:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631811935;
        bh=xmMlFpxNYUGHhWNpAFsSQHnuFL2wu1djSf/pThsAMRw=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=eGe3R61HaZoCCT1DDDs/DtMbKqJBSYnUCvvdyOCbFV946wSmTgD5HUkNyv45HQmGo
         QAquhlaryayFbXBOQ6TaBnV8wzSdY8/1FZUXjdeVUMuHY2q/Y1RKxcAbgV7gGm6MBy
         4h++o4ptj+ywo0E1urNKqbXUQP0v08VtGFEs3MoUvqcNo1PldOCoEvj802xSzvVBw1
         wUK12BFKUuU1HI0sF1fcYRrdJ6MfvnvBDSdLi9gwlZPuf8j8AIGyjR5IRy/ln2pGUF
         9RvIabORyTFSQ6t0AfPcARYpLcRIBY82oT0yZPMyXkqEB6TTzJXjm6SwTMlWRmGZNC
         WtZwvkN3NbOKA==
Received: by mail-wm1-f72.google.com with SMTP id n30-20020a05600c3b9e00b002fbbaada5d7so2804387wms.7
        for <linux-usb@vger.kernel.org>; Thu, 16 Sep 2021 10:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xmMlFpxNYUGHhWNpAFsSQHnuFL2wu1djSf/pThsAMRw=;
        b=SFQT9fkfXwo1rUILBS8LQnt1HiZAZJwMXUOwhAojVpEEFKpA/muGB5QLkzNB/3zW07
         VhIc+06VC2/roX0V3N/aORhlDDLppaeTTAvDIHFgDT5/asWMWNk7q5Viox/Y25fQZ7h6
         RI8mr5ThQ3v85UsvUv/ItEg2/eqlrLXXYpiUZaLTw1EsCIL2odDUc9zeZBhkAeGnAXBz
         zV+oJd9QDLiSg1ixGYWjOjWFjl1oTxQKdE7hgeFCiwQdLpOhuOxWDLOZ2+QLEEucgCgP
         7jBsvvOJFDlxVhYf+bfkBMqHBN1fI/f9uHMj1jV97Ti+Bic8S3Sts/KQTygrwlh/K4fw
         i/Ww==
X-Gm-Message-State: AOAM531VNQ5mrssiKA7qKbCZwIy2aUkPT9sBERfTLol9soC8XRia0781
        Z+MxCG9z314IKzvBNGK2UDR+VO4gXjJAsAAeIZjM0cl7jttTnJvI6CuojwyjxVH3JhQHV29PYii
        ZP+j34QELNucCWvZiZ7N95aDPBIVsYqB4ag8How==
X-Received: by 2002:adf:e384:: with SMTP id e4mr7278487wrm.163.1631811934457;
        Thu, 16 Sep 2021 10:05:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmMz9cgr5kJ+3gR03Sf0NrO0bEAz5zD+KEznHUHd9k7UtPSJUPKB5wOA6I1DqE0hLK+jXvKg==
X-Received: by 2002:adf:e384:: with SMTP id e4mr7278470wrm.163.1631811934335;
        Thu, 16 Sep 2021 10:05:34 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id u25sm4425269wmm.5.2021.09.16.10.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 10:05:33 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lubomir Rintel <lkundrak@v3.sk>, linux-usb@vger.kernel.org
Subject: [PATCH] usb: host: ehci-mv: drop duplicated MODULE_ALIAS
Date:   Thu, 16 Sep 2021 19:05:31 +0200
Message-Id: <20210916170531.138335-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is one MODULE_ALIAS already.

Fixes: 0440fa3d1b4e ("USB: EHCI: make ehci-mv a separate driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/usb/host/ehci-mv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/host/ehci-mv.c b/drivers/usb/host/ehci-mv.c
index 8fd27249ad25..fa46d217dd10 100644
--- a/drivers/usb/host/ehci-mv.c
+++ b/drivers/usb/host/ehci-mv.c
@@ -258,8 +258,6 @@ static int mv_ehci_remove(struct platform_device *pdev)
 	return 0;
 }
 
-MODULE_ALIAS("mv-ehci");
-
 static const struct platform_device_id ehci_id_table[] = {
 	{"pxa-u2oehci", 0},
 	{"pxa-sph", 0},
-- 
2.30.2


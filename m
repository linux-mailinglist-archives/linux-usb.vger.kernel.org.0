Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A428091DBD
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2019 09:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfHSHYw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 03:24:52 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36121 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfHSHYw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 03:24:52 -0400
Received: by mail-pl1-f196.google.com with SMTP id f19so139123plr.3
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2019 00:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n7dhYlMl//z73eacQGweSKumEFWSfBEWN+KSfFfbHHI=;
        b=VhH0eiPmWx5SbrmRmNTyZ+Byd8qqhGRd/QLUrNsVw6eRyDNWa+PPfBCxG5EhP/0ynJ
         06rckRpaLN+OBrdr17FJqWlf74d3miggbogYkxalARhmPPAnLNiPN8BSwL6xkYEepv7g
         GpNCZ6z+XA2EOtXNefssS04Z6XGDZtd3ttD8uEoHa361laIzlxvH/5QOkCdmFZ+r7jfT
         BiyEvst69I+yNbVOsUjpdckeQuirWzcAn+Jlz6p0dZQbTPEHCDOjedc3JL80sBRApbf4
         o7AfVwMw1MWqnC4w4hoqimp6G+htJPqhk9uPzn0+XEHx7LZW20thLbmV7uWAGsQmjGzt
         KvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n7dhYlMl//z73eacQGweSKumEFWSfBEWN+KSfFfbHHI=;
        b=N1F6dVepAKZuDM1YjHa7oSZP+nb9/zlUEq4KXRpx5slgwh4cxrfMVgaiw09GAJ2Cj+
         WeDBunfox/gPdUl/tVGdCmdjPs+HXjTYLioVRzO6/8ZHMPtP+3ymmeviLiClpauUaoCl
         IY1zyJIdx3XdZIhIsZmn2h/SVsdW3lcXriwQxk4mKqCuFPMEjae28nkK4FCoe8be20cE
         xQVXsceygV9nIgOkvaeEuiht9sZeXUYTf29Sob/MVYEZFSTz7K+CyIuE6l/Op2aJ0+NU
         whEQ6pRn9rFVIq99Js1nv1cXy9ImtvLw6jFDDb9mStQnDs4FuJchF4S/J+32gwGaKnyX
         VkeQ==
X-Gm-Message-State: APjAAAUsYjqow5AtNbZ794H8n9fecV/XT1V0esz6qWrn0zaCNiUo7yG1
        VD91kQAe2G6Mu1XD5PUgDPg=
X-Google-Smtp-Source: APXvYqyoWxQlwcpntJ672OeWe7rLF7xYFp0iacILMOmsGwKthmm0U3ynEBTnbdeuQjHC50gFN+IIrw==
X-Received: by 2002:a17:902:29eb:: with SMTP id h98mr21709529plb.128.1566199491894;
        Mon, 19 Aug 2019 00:24:51 -0700 (PDT)
Received: from localhost.localdomain ([110.225.16.165])
        by smtp.gmail.com with ESMTPSA id u3sm11064496pjn.5.2019.08.19.00.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 00:24:51 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     patrice.chotard@st.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH 2/2] usb: dwc3: st: Add of_dev_put() in probe function
Date:   Mon, 19 Aug 2019 12:54:36 +0530
Message-Id: <20190819072436.31402-2-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190819072436.31402-1-nishkadg.linux@gmail.com>
References: <20190819072436.31402-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In function st_dwc3_probe, variable child_pdev takes the value returned
by of_find_device_by_node, which gets a device pointer but does not put
it. If child_pdev is not put before the probe function returns, it may
cause a reference leak. Hence put child_pdev after its last usage.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/usb/dwc3/dwc3-st.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index 6f52c749cd58..c682420f25ca 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -274,6 +274,7 @@ static int st_dwc3_probe(struct platform_device *pdev)
 
 	dwc3_data->dr_mode = usb_get_dr_mode(&child_pdev->dev);
 	of_node_put(child);
+	of_dev_put(child_pdev);
 
 	/*
 	 * Configure the USB port as device or host according to the static
-- 
2.19.1


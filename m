Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645F1215881
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729321AbgGFNeG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729274AbgGFNeF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:34:05 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7E2C061755
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:34:04 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s10so40899447wrw.12
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GNre9OCmAxyss+/an4xQhs3AGuEV6paz8+9ZDHvC1J4=;
        b=n9EIrN7G3akIgWOBqzyERxZhfzrR9fJGgAr0I5uOS7PMKd2/If2vceE3yjXA1b/eZZ
         qN3X40tIDqUzGlEgMn0NMHgN6bPz+FRCzIjbeU5YntfppHpfycT/2OcjyBD9MbXMHH02
         OAP80qDZ/zvXp0E2Jnb7TOliZnTx2ngHJYqDWJHlo/tMh8+1qQfVZkuz2a58o08kRx4M
         zF3huI5CGRipEwA6l9h/nCGNATepgZn8qDH7q91rmF3uOAt3E5xdsJAmRFnaRysZtFNy
         ShO/sIOYPlLSWlNUwKcP5X+GpzdLohe7Jl5tgxA/WU0feCd8kmHyPcohnDu2G/JQnpLS
         2TVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GNre9OCmAxyss+/an4xQhs3AGuEV6paz8+9ZDHvC1J4=;
        b=A0k2wp6WZgSE4fhTjhbJop/fdETcQKrH2AUDmydcRImYygoKZ24ZvAh4Cxuq4TVG+H
         vL0hRl3WtRQEa1xOzElTfO9m4ULByiLb7iuk0G5S+aIBnX+EH+Z9/mlw9eFqNAHW3gKu
         6eBU2+I11rPd2GzHXjS23CZQWDCgskCzwoH7k/hqaZD2xs/keEtbnukY5UoEat702Xes
         aaj5i6n3ecruwCLgaDXweNUFpPsVag3OzLTGZ7y18X1g3bpLAN3wTuDT2EjhI+ahhjyh
         zPktw51IVEUpTKQbAX595hrk9njLXGak9mwwjXkS8Qp8k5laK9wM+tsZUNirC5b47RsX
         zvYA==
X-Gm-Message-State: AOAM531MkxY6JB3BdBXPhezC2f2sqIewsYR3G3hDGHX1OWKbA+n1yBk7
        t+yWx3kJm3DanxxAT8ijLIw45g==
X-Google-Smtp-Source: ABdhPJx5Dq5C1EhkZdMxsgfApXgr0cOIhDoivpkexRKYjAKcjnC2QN2Yq3ue3sIKyjTLwO40wsMNQg==
X-Received: by 2002:adf:e74e:: with SMTP id c14mr51614270wrn.143.1594042443610;
        Mon, 06 Jul 2020 06:34:03 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:34:03 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Jay Monkman <jtm@lopingdog.com>
Subject: [PATCH 16/32] usb: host: imx21-hcd: Demote function header which is clearly not kerneldoc
Date:   Mon,  6 Jul 2020 14:33:25 +0100
Message-Id: <20200706133341.476881-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document the demoted function here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/host/imx21-hcd.c:233: warning: Function parameter or member 'imx21' not described in 'copy_to_dmem'
 drivers/usb/host/imx21-hcd.c:233: warning: Function parameter or member 'dmem_offset' not described in 'copy_to_dmem'
 drivers/usb/host/imx21-hcd.c:233: warning: Function parameter or member 'src' not described in 'copy_to_dmem'
 drivers/usb/host/imx21-hcd.c:233: warning: Function parameter or member 'count' not described in 'copy_to_dmem'

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Jay Monkman <jtm@lopingdog.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/host/imx21-hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/imx21-hcd.c b/drivers/usb/host/imx21-hcd.c
index 5835f99662046..b2716cb724719 100644
--- a/drivers/usb/host/imx21-hcd.c
+++ b/drivers/usb/host/imx21-hcd.c
@@ -224,7 +224,7 @@ static void setup_etd_dword0(struct imx21 *imx21,
 		((u32) maxpacket << DW0_MAXPKTSIZ));
 }
 
-/**
+/*
  * Copy buffer to data controller data memory.
  * We cannot use memcpy_toio() because the hardware requires 32bit writes
  */
-- 
2.25.1


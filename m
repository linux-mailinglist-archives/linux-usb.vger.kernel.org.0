Return-Path: <linux-usb+bounces-5680-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EB8843772
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 08:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 172941C23EFF
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 07:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC635027C;
	Wed, 31 Jan 2024 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O6IBb2YB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4D1605DC
	for <linux-usb@vger.kernel.org>; Wed, 31 Jan 2024 07:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706685034; cv=none; b=EYpS5wECbNk+gj5s5CsFBkgDec5mFyYcTpDsX+koCs5ascNKYnaAXzYTmI89WooT+oWTZXSio+Glts8CBiwrpZo2U9H4QhYsAtENiDz9pBNVGlnOJeRKbbKMv+9q2hwEkWnMVXw4KwZj547lnZBiOrgT29jx9onCUDCVsnlZa3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706685034; c=relaxed/simple;
	bh=9s6fOH0qLp1ufgO9rf8HAxDGnWALf+j204n54W87KLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kqIgWsCgqRxDLOrdZHB8y63oCpGGULRc4Cuh9Mv48po41nf1nF36rK3BJHhrdV24DaNLx7ZfK40fbHcPrTo0zxzYNbUfaerx8XMpYu2PvxfdQQBthNSYDvgn5GNFv443A3Ta746xm5wul/2jSF3ZWwjkUexRkdnT0+JoClEIDmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O6IBb2YB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40faff092a2so8416935e9.2
        for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 23:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706685031; x=1707289831; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w6SrONxAcUL+4nL4MAcXtd1azhlAyrb6XByXAS01m78=;
        b=O6IBb2YB/PMEmbZy4aNTyIcgIvxY81GNbSWuTY/KCqu429NrsAe9Fd0scpAYXK/gBf
         sLmR02ZcxyQERtCzVZyBn7YjqoTHKGPA/TDR0Hi7uFSmxMinrusGbXnjX4rYbBa4/qqP
         +D3BHk66gr27a8NNkBmphT0hQ9pAB4FsMfmwbfw/jj2qSBbEjBfUAJTVGIUiA0crkoa0
         7PcOtY2fZ+1KwXBoO6YLqYzOSq6ArDxrDfUyMFyyw9STI5UqTH7h28pr5pDKtPCFfAAB
         +SQkmHfk5cuIP0eXyIvVAOnt2nijFX253nytdK9076qAtz1JDgHH4OP3aeqCGejIsTCw
         zK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706685031; x=1707289831;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w6SrONxAcUL+4nL4MAcXtd1azhlAyrb6XByXAS01m78=;
        b=vwV0CyH6m1RrP4cemkCV3NwLWd2QY8sOgS5P0Q0BNO69meNAmCBnm9RSiAHuxsRd7b
         cUk/Ve8qLICnHx9hRztAGhkPMcN8CL55EQIp/dIbuMsGc8bhZXUeQe2HvWkBYpSGqxgl
         2hmv7JpHsDmRl7jjglbtLwszyOj/+w1SgnLxe0854taY2MI0fvqZojXMuQV+6X2M9XTL
         qyh438KtXKlOrn3sF5JmwWYaj8k11mvw9XB1m2R8PlvFdIdOOVk/Hs/qUmeJGWudFvdK
         wdMKJkhBPxC9REBx5eM8fabBz7ZuEYKR6edRkogAT3z2Llo23od7mjtSlsRUx7CNVrYY
         CtZQ==
X-Gm-Message-State: AOJu0Yz+x5ezXdqAR9IXwDioDqsOxyW6ZHmqqi4o7N9iJYeP4cBlE6g+
	oe5Pztqv3xGBIgZNz23aNUHr713M+4WEWXP5SPUIQz1SMN+KurzCaz2Ky8In5bU=
X-Google-Smtp-Source: AGHT+IH9mwzyOcMsdd8Foiqiw+UF7q7BTI9KXpC1XkV4ZEqBl9AZBF5r7k3NzehIqAV1c1eaRQUplw==
X-Received: by 2002:a05:600c:4451:b0:40f:225:c607 with SMTP id v17-20020a05600c445100b0040f0225c607mr585093wmn.14.1706685030837;
        Tue, 30 Jan 2024 23:10:30 -0800 (PST)
Received: from localhost ([102.140.226.10])
        by smtp.gmail.com with ESMTPSA id j27-20020a05600c1c1b00b0040ef622799fsm657432wms.37.2024.01.30.23.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:10:30 -0800 (PST)
Date: Wed, 31 Jan 2024 10:10:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ran Wang <ran.wang_1@nxp.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: dwc3: Fix an IS_ERR() vs NULL check in
 dwc3_power_off_all_roothub_ports()
Message-ID: <71499112-4ed3-489a-9a56-b4a8ab89cd05@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The ioremap() function doesn't return error pointers, it returns NULL on
error.  Update the check.

Fixes: 2d2a3349521d ("usb: dwc3: Add workaround for host mode VBUS glitch when boot")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/dwc3/host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index ae189b7a4f8b..4e6239d3a0ac 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -35,7 +35,7 @@ static void dwc3_power_off_all_roothub_ports(struct dwc3 *dwc)
 	/* xhci regs is not mapped yet, do it temperary here */
 	if (dwc->xhci_resources[0].start) {
 		xhci_regs = ioremap(dwc->xhci_resources[0].start, DWC3_XHCI_REGS_END);
-		if (IS_ERR(xhci_regs)) {
+		if (!xhci_regs) {
 			dev_err(dwc->dev, "Failed to ioremap xhci_regs\n");
 			return;
 		}
-- 
2.43.0



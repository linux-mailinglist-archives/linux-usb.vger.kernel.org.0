Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53DF1368981
	for <lists+linux-usb@lfdr.de>; Fri, 23 Apr 2021 01:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236763AbhDVXwH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 19:52:07 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46226 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231605AbhDVXwH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Apr 2021 19:52:07 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 45622C0551;
        Thu, 22 Apr 2021 23:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619135491; bh=twH/wM31fYRk98oZVMcGYHzMqyasONujrG7fzMqOil4=;
        h=Date:From:Subject:To:Cc:From;
        b=D+9TDDxgCGc5P3J8mFaNwQDHPwYDCDBBRuLOJmuZfjC2QMfthgZNIfxcKLwrqAFYR
         WWmpq/FSwcQROWmz7uiLQTlHWTMtkHOCCC5uLzuoMp0ZNLPd+AxE8vEHLTP6UeRMq8
         ufH/kOgg/uvHJvpRzdSN5Rx4k7e78oqtHNWCXY0XmxQ6lrgcANuUiGyz5VTr6hos/4
         wffdaxjVU6ImSypgT701yhIJUcU8oEGPE5ipAwYF0q7voBrX/VpHj+7CWpmC1VPlq0
         BY5wvu1YN1plx1m/xfjkwByZFAiUs/uF9dYEOZVJqz0UT7xtp7/KVknCCtM8kSrac/
         ShcCIzojMu7xg==
Received: from lab-vbox (unknown [10.205.129.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id B0FE0A006F;
        Thu, 22 Apr 2021 23:51:29 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Thu, 22 Apr 2021 16:51:29 -0700
Date:   Thu, 22 Apr 2021 16:51:29 -0700
Message-Id: <cover.1619134559.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 0/2] usb: dwc3: gadget: Check new capability
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Capture a new capability register for DWC_usb32 and handle
DEV_TXF_FLUSH_BYPASS.



Thinh Nguyen (2):
  usb: dwc3: Capture new capability register GHWPARAMS9
  usb: dwc3: gadget: Handle DEV_TXF_FLUSH_BYPASS capability

 drivers/usb/dwc3/core.c   |  3 +++
 drivers/usb/dwc3/core.h   |  5 +++++
 drivers/usb/dwc3/gadget.c | 10 +++++++++-
 3 files changed, 17 insertions(+), 1 deletion(-)


base-commit: 3343f376d4bae98ec11fd104e0e211b275e754b8
-- 
2.28.0


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60F2813569B
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 11:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730026AbgAIKPm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 05:15:42 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36621 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728899AbgAIKPl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jan 2020 05:15:41 -0500
Received: by mail-wr1-f67.google.com with SMTP id z3so6772093wru.3
        for <linux-usb@vger.kernel.org>; Thu, 09 Jan 2020 02:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cskzhIjwtS0ZVRi8zMZa+kHk4M1kBjG50N69LQL60P8=;
        b=h0ow4VeStV9ER/XHasMs74E0+JCwgBvbicr55G654K+QgM0E3o7aCk/LftohaQ/mam
         K/oPl1DN9ogDVNFnXQbG619dEI3IiXEBVkaAAHXUe7T8aypF4zBkArvDclU6nylS3EZM
         RsYFqnDW/LsLHvnfFU1VGIYFweyPCIYpDVrRkeaGDhB5ogdRzQQHJFTmBSANZKatHOHJ
         l7suu9Wc/eeOJCwarOUn3veAcF3NA986bAtFIgIh/Xi8GhKX1w68ZtCg88Sk7IclgS5v
         FaOPmjwSuVB0QSRe/FpXDssCBKIP/At2DrBAd2pK7bu89NvewLGccxwZioH4NbNJ8yvW
         2kkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cskzhIjwtS0ZVRi8zMZa+kHk4M1kBjG50N69LQL60P8=;
        b=qV+DQ73LVINvCO2zdtxb+6ca5i2EGz96E5+FhzjOd8fE+MTqgG4Y+cRMnwcBW5oVlm
         XYdtYPLCy/jyT4OmEqwcIlknbPgwXGoE1sBHY4ilBnQOjIlkpSjcx8IqbqbwhEDreZUf
         0V/bUmPeOpPnY8fZlzCZoUDBAir+7g4Y/uHQQ/BGsBpD5XEuEUT1IfYBFgrHHLNuA0tF
         zeL7XWmQa7vj7hj29LiY24VnCSz4y09YMoWCHf1KKC5bRR+LhOCrq1TmoxoquUQcBFPG
         T07vCRJFYhw9BQS7ug/9X5dE5LsNmzlih3JenL0Wx6Eo+dnrzMPY+BINhOzIRJt6h+3P
         ptMA==
X-Gm-Message-State: APjAAAU9MhHyPAPNj9aY82N9qiONpU1ChYvE3TCKnBCPgTH8U9KJS3PH
        KeSGcsQvtKY8dZUbFDcKyDSujA==
X-Google-Smtp-Source: APXvYqwBJeqcb+JtzqfcXa3IBx+RAeZpEMUk+jeaEw1/iu/wKVv0xRKabBxEgIHfrQJo/hYAfvxhCQ==
X-Received: by 2002:a05:6000:11c5:: with SMTP id i5mr9833559wrx.102.1578564939054;
        Thu, 09 Jan 2020 02:15:39 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q19sm2250460wmc.12.2020.01.09.02.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 02:15:38 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     balbi@kernel.org, khilman@baylibre.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dongjin Kim <tobetter@gmail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Jun Li <lijun.kernel@gmail.com>, Tim <elatllat@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/3] doc: dt: bindings: usb: dwc3: Update entries for disabling SS instances in park mode
Date:   Thu,  9 Jan 2020 11:15:33 +0100
Message-Id: <20200109101535.26812-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200109101535.26812-1-narmstrong@baylibre.com>
References: <20200109101535.26812-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch updates the documentation with the information related
to the quirks that needs to be added for disabling all SuperSpeed XHCI
instances in park mode.

Cc: Dongjin Kim <tobetter@gmail.com>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>
Cc: Thinh Nguyen <thinhn@synopsys.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Reported-by: Tim <elatllat@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..c977a3ba2f35 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -75,6 +75,8 @@ Optional properties:
 			from P0 to P1/P2/P3 without delay.
  - snps,dis-tx-ipgap-linecheck-quirk: when set, disable u2mac linestate check
 			during HS transmit.
+ - snps,parkmode-disable-ss-quirk: when set, all SuperSpeed bus instances in
+			park mode are disabled.
  - snps,dis_metastability_quirk: when set, disable metastability workaround.
 			CAUTION: use only if you are absolutely sure of it.
  - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
-- 
2.22.0


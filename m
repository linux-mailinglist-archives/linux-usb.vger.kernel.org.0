Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D437155052
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2020 03:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgBGCAO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Feb 2020 21:00:14 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39314 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgBGB7U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Feb 2020 20:59:20 -0500
Received: by mail-wr1-f66.google.com with SMTP id y11so775194wrt.6
        for <linux-usb@vger.kernel.org>; Thu, 06 Feb 2020 17:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sAZggOAZ6xTvR/9Em9hZggbtITo/icBMwG27JPLcFiE=;
        b=EbSmzJ0N47D483I84L2YJYZve9nTs4GuRgnT5sks0JG2onpZA5JSbostYvrQWDCu1r
         3Qn6ElW9q2W73HjpTSkJQ72tpp1gUYx0Di/gt/bfXLI+2pQGOxOyBdjD77sC2kls0gr+
         kIqLq+aMayPqlFvaKasuErnpMtd/Mb114QSrRteFF+T6DesQfJomgJwPAC8rCfJ1VQjv
         v1537oneydlycGQ0Apyxpe1vGHm9gZM9qbuExSiZIdibzqrTuBL36/XjkRqOYbqUB9/t
         Hu7Gy4ltvGEhWxhHY4e78NsXfhC4QSvfcJ5PZDBBE1Id7XBV6SkhkW70KRvfShYmNbmG
         birQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sAZggOAZ6xTvR/9Em9hZggbtITo/icBMwG27JPLcFiE=;
        b=hdgfno2lpVCSELI+zOs/R37PltSxWjhsZlCCWN4nh+kU+GDXK9tTvXU2+QHHchTWd5
         UCRBL/35CwauPgCBdkPH7Ft57iF1Js429evH2IID+YYwjQ1y6ClNl4V/Ib163k4BQ3xg
         lJC1UA/MaIwfbmNKG6ltthH2bNPKAFYGVRL4tIG2WRzEvdqVFqeXNOIFsqPQ/hEb0/qq
         yCoORY33y7vu9paUBmXRiSDeJMY+uXP2PliENZlQwp9X/WnfS+SVMl5Scsiuy0V7Zve7
         pnQT/q5/OiJ+YtyjxULDMUmT2VNu9pAZz4AvYahcLZqitYqrWSkHXSBEFzoENJNGVxSZ
         gXqA==
X-Gm-Message-State: APjAAAUFvNmyyr+6Jfn7HyEawoGugqdBXXKtDCIZjPn+EdHmnQQtSEoS
        94ooVENzsASgT3OWalnyg/5sLA==
X-Google-Smtp-Source: APXvYqyrBOMPKaZoAAnKYUD1is0KDX4nA8X8hHDX6zjGlLSndWgoFUhGbIIHaLx8CIQ4f1Pd4MzNww==
X-Received: by 2002:adf:e5c6:: with SMTP id a6mr1218160wrn.185.1581040757075;
        Thu, 06 Feb 2020 17:59:17 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a62sm1490095wmh.33.2020.02.06.17.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 17:59:16 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v4 08/18] dt-bindings: usb: dwc3: Add a usb-role-switch to the example
Date:   Fri,  7 Feb 2020 01:58:57 +0000
Message-Id: <20200207015907.242991-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
References: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds usb-role-switch to the example dwc3 given in the file.

Documentation/devicetree/bindings/usb/generic.txt makes this a valid
declaration for dwc3 this patch gives an example of how to use it.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 4e1e4afccee6..8c6c7b355356 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -121,6 +121,7 @@ dwc3@4a030000 {
 	interrupts = <0 92 4>
 	usb-phy = <&usb2_phy>, <&usb3,phy>;
 	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
+	usb-role-switch;
 
 	usb_con: connector {
 		compatible = "gpio-usb-b-connector";
-- 
2.25.0


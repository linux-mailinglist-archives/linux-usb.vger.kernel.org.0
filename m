Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE14165749
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 07:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgBTGGW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 01:06:22 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37189 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgBTGGW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Feb 2020 01:06:22 -0500
Received: by mail-pl1-f196.google.com with SMTP id c23so1116543plz.4
        for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2020 22:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=FwVgCncLbVot4SV9ouCUOJjc6U+mADi+9P9iseWgOPI=;
        b=FIncW3q427jUrJc76Y5wnHtilxkDdRipTd9Z0W6sQzjmc+I7zTxLGoIyw5+dU7OBr6
         xrVqqX8ncq4AKJ6CL6Qmo+cGKPU73ueOlos1tpypHNlQ9M/EvpgTzwpB9AaEnQI8ck2v
         ms4ipHKtI5c1iTbQd9nEPS6BnFc4XgsIZlFyZd02dzlB9ONFilIOqF7K7KyGkZohLd8/
         ewQy5rduuyxd99ICYAUd8gFtrG5NWZav4DTMTYEYj5gKuL5jCuiCM2t8XBn8CnbTCSvN
         niBFIKoC72wYfwWxxcYjLuo+3jO1dQPeLMcexsDoxjb9MfY0Cgz96/d2bqLFVL/D9jPv
         W/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FwVgCncLbVot4SV9ouCUOJjc6U+mADi+9P9iseWgOPI=;
        b=MIH875LhBLcDT0ClnPqvKkRTQ3Dgk301fQ6Uaz2+UWLK6ukBVEcyPtdmve9L5n1DQj
         69WkWmQpjbsw/TLFUMiDpkpWR9SM3KTOECnM30Qai9C6dBo+x7x31GOyksJTyNhyIrir
         sbmv+EIds300u0NDW1D+Z9iIfFu4YopePqDs4w+8jnY8mN1DDNsF6pnArAklYgTarbzX
         vUFVDYFq82VO30488aF5ZmDqLHkGhOeKF31cmx0mZGYJolw72Z9VOFWEnBD/oevGabkw
         PnPIc8mpgsP3ngh0SbqNmUfQbC6tBqiLsZObfVsZKNzw5rUVU4rYqwskb5H7PNDaEcQk
         bS/Q==
X-Gm-Message-State: APjAAAXdsDDu3TQrc4AR4/g9c3WnfIucB5DBzTbLFzF8Uqtt7EqUxRCK
        e2RMJr4bvchpdM4HGMdN6mPHiQ==
X-Google-Smtp-Source: APXvYqwnon8ICd/yoj8ge5wkuOIkItWJbqBTJlG7DQJMrVrVL6k/BZq66xnHxJjvkgHYIn2qovfoQA==
X-Received: by 2002:a17:902:d20f:: with SMTP id t15mr30941281ply.55.1582178781449;
        Wed, 19 Feb 2020 22:06:21 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id v5sm1747887pgc.11.2020.02.19.22.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 22:06:20 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Pratham Pratap <prathampratap@codeaurora.org>,
        Felipe Balbi <balbi@kernel.org>, Yang Fei <fei.yang@intel.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Jack Pham <jackp@codeaurora.org>, Todd Kjos <tkjos@google.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        stable <stable@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH v2] usb: dwc3: gadget: Update chain bit correctly when using sg list
Date:   Thu, 20 Feb 2020 06:06:16 +0000
Message-Id: <20200220060616.54389-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Pratham Pratap <prathampratap@codeaurora.org>

If scatter-gather operation is allowed, a large USB request is split
into multiple TRBs. For preparing TRBs for sg list, driver iterates
over the list and creates TRB for each sg and mark the chain bit to
false for the last sg. The current IOMMU driver is clubbing the list
of sgs which shares a page boundary into one and giving it to USB driver.
With this the number of sgs mapped it not equal to the the number of sgs
passed. Because of this USB driver is not marking the chain bit to false
since it couldn't iterate to the last sg. This patch addresses this issue
by marking the chain bit to false if it is the last mapped sg.

At a practical level, this patch resolves USB transfer stalls
seen with adb on dwc3 based db845c, pixel3 and other qcom
hardware after functionfs gadget added scatter-gather support
around v4.20.

Credit also to Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
who implemented a very similar fix to this issue.

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Yang Fei <fei.yang@intel.com>
Cc: Thinh Nguyen <thinhn@synopsys.com>
Cc: Tejas Joglekar <tejas.joglekar@synopsys.com>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Linux USB List <linux-usb@vger.kernel.org>
Cc: stable <stable@vger.kernel.org>
Signed-off-by: Pratham Pratap <prathampratap@codeaurora.org>
[jstultz: Slight tweak to remove sg_is_last() usage, reworked
          commit message, minor comment tweak]
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2:
* Fix typeos and unnecssary parens as suggested by Jack
---
 drivers/usb/dwc3/gadget.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 1b8014ab0b25..721d897fef94 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1071,7 +1071,14 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 		unsigned int rem = length % maxp;
 		unsigned chain = true;
 
-		if (sg_is_last(s))
+		/*
+		 * IOMMU driver is coalescing the list of sgs which shares a
+		 * page boundary into one and giving it to USB driver. With
+		 * this the number of sgs mapped is not equal to the number of
+		 * sgs passed. So mark the chain bit to false if it isthe last
+		 * mapped sg.
+		 */
+		if (i == remaining - 1)
 			chain = false;
 
 		if (rem && usb_endpoint_dir_out(dep->endpoint.desc) && !chain) {
-- 
2.17.1


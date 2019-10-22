Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94E8AE0C42
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2019 21:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732623AbfJVTKR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 15:10:17 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:51074 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729696AbfJVTKR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Oct 2019 15:10:17 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3331BC0DAA;
        Tue, 22 Oct 2019 19:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1571771417; bh=Ot6jUybTLjzITL1McgAzEtE8wQEtYOI7xyxGMxD6Oug=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=kQ7zwpXWEOQL6seNzmoQZx58+Dk9uo7cK3bXBWA0YjHyd913TIa4p4aJHygm+5MTl
         Ut4QMYFRVUkQczQ4ZCo37tz65e35NJrVZJqT3atfE4Pk5R5wWjH+8xU4hv5lDhcx8+
         NpgoSV3g/iTc6k8M+OIyQ6+hdcdYpabVGd0+2MMVWluUGeIbuKFltuyliiosIkcmdK
         da/78jrap8bhzzU9ic4BEx5PLTrbLjrkx0cQgkXH2CXEsb/YqAtV3J22qb/tsDgVpv
         c/DyTKwehktzwHgZ8UU7rkv9eTtU1OCwaGh4X/fckdOghQJS8q5rYzR18aIrT9sVyY
         VfZ8bHEel6nAA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 1CAABA005A;
        Tue, 22 Oct 2019 19:10:16 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 22 Oct 2019 12:10:16 -0700
Date:   Tue, 22 Oct 2019 12:10:16 -0700
Message-Id: <28742e00bedd92bb7052d573eef5f74b66a7970e.1571770732.git.thinhn@synopsys.com>
In-Reply-To: <cover.1571770732.git.thinhn@synopsys.com>
References: <cover.1571770732.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 4/4] usb: dwc3: debug: Remove newline printout
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The newline from the unknown link state tracepoint doesn't follow the
other tracepoints, and it looks unsightly. Let's remove it.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/debug.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
index 9baabed87d61..e56beb9d1e36 100644
--- a/drivers/usb/dwc3/debug.h
+++ b/drivers/usb/dwc3/debug.h
@@ -112,7 +112,7 @@ dwc3_gadget_link_string(enum dwc3_link_state link_state)
 	case DWC3_LINK_STATE_RESUME:
 		return "Resume";
 	default:
-		return "UNKNOWN link state\n";
+		return "UNKNOWN link state";
 	}
 }
 
@@ -141,7 +141,7 @@ dwc3_gadget_hs_link_string(enum dwc3_link_state link_state)
 	case DWC3_LINK_STATE_RESUME:
 		return "Resume";
 	default:
-		return "UNKNOWN link state\n";
+		return "UNKNOWN link state";
 	}
 }
 
-- 
2.11.0


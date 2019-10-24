Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77A3EE2802
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 04:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436810AbfJXCQE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 22:16:04 -0400
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:58630 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2436605AbfJXCQD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 22:16:03 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 41AD9C0239;
        Thu, 24 Oct 2019 02:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1571883363; bh=Ot6jUybTLjzITL1McgAzEtE8wQEtYOI7xyxGMxD6Oug=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=H3FrKHiMGVE8ZRF88hZwOt3UE2UAH8nHsKDhuw1h9NnNTkoeEL6k1rAbzXSxc6CuU
         tRqD9ipf8dULTej9HDNrad8ScMpzzXEMPTe395KdusGj/Pq+kQtvZge2tn8GD8xHaH
         KT6Z0+7e4NVljNWJL/LBB1q1KtwbHipTDtRvpllEk9zm9wli10/GReN1Bf6UeIJD6m
         QxvgQLJQ6nuNwfSZwwqmV03tTYiVB8kHBoFMDdB4gz2EZrRfZ1qES/Me9yPt4Ctf0u
         4fzic6PqUgVtyqgLosB8J/2ZTNqofOL5/UBzbI23NQEDxVhQMYJbBscI4J7TGyTKlU
         Glruct7RwbOTQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 0CC8DA005A;
        Thu, 24 Oct 2019 02:16:01 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 23 Oct 2019 19:16:01 -0700
Date:   Wed, 23 Oct 2019 19:16:01 -0700
Message-Id: <e0476716179b30482124d3c7c75820774e8ca0b1.1571882179.git.thinhn@synopsys.com>
In-Reply-To: <cover.1571882179.git.thinhn@synopsys.com>
References: <cover.1571882179.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 4/4] usb: dwc3: debug: Remove newline printout
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


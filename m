Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 109E3445BF2
	for <lists+linux-usb@lfdr.de>; Thu,  4 Nov 2021 22:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232354AbhKDWCV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Nov 2021 18:02:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:41456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232336AbhKDWCN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Nov 2021 18:02:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCC4E61267;
        Thu,  4 Nov 2021 21:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636063175;
        bh=dpz/Kq034PoEyMdh5IwG1YW0B9x+52MEt1VYusOTdWg=;
        h=From:To:Cc:Subject:Date:From;
        b=MEDhjRMWCrE9x1d4o9ANKrw8fpO/JMTKGQg/mSww83t7weUYScm8pmopyV5a86H47
         uZLwLUhBPpSYA0BiZlBRDh4MhPSD4g/xMoP0D2t2muOYjoOUH0e2SkpaUBtqxJQttM
         LwBW+5mBPWNXfVZTuhgxgKRg1O5N0NC+8l6o5OIWmg8dQNglkpmigiBxYQ5xCqOGxe
         Fk+Th/9GgoATO/VqyQ60oTCRsidnU9vSjm/tE0RA4TQ2W2WNvxCDLp5N2NYcIiyy6u
         juubWGcXBNgklrVHgVyuxPbi3EiOJcVvDQEMLJk+tEzAvIqR1TUnQEZGhVhFTUzfVa
         uJTUVr+GxeMng==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] usb: dwc2: hcd_queue: Fix use of floating point literal
Date:   Thu,  4 Nov 2021 14:59:23 -0700
Message-Id: <20211104215923.719785-1-nathan@kernel.org>
X-Mailer: git-send-email 2.34.0.rc0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A new commit in LLVM causes an error on the use of 'long double' when
'-mno-x87' is used, which the kernel does through an alias,
'-mno-80387' (see the LLVM commit below for more details around why it
does this).

 drivers/usb/dwc2/hcd_queue.c:1744:25: error: expression requires  'long double' type support, but target 'x86_64-unknown-linux-gnu' does not support it
                         delay = ktime_set(0, DWC2_RETRY_WAIT_DELAY);
                                             ^
 drivers/usb/dwc2/hcd_queue.c:62:34: note: expanded from macro 'DWC2_RETRY_WAIT_DELAY'
 #define DWC2_RETRY_WAIT_DELAY (1 * 1E6L)
                                 ^
 1 error generated.

This happens due to the use of a 'long double' literal. The 'E6' part of
'1E6L' causes the literal to be a 'double' then the 'L' suffix promotes
it to 'long double'.

There is no visible reason for a floating point value in this driver, as
the value is only used as a parameter to a function that expects an
integer type.  Use USEC_PER_SEC, which is the same integer value as
'1E6L', to avoid changing functionality but fix the error.

Fixes: 6ed30a7d8ec2 ("usb: dwc2: host: use hrtimer for NAK retries")
Link: https://github.com/ClangBuiltLinux/linux/issues/1497
Link: https://github.com/llvm/llvm-project/commit/a8083d42b1c346e21623a1d36d1f0cadd7801d83
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/usb/dwc2/hcd_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
index 89a788326c56..bdf1927e1be1 100644
--- a/drivers/usb/dwc2/hcd_queue.c
+++ b/drivers/usb/dwc2/hcd_queue.c
@@ -59,7 +59,7 @@
 #define DWC2_UNRESERVE_DELAY (msecs_to_jiffies(5))
 
 /* If we get a NAK, wait this long before retrying */
-#define DWC2_RETRY_WAIT_DELAY (1 * 1E6L)
+#define DWC2_RETRY_WAIT_DELAY (1 * USEC_PER_SEC)
 
 /**
  * dwc2_periodic_channel_available() - Checks that a channel is available for a

base-commit: d4439a1189f93d0ac1eaf0197db8e6b3e197d5c7
-- 
2.34.0.rc0


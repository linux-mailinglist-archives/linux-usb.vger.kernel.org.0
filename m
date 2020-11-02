Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 953A12A29C3
	for <lists+linux-usb@lfdr.de>; Mon,  2 Nov 2020 12:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgKBLqW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Nov 2020 06:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728691AbgKBLqC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Nov 2020 06:46:02 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35132C0401C1
        for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2020 03:45:54 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id p22so9079494wmg.3
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2020 03:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d6wOWByAs5f7rPxO4TjrPC/r2b2juD5yTl6dq0Ru2bA=;
        b=w3v/425to/PN6qqmfV7Xffc9tidXa3aIqhEw/99cZfikh0L1vYo6bZkLAbNLAM4WV/
         6X3p5qEEAidUSJaQq09QNspMewmEXCBK6jydtHzEdJaSBrXiuxA8yLFclLzO7mAYbMLi
         PIpFohCM/NaOn6gAOE0RzCn8V4qifhiHeKubhlDq/IZ4K3IIK6qZ1eWh9DdZor5riHqF
         Jm9vxBUrSISCugSkpBuwXkanE2HaMBQYjTLZMyzQt3F+3RIZLPQeGAwbGGavDUt9RPDr
         crBJDbEeOoPjTrk9FqN0pwve6L+6l3Eg3mjlNy46gwluXGWJ8x59UfpjkYTdCJo3D1QJ
         Ub5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d6wOWByAs5f7rPxO4TjrPC/r2b2juD5yTl6dq0Ru2bA=;
        b=R2PzcAxXrlx7xveHEMEEcje0ElIZ6Yt4jOnRX1cODao+Z/UIEjPiGE8qq1H4rv+qyP
         nVULgGgccThxK2uICHx8CQIZRDBa1v4Ka4g0olWn8DnXalfztUoWqkQDpz/nB2iRVxuU
         eHpAOEJo8PjGFsAhsHu+RVoiNQGjIdiEc643HGuoOl72owGVXGa9GttLZGHU4Q2+TTli
         ts5n1BF+eU1/5Z1hPb5huTg3W9c1cHm14cNygxe+UwCM4XX0YCcuZ0zNv+erAkwgLBXY
         eGCgPF0l4YBmWt3dRYCxLPSOWzKYIe+la81XOA9+Rks6JjlWErMrPMXW+URE5VN/vnGH
         IyMg==
X-Gm-Message-State: AOAM53373sprrfLYt53JFi8di516Kazdu9iwDZL3FcbNruJUCOPwslTh
        1TL2K4tiaApIujaMZ/TS3n3Vag==
X-Google-Smtp-Source: ABdhPJyuV8hFjrgOthwkEdNUG99Fk5kK5NnRsdCIbtsCSyJsAfexvpjRgdIY4aDBFj1B9Ahew0rJiw==
X-Received: by 2002:a1c:4e0e:: with SMTP id g14mr8861120wmh.9.1604317552974;
        Mon, 02 Nov 2020 03:45:52 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id g66sm15545352wmg.37.2020.11.02.03.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 03:45:52 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     davem@davemloft.net
Cc:     Lee Jones <lee.jones@linaro.org>, Jakub Kicinski <kuba@kernel.org>,
        Hayes Wang <hayeswang@realtek.com>,
        nic maintainers <nic_swsd@realtek.com>,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH 27/30] net: usb: r8152: Fix a couple of spelling errors in fw_phy_nc's docs
Date:   Mon,  2 Nov 2020 11:45:09 +0000
Message-Id: <20201102114512.1062724-28-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102114512.1062724-1-lee.jones@linaro.org>
References: <20201102114512.1062724-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/net/usb/r8152.c:992: warning: Function parameter or member 'mode_pre' not described in 'fw_phy_nc'
 drivers/net/usb/r8152.c:992: warning: Function parameter or member 'mode_post' not described in 'fw_phy_nc'

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Hayes Wang <hayeswang@realtek.com>
Cc: nic maintainers <nic_swsd@realtek.com>
Cc: linux-usb@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/net/usb/r8152.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index cebe2dc15c3f0..b9b3d19a2e988 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -963,8 +963,8 @@ struct fw_phy_patch_key {
  * @patch_en_addr: the register of enabling patch mode. Depends on chip.
  * @patch_en_value: patch mode enabled mask. Depends on the firmware.
  * @mode_reg: the regitster of switching the mode.
- * @mod_pre: the mode needing to be set before loading the firmware.
- * @mod_post: the mode to be set when finishing to load the firmware.
+ * @mode_pre: the mode needing to be set before loading the firmware.
+ * @mode_post: the mode to be set when finishing to load the firmware.
  * @reserved: reserved space (unused)
  * @bp_start: the start register of break points. Depends on chip.
  * @bp_num: the break point number which needs to be set for this firmware.
-- 
2.25.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E89B3B914C
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jul 2021 13:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236262AbhGALvW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jul 2021 07:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236156AbhGALvW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jul 2021 07:51:22 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EBC6C061756
        for <linux-usb@vger.kernel.org>; Thu,  1 Jul 2021 04:48:52 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id h4so5820367pgp.5
        for <linux-usb@vger.kernel.org>; Thu, 01 Jul 2021 04:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VJ88TBEkn9DMUr5XtkGsO2dQ2TXYCRQIgpV85RpU7YE=;
        b=SO15mV7G3HfjlbW57e8b1Pmok9WFuGrdbXOsWMnIXoMgw7Wvp6kMUQBM9e8S3vJuHd
         ckvqdfTRbL5zm6EdXK5rO3O9JXNgbC/S2JJ4FWCNxj5oE3uEhvvDVnEXsfMLirF8u/kx
         J2yxv/+ZD2aKMq1XbnxbUnJvUxkCA8CnrmeZIvojcWbjo30yllYcltlCU9QBKM5DhdxY
         YXvJ1RegNmTIR6IdDBLCy9UUbFXNJbDIRgVE8EXKPdsZYdPgxo48LTdJMSfRWkS1gJAj
         6qh5kHIiyHiqf5wS6FP7YCNV0lCWgmuwxGyxne/tfYMMWNx7NMHiEKL0n9tvVZcWf6YW
         ZlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VJ88TBEkn9DMUr5XtkGsO2dQ2TXYCRQIgpV85RpU7YE=;
        b=Vb/AKWb7u346QpHMNQrne7Znx8Xy2CeraHpHCdWLP4AIyoXdfy3cvTcc6uNlWzBmH/
         i2iPXvRzCgwKxSqJnZiaMFwuBs2Yzkl2vIi5lF33gaxE6I0q0lzDcRRK8wJUkt6iLwsV
         9fWAPzXKSlC31jQaHSUcOhfrivuJ/nC6vLAFCHqEXeeOiJmsDCjej3C37KSiDQD+qDHU
         CnHqlU8xC0De4N0sMe4EvCSbhv0RzlZ6NvC0hK9Qdm4C+8v2HG9d5gAhYxJ/E0phx21V
         LmqIKM02+KrC3XzXBEMZwJ3nlc50ZXXhCAXI4nnoNCuXuyJHQ6OsJGnwRfOZ/Bi5F6Ov
         2+3g==
X-Gm-Message-State: AOAM5317ncZEuAEkap4EgmvID4s2s7qxNCXk4n5cg0FqFEkByrWJRUzF
        ZkLMLeuC8zrvtSMG7jqYSiM=
X-Google-Smtp-Source: ABdhPJwEZ4q4k6Qy+fXaPug6E9AW7PdWT11XpLDquKdcH43+5YV3wtwqV0khQIVc0C8moCrDeD23KQ==
X-Received: by 2002:a65:57cc:: with SMTP id q12mr39128085pgr.155.1625140131676;
        Thu, 01 Jul 2021 04:48:51 -0700 (PDT)
Received: from athina.mtv.corp.google.com ([2620:15c:211:200:6c1:7d8f:dfdc:fc1e])
        by smtp.gmail.com with ESMTPSA id w2sm24600601pjq.5.2021.07.01.04.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 04:48:51 -0700 (PDT)
From:   =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <zenczykowski@gmail.com>
To:     =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Brooke Basile <brookebasile@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lorenzo Colitti <lorenzo@google.com>
Subject: [PATCH 3/6] usb: gadget: f_ncm: remove check for NULL skb_tx_data in timer function
Date:   Thu,  1 Jul 2021 04:48:31 -0700
Message-Id: <20210701114834.884597-3-zenczykowski@gmail.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210701114834.884597-1-zenczykowski@gmail.com>
References: <20210701114834.884597-1-zenczykowski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Maciej Żenczykowski <maze@google.com>

This condition is already checked for in ncm_wrap_ntb(),
except that that check is done with eth_dev->lock held
(it is grabbed by eth_start_xmit).

It's best to not be reaching into ncm struct without locks held.

Cc: Brooke Basile <brookebasile@gmail.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lorenzo Colitti <lorenzo@google.com>
Signed-off-by: Maciej Żenczykowski <maze@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index e45a938424a4..77f55b3c805a 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1156,8 +1156,7 @@ static enum hrtimer_restart ncm_tx_timeout(struct hrtimer *data)
 	struct f_ncm *ncm = container_of(data, struct f_ncm, task_timer);
 	struct net_device *netdev = READ_ONCE(ncm->netdev);
 
-	/* Only send if data is available. */
-	if (netdev && ncm->skb_tx_data) {
+	if (netdev) {
 		/* XXX This allowance of a NULL skb argument to ndo_start_xmit
 		 * XXX is not sane.  The gadget layer should be redesigned so
 		 * XXX that the dev->wrap() invocations to build SKBs is transparent
-- 
2.32.0.93.g670b81a890-goog


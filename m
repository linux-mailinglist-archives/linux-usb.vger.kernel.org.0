Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 696671DC422
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2020 02:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgEUAos (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 20:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbgEUAor (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 20:44:47 -0400
Received: from mail-pl1-x662.google.com (mail-pl1-x662.google.com [IPv6:2607:f8b0:4864:20::662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D350C061A0F
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 17:44:46 -0700 (PDT)
Received: by mail-pl1-x662.google.com with SMTP id t7so2097414plr.0
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 17:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=footclan-ninja.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nTqT9e/lYi7CWqmsfUDfNOjOqBcrcy3sSng5fzPf7og=;
        b=P1whmoGt+oOre6zBU+YSnyAKHCd0/8AbIXgtLghFjWvLv3zaGtDLsRQPgY3zdlRzO+
         BPeeN/hgsR5aOzODohjtZViJGZT/Y6UefyHS7R3+eSjXYPnsMOxuaSIVIRAEiNV8664d
         QL/negXKQIIOK/Crr+zBj7pvYEfqZJf2j25gOgDU1uPLM1nE+7wM8hX/eutKzON/KTwo
         +45JknhlsQc6OMIRJE9TaH5pSYHbpFvUCoE2EpOezpeAxnDdLjE3XNOQL87lGZeFsKlD
         9NglwR6VlTqOmWReuFLI/q2TCyxNTjHx4Rx1vf11xcKee38DjyO8YycRAFCL8HNYDvhK
         PPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nTqT9e/lYi7CWqmsfUDfNOjOqBcrcy3sSng5fzPf7og=;
        b=Ztq6hmcQeOzSE0lzg12qjpXCB1NNjIsCkpUsyjuiFl76tn6hDwm8DNwEflvBXeBzNt
         56cfuEAK4OpCkzgtw5FwEmnghadjaTkHAGsb8d6/lXlPBoSDYpSF/prfwb5ehFxrx5Kr
         1VYE2xubpWvvCTWXNTEGfFlI7g+6kb5YxLRSzFLbn6ga3SsoPGoTSaBeZL9sZplrnfXq
         gtTxHyIE9s4OxLmFcsVa+OzFkEFjsJvBwKG6yZJjnzPD7xrbrWMQr44/BEJGPgXqhZEv
         ZAqn+IhetLyEnd6pKZr9uXh2XPqVYZdcZ/75Y5JhBJam1tEka3nEQfAgZX+UX6a+UWst
         0nUw==
X-Gm-Message-State: AOAM533C8jr+Oe3Ge/HFLCxNa1ETT7J9axADmqcW5maRbQ/1kYUJXSdD
        tDbtsEndk9ZEeR5CtsLZPjzB2fbKsyeMOrktfBk4ilwHtjEDSw==
X-Google-Smtp-Source: ABdhPJwmDrTz4WLsPaduVP88NHbuVaBuRTRSIwmcrxmyBZLbGRhiOGMiSgP73qSPhWC/SJvuNEU8FQZPCflr
X-Received: by 2002:a17:90a:a102:: with SMTP id s2mr8173088pjp.94.1590021885339;
        Wed, 20 May 2020 17:44:45 -0700 (PDT)
Received: from localhost.localdomain (pa49-180-69-106.pa.nsw.optusnet.com.au. [49.180.69.106])
        by smtp-relay.gmail.com with ESMTPS id v1sm454634pju.8.2020.05.20.17.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 17:44:45 -0700 (PDT)
X-Relaying-Domain: footclan.ninja
From:   Matt Jolly <Kangie@footclan.ninja>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Matt Jolly <Kangie@footclan.ninja>
Subject: [PATCH v2] USB: serial: qcserial: Add DW5816e QDL support
Date:   Thu, 21 May 2020 10:43:58 +1000
Message-Id: <20200521004358.8949-1-Kangie@footclan.ninja>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for Dell Wireless 5816e Download Mode (AKA boot & hold mode /
QDL download mode) to drivers/usb/serial/qcserial.c

This is required to update device firmware.

Signed-off-by: Matt Jolly <Kangie@footclan.ninja>
---
v2 changes: typo.
---
drivers/usb/serial/qcserial.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
index ce0401d3137f..d147feae83e6 100644
--- a/drivers/usb/serial/qcserial.c
+++ b/drivers/usb/serial/qcserial.c
@@ -173,6 +173,7 @@ static const struct usb_device_id id_table[] = {
 	{DEVICE_SWI(0x413c, 0x81b3)},	/* Dell Wireless 5809e Gobi(TM) 4G LTE Mobile Broadband Card (rev3) */
 	{DEVICE_SWI(0x413c, 0x81b5)},	/* Dell Wireless 5811e QDL */
 	{DEVICE_SWI(0x413c, 0x81b6)},	/* Dell Wireless 5811e QDL */
+	{DEVICE_SWI(0x413c, 0x81cb)},	/* Dell Wireless 5816e QDL */
 	{DEVICE_SWI(0x413c, 0x81cc)},	/* Dell Wireless 5816e */
 	{DEVICE_SWI(0x413c, 0x81cf)},   /* Dell Wireless 5819 */
 	{DEVICE_SWI(0x413c, 0x81d0)},   /* Dell Wireless 5819 */
-- 
2.26.2


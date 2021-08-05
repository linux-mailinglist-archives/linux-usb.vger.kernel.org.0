Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71E03E0C7F
	for <lists+linux-usb@lfdr.de>; Thu,  5 Aug 2021 04:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234671AbhHECkZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Aug 2021 22:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbhHECkY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Aug 2021 22:40:24 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33B2C061765
        for <linux-usb@vger.kernel.org>; Wed,  4 Aug 2021 19:40:10 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id x7so5008572ljn.10
        for <linux-usb@vger.kernel.org>; Wed, 04 Aug 2021 19:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=0Di8MmeY5bZD/i3NrV7FMNDOs0ueEFaHT5pAtMPMl6s=;
        b=ITIouIkJu/8XRaz8XySvL53qfpmHYm5yaMdfpa3GbO3itHGTYn6umlanq/nnj6pg8A
         SYU4vbd4qmB10+1jDC2WoEXToXo63T3fX4ZJVc/2hNescOZ64XlFJcRgiDi24Y98vK3T
         i1JMS4zgkztSkYfv18NWUU7hgaNAQAwjLFfVEJtYEKIut2Rlv/wwsBEbiQqmYxQczc+W
         1egPJjY8614/+B0fBgrC+GSc7GInEnZc2wCTHAYG4wtX08h3ZEFA/qgGEVJW/dkcT654
         ZGZCG+STaAYNT6NPMr10Dn+J5TeApTc/jl0q7cJz8yxKjOYnmUGT7MJJwzcEHiXAq+Aa
         dkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=0Di8MmeY5bZD/i3NrV7FMNDOs0ueEFaHT5pAtMPMl6s=;
        b=p38p+Xvl1ceFbIzhHWGCw5VUn3dLKxhNmVeNhRAYpI5qA655q2B76aHxC2756Mr6/t
         Qya3L3xrH2pLHS9S1OL7HQIelgYAnryK/x16AYGEKfZWwXQNWlOQF51URn35CW/NqOqO
         s56LjXg0MEzsI3kB9vO9ubG1F9+BGbyX94mbRuDFhOHp2UoP0BdNqklLVSLJywbawAWg
         zoC/6FtoLPBxZgOAQPHZ62+6RhB+6SKpgZ3nGZMN5rMhFErenwLoAOWrIN6g42kqBXZs
         80R80AGaRxEQpTHIRfKVXIuI9cPyUCxlgLmIDxutLWGOaaNhwWIRvFqV2EuRlZM5JXvS
         5X3w==
X-Gm-Message-State: AOAM530KkpiBUHqFs6XvZJnht3LeDFtFbDiDkYc25clyppMkJ07qEpRp
        /uOaMnXu39ecNd01yiyKP04u7jxkW22cAw==
X-Google-Smtp-Source: ABdhPJxcU6KFsCyaQZDRnJny0s6XirVDi7ilfX610xqgn2OifPrKJlcb8icZEJBufvxa96UegOKfKg==
X-Received: by 2002:a2e:a54d:: with SMTP id e13mr1605474ljn.1.1628131208905;
        Wed, 04 Aug 2021 19:40:08 -0700 (PDT)
Received: from reki (broadband-95-84-198-152.ip.moscow.rt.ru. [95.84.198.152])
        by smtp.gmail.com with ESMTPSA id o11sm288614ljg.29.2021.08.04.19.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 19:40:08 -0700 (PDT)
Date:   Thu, 5 Aug 2021 05:40:06 +0300
From:   Maxim Devaev <mdevaev@gmail.com>
To:     linux-usb@vger.kernel.org, hminas@synopsys.com,
        gregkh@linuxfoundation.org
Subject: dwc2: remote wakeup implementation
Message-ID: <20210805054006.665e475e@reki>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello.

The dwc3 driver in gadget mode has the ability to send
a remote wakeup signal to the host by writing 1 to the srp file:

echo 1 > /sys/class/udc/XXX/srp

I am trying to implement the same feature for dwc2, but I ran
into a problem. My naive and clumsy implementation is able
to wake up the host, but after that dwc2 stops processing
any interrupts and the gadget stops working.

At the same time, if I send the host to suspend, and then
it is awakened independently (for example, using the hardware
keyboard), then I see that dwc2 handles interrupts
and starts working again. I used the protocol analyzer
and made sure that the gadget with dwc2 is really correctly
suspended and wakes up.

I suppose remote wakeup signaling causes the controller
to switch to some incomprehensible (for me) state, and I need
to do something so that everything works again and dwc2
can receive a wake-up event from the host after signaling.

I don't have any DesignWare documentation, so I hope someone
can help me. Thanks.

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index c581ee41a..14dfb678a 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4660,6 +4660,21 @@ static int dwc2_hsotg_vbus_draw(struct usb_gadget *gadget, unsigned int mA)
 	return usb_phy_set_power(hsotg->uphy, mA);
 }
 
+static int dwc2_hsotg_wakeup(struct usb_gadget *gadget)
+{
+	struct dwc2_hsotg *hsotg = to_hsotg(gadget);
+	unsigned long flags;
+
+	spin_lock_irqsave(&hsotg->lock, flags);
+
+	dwc2_set_bit(hsotg, DCTL, DCTL_RMTWKUPSIG);
+	mdelay(10);
+	dwc2_clear_bit(hsotg, DCTL, DCTL_RMTWKUPSIG);
+
+	spin_unlock_irqrestore(&hsotg->lock, flags);
+	return 0;
+}
+
 static const struct usb_gadget_ops dwc2_hsotg_gadget_ops = {
 	.get_frame	= dwc2_hsotg_gadget_getframe,
 	.set_selfpowered	= dwc2_hsotg_set_selfpowered,
@@ -4668,6 +4683,7 @@ static const struct usb_gadget_ops dwc2_hsotg_gadget_ops = {
 	.pullup                 = dwc2_hsotg_pullup,
 	.vbus_session		= dwc2_hsotg_vbus_session,
 	.vbus_draw		= dwc2_hsotg_vbus_draw,
+	.wakeup			= dwc2_hsotg_wakeup,
 };
 
 /**

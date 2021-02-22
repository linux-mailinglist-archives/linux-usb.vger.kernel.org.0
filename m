Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC254321576
	for <lists+linux-usb@lfdr.de>; Mon, 22 Feb 2021 12:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbhBVLxX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Feb 2021 06:53:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbhBVLxJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Feb 2021 06:53:09 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F62C06178B
        for <linux-usb@vger.kernel.org>; Mon, 22 Feb 2021 03:52:29 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id u1so16331579ybu.14
        for <linux-usb@vger.kernel.org>; Mon, 22 Feb 2021 03:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=hkg7l7k09gSiXsklT0wb4ODJUDwROgdzJX4zhRCopXs=;
        b=nC+u7LeskQ5PqB96K0OZyaNc5ayCBRcJoQcjFlQGLUBQN68ZJ+WtC1kx4BONX0iQ0R
         ji7fGuiW2STK+GA8Bw93wQ+9HOmy+PU+Teo1jHk31GAYhYGXV8Ul+aDZF34A4Cxc+VND
         yN0VnmLXH15c3fcfSsgr92GMOuDnzVhhyX5HpCQpCPpEJqAlYIdt8/lNNd0hstbDMoaz
         J4x5ZxHco6+X+yirJB9XDwK5+4Ie1bjIRTdrJYarEirRxhmTGsi+ggnMqbmtoG+EdG2/
         wmfbKlutlC77dWk3XkkR6g0sd6ROp8GxHnk8SvUbTBRV/RODgXh9bJPQK3FnoO2i+rdR
         HgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=hkg7l7k09gSiXsklT0wb4ODJUDwROgdzJX4zhRCopXs=;
        b=KmAlZQyvfqBfbL47FFPdq/ydEnLcdoS1bl/VwQHW57SqYZllGRzLPlVHoqVFKjLSXv
         OYD8/rkqZuNNw+1zV7yn+Nl0NCahaWbsiuvNZW+5oOWlvbzWPu0aOwPGXxeBb2Cu9cIL
         OmNT/AQdbUkaNMnuBHIbnnDRpCdZd2RYPDXX6YAWKyvdmDaGe9A/2I2GOFSskzgA0MW+
         itJvgkXKHW9G6wNYb+uBK+EyP++mfpAehp6K3tEjsbvoDZFXzEScKNgSxYJkfTj2utnz
         YyLyuJuDXEIOYAyX4uRWKgdszFrIF4/aJRAgOsymu1KyI/vs6y/AxvNLZ1AITGT2uQVN
         Ag8Q==
X-Gm-Message-State: AOAM532KGkdxI6CbG8Uk/71ixslEs4iaol3blPjt9uhnolG+spu7oqym
        QlaIcjL9Kd2igqSibyD4Q9rJLFqH2Uc=
X-Google-Smtp-Source: ABdhPJwClJrjWHmfghcvmp5t/JdruNppK7yh4zkWeNZm8ur+iROqDeX8KnFGgrNGmFFqE/GYTbCRvtFja3s=
Sender: "raychi via sendgmr" <raychi@raychi.tao.corp.google.com>
X-Received: from raychi.tao.corp.google.com ([2401:fa00:fc:202:9c8c:8669:7daa:43ff])
 (user=raychi job=sendgmr) by 2002:a25:9902:: with SMTP id z2mr30927267ybn.339.1613994748863;
 Mon, 22 Feb 2021 03:52:28 -0800 (PST)
Date:   Mon, 22 Feb 2021 19:51:49 +0800
In-Reply-To: <20210222115149.3606776-1-raychi@google.com>
Message-Id: <20210222115149.3606776-3-raychi@google.com>
Mime-Version: 1.0
References: <20210222115149.3606776-1-raychi@google.com>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH 2/2] usb: dwc3: add an alternate path in vbus_draw callback
From:   Ray Chi <raychi@google.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kyletso@google.com, badhri@google.com, Ray Chi <raychi@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds an alternate path in vbus_draw callback through
power supply property POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT.

Signed-off-by: Ray Chi <raychi@google.com>
---
 drivers/usb/dwc3/gadget.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index aebcf8ec0716..47809835e163 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2530,11 +2530,19 @@ static void dwc3_gadget_set_ssp_rate(struct usb_gadget *g,
 static int dwc3_gadget_vbus_draw(struct usb_gadget *g, unsigned int mA)
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
+	union power_supply_propval	val = {0};
+	int				ret;
 
 	if (dwc->usb2_phy)
 		return usb_phy_set_power(dwc->usb2_phy, mA);
 
-	return 0;
+	if (!dwc->usb_psy)
+		return -EOPNOTSUPP;
+
+	val.intval = mA;
+	ret = power_supply_set_property(dwc->usb_psy, POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT, &val);
+
+	return ret;
 }
 
 static const struct usb_gadget_ops dwc3_gadget_ops = {
-- 
2.30.0.617.g56c4b15f3c-goog


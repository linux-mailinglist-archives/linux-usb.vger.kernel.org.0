Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 967EA213ECC
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbgGCRmx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726989AbgGCRmv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:51 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82AF6C08C5DD
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:51 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o8so32746262wmh.4
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vJCnefTtfM/FBJNDBw7Za4SdXSiMtlhk/VCZxXdb06o=;
        b=uY+ZNl+vJh/8ZKEUOcnoazw3UlFZGm64iZn/WQXAwEShl1+iT+iTmIwEf/Jx8IskjI
         qBGw7nEY6dEUOrexC4u1LRiL9SdnCegSf0mmgfxfcOWxwdeLf3ed6L/OqNpxGK26weBn
         P6pJRNCWqcN47c2iFGRdlwjvm8DQ+zhYqMhC9+oOVs11vB18NiKjt4ivDufF1t9LyG6c
         2Vqb/BytWBtmCSbCzXvhZ7vvo8HHeT2aQdv9LAr4huXaOY+bdb3hBCPNb6vxYp2qU/FE
         /eiep166NE/4yENCBpA6DvdVcZ9Sjm38FZTnd9C08GGzcfk6owQqxVxS4TUlvGJ3iMH6
         yhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vJCnefTtfM/FBJNDBw7Za4SdXSiMtlhk/VCZxXdb06o=;
        b=MOt0AnIxcV2oXHYTe75Jc4hG0OKzu+vw7r1vz9vXNyWBQRadYU6bTvUHo7rZhvHN1c
         //SdV2A9rGcnDmSTQW3vJr8N3zQfgTBuPDcMWwg32rrdKRpaEYxZswUG2YbZDZd/GDPN
         JyVISNIbWMb372NVpDSWJJrdg8jr+XuJ0c2vMxcqXYTL8wvmKjaL5fR1PFzULW5oxhlF
         rZJHYt87Ijc5/T6vS0vzu+SEz1uqUL2lBM20pK2osC4NhtMvAfHzqZk17bIv7KPFaMLy
         FWWk2hs+jkJzMKjFoCUGjY26XXJ0KcyJEuTWE6RcgFsjR1Cn2FXkJTV8RQ0TUcm30aIJ
         CRRQ==
X-Gm-Message-State: AOAM530s4Lvc1TmKYI174vGJMuqn+YSz/5FOpNSnprUJqbMXEzHr8LgB
        V5LXfgN3xwoD3Ktt27/CTCI4XQ==
X-Google-Smtp-Source: ABdhPJysKzxS4hjJTRoccGdJEFKt9Uhy6x3GEl2dYE9hZrX5YGXPDhlo2QS2O0WssrmUH0r3f2lOtw==
X-Received: by 2002:a1c:398b:: with SMTP id g133mr36497818wma.76.1593798170305;
        Fri, 03 Jul 2020 10:42:50 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:49 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Yueyao Zhu <yueyao.zhu@gmail.com>
Subject: [PATCH 22/30] usb: typec: tcpm: fusb302: Use 'gnu_printf' format notation
Date:   Fri,  3 Jul 2020 18:41:40 +0100
Message-Id: <20200703174148.2749969-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/typec/tcpm/fusb302.c: In function ‘fusb302_log’:
 drivers/usb/typec/tcpm/fusb302.c:186:2: warning: function ‘fusb302_log’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
 186 | _fusb302_log(chip, fmt, args);
 | ^~~~~~~~~~~~

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Yueyao Zhu <yueyao.zhu@gmail.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/typec/tcpm/fusb302.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index b28facece43c4..99562cc65ca69 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -178,6 +178,7 @@ static void _fusb302_log(struct fusb302_chip *chip, const char *fmt,
 	mutex_unlock(&chip->logbuffer_lock);
 }
 
+__printf(2, 3)
 static void fusb302_log(struct fusb302_chip *chip, const char *fmt, ...)
 {
 	va_list args;
-- 
2.25.1


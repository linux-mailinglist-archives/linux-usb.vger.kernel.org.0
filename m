Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A6039185A
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235024AbhEZNCp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234920AbhEZNCe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:34 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A40D2C06134B
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:01 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id g17so816296wrs.13
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=17TLDNLMNiym6ubj/VtPGlj55f+c+ePvdls2dO6JkRY=;
        b=TGLHVGFi1H//LWKDiIWU146HBPcQTOaAlInzDkKMtYnxgyDireXkUStdB+szDl42Nm
         Porl3MeG7WOKPLmG7w4PtGsySMaNyeI8PRpCTpJaXkJfm9sQd1Yphs1eQNt0RIJKxE64
         TehxMX048t5Tbbg6swQXkW622n49KAoGudtoI6PPWSrmpwD5ae7RhXDfpiDbJviw65n6
         0RQPNbmvNqaT43Z9csy2y2TZdia1ktJilRXpO0wwhux6DArbAF1jQvCVUl6Rzqptiyk7
         vi/2ZC+n1OhFh0HF20lUsB8Mm43rZW/IgOyRJIH8BTF/89W+v2LCr44j2BXHYtVsHUKq
         GakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=17TLDNLMNiym6ubj/VtPGlj55f+c+ePvdls2dO6JkRY=;
        b=dioHwbzgKnKAyLNn/SilHLG/toRMnldMIWJ6B0WlGePfF3GfUch8b8wOe2FmNYxpfF
         gFIMOi/3XsIX5I5aLUsYfGzDn6sOzqf28gZtKHqSi7NCSmN19RwJrhG760rLk5ZsQF1S
         USUXC/opfbE/pYewQnlsaD1LlBnXQzaofgX/+eq71KpZ7VozTkX3xZBiuaPC27Z5eqQs
         nY4xF3bnbKwa1yijfNLvmB1s7kq5fjJ9iRQ5YYlo38X2TeUAbi7BTLit2skW6S0puiW0
         k+tyOvXwA7RsRv/D5HKzdTIEUy1WemYUpTTiX5mi6gzMQjJNkseW4Eb2yTexrOkLyRmS
         RI/w==
X-Gm-Message-State: AOAM533XL27Y0pUH+1qzDR2+tbLzePk3lD7DUMkWOBaW8RebcW8zqt5p
        L5PeqC/ge86Ym+oZdi5S4XK13Q==
X-Google-Smtp-Source: ABdhPJwSSW8n5Kv0hUGw8YkNXsldQQWfDpWds2vhGVUH6/jTlHvbZYEBWsEz54xZOZQcMRaIwRWhIw==
X-Received: by 2002:a5d:4246:: with SMTP id s6mr29163575wrr.9.1622034060267;
        Wed, 26 May 2021 06:01:00 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:00:59 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        David Lopo <dlopo@chipidea.mips.com>, linux-usb@vger.kernel.org
Subject: [PATCH 13/24] usb: chipidea: core: Fix incorrectly documented function 'ci_usb_phy_exit()'
Date:   Wed, 26 May 2021 14:00:26 +0100
Message-Id: <20210526130037.856068-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/chipidea/core.c:343: warning: expecting prototype for _ci_usb_phy_exit(). Prototype was for ci_usb_phy_exit() instead

Cc: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: David Lopo <dlopo@chipidea.mips.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/chipidea/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 3f6c21406dbd2..2b18f5088ae4a 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -335,7 +335,7 @@ static int _ci_usb_phy_init(struct ci_hdrc *ci)
 }
 
 /**
- * _ci_usb_phy_exit: deinitialize phy taking in account both phy and usb_phy
+ * ci_usb_phy_exit: deinitialize phy taking in account both phy and usb_phy
  * interfaces
  * @ci: the controller
  */
-- 
2.31.1


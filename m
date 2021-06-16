Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDC43AA4B4
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jun 2021 21:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233054AbhFPTzR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Jun 2021 15:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbhFPTzN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Jun 2021 15:55:13 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13749C061767
        for <linux-usb@vger.kernel.org>; Wed, 16 Jun 2021 12:53:07 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id m13-20020a17090b068db02901656cc93a75so4654796pjz.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Jun 2021 12:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=REKNtCEqXaJGJPXgH7GO4G/xkEFE5z6abOnwkjeEOOM=;
        b=nSXDtstthFYk3A2ZD9WYBvz0SWa87AmhYmluGZALm2zmSgBpJcRLa+M9YLc2ZxPOOG
         lX75jtHSXyM0egGqzaJmw33YPXQpKMG305SNV1xm34k/5dPZ48AvkO5xVSJpN7CapZ38
         Jl7tgiQeXOttbtGseIOBlt0i76zZkBt/knaqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=REKNtCEqXaJGJPXgH7GO4G/xkEFE5z6abOnwkjeEOOM=;
        b=pKVFzkCTBoCBlZB0POj3vWxlH5I1A8y6xYIFEi07HWEWCQJfjG/fzAa1ED11sz+AZ7
         58gZzjYhs5NiQdHVIYm67sSgJ+rfNR5tvPg3iboso784YmPwEGSy9X5BdZAkv6q6lXSn
         07INkFTig/KeYWECnNXOU8JZoblhN2h7U1xxxf1AE4J7OUrioJKIgXBpqwPNWUuYfrlh
         fSljGM11qieUBS1zwVqIzoZwTkhIQ+jLxGQxzeI1MZW37C78PbgCUM67A4EfkkLl4XmH
         CL8Ol9MaKluu0wCx+SMIsSVkzF3S6gwj1+St3zaRyY4G3SAtxTBP9opFnNyxL6+NKnhC
         XBSw==
X-Gm-Message-State: AOAM531/CEn+JD4d1M9d8+edJ/mAyusdvRtSCwDQxXE2bObmx9H7GkaY
        83ERP2wbTyWAG3GTZXgsPgf2Sg==
X-Google-Smtp-Source: ABdhPJySx5ku8Zq623xzQd4AkI8yYKtixtRFQEZZOmLEeOFMPh/2wkuxDpRu6vr08dRhwclNWsOrdw==
X-Received: by 2002:a17:90a:4f0a:: with SMTP id p10mr12733702pjh.36.1623873186468;
        Wed, 16 Jun 2021 12:53:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q23sm2920275pff.175.2021.06.16.12.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 12:53:05 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     netdev@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Hayes Wang <hayeswang@realtek.com>,
        Lee Jones <lee.jones@linaro.org>, EJ Hsu <ejh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH] r8152: Avoid memcpy() over-reading of ETH_SS_STATS
Date:   Wed, 16 Jun 2021 12:53:03 -0700
Message-Id: <20210616195303.1231429-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=e288d7a5d47b450f2b94459be58b809b0f9b078e; i=IIyfLh/uWBux4FKJ8uy3gqu60Pe0+DygS5gZC5j95a8=; m=CF57NG64wUjRAJMr07rJpYR31VG7hNQuEGsWk+kxwfo=; p=pFlDJK5bThxCv+AjngYUxbnf83MuyxEMc3SAV1dXHT4=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026; b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmDKVp8ACgkQiXL039xtwCZyqA/+JfK nd+cjG9VsUhUfLcjOzVyzLHaDABMvQZZpnOBMM+ID99MK4ADVRFSEszL895QlRyrdD0J3mkf7QQas BL8BGtqpgoexWikR9W8a5MlCMFzlDJoLCxqAZ0gEyn/suDEbbzJ0DJ5Tqw0wIHDHTjHQG3937vs0c Yy+ov9dkv8P/NWyis3cDe/iGnFS+Mz8iuWulYHbbum5DuyXte7G+4mKvNYscyiyrVwMCrDKd1jOJX aKFvn6zozBWDvdLluNvQYQjs7ZbVejM+Fa6MmVMkH4i0iNTc04HoTRpooLHZvHUxPwLuelfGdnG4X 0FD0weNJYjtp5C6X5LNBiAtnGcMsJM4r/D47HKa8RATZBJuk5y5dz0/L60Gjq9NaHUzhf0R+K9sZX FT0ql+eJH8Jq4/kANsuJ9f2uIQdtihvlCr9+6xA/UH6O+OSa9Wm0suEe9f76XDAqLMusdisAv4DBm ohpYaW5JWpKu5aGypbgxcEfFwyRr6oAAateKckvFH7QucgInx5SMzEALiMWGGImWWnc6tsit0dBKG YydG1FGlMl7wtrCB+MI+gXpcMymmvV34d8XiJ6TdVjQaaCxCgdfw31uXu7tElc1bXagpK92a6Xy0S BrCsrypePKT0YAgGjVoOsQtqXzQt6V4npZPkcCuEaPOWmvnvEaKgIxI+p38hwdOo=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally reading across neighboring array fields.

The memcpy() is copying the entire structure, not just the first array.
Adjust the source argument so the compiler can do appropriate bounds
checking.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/usb/r8152.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 85039e17f4cd..5f08720bf1c9 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -8678,7 +8678,7 @@ static void rtl8152_get_strings(struct net_device *dev, u32 stringset, u8 *data)
 {
 	switch (stringset) {
 	case ETH_SS_STATS:
-		memcpy(data, *rtl8152_gstrings, sizeof(rtl8152_gstrings));
+		memcpy(data, rtl8152_gstrings, sizeof(rtl8152_gstrings));
 		break;
 	}
 }
-- 
2.25.1


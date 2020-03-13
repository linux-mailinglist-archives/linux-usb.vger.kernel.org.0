Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCBC185149
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2020 22:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbgCMVkF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Mar 2020 17:40:05 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40676 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgCMVkB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Mar 2020 17:40:01 -0400
Received: by mail-lj1-f196.google.com with SMTP id 19so12165116ljj.7
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2020 14:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hackerdom.ru; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HtY5oImSA0+4YSNm6q/VHicARFJFbzmTkofRiaqhhKc=;
        b=i6Sda7uWBOD2K3vqcHwo7xd1p8sMeqiNPXsPFKYrcdGRCEdfq4sGW+sfz+6DtEY5ng
         CPG8Ksg9tqUzaZSW2/MpGEQHtBxkkjwEDR8hSP7vfSeXmmIWCgup8KWccyLJyd3ZoYeg
         hfc6zDthQwpj8jCV1Q2VN2YHdvr/jVU+TFWxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HtY5oImSA0+4YSNm6q/VHicARFJFbzmTkofRiaqhhKc=;
        b=uMa2YalH5eTcuKcuOLou/8x8jOTz9osr942iybklSyVWOH2xveZttVHj0RK4omUBdu
         jecQ3ExInmVJUhWSXtS/8lwpfGQnoNwjgbI6MpupyLt4BNeXgGtjO6xfZ1cFreJx3+9d
         QvxM97EMqan0/DOnuogYlSexr8CSckiyeaiMzhgwo7APvADIQRRIpLZ2fL8bSBNuaRke
         xIgbqubACgghOV8fvCw1v4B9YyjpyKZsqy09tg/b9UEcNwnwfe89BPX1Yt9Tyua7LtFP
         aSRvE41YuLHdUfQshMywVJU0KJsT61Xnqm+nZG5weCCO+GDDfU5UppOe9xuYEOtm47JH
         AB7g==
X-Gm-Message-State: ANhLgQ1t0lah1j4oPa4OHvHzPgG2B6yeGnlYhzEKTLB676Y/aukWBVZE
        9FArfkr2E3EjyGWfcHeWka1JGw==
X-Google-Smtp-Source: ADFU+vs0A/qJqrv937YyDOkFvvA1JoZQ9oheGaTY/TOQzzjwt31KNy+BHUUk/NPpRaEoBJe/cjI0Kg==
X-Received: by 2002:a2e:9b44:: with SMTP id o4mr5047746ljj.63.1584135598069;
        Fri, 13 Mar 2020 14:39:58 -0700 (PDT)
Received: from localhost.localdomain ([83.169.216.4])
        by smtp.googlemail.com with ESMTPSA id 3sm11178101ljq.18.2020.03.13.14.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 14:39:57 -0700 (PDT)
From:   Alexander Bersenev <bay@hackerdom.ru>
To:     bay@hackerdom.ru
Cc:     Oliver Neukum <oliver@neukum.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Enrico Weigelt <info@metux.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] cdc_ncm: Fix the build warning
Date:   Sat, 14 Mar 2020 02:38:21 +0500
Message-Id: <20200313213823.178435-2-bay@hackerdom.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200313213823.178435-1-bay@hackerdom.ru>
References: <20200313213823.178435-1-bay@hackerdom.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The ndp32->wLength is two bytes long, so replace cpu_to_le32 with cpu_to_le16.
---
 drivers/net/usb/cdc_ncm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 5569077bd5b8..8929669b5e6d 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -1172,7 +1172,7 @@ static struct usb_cdc_ncm_ndp32 *cdc_ncm_ndp32(struct cdc_ncm_ctx *ctx, struct s
 		ndp32 = ctx->delayed_ndp32;
 
 	ndp32->dwSignature = sign;
-	ndp32->wLength = cpu_to_le32(sizeof(struct usb_cdc_ncm_ndp32) + sizeof(struct usb_cdc_ncm_dpe32));
+	ndp32->wLength = cpu_to_le16(sizeof(struct usb_cdc_ncm_ndp32) + sizeof(struct usb_cdc_ncm_dpe32));
 	return ndp32;
 }
 
-- 
2.25.1


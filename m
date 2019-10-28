Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8CAFE784C
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2019 19:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403780AbfJ1SXR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Oct 2019 14:23:17 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:36454 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391125AbfJ1SXR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Oct 2019 14:23:17 -0400
Received: by mail-qt1-f196.google.com with SMTP id x14so5687613qtq.3
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2019 11:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=peg4X2YDLFsoUnpFAVPaYd5Gm2QFG5TrZ1ugo/dtbLU=;
        b=CkbzqhhdCBHymQbOsmwwdOR+mroOsit7vTupBUGMMUgRKoqNnSd269BquNMXUNKn4b
         Rv1l98IQKmWNDj6BqZCDY/Is+k7acGen2NGjpQhVjH4kFn8/0nfeQeSTaM40LUSW6a4L
         XJDcGD7PIZlmiy3YrSLOwxCJgzDI4ZgDf4DSDbmYHpouKy/FI70GWEFs7DIhRLbGkFZv
         xY+kssIRfYAOcvwvHQl8WRi/ZRL+CZ1m91w4LR4hLNuNUxGjrCv+H1oO+Jf6+k7VUOE7
         DwdSQcmwIGgcVtwQesIXsknLYyBKAJEAVLycP93cfWS504gDmWnULb35VNHHxajwCyys
         OV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=peg4X2YDLFsoUnpFAVPaYd5Gm2QFG5TrZ1ugo/dtbLU=;
        b=osnw9RuCoicxQSKIiZxJ4WxGukKUh9+HtWxKqFVi3xKmuQedam1Am5vX792cFVCbUp
         Z4dWuPh9sMbI4WJfszZo3Lx4c8LXP2F0/ghWwb7zeV9kbeQojuqssA6bJKMyIUWbTgvg
         lkcNhPJcT77wXzBS6rvAdxUMCb8dh0Z6Wgs55OMY32QT8iUy/Eow12iaJWxzowiI+ALj
         7An8rG0IzA+u/oxvttZTIhCPAPkcBJ+91vjwi1MgxmXhQ5zbXI/e0D703SVBcJ198OyT
         viyIoTSZchV7qdBkIl1k86MdFqUAf+MzEL+wVewVIMA/24KR1deiLjIvN6aoYZrm81Gg
         nnYA==
X-Gm-Message-State: APjAAAUh9rUYtCfOEWA8Ae1Iv4OSqVIQxf0pU7NOFJKDmtlYvUbWAAmm
        D89SdBAiqAR0iC9mcO9fIoA=
X-Google-Smtp-Source: APXvYqwNKcO0LjFvNRg1Q0mjp25FutSewql7WzwxyZ+t1BtcKhVB0C+8qVlyVbEfinYvThKicEXQMw==
X-Received: by 2002:ac8:93d:: with SMTP id t58mr6805313qth.217.1572286996447;
        Mon, 28 Oct 2019 11:23:16 -0700 (PDT)
Received: from firefly.sparksnet ([2601:153:900:a52:6f12:874c:d2b2:a9d0])
        by smtp.gmail.com with ESMTPSA id x9sm5808631qkl.75.2019.10.28.11.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 11:23:14 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     heiko@sntech.de
Cc:     linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
        katsuhiro@katsuster.net, robin.murphy@arm.com,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 2/5] dt-bindings: clean up rockchip grf binding document
Date:   Mon, 28 Oct 2019 18:22:51 +0000
Message-Id: <20191028182254.30739-3-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028182254.30739-1-pgwipeout@gmail.com>
References: <20191028182254.30739-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixup some typos and inconsistencies in the grf binding.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.txt b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
index d7debec26ba4..ada5435ce2c3 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.txt
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.txt
@@ -27,12 +27,12 @@ Required Properties:
    - "rockchip,px30-pmugrf", "syscon": for px30
    - "rockchip,rk3368-pmugrf", "syscon": for rk3368
    - "rockchip,rk3399-pmugrf", "syscon": for rk3399
-- compatible: SGRF should be one of the following
+- compatible: SGRF should be one of the following:
    - "rockchip,rk3288-sgrf", "syscon": for rk3288
-- compatible: USB2PHYGRF should be one of the followings
+- compatible: USB2PHYGRF should be one of the following:
    - "rockchip,px30-usb2phy-grf", "syscon": for px30
    - "rockchip,rk3328-usb2phy-grf", "syscon": for rk3328
-- compatible: USBGRF should be one of the following
+- compatible: USBGRF should be one of the following:
    - "rockchip,rv1108-usbgrf", "syscon": for rv1108
 - reg: physical base address of the controller and length of memory mapped
   region.
-- 
2.20.1


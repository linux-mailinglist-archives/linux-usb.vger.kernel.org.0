Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D863F1F95
	for <lists+linux-usb@lfdr.de>; Thu, 19 Aug 2021 20:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234261AbhHSSK3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Aug 2021 14:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234246AbhHSSK3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Aug 2021 14:10:29 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921C6C061575
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 11:09:52 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id f13-20020a1c6a0d000000b002e6fd0b0b3fso5754651wmc.3
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 11:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nJFsB0vNTcvxAccxAs8X/3nZKeh6jAZ98Q3ZjWO+LEQ=;
        b=Wv1an5VdNrbgraw7EX4H4zOhAWUPNg2I0JM/753YIzCbjA5Fx6Kn8wDX9L0cBzoKh7
         S5UIdzHCbLSh7anQxjs6GFdS357toSGUTNdnkKtneCQk3+XSV1/gOTSL9IDzzNRR0PRN
         eLYOj7pHYzFoKVUJKyvy3+rXMHhFItIDPqT+7fnRqg/Xf6gVNVnlqUu6cJd4IK05bUE/
         Gna/oPee5FUhDuYAQ2Zv8EejH9bnKsyWIvLJI93DaXnvURx/eWridh/8WuOY7cHNavhO
         vi1qI0oA9q29RKMTROdLeWNCbmV99y40fpwVTalsMFcDcn7y6QHNiofcQF1dE6NajH8+
         +1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nJFsB0vNTcvxAccxAs8X/3nZKeh6jAZ98Q3ZjWO+LEQ=;
        b=hMApu5e31ie1yHCyUNnJ2UA2j7ogxvylJMr/ly1//D3oaRapxxXAUe4atVQjAPK1E4
         JZdNB7oXYJi/okhpSfhnIGlhVFuurKhlVwiCgT1Hpu/s/VMbtv2LMlp7cX5MzjoUzJYh
         Yu6cHcS3yiFJbHKiO/4F3RX+nSZ6ElcxVgSnon3pTy77KXZM4nafBeV6Qkp6dJwGqoQP
         csGI3fmKH8VxofZ6oU7R+ndLKu8e/9qhK3cjOOJ6uAa25zCZdDx86UMnl42JMGYUbdr6
         wXzVMWUHhVJu6djyvQbDKsRZKd/zHEwxnT4irnBdRDjzhJj5qm+6kTh/LNbUko3Hl2Wo
         sp5Q==
X-Gm-Message-State: AOAM532u47NZ+3LiUo2qMJkdMN/pFYgJnmPk11MKEy+12d8z6fh5cFbE
        /YzzApqrnMWTBwrCoLoTuzxO9w==
X-Google-Smtp-Source: ABdhPJwFTgzzn3g4DphYHWM09Tq2x3PPewtmKX76D6hrMXygREr02nxXG8U3jGnyP147GVC1aDqv/A==
X-Received: by 2002:a7b:cf0c:: with SMTP id l12mr25984wmg.62.1629396591112;
        Thu, 19 Aug 2021 11:09:51 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id h16sm3625668wre.52.2021.08.19.11.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 11:09:50 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 2/5] usb: isp1760: check maxpacketsize before using it
Date:   Thu, 19 Aug 2021 19:09:26 +0100
Message-Id: <20210819180929.1327349-3-rui.silva@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210819180929.1327349-1-rui.silva@linaro.org>
References: <20210819180929.1327349-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When checking if we need one more packet on a bulk pipe we may, even
though not probable at all, get there with a zero maxpacketsize.
In that case for sure no packet, no even a one more, will be
allocated.

This will clean the clang-analyzer warning:
drivers/usb/isp1760/isp1760-hcd.c:1856:38: warning: Division by zero [clang-analyzer-core.DivideZero]
                                && !(urb->transfer_buffer_length %

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index 2a21fe5aa7a8..5c947a1eae49 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -1854,7 +1854,7 @@ static void packetize_urb(struct usb_hcd *hcd,
 				packet_type = OUT_PID;
 			else
 				packet_type = IN_PID;
-		} else if (usb_pipebulk(urb->pipe)
+		} else if (usb_pipebulk(urb->pipe) && maxpacketsize
 				&& (urb->transfer_flags & URB_ZERO_PACKET)
 				&& !(urb->transfer_buffer_length %
 							maxpacketsize)) {
-- 
2.33.0


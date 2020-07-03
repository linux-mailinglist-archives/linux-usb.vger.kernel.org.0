Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E5C213EC9
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgGCRmr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726949AbgGCRmp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:45 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F225C08C5DD
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:45 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l2so33374392wmf.0
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iR7UBjy9b+GnDxxSAohGssAzGZu9g74Tp/QmVOl6H2Q=;
        b=ducnwHyYnt1Euvl0f4+BWCbuzEg8Fov/NpURhw5+20HmnMl1J/sAR30xHQb54zWlsc
         8ylR62njZpvZKMYJmXQzbyCwGAGVC8pDWzbyYh2po23NCMBqyIkNgsIyxX/9JgCgQJfu
         I7QGyxJMasm839b6jGVpSsPgPAzSGAsHKJmm7kTyFg+rp1Y95hEhQdGu/Du80koYKyPI
         WAdK4rpXnQ5sgM9wxlRx6YPlGLmvvxZXNCMjFdWC2cqVVfV1lkU01XJjo9uvmAuMZ3PY
         pR9Z4zPWOgalslyfm3pr3/mQgbVeJFyzo4rb8b/EaMS/2q/D4HOl0yVvz21fy5HYW2es
         6iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iR7UBjy9b+GnDxxSAohGssAzGZu9g74Tp/QmVOl6H2Q=;
        b=uU+iFrKoEOmtLV3GXFufsvbNqv+O6Wu7NUv1m/YumMj+mmmwPV94HycfSJKBPr/XZy
         zLl7UhXh9Xpr1ZaK54+UTxWMGIWB133+LM8Tex3OVXUA7MJCtMQZpWeNg8fTIwDbOseM
         c+9kZcPdvdSToudyoAry0FyC1g6Pp4bCS3vCgw41vzvcTAYSOwAET+LbkuhyB+RK5KXs
         3r+eCYRdOTSbqWozu6uqMKhAESn94I6KdnPia1RHPmgV5bWh1nrLOlahoU7WdkEf1TJ6
         j92fXePf9dUPuivtMxnBpKFvUE6qym3+23xdtkVo9V0RNI5ttRQO5ACtGTfK7P7tsXtd
         CwBw==
X-Gm-Message-State: AOAM5318JImisOXgxm7FhwyDPD9IXJgrMDX6NJ5NbIri33TNY1h5e4zN
        +b922L5gU8mU6w7X//eZEyxktltTQSI=
X-Google-Smtp-Source: ABdhPJzWDElIsWsgZs5aFyQnkGgXFAh1NXyvJLsupvxSIpseD/CGSj1lFbaE7ttaa7WKZibdweL68Q==
X-Received: by 2002:a1c:81d3:: with SMTP id c202mr24362378wmd.54.1593798163896;
        Fri, 03 Jul 2020 10:42:43 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:43 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH 18/30] usb: host: xhci-debugfs: Use 'gnu_printf' format notation
Date:   Fri,  3 Jul 2020 18:41:36 +0100
Message-Id: <20200703174148.2749969-19-lee.jones@linaro.org>
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

 drivers/usb/host/xhci-debugfs.c:128:2: warning: function ‘xhci_debugfs_regset’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
 128 | vsnprintf(rgs->name, sizeof(rgs->name), fmt, args);
 | ^~~~~~~~~

Cc: Mathias Nyman <mathias.nyman@intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/host/xhci-debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 76c3f29562d2b..92e25a62fdb5b 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -110,6 +110,7 @@ static void xhci_debugfs_free_regset(struct xhci_regset *regset)
 	kfree(regset);
 }
 
+__printf(6, 7)
 static void xhci_debugfs_regset(struct xhci_hcd *xhci, u32 base,
 				const struct debugfs_reg32 *regs,
 				size_t nregs, struct dentry *parent,
-- 
2.25.1


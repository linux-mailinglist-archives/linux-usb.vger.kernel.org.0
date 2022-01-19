Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE3C493513
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jan 2022 07:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351833AbiASGk1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jan 2022 01:40:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351812AbiASGkY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jan 2022 01:40:24 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01BF5C06161C
        for <linux-usb@vger.kernel.org>; Tue, 18 Jan 2022 22:40:24 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id n2-20020a255902000000b0060f9d75eafeso3053081ybb.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Jan 2022 22:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=8U2NSEHKCUQ9Z36JnWsd++SgPVSc/KZrscz58kGHWbs=;
        b=IRSqYBoUeD7Ry93C2zrCYgsanGN31qieUkxi0BeTfinOsX6JpBzwbaqcpcyFqxF53p
         06IewAyfME4FVUIdzowKMLV3t2g/Cwb/7vvspipBtDa08Iq2QWPR35ESj7ELH41wavef
         8AUmVblRGqkDAX2TFq7SOtmQlaT5Hsvio/ujx+P2MIaj9JP0mwvlOv1Hsopjv0wTZnBd
         VGwB36GqnKnDVk6CjP/cUFqA7xp8pkQDhQXzWGICjpLYnvPaL5vSsUai3jKXDlvUzrPV
         FbT5s9+u+NTQTFk17dRIYQgZ1P57mx2pT45LmKZs+TbWJ1/02J8BmNuIHY3duTLMgLWT
         tGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=8U2NSEHKCUQ9Z36JnWsd++SgPVSc/KZrscz58kGHWbs=;
        b=kLt4s+0PXYPw2gIN0NGlVCd6gUBjtg0o+chYfTTu9x510xmiDRChEuyWlLfp9nLAb9
         dn358tS7/V5nOAlc0NV0Hg+GgLXPp/EYElOHhqOTGrcF6Gpa+huvlvTVvxkMHKNzU1yy
         nh6o9osVY28qbV9C42R9SVs9SHNAq3DrkInWy/U7s2hfzMsIZWE32eteeSmL5gblf8iH
         51zrIdLH/vFj/U3In52BqxG4Fs9TeVTgRtGYxQh3nnmGGBMpWvcZ8MK+tnjeF2IsaFmL
         fuW1eTVwVd9h7aReiHbfJxGCnjkczF7gv7O1mlymkyzaKcQfzQMs+EEivyQobFUxWEKG
         jPxw==
X-Gm-Message-State: AOAM531MNpGrICq9IlNmCOKEE6GAKxUbsFV1o+MC8SismxHgIPl6J2Cj
        XvH7WxVCfgRUG6+dK823xi7Gb3kO4l4P
X-Google-Smtp-Source: ABdhPJw4oZplaLI2nBLpJgDmj7/V9O9mEV4kAhMMQKEjyAszy2Z9I1QfXjY8/d+wFeXvKFrQlCyN/+A6d/Yd
X-Received: from pumahsu.ntc.corp.google.com ([2401:fa00:fc:202:726e:776:90fe:956c])
 (user=pumahsu job=sendgmr) by 2002:a25:b599:: with SMTP id
 q25mr17915493ybj.274.1642574423209; Tue, 18 Jan 2022 22:40:23 -0800 (PST)
Date:   Wed, 19 Jan 2022 14:40:13 +0800
Message-Id: <20220119064013.1381172-1-pumahsu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
Subject: [PATCH v5] xhci: re-initialize the HC during resume if HCE was set
From:   Puma Hsu <pumahsu@google.com>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc:     s.shtylyov@omp.ru, albertccwang@google.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Puma Hsu <pumahsu@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When HCE(Host Controller Error) is set, it means an internal
error condition has been detected. Software needs to re-initialize
the HC, so add this check in xhci resume.

Cc: stable@vger.kernel.org
Signed-off-by: Puma Hsu <pumahsu@google.com>
---
v2: Follow Sergey Shtylyov <s.shtylyov@omp.ru>'s comment.
v3: Add stable@vger.kernel.org for stable release.
v4: Refine the commit message.
v5: Add a debug log. Follow Mathias Nyman <mathias.nyman@linux.intel.com>'s comment.

 drivers/usb/host/xhci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index dc357cabb265..41f594f0f73f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1146,8 +1146,10 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		temp = readl(&xhci->op_regs->status);
 	}
 
-	/* If restore operation fails, re-initialize the HC during resume */
-	if ((temp & STS_SRE) || hibernated) {
+	/* If restore operation fails or HC error is detected, re-initialize the HC during resume */
+	if ((temp & (STS_SRE | STS_HCE)) || hibernated) {
+		xhci_warn(xhci, "re-initialize HC during resume, USBSTS:%s\n",
+			  xhci_decode_usbsts(str, temp));
 
 		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
 				!(xhci_all_ports_seen_u0(xhci))) {
-- 
2.34.1.703.g22d0c6ccf7-goog


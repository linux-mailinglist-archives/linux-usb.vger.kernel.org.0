Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750C521589C
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbgGFNgH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729289AbgGFNd7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:33:59 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B60C061755
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:33:59 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id l17so39373034wmj.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F3N+fzezv1MWYIkYTGHlx08nxeXYi/20m77vgS5T6os=;
        b=BpLIhIM9HO9QX/91QqPb0axOZ+f3MusDB+2c/VFHx/69xTyIJRCZQeP3ZiC1KHq3cQ
         MPMyfOETWx+kDYSAp2ES8FPPerVyUzUHVoDK4ZE3kx0lHJumW3So3ckLNKz1ZjU/aRgM
         9UPBYbokmdIFpUzxdVL/M8Xe6mMwTbF2QrISRvdMpcpb/a4z6XCoUGhvmgYxiOia5lXw
         fF0G+NETlZp53qRczU0psHvtC9Do08Z+EKc5a0LRflRb6uiSioO1p6Oi7nnKQIyPsFsS
         iyd7IeCm1h4s1m2dHMRE4UnfHf2FurtJS8GyFbNTXVkCDhdfO9Xv5XIEDIGWp6x38Uyb
         stNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F3N+fzezv1MWYIkYTGHlx08nxeXYi/20m77vgS5T6os=;
        b=JHbuNJDIQRm/W1C4n+V7MakFVYfSBUxn72pQgrKun1O7rGVn2eLVaKoMdnVr1kageO
         MDQCcm/UjdqtQ5q4cROPhNVkxvt9hIHHey36b6ux0DwT2MR4SNA+Efp1hIoYImcYQnTu
         VWUe6gXmBmD9mX9fKM7UsP4X6Zgrh/5ZHvl7zKiA0i5vPBl7RG09z9vDfazuYb7UFFgn
         kJyr0W6/dgczYNRqy7jPwkDxcR1XmFKs84nERH1EiLrPlmQJ6dFg68mJVBeL4LgxGFs6
         lptWVOOJa6XvS4PR/Fq2CYN1/rfs14sbtfFD96+OoY4l8zgWlvWg80MFBDWUTNe8Jgqe
         6CBQ==
X-Gm-Message-State: AOAM533JrDSRMbMATOp46iFW5TNzRGvXcTkjDdGptJw1nzMIIVzmaTtX
        sWNHQND/Ii66xo+bdPHzEVCWXg==
X-Google-Smtp-Source: ABdhPJw84chABX+3T3NQgrsvaRU3aLogEgRaFQd3ljAQ8Bw2zi12v8ZyS4JXvweac2ZKGE4NngEQgA==
X-Received: by 2002:a7b:c013:: with SMTP id c19mr48981840wmb.158.1594042438048;
        Mon, 06 Jul 2020 06:33:58 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:33:57 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Michal Nazarewicz <mina86@mina86.com>
Subject: [PATCH 11/32] usb: gadget: function: f_fs: Demote function header which is clearly not kerneldoc
Date:   Mon,  6 Jul 2020 14:33:20 +0100
Message-Id: <20200706133341.476881-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document the demoted function here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/gadget/function/f_fs.c:2361: warning: Function parameter or member 'type' not described in '__ffs_data_do_os_desc'
 drivers/usb/gadget/function/f_fs.c:2361: warning: Function parameter or member 'h' not described in '__ffs_data_do_os_desc'
 drivers/usb/gadget/function/f_fs.c:2361: warning: Function parameter or member 'data' not described in '__ffs_data_do_os_desc'
 drivers/usb/gadget/function/f_fs.c:2361: warning: Function parameter or member 'len' not described in '__ffs_data_do_os_desc'
 drivers/usb/gadget/function/f_fs.c:2361: warning: Function parameter or member 'priv' not described in '__ffs_data_do_os_desc'

Cc: Felipe Balbi <balbi@kernel.org>
Cc: David Howells <dhowells@redhat.com>
Cc: Michal Nazarewicz <mina86@mina86.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 490d353d5fdec..2d00ba0726453 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -2352,7 +2352,7 @@ static int __must_check ffs_do_os_descs(unsigned count,
 	return _len - len;
 }
 
-/**
+/*
  * Validate contents of the buffer from userspace related to OS descriptors.
  */
 static int __ffs_data_do_os_desc(enum ffs_os_desc_type type,
-- 
2.25.1


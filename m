Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D04151F8654
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jun 2020 05:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgFNDPe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Jun 2020 23:15:34 -0400
Received: from mta-p6.oit.umn.edu ([134.84.196.206]:47906 "EHLO
        mta-p6.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgFNDPc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Jun 2020 23:15:32 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p6.oit.umn.edu (Postfix) with ESMTP id 49l02q2SKNz9vBrc
        for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2020 03:15:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id UeBMAHqeTL6I for <linux-usb@vger.kernel.org>;
        Sat, 13 Jun 2020 22:15:31 -0500 (CDT)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 49l02q0srzz9vBrb
        for <linux-usb@vger.kernel.org>; Sat, 13 Jun 2020 22:15:31 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 49l02q0srzz9vBrb
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 49l02q0srzz9vBrb
Received: by mail-io1-f72.google.com with SMTP id c5so8924526iok.18
        for <linux-usb@vger.kernel.org>; Sat, 13 Jun 2020 20:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bXGIj3w1yVBS8cfW/zmC/b0yQf048QtoGJ5/O/lSkls=;
        b=GujSemkDgYkmQ6TzVyyR+dOZ5DTxdroUrcrQu9/15CrlDzCrUDPx55O5GhAzWLOV9d
         hiORMnLrwN3mJB5NpgAvOA/NFfU4Glan2Yxq+FP6n3QI/ud7+N/cemQSnRb7hrvXWUbt
         buuDCeZvwwRmzG0T4DPr3p4zUfpiNgCmVnpSGo2ZdDK+iToqyMFI3gTgIwGuUrruYiI/
         d1ITrnv452S93jEMLHkVfZFm1sUiPBq5I6TKb02p2fj6oz7uP90zg+/ewrXAnGnK85b+
         uKZqJ+bsYAOPCylH/oUi3I9LJ6qs+BVM/3yz+n4xc3T6HLfPRs+IAILZTAx6rg4s1eDT
         gs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bXGIj3w1yVBS8cfW/zmC/b0yQf048QtoGJ5/O/lSkls=;
        b=RR0myvA6uyWKbt0OwQF02Bc7QVJQlKL5A4c0uLDwSmDff92eED8DQLtxMT/MP/8/g2
         V8FzMuGS+ODpRtA0QSYoDJFCW9cqcnLspGEffPxmBi5jMcoXEzo/LvY2qkjxkfl1vIqx
         FmGDYIo8hk01hMN8RmJCGWJWD/5QAJjgOY7SoudOpudtYDOGmvSEXHOeC/YUDEBDmo2z
         HaeArHl2dh5t29gAnfv8OJoS6PeJAqOFx5NwkqreqCizd7HwnpispP28mvU5kV4cfN9q
         2Eezi8UZYdSVWnjPcbQCdXyorXdagHu6K+nimKef6ziqe9TEa0mEt5KMfRbBafsjQQRg
         5QAw==
X-Gm-Message-State: AOAM531GHDUn+hert1dDu7HXW0adLMXfiVyO5a5FA+PkiDBaiLn3H9YT
        fxwO/CgBWIjR+os78ulajP0OY2Fh7q9xDPv5fBfUQF0FYlEgClfeXGxJCGZ4AC+RwTjPXWa20dZ
        a3OsXyer8Lsy3Gueu2R6ZV8fu
X-Received: by 2002:a02:6605:: with SMTP id k5mr15606042jac.32.1592104530225;
        Sat, 13 Jun 2020 20:15:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2aMBvp3RZakdn77go2evc1SrKFgZNruyEMxHqmY5sbSNA6239KocqzN/goOWJX0cLIiwD/A==
X-Received: by 2002:a02:6605:: with SMTP id k5mr15606026jac.32.1592104530000;
        Sat, 13 Jun 2020 20:15:30 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:49fa:9c47:e40b:9c40])
        by smtp.gmail.com with ESMTPSA id d5sm5560197ioe.20.2020.06.13.20.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 20:15:29 -0700 (PDT)
From:   Aditya Pakki <pakki001@umn.edu>
To:     pakki001@umn.edu
Cc:     kjlu@umn.edu, wu000273@umn.edu, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: dwc3: pci: Fix reference count leak in dwc3_pci_resume_work
Date:   Sat, 13 Jun 2020 22:15:25 -0500
Message-Id: <20200614031525.128556-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

dwc3_pci_resume_work() calls pm_runtime_get_sync() that increments
the reference counter. In case of failure, decrement the reference
count and return the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/usb/dwc3/dwc3-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index b67372737dc9..96c05b121fac 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -206,8 +206,10 @@ static void dwc3_pci_resume_work(struct work_struct *work)
 	int ret;
 
 	ret = pm_runtime_get_sync(&dwc3->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_sync_autosuspend(&dwc3->dev);
 		return;
+	}
 
 	pm_runtime_mark_last_busy(&dwc3->dev);
 	pm_runtime_put_sync_autosuspend(&dwc3->dev);
-- 
2.25.1


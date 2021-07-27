Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2964F3D728C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 12:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236140AbhG0KFj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 06:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236087AbhG0KFe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 06:05:34 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E472DC061757
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 03:05:33 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id l4so14500696wrs.4
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 03:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/IQIjkQ2WJR8da7d1+VO9N5+uZW87ME+Yf1TfalAyx8=;
        b=df0POzJi2w1DWCo/XXMQS3pnUEIC02zSKrbTS7O/nEMVhknhyglALjTpw7JsyBpjst
         EoW6JpcYzIHD88caJ1M2n00d1feW4IDC5xzHN2KQz2OFs44hV0iHGXDe+9UxWXaV0VSq
         RxChuOvjKJ7zGvUlt+RtSOF6fX8nmNgXVksgpHxJOkF+aDN5J/mdiSo13Yx4l2WUkpyN
         4WYvJamPNTpf0GSn5YT2ARWTeRqViLMXsVq2muoU7YutMd3+FfU+ZAR9tbnH2yB3S4t3
         pLYft3BAYl3ZSWgwOJuZJ/Q/xGP+cF8CuzR5sQ5aAc0ube8ersIqogYycQLr2c/FuKDP
         QaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/IQIjkQ2WJR8da7d1+VO9N5+uZW87ME+Yf1TfalAyx8=;
        b=ZcvtCcLbWGTxKjdodtr1fmX0cCHR/pla5RbNbDXH1ETjl1dEFGWu2+m8aEx+p+Ur/k
         yTa+T032SYWF8muBffy61Mjr84u/1xiZbwWrFlNmjKJ2F78OhpvvqfCPGKzOg6Th/DDA
         fwby238r/1KLR35tmeQERT3Z+u9QPXNf3R+8WM4/gBfyLg1GaD///SX18AUxCODJY7kU
         O7X6hp0CjrwV3xM22tBUhW0MzmbMH1bzKigdi7b+BBhQ8XsqazZ7R+Ug5OoDmU4js7Mg
         YV3fdC1eErpAHHuT6RZELzOuK04XTFVCD69Oc4QuEuaKrsIGck6Yur+T+4oYe+bMg227
         qFQA==
X-Gm-Message-State: AOAM533DoYYxpSeJEpMShm5RM/Xfo2NtDa2ovRlpH2m7RBjaizruzG3u
        Oq6RZd/75SPxv87vC9wVPPtVggxosXCXAA==
X-Google-Smtp-Source: ABdhPJweHG78yq3t5UifIqM9zMQx8jrCyr+dOPyjyw8KsdT6fstLwV+JLi0+V/WvvSWjZuBfXjzMBw==
X-Received: by 2002:adf:ce82:: with SMTP id r2mr24076933wrn.161.1627380332535;
        Tue, 27 Jul 2021 03:05:32 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id v5sm2813221wrd.74.2021.07.27.03.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 03:05:31 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 0/3] usb: isp1760: cleanups and sleep in atomic
Date:   Tue, 27 Jul 2021 11:05:13 +0100
Message-Id: <20210727100516.4190681-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series includes one debug message cleanup, fix in the error
handling of the cache pointers and a field register poll fix in sleep
in atomic context reported by Dan Carpenter.

Cheers,
  Rui

general note: beginning next week and for two weeks I will have
limited access to email.

Rui Miguel Silva (3):
  usb: isp1760: remove debug message as error
  usb: isp1760: do not sleep in field register poll
  usb: isp1760: rework cache initialization error handling

 drivers/usb/isp1760/isp1760-hcd.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

-- 
2.32.0


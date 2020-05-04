Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC83B1C49BB
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2020 00:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgEDWnQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 May 2020 18:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726338AbgEDWnP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 May 2020 18:43:15 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F401C061A0F
        for <linux-usb@vger.kernel.org>; Mon,  4 May 2020 15:43:15 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id x25so79208wmc.0
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2020 15:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JjruGVFTYIkCOp/6P69N/+5GVlaNIjo9XcpDR89Pd+0=;
        b=mQxmO5SnyZe8PfDf60tP3gPYEkzPyOIcM3Md/Gdw43BDEazdiO5THIRKvYImhxW/Zc
         pVDzQsWFc2hJiOxJRlfPlTREeMHRkfu31jRlhnmOZdBcAH1bUT5rbqFurdQ0Uggdix30
         CVCzDXzUR2F85C+OLcSgpFtmXOdapgTjEA677JX92wUCrj3NHgxubE5ogp1gM7sGmpjd
         cCVWPBCJ9CfgLP9G9gl3DAArd7M2Zr3lD17FanRN4rDT+iFj21P/m11WthnGCQJwPqBp
         Q0LSt67itKjxxTb9YnXZKvIBESSlM86++zJrBaB9GL9NByXCxAX7QTQxW2RWRd9b5MQr
         6u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JjruGVFTYIkCOp/6P69N/+5GVlaNIjo9XcpDR89Pd+0=;
        b=a2u2HSSfnK6nWlxNZK2eKF6hk1jp4lkfY0j+Mk01kLLwCKGbvjrD+w+5jKOXPL16RH
         RlpbFAbAAHCWG8Z4aOcVL2rClcwUaWxdzSbYmdURRXWyjAQLKD2EwGyO59oDF206VZlr
         LVWcOQcRd1NGG6o4oxqCS/DR/kTMJ6IMrMqfspM8htZeXlOlNQcRoaEJxlQdHO4+60xm
         D34VKPlPs1GwB69J3sklD+y4dVLTTyVwBWous4UllyT9T9DMY6Ccsy7Z86v/03owOI6X
         EhsAx1ruRjiNjvpWWK7dHoTh5AfAVsMc3i0xIdnu6seW8eGV8vZmujIZ5fd14raegp2B
         k+jQ==
X-Gm-Message-State: AGi0PubZCDpOp5azkC6y5GSf5/qBbnXOXXN1JwIo80tXqKjmZ6OPKtXE
        fU/HxeIg54a76d/8L9dzdyJ7sw==
X-Google-Smtp-Source: APiQypJFVRDUjBynGeveRHht+yHkpJBWWsZUQG2vKRa9MtV1rTwsgkSsdhGYav7UCSZmEFtT5TcXUg==
X-Received: by 2002:a1c:6a08:: with SMTP id f8mr16162694wmc.132.1588632194182;
        Mon, 04 May 2020 15:43:14 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a13sm13895888wrv.67.2020.05.04.15.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 15:43:13 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Peter.Chen@nxp.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] ChipIdea USB role-switch fixes and tweaks
Date:   Mon,  4 May 2020 23:43:44 +0100
Message-Id: <20200504224346.613377-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This set addresses two things:

- A bug when using the USB role-switch API.
  If we are using role-switch we still want to switch HS_PHY_GENCONFIG_2
  bits.

- Adding the flag to allow user-space to control the USB role as other
  controllers already support.

Bryan O'Donoghue (2):
  usb: chipidea: msm: Ensure proper controller reset using role switch
    API
  usb: chipidea: Enable user-space triggered role-switching

 drivers/usb/chipidea/ci_hdrc_msm.c | 2 +-
 drivers/usb/chipidea/core.c        | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1


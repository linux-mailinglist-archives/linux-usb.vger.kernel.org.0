Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD041DB345
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 14:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgETMck (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 08:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgETMci (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 08:32:38 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C08AC061A0E
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 05:32:37 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id m185so2670191wme.3
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 05:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jFAFMqlj6VHUq4GAwe3EWfxmV19gL+PJ2inWTHy/gfs=;
        b=NGBQp4hdMBLxCulFTllKRwFSSdvkUki72QYgkVdvPwFZIVi+F22SJplYngL7jNvZKk
         JO4PfWeFC12DL5rWodUj3kcOhMKjY7/JXiS9a0MrMF5LdXQrR1xGyzQDmdfcpTkLwKe9
         rf6aZPU0sDMrttPao4Fa0l4v0eJayA03yeDlemwaoJfmdHca/9ATjJljVKGkX8JxyUA9
         FeUiZ/ZeMNfnIwK/3GdiOCorOIGcBiKfBuZyl6sJzGf7ChzYPyUJ1bmAM6YW7IQxR7yb
         H+Hu+45kRD6zSZzaGLmkV3dcuaqU4U8mz2qH1HfuXAU3gJt++DJ5YXwbyECq2U3GEdae
         4uPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jFAFMqlj6VHUq4GAwe3EWfxmV19gL+PJ2inWTHy/gfs=;
        b=NWViykwxYuQxi5yubxt43Tkx2788BgRbp4K0DgJmKK1Yy2jZL3at2CxcNl8/iwQLnq
         aOJ0Hjnv7uxtN6accEz9matMJxynTWyaDDaXx8U2EkAB2pRUdTxHC0uOQRqMkBuZW4Vy
         jP3uTElBFiDGVAJXaedqUm46aGddIS/LQHBQiJUrrRVC0ix21nd0UEoMl0IuxzPxPYI7
         9xqggY551G14y6h+KaCNkrkNadllhJnyu7kCtP4tA2Bk71xRkfFZhJOvZWtTMsXNM2vO
         Yxqi7D+4jDOMur/kW4WntTMoliLBeK8PDSn+k9Rwe5sx4J65167YfprESTKl9KbvjmRr
         Kbkg==
X-Gm-Message-State: AOAM531+TSrXZxKloVhKoOTGjuetuYDS0P3wBIiN8wI9vdMxVwFtCunn
        1SMRH4EUxVODSolzOmn62RrVCQiOla0=
X-Google-Smtp-Source: ABdhPJy0xT8chEkMRJ9zn89W3DKMbmadligdwtxP8bcSRx1Ij6L+mZcyYGfB7lznIWMOTy24VtvXUg==
X-Received: by 2002:a7b:c21a:: with SMTP id x26mr4422565wmi.82.1589977955817;
        Wed, 20 May 2020 05:32:35 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id g6sm2649861wrp.75.2020.05.20.05.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 05:32:35 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/2] Fix role-switch selection in type-c drivers
Date:   Wed, 20 May 2020 13:33:10 +0100
Message-Id: <20200520123312.320281-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A recent change to the typs6598x resulted in a link-time error caught by
kbuild. The first patch fixes that error, however since it is not included
in stable yet, it carries no fixes tag.

In trying to fix the typs6598x error, the first thing I did was try to take
the same fix, for the same error that had been applied to the hd3ss3220
but, I could still configure my kernel and produce the same link-time error
with the tps6598x.

I did a quick grep and saw that everywhere else we were doing "select
USB_ROLE_SWITCH" not "depends on USB_ROLE_SWITCH".

Using select fixes the error for me on tps6598x so I've also rolled the
same fix into the hd3ss3220 because it looks like the right thing to do
there also.

Bryan O'Donoghue (2):
  usb: typec: Ensure USB_ROLE_SWITCH is selected for tps6598x
  usb: typec: Ensure USB_ROLE_SWITCH is selected for hd3ss3220

 drivers/usb/typec/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1


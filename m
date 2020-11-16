Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B812B48FC
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 16:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729569AbgKPPTU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 10:19:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbgKPPTU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 10:19:20 -0500
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F50AC0613CF
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 07:19:20 -0800 (PST)
Received: by mail-qt1-x842.google.com with SMTP id z3so9476472qtw.9
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 07:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1JYNaNTnu3vPVR3xT9Z+J0aV2vGsiryJdYA8z+h9/34=;
        b=diOlooUNDuYmi+fnNlG0Vq5+YtzuOx83O6bL9DGuNZACce0bhCiLymF7DhbHm5obLI
         15ceY5D3IUs6a5QvZXnGjLNvYscrP5YibdMylmFQzb19C22YkcVw5eC7m07XpcuT6Y/V
         YxK9+CQ4IYHRc8QNWEVNQQeNd3eEHqpn905ei86t7ISoZhLE0gCE6DG4Ip92yK+1k3P4
         OYtA1Rs4tn3K73eI8pgW5iEkQ+wZBDbeajmhJy7wwgNZUC6hEx40v5J8c/T8ewyXMqIw
         Nrucnhy/61W5Zgb99wnQG/QSygYMTwl9XX+fMarz72Cb2bLWb8lVFRC1YDHRrFHpC02S
         DAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1JYNaNTnu3vPVR3xT9Z+J0aV2vGsiryJdYA8z+h9/34=;
        b=t1Z633yI5cufFJc3YxPgZ8Mbu1ajzB0aE0b5l9aouWkGs54k7UyCwvJp0dMsu9rHxX
         +FjkjtT05KhsfniKaqBegQrAv6vRCU+YCLMLcznG45czY7EParnjM1RQApcHaTkOATKL
         1KfNx/u2DaOq+vB5YM42mADpvN079QVgUJOTlPIgSQ7gB9FDJGIY93fx7oETSbx4X3aH
         tpt/R1ArhZayJHFDwJyLqHsKzijItYzTLDGyhGZwTXExxmnJv2FZpuYqEPeKbfhdlySz
         92JEAr/epuGdW6NaCHDEhcZROdg4giA8aVS5XvC4T72d3YRCZVdk/MGMf2VboeB49Hl9
         Bt8A==
X-Gm-Message-State: AOAM530YanihSMEc2NQ5F8U+qm0u9zXWmUbMoKF7O3zRzp3DuiCEEAr2
        kO4M6BTSR6cgIzqk31IK+aM=
X-Google-Smtp-Source: ABdhPJx7LTOSZdE8ZWa96WQnBV72zX8iYkKMf13WE/IksKdCC+Bk7uN0Iu2Anwshw9nvQ2ojFUZX4w==
X-Received: by 2002:ac8:734a:: with SMTP id q10mr14366473qtp.389.1605539959395;
        Mon, 16 Nov 2020 07:19:19 -0800 (PST)
Received: from rockpro64.sparksnet ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id p127sm12216818qkc.37.2020.11.16.07.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 07:19:18 -0800 (PST)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, wulf@rock-chips.com,
        frank.wang@rock-chips.com, william.wu@rock-chips.com,
        zyw@rock-chips.com, kever.yang@rock-chips.com,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 0/4] [RFC] rk3328 usb3 phy driver
Date:   Mon, 16 Nov 2020 15:17:32 +0000
Message-Id: <20201116151735.178737-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Good Day,

This is an RFC requesting feedback on a driver for the bugged usb3 phy used in the rk3328 soc.

The innosilicon based usb3 phy used in rockchip devices such as the rk3328 is bugged, requiring special handling.
The following erata have been observed:
 - usb3 device disconnect events are not detected by the controller
 - usb2 hubs with no devices attached do not trigger disconnect events when removed
 - interrupts are not reliable

To work around these issues we implement polling of the usb2 and usb3 status.
On usb3 disconnection we reset the usb3 phy which triggers the disconnect event.
On usb2 disconnection we have to force reset the whole controller.
This requires a handoff to a special dwc3 device driver.

I wanted to be able to implement the usb2 fix completely in the phy driver.
Unfortunately I was unable to find a fix for it.
I also was unable to find a method for the phy driver to trigger a controller reset without the special glue.
If anyone has any suggestions for this, please let me know.

This has been tested on the rk3328-roc-cc board with the following devices:
 - usb2 only device
 - usb3 only device
 - usb2 only hub without devices
 - usb3 hub without devices
 - usb2 hub with devices
 - usb3 hub with devices

Peter Geis (4):
  phy: rockchip: add rockchip usb3 innosilicon phy driver
  usb: dwc3: add rockchip innosilicon usb3 glue layer
  arm64: dts: rockchip: add rk3328 usb3 and usb3phy nodes
  arm64: dts: rockchip: enable usb3 on rk3328-roc-cc board

 .../arm64/boot/dts/rockchip/rk3328-roc-cc.dts |  21 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi      |  65 +++
 drivers/phy/rockchip/Kconfig                  |   9 +
 drivers/phy/rockchip/Makefile                 |   1 +
 drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 425 ++++++++++++++++++
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-rockchip-inno.c         | 271 +++++++++++
 8 files changed, 803 insertions(+)
 create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c
 create mode 100644 drivers/usb/dwc3/dwc3-rockchip-inno.c

-- 
2.25.1


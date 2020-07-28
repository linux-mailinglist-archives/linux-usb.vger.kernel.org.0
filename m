Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95E84230E5A
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 17:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731062AbgG1Pri (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 11:47:38 -0400
Received: from out28-195.mail.aliyun.com ([115.124.28.195]:43731 "EHLO
        out28-195.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730764AbgG1Pri (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Jul 2020 11:47:38 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08048971|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0529541-0.000641783-0.946404;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03305;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=2;RT=2;SR=0;TI=SMTPD_---.I8tW2LB_1595951252;
Received: from 192.168.10.205(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I8tW2LB_1595951252)
          by smtp.aliyun-inc.com(10.147.42.198);
          Tue, 28 Jul 2020 23:47:33 +0800
Subject: Re: [bug report] USB: PHY: JZ4770: Add support for new Ingenic SoCs.
To:     dan.carpenter@oracle.com
Cc:     linux-usb@vger.kernel.org
References: <20200728115148.GA425911@mwanda>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <f066b80a-8696-2324-6137-a53b6f9273d1@wanyeetech.com>
Date:   Tue, 28 Jul 2020 23:47:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20200728115148.GA425911@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

在 2020/7/28 下午7:51, dan.carpenter@oracle.com 写道:
> Hello 周琰杰 (Zhou Yanjie),
>
> The patch 2a6c0b82e651: "USB: PHY: JZ4770: Add support for new
> Ingenic SoCs." from Jul 23, 2020, leads to the following static
> checker warning:
>
> 	drivers/usb/phy/phy-jz4770.c:179 ingenic_usb_phy_init()
> 	error: uninitialized symbol 'reg'.
>
> drivers/usb/phy/phy-jz4770.c
>     157  static int ingenic_usb_phy_init(struct usb_phy *phy)
>     158  {
>     159          struct jz4770_phy *priv = phy_to_jz4770_phy(phy);
>     160          int err;
>     161          u32 reg;
>                      ^^^
>     162
>     163          err = regulator_enable(priv->vcc_supply);
>     164          if (err) {
>     165                  dev_err(priv->dev, "Unable to enable VCC: %d\n", err);
>     166                  return err;
>     167          }
>     168
>     169          err = clk_prepare_enable(priv->clk);
>     170          if (err) {
>     171                  dev_err(priv->dev, "Unable to start clock: %d\n", err);
>     172                  return err;
>     173          }
>     174
>     175          priv->soc_info->usb_phy_init(phy);
>     176
>     177          /* Wait for PHY to reset */
>     178          usleep_range(30, 300);
>     179          writel(reg & ~USBPCR_POR, priv->base + REG_USBPCR_OFFSET);
>                         ^^^
> Not initialized any more.
>
>     180          usleep_range(300, 1000);
>     181
>     182          return 0;
>     183  }
>
> regards,
> dan carpenter

Thanks for report this, I will fix this soon.

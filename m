Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E593230D86
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 17:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730766AbgG1PR0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 11:17:26 -0400
Received: from out28-123.mail.aliyun.com ([115.124.28.123]:58492 "EHLO
        out28-123.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730640AbgG1PRZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Jul 2020 11:17:25 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0609265-0.037852-0.901221;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03298;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=19;RT=19;SR=0;TI=SMTPD_---.I8syEVZ_1595949426;
Received: from 192.168.10.205(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I8syEVZ_1595949426)
          by smtp.aliyun-inc.com(10.147.41.120);
          Tue, 28 Jul 2020 23:17:07 +0800
Subject: Re: [PATCH RESEND v6 5/5] USB: PHY: JZ4770: Use the generic PHY
 framework.
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, prasannatsmkumar@gmail.com,
        kishon@ti.com, vkoul@kernel.org, gor@linux.ibm.com,
        hca@linux.ibm.com, christophe.jaillet@wanadoo.fr,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
References: <20200725073327.64216-1-zhouyanjie@wanyeetech.com>
 <2201EQ.3JVH7TJO4AV3@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <bd67da4b-61b1-dcc0-7ae9-6e348efc2f9b@wanyeetech.com>
Date:   Tue, 28 Jul 2020 23:17:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <2201EQ.3JVH7TJO4AV3@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Paul,

在 2020/7/25 下午8:58, Paul Cercueil 写道:
> Hi Zhou,
>
> I'm a bit lost in all these JZ4770 PHY patchsets...
>
> Anyway, the move from drivers/usb/phy to drivers/phy should be done 
> before adding anything else to the driver, so right after the 
> devicetree change. Here, your patch modifies things that were just 
> introduced in the previous patches; that adds a lot of noise for 
> nothing and is harder to review.
>
> If you really want to rename the function names and comments from 
> jz4770_phy* to ingenic_usb_phy*, you can do it afterwards, within your 
> current "unify code style" patch. Then add the patch to reformat the 
> macros, and then finally finish the patchset by adding support for the 
> new SoCs, because right now the macros introduced in the "add SoCs" 
> patch are modified in the "reformat macros" patch.
>
> So I think you got the content right, just some reordering to do.
>

Sorry for the delay caused by the mailbox failure. Now the first four 
patches have been merged into next. I think I need to make a new patch 
to move the driver to drivers/phy/

Thanks and best regards!


>
> Le sam. 25 juil. 2020 à 15:33, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Used the generic PHY framework API to create the PHY,
>> and move the driver to driver/phy/ingenic.
>>
>> Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
>> Suggested-by: Felipe Balbi <balbi@kernel.org>
>> Co-developed-by: 漆鹏振 (Qi Pengzhen) <aric.pzqi@ingenic.com>
>> Signed-off-by: 漆鹏振 (Qi Pengzhen) <aric.pzqi@ingenic.com>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>
>> Notes:
>>     v6:
>>     New patch.
>>
>>  drivers/phy/Kconfig                                |   1 +
>>  drivers/phy/Makefile                               |   1 +
>>  drivers/phy/ingenic/Kconfig                        |  12 ++
>>  drivers/phy/ingenic/Makefile                       |   2 +
>>  .../phy-jz4770.c => phy/ingenic/phy-ingenic-usb.c} | 208 
>> ++++++++++++---------
>>  drivers/usb/phy/Kconfig                            |   8 -
>>  drivers/usb/phy/Makefile                           |   1 -
>>  7 files changed, 134 insertions(+), 99 deletions(-)
>>  create mode 100644 drivers/phy/ingenic/Kconfig
>>  create mode 100644 drivers/phy/ingenic/Makefile
>>  rename drivers/{usb/phy/phy-jz4770.c => 
>> phy/ingenic/phy-ingenic-usb.c} (67%)
>>
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index b3ed94b98d9b..96d7bb85f595 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -55,6 +55,7 @@ source "drivers/phy/broadcom/Kconfig"
>>  source "drivers/phy/cadence/Kconfig"
>>  source "drivers/phy/freescale/Kconfig"
>>  source "drivers/phy/hisilicon/Kconfig"
>> +source "drivers/phy/ingenic/Kconfig"
>>  source "drivers/phy/lantiq/Kconfig"
>>  source "drivers/phy/marvell/Kconfig"
>>  source "drivers/phy/mediatek/Kconfig"
>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>> index 310c149a9df5..0f88724b4387 100644
>> --- a/drivers/phy/Makefile
>> +++ b/drivers/phy/Makefile
>> @@ -18,6 +18,7 @@ obj-y                    += broadcom/    \
>>                         cadence/    \
>>                         freescale/    \
>>                         hisilicon/    \
>> +                       ingenic/    \
>>                         intel/    \
>>                         lantiq/    \
>>                         marvell/    \
>> diff --git a/drivers/phy/ingenic/Kconfig b/drivers/phy/ingenic/Kconfig
>> new file mode 100644
>> index 000000000000..b9581eae89dd
>> --- /dev/null
>> +++ b/drivers/phy/ingenic/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +#
>> +# Phy drivers for Ingenic platforms
>> +#
>> +config PHY_INGENIC_USB
>> +    tristate "Ingenic SoCs USB PHY Driver"
>> +    depends on (MACH_INGENIC && MIPS) || COMPILE_TEST
>> +    depends on USB_SUPPORT
>> +    select GENERIC_PHY
>> +    help
>> +      This driver provides USB PHY support for the USB controller found
>> +      on the JZ-series and X-series SoCs from Ingenic.
>> diff --git a/drivers/phy/ingenic/Makefile b/drivers/phy/ingenic/Makefile
>> new file mode 100644
>> index 000000000000..65d5ea00fc9d
>> --- /dev/null
>> +++ b/drivers/phy/ingenic/Makefile
>> @@ -0,0 +1,2 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +obj-y        += phy-ingenic-usb.o
>> diff --git a/drivers/usb/phy/phy-jz4770.c 
>> b/drivers/phy/ingenic/phy-ingenic-usb.c
>> similarity index 67%
>> rename from drivers/usb/phy/phy-jz4770.c
>> rename to drivers/phy/ingenic/phy-ingenic-usb.c
>> index 23d38cbc150e..c43d53b235d3 100644
>> --- a/drivers/usb/phy/phy-jz4770.c
>> +++ b/drivers/phy/ingenic/phy-ingenic-usb.c
>> @@ -7,12 +7,12 @@
>>   */
>>
>>  #include <linux/clk.h>
>> +#include <linux/delay.h>
>>  #include <linux/io.h>
>>  #include <linux/module.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/regulator/consumer.h>
>> -#include <linux/usb/otg.h>
>> -#include <linux/usb/phy.h>
>> +#include <linux/phy/phy.h>
>>
>>  /* OTGPHY register offsets */
>>  #define REG_USBPCR_OFFSET            0x00
>> @@ -97,66 +97,48 @@ enum ingenic_usb_phy_version {
>>  struct ingenic_soc_info {
>>      enum ingenic_usb_phy_version version;
>>
>> -    void (*usb_phy_init)(struct usb_phy *phy);
>> +    void (*usb_phy_init)(struct phy *phy);
>>  };
>>
>> -struct jz4770_phy {
>> +struct ingenic_usb_phy {
>>      const struct ingenic_soc_info *soc_info;
>>
>> -    struct usb_phy phy;
>> -    struct usb_otg otg;
>> +    struct phy *phy;
>>      struct device *dev;
>>      void __iomem *base;
>>      struct clk *clk;
>>      struct regulator *vcc_supply;
>>  };
>>
>> -static inline struct jz4770_phy *otg_to_jz4770_phy(struct usb_otg *otg)
>> +static int ingenic_usb_phy_init(struct phy *phy)
>>  {
>> -    return container_of(otg, struct jz4770_phy, otg);
>> -}
>> -
>> -static inline struct jz4770_phy *phy_to_jz4770_phy(struct usb_phy *phy)
>> -{
>> -    return container_of(phy, struct jz4770_phy, phy);
>> -}
>> -
>> -static int ingenic_usb_phy_set_peripheral(struct usb_otg *otg,
>> -                     struct usb_gadget *gadget)
>> -{
>> -    struct jz4770_phy *priv = otg_to_jz4770_phy(otg);
>> -    u32 reg;
>> +    struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
>> +    int err;
>>
>> -    if (priv->soc_info->version >= ID_X1000) {
>> -        reg = readl(priv->base + REG_USBPCR1_OFFSET);
>> -        reg |= USBPCR1_BVLD_REG;
>> -        writel(reg, priv->base + REG_USBPCR1_OFFSET);
>> +    err = clk_prepare_enable(priv->clk);
>> +    if (err) {
>> +        dev_err(priv->dev, "Unable to start clock: %d\n", err);
>> +        return err;
>>      }
>>
>> -    reg = readl(priv->base + REG_USBPCR_OFFSET);
>> -    reg &= ~USBPCR_USB_MODE;
>> -    reg |= USBPCR_VBUSVLDEXT | USBPCR_VBUSVLDEXTSEL | 
>> USBPCR_OTG_DISABLE;
>> -    writel(reg, priv->base + REG_USBPCR_OFFSET);
>> +    priv->soc_info->usb_phy_init(phy);
>>
>>      return 0;
>>  }
>>
>> -static int ingenic_usb_phy_set_host(struct usb_otg *otg, struct 
>> usb_bus *host)
>> +static int ingenic_usb_phy_exit(struct phy *phy)
>>  {
>> -    struct jz4770_phy *priv = otg_to_jz4770_phy(otg);
>> -    u32 reg;
>> +    struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
>>
>> -    reg = readl(priv->base + REG_USBPCR_OFFSET);
>> -    reg &= ~(USBPCR_VBUSVLDEXT | USBPCR_VBUSVLDEXTSEL | 
>> USBPCR_OTG_DISABLE);
>> -    reg |= USBPCR_USB_MODE;
>> -    writel(reg, priv->base + REG_USBPCR_OFFSET);
>> +    clk_disable_unprepare(priv->clk);
>> +    regulator_disable(priv->vcc_supply);
>>
>>      return 0;
>>  }
>>
>> -static int ingenic_usb_phy_init(struct usb_phy *phy)
>> +static int ingenic_usb_phy_power_on(struct phy *phy)
>>  {
>> -    struct jz4770_phy *priv = phy_to_jz4770_phy(phy);
>> +    struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
>>      int err;
>>
>>      err = regulator_enable(priv->vcc_supply);
>> @@ -165,33 +147,71 @@ static int ingenic_usb_phy_init(struct usb_phy 
>> *phy)
>>          return err;
>>      }
>>
>> -    err = clk_prepare_enable(priv->clk);
>> -    if (err) {
>> -        dev_err(priv->dev, "Unable to start clock: %d\n", err);
>> -        return err;
>> -    }
>> -
>> -    priv->soc_info->usb_phy_init(phy);
>> -
>>      return 0;
>>  }
>>
>> -static void ingenic_usb_phy_shutdown(struct usb_phy *phy)
>> +static int ingenic_usb_phy_power_off(struct phy *phy)
>>  {
>> -    struct jz4770_phy *priv = phy_to_jz4770_phy(phy);
>> +    struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
>>
>> -    clk_disable_unprepare(priv->clk);
>>      regulator_disable(priv->vcc_supply);
>> +
>> +    return 0;
>>  }
>>
>> -static void ingenic_usb_phy_remove(void *phy)
>> +static int ingenic_usb_phy_set_mode(struct phy *phy,
>> +                  enum phy_mode mode, int submode)
>>  {
>> -    usb_remove_phy(phy);
>> +    struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
>> +    u32 reg;
>> +
>> +    switch (mode) {
>> +    case PHY_MODE_USB_HOST:
>> +        reg = readl(priv->base + REG_USBPCR_OFFSET);
>> +        reg &= ~(USBPCR_VBUSVLDEXT | USBPCR_VBUSVLDEXTSEL | 
>> USBPCR_OTG_DISABLE);
>> +        reg |= USBPCR_USB_MODE;
>> +        writel(reg, priv->base + REG_USBPCR_OFFSET);
>> +
>> +        break;
>> +    case PHY_MODE_USB_DEVICE:
>> +        if (priv->soc_info->version >= ID_X1000) {
>> +            reg = readl(priv->base + REG_USBPCR1_OFFSET);
>> +            reg |= USBPCR1_BVLD_REG;
>> +            writel(reg, priv->base + REG_USBPCR1_OFFSET);
>> +        }
>> +
>> +        reg = readl(priv->base + REG_USBPCR_OFFSET);
>> +        reg &= ~USBPCR_USB_MODE;
>> +        reg |= USBPCR_VBUSVLDEXT | USBPCR_VBUSVLDEXTSEL | 
>> USBPCR_OTG_DISABLE;
>> +        writel(reg, priv->base + REG_USBPCR_OFFSET);
>> +
>> +        break;
>> +    case PHY_MODE_USB_OTG:
>> +        reg = readl(priv->base + REG_USBPCR_OFFSET);
>> +        reg &= ~USBPCR_OTG_DISABLE;
>> +        reg |= USBPCR_VBUSVLDEXT | USBPCR_VBUSVLDEXTSEL | 
>> USBPCR_USB_MODE;
>> +        writel(reg, priv->base + REG_USBPCR_OFFSET);
>> +
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>>  }
>>
>> -static void jz4770_usb_phy_init(struct usb_phy *phy)
>> +static const struct phy_ops ingenic_usb_phy_ops = {
>> +    .init        = ingenic_usb_phy_init,
>> +    .exit        = ingenic_usb_phy_exit,
>> +    .power_on    = ingenic_usb_phy_power_on,
>> +    .power_off    = ingenic_usb_phy_power_off,
>> +    .set_mode    = ingenic_usb_phy_set_mode,
>> +    .owner        = THIS_MODULE,
>> +};
>> +
>> +static void jz4770_usb_phy_init(struct phy *phy)
>>  {
>> -    struct jz4770_phy *priv = phy_to_jz4770_phy(phy);
>> +    struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
>>      u32 reg;
>>
>>      reg = USBPCR_AVLD_REG | USBPCR_COMMONONN | USBPCR_IDPULLUP_ALWAYS |
>> @@ -206,9 +226,9 @@ static void jz4770_usb_phy_init(struct usb_phy *phy)
>>      usleep_range(300, 1000);
>>  }
>>
>> -static void jz4780_usb_phy_init(struct usb_phy *phy)
>> +static void jz4780_usb_phy_init(struct phy *phy)
>>  {
>> -    struct jz4770_phy *priv = phy_to_jz4770_phy(phy);
>> +    struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
>>      u32 reg;
>>
>>      reg = readl(priv->base + REG_USBPCR1_OFFSET) | USBPCR1_USB_SEL |
>> @@ -224,9 +244,9 @@ static void jz4780_usb_phy_init(struct usb_phy *phy)
>>      usleep_range(300, 1000);
>>  }
>>
>> -static void x1000_usb_phy_init(struct usb_phy *phy)
>> +static void x1000_usb_phy_init(struct phy *phy)
>>  {
>> -    struct jz4770_phy *priv = phy_to_jz4770_phy(phy);
>> +    struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
>>      u32 reg;
>>
>>      reg = readl(priv->base + REG_USBPCR1_OFFSET) | 
>> USBPCR1_WORD_IF_16BIT;
>> @@ -243,9 +263,9 @@ static void x1000_usb_phy_init(struct usb_phy *phy)
>>      usleep_range(300, 1000);
>>  }
>>
>> -static void x1830_usb_phy_init(struct usb_phy *phy)
>> +static void x1830_usb_phy_init(struct phy *phy)
>>  {
>> -    struct jz4770_phy *priv = phy_to_jz4770_phy(phy);
>> +    struct ingenic_usb_phy *priv = phy_get_drvdata(phy);
>>      u32 reg;
>>
>>      /* rdt */
>> @@ -298,75 +318,83 @@ static const struct of_device_id 
>> ingenic_usb_phy_of_matches[] = {
>>  };
>>  MODULE_DEVICE_TABLE(of, ingenic_usb_phy_of_matches);
>>
>> -static int jz4770_phy_probe(struct platform_device *pdev)
>> +static int ingenic_usb_phy_probe(struct platform_device *pdev)
>>  {
>> -    struct device *dev = &pdev->dev;
>> -    struct jz4770_phy *priv;
>> +    struct ingenic_usb_phy *priv;
>> +    struct phy_provider *provider;
>>      int err;
>>
>> -    priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +    priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>>      if (!priv)
>>          return -ENOMEM;
>>
>> +    priv->dev = &pdev->dev;
>> +
>>      priv->soc_info = device_get_match_data(&pdev->dev);
>>      if (!priv->soc_info) {
>>          dev_err(&pdev->dev, "Error: No device match found\n");
>>          return -ENODEV;
>>      }
>>
>> -    platform_set_drvdata(pdev, priv);
>> -    priv->dev = dev;
>> -    priv->phy.dev = dev;
>> -    priv->phy.otg = &priv->otg;
>> -    priv->phy.label = "ingenic-usb-phy";
>> -    priv->phy.init = ingenic_usb_phy_init;
>> -    priv->phy.shutdown = ingenic_usb_phy_shutdown;
>> -
>> -    priv->otg.state = OTG_STATE_UNDEFINED;
>> -    priv->otg.usb_phy = &priv->phy;
>> -    priv->otg.set_host = ingenic_usb_phy_set_host;
>> -    priv->otg.set_peripheral = ingenic_usb_phy_set_peripheral;
>> -
>>      priv->base = devm_platform_ioremap_resource(pdev, 0);
>>      if (IS_ERR(priv->base)) {
>> -        dev_err(dev, "Failed to map registers\n");
>> +        dev_err(priv->dev, "Failed to map registers\n");
>>          return PTR_ERR(priv->base);
>>      }
>>
>> -    priv->clk = devm_clk_get(dev, NULL);
>> +    priv->clk = devm_clk_get(priv->dev, NULL);
>>      if (IS_ERR(priv->clk)) {
>>          err = PTR_ERR(priv->clk);
>>          if (err != -EPROBE_DEFER)
>> -            dev_err(dev, "Failed to get clock\n");
>> +            dev_err(priv->dev, "Failed to get clock\n");
>>          return err;
>>      }
>>
>> -    priv->vcc_supply = devm_regulator_get(dev, "vcc");
>> +    priv->vcc_supply = devm_regulator_get(priv->dev, "vcc");
>>      if (IS_ERR(priv->vcc_supply)) {
>>          err = PTR_ERR(priv->vcc_supply);
>>          if (err != -EPROBE_DEFER)
>> -            dev_err(dev, "Failed to get regulator\n");
>> +            dev_err(priv->dev, "Failed to get regulator\n");
>>          return err;
>>      }
>>
>> -    err = usb_add_phy(&priv->phy, USB_PHY_TYPE_USB2);
>> -    if (err) {
>> -        if (err != -EPROBE_DEFER)
>> -            dev_err(dev, "Unable to register PHY\n");
>> -        return err;
>> +    priv->phy = devm_phy_create(priv->dev, NULL, &ingenic_usb_phy_ops);
>> +    if (IS_ERR(priv)) {
>> +        dev_err(priv->dev, "Failed to create PHY: %ld\n", 
>> PTR_ERR(priv));
>> +        return PTR_ERR(priv);
>>      }
>>
>> -    return devm_add_action_or_reset(dev, ingenic_usb_phy_remove, 
>> &priv->phy);
>> +    provider = devm_of_phy_provider_register(priv->dev, 
>> of_phy_simple_xlate);
>> +    if (IS_ERR(provider)) {
>> +        dev_err(priv->dev, "Failed to register PHY provider: %ld\n", 
>> PTR_ERR(provider));
>> +        return PTR_ERR(provider);
>> +    }
>> +
>> +    platform_set_drvdata(pdev, priv);
>> +    phy_set_drvdata(priv->phy, priv);
>> +
>> +    return 0;
>> +}
>> +
>> +static int ingenic_usb_phy_remove(struct platform_device *pdev)
>> +{
>> +    struct ingenic_usb_phy *priv = platform_get_drvdata(pdev);
>> +
>> +    clk_disable_unprepare(priv->clk);
>> +    regulator_disable(priv->vcc_supply);
>> +
>> +    return 0;
>>  }
>>
>> -static struct platform_driver ingenic_phy_driver = {
>> -    .probe        = jz4770_phy_probe,
>> +static struct platform_driver ingenic_usb_phy_driver = {
>> +    .probe        = ingenic_usb_phy_probe,
>> +    .remove        = ingenic_usb_phy_remove,
>>      .driver        = {
>> -        .name    = "jz4770-phy",
>> +        .name    = "ingenic-usb-phy",
>>          .of_match_table = of_match_ptr(ingenic_usb_phy_of_matches),
>>      },
>>  };
>> -module_platform_driver(ingenic_phy_driver);
>> +module_platform_driver(ingenic_usb_phy_driver);
>>
>>  MODULE_AUTHOR("周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>");
>>  MODULE_AUTHOR("漆鹏振 (Qi Pengzhen) <aric.pzqi@ingenic.com>");
>
> Finally, because of the renaming, the module name changed. To keep 
> compatibility with userspace, I think you need to add a 
> MODULE_ALIAS(jz4770_phy) here (but I'm not sure and maybe someone else 
> should confirm that).
>
> Cheers,
> -Paul
>
>> diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
>> index ef4787cd3d37..ff24fca0a2d9 100644
>> --- a/drivers/usb/phy/Kconfig
>> +++ b/drivers/usb/phy/Kconfig
>> @@ -184,12 +184,4 @@ config USB_ULPI_VIEWPORT
>>        Provides read/write operations to the ULPI phy register set for
>>        controllers with a viewport register (e.g. Chipidea/ARC 
>> controllers).
>>
>> -config JZ4770_PHY
>> -    tristate "Ingenic SoCs Transceiver Driver"
>> -    depends on MIPS || COMPILE_TEST
>> -    select USB_PHY
>> -    help
>> -      This driver provides PHY support for the USB controller found
>> -      on the JZ-series and X-series SoCs from Ingenic.
>> -
>>  endmenu
>> diff --git a/drivers/usb/phy/Makefile b/drivers/usb/phy/Makefile
>> index b352bdbe8712..df1d99010079 100644
>> --- a/drivers/usb/phy/Makefile
>> +++ b/drivers/usb/phy/Makefile
>> @@ -24,4 +24,3 @@ obj-$(CONFIG_USB_MXS_PHY)        += phy-mxs-usb.o
>>  obj-$(CONFIG_USB_ULPI)            += phy-ulpi.o
>>  obj-$(CONFIG_USB_ULPI_VIEWPORT)        += phy-ulpi-viewport.o
>>  obj-$(CONFIG_KEYSTONE_USB_PHY)        += phy-keystone.o
>> -obj-$(CONFIG_JZ4770_PHY)        += phy-jz4770.o
>> -- 
>> 2.11.0
>

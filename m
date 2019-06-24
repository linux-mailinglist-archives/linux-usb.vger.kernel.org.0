Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 797E45000C
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2019 05:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfFXDJS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Jun 2019 23:09:18 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:42240 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbfFXDJS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Jun 2019 23:09:18 -0400
Received: by mail-io1-f65.google.com with SMTP id u19so312048ior.9;
        Sun, 23 Jun 2019 20:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ka07R5MBT3qdEd4LNE8j7RfXe7ufFgvDbzjplApYGDA=;
        b=Bp1zH7h0J+eGgC3P+i4bMVJyd2LukoGYodB+H5UZMi5tdMreUQdPTHgdo2TFZrvw1k
         eaIGIgKJWJOMqn1jpJOfjMVu098KpasLedWXQKczMCbH/ubVYedYlbyRad/WYAP52ux7
         KnH6/0tS1v9GjlZH5Bkcl2YgSlzINeUs1wwbFKlf5YgK0YLsTaueAb5Ocqm2ZL6ixLCO
         IlkHx0HXzw5etMNDr0fWOh/IuJPwuaGdxrNET9NG10nZstH94SDC09PwiSodONizJAef
         cnCgVALxraWfqpnOFHcmXM+HsAN7I8NzI0hwK6ra62hJeKuBkCIU5yXAIBH4tSmXexlL
         oTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ka07R5MBT3qdEd4LNE8j7RfXe7ufFgvDbzjplApYGDA=;
        b=hfpkNbniQTKn94OYRgbDchIgUI/bDBpAskszQ4tnOMt6sg1B284QQPf9WuPFeN22Gq
         G2iChtbJofMyg18tWvhjPoA3SwNxGMcPhhEshKY9bN5wEdv+yiU1+ZFanSv51YTKT1xh
         rvZRiPlRydh/T1w00z9BNWvJ3+0k1Q/knSRt1QDmB7YXC0NNWlGaFoGDM5BYXQa3z/ME
         H71ySA74JxKx/ABHeQcI17hk5U1QCAmVOIAxP6kGsMyBnHswWsD4mSke4IotLZiwb84B
         0BEAXRf0GbVnN2TTMkqmse1g+MNZRi/Jy4ZPo3Gnf4cRj5CCwwHzKCCYhzLBPhpyfcyt
         Qatw==
X-Gm-Message-State: APjAAAUY38zg1SHa1AkU2CpogQvaX/5dOQgGvRTSIEzamtp9IrYao38m
        a9uoIiKauy/HbkNMWvP4IoedzGhnGPzeDzAMQpk=
X-Google-Smtp-Source: APXvYqxD8VGTjTK70nPC+63PvSZM6zUi+XqoRijUjB177Z58G/jcQot2k6naC5+rm52XUaWVX7MD6cP0JiCc0XP1U6c=
X-Received: by 2002:a02:6516:: with SMTP id u22mr23229404jab.49.1561345757250;
 Sun, 23 Jun 2019 20:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190624020258.21690-1-peter.chen@nxp.com> <20190624020258.21690-3-peter.chen@nxp.com>
In-Reply-To: <20190624020258.21690-3-peter.chen@nxp.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Mon, 24 Jun 2019 11:09:05 +0800
Message-ID: <CAL411-r_=44bAi6zupcM7cG7-ivcEH_Mu3YYffoE8Ve0d+xqRg@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] usb: phy: phy-mxs-usb: add imx7ulp support
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        fabio.estevam@nxp.com, kernel@pengutronix.de,
        devicetree@vger.kernel.org, aisheng.dong@nxp.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        USB list <linux-usb@vger.kernel.org>,
        chunfeng.yun@mediatek.com, sergei.shtylyov@cogentembedded.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> At imx7ulp, the USB related analog register is located in PHY register
> region too, so we need to control PLL at PHY driver directly.
>

Hi Felipe,

Would you please have a review for Patch 1 and Patch 2 in this series?
Thanks.

Peter

> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 67 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 6fa16ab31e2e..70b8c8248caf 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -17,9 +17,11 @@
>  #include <linux/of_device.h>
>  #include <linux/regmap.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/iopoll.h>
>
>  #define DRIVER_NAME "mxs_phy"
>
> +/* Register Macro */
>  #define HW_USBPHY_PWD                          0x00
>  #define HW_USBPHY_TX                           0x10
>  #define HW_USBPHY_CTRL                         0x30
> @@ -37,6 +39,11 @@
>  #define GM_USBPHY_TX_TXCAL45DN(x)            (((x) & 0xf) << 8)
>  #define GM_USBPHY_TX_D_CAL(x)                (((x) & 0xf) << 0)
>
> +/* imx7ulp */
> +#define HW_USBPHY_PLL_SIC                      0xa0
> +#define HW_USBPHY_PLL_SIC_SET                  0xa4
> +#define HW_USBPHY_PLL_SIC_CLR                  0xa8
> +
>  #define BM_USBPHY_CTRL_SFTRST                  BIT(31)
>  #define BM_USBPHY_CTRL_CLKGATE                 BIT(30)
>  #define BM_USBPHY_CTRL_OTG_ID_VALUE            BIT(27)
> @@ -55,6 +62,12 @@
>  #define BM_USBPHY_IP_FIX                       (BIT(17) | BIT(18))
>
>  #define BM_USBPHY_DEBUG_CLKGATE                        BIT(30)
> +/* imx7ulp */
> +#define BM_USBPHY_PLL_LOCK                     BIT(31)
> +#define BM_USBPHY_PLL_REG_ENABLE               BIT(21)
> +#define BM_USBPHY_PLL_BYPASS                   BIT(16)
> +#define BM_USBPHY_PLL_POWER                    BIT(12)
> +#define BM_USBPHY_PLL_EN_USB_CLKS              BIT(6)
>
>  /* Anatop Registers */
>  #define ANADIG_ANA_MISC0                       0x150
> @@ -168,6 +181,9 @@ static const struct mxs_phy_data imx6ul_phy_data = {
>         .flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
>  };
>
> +static const struct mxs_phy_data imx7ulp_phy_data = {
> +};
> +
>  static const struct of_device_id mxs_phy_dt_ids[] = {
>         { .compatible = "fsl,imx6sx-usbphy", .data = &imx6sx_phy_data, },
>         { .compatible = "fsl,imx6sl-usbphy", .data = &imx6sl_phy_data, },
> @@ -175,6 +191,7 @@ static const struct of_device_id mxs_phy_dt_ids[] = {
>         { .compatible = "fsl,imx23-usbphy", .data = &imx23_phy_data, },
>         { .compatible = "fsl,vf610-usbphy", .data = &vf610_phy_data, },
>         { .compatible = "fsl,imx6ul-usbphy", .data = &imx6ul_phy_data, },
> +       { .compatible = "fsl,imx7ulp-usbphy", .data = &imx7ulp_phy_data, },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mxs_phy_dt_ids);
> @@ -199,6 +216,11 @@ static inline bool is_imx6sl_phy(struct mxs_phy *mxs_phy)
>         return mxs_phy->data == &imx6sl_phy_data;
>  }
>
> +static inline bool is_imx7ulp_phy(struct mxs_phy *mxs_phy)
> +{
> +       return mxs_phy->data == &imx7ulp_phy_data;
> +}
> +
>  /*
>   * PHY needs some 32K cycles to switch from 32K clock to
>   * bus (such as AHB/AXI, etc) clock.
> @@ -222,14 +244,49 @@ static void mxs_phy_tx_init(struct mxs_phy *mxs_phy)
>         }
>  }
>
> +static int mxs_phy_pll_enable(void __iomem *base, bool enable)
> +{
> +       int ret = 0;
> +
> +       if (enable) {
> +               u32 value;
> +
> +               writel(BM_USBPHY_PLL_REG_ENABLE, base + HW_USBPHY_PLL_SIC_SET);
> +               writel(BM_USBPHY_PLL_BYPASS, base + HW_USBPHY_PLL_SIC_CLR);
> +               writel(BM_USBPHY_PLL_POWER, base + HW_USBPHY_PLL_SIC_SET);
> +               ret = readl_poll_timeout(base + HW_USBPHY_PLL_SIC,
> +                       value, (value & BM_USBPHY_PLL_LOCK) != 0,
> +                       100, 10000);
> +               if (ret)
> +                       return ret;
> +
> +               writel(BM_USBPHY_PLL_EN_USB_CLKS, base +
> +                               HW_USBPHY_PLL_SIC_SET);
> +       } else {
> +               writel(BM_USBPHY_PLL_EN_USB_CLKS, base +
> +                               HW_USBPHY_PLL_SIC_CLR);
> +               writel(BM_USBPHY_PLL_POWER, base + HW_USBPHY_PLL_SIC_CLR);
> +               writel(BM_USBPHY_PLL_BYPASS, base + HW_USBPHY_PLL_SIC_SET);
> +               writel(BM_USBPHY_PLL_REG_ENABLE, base + HW_USBPHY_PLL_SIC_CLR);
> +       }
> +
> +       return ret;
> +}
> +
>  static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
>  {
>         int ret;
>         void __iomem *base = mxs_phy->phy.io_priv;
>
> +       if (is_imx7ulp_phy(mxs_phy)) {
> +               ret = mxs_phy_pll_enable(base, true);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         ret = stmp_reset_block(base + HW_USBPHY_CTRL);
>         if (ret)
> -               return ret;
> +               goto disable_pll;
>
>         /* Power up the PHY */
>         writel(0, base + HW_USBPHY_PWD);
> @@ -267,6 +324,11 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
>         mxs_phy_tx_init(mxs_phy);
>
>         return 0;
> +
> +disable_pll:
> +       if (is_imx7ulp_phy(mxs_phy))
> +               mxs_phy_pll_enable(base, false);
> +       return ret;
>  }
>
>  /* Return true if the vbus is there */
> @@ -388,6 +450,9 @@ static void mxs_phy_shutdown(struct usb_phy *phy)
>         writel(BM_USBPHY_CTRL_CLKGATE,
>                phy->io_priv + HW_USBPHY_CTRL_SET);
>
> +       if (is_imx7ulp_phy(mxs_phy))
> +               mxs_phy_pll_enable(phy->io_priv, false);
> +
>         clk_disable_unprepare(mxs_phy->clk);
>  }
>
> --
> 2.14.1
>

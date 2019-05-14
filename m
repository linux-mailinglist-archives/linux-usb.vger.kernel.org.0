Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 585CE1C46F
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2019 10:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbfENIMQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 May 2019 04:12:16 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:38761 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725899AbfENIMP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 May 2019 04:12:15 -0400
X-UUID: 1a31c88f6d4e4e1d8a3587bb10240087-20190514
X-UUID: 1a31c88f6d4e4e1d8a3587bb10240087-20190514
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 703909718; Tue, 14 May 2019 16:12:05 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 14 May
 2019 16:12:03 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 May 2019 16:12:03 +0800
Message-ID: <1557821523.10179.284.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/8] usb: phy: phy-mxs-usb: add imx7ulp support
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Peter Chen <peter.chen@nxp.com>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>
Date:   Tue, 14 May 2019 16:12:03 +0800
In-Reply-To: <20190514073529.29505-3-peter.chen@nxp.com>
References: <20190514073529.29505-1-peter.chen@nxp.com>
         <20190514073529.29505-3-peter.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2019-05-14 at 07:38 +0000, Peter Chen wrote:
> At imx7ulp, the USB related analog register is located in PHY register
> region too, so we need to control PLL at PHY driver directly.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 76 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 1b1bb0ad40c3..90c96a8e9342 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -20,6 +20,7 @@
>  
>  #define DRIVER_NAME "mxs_phy"
>  
> +/* Register Macro */
>  #define HW_USBPHY_PWD				0x00
>  #define HW_USBPHY_TX				0x10
>  #define HW_USBPHY_CTRL				0x30
> @@ -37,6 +38,11 @@
>  #define GM_USBPHY_TX_TXCAL45DN(x)            (((x) & 0xf) << 8)
>  #define GM_USBPHY_TX_D_CAL(x)                (((x) & 0xf) << 0)
>  
> +/* imx7ulp */
> +#define HW_USBPHY_PLL_SIC			0xa0
> +#define HW_USBPHY_PLL_SIC_SET			0xa4
> +#define HW_USBPHY_PLL_SIC_CLR			0xa8
> +
>  #define BM_USBPHY_CTRL_SFTRST			BIT(31)
>  #define BM_USBPHY_CTRL_CLKGATE			BIT(30)
>  #define BM_USBPHY_CTRL_OTG_ID_VALUE		BIT(27)
> @@ -55,6 +61,12 @@
>  #define BM_USBPHY_IP_FIX                       (BIT(17) | BIT(18))
>  
>  #define BM_USBPHY_DEBUG_CLKGATE			BIT(30)
> +/* imx7ulp */
> +#define BM_USBPHY_PLL_LOCK			BIT(31)
> +#define BM_USBPHY_PLL_REG_ENABLE		BIT(21)
> +#define BM_USBPHY_PLL_BYPASS			BIT(16)
> +#define BM_USBPHY_PLL_POWER			BIT(12)
> +#define BM_USBPHY_PLL_EN_USB_CLKS		BIT(6)
>  
>  /* Anatop Registers */
>  #define ANADIG_ANA_MISC0			0x150
> @@ -167,6 +179,9 @@ static const struct mxs_phy_data imx6ul_phy_data = {
>  	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
>  };
>  
> +static const struct mxs_phy_data imx7ulp_phy_data = {
> +};
> +
>  static const struct of_device_id mxs_phy_dt_ids[] = {
>  	{ .compatible = "fsl,imx6sx-usbphy", .data = &imx6sx_phy_data, },
>  	{ .compatible = "fsl,imx6sl-usbphy", .data = &imx6sl_phy_data, },
> @@ -174,6 +189,7 @@ static const struct of_device_id mxs_phy_dt_ids[] = {
>  	{ .compatible = "fsl,imx23-usbphy", .data = &imx23_phy_data, },
>  	{ .compatible = "fsl,vf610-usbphy", .data = &vf610_phy_data, },
>  	{ .compatible = "fsl,imx6ul-usbphy", .data = &imx6ul_phy_data, },
> +	{ .compatible = "fsl,imx7ulp-usbphy", .data = &imx7ulp_phy_data, },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mxs_phy_dt_ids);
> @@ -198,6 +214,11 @@ static inline bool is_imx6sl_phy(struct mxs_phy *mxs_phy)
>  	return mxs_phy->data == &imx6sl_phy_data;
>  }
>  
> +static inline bool is_imx7ulp_phy(struct mxs_phy *mxs_phy)
> +{
> +	return mxs_phy->data == &imx7ulp_phy_data;
> +}
> +
>  /*
>   * PHY needs some 32K cycles to switch from 32K clock to
>   * bus (such as AHB/AXI, etc) clock.
> @@ -221,14 +242,59 @@ static void mxs_phy_tx_init(struct mxs_phy *mxs_phy)
>  	}
>  }
>  
> +static int wait_for_pll_lock(const void __iomem *base)
> +{
> +	int loop_count = 100;
> +
> +	/* Wait for PLL to lock */
> +	do {
> +		if (readl(base + HW_USBPHY_PLL_SIC) & BM_USBPHY_PLL_LOCK)
> +			break;
> +		usleep_range(100, 150);
> +	} while (loop_count-- > 0);
> +
there is a common API readl_poll_timeout(), maybe you can try it.

> +	return readl(base + HW_USBPHY_PLL_SIC) & BM_USBPHY_PLL_LOCK
> +			? 0 : -ETIMEDOUT;
> +}
> +
> +static int mxs_phy_pll_enable(void __iomem *base, bool enable)
> +{
> +	int ret = 0;
> +
> +	if (enable) {
> +		writel(BM_USBPHY_PLL_REG_ENABLE, base + HW_USBPHY_PLL_SIC_SET);
> +		writel(BM_USBPHY_PLL_BYPASS, base + HW_USBPHY_PLL_SIC_CLR);
> +		writel(BM_USBPHY_PLL_POWER, base + HW_USBPHY_PLL_SIC_SET);
> +		ret = wait_for_pll_lock(base);
> +		if (ret)
> +			return ret;
> +		writel(BM_USBPHY_PLL_EN_USB_CLKS, base +
> +				HW_USBPHY_PLL_SIC_SET);
> +	} else {
> +		writel(BM_USBPHY_PLL_EN_USB_CLKS, base +
> +				HW_USBPHY_PLL_SIC_CLR);
> +		writel(BM_USBPHY_PLL_POWER, base + HW_USBPHY_PLL_SIC_CLR);
> +		writel(BM_USBPHY_PLL_BYPASS, base + HW_USBPHY_PLL_SIC_SET);
> +		writel(BM_USBPHY_PLL_REG_ENABLE, base + HW_USBPHY_PLL_SIC_CLR);
> +	}
> +
> +	return ret;
> +}
> +
>  static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
>  {
>  	int ret;
>  	void __iomem *base = mxs_phy->phy.io_priv;
>  
> +	if (is_imx7ulp_phy(mxs_phy)) {
> +		ret = mxs_phy_pll_enable(base, true);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = stmp_reset_block(base + HW_USBPHY_CTRL);
>  	if (ret)
> -		return ret;
> +		goto disable_pll;
>  
>  	/* Power up the PHY */
>  	writel(0, base + HW_USBPHY_PWD);
> @@ -253,6 +319,11 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
>  	mxs_phy_tx_init(mxs_phy);
>  
>  	return 0;
> +
> +disable_pll:
> +	if (is_imx7ulp_phy(mxs_phy))
> +		mxs_phy_pll_enable(base, false);
> +	return ret;
>  }
>  
>  /* Return true if the vbus is there */
> @@ -374,6 +445,9 @@ static void mxs_phy_shutdown(struct usb_phy *phy)
>  	writel(BM_USBPHY_CTRL_CLKGATE,
>  	       phy->io_priv + HW_USBPHY_CTRL_SET);
>  
> +	if (is_imx7ulp_phy(mxs_phy))
> +		mxs_phy_pll_enable(phy->io_priv, false);
> +
>  	clk_disable_unprepare(mxs_phy->clk);
>  }
>  



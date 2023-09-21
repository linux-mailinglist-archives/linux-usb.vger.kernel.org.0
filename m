Return-Path: <linux-usb+bounces-442-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC767A9AF4
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 20:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 820CC281BCC
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 18:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E584A41765;
	Thu, 21 Sep 2023 17:49:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FBE18C09
	for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 17:49:20 +0000 (UTC)
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974818B4CA
	for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 10:41:28 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6c496719a9aso458347a34.0
        for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 10:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695318088; x=1695922888; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tFFVxprksrwqfvWTMLHWDj9C1Vtk3eThbD8R/hGeAHg=;
        b=c76V6wzE0KGT9Lga14f6vZoNSTn3YZCoc8n3ugjzZKLlJJGoFln9Mbi/gHCVbdxjlG
         MU8mRm7ZJlBtA8dig/pZea5PslJzEJJBvTXZDwJ29e+ByvJPT+YQmrnVYy/hDWJbuhsA
         fZrbxnMpRGuweUVtP2wwiOgywQ5Aejl6h7tmOHp8EJnYikFR/VTtEirPB5JcIDSWWzEo
         Lsk0fabX8WaMmCJ2qkKQpuawCcJz2HnjLolhss3cexZ47/vtO46tAgbzA1X7bYe/hH6o
         t50uS6VtpIUKuZRPJkfLL3GVwstZ3L40Rn/idnl1UgqyMCKU3K6dHnASZB/tDV6tf36L
         aOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695318088; x=1695922888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFFVxprksrwqfvWTMLHWDj9C1Vtk3eThbD8R/hGeAHg=;
        b=cxOJ9iVhIQCvMw5RZfBZu9BuDBzLRjYtbJzpS/wWU/tPueDx1jUS7f7u9Fz3HBf5Ay
         Y6bJ7u/663A2xJItNs/P3gmSOhxpPqGoI+JzbyR4B7BpfII++2Kc8+3lnJHo4m1LZcSM
         IfWBPa8UCG9GYgASYg79lXhWY7Nl7ZIBV76Q1FJ7urTVhvgb1ouAeN4N0PdxmJUmFgDF
         onnvB1dK+4LgOIzhnXQ6YrOwUJExab2I7fZoo2LzLZWDY48zrc+0cdU9UOYJ7vBT0M94
         a6p1RqlEPv2xvasAYl7NFZNLpTGIz5hxbHDTbBmT0FeZYloagQmzfskTShYtuxnacWHF
         N3Uw==
X-Gm-Message-State: AOJu0YzWDiqjbiYFPWeNlbhqOw7MHLKVqJlpCaMa3SMdQosO5+egpWfk
	s24XMplHuNOjt03Hk/xBRPfLirzjQrHsUlpv2AwnevNeSp1Sim0TypLntw==
X-Google-Smtp-Source: AGHT+IGz7/ksHuE3qPdfMQrBbdhX6X/Uw+ZmF30IV57WL6nydmvFE2wtY4D4x50RgMTGPDaM0X9957VCYxwI2BmsAVI=
X-Received: by 2002:a25:b910:0:b0:d81:ce53:11e7 with SMTP id
 x16-20020a25b910000000b00d81ce5311e7mr5442415ybj.8.1695307592809; Thu, 21 Sep
 2023 07:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1695291692-18850-1-git-send-email-quic_rohiagar@quicinc.com>
 <1695291692-18850-6-git-send-email-quic_rohiagar@quicinc.com>
 <CAA8EJpqsKpcABmkR0+ciOxhohTSmhL4SSxBj6BijMVLfkMv02A@mail.gmail.com> <c7a588d0-3135-4a87-87f4-825bdcac203b@quicinc.com>
In-Reply-To: <c7a588d0-3135-4a87-87f4-825bdcac203b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Sep 2023 17:46:21 +0300
Message-ID: <CAA8EJpqf+AVYeGYunVJsknER94LW14gTE2ZdWFMh-KxhX0zGZA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] phy: qcom-qmp-usb: Add Qualcomm SDX75 USB3 PHY support
To: Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, abel.vesa@linaro.org, quic_wcheng@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, 21 Sept 2023 at 15:10, Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
>
>
> On 9/21/2023 5:36 PM, Dmitry Baryshkov wrote:
> > On Thu, 21 Sept 2023 at 13:21, Rohit Agarwal <quic_rohiagar@quicinc.com> wrote:
> >> Add support for USB3 QMP PHY found in SDX75 platform.
> >>
> >> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> >> ---
> >>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 165 ++++++++++++++++++++++++++++++++
> >>   1 file changed, 165 insertions(+)
> >>
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> >> index 2a094f2..3145814 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> >> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> >> @@ -24,6 +24,7 @@
> >>   #include "phy-qcom-qmp-pcs-misc-v4.h"
> >>   #include "phy-qcom-qmp-pcs-usb-v4.h"
> >>   #include "phy-qcom-qmp-pcs-usb-v5.h"
> >> +#include "phy-qcom-qmp-pcs-usb-v6.h"
> >>
> >>   /* QPHY_SW_RESET bit */
> >>   #define SW_RESET                               BIT(0)
> >> @@ -151,6 +152,17 @@ static const unsigned int qmp_v5_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
> >>          [QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
> >>   };
> >>
> >> +static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
> >> +       [QPHY_SW_RESET]                 = QPHY_V6_PCS_SW_RESET,
> >> +       [QPHY_START_CTRL]               = QPHY_V6_PCS_START_CONTROL,
> >> +       [QPHY_PCS_STATUS]               = QPHY_V6_PCS_PCS_STATUS1,
> >> +       [QPHY_PCS_POWER_DOWN_CONTROL]   = QPHY_V6_PCS_POWER_DOWN_CONTROL,
> >> +
> >> +       /* In PCS_USB */
> >> +       [QPHY_PCS_AUTONOMOUS_MODE_CTRL] = QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL,
> >> +       [QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
> >> +};
> >> +
> >>   static const struct qmp_phy_init_tbl ipq9574_usb3_serdes_tbl[] = {
> >>          QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x1a),
> >>          QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
> >> @@ -871,6 +883,134 @@ static const struct qmp_phy_init_tbl sdx65_usb3_uniphy_rx_tbl[] = {
> >>          QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_ENABLES, 0x00),
> >>   };
> >>
> >> +static const struct qmp_phy_init_tbl sdx75_usb3_uniphy_serdes_tbl[] = {
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE1, 0x9e),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE1, 0x06),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x02),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x16),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x36),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORECLK_DIV_MODE1, 0x04),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x2e),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x82),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x82),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE1, 0xab),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE1, 0xea),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE1, 0x02),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0x25),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x02),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xb7),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x1e),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xb7),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0x9e),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x06),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x02),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x16),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x12),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x34),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x82),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0xab),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0xea),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x02),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE0, 0x25),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE0, 0x02),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0e),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x31),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x01),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_BUF_ENABLE, 0x0a),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x1a),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_CFG, 0x14),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x04),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0x20),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_1, 0xb6),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_2, 0x4b),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_AUTO_GAIN_ADJ_CTRL_3, 0x37),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADDITIONAL_MISC, 0x0c),
> >> +};
> >> +
> >> +static const struct qmp_phy_init_tbl sdx75_usb3_uniphy_tx_tbl[] = {
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_TX, 0x00),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_RX, 0x00),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_OFFSET_TX, 0x1f),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_1, 0xf5),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_3, 0x3f),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_4, 0x3f),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_5, 0x5f),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_TX_RCV_DETECT_LVL_2, 0x12),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_TX_PI_QEC_CTRL, 0x21),
> >> +};
> >> +
> >> +static const struct qmp_phy_init_tbl sdx75_usb3_uniphy_rx_tbl[] = {
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_FO_GAIN, 0x0a),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SO_GAIN, 0x06),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_PI_CONTROLS, 0x99),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SB2_THRESH1, 0x08),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SB2_THRESH2, 0x08),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SB2_GAIN1, 0x00),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SB2_GAIN2, 0x0a),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_AUX_DATA_TCOARSE_TFINE, 0xa0),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_VGA_CAL_CNTRL1, 0x54),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_VGA_CAL_CNTRL2, 0x0f),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_GM_CAL, 0x13),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_IDAC_TSETTLE_LOW, 0x07),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIGDET_CNTRL, 0x04),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_LOW, 0x3f),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH, 0xbf),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH2, 0xff),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH3, 0xdf),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH4, 0xed),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_LOW, 0xdc),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH, 0x5c),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH2, 0x9c),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH3, 0x1d),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH4, 0x09),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_DFE_EN_TIMER, 0x04),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_DCC_CTRL1, 0x0c),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_VTH_CODE, 0x10),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIGDET_CAL_CTRL1, 0x14),
> >> +       QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIGDET_CAL_TRIM, 0x08),
> >> +};
> >> +
> >> +static const struct qmp_phy_init_tbl sdx75_usb3_uniphy_pcs_tbl[] = {
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_LOCK_DETECT_CONFIG1, 0xc4),
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_LOCK_DETECT_CONFIG2, 0x89),
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_LOCK_DETECT_CONFIG3, 0x20),
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_LOCK_DETECT_CONFIG6, 0x13),
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_REFGEN_REQ_CONFIG1, 0x21),
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_RX_SIGDET_LVL, 0xaa),
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_CDR_RESET_TIME, 0x0a),
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_ALIGN_DETECT_CONFIG1, 0x88),
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_ALIGN_DETECT_CONFIG2, 0x13),
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_PCS_TX_RX_CONFIG, 0x0c),
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_EQ_CONFIG1, 0x4b),
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_EQ_CONFIG5, 0x10),
> >> +};
> >> +
> >> +static const struct qmp_phy_init_tbl sdx75_usb3_uniphy_pcs_usb_tbl[] = {
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
> >> +       QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
> >> +};
> >> +
> >>   static const struct qmp_phy_init_tbl sm8350_usb3_uniphy_tx_tbl[] = {
> >>          QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0xa5),
> >>          QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_2, 0x82),
> >> @@ -1531,6 +1671,28 @@ static const struct qmp_phy_cfg sdx65_usb3_uniphy_cfg = {
> >>          .has_pwrdn_delay        = true,
> >>   };
> >>
> >> +static const struct qmp_phy_cfg sdx75_usb3_uniphy_cfg = {
> >> +       .lanes                  = 1,
> >> +       .offsets                = &qmp_usb_offsets_v5,
> > This should be v6
> We discussed in the last version that it is ok if the offsets are same,
> we can keep v5.
> Please Correct me if my understanding was wrong.
> https://lore.kernel.org/all/CAA8EJprS3vxQbOGZnsipRGi4MiyZj3X5HpMan3Q6Z732aWfJ_g@mail.gmail.com/

And I keep my feedback here:

Generic rule: the name of the struct should match the Vn found in the
register names inside.


>
> Thanks,
> Rohit.
> >
> >> +
> >> +       .serdes_tbl             = sdx75_usb3_uniphy_serdes_tbl,
> >> +       .serdes_tbl_num         = ARRAY_SIZE(sdx75_usb3_uniphy_serdes_tbl),
> >> +       .tx_tbl                 = sdx75_usb3_uniphy_tx_tbl,
> >> +       .tx_tbl_num             = ARRAY_SIZE(sdx75_usb3_uniphy_tx_tbl),
> >> +       .rx_tbl                 = sdx75_usb3_uniphy_rx_tbl,
> >> +       .rx_tbl_num             = ARRAY_SIZE(sdx75_usb3_uniphy_rx_tbl),
> >> +       .pcs_tbl                = sdx75_usb3_uniphy_pcs_tbl,
> >> +       .pcs_tbl_num            = ARRAY_SIZE(sdx75_usb3_uniphy_pcs_tbl),
> >> +       .pcs_usb_tbl            = sdx75_usb3_uniphy_pcs_usb_tbl,
> >> +       .pcs_usb_tbl_num        = ARRAY_SIZE(sdx75_usb3_uniphy_pcs_usb_tbl),
> >> +       .vreg_list              = qmp_phy_vreg_l,
> >> +       .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
> >> +       .regs                   = qmp_v6_usb3phy_regs_layout,
> >> +       .pcs_usb_offset         = 0x1000,
> >> +
> >> +       .has_pwrdn_delay        = true,
> >> +};
> >> +
> >>   static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
> >>          .lanes                  = 1,
> >>
> >> @@ -2243,6 +2405,9 @@ static const struct of_device_id qmp_usb_of_match_table[] = {
> >>                  .compatible = "qcom,sdx65-qmp-usb3-uni-phy",
> >>                  .data = &sdx65_usb3_uniphy_cfg,
> >>          }, {
> >> +               .compatible = "qcom,sdx75-qmp-usb3-uni-phy",
> >> +               .data = &sdx75_usb3_uniphy_cfg,
> >> +       }, {
> >>                  .compatible = "qcom,sm6115-qmp-usb3-phy",
> >>                  .data = &qcm2290_usb3phy_cfg,
> >>          }, {
> >> --
> >> 2.7.4
> >>
> >



-- 
With best wishes
Dmitry


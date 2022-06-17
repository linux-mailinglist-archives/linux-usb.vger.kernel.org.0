Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58F7354FC07
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jun 2022 19:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382790AbiFQRPt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jun 2022 13:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234049AbiFQRPs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jun 2022 13:15:48 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B91DE165BD;
        Fri, 17 Jun 2022 10:15:46 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id y79so5177989iof.2;
        Fri, 17 Jun 2022 10:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WApVYEZOyKxD0bymeRi03xrIA536BXHW5Zo78mfLkVk=;
        b=A/pPcgrfg1m2yA6MEEdDBKTaOJ2GZoXeRj89sq7ibmlWvQbg3NGm3kcfLcPEsu0cKF
         BavHO0Z3VmnqtQaxK7UMzJ94Xa4VMuG5VzjG5fue0Slb+tq9JqcYWTt23xdN1CsV4FtT
         Uw5cyLFCIm9gNgIxSjIwmZml06alk4EIcChdHxtQ4ljRPZSLZz0edhvOp2Yp2HTOfW13
         jTE0N8HfNfb8VWy5zkhxVREkQVv5j2Uj1BiIEC/JNhyQpbFM1tNKT5itOXMHFwt0P8Or
         RgtLwqVAFeStwSqdAspH7oCjwmj42wDxOvpErnvt+8vcIn4RlOh+brO7oJwK7FHKIn+6
         VZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WApVYEZOyKxD0bymeRi03xrIA536BXHW5Zo78mfLkVk=;
        b=CzHdRDd6aSEfkk1W5WFPaz2wyXiGaz9EtUef7wKcoo1Ngp9s5kj84iqfIYHQ6zxLIq
         Ymd7NJ5+m3RQqhAZsJe6pPiaVvApZhO6WTlFiOWolUo614V5pc4DEJCmpRUCoaF/X/AY
         dN8XbCNBVHgz+UlrX/kmbJyh+coXvZhp9S8h/0S3KRrdNFIcNzbF7JybxilfoX4QjZ/V
         0ojIe+WcDiosALec3y8fVovSFbf8kRhu9mMwiRHeYwpy0sbQYaf3N47nqXDfH7sN1TNE
         x/XfJwW9Oa9RCsqVl4YOnc8uoqgGkTOauc3B6mGkIZ+ypz8lLZT1I43Js1S3SmH7au2Y
         +oFQ==
X-Gm-Message-State: AJIora9HGI0/tH7xkGRZNCiRyvrTlv0btVzKhfhPGbTX1UNu0JOb5m63
        QNZ3gKOnE+k7XLGNFpaZGTqmUa5uF+Rmj03btQc=
X-Google-Smtp-Source: AGRyM1t9ErBDC4z6wUWd3rr2PZHkKy4brF52F6NkwgA2if8GQk3nkvvrwVcBhAPB/cuDHIsaYScUFQeCm4VxyhYwyG8=
X-Received: by 2002:a05:6638:2113:b0:331:feae:af81 with SMTP id
 n19-20020a056638211300b00331feaeaf81mr5877071jaj.196.1655486145516; Fri, 17
 Jun 2022 10:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com> <20220613111146.25221-9-peterwu.pub@gmail.com>
 <Yqph8jwHU8rPooJA@google.com>
In-Reply-To: <Yqph8jwHU8rPooJA@google.com>
From:   ChiaEn Wu <peterwu.pub@gmail.com>
Date:   Sat, 18 Jun 2022 01:15:29 +0800
Message-ID: <CABtFH5KLVQFYOBGZ--9+s4GrHXbsDao-yL-KCFwL3FD_kbNhjg@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] mfd: mt6370: Add Mediatek MT6370 support
To:     Lee Jones <lee.jones@linaro.org>
Cc:     jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com,
        Daniel Thompson <daniel.thompson@linaro.org>,
        jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-iio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
        szunichen@gmail.com, ChiYuan Huang <cy_huang@richtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Lee,

Thanks for your helpful comments, we have some questions and replies below.

Lee Jones <lee.jones@linaro.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=8816=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E6=B8=85=E6=99=A86:49=E5=AF=AB=E9=81=93=EF=BC=9A

>
> On Mon, 13 Jun 2022, ChiaEn Wu wrote:
>
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add Mediatek MT6370 MFD support.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> >  drivers/mfd/Kconfig  |  13 ++
> >  drivers/mfd/Makefile |   1 +
> >  drivers/mfd/mt6370.c | 349 +++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 363 insertions(+)
> >  create mode 100644 drivers/mfd/mt6370.c
> >
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 3b59456f5545..d9a7524a3e0e 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -937,6 +937,19 @@ config MFD_MT6360
> >         PMIC part includes 2-channel BUCKs and 2-channel LDOs
> >         LDO part includes 4-channel LDOs
> >
> > +config MFD_MT6370
> > +     tristate "Mediatek MT6370 SubPMIC"
> > +     select MFD_CORE
> > +     select REGMAP_I2C
> > +     select REGMAP_IRQ
> > +     depends on I2C
> > +     help
> > +       Say Y here to enable MT6370 SubPMIC functional support.
> > +       It integrate single cell battery charger with adc monitoring, R=
GB
>
> s/integrates/consists of a/
>
> "ADC"

We will fine it in the next patch.

>
> > +       LEDs, dual channel flashlight, WLED backlight driver, display b=
ias
>
> > +       voltage supply, one general purpose LDO, and cc logic
> > +       controller with USBPD commmunication capable.
>
> The last part makes no sense - "and is USBPD"?

If we modify this help text to
"one general purpose LDO, and the USB Type-C & PD controller complies
with the latest USB Type-C and PD standards",
did these modifications meet your expectations?

>
> >  config MFD_MT6397
> >       tristate "MediaTek MT6397 PMIC Support"
> >       select MFD_CORE
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 858cacf659d6..62b27125420e 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -242,6 +242,7 @@ obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)        +=3D inte=
l_soc_pmic_bxtwc.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)   +=3D intel_soc_pmic_chtwc.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)        +=3D intel_soc_pmic_chtdc=
_ti.o
> >  obj-$(CONFIG_MFD_MT6360)     +=3D mt6360-core.o
> > +obj-$(CONFIG_MFD_MT6370)     +=3D mt6370.o
> >  mt6397-objs                  :=3D mt6397-core.o mt6397-irq.o mt6358-ir=
q.o
> >  obj-$(CONFIG_MFD_MT6397)     +=3D mt6397.o
> >  obj-$(CONFIG_INTEL_SOC_PMIC_MRFLD)   +=3D intel_soc_pmic_mrfld.o
> > diff --git a/drivers/mfd/mt6370.c b/drivers/mfd/mt6370.c
> > new file mode 100644
> > index 000000000000..6af9f73c9c0c
> > --- /dev/null
> > +++ b/drivers/mfd/mt6370.c
> > @@ -0,0 +1,349 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/bits.h>
> > +#include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/module.h>
> > +#include <linux/regmap.h>
> > +
> > +enum {
> > +     MT6370_USBC_I2C =3D 0,
> > +     MT6370_PMU_I2C,
> > +     MT6370_MAX_I2C
> > +};
> > +
> > +#define MT6370_REG_DEV_INFO  0x100
> > +#define MT6370_REG_CHG_IRQ1  0x1C0
> > +#define MT6370_REG_CHG_MASK1 0x1E0
> > +
> > +#define MT6370_VENID_MASK    GENMASK(7, 4)
> > +
> > +#define MT6370_NUM_IRQREGS   16
> > +#define MT6370_USBC_I2CADDR  0x4E
> > +#define MT6370_REG_ADDRLEN   2
> > +#define MT6370_REG_MAXADDR   0x1FF
> > +
> > +/* IRQ definitions */
> > +#define MT6370_IRQ_DIRCHGON          0
> > +#define MT6370_IRQ_CHG_TREG          4
> > +#define MT6370_IRQ_CHG_AICR          5
> > +#define MT6370_IRQ_CHG_MIVR          6
> > +#define MT6370_IRQ_PWR_RDY           7
> > +#define MT6370_IRQ_FL_CHG_VINOVP     11
> > +#define MT6370_IRQ_CHG_VSYSUV                12
> > +#define MT6370_IRQ_CHG_VSYSOV                13
> > +#define MT6370_IRQ_CHG_VBATOV                14
> > +#define MT6370_IRQ_CHG_VINOVPCHG     15
> > +#define MT6370_IRQ_TS_BAT_COLD               20
> > +#define MT6370_IRQ_TS_BAT_COOL               21
> > +#define MT6370_IRQ_TS_BAT_WARM               22
> > +#define MT6370_IRQ_TS_BAT_HOT                23
> > +#define MT6370_IRQ_TS_STATC          24
> > +#define MT6370_IRQ_CHG_FAULT         25
> > +#define MT6370_IRQ_CHG_STATC         26
> > +#define MT6370_IRQ_CHG_TMR           27
> > +#define MT6370_IRQ_CHG_BATABS                28
> > +#define MT6370_IRQ_CHG_ADPBAD                29
> > +#define MT6370_IRQ_CHG_RVP           30
> > +#define MT6370_IRQ_TSHUTDOWN         31
> > +#define MT6370_IRQ_CHG_IINMEAS               32
> > +#define MT6370_IRQ_CHG_ICCMEAS               33
> > +#define MT6370_IRQ_CHGDET_DONE               34
> > +#define MT6370_IRQ_WDTMR             35
> > +#define MT6370_IRQ_SSFINISH          36
> > +#define MT6370_IRQ_CHG_RECHG         37
> > +#define MT6370_IRQ_CHG_TERM          38
> > +#define MT6370_IRQ_CHG_IEOC          39
> > +#define MT6370_IRQ_ADC_DONE          40
> > +#define MT6370_IRQ_PUMPX_DONE                41
> > +#define MT6370_IRQ_BST_BATUV         45
> > +#define MT6370_IRQ_BST_MIDOV         46
> > +#define MT6370_IRQ_BST_OLP           47
> > +#define MT6370_IRQ_ATTACH            48
> > +#define MT6370_IRQ_DETACH            49
> > +#define MT6370_IRQ_HVDCP_STPDONE     51
> > +#define MT6370_IRQ_HVDCP_VBUSDET_DONE        52
> > +#define MT6370_IRQ_HVDCP_DET         53
> > +#define MT6370_IRQ_CHGDET            54
> > +#define MT6370_IRQ_DCDT                      55
> > +#define MT6370_IRQ_DIRCHG_VGOK               59
> > +#define MT6370_IRQ_DIRCHG_WDTMR              60
> > +#define MT6370_IRQ_DIRCHG_UC         61
> > +#define MT6370_IRQ_DIRCHG_OC         62
> > +#define MT6370_IRQ_DIRCHG_OV         63
> > +#define MT6370_IRQ_OVPCTRL_SWON              67
> > +#define MT6370_IRQ_OVPCTRL_UVP_D     68
> > +#define MT6370_IRQ_OVPCTRL_UVP               69
> > +#define MT6370_IRQ_OVPCTRL_OVP_D     70
> > +#define MT6370_IRQ_OVPCTRL_OVP               71
> > +#define MT6370_IRQ_FLED_STRBPIN              72
> > +#define MT6370_IRQ_FLED_TORPIN               73
> > +#define MT6370_IRQ_FLED_TX           74
> > +#define MT6370_IRQ_FLED_LVF          75
> > +#define MT6370_IRQ_FLED2_SHORT               78
> > +#define MT6370_IRQ_FLED1_SHORT               79
> > +#define MT6370_IRQ_FLED2_STRB                80
> > +#define MT6370_IRQ_FLED1_STRB                81
> > +#define mT6370_IRQ_FLED2_STRB_TO     82
> > +#define MT6370_IRQ_FLED1_STRB_TO     83
> > +#define MT6370_IRQ_FLED2_TOR         84
> > +#define MT6370_IRQ_FLED1_TOR         85
> > +#define MT6370_IRQ_OTP                       93
> > +#define MT6370_IRQ_VDDA_OVP          94
> > +#define MT6370_IRQ_VDDA_UV           95
> > +#define MT6370_IRQ_LDO_OC            103
> > +#define MT6370_IRQ_BLED_OCP          118
> > +#define MT6370_IRQ_BLED_OVP          119
> > +#define MT6370_IRQ_DSV_VNEG_OCP              123
> > +#define MT6370_IRQ_DSV_VPOS_OCP              124
> > +#define MT6370_IRQ_DSV_BST_OCP               125
> > +#define MT6370_IRQ_DSV_VNEG_SCP              126
> > +#define MT6370_IRQ_DSV_VPOS_SCP              127
> > +
> > +struct mt6370_info {
> > +     struct i2c_client *i2c[MT6370_MAX_I2C];
> > +     struct device *dev;
> > +     struct regmap *regmap;
> > +     struct regmap_irq_chip_data *irq_data;
> > +};
>
> Can we shove all of the above into a header file?

Well... In Patch v1, we put these "#define IRQ" into
"include/dt-bindings/mfd/mediatek,mt6370.h".
But the reviewer of DT files hoped us to remove this header file, we
put these "#define IRQ" in this .c file.
Shall we leave them here or put them into the header file in
"driver/power/supply/mt6370-charger.h"?

>
> > +static const struct regmap_irq mt6370_irqs[] =3D {
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHGON, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TREG, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_AICR, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_MIVR, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_PWR_RDY, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FL_CHG_VINOVP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VSYSUV, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VSYSOV, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VBATOV, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VINOVPCHG, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_COLD, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_COOL, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_WARM, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_HOT, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_STATC, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_FAULT, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_STATC, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TMR, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_BATABS, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_ADPBAD, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_RVP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_TSHUTDOWN, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_IINMEAS, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_ICCMEAS, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHGDET_DONE, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_WDTMR, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_SSFINISH, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_RECHG, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TERM, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_IEOC, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_ADC_DONE, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_PUMPX_DONE, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_BATUV, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_MIDOV, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_OLP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_ATTACH, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DETACH, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_STPDONE, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_VBUSDET_DONE, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_DET, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHGDET, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DCDT, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_VGOK, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_WDTMR, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_UC, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_OC, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_OV, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_SWON, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_UVP_D, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_UVP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_OVP_D, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_OVP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_STRBPIN, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_TORPIN, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_TX, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_LVF, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_SHORT, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_SHORT, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_STRB, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_STRB, 8),
> > +     REGMAP_IRQ_REG_LINE(mT6370_IRQ_FLED2_STRB_TO, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_STRB_TO, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_TOR, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_TOR, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_OTP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_VDDA_OVP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_VDDA_UV, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_LDO_OC, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_BLED_OCP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_BLED_OVP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VNEG_OCP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VPOS_OCP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_BST_OCP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VNEG_SCP, 8),
> > +     REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VPOS_SCP, 8)
> > +};
> > +
> > +static const struct regmap_irq_chip mt6370_irq_chip =3D {
> > +     .name           =3D "mt6370-irqs",
> > +     .status_base    =3D MT6370_REG_CHG_IRQ1,
> > +     .mask_base      =3D MT6370_REG_CHG_MASK1,
> > +     .num_regs       =3D MT6370_NUM_IRQREGS,
> > +     .irqs           =3D mt6370_irqs,
> > +     .num_irqs       =3D ARRAY_SIZE(mt6370_irqs),
> > +};
> > +
> > +static const struct resource mt6370_regulator_irqs[] =3D {
> > +     DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VPOS_SCP, "db_vpos_scp"),
> > +     DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VNEG_SCP, "db_vneg_scp"),
> > +     DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_BST_OCP, "db_vbst_ocp"),
> > +     DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VPOS_OCP, "db_vpos_ocp"),
> > +     DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VNEG_OCP, "db_vneg_ocp"),
> > +     DEFINE_RES_IRQ_NAMED(MT6370_IRQ_LDO_OC, "ldo_oc")
> > +};
> > +
> > +static const struct mfd_cell mt6370_devices[] =3D {
> > +     MFD_CELL_OF("adc", NULL, NULL, 0, 0, "mediatek,mt6370-adc"),
> > +     MFD_CELL_OF("charger", NULL, NULL, 0, 0, "mediatek,mt6370-charger=
"),
> > +     MFD_CELL_OF("backlight", NULL, NULL, 0, 0, "mediatek,mt6370-backl=
ight"),
> > +     MFD_CELL_OF("flashlight", NULL, NULL, 0, 0, "mediatek,mt6370-flas=
hlight"),
> > +     MFD_CELL_OF("indicator", NULL, NULL, 0, 0, "mediatek,mt6370-indic=
ator"),
> > +     MFD_CELL_OF("tcpc", NULL, NULL, 0, 0, "mediatek,mt6370-tcpc"),
> > +     MFD_CELL_RES("regulator", mt6370_regulator_irqs)
> > +};
> > +
> > +static int mt6370_check_vendor_info(struct mt6370_info *info)
> > +{
> > +     unsigned int devinfo;
> > +     int ret;
> > +
> > +     ret =3D regmap_read(info->regmap, MT6370_REG_DEV_INFO, &devinfo);
> > +     if (ret)
> > +             return ret;
> > +
> > +     switch (FIELD_GET(MT6370_VENID_MASK, devinfo)) {
> > +     case 0x8: /* RT5081 */
> > +     case 0xA: /* RT5081A */
> > +     case 0xE: /* MT6370 */
> > +     case 0xF: /* MT6371 */
> > +     case 0x9: /* MT6372P */
> > +     case 0xB: /* MT6372CP */
>
> Please define these and drop the comments.

OK, we will refine them in the next patch! Thanks!

>
> > +             break;
> > +     default:
> > +             dev_err(info->dev, "Not invalid value 0x%02x\n", devinfo)=
;
> > +             return -ENODEV;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int mt6370_regmap_read(void *context, const void *reg_buf,
> > +                           size_t reg_size, void *val_buf, size_t val_=
size)
> > +{
> > +     struct mt6370_info *info =3D context;
> > +     u8 bank_idx =3D *(u8 *)reg_buf, bank_addr =3D *(u8 *)(reg_buf + 1=
);
>
> Looks a little scruffy.  Perhaps allocate the values below.
>
> > +     int ret;
> > +
> > +     ret =3D i2c_smbus_read_i2c_block_data(info->i2c[bank_idx], bank_a=
ddr,
> > +                                         val_size, val_buf);
> > +     if (ret !=3D val_size)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +
> > +static int mt6370_regmap_write(void *context, const void *data, size_t=
 count)
> > +{
> > +     struct mt6370_info *info =3D context;
> > +     u8 bank_idx =3D *(u8 *)data, bank_addr =3D *(u8 *)(data + 1);
>
> As above.

OK, we will try to refine these parts in the next patch.

>
> > +     int len =3D count - MT6370_REG_ADDRLEN;
> > +
> > +     return i2c_smbus_write_i2c_block_data(info->i2c[bank_idx], bank_a=
ddr,
> > +                                           len, data + MT6370_REG_ADDR=
LEN);
> > +}
> > +
> > +static const struct regmap_bus mt6370_regmap_bus =3D {
> > +     .read           =3D mt6370_regmap_read,
> > +     .write          =3D mt6370_regmap_write,
> > +};
> > +
> > +static const struct regmap_config mt6370_regmap_config =3D {
> > +     .reg_bits               =3D 16,
> > +     .val_bits               =3D 8,
> > +     .reg_format_endian      =3D REGMAP_ENDIAN_BIG,
> > +     .max_register           =3D MT6370_REG_MAXADDR,
> > +};
> > +
> > +static int mt6370_probe(struct i2c_client *i2c)
> > +{
> > +     struct mt6370_info *info;
> > +     struct i2c_client *usbc_i2c;
> > +     int ret;
> > +
> > +     info =3D devm_kzalloc(&i2c->dev, sizeof(*info), GFP_KERNEL);
> > +     if (!info)
> > +             return -ENOMEM;
> > +
> > +     info->dev =3D &i2c->dev;
> > +
> > +     usbc_i2c =3D devm_i2c_new_dummy_device(&i2c->dev, i2c->adapter,
> > +                                          MT6370_USBC_I2CADDR);
> > +     if (IS_ERR(usbc_i2c)) {
> > +             ret =3D PTR_ERR(usbc_i2c);
> > +             dev_err(&i2c->dev, "Failed to register usbc i2c client %d=
\n", ret);
>
> "USB-C I2C"?

MT6370 have two slave address, one is for the USB PD module and
another one is for other modules.
So we use "USB-C I2C" to refer to the USB PD module.

>
> > +             return ret;
> > +     }
> > +
> > +     /* Assign I2C client for PMU and TypeC */
> > +     info->i2c[MT6370_PMU_I2C] =3D i2c;
> > +     info->i2c[MT6370_USBC_I2C] =3D usbc_i2c;
> > +
> > +     info->regmap =3D devm_regmap_init(&i2c->dev, &mt6370_regmap_bus, =
info,
> > +                                     &mt6370_regmap_config);
> > +     if (IS_ERR(info->regmap)) {
> > +             ret =3D PTR_ERR(info->regmap);
> > +             dev_err(&i2c->dev, "Failed to register regmap (%d)\n", re=
t);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D mt6370_check_vendor_info(info);
> > +     if (ret) {
> > +             dev_err(&i2c->dev, "Failed to check vendor info (%d)\n", =
ret);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D devm_regmap_add_irq_chip(&i2c->dev, info->regmap, i2c->ir=
q,
> > +                                    IRQF_ONESHOT, -1, &mt6370_irq_chip=
,
> > +                                    &info->irq_data);
> > +     if (ret) {
> > +             dev_err(&i2c->dev, "Failed to add irq chip (%d)\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     return devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
> > +                                 mt6370_devices, ARRAY_SIZE(mt6370_dev=
ices),
> > +                                 NULL, 0,
> > +                                 regmap_irq_get_domain(info->irq_data)=
);
> > +}
> > +
> > +static const struct of_device_id mt6370_match_table[] =3D {
> > +     { .compatible =3D "mediatek,mt6370", },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, mt6370_match_table);
> > +
> > +static struct i2c_driver mt6370_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "mt6370",
> > +             .of_match_table =3D mt6370_match_table,
> > +     },
> > +     .probe_new =3D mt6370_probe,
> > +};
> > +module_i2c_driver(mt6370_driver);
> > +
> > +MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
> > +MODULE_DESCRIPTION("MT6370 I2C MFD Driver");
>
> Drop all references to "MFD" please.

OK, we will drop them in the next patch. Thank you so much!

>
> > +MODULE_LICENSE("GPL v2");
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Principal Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog

Best regards,
ChiaEn Wu

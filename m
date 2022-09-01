Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB035A8D11
	for <lists+linux-usb@lfdr.de>; Thu,  1 Sep 2022 07:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232674AbiIAFGp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Sep 2022 01:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231447AbiIAFGo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 01:06:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 557DB112EC7
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 22:06:43 -0700 (PDT)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1oTcPV-0000wM-D8; Thu, 01 Sep 2022 07:06:37 +0200
Message-ID: <e0e1ece2-350a-8412-8dc2-56004f870f8a@pengutronix.de>
Date:   Thu, 1 Sep 2022 07:06:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: imx8mp USB OTG/dual-role
Content-Language: en-US
To:     Tim Harvey <tharvey@gateworks.com>, Jun Li <jun.li@nxp.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Marek Vasut <marex@denx.de>, Felipe Balbi <balbi@kernel.org>,
        Fabio Estevam <festevam@denx.de>, Jacky Bai <ping.bai@nxp.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Lucas Stach <l.stach@pengutronix.de>
References: <CAJ+vNU2bLPAta6GpDn_dGSrCnCRuBtxvLZ-g01h1jGwQuruBuA@mail.gmail.com>
 <DB9PR04MB8412164E22460736FB15B8D687789@DB9PR04MB8412.eurprd04.prod.outlook.com>
 <PA4PR04MB9640F578AEF2558BA3F08F8889789@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <CAJ+vNU10JeQg7GO+cd+Twn_uE4Hsh0T422+vZKT-DW517OD-RA@mail.gmail.com>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAJ+vNU10JeQg7GO+cd+Twn_uE4Hsh0T422+vZKT-DW517OD-RA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 31.08.22 18:38, Tim Harvey wrote:
> On Tue, Aug 30, 2022 at 8:11 PM Jun Li <jun.li@nxp.com> wrote:
>>
>> Hi,
>>
>>> -----Original Message-----
>>> From: Jacky Bai <ping.bai@nxp.com>
>>> Sent: Wednesday, August 31, 2022 9:18 AM
>>> To: tharvey@gateworks.com; linux-usb@vger.kernel.org; Linux ARM Mailing
>>> List <linux-arm-kernel@lists.infradead.org>; Jun Li <jun.li@nxp.com>
>>> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>; Jun Li
>>> <jun.li@nxp.com>; Rikard Falkeborn <rikard.falkeborn@gmail.com>; Lucas
>>> Stach <l.stach@pengutronix.de>; Philippe Schenker
>>> <philippe.schenker@toradex.com>; Felipe Balbi <balbi@kernel.org>; Fabio
>>> Estevam <festevam@denx.de>; Marcel Ziswiler <marcel.ziswiler@toradex.com>;
>>> Shawn Guo <shawnguo@kernel.org>; Marek Vasut <marex@denx.de>; Francesco
>>> Dolcini <francesco.dolcini@toradex.com>; Aisheng Dong
>>> <aisheng.dong@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>;
>>> dl-linux-imx <linux-imx@nxp.com>; Pengutronix Kernel Team
>>> <kernel@pengutronix.de>
>>> Subject: RE: imx8mp USB OTG/dual-role
>>>
>>> Jun, as we discussed before, any conclusion on how to handle the USB OTG
>>> ID pin in RM?
>>
>> The NXP datasheet for iMX8MP already changed the ID pin name to be with _DNU
>> suffix, RM may be updated in next version.
>> If legacy ID is going to be used, any normal GPIO function can be selected
>> for it, extcon is well supported in dwc3 controller driver.
>>
>> More comments for Tim, see below...
>>
>>>
>>>
>>> BR
>>> Jacky Bai
>>>
>>>> Subject: imx8mp USB OTG/dual-role
>>>>
>>>> Greetings,
>>>>
>>>> I have an imx8mp board (imx8mp-venice-gw74xx) which has a DWC3 USB
>>>> host controller using imx8mp PHY
>>>> (drivers/phy/freescale/phy-fsl-imx8mq-usb.c fsl,imx8mp-usb-phy) and
>>>> DWC3 host controller core (drivers/usb/dwc3/core.c snps,dwc3) with
>>>> imx8mp glue (drivers/usb/dwc3/dwc3-imx8mp.c fsl,imx8mp-dwc3).
>>>>
>>>> One of the 2x USB 3.0 hosts is connected to a USB Type C connector
>>>> using a
>>>> TPS25821 USB power switch and config controller which handles the CC
>>>> pins on and VBUS enable as well as drives the mux sel pin of a
>>>> USB3 mux to route the USB SS pairs to the appropriate half of the Type
>>>> C connector. This device has no I2C or other management bus - only
>>>> VBUS, FAULT#, SINK#, and POL# outputs based on CC pins.
>>>>
>>>> I'm not clear how to describe this in the device-tree in order for it
>>>> to function as a dual-role controller for host vs device mode.
>>>>
>>>> The TPS25821 has a FAULT# signal that routes to IMX8MP GPIO1_IO13
>>>> pinmuxed as MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC and a SINK# signal
>>>> that routes to IMX8MP GPIO1_IO10 pinmuxed as
>>>> MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID. Additionally the VBUS output of
>>>> the TPS25821 also connected to the TypeC VBUS pin routes to the IMX8MP
>>>> USB1_VBUS pin.
>>
>> So TPS25821 does not need a driver.
>>
>>>>
>>>> I've noticed there are currently only 2 other IMX8MP boards in Linux
>>>> mainline that specify dr_mode="otg"; the DH electronics i.MX8M Plus
>>>> DHCOM SOM (imx8mp-dhcom-som.dtsi), and the Toradex i.MX8M Plus Verdin
>>>> SOM (imx8mp-verdin.dtsi). I'm not clear how these are hooked up or if
>>>> USB dual-role work on these currently. I did notice that
>>
>> NXP iMX8MP EVK has not enabled type-C port due to the SS orientation
>> switch binding is still in discussion, but you don't need a SW control
>> in your case so you are okay here.
>>
>>>> imx8mp-verdin.dtsi looks like it does not enable the phy or core via
>>>> status prop and uses invalid 'over-current-active-low' and
>>> 'disable-over-current' dt props.
>>>>
>>>> I am currently using the following with imx8mp-venice-gw74xx:
>>>>
>>>> /* USB1 - Type C front panel */
>>>> &usb3_phy0 {
>>>>         status = "okay";
>>>> };
>>>>
>>>> /* USB1 dwc3 glue */
>>>> &usb3_0 {
>>>>         fsl,over-current-active-low;
>>>>         status = "okay";
>>>> };
>>>>
>>>> /* USB1 dwc3 core */
>>>> &usb_dwc3_0 {
>>>>         pinctrl-names = "default";
>>>>         pinctrl-0 = <&pinctrl_usb1>;
>>>>         dr_mode = "otg";
>>>> };
>>>>
>>>> &iomuxc {
>>>>         pinctrl_usb1: usb1grp {
>>>>                 fsl,pins = <
>>>>
>>>> MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC    0x140
>>>>
>>>> MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID    0x140
>>>>                 >;
>>>>         };
>>>> };
>>>>
>>>> And currently v6.0-rc2 enumerates the host controller even without a
>>>> Type-C to host cable attached which tells me that OTG_ID isn't doing
>>>> its job. I vaguely recall some confusing statements on the IMX
>>>> community forum that these pins might not even be used on the IMX8MP.
>>>>
>>>> How should I be describing the device-tree for this scenario in order
>>>> to get dual-role behavior?
>>
>> Could this dts work for you?
>>
>> /* Config the "ID" pin iomux to be GPIO */
>>
>> pinctrl_usb1: usb1grp {
>>                  fsl,pins = <
>>                       MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC    0x140
>>                       MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10    0x140
>>           >;
>>  };
>>
>>  extcon_usb: extcon_iddig {
>>                  compatible = "linux,extcon-usb-gpio";
>>                  id-gpio = <&gpio1 10 GPIO_ACTIVE_HIGH>;
>>  };
>>
>>  &usb_dwc3_0 {
>>          pinctrl-names = "default";
>>          pinctrl-0 = <&pinctrl_usb1>;
>>                  extcon = <&extcon_usb>
>>          dr_mode = "otg";
>>  };
>>
>> Li Jun
> 
> Jun,
> 
> Thank you, this does appear to work as intended as dual-role. I was
> not aware of linux,extcon-usb-gpio.
> 
> And thanks also Alexander, your usb-dual-role via connector method
> works as well.
> 
> Which method is preferred, using extcon or using usb-role-switch via a
> connector as in Alexander's patch?

The commit adding the usb-role-switch
4602f3bff266 ("usb: common: add USB GPIO based connection detection driver")
mentions that "[d]ue to the requirement of usb-connector.txt binding, the old way
using extcon to support USB Dual-Role switch is now deprecated
when use Type-B connector."

> 
> Additionally, where is it appropriate to put the pinctrl for the OC
> and ID pins in the usb_dwc3_0 (dwc3 core) node, the usb3_0 (dwc3 glue)
> node, or the usb3_phy0 (phy) node?
> 
> Best Regards,
> 
> Tim
> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 325A527B82
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 13:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729698AbfEWLOv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 07:14:51 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14214 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727466AbfEWLOv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 May 2019 07:14:51 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce680a80000>; Thu, 23 May 2019 04:14:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 May 2019 04:14:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 May 2019 04:14:47 -0700
Received: from [10.24.193.7] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 May
 2019 11:14:44 +0000
Subject: Re: [Patch V3 2/8] phy: tegra: xusb: t210: add usb3 port fake support
To:     jckuo <jckuo@nvidia.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-3-git-send-email-nkristam@nvidia.com>
 <3e9c1919-c3d6-2d08-ca83-c600f4fd60f9@nvidia.com>
X-Nvconfidentiality: public
From:   Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <5e83a371-d56b-72ef-be6e-f4112711f3e9@nvidia.com>
Date:   Thu, 23 May 2019 16:46:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3e9c1919-c3d6-2d08-ca83-c600f4fd60f9@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558610088; bh=IcX/5+7rdh5+2ub+oT4bNMyM65ADgLtjrOwKDUQXxzo=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=M5kI+hROqopTJdB50ZptYeUmsYCmOy7RmKWgHThNqJSroac0DuT5pQoKKvwEWceQb
         1rQXEb3NgdgXcYWB/zWsYusUKP8FxJEOERZDX3B73GqUUdwVKGAfDzA/nSlBKJrv4E
         xh7qs8FcVccZR9kmcPVLza0Pb/rRVDmkW88knR0cpkv8KF+q4dzpBcCiRbdS1Opm7d
         rrj5ZmqNySSpQ1Qyl+UQzEd/ULIH1IvCVmxzS4nqCP8aI/YUW8C919lrqvNa3+0Cj/
         M7dFdipybOaIjhG3QQKngLO2/M3aXgAisasbEdpwgGtneqxzv/pesMSU3bVVz2TSKE
         cVXePBk912Q1A==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 21-05-2019 08:30, jckuo wrote:
> Hi Nagarjuna,
>=20
> Please check tegra_xusb_update_usb3_fake_port().
>=20
> Thanks,
>=20
> JC
>=20
> On 5/16/19 2:39 PM, Nagarjuna Kristam wrote:
>> On Tegra210, usb2 only otg/peripheral ports dont work in device mode.
>> They need an assosciated usb3 port to work in device mode. Identify
>> an unused usb3 port and assign it as a fake USB3 port to USB2 only
>> port whose mode is otg/peripheral.
>>
>> Based on work by BH Hsieh <bhsieh@nvidia.com>.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> ---
>> =C2=A0 drivers/phy/tegra/xusb-tegra210.c | 56 ++++++++++++++++++++++++++=
+++++
>> =C2=A0 drivers/phy/tegra/xusb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 69 +++++++++++++++++++++++++++++++++++++++
>> =C2=A0 drivers/phy/tegra/xusb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>> =C2=A0 3 files changed, 127 insertions(+)
>>
>> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-=
tegra210.c
>> index 4beebcc..829aca5 100644
>> --- a/drivers/phy/tegra/xusb-tegra210.c
>> +++ b/drivers/phy/tegra/xusb-tegra210.c
>> @@ -58,6 +58,7 @@
>> =C2=A0 #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_SHIFT(x) ((x) * 5)
>> =C2=A0 #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(x) (0x7 << ((x) * =
5))
>> =C2=A0 #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(x, v) (((v) & 0x7) << (=
(x) * 5))
>> +#define XUSB_PADCTL_SS_PORT_MAP_PORT_DISABLED 0x7
>> =C2=A0 =C2=A0 #define XUSB_PADCTL_ELPG_PROGRAM1 0x024
>> =C2=A0 #define XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN (1 << 31=
)
>> @@ -952,6 +953,34 @@ static int tegra210_usb2_phy_power_on(struct phy *p=
hy)
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 priv =3D to_tegra210_xusb_padctl(p=
adctl);
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 if (port->usb3_port_fake !=3D -1) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D padctl_readl(padct=
l, XUSB_PADCTL_SS_PORT_MAP);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value &=3D ~XUSB_PADCTL_SS_P=
ORT_MAP_PORTX_MAP_MASK(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port->usb3_port_fake);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value |=3D XUSB_PADCTL_SS_PO=
RT_MAP_PORTX_MAP(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port->usb3_port_fake, index);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 padctl_writel(padctl, value,=
 XUSB_PADCTL_SS_PORT_MAP);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D padctl_readl(padct=
l, XUSB_PADCTL_ELPG_PROGRAM1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value &=3D ~XUSB_PADCTL_ELPG=
_PROGRAM1_SSPX_ELPG_VCORE_DOWN(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port->usb3_port_fake);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 padctl_writel(padctl, value,=
 XUSB_PADCTL_ELPG_PROGRAM1);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usleep_range(100, 200);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D padctl_readl(padct=
l, XUSB_PADCTL_ELPG_PROGRAM1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value &=3D ~XUSB_PADCTL_ELPG=
_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port->usb3_port_fake);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 padctl_writel(padctl, value,=
 XUSB_PADCTL_ELPG_PROGRAM1);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usleep_range(100, 200);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D padctl_readl(padct=
l, XUSB_PADCTL_ELPG_PROGRAM1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value &=3D ~XUSB_PADCTL_ELPG=
_PROGRAM1_SSPX_ELPG_CLAMP_EN(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port->usb3_port_fake);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 padctl_writel(padctl, value,=
 XUSB_PADCTL_ELPG_PROGRAM1);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D padctl_readl(padctl, XUSB_PADCT=
L_USB2_BIAS_PAD_CTL0);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value &=3D ~((XUSB_PADCTL_USB2_BIAS_PAD_C=
TL0_HS_SQUELCH_LEVEL_MASK <<
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_SHIFT) |
>> @@ -1086,6 +1115,32 @@ static int tegra210_usb2_phy_power_off(struct phy=
 *phy)
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&padctl->lock);
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 if (port->usb3_port_fake !=3D -1) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D padctl_readl(padct=
l, XUSB_PADCTL_ELPG_PROGRAM1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value |=3D XUSB_PADCTL_ELPG_=
PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port->usb3_port_fake);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 padctl_writel(padctl, value,=
 XUSB_PADCTL_ELPG_PROGRAM1);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usleep_range(100, 200);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D padctl_readl(padct=
l, XUSB_PADCTL_ELPG_PROGRAM1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value |=3D XUSB_PADCTL_ELPG_=
PROGRAM1_SSPX_ELPG_CLAMP_EN(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port->usb3_port_fake);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 padctl_writel(padctl, value,=
 XUSB_PADCTL_ELPG_PROGRAM1);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usleep_range(250, 350);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D padctl_readl(padct=
l, XUSB_PADCTL_ELPG_PROGRAM1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value |=3D XUSB_PADCTL_ELPG_=
PROGRAM1_SSPX_ELPG_VCORE_DOWN(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 port->usb3_port_fake);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 padctl_writel(padctl, value,=
 XUSB_PADCTL_ELPG_PROGRAM1);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D padctl_readl(padct=
l, XUSB_PADCTL_SS_PORT_MAP);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value |=3D XUSB_PADCTL_SS_PO=
RT_MAP_PORTX_MAP(port->usb3_port_fake,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XUSB_PADCTL_SS_PORT_MAP_PORT_=
DISABLED);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 padctl_writel(padctl, value,=
 XUSB_PADCTL_SS_PORT_MAP);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON(pad->enable =3D=3D 0))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> =C2=A0 @@ -2051,6 +2106,7 @@ const struct tegra_xusb_padctl_soc tegra210=
_xusb_padctl_soc =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ops =3D &tegra210_xusb_padctl_ops,
>> +=C2=A0=C2=A0=C2=A0 .need_fake_usb3_port =3D true,
>> =C2=A0 };
>> =C2=A0 EXPORT_SYMBOL_GPL(tegra210_xusb_padctl_soc);
>> =C2=A0 diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
>> index 0417213..6618db7 100644
>> --- a/drivers/phy/tegra/xusb.c
>> +++ b/drivers/phy/tegra/xusb.c
>> @@ -808,9 +808,66 @@ static void __tegra_xusb_remove_ports(struct tegra_=
xusb_padctl *padctl)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
>> =C2=A0 +static int tegra_xusb_find_unused_usb3_port(struct tegra_xusb_pa=
dctl *padctl)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct device_node *np;
>> +=C2=A0=C2=A0=C2=A0 unsigned int i;
>> +
>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < padctl->soc->ports.usb3.count; i++=
) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 np =3D tegra_xusb_find_port_=
node(padctl, "usb3", i);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!np || !of_device_is_ava=
ilable(np))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn i;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return -ENODEV;
>> +}
>> +
>> +static bool tegra_xusb_usb3_port_has_companion(struct tegra_xusb_padctl=
 *padctl,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int index)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned int i;
>> +=C2=A0=C2=A0=C2=A0 struct tegra_xusb_usb3_port *usb3;
>> +
>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < padctl->soc->ports.usb3.count; i++=
) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb3 =3D tegra_xusb_find_usb=
3_port(padctl, i);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (usb3 && usb3->port =3D=
=3D index)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn true;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return false;
>> +}
>> +
>> +static int tegra_xusb_update_usb3_fake_port(struct tegra_xusb_usb2_port=
 *usb2)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int fake;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Disable usb3_port_fake usage by default and assig=
n if needed */
>> +=C2=A0=C2=A0=C2=A0 usb2->usb3_port_fake =3D -1;
>> +
>> +=C2=A0=C2=A0=C2=A0 if ((usb2->mode =3D=3D USB_DR_MODE_OTG ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb2->mode =3D=3D USB_=
DR_MODE_PERIPHERAL) &&
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !tegra_xusb_usb3_port_has_co=
mpanion(usb2->base.padctl,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 usb2->base.index)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fake =3D tegra_xusb_find_unu=
sed_usb3_port(usb2->base.padctl);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (fake < 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_=
err(&usb2->base.dev, "no unused USB3 ports available\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn -ENODEV;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(&usb2->base.dev, "Fo=
und unused usb3 port: %d\n",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fake);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb2->usb3_port_fake =3D fak=
e;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_xusb_find_unused_usb3_=
port(usb2->base.padctl);
> This looks redundant to me.
Yes, will remove the same

-Nagarjuna
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> =C2=A0 static int tegra_xusb_setup_ports(struct tegra_xusb_padctl *padct=
l)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_xusb_port *port;
>> +=C2=A0=C2=A0=C2=A0 struct tegra_xusb_usb2_port *usb2;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err =3D 0;
>> =C2=A0 @@ -840,6 +897,18 @@ static int tegra_xusb_setup_ports(struct teg=
ra_xusb_padctl *padctl)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 goto remove_ports;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 if (padctl->soc->need_fake_usb3_port) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < padctl->so=
c->ports.usb2.count; i++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb2=
 =3D tegra_xusb_find_usb2_port(padctl, i);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
!usb2)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 continue;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =
=3D tegra_xusb_update_usb3_fake_port(usb2);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
err < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 goto remove_ports;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_entry(port, &padctl->ports,=
 list) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D port->ops=
->enable(port);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err < 0)
>> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
>> index e0028b9f..26dd6d2 100644
>> --- a/drivers/phy/tegra/xusb.h
>> +++ b/drivers/phy/tegra/xusb.h
>> @@ -299,6 +299,7 @@ struct tegra_xusb_usb2_port {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct regulator *supply;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum usb_dr_mode mode;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool internal;
>> +=C2=A0=C2=A0=C2=A0 int usb3_port_fake;
>> =C2=A0 };
>> =C2=A0 =C2=A0 static inline struct tegra_xusb_usb2_port *
>> @@ -397,6 +398,7 @@ struct tegra_xusb_padctl_soc {
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char * const *supply_names;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_supplies;
>> +=C2=A0=C2=A0=C2=A0 bool need_fake_usb3_port;
>> =C2=A0 };
>> =C2=A0 =C2=A0 struct tegra_xusb_padctl {

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5A127B7D
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 13:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729698AbfEWLNx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 07:13:53 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:14101 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727466AbfEWLNx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 May 2019 07:13:53 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce6806f0000>; Thu, 23 May 2019 04:13:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 23 May 2019 04:13:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 23 May 2019 04:13:51 -0700
Received: from [10.24.193.7] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 May
 2019 11:13:47 +0000
Subject: Re: [Patch V3 3/8] phy: tegra: xusb: t210: add vbus override support
To:     jckuo <jckuo@nvidia.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-4-git-send-email-nkristam@nvidia.com>
 <5607de95-da90-8a56-892c-8529d1b386d7@nvidia.com>
X-Nvconfidentiality: public
From:   Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <8cbc7f4c-6514-3084-492d-0242dba5a2db@nvidia.com>
Date:   Thu, 23 May 2019 16:45:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5607de95-da90-8a56-892c-8529d1b386d7@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558610031; bh=ox52tgr0MmSbiw46iJxlNMQnqag0XUHmCEnqtPERNKc=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=CTpUXewKQiBJXgyu+n0lV48bhFpw0JO/yb1J0GyqOTHZPuvJYoeiM5faLw9JceowZ
         UOvuzb/NJ69012m1gl5oziYkf8+is2xbNF276z888NoX5/KnZUtORjm6ct1rWR6wdn
         94fo/Imec8lViEAExEjydxHbsV5J41fLflfgy58A0G0Rhu6YKBJBRZC2TKmTdaCVg0
         ZJM3xCn/RB+yl4bMJ/dFYU39uHoN2ic5RdTnVAKlsWVglFvnr3KlYL8GdRFH6TxMqP
         DfuvsCn60pP9iuh1Yjkc/vpOZEhGR/cp65SJFjd4BfpMd6qaOijwRUXkNuq0HQ/rYZ
         +1+pTJXPUj4Dg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 21-05-2019 10:04, jckuo wrote:
> Hi Nagarjuna,
>=20
> Please check tegra_phy_xusb_utmi_port_reset().
>=20
> Thanks,
>=20
> JC
>=20
> On 5/16/19 2:39 PM, Nagarjuna Kristam wrote:
>> Tegra XUSB device control driver needs to control vbus override
>> during its operations, add API for the support.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> ---
>> =C2=A0 drivers/phy/tegra/xusb-tegra210.c | 59 ++++++++++++++++++++++++++=
+++++++++++++
>> =C2=A0 drivers/phy/tegra/xusb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 22 +++++++++++++++
>> =C2=A0 drivers/phy/tegra/xusb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>> =C2=A0 include/linux/phy/tegra/xusb.h=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++--
>> =C2=A0 4 files changed, 87 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-=
tegra210.c
>> index 829aca5..363d2aa 100644
>> --- a/drivers/phy/tegra/xusb-tegra210.c
>> +++ b/drivers/phy/tegra/xusb-tegra210.c
>> @@ -73,6 +73,10 @@
>> =C2=A0 #define XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(x) (1 << (1 + =
(x)))
>> =C2=A0 #define XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(x) (1 << (8 + =
(x)))
>> =C2=A0 +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(x) (0x080 + (=
x) * 0x40)
>> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIP (1 << 18)
>> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIN (1 << 22)
>> +
>> =C2=A0 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(x) (0x084 + (x=
) * 0x40)
>> =C2=A0 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT =
7
>> =C2=A0 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0=
x3
>> @@ -235,6 +239,12 @@
>> =C2=A0 #define XUSB_PADCTL_UPHY_USB3_PADX_ECTL6(x) (0xa74 + (x) * 0x40)
>> =C2=A0 #define XUSB_PADCTL_UPHY_USB3_PAD_ECTL6_RX_EQ_CTRL_H_VAL 0xfcf013=
68
>> =C2=A0 +#define XUSB_PADCTL_USB2_VBUS_ID 0xc60
>> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON (1 << 14)
>> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT 18
>> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK 0xf
>> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING 8
>> +
>> =C2=A0 struct tegra210_xusb_fuse_calibration {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 hs_curr_level[4];
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 hs_term_range_adj;
>> @@ -2024,6 +2034,53 @@ static const struct tegra_xusb_port_ops tegra210_=
usb3_port_ops =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .map =3D tegra210_usb3_port_map,
>> =C2=A0 };
>> =C2=A0 +static int tegra210_xusb_padctl_vbus_override(struct tegra_xusb_=
padctl *padctl,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 bool status)
>> +{
>> +=C2=A0=C2=A0=C2=A0 u32 value;
>> +
>> +=C2=A0=C2=A0=C2=A0 dev_dbg(padctl->dev, "%s vbus override\n", status ? =
"set" : "clear");
>> +
>> +=C2=A0=C2=A0=C2=A0 value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_VBUS=
_ID);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (status) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value |=3D XUSB_PADCTL_USB2_=
VBUS_ID_OVERRIDE_VBUS_ON;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value &=3D ~(XUSB_PADCTL_USB=
2_VBUS_ID_OVERRIDE_MASK <<
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value |=3D XUSB_PADCTL_USB2_=
VBUS_ID_OVERRIDE_FLOATING <<
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT;
>> +=C2=A0=C2=A0=C2=A0 } else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value &=3D ~XUSB_PADCTL_USB2=
_VBUS_ID_OVERRIDE_VBUS_ON;
>> +
>> +=C2=A0=C2=A0=C2=A0 padctl_writel(padctl, value, XUSB_PADCTL_USB2_VBUS_I=
D);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int tegra210_utmi_port_reset(struct phy *phy)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct tegra_xusb_padctl *padctl;
>> +=C2=A0=C2=A0=C2=A0 struct tegra_xusb_lane *lane;
>> +=C2=A0=C2=A0=C2=A0 struct device *dev;
>> +=C2=A0=C2=A0=C2=A0 u32 value;
>> +
>> +=C2=A0=C2=A0=C2=A0 lane =3D phy_get_drvdata(phy);
>> +=C2=A0=C2=A0=C2=A0 padctl =3D lane->pad->padctl;
>> +=C2=A0=C2=A0=C2=A0 dev =3D padctl->dev;
>> +
>> +=C2=A0=C2=A0=C2=A0 value =3D padctl_readl(padctl,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(0));
> If we allow USB device mode to be enabled at any USB 2.0 port, we should =
read corresponding XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(x) register.
Will correct accordingly, as plan is to support device mode on any usb 2.0 =
port.

-Nagarjuna
>> +
>> +=C2=A0=C2=A0=C2=A0 if ((value & XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CT=
L0_ZIP) ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (value & XUSB_PADCTL_USB2_BA=
TTERY_CHRG_OTGPAD_CTL0_ZIN)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra210_xusb_padctl_vbus_ov=
erride(padctl, false);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra210_xusb_padctl_vbus_ov=
erride(padctl, true);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;
>> +=C2=A0=C2=A0=C2=A0 }


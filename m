Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3244C502
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 03:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731147AbfFTBfJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 21:35:09 -0400
Received: from mail-eopbgr140129.outbound.protection.outlook.com ([40.107.14.129]:42860
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731132AbfFTBfJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Jun 2019 21:35:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=novatel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bkZ09PvWfOYIQ06ARvX8WcRjIy5sNz/HQ849OPhG8s=;
 b=LGPbXpbQI49dA+kvzrsjO24yJK/myzwP0Fx39GYqdE4iLDMfhp94RNVaIT4c5uYGyAi012bKA1llWILweyUPqLKhLMhTe5/WatPLmPd554xtm7HJ2o7Vt+xrOdKIBAqWODy0VDCVML1xn6hmWWJEOjHTPANvKf33ezcEKZgsp6A=
Received: from DB7PR06MB4186.eurprd06.prod.outlook.com (52.135.139.28) by
 DB7PR06MB4234.eurprd06.prod.outlook.com (52.135.139.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 01:35:03 +0000
Received: from DB7PR06MB4186.eurprd06.prod.outlook.com
 ([fe80::dc30:d1fb:ee57:25a6]) by DB7PR06MB4186.eurprd06.prod.outlook.com
 ([fe80::dc30:d1fb:ee57:25a6%7]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 01:35:03 +0000
From:   SNELL James <James.Snell@novatel.com>
To:     Johan Hovold <johan@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Adding NovAtel USB vendor & device ID to Kernel
Thread-Topic: Adding NovAtel USB vendor & device ID to Kernel
Thread-Index: AdR2/3UVI0TqXI41SS+a01JJQdge9wDd2HGAKxQEZgA=
Date:   Thu, 20 Jun 2019 01:35:03 +0000
Message-ID: <DB7PR06MB4186800D8B736FD465D6CCB3F8E40@DB7PR06MB4186.eurprd06.prod.outlook.com>
References: <DB7PR06MB4186727F76D4E65979ACC99EF8C50@DB7PR06MB4186.eurprd06.prod.outlook.com>
 <20181112105953.GG13311@localhost>
In-Reply-To: <20181112105953.GG13311@localhost>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=James.Snell@novatel.com; 
x-originating-ip: [198.161.65.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29a820d7-4c3a-4320-e616-08d6f51f8481
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR06MB4234;
x-ms-traffictypediagnostic: DB7PR06MB4234:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DB7PR06MB4234CCBF83CE2D1929FFBE70F8E40@DB7PR06MB4234.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(396003)(376002)(136003)(366004)(189003)(199004)(13464003)(6116002)(71200400001)(71190400001)(64756008)(52536014)(66476007)(66066001)(26005)(6916009)(66556008)(229853002)(81156014)(5660300002)(8676002)(66946007)(86362001)(81166006)(72206003)(73956011)(76116006)(186003)(478600001)(966005)(99286004)(33656002)(25786009)(2906002)(76176011)(486006)(14454004)(6436002)(66446008)(316002)(53936002)(6306002)(6246003)(9686003)(68736007)(6506007)(476003)(446003)(3846002)(102836004)(305945005)(8936002)(55016002)(53546011)(256004)(74316002)(11346002)(7696005)(7736002)(5024004)(4326008)(14444005);DIR:OUT;SFP:1102;SCL:1;SRVR:DB7PR06MB4234;H:DB7PR06MB4186.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: novatel.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vgwTJ1SaTqOkfm4RPxGse+F0F8Kxl886Ek0utF360UCtXfFsRfHLq2MUt+Dp7cXqQdOY2/fvRdWywZIbRA3mlu2LZx61cT1aasVk8tztiHEGsgehMjyrdMrhV+lIeOX/K9O8tVyxaaNebgM3jL1HOaa3hQk3r60mJVw/n1PhXR7bBl1W8BaQuwnCVimG0kGlW6z0C55iIRZvMakc1p61ZvqpqT/OYDdFQIWzh5VtdkqgvXI0sxbtYIT7bp4SEP7l7l0Kzsr8yG4bxSgbedCvoLY/rgtiz8gJKoiGiLdHX1Pbh1gLiJ0YPkr+L+7WW55YsT6AVjYjWbBJfLC6QLKz05ZQH/oIeSTJa/EwJLXH+m/cSbOsJFC8oQaZhskaA8gbAJqylEZ8TstaPpgC/cQQ71qppFd++9vBJsYb1m9ChGs=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: novatel.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a820d7-4c3a-4320-e616-08d6f51f8481
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 01:35:03.4101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: James.Snell@novatel.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR06MB4234
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,
I apologize for the extreme delay in replying to your latest message. I was=
 considering approaching this an entirely different way and have since retu=
rned to submitting the request directly to you. As such, I will now address=
 each of your questions.

-- Q1. Do your products support other serial interfaces as well (e.g. UART =
or i2c)? --
Our USB interface offers 3 virtual UARTs that can be used a serial ports. A=
ll of our products also can be interfaced to using RS232 and many offer Eth=
ernet, Wifi and CAN support. But all that I think is relevant for adding su=
pport to the kernel is the USB virtual serial ports.


-- Q2. As Oliver mentioned it would be useful to know what USB-serial conve=
rter chip you use in the device, if any, or of this is a custom implementat=
ion. --
As far as I am aware, this is our own implementation. Our Windows driver's =
have a mention in their configuration about a 16550 compatible UART, howeve=
r I'm not certain if that is relevant. For your purposes.


-- Q3. Since 4.19 we actually have GNSS subsystem in the kernel, which if w=
e implement a driver for your devices would show up as /dev/gnssN with an a=
ssociated attribute describing the GNSS type (reflecting the supported prot=
ocol, e.g. NMEA, UBX or SiRF). What protocols do your devices use (besides =
NMEA)? Do use any common GNSS receivers chips, or do you have your own? --
That's very interesting!=20

The GNSS chips used are our own.

Out of the box our receivers communicate using our own protocol. Users can =
send proprietary binary or ASCII messages, which are our own standard forma=
t that has been used for decades. This "NOVATEL" protocol is well-documente=
d online. Our serial communication ports can be reconfigured to comply with=
 various other formats, the list is quite long. You can see the full set of=
 supported protocols at the following page under the title "Serial Port Int=
erface Modes": https://docs.novatel.com/OEM7/Content/Commands/INTERFACEMODE=
.htm?


-- Q4. What are the three ports used for, or is that configurable? --
Our ports are highly configurable by the user. Some users will only ever us=
e one port. While others will configure some ports to specific dedicated us=
es such as for configuration or logging different formats of GNSS, Timing, =
and INS type data records.


-- Q5. Depending a bit on your answers to the above questions, we could als=
o add your VID/PID to a USB-serial driver, which would give you ttyUSBN dev=
ices without any need to mess with modprobe. --
This is all I was hoping we could get done here. So, "yes please!".


Here's a tiny bit more context for you - When our Linux users ask us how to=
 configure their Linux machines to recognize our receivers over USB, we typ=
ically ask them to the following:

1. Create the file /etc/udev/rules.d/z90_novatel.rules

2. Paste in these lines:
SUBSYSTEM=3D=3D"usb", SYSFS{idProduct}=3D=3D"0100", SYSFS{idVendor}=3D=3D"0=
9d7",
PROGRAM=3D"/sbin/modprobe usbserial vendor=3D0x09d7 product=3D0x0100"
 =20
BUS=3D=3D"usb", SYSFS{idProduct}=3D=3D"0100", SYSFS{idVendor}=3D=3D"09d7",
SYSFS{product}=3D=3D"NovAtel GPS Receiver", SYSFS{manufacturer}=3D=3D"NovAt=
el Inc.", SYMLINK+=3D"gps%n"


This doesn't work for every distro, but most. Another approach that can wor=
k is to simply enter this in to the shell:
echo '09d7 0100' > /sys/bus/usb-serial/drivers/generic/new_id


Does this satisfy your questions?

Thank you very much. Best regards,
James Snell



-----Original Message-----
From: Johan Hovold <jhovold@gmail.com> On Behalf Of Johan Hovold
Sent: Monday, November 12, 2018 4:00 AM
To: SNELL James <James.Snell@novatel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Adding NovAtel USB vendor & device ID to Kernel

On Thu, Nov 08, 2018 at 01:07:47AM +0000, SNELL James wrote:
> Hello,
> We produce extremely high-end GNSS (GPS, etc) receivers that are often=20
> used for a very wide range of applications. Our receivers can be=20
> connected to via USB, which will provide 3 USB-to-serial ports that=20
> can be used to issue commands and get receiver data.

Do your products support other serial interfaces as well (e.g. UART or i2c)=
?

> We typically get Linux users to create a udev file so their systems=20
> attach the USB serial ports to /dev.
>=20
> I just noticed that when my receiver enumerates, dmesg outputs:
> [=A0 414.374523] usb 1-1.1.3: new full-speed USB device number 8 using=20
> dwc_otg [=A0 414.508473] usb 1-1.1.3: New USB device found,=20
> idVendor=3D09d7, idProduct=3D0100 [=A0 414.508488] usb 1-1.1.3: New USB=20
> device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3 [=A0 414.508497] u=
sb=20
> 1-1.1.3: Product: NovAtel GPS Receiver [=A0 414.508505] usb 1-1.1.3: Manu=
facturer: NovAtel Inc.
> [=A0 414.508514] usb 1-1.1.3: SerialNumber: DMGW18050122R [=A0 414.511608=
]=20
> usbserial_generic 1-1.1.3:1.0: The "generic" usb-serial driver is only fo=
r testing and one-off prototypes.
> [=A0 414.511624] usbserial_generic 1-1.1.3:1.0: Tell mailto:linux-usb@vge=
r.kernel.org to add your device to a proper driver.
> [=A0 414.511636] usbserial_generic 1-1.1.3:1.0: generic converter=20
> detected [=A0 414.512004] usb 1-1.1.3: generic converter now attached to=
=20
> ttyUSB0 [=A0 414.512352] usb 1-1.1.3: generic converter now attached to=20
> ttyUSB1 [=A0 414.512805] usb 1-1.1.3: generic converter now attached to=20
> ttyUSB2

> # lsusb -s 001:008 -v

> I think it would be "nice" if our receiver's USB-delivered serial=20
> ports attached to /dev as /dev/novatel0, .. /dev/novatelN or
> (/dev/gnss0 .. /dev/gnssN). Though if they continued to appear as
> /dev/ttyUSB0 .. /dev/ttyUSBN, that'd also be great.

As Oliver mentioned it would be useful to know what USB-serial converter ch=
ip you use in the device, if any, or of this is a custom implementation.

Since 4.19 we actually have GNSS subsystem in the kernel, which if we imple=
ment a driver for your devices would show up as /dev/gnssN with an associat=
ed attribute describing the GNSS type (reflecting the supported protocol, e=
.g. NMEA, UBX or SiRF).

What protocols do your devices use (besides NMEA)? Do use any common GNSS r=
eceivers chips, or do you have your own?

What are the three ports used for, or is that configurable?

> I'm not entirely sure if the dmesg output that's directed me here is=20
> really intended for this sort of request. If not, I'm willing to make=20
> my own git merge request, though I've not toyed much with the Linux=20
> Kernel, so tips would be extremely appreciated.
>
> Can we please get our Vendor ID (0x09d7) and Product ID (0x0100) added=20
> to the Kernel in a sensical manner?

Depending a bit on your answers to the above questions, we could also add y=
our VID/PID to a USB-serial driver, which would give you ttyUSBN devices wi=
thout any need to mess with modprobe.
=20
> The information contained in this e-mail may contain confidential or=20
> privileged material and is intended only for the stated addressee(s).
> If you are not a valid addressee, the use, disclosure, copying or=20
> distribution of this information is prohibited and may be unlawful.
> If you have received this message in error, please notify the sender=20
> immediately and delete all copies of the message from your computer.
> Notwithstanding any applicable legislation which may provide for=20
> contracts to be formed from electronic communication, this email does=20
> not create, form part of, or vary any contract, nor is it otherwise=20
> intended to bind any Hexagon group company.

You need to remove this footer when dealing with the mailing lists, though.

Thanks,
Johan

Return-Path: <linux-usb+bounces-3881-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 038B48092A4
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 21:45:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0C5B1F211FA
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 20:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0AE34B12F;
	Thu,  7 Dec 2023 20:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="Ei42pudU"
X-Original-To: linux-usb@vger.kernel.org
X-Greylist: delayed 376 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Dec 2023 12:45:02 PST
Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D341713
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 12:45:02 -0800 (PST)
Date: Thu, 07 Dec 2023 21:38:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nozomi.space; s=mail;
	t=1701981524; bh=VnFM3R7+i438Ui6LMgSGGY3AJolC2K5O2s0ZF7m4RPA=;
	h=From:Subject:To;
	b=Ei42pudUP/COpYh0QH2WBa1XPFy5TcWk2zJN7rPjnC3Re634UDZYdQFfQXTiTVUEN
	 cI7TETJE374ZBRn0q9L1/3lhC62HRu8nC3hLrPnxIFnzkEsbNwkRyaFOwQ4v4vKOBb
	 xTrHkvSTHjXmo34TIfHvi+9Ywy1e+1nEP/WwKdrcb4qhWQ0zzgW5VnED/jNGw4e6pV
	 I4Yh/kvA8vFF2uTo8imCbZqBtkG9M31/GFtkMJxaMFQQ39Lb3TN2zBgm8omRRI/Af5
	 sm/kOq9F5rZL2u+7t7Jv9+kE78axMZoHk8zBgVNipeznIbILD8uI7+LX4MpY0GSFVb
	 9xsOdTTQep/Z1fPzQxwiSvFWaujG1awkdS9gG2tM4fMgSzcb8RYF8bbJKD9ABe3HID
	 XGcjuMXKzflxa8bMusUrpY/8vM8YYHdaTR4TeKPuGFSwZQmAuUWDeFFBbw44wH9653
	 XLQQtmlzK2uiu0+klHYWY6fY952VchMJz9R1bs9t4mwGSBBmboAfDc7i4EjlN+J/+x
	 Lr5k35t4BFfSGjuQiBR97bA4SG/AEW7R1uhMfmyGrlIP4uqEwYU93lafUBp0AqL5Jy
	 SVZMWTj3CKPH124zzHkI2ovENFA6ZprSdPzFVAz0+tVUTq5qkbVWCKhr+ZKYLKxoNd
	 IcaRvVVriRTNaWhlmmPe/G4I=
From: =?iso-8859-2?q?Micha=B3_Kope=E6?= <michal@nozomi.space>
Subject: Issue with TPS6598x driver on ThinkPad T14 Gen1
To: linux-usb@vger.kernel.org
Message-Id: <DCDB5S.JWZAY91S31EN1@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable

Greetings,

I've been looking into fixing this error in dmesg relating to the=20
tps6598x driver on my Lenovo ThinkPad T14 Gen1 AMD:

[ 12.808694] Serial bus multi instantiate pseudo device driver=20
INT3515:00: error -ENXIO: IRQ index 1 not found
[ 12.808706] Serial bus multi instantiate pseudo device driver=20
INT3515:00: error -ENXIO: Error requesting irq at index 1

Here's what the device resources look like in the ACPI tables:

Method (_CRS, 0, NotSerialized) // _CRS: Current Resource Settings
{
    Name (SBFX, ResourceTemplate ()
    {
        I2cSerialBusV2 (0x0023, ControllerInitiated, 0x00061A80,
            AddressingMode7Bit, "\\_SB.I2CA",
            0x00, ResourceConsumer, , Exclusive,
            )
        I2cSerialBusV2 (0x0027, ControllerInitiated, 0x00061A80,
            AddressingMode7Bit, "\\_SB.I2CA",
            0x00, ResourceConsumer, , Exclusive,
            )
        GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
            "\\_SB.GPIO", 0x00, ResourceConsumer, ,
            )
            { // Pin list
                0x0045
            }
    })
    Return (SBFX) /* \_SB_.I2CA.UCMX._CRS.SBFX */
}

I believe the problem is that the serial-multi-instantiate driver is=20
assuming there are separate irqs defined for each of the i2c device=20
instances:

static const struct smi_node int3515_data =3D {
    .instances =3D {
        { "tps6598x", IRQ_RESOURCE_APIC, 0 },
        { "tps6598x", IRQ_RESOURCE_APIC, 1 },
        { "tps6598x", IRQ_RESOURCE_APIC, 2 },
        { "tps6598x", IRQ_RESOURCE_APIC, 3 },
        {}
    },
    .bus_type =3D SMI_I2C,
};

However as far as I know the tps6598x family of PD controllers expose=20
multiple i2c slaves (per USB-C port) with one shared irq. I modified=20
the smi driver as follows:

 static const struct smi_node int3515_data =3D {
     .instances =3D {
         { "tps6598x", IRQ_RESOURCE_AUTO, 0 },
         { "tps6598x", IRQ_RESOURCE_AUTO, 0 },
         { "tps6598x", IRQ_RESOURCE_AUTO, 0 },
         { "tps6598x", IRQ_RESOURCE_AUTO, 0 },
         {}
     },
     .bus_type =3D SMI_I2C,
 };

which resulted in a successful probe of the driver and creation of=20
port{0,1} entries in /sys/class/typec:

[ 49.742618] Serial bus multi instantiate pseudo device driver=20
INT3515:00: Using gpio irq
[ 49.747584] Serial bus multi instantiate pseudo device driver=20
INT3515:00: Using gpio irq
[ 49.752350] Serial bus multi instantiate pseudo device driver=20
INT3515:00: Instantiated 2 I2C devices.

So I guess my question for y'all is this: would this be an acceptable=20
change to make in the driver? If so, I'd be happy to push out the=20
patch. Or is it a case of the ACPI tables being bugged and I need to=20
pester Lenovo to fix them? Or, do we need to add logic to the driver to=20
handle both cases?

It would be nice if the authors of the driver could chime in.
Kind regards / Pozdrawiam,
Micha=B3 Kope=E6




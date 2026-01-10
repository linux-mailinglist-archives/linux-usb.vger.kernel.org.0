Return-Path: <linux-usb+bounces-32132-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4A1D0D4F3
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 11:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF25B302D2A1
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 10:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FEA318BB3;
	Sat, 10 Jan 2026 10:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hernandez-ros.com header.i=@hernandez-ros.com header.b="SbT/LPEh";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="DS+FFgj0"
X-Original-To: linux-usb@vger.kernel.org
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77617318B91
	for <linux-usb@vger.kernel.org>; Sat, 10 Jan 2026 10:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.27.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768041974; cv=none; b=CUzQT5q4n7SS6IBGtEiXqC6KM6WfdIgIxo/bMvIioapT+6PwCLQV9TMb5MIWuZfgudxHNy2bm41K/sxKjJPuWnarTjYeHWwg+GMHAAB1k735AnDRF+Mz4MaDu6E+/veqzE7uwH8Zh+ujwbNqYezmhGns5Wgez2OJzpAm7KDzaU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768041974; c=relaxed/simple;
	bh=n6OX3ZyAN/TZ+H7YdgW6xC7oCKCBqoH9QXvBIdxUEO0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-ID:References:To; b=Jq16jBm3ss0MM9cqRBXsmU40ZBsNk/I2XPLrhD0X+gKExbJySyMJqqbfcot4c3Eeg6whGF+SSDAC+a4vd8fI0I3RdmMljWHPCOJ2oNpC9DcjJ2sBoNGdxc/kTfe3LuLnGD346sMcVFdna1X9BQFjyZRTtT3RQp8bN8n0UrZs9dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hernandez-ros.com; spf=pass smtp.mailfrom=us-west-2.amazonses.com; dkim=pass (1024-bit key) header.d=hernandez-ros.com header.i=@hernandez-ros.com header.b=SbT/LPEh; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=DS+FFgj0; arc=none smtp.client-ip=54.240.27.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hernandez-ros.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-2.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4vmhj3boyfilqttfply4nxrhvlvpcgyy; d=hernandez-ros.com;
	t=1768041973;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To;
	bh=n6OX3ZyAN/TZ+H7YdgW6xC7oCKCBqoH9QXvBIdxUEO0=;
	b=SbT/LPEhQSidpezvKXnZwCE/DkBpKD7u/6u9nsXW+GYK5TTzQe5HVpoucMmlbULU
	4F4JAuiI2+Uex6NhE9scfWFRZ/MBogDLV2wUZhYqwdEMUi7etuWrIoaJAUWJpHMgMLO
	wEgobIYYx5GcOJwWVdql5hgXbgK+oVWjBPnJT79c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768041973;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To:Feedback-ID;
	bh=n6OX3ZyAN/TZ+H7YdgW6xC7oCKCBqoH9QXvBIdxUEO0=;
	b=DS+FFgj0xBMKQOnB+vqyK33uQqj+vlBQzh6w/RD12jgpQV0k70BC6RWyLpqPy300
	yaHsFg5Gs99BSEqINH02xCDEwQzBsa/m08eUg2GlGL4uPYikZCXmaKCwg0J0gHA4A4i
	EKpJkHcLiSYQ1XMKbmwPtt52s6BYNy1kYTHPPHg0=
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: USB/IP bug report - dmesg filled with to usb_unlink_urb() when
 using two instances of same device
From: =?utf-8?Q?Ignacio_Hern=C3=A1ndez-Ros?= <ignacio@hernandez-ros.com>
In-Reply-To: <1b1ed320-eb7b-4b93-a1f1-84ae651abd17@kernel.org>
Date: Sat, 10 Jan 2026 10:46:12 +0000
Cc: valentina.manea.m@gmail.com, linux-usb@vger.kernel.org, i@zenithal.me
Content-Transfer-Encoding: quoted-printable
Message-ID: <0101019ba7838344-f64c50aa-ea38-498a-9196-1467688fe7d7-000000@us-west-2.amazonses.com>
References: <0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693eef4179-000000@us-west-2.amazonses.com>
 <c4559ccc-d4d4-4971-bc28-b02d80e57594@linuxfoundation.org>
 <0101019b97e8a815-bb84ea95-adbb-493e-b94a-dfe4afb55f60-000000@us-west-2.amazonses.com>
 <1b1ed320-eb7b-4b93-a1f1-84ae651abd17@kernel.org>
To: Shuah <shuah@kernel.org>
X-Mailer: Apple Mail (2.3864.200.81.1.6)
Feedback-ID: ::1.us-west-2.HjGwZwg5MFiEpu6H35PNuAp1STds0CnEvbYH/ASzZjo=:AmazonSES
X-SES-Outgoing: 2026.01.10-54.240.27.30

Hi,

> What is "nut" software in netserver?

The primary goal of the Network UPS Tools (NUT) project is to provide =
support for Power Devices, such as Uninterruptible Power Supplies, Power =
Distribution Units, Automatic Transfer Switches, Power Supply Units and =
Solar Controllers. NUT provides a common protocol and set of tools to =
monitor and manage such devices, and to consistently name equivalent =
features and data points, across a vast range of vendor-specific =
protocols and connection media types.

https://networkupstools.org/

> - What does "lsusb -t" show after binding 3 devices on the host - =
oraculo?

root@oraculo:~# lsusb -t
/:  Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/1p, =
480M
    |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
        |__ Port 002: Dev 003, If 0, Class=3DHuman Interface Device, =
Driver=3D[none], 12M
        |__ Port 003: Dev 004, If 0, Class=3DCommunications, =
Driver=3D[none], 12M
        |__ Port 003: Dev 004, If 1, Class=3DCDC Data, Driver=3D[none], =
12M
        |__ Port 004: Dev 005, If 0, Class=3DHuman Interface Device, =
Driver=3D[none], 12M
/:  Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, =
5000M

> - What does "usbip list -r oraculo" command show on "nut=E2=80=9D?


When no devices have been attached:

root@nut:~# cat usbip_list
Exportable USB devices
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 - oraculo
      1-1.4: MGE UPS Systems : UPS (0463:ffff)
           : =
/sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00=
.0/usb1/1-1/1-1.4
           : (Defined at Interface level) (00/00/00)

      1-1.2: MGE UPS Systems : UPS (0463:ffff)
           : =
/sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00=
.0/usb1/1-1/1-1.2
           : (Defined at Interface level) (00/00/00)

After devices attached:

root@nut:~# usbip list -r oraculo
usbip: info: no exportable devices found on oraculo

And =E2=80=9Cnut=E2=80=9D software see the devices and operates without =
visible issues.

> - How are you attaching devices from =E2=80=9Cnut"

usbip attach -r oraculo -b 1-1.2
usbip attach -r oraculo -b 1-1.4

> - Can you send "usbip port" ouput fro, the client after attching each =
device


root@nut:~# usbip port
Imported USB devices
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Port 00: <Port in Use> at Full Speed(12Mbps)
       MGE UPS Systems : UPS (0463:ffff)
       9-1 -> usbip://oraculo.chiton:3240/1-1.2
           -> remote bus/dev 001/003
Port 01: <Port in Use> at Full Speed(12Mbps)
       MGE UPS Systems : UPS (0463:ffff)
       9-2 -> usbip://oraculo.chiton:3240/1-1.4
           -> remote bus/dev 001/005


> I am still not clear on your configuration to be be able to debug the =
problem.

I=E2=80=99m here to help you!

I=E2=80=99ve also run a tcpdump on port 3240 just in case you are =
interested you can download it from here:
http://www.reportingstandard.com/oraculo.pcap

Cheers
Ignacio


> El 10 ene 2026, a las 0:24, Shuah <shuah@kernel.org> escribi=C3=B3:
>=20
> On 1/7/26 03:02, Ignacio Hern=C3=A1ndez-Ros wrote:
>> Dear Shuah,
>> Thank you for your quick response, find enclosed responses to your =
questions:
>>> Can you elaborate on this "sharing the two devices" part.
>> I=E2=80=99m sorry, =E2=80=9CSharing" might not be the right term. =
English is not my maiden language so let me apologise.
>> In my infrastructure, I=E2=80=99ve one Raspberry PI acting as =E2=80=9C=
usb host" "server=E2=80=9D =E2=80=9Cexporting USB devices=E2=80=9D the =
host name is =E2=80=9Coraculo". At this time it is exporting 3 devices.
>> 1. Zigbee dongle (domotics at home) connected to port 1-1.3
>> 2. UPS 1 (MGE UPS Systems UPS) connected to port 1-1.2
>> 2. UPS 2 (MGE UPS Systems UPS) connected to port 1-1.4
>> In the same local network, there are 5 servers of which 4 are running =
Proxmox and hosting several virtual machines.
>> One (and only one) of the virtual machines is running =E2=80=9Cnut=E2=80=
=9D software in =E2=80=9Cnetserver=E2=80=9D mode so, that VM (called =
=E2=80=9Cnut=E2=80=9D) is acting as the =E2=80=9Cvirtual host =
controller=E2=80=9D =E2=80=9Cclient=E2=80=9D =E2=80=9Cimporting the two =
UPS systems=E2=80=9D.
>=20
> What is "nut" software in netserver?
>=20
>> Full dmesg.log file obtained from the =E2=80=9Cusb host=E2=80=9D =
=E2=80=9Cserver=E2=80=9D is attached to the end of this email. It is =
43kb of text, I=E2=80=99m not sure it it will be filtered, in that case =
I can publish on one of my web servers for you.
>=20
> The dmesg wasn't useful. Is it possible to send me the following
> information:
>=20
> usbip_host:
>=20
> - What does "lsusb -t" show after binding 3 devices on the host - =
oraculo?
>=20
> usbip_client:
>=20
> - What does "usbip list -r oraculo" command show on "nut"?
> - How are you attaching devices from "nut"
> - Can you send "usbip port" ouput fro, the client after attching
>  each device
>=20
> I am still not clear on your configuration to be be able to debug
> the problem.
>=20
> thanks,
> -- Shuah



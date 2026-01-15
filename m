Return-Path: <linux-usb+bounces-32403-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8185D28311
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 20:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C143A30619C5
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 19:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B39A31A55B;
	Thu, 15 Jan 2026 19:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hernandez-ros.com header.i=@hernandez-ros.com header.b="YqoV7GGr";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="SknwdmyH"
X-Original-To: linux-usb@vger.kernel.org
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6DE31A041
	for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 19:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.27.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768506079; cv=none; b=lbPWTv8sP/ym5MLgVLd7M6nDgDH011YgFpTGeKevWe3eZWT4I/P0hzZ59MAhdmQQ2Z0BDwAd9nIO/98p/jwqto7GT10QLCyr1ZqxPeofj0bcrvcXO/JmFt0TKRGLA0zPqtf2wTog34w18Rwo7IpRB/yQKJkoBQx36LjZh9ibXt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768506079; c=relaxed/simple;
	bh=GrryqkuRGtjddG2HcpdNYG2slkpxHlNCNsfWL1eMJF8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-ID:References:To; b=rOzQM3lU8692ONuj7/uHlLUBS7F/0DBtcorKCVP6L/ebrTv1PhY49f8FbRnvc9upSNFCjFdKIfF6JIZVJtfaUPc5fJfMrWrMp0cQVG+sIBrpA87/AQay5fbpVitWH9yZLjb2C8dLxdxPlNME6HvIYXFxqX6M2k9T07bsWs6DUg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hernandez-ros.com; spf=pass smtp.mailfrom=us-west-2.amazonses.com; dkim=pass (1024-bit key) header.d=hernandez-ros.com header.i=@hernandez-ros.com header.b=YqoV7GGr; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=SknwdmyH; arc=none smtp.client-ip=54.240.27.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hernandez-ros.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-2.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4vmhj3boyfilqttfply4nxrhvlvpcgyy; d=hernandez-ros.com;
	t=1768506078;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To;
	bh=GrryqkuRGtjddG2HcpdNYG2slkpxHlNCNsfWL1eMJF8=;
	b=YqoV7GGrzJCN4uJc8NQ5TDuuGke2B92LGawqC2CLLPWHZv6tLefiybndYCo6Ixfb
	LT6o8X2FSHB4yOz/+ufwN6ARTGnMCdeUPW/6R+ASMln5cKIwt/D9iKcWLn2Ak20O1RX
	m23HVF/CzKC7L5G97OSFy6jgDBkdMAYx4X/5fSGw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768506078;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To:Feedback-ID;
	bh=GrryqkuRGtjddG2HcpdNYG2slkpxHlNCNsfWL1eMJF8=;
	b=SknwdmyH9IKdRjhJEqjhpkiPjQUycY/JaHbpr68FCYdG+uDmdSKU7E1lj9JWozJM
	anhJdopKUD5T79a+K40J9sDvO8y1543/cRCWyo81ywPAX9u6/8DmfO9ehObJ9/s3vQv
	f3Crw+pHw4JNwmYD1iWZzfYSEkMUjFb9U7wk0gpk=
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: USB/IP bug report - dmesg filled with to usb_unlink_urb() when
 using two instances of same device
From: =?utf-8?Q?Ignacio_Hern=C3=A1ndez-Ros?= <ignacio@hernandez-ros.com>
In-Reply-To: <d9d2c4e6-43ae-48d7-88ee-4288e6f16907@kernel.org>
Date: Thu, 15 Jan 2026 19:41:17 +0000
Cc: valentina.manea.m@gmail.com, linux-usb@vger.kernel.org, i@zenithal.me
Content-Transfer-Encoding: quoted-printable
Message-ID: <0101019bc32d3017-88891fcf-4b22-45d8-b8e4-c18a30dbbe15-000000@us-west-2.amazonses.com>
References: <0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693eef4179-000000@us-west-2.amazonses.com>
 <c4559ccc-d4d4-4971-bc28-b02d80e57594@linuxfoundation.org>
 <0101019b97e8a815-bb84ea95-adbb-493e-b94a-dfe4afb55f60-000000@us-west-2.amazonses.com>
 <1b1ed320-eb7b-4b93-a1f1-84ae651abd17@kernel.org>
 <0101019ba7838344-f64c50aa-ea38-498a-9196-1467688fe7d7-000000@us-west-2.amazonses.com>
 <d9d2c4e6-43ae-48d7-88ee-4288e6f16907@kernel.org>
To: Shuah <shuah@kernel.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
Feedback-ID: ::1.us-west-2.HjGwZwg5MFiEpu6H35PNuAp1STds0CnEvbYH/ASzZjo=:AmazonSES
X-SES-Outgoing: 2026.01.15-54.240.27.193

Hi, find below the answers to your questions:

> You are able to attach the devices from "nut" - the problem starts
> after attaching?

The problem starts after attaching the second device. Not after =
attaching the first device.

> What does "nut" run - what are kernel versions on usbip host and =
clients?
>=20

=E2=80=9Cnut=E2=80=9D runs a service that monitors the UPS devices. But =
the issue shall not be related with how =E2=80=9Cnut=E2=80=9D uses the =
device as no issues are present when it is only working with one of the =
two UPS devices attached.

root@nut:~# uname -a
Linux nut 6.12.57+deb13-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.12.57-1 =
(2025-11-05) x86_64 GNU/Linux

root@oraculo:~# uname -a
Linux oraculo 6.12.47+rpt-rpi-v8 #1 SMP PREEMPT Debian 1:6.12.47-1+rpt1 =
(2025-09-16) aarch64 GNU/Linux

root@z2mqtt:~# uname -a
Linux z2mqtt 6.12.57+deb13-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.12.57-1 =
(2025-11-05) x86_64 GNU/Linux

note, z2mqtt is using the Zigbee dongle. but that device is not raising =
issues.

> Can you detach these devices cleanly?


Yes, while on =E2=80=9Cnut=E2=80=9D I can do:

root@nut:~# usbip port
Imported USB devices
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Port 00: <Port in Use> at Full Speed(12Mbps)
       MGE UPS Systems : UPS (0463:ffff)
       9-1 -> usbip://oraculo:3240/1-1.4
           -> remote bus/dev 001/005
Port 01: <Port in Use> at Full Speed(12Mbps)
       MGE UPS Systems : UPS (0463:ffff)
       9-2 -> usbip://oraculo:3240/1-1.2
           -> remote bus/dev 001/003
root@nut:~# usbip detach -p 00
usbip: info: Port 0 is now detached!

root@nut:~# usbip list -r oraculo
Exportable USB devices
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 - oraculo
      1-1.4: MGE UPS Systems : UPS (0463:ffff)
           : =
/sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00=
.0/usb1/1-1/1-1.4
           : (Defined at Interface level) (00/00/00)
           :  0 - Human Interface Device / No Subclass / None (03/00/00)

root@nut:~# usbip attach -r oraculo -b 1-1.4
root@nut:~# usbip port
Imported USB devices
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Port 00: <Port in Use> at Full Speed(12Mbps)
       MGE UPS Systems : UPS (0463:ffff)
       9-1 -> usbip://oraculo:3240/1-1.4
           -> remote bus/dev 001/005
Port 01: <Port in Use> at Full Speed(12Mbps)
       MGE UPS Systems : UPS (0463:ffff)
       9-2 -> usbip://oraculo:3240/1-1.2
           -> remote bus/dev 001/003
root@nut:~#

All clean and without issues.

The only one issue is dmesg continuous messages:

[45519.289798] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[45521.204620] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[45521.291393] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[45523.205811] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[45523.292681] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[45525.207094] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[45525.293907] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
[45527.208240] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
[45527.295310] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()

Regards
Ignacio


> El 15 ene 2026, a las 18:06, Shuah <shuah@kernel.org> escribi=C3=B3:
>=20
> On 1/10/26 03:46, Ignacio Hern=C3=A1ndez-Ros wrote:
>> Hi,
>>> What is "nut" software in netserver?
>> The primary goal of the Network UPS Tools (NUT) project is to provide =
support for Power Devices, such as Uninterruptible Power Supplies, Power =
Distribution Units, Automatic Transfer Switches, Power Supply Units and =
Solar Controllers. NUT provides a common protocol and set of tools to =
monitor and manage such devices, and to consistently name equivalent =
features and data points, across a vast range of vendor-specific =
protocols and connection media types.
>> https://networkupstools.org/
>>> - What does "lsusb -t" show after binding 3 devices on the host - =
oraculo?
>> root@oraculo:~# lsusb -t
>> /:  Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/1p, =
480M
>>     |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
>>         |__ Port 002: Dev 003, If 0, Class=3DHuman Interface Device, =
Driver=3D[none], 12M
>>         |__ Port 003: Dev 004, If 0, Class=3DCommunications, =
Driver=3D[none], 12M
>>         |__ Port 003: Dev 004, If 1, Class=3DCDC Data, Driver=3D[none],=
 12M
>>         |__ Port 004: Dev 005, If 0, Class=3DHuman Interface Device, =
Driver=3D[none], 12M
>> /:  Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, =
5000M
>>> - What does "usbip list -r oraculo" command show on "nut=E2=80=9D?
>> When no devices have been attached:
>> root@nut:~# cat usbip_list
>> Exportable USB devices
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  - oraculo
>>       1-1.4: MGE UPS Systems : UPS (0463:ffff)
>>            : =
/sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00=
.0/usb1/1-1/1-1.4
>>            : (Defined at Interface level) (00/00/00)
>>       1-1.2: MGE UPS Systems : UPS (0463:ffff)
>>            : =
/sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00=
.0/usb1/1-1/1-1.2
>>            : (Defined at Interface level) (00/00/00)
>> After devices attached:
>> root@nut:~# usbip list -r oraculo
>> usbip: info: no exportable devices found on oraculo
>> And =E2=80=9Cnut=E2=80=9D software see the devices and operates =
without visible issues.
>>> - How are you attaching devices from =E2=80=9Cnut"
>> usbip attach -r oraculo -b 1-1.2
>> usbip attach -r oraculo -b 1-1.4
>>> - Can you send "usbip port" ouput fro, the client after attching =
each device
>> root@nut:~# usbip port
>> Imported USB devices
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> Port 00: <Port in Use> at Full Speed(12Mbps)
>>        MGE UPS Systems : UPS (0463:ffff)
>>        9-1 -> usbip://oraculo.chiton:3240/1-1.2
>>            -> remote bus/dev 001/003
>> Port 01: <Port in Use> at Full Speed(12Mbps)
>>        MGE UPS Systems : UPS (0463:ffff)
>>        9-2 -> usbip://oraculo.chiton:3240/1-1.4
>>            -> remote bus/dev 001/005
>=20
> You are able to attach the devices from "nut" - the problem starts
> after attaching?
>=20
> What does "nut" run - what are kernel versions on usbip host and =
clients?
>=20
> Can you detach these devices cleanly?
>=20
> thanks,
> -- Shuah



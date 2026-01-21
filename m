Return-Path: <linux-usb+bounces-32578-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K2yKkZ+cGktYAAAu9opvQ
	(envelope-from <linux-usb+bounces-32578-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 08:20:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5181652BC0
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 08:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BC65F5005B0
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 07:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FA1426EC5;
	Wed, 21 Jan 2026 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hernandez-ros.com header.i=@hernandez-ros.com header.b="nMhBeOx0";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="ktC2YAGt"
X-Original-To: linux-usb@vger.kernel.org
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA5437A488
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.27.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768980004; cv=none; b=LsSd+sE/GeUusOPw0DJH6C/bYqwA5PaaeFkwfXgz+QPDi/76u/a/05Y+34WKfpdUwoii9EQd8maW1wm3A5xckw5j/22knGjMA4VGO/CJsHD3uek/WLecV4RXBxAIW03vrtGYmBaJSa3qj28rvsTsvoJncUqgr5pe/v/X1n2l7PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768980004; c=relaxed/simple;
	bh=Ni7P9r6fDGEOJxp5iFEKIJVxoSos67RRAb5i6vtcZIU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-ID:References:To; b=OKi1PFs3ppK548uTkcazgkHZpUsHjV8IfpvnzQahwOjfvXzPeiTjsv5UiBbz8nlsr+5Gc5BXBug8SFTQ+40MOgciWR9qAFtinofyGisuudaLXa29w5cvvNkQaiUqB2xPfAHpEoGR8UOPDk3M8bjL89wNrMroQlQPD0BGe161HcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hernandez-ros.com; spf=pass smtp.mailfrom=us-west-2.amazonses.com; dkim=pass (1024-bit key) header.d=hernandez-ros.com header.i=@hernandez-ros.com header.b=nMhBeOx0; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=ktC2YAGt; arc=none smtp.client-ip=54.240.27.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hernandez-ros.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-2.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4vmhj3boyfilqttfply4nxrhvlvpcgyy; d=hernandez-ros.com;
	t=1768979997;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To;
	bh=Ni7P9r6fDGEOJxp5iFEKIJVxoSos67RRAb5i6vtcZIU=;
	b=nMhBeOx0XtcHXL79hIpvIupYo1Ic+ivl53cYr2A0qkJaEcfZE5NAUj+Tl5d4kBuN
	Qa0e+NHtlc6d2p7aBNjKT/VOIj9/yK21hF1ctK/k4Vp6KJwbZZOP7nZSXHWDvLnaLLD
	aX04pb2eMClc0cpGIC9vcEWlCX+txNp4x5xv445k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768979997;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To:Feedback-ID;
	bh=Ni7P9r6fDGEOJxp5iFEKIJVxoSos67RRAb5i6vtcZIU=;
	b=ktC2YAGtZoIldnN/ZAsUK39keNIKqc0zeB3Gd4lXvK8cme3OvMTpl6ZBxxh6McBn
	mSCTXJuEXgU9CkcDI6+tMOy0kZsqxq+XLCiFpCz8e6scbPHt4JbrRy52Fb3lAoqz82e
	AV1xq7JZwQvClK1vgyJ2Zvr2x5OtaKwR/zaaO0is=
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
In-Reply-To: <a56209d4-13d5-40cb-b759-f9c7870fb842@kernel.org>
Date: Wed, 21 Jan 2026 07:19:56 +0000
Cc: valentina.manea.m@gmail.com, linux-usb@vger.kernel.org, i@zenithal.me
Content-Transfer-Encoding: quoted-printable
Message-ID: <0101019bdf6ca137-60344502-51d2-4767-a34b-6a7cf1bfdf4a-000000@us-west-2.amazonses.com>
References: <0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693eef4179-000000@us-west-2.amazonses.com>
 <c4559ccc-d4d4-4971-bc28-b02d80e57594@linuxfoundation.org>
 <0101019b97e8a815-bb84ea95-adbb-493e-b94a-dfe4afb55f60-000000@us-west-2.amazonses.com>
 <1b1ed320-eb7b-4b93-a1f1-84ae651abd17@kernel.org>
 <0101019ba7838344-f64c50aa-ea38-498a-9196-1467688fe7d7-000000@us-west-2.amazonses.com>
 <d9d2c4e6-43ae-48d7-88ee-4288e6f16907@kernel.org>
 <0101019bc32d3017-88891fcf-4b22-45d8-b8e4-c18a30dbbe15-000000@us-west-2.amazonses.com>
 <63f2d81c-79ce-4568-99fa-c47da98afd78@kernel.org>
 <a56209d4-13d5-40cb-b759-f9c7870fb842@kernel.org>
To: Shuah <shuah@kernel.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
Feedback-ID: ::1.us-west-2.HjGwZwg5MFiEpu6H35PNuAp1STds0CnEvbYH/ASzZjo=:AmazonSES
X-SES-Outgoing: 2026.01.21-54.240.27.23
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[hernandez-ros.com:s=4vmhj3boyfilqttfply4nxrhvlvpcgyy,amazonses.com:s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[hernandez-ros.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32578-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[hernandez-ros.com:+,amazonses.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ignacio@hernandez-ros.com,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,zenithal.me];
	R_SPF_SOFTFAIL(0.00)[~all];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amazonses.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,us-west-2.amazonses.com:mid,nut:email,z2mqtt:email]
X-Rspamd-Queue-Id: 5181652BC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


> Is there a way you can enable usbip debug and send me the dmesg?

=C2=BFHow can I add debug information for usbip-host kernel module?

All I can find on the internet is this page:
https://www.kernel.org/doc/readme/tools-usb-usbip-README

That points to: http://usbip.wiki.sourceforge.net/how-to-debug-usbip =
which is not found.

Best
Ignacio


> El 21 ene 2026, a las 0:33, Shuah <shuah@kernel.org> escribi=C3=B3:
>=20
> On 1/15/26 15:38, Shuah wrote:
>> On 1/15/26 12:41, Ignacio Hern=C3=A1ndez-Ros wrote:
>>> Hi, find below the answers to your questions:
>>>=20
>>>> You are able to attach the devices from "nut" - the problem starts
>>>> after attaching?
>>>=20
>>> The problem starts after attaching the second device. Not after =
attaching the first device.
>>>=20
>>>> What does "nut" run - what are kernel versions on usbip host and =
clients?
>>>>=20
>>>=20
>>> =E2=80=9Cnut=E2=80=9D runs a service that monitors the UPS devices. =
But the issue shall not be related with how =E2=80=9Cnut=E2=80=9D uses =
the device as no issues are present when it is only working with one of =
the two UPS devices attached.
>>>=20
>>> root@nut:~# uname -a
>>> Linux nut 6.12.57+deb13-amd64 #1 SMP PREEMPT_DYNAMIC Debian =
6.12.57-1 (2025-11-05) x86_64 GNU/Linux
>>>=20
>>> root@oraculo:~# uname -a
>>> Linux oraculo 6.12.47+rpt-rpi-v8 #1 SMP PREEMPT Debian =
1:6.12.47-1+rpt1 (2025-09-16) aarch64 GNU/Linux
>>>=20
>>> root@z2mqtt:~# uname -a
>>> Linux z2mqtt 6.12.57+deb13-amd64 #1 SMP PREEMPT_DYNAMIC Debian =
6.12.57-1 (2025-11-05) x86_64 GNU/Linux
>>>=20
>>> note, z2mqtt is using the Zigbee dongle. but that device is not =
raising issues.
>>>=20
>>>> Can you detach these devices cleanly?
>>>=20
>>>=20
>>> Yes, while on =E2=80=9Cnut=E2=80=9D I can do:
>>>=20
>>> root@nut:~# usbip port
>>> Imported USB devices
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> Port 00: <Port in Use> at Full Speed(12Mbps)
>>>         MGE UPS Systems : UPS (0463:ffff)
>>>         9-1 -> usbip://oraculo:3240/1-1.4
>>>             -> remote bus/dev 001/005
>>> Port 01: <Port in Use> at Full Speed(12Mbps)
>>>         MGE UPS Systems : UPS (0463:ffff)
>>>         9-2 -> usbip://oraculo:3240/1-1.2
>>>             -> remote bus/dev 001/003
>>> root@nut:~# usbip detach -p 00
>>> usbip: info: Port 0 is now detached!
>>>=20
>>> root@nut:~# usbip list -r oraculo
>>> Exportable USB devices
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>   - oraculo
>>>        1-1.4: MGE UPS Systems : UPS (0463:ffff)
>>>             : =
/sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00=
.0/usb1/1-1/1-1.4
>>>             : (Defined at Interface level) (00/00/00)
>>>             :  0 - Human Interface Device / No Subclass / None =
(03/00/00)
>>>=20
>>> root@nut:~# usbip attach -r oraculo -b 1-1.4
>>> root@nut:~# usbip port
>>> Imported USB devices
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> Port 00: <Port in Use> at Full Speed(12Mbps)
>>>         MGE UPS Systems : UPS (0463:ffff)
>>>         9-1 -> usbip://oraculo:3240/1-1.4
>>>             -> remote bus/dev 001/005
>>> Port 01: <Port in Use> at Full Speed(12Mbps)
>>>         MGE UPS Systems : UPS (0463:ffff)
>>>         9-2 -> usbip://oraculo:3240/1-1.2
>>>             -> remote bus/dev 001/003
>>> root@nut:~#
>>>=20
>>> All clean and without issues.
>>>=20
>>> The only one issue is dmesg continuous messages:
>>>=20
>>> [45519.289798] usbip-host 1-1.4: unlinked by a call to =
usb_unlink_urb()
>>> [45521.204620] usbip-host 1-1.2: unlinked by a call to =
usb_unlink_urb()
>>> [45521.291393] usbip-host 1-1.4: unlinked by a call to =
usb_unlink_urb()
>>> [45523.205811] usbip-host 1-1.2: unlinked by a call to =
usb_unlink_urb()
>>> [45523.292681] usbip-host 1-1.4: unlinked by a call to =
usb_unlink_urb()
>>> [45525.207094] usbip-host 1-1.2: unlinked by a call to =
usb_unlink_urb()
>>> [45525.293907] usbip-host 1-1.4: unlinked by a call to =
usb_unlink_urb()
>>> [45527.208240] usbip-host 1-1.2: unlinked by a call to =
usb_unlink_urb()
>>> [45527.295310] usbip-host 1-1.4: unlinked by a call to =
usb_unlink_urb()
>>>=20
>> Okay the only problem is these messages - these messages are
>> informational and there aren't reporting errors. These should
>> have been debug only - I will submit a fix to change the level
>> of these messages similar to how stub_rx and vhci_tx/rx handle
>> this condition.
>=20
> Is there a way you can enable usbip debug and send me the dmesg?
> On one hand the message itself isn't error, however it will be
> good to understand why so many urbs are being unlinked.
>=20
> thanks,
> -- Shuah




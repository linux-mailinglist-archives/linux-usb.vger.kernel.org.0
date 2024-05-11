Return-Path: <linux-usb+bounces-10239-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF9B8C33AD
	for <lists+linux-usb@lfdr.de>; Sat, 11 May 2024 22:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D61A281DB6
	for <lists+linux-usb@lfdr.de>; Sat, 11 May 2024 20:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9626200C7;
	Sat, 11 May 2024 20:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="REnqJNC0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09801CD00
	for <linux-usb@vger.kernel.org>; Sat, 11 May 2024 20:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715458067; cv=none; b=DtL8NUejnUmOks6pdeqv1+D46Zh2AVfPiUewRrS2LTSdGrLr94Rc+sq8wWcZp7WNZwPWFfWWlC4WB6rCWor2dQd5UMHu0VKecja1cpg0oc2YY3/Uhjx4ROJTJ1EKQcvrVOBp/Sz70XWLHsbWhYR9iXTqgCc1humc0J6D72qvVDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715458067; c=relaxed/simple;
	bh=iXmNza1Tspmea9eXCSFeuNeqJGiOXwYSEsx2QZOAUrE=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=p+8jNRbsmE5bU3/Sfo4I1ZRh4Lypzezr7+vJ2fzMzUB7AxXCsk1Sl8/S5FNrdGZJpUZsO4JWZSqFNBkADKe4Qh4luIcTfQeyao73VxKR3eC7y5NsWEoIE3996qRdJwWHbT1OuxgxFFrXaOIenYpNRZ3Fl6ZrhU1dG5Xpuh8nu28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=REnqJNC0; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1715458057; x=1715717257;
	bh=OLMiN1tkuay/pFtEs0E7N0k19+opogmhJPGmpiMK6sY=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=REnqJNC0WlPcM8VvmPWoOayGZHgTSBqeH5oegFqCToeQDwnjQnipcbCf25as7jsmI
	 1MNA2KVm+5hmBoRhNNgwESgM1hryB6pcIyHR/b0WvmSZRj7pbxZO29rxa3oOn7mEIU
	 Ugo9IGkOUgP3ysJaEa1PfHmJHAy2uKVOAsehfxGFJftK0KCa13nHEa+iaAXWFYf83Y
	 +Ctvd/bnmAee+dtK7wpPFJ1wSw1WCPyh5CJYJ/pI0vUUxxqQ17IPRaRetGniH9xePC
	 cWmFCcWOJM5duH1qIzuL4bL2MJvI3di84Ed752zIU/SAnYjBnEoNzReDZBChLJewte
	 ZZj7CwDGdh2tg==
Date: Sat, 11 May 2024 20:07:33 +0000
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From: Ethin Probst <ethindp@pm.me>
Subject: Assistance getting the Universal Audio Apollo Solo USB to work with Linux
Message-ID: <DJiA8anOC3V1gHoj0H-8pmsXujLNu7IlZvNmvUEoDfnjC5VIzZ3YsoTgnUD-zVTsnhgln5BzEsy1n4YkoqkEd_pvTF9oZaukzUoyL-pDfRs=@pm.me>
Feedback-ID: 24240837:user:proton
X-Pm-Message-ID: d8dfba1f364a6e766910bee1c5ee6a575d0fa747
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------ac809077b0781efe516d105caebe76876878986d078088e5dfc8721b374f2ae3"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------ac809077b0781efe516d105caebe76876878986d078088e5dfc8721b374f2ae3
Content-Type: multipart/mixed;boundary=---------------------8a2db5236445da8af32e1ce7977534c8

-----------------------8a2db5236445da8af32e1ce7977534c8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi everyone,

I'm new to this mailing list and have never done anything like this before=
, so I hope I'm following protocol and stuff! If you need any info that I =
don't provide here, I'm happy to provide it, but I'll do my best to provid=
e all the information I've got in this email (which may make it quite a lo=
ng one, sorry!). If this isn't the right list and I should send this elsew=
here, let me know, though I felt this might be the most appropriate list t=
o go to since it may be an audio device but I feel this is much more of a =
USB problem than anything else. I'm not subscribed to the list, so please =
CC any replies.

I recently acquired a Universal Audio Apollo Solo USB audio interface and =
am curious about getting it to work with Linux. There are no official driv=
ers, but I'm hoping that we can at least get the audio interface part of i=
t working. The Apollo Solo is a professional audio audio interface with an=
 onboard DSP engine and audio interface. It doesn't quite conform to the U=
AC, but it does present input/output/clock source terminals via audio clas=
s descriptors. Or, rather, it does... On Windows, anyway.

And this is where everything gets confusing, so I hope I'm explaining ever=
ything properly.

When the device is plugged into a machine that doesn't have Universal Audi=
o's special drivers installed, it presents itself as a Cypress WestBridge,=
 vendor ID 2b5a and product ID 000c. However, when the drivers are install=
ed, the drivers do something I'm struggling to identify to "boot" the devi=
ce and many things change. When it's in it's "special boot mode" (or whate=
ver you'd like to call it) it runs at USB 2.0 speeds and presents a signif=
icantly different device descriptor:

    bLength: 18
    bDescriptorType: 0x01 (DEVICE)
    bcdUSB: 0x0200
    bDeviceClass: Device (0x00)
    bDeviceSubClass: 0
    bDeviceProtocol: 0 (Use class code info from Interface Descriptors)
    bMaxPacketSize0: 64
    idVendor: Unknown (0x2b5a)
    idProduct: Unknown (0x000c)
    bcdDevice: 0x0100
    iManufacturer: 1
    iProduct: 2
    iSerialNumber: 3
    bNumConfigurations: 1

However, when it's booted, the device descriptor is:

    bLength: 18
    bDescriptorType: 0x01 (DEVICE)
    bcdUSB: 0x0320
    bDeviceClass: Miscellaneous (0xef)
    bDeviceSubClass: 2
    bDeviceProtocol: 1 (Interface Association Descriptor)
    bMaxPacketSize0: 9
    idVendor: Unknown (0x2b5a)
    idProduct: Unknown (0x000d)
    bcdDevice: 0x0000
    iManufacturer: 1
    iProduct: 2
    iSerialNumber: 3
    bNumConfigurations: 1

Through careful analysis of the firmware (which ships with the drivers and=
 doesn't need us to dump it manually), I believe the onboard board is a Cy=
press (now Infineon) EZ-USB 3.0 FX3, hence Linux identifying it as a "Cypr=
ess WestBridge". The MCU is an ARM processor, though I am not certain whic=
h ISA revision it uses.

When plugged in and in it's boot mode, Linux is able to extract the first =
device descriptor above, but is unable to enumerate the device:

[   61.091703] usb 3-3: new high-speed USB device number 4 using xhci_hcd
[   61.299491] usb 3-3: New USB device found, idVendor=3D2b5a, idProduct=3D=
000c, bcdDevice=3D 1.00
[   61.299502] usb 3-3: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D3
[   61.299505] usb 3-3: Product: WestBridge =


[   61.299508] usb 3-3: Manufacturer: Cypress
[   61.299510] usb 3-3: SerialNumber: 0000000004BE
[   66.674005] usb usb2-port1: attempt power cycle
[   75.107555] usb usb2-port1: unable to enumerate USB device

If I try to force-bind the driver, this of course fails:

[  220.383312] usbcore: registered new interface driver snd-usb-audio
[  257.877076] usb 3-3: cannot find UAC_HEADER
[  257.877401] snd-usb-audio: probe of 3-3:1.0 failed with error -22

However, when plugged in and I'm booted into Windows, and then I reboot in=
to Linux without powering off the device (such that it remains in it's nor=
mal mode that Windows sets it up in), the snd-usb-audio driver is able to =
enumerate the device but can't figure out the sample rates:

[  100.447871] usb 2-1: reset SuperSpeed USB device number 2 using xhci_hc=
d
[  100.464845] usb 2-1: LPM exit latency is zeroed, disabling LPM.
[  100.467241] usb 2-1: parse_audio_format_rates_v2v3(): unable to retriev=
e number of sample rates (clock 128)
[  100.467444] usb 2-1: parse_audio_format_rates_v2v3(): unable to retriev=
e number of sample rates (clock 128)
[  100.467798] usb 2-1: parse_audio_format_rates_v2v3(): unable to retriev=
e number of sample rates (clock 128)
[  100.468047] usb 2-1: parse_audio_format_rates_v2v3(): unable to retriev=
e number of sample rates (clock 128)
[  100.468249] usb 2-1: parse_audio_format_rates_v2v3(): unable to retriev=
e number of sample rates (clock 128)

So, what I crucially couldn't figure out -- and what I still don't precise=
ly know -- is what Windows does that Linux does not which causes the devic=
e to boot up and present itself appropriately as a USB audio device, at le=
ast basically. Obviously it still requires quite a bit of manual tuning, b=
ut I feel like if we can figure out how it's initialized and configured we=
 could get USB audio IO working -- and that's all I care about right now. =
From what I could tell the USB audio interface is interface 1 (x-x:1.1), a=
nd the DSP engine is interface 0 (x-x:1.0).

Via repeated tries and lots of time, I've managed to set up a VirtualBox V=
M that I then installed Windows on and then the drivers. Though this VM do=
esn't fully identify the device as a UAC-conforming device (that is, it do=
esn't show up as an audio device but does get initialized), I have the pac=
ket captures from my windows install that I'll provide below for that part=
 (switching to it as the default audio device, selecting sample rates and =
so on). I've managed to capture at least 3 captures of USB data, but all o=
f them have over a thousand frames, which makes straightforward analysis d=
ifficult for me. It doesn't help that I'm not very good at this to begin w=
ith, though I'm learning as best I can. Though I am not positive all of th=
e files I'll provide will be useful, I thought providing more data than wa=
s actually needed would be better than being overly conservative and not p=
roviding enough. Thus, this file (https://cloud.the-gdn.net/s/Kxme36mogoGF=
rWr), hosted on my nextcloud instance, has the following files:

- All the packet captures I have, with one being just a quick connect-forw=
ard-init sequence, one being a connect, forward-to-vm and then a wait for =
quite a while because I was installing the drivers (though they may not be=
 all that desimilar), and one being the packets that USBPcap was able to g=
et on my windows install, though I'm not positive how helpful that will be=
;
- A folder containing all drivers for UAD software;
- A folder containing an assembly language dump of the uausbaudio.sys driv=
er, which I (believe) is what does this sequence, though I may be wrong; a=
nd
- A folder containing all the firmware for all of the devices in the UAD A=
pollo family, for both the initial firmware, update firmware, and firmware=
 for the DSP engine.

The main directories that I think are important are:

- asm-dump
- captures
- Drivers/audio/usb/x64/win10
- Firmware/USB

I think the stuff related to UAD-2 are for the DSP engine and not all that=
 relevant (but maybe it is relevant and I might be dismissing it out of ha=
nd, I don't know). The capture files are:

ua-init-short: this was when I'd plugged in the device and told VirtualBox=
 to plug the device into the VM and capture it's USB data. After Windows i=
nitialized it, I immediately unplugged it.
ua-init-long: This file contains the packets from when I plugged in the de=
vice into the VM and began capturing it. Specifically, Windows set up the =
device as it does with any PNP device, and I obtained the drivers and inst=
alled them, and during that installation process the device was initialize=
d.
ua-init-windows: This capture contains the data I was able to get from the=
 USBPcap side of things. I had Windows running natively with the drivers i=
nstalled, so I started capturing, plugged in the device, and let Windows f=
ully initialize the device, including switching to it as the default audio=
 device.

I know that this is a long message and will probably take a while to figur=
e out, but I know I'm not the only one who's wanted to get these devices e=
ven preliminarily working on Linux, and I'm happy to assist and help in an=
y way I can. I'll end this message here since it's getting quite long, but=
 I hope something can come of all this, and again, sorry for the (really) =
long message!


Signed,
Ethin D. Probst

Sent with Proton Mail secure email.
-----------------------8a2db5236445da8af32e1ce7977534c8
Content-Type: application/pgp-keys; filename="publickey - ethindp@pm.me - 0x846BFA7B.asc"; name="publickey - ethindp@pm.me - 0x846BFA7B.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - ethindp@pm.me - 0x846BFA7B.asc"; name="publickey - ethindp@pm.me - 0x846BFA7B.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4c0ZOQkY4aHpqc0JFQUM2RWJL
V2RLbFJLOGt0VE1VYUJPYVozQU5aUS9lWm0rMnZHYzFnN3JtdWwxV0cKM0dEc29YOTQ4ODZrLytZ
eHlOQlpjckhBdjh1VjNOU0dQZFZueUN4YTkyOUJBSElCNjFpZTRvMGpUL3V1ClhPVExQWUpwaFJm
am1JaHZDcHhNNE51alZkZDNtSlZnMDJVdU1EUGkzMVNkMmtJU1l6MWlnaGM1QjhPZwpHdlN3QzRT
NStySmFCdzJpYUxIa0dHNWVDSGpJVkN1LzlhbXRZOEhQV1gzWm5INFYvK3lVWmJZd2g2bVoKT3E5
SXo2Tmh6Q09aaWpPRGhPNWhKZkkrUFh4Tm85RWg1cVQ0c1RmVEt4T2F6eEp0SlVrMFVvNjJYeXVm
CklCamtLZWlLMkd3bUhlNnRYd1FWVXp4UXJ6VVc5NEQ0UzBCYlhsRS9NbFJ1MGU2TGRaVnVuWnNB
WXh2TQplWUlTNjg0V2V4Q2g2RmRBZWFNUU1IakRKTHdQbGliZVF4dUdJd3kzbGtqYTJ2Q1JlbFlm
MWw0N0dpR0IKZXZZSHBBbU9DVzVBRXh5TjQ5YkRZUHJxN1J3aktIaGNsTS9SYm9wN0Fmc1R3Mlpp
MU4ybURmUjRSdjBuCllZRUdQVFpFYXU5VnFMY2N3cHk5aDJjcXhtL3ExaWR2NmFpcUhSSVczMTlz
Q3hnbGN4NHlmODBhbVVoSQpUSVV2S1h3RE9BUUhpOXFJL0JSb3dQL0dFbUxxR3BMczBzWW1PdEF0
aXliZTAvbDh5U0tRK2JaR3g3WE8KUFptNytMdVZHK1ZmYnNIUFVqV1d1YXZ5czRXNmFGK0hDcng3
RUd5dmdUUHJmS0pHVkhKOVFIeXhRbmZJCk8yd0JuNWUrMWY3dXQxdUp2YUNuMHo4K2wrZC8weU1C
dTJMVzJ3QVJBUUFCelIxbGRHaHBibVJ3UUhCdApMbTFsSUR4bGRHaHBibVJ3UUhCdExtMWxQc0xC
alFRUUFRZ0FJQVVDWHlINE5nWUxDUWNJQXdJRUZRZ0sKQWdRV0FnRUFBaGtCQWhzREFoNEJBQ0VK
RUJDajZDMzhXN3NSRmlFRWhHdjZlOXgvZ3MrL2M5ODVFS1BvCkxmeGJ1eEdWOGhBQW1BaUIxWTVU
SE5EcnhSS0ZtV25lNVhsUlNwMTY2Y2M1MkZmL3dZVEY0dHdlVmNTZQp4MVR4a0RlaVl4YXM5dURV
amJlcnJxazhLWjJScG9VZW5YeHZSK1pwZm5ocytXVnljYThwNGJsdVVvSksKbVJnby9IOEo2RWl5
eWpjN0w3cG1Vc2VMcExxbjIwL2s5OWk0QUlSVndFZElPb0tuRjFaOUQ1emFsM2lHClMxWEVlMi9r
bzFtTHNsZG9lWTNITmFhYjAxdCt2UUdXVVJmYU55d0VlVFFDbUY0a3lFcFBvYjVKb2R4NQpTQ2Uw
RGJPRTV0M2NydStxQWFiMWgweG1JbjVadUpZMjFjdENqNjladXRIMWFVWmRGeFNCMFNwakc5WXYK
ZzdNQkhZSWxONEdiOTRHZHlzcldSc0NldGhuZ0ZYeG5sUkNObjA1bC9DNWlnelhvcHUvRXVVQmFt
V2ZvCmtGQThuRE9md1luTC9iWHArRHAzKzFRM2ZjaFRhc0VZU2FYL3VqVmZqdlJ1a3pDdUErMmdB
YllMdEk2agpDRTQrSzQ4QmR3Z09FYmtmOXRIZnJ1S2FDcEtEdTFzdzVXSjhZL0U2L2hvTStxSS9t
Y3F4Y0lobzczL0EKcFFNL2MrUU9hQjN0MzdMUWV1V2VpOXBFRFZvSHpPVFZ4R3FEYmdSd0RZMVFa
RDV0NmlUSElCcmRuZFF2CktjMVBiRXo4SGFmS0F0OWNpVlpUY09ueDZQdEFBdVliSmFSdnIrQ1d5
MHBETkdPRnNPeVI2NXNXZFJBLwpnOTB2SHZ2TEgrUDhlUXhwZXFnWTYyZG1Uak1OZUVSYnk4d1dm
QVgrRnVmU09XVEJDQjE2a0ZHQW96QmkKa0UxejZwUWNpM2ljNUhUVlpoREl3YUhkaGF5bVRXOXEz
cHJPTXdSZklmQWJGZ2tyQmdFRUFkcEhEd0VCCkIwQUg5a21nMktOSUFQZTF0RlQ1cDZIUFRvNThR
NjZPdjBKdFdYWTVkcndPRmNMQjdRUVlBUW9BQ1FVQwpYeUg0TmdJYkFnQ1lDUkFRbytndC9GdTdF
WFlnQkJrV0NnQUdCUUpmSWZnMkFDRUpFSDM4NnBlbVU1T08KRmlFRTQ4NE95N2ZYR2t2M2sxam9m
ZnpxbDZaVGs0N1g0d0VBKzgzS3lHdFk4OG91WWgzS2NtMXJQdmljCktVSHV1TWpZSnRvMGFDUXRO
YmdBL1JvR0Voc3NwOGRYWG5NRU4wZVlSSnBHeCt2ekhyV0ZPK0ZsZUVoNQo0UFFFRmlFRWhHdjZl
OXgvZ3MrL2M5ODVFS1BvTGZ4YnV4SGp1eEFBbWVYbW8wTGlWckpEVFRDZUxKdFQKTEFQRkZ6RjJ5
SzJQS0x2eHZaMENWaEFSV0xlWTUraENKblcrRzY5ZGxSRE9PMDh6M2dHZTJFWTZqdjFICkphc1hV
M1pnVCtuVGNaYmlPdFhrSjk5YjRzcVZ0OEEzM1pmWERNeWJNS3dyNUhCMXMzVG54RFZKNWZkeApz
N0wxMmxLZTFISDJnYUZqeXpyNzJZYjkzV2dOdng5MXRQL1Y1VE5CaUQyZXQyc1l3RTlnTFZOTWhs
Y1MKbS9UcGdXMWRUaGlwRHR6UmJmbDVsdjhOWWxaSDNBdFpyejNBeWpNRnhUbzNBWkJ5VjR1Z1lO
S0hVT1RCCm5JbEI3V2tLeW5TRlUrMHEzRFB0TXRMbSthV0NjMTNoQjEzcVA4Y01Ca1hnSjdnOUJU
QlNadWpZaWd0eAp5L3RSWW44cUpFbFdxOXZ4cUJGbjkrSlFzbElBY0dxRnRIYWVtQ0JMMEVsRXM2
THZEQWE5Y2ZFTEg3ajYKYkFOQVJXNTNBSWg5elIwdkFVSlp2d2F5UUhZeVdmb3orc253d3k4M21u
bUlsRGdXRnpiYnlxemtMYmNhCjBiemR1WGF5WHp3Ui9keDRSaElwQzNRbUQ5ZStNcGI2QUlLMGc5
MnFqVDJ6Sjk0eURmTGJxTU9NUW13egpmc0pBUzBFOUpIUHBXd0QwNndDRDEwTmpXRmlBVjluSm5R
bGVqMTNzV0xrZzUxRkJXU0kzK24waHgxVGMKeUowWWh0Y09TRUJCVi9NUWxacDFRdSs0Z0tkbmFP
VkpLN3RudlRGWnNBZTg1eHhLUDRjcjNBTDgzelJFCkRzSVB3RVEwNUl4RG9LWjhwQzFWRUZjRHQ5
OHBlem9NbVIwc2RERk13SE14WXJSK3FwL0dBZWkwWU90Twpxa2pPT0FSZklmQlFFZ29yQmdFRUFa
ZFZBUVVCQVFkQUM4Q21MUE9jSDJkSG9jWDBydFhNVlVRcVhncTkKVHlMTFZPVWl0RHlWWGhJREFR
Z0h3c0YyQkJnQkNBQUpCUUpmSWZnMkFoc01BQ0VKRUJDajZDMzhXN3NSCkZpRUVoR3Y2ZTl4L2dz
Ky9jOTg1RUtQb0xmeGJ1eEhzTlEvL1ZCWFpFUzBVdWJVUFpBYWhBTUVueVNvQQpnZm5oN2Z4TW04
UWFYOUE0bnhyeWFaVUh2U1MvSDZVbEZlQ1FaVHZ0dWhVbFhHdVVrbk9mRVhIU1g1WDQKQjRTSng3
Nktrb1hveFNQTjJrVWwwTW5qOW50K1JRcndJR0o0ZWl4Y1BFYWFDQXV3akhTc05IS0t5ZjRkCnNU
OFhXMUljYVFJSHl2cFp1UHFkRHBuem9tbUVtWnZHbGxwVk9SRkJOQm8vRTJselFCTGU5eGgyT0dT
dQpuOFFhZTdGcFphMzluN0NSQ3VZaXJOTHNoWGI5NTNORUpWZWQrYmNDUDlnbzRBSG9QZWpxcktq
MHhNVUIKaURjRldtT3N5Qy9uMWVHTmpjTkgzZUYxdVdMZXVJSFRKL3hDSGZ3SmR0OFU0Q1RCU2k1
QTNpbXkwclZlClJoMGh5UitGSk1kSFVmZ2lVVjJYVmdiZE41ditoeUNYRE1LTTQ1akNlWitKczFG
VXhnbFExU2xOclBVZwpqYlJ5enE1bzVKMFg4TGNoUU56QTErSW8xOUVqSnFydjNhY0E5a1hhK3Q0
VHBrNTNDQVBRSGFYbDVlakEKbzBBUFJERGwwQTQwQldjRXRHOVJia2IxZXk1RHB3SUZqcUQ2N0Ex
Y3JsamVVZXBDWDZBNTRocmE2U1JZClNjeVpqVnF0TUh0RmhLak9GRVFCT2dWN3hRa1N0QU1ac01v
MEtOUk5CNlJtQ1FDamJnV0UveDNGQllCMApkRlZubTlHcTl4MWg1cW96bnVDOHBYN2dvMmZGQVJR
czRRZXhBcGZSNytjaWxMdERibEhTc1BrVnVyT0cKanp5OWN0VU9tb1VBZjNIVEM1UTJpUTA4QkxX
UE13SGRoKzk5YVpzRTdrcDVNUFB4SUI3YW9KMlJ6ajdPCk13UmZJZkJwRmdrckJnRUVBZHBIRHdF
QkIwQkhWcFdGZ3JUbjlqM2Y4SVVWMDgvRG0wcy91Vi8xcWhyUQppOXo1MndKUzBzTEJkZ1FZQVFv
QUNRVUNYeUg0TmdJYkRBQWhDUkFRbytndC9GdTdFUlloQklScitudmMKZjRMUHYzUGZPUkNqNkMz
OFc3c1JXUzBQL0E3aFJFTE1WL2RSYnUvOUIwU2ZBOERUQ0hWQ3A2bE1qQ3lnClB6WjlZaExXT2xH
Q3RZN0J4akZHMFpwS0Nsc1RSU2ppdGNTbGZzTzZFdGtObWVOUGNyNVduZHdDSFJxdQovYVNWWFFr
QUJxODFtYWZKTERBT21tWmdHSWNnQnYvaE1YRFpKYjFFS3RLekszMEFqMFdHalpkb1dKSDMKN29J
ellObWJmVDdFMUpCcFNYUno0Mnh5SjBiOE1zMXZGN00zelcrL0Y3bktwM0JYdGZtTVIxeHZObDlQ
CjZuc3pNRzRacVFydzBNTlV5TkRMY1JLQ0NXRjJmNFVtbWQ0M2FYTVgwSnM4NFQwSjB2RGREZGht
cFNQYQo1bFhtUXdZdkVldmV6WWx2Z0lxZTNyRDlYM01kV2JCSnozQ2Q5MWJDSHJldG42ZzZTbXZr
elRBMTNockcKRWRoYk5heTFraCtjZGoxSGYxQjU5eUtXa0tWRDNnNmp6YS92bERmdGhQUlJxd0NZ
QW5LZnQ1TWpHUjlqCnpnN0FDQmhsTkpScXRsZTQxS0p3SnkwRWpjZS85cklBZWszTHRnR3E1Y3NM
N2VSR3JsQis3VFR3OXZYUwowaFJaSUIyOUZ0Z3FVQ3FCNVQyNlRhRC9hM0JvWTkzWW1sajNEcHlR
TDM1ZHZZR0phR3NjdU0yVC9vSVoKWUh3M09PWkVQUXVObmdaZmpYRDF1ZmdZOERHc1JtaVoxYkFC
cnVkM05UME52bU9GczRtTmJpU2w4Z2hZCnFGMXR4U1dxR0g0SkhEK3F1a3EvVzJ3a3dZOVF2OTFU
d29LbHZwQVFmS2xJaSt1dW1xUFF4NUlhN2hyRQpVRi9NN2wxcTBtdWlnY04vRmlWc255V2NXVDUx
OWhNZ0RISGFUd0VYbU1qc2s3TGMKPVlNb1IKLS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0st
LS0tLQo=
-----------------------8a2db5236445da8af32e1ce7977534c8--

--------ac809077b0781efe516d105caebe76876878986d078088e5dfc8721b374f2ae3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKACcFgmY/z/YJkH386pemU5OOFiEE484Oy7fXGkv3k1joffzql6ZT
k44AACt4AQDLTRfinV5zu9ThKddaaWGahCsww7obNLuiHFITOcXCNwEAiBY9
T5aeFvR9B7xzF8xJqDc5lMsw2hDGBnfL1GNM6ww=
=d1ti
-----END PGP SIGNATURE-----


--------ac809077b0781efe516d105caebe76876878986d078088e5dfc8721b374f2ae3--



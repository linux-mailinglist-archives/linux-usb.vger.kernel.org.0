Return-Path: <linux-usb+bounces-33111-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cADpAAung2mhrwMAu9opvQ
	(envelope-from <linux-usb+bounces-33111-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 21:07:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3797EC5B2
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 21:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3CB2301379C
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 20:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3002E38E5F5;
	Wed,  4 Feb 2026 20:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="YzUr1seN";
	dkim=pass (2048-bit key) header.d=a1rm4x.com header.i=@a1rm4x.com header.b="jhiJKyLa"
X-Original-To: linux-usb@vger.kernel.org
Received: from a2i327.smtp2go.com (a2i327.smtp2go.com [103.47.205.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C706D23D7D4
	for <linux-usb@vger.kernel.org>; Wed,  4 Feb 2026 20:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.47.205.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770235653; cv=none; b=gjD8qvg94A2+n4gpqGN3xrCRJJWkGdFFXCHwlCo+vMyJGbkWQtrsPlRnMCw4hH9Cx8hnGqC/GT3PwdztMCxOr/J1pPk8duI+IouFfNcFfFpLoz2IpZAEARes1iQ4Z1PlNvjhFYGMU0cKFmTBaF2IYSHN2haWE5EDI7qyhn1UHSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770235653; c=relaxed/simple;
	bh=YRlujBnxIXHUnmtLmJsrKh92pupFjeGkT+ZVMxNBc34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtLj8YDlo5oIUEn5gyHPgQh3zASrTz3rXAR4lWxHB2ueEvcvGfvWwLV8TM0I/JIExSUHv2EdSkLop4ua1yymJLvg4mqYHD2/0ge0xHWEvHHHouzSy9QkJ2at/kLlrcXOu4PBpiZjgN0St1sHhDahRl8d3XdKQotBWYjQiFHOn4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=a1rm4x.com; spf=pass smtp.mailfrom=em938170.a1rm4x.com; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=YzUr1seN; dkim=pass (2048-bit key) header.d=a1rm4x.com header.i=@a1rm4x.com header.b=jhiJKyLa; arc=none smtp.client-ip=103.47.205.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=a1rm4x.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em938170.a1rm4x.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mk3wa0.a1-4.dyn; x=1770236553; h=Feedback-ID:
	X-Smtpcorp-Track:To:Subject:Message-ID:Date:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=cU+zqOqXZ+gYJ62Bln/CvG8lqtWSe9yKgCfpo/ym35k=; b=YzUr1seNnjujsU8c97BRL5Rsrn
	h0MadNlObIcuJezB0iUWqFBjJ/yBzt+ooZIeut0ykBIqqqZfiGihEgirGDMdaR89loNoLZI/J6Q8z
	DNjS8bBzuFIJAiIXNFSzWsC+xtpLt/KrjLx9wagIplpr+LRZRrc6Vd5lpAGaXT/tBtUXrDdDRiavh
	01n4VyW3yPMxydC8b7L3hjE6dv1qNLHQmsN+z+Pa+2R0G0C1t/Ig+2WZXe5Xk+TvatZ5iD6RktsIZ
	zbEsFAAkr6WRRvCpIReFEbdvXWp76Nj9kPP7CwB30NIuN88Shv3TGDnd6TUu96PmnBpFaPPHDN2+o
	TzxypmKQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a1rm4x.com;
 i=@a1rm4x.com; q=dns/txt; s=s938170; t=1770235652; h=from : subject :
 to : message-id : date;
 bh=cU+zqOqXZ+gYJ62Bln/CvG8lqtWSe9yKgCfpo/ym35k=;
 b=jhiJKyLa3O2q4z4wbu9fpJt3Q8qoWP8aTvcpVUG+OSDK5S86viWppzBL1KdNYN9vaxu/e
 PaPoe5tt2H4geIxMSREbYZ/b1eruyUW8jLMr9CloDrhVuTA4J6gj+fB4wPO2ZsAbhQ+QpDK
 BZXVQwtJ01ghg6We8zPjETi8SREsuSQuE5qk6hphn38UxmTK7rJOFVMTJtSDhOohJ+ml/Wo
 2nmRgyQJWP8TI2McEF2ThhCMFPCpp3/8x2Jp/5Hr1KgBXWbpptNVT9QtdujoEfndSV37P95
 q1X4CLURgSwoQXcQbQQsDYOUrTzJ758OeW7dfz3zZEoIgo6/o7QS71Q/xCVA==
Received: from [10.45.79.71] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <dev@a1rm4x.com>)
 id 1vnium-pH9Os3-Uo
 for linux-usb@vger.kernel.org; Wed, 04 Feb 2026 19:51:53 +0000
Received: from [10.172.245.14] (helo=mail-yw1-f174.google.com)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
 (Exim 4.99.1-S2G) (envelope-from <A1RM4X@A1RM4X.com>)
 id 1vnium-4o5NDgridOF-thlE for linux-usb@vger.kernel.org;
 Wed, 04 Feb 2026 19:51:52 +0000
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-790b7b3e594so1505587b3.3
 for <linux-usb@vger.kernel.org>; Wed, 04 Feb 2026 11:51:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW8gLSkjd8LQpASl2RuwEnHfpXi0RlFSvXd+tIEUT+5g1prPsBGxefwNwB4FzexwijaslNxi81yvsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQcI1T3007kYRWr3q/iVHp9dsKnmdxgEL+tsoe87TmHHAsQM4B
 8kjnVJUuJAJIjx8MAo2cEzOlqUAlAUZt/rDUGkx/l3Wd/ks39NF0NK07Kg20n8Nq3zY7X0BOiQ5
 qBnz+VJUyKnBOEwHDWul0dHd3L0gK+j4=
X-Received: by 2002:a05:690c:688d:b0:794:9317:babb with SMTP id
 00721157ae682-794fe63f572mr40414747b3.13.1770234711186; Wed, 04 Feb 2026
 11:51:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204032938.61553-1-dev@a1rm4x.com>
 <2026020457-distrust-vision-e5de@gregkh>
 <CACy+XB-Z26Bx2Zb4omoRq00L4tTAQxe4QWSQ1f=eFMryqb8Ksw@mail.gmail.com>
 <2026020419-drilling-area-0c1f@gregkh>
In-Reply-To: <2026020419-drilling-area-0c1f@gregkh>
From: A1RM4X <dev@a1rm4x.com>
Date: Wed, 4 Feb 2026 14:51:35 -0500
X-Gmail-Original-Message-ID: <CACy+XB-f-51xGpNQFCSm5pE_momTQLu=BaZggHYU1DiDmFX=ug@mail.gmail.com>
X-Gm-Features: AZwV_Qjr1OQ-J7qVt8yWUvfUCYGzztnFEc24Rgs6JhYxfhItJDg4-1P7Wgqx0m0
Message-ID: <CACy+XB-f-51xGpNQFCSm5pE_momTQLu=BaZggHYU1DiDmFX=ug@mail.gmail.com>
Subject: Re: [PATCH] usb: add QUIRK_NO_BOS for several devices
To: Greg KH <gregkh@linuxfoundation.org>
Cc: A1RM4X <dev@a1rm4x.com>, linux-usb@vger.kernel.org, limiao@kylinos.cn, 
 oneukum@suse.com, huanglei@kylinos.cn, lijiayi@kylinos.cn, 
 johannes.bruederl@gmail.com, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000021700e064a04e382"
X-Smtpcorp-Track: zpZcdFrqH3Lu.fJATu5Ryklvn.QAWvOQskTLI
Feedback-ID: 938170m:938170ab7bWmC:938170sS1YP7rRpK
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[a1rm4x.com:s=s938170];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[smtpservice.net:s=mk3wa0.a1-4.dyn];
	TAGGED_FROM(0.00)[bounces-33111-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[a1rm4x.com,vger.kernel.org,kylinos.cn,suse.com,gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[a1rm4x.com];
	HAS_ATTACHMENT(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev@a1rm4x.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[smtpservice.net:-,a1rm4x.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,a1rm4x.com:email,a1rm4x.com:dkim]
X-Rspamd-Queue-Id: F3797EC5B2
X-Rspamd-Action: no action

--00000000000021700e064a04e382
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I added a clean patch to this email.

I own the devices mentioned in the patch. For all 3 devices, the USB
port speed (10Gbps) is reached on Windows, they just negotiate 5Gbps
speed on Linux. After applying the patch, as mentioned earlier, they
reach the correct speed. I just did a 3 hours record on the Avermedia
on Linux and it works as expected with a patched kernel.

Here is an updated dmesg output after following your instructions on
the current kernel master:

[  701.425991] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number
2 using xhci_hcd
[  706.735379] usb 2-2: unable to get BOS descriptor or descriptor too shor=
t
[  706.735390] usb 2-2: unable to read config index 0 descriptor/start: -19
[  706.920395] usb 2-2: Device not responding to setup address.
[  707.127380] usb 2-2: Device not responding to setup address.
[  707.335050] usb 2-2: device not accepting address 3, error -71
[  707.338647] usb usb2-port2: attempt power cycle
[  708.656278] usb 2-2: new SuperSpeed USB device number 5 using xhci_hcd
[  708.859889] usb 2-2: LPM exit latency is zeroed, disabling LPM.
[  708.955893] usb 2-2: New USB device found, idVendor=3D2b89,
idProduct=3D5871, bcdDevice=3D 0.00
[  708.955895] usb 2-2: New USB device strings: Mfr=3D6, Product=3D7, Seria=
lNumber=3D3
[  708.955896] usb 2-2: Product: UGREEN 35871
[  708.955897] usb 2-2: Manufacturer: UGREEN 35871
[  708.955897] usb 2-2: SerialNumber: PRODUCT
[  709.142354] hid-generic 0003:2B89:5871.0007: hiddev99,hidraw6: USB
HID v1.11 Device [UGREEN 35871 UGREEN 35871] on
usb-0000:0b:00.0-2/input4
[  709.165518] videodev: Linux video capture interface: v2.00
[  709.187290] uvcvideo 2-2:1.1: Unknown video format
30313050-0000-0010-8000-00aa00389b71
[  709.187297] uvcvideo 2-2:1.0: Found UVC 1.00 device UGREEN 35871 (2b89:5=
871)
[  709.224374] usbcore: registered new interface driver uvcvideo

Regarding the Signed=E2=80=91off=E2=80=91by line, if I can't sign it with m=
y content
creator name, please sign it yourself. Whether I put my name on this
patch is not important, what is important is the kernel to function
properly with those devices.

Thanks again for helping,
A1RM4X

On Wed, Feb 4, 2026 at 9:38=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Wed, Feb 04, 2026 at 09:25:18AM -0500, A1RM4X wrote:
> > Hi,
> >
> > Please find attached the new patch which fixes the structure of the com=
mit.
>
> Also, you sent a patch on top of your previous patch which was not
> accepted, and so this wouldn't even apply to our trees at all :(
>
> Please always make a "clean" patch.
>
> thanks,
>
> greg k-h
>

--00000000000021700e064a04e382
Content-Type: text/x-patch; charset="UTF-8"; 
 name="0001-USB-add-QUIRK_NO_BOS-for-several-devices.patch"
Content-Disposition: attachment; 
 filename="0001-USB-add-QUIRK_NO_BOS-for-several-devices.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ml8fsbfy0>
X-Attachment-Id: f_ml8fsbfy0

RnJvbSAyNjgwNTg0ODRiMjYxYWJmYmU1ZjQ3YTA2NjhjNTAzNTcwMTc1ZDlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBMVJNNFggPGRldkBhMXJtNHguY29tPgpEYXRlOiBXZWQsIDQg
RmViIDIwMjYgMTQ6MjY6NDggLTA1MDAKU3ViamVjdDogW1BBVENIXSBVU0I6IGFkZCBRVUlSS19O
T19CT1MgZm9yIHNldmVyYWwgZGV2aWNlcwpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6
IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJp
dAoKKiB1c2I6IGFkZCBRVUlSS19OT19CT1MgZm9yIHNldmVyYWwgZGV2aWNlcwogIC0gRGlzYWJs
ZXMgQk9TIGhhbmRsaW5nIG9uIGRldmljZXMgdGhhdCBicmVhayB3aGVuIHRoZSBCT1MKICAgIGRl
c2NyaXB0b3IgaXMgcmVhZCAoZS5nLiBVR1JFRU4gMzU4NzEpLiAgUHJldmVudHMgdGhlIGtlcm5l
bAogICAgZnJvbSBmYWxsaW5nIGJhY2sgdG8gYSA14oCvR2JwcyBsaW5rIHNwZWVkLCB1bmxvY2tp
bmcgdGhlCiAgICBleHBlY3RlZCAxMOKAr0dicHMvNEvigK82MOKAr2ZwcyBtb2RlLgoKKiB1c2I6
IGNvcmU6IHJlb3JkZXIgQk9T4oCRcXVpcmsgZW50cmllcyBhbHBoYWJldGljYWxseQogIC0gVGhl
IHRocmVlIFVTQl9RVUlSS19OT19CT1MgZW50cmllcyBhcmUgbm93IHBsYWNlZCBpbiB0aGUKYWxw
aGFiZXRpY2FsIG9yZGVyIHJlcXVpcmVkIGJ5IHRoZSBmaWxlIGhlYWRlci4KClNpZ25lZC1vZmYt
Ynk6IEExUk00WCA8ZGV2QGExcm00eC5jb20+Ci0tLQogZHJpdmVycy91c2IvY29yZS9xdWlya3Mu
YyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvY29yZS9xdWlya3MuYyBiL2RyaXZlcnMvdXNiL2NvcmUvcXVpcmtz
LmMKaW5kZXggYzRkODUwODlkMTliLi5mNGM4MDA2Mzg2NGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dXNiL2NvcmUvcXVpcmtzLmMKKysrIGIvZHJpdmVycy91c2IvY29yZS9xdWlya3MuYwpAQCAtMzc3
LDYgKzM3Nyw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9pZCB1c2JfcXVpcmtf
bGlzdFtdID0gewogCS8qIFNhbkRpc2sgRXh0cmVtZSA1NUFFICovCiAJeyBVU0JfREVWSUNFKDB4
MDc4MSwgMHg1NWFlKSwgLmRyaXZlcl9pbmZvID0gVVNCX1FVSVJLX05PX0xQTSB9LAogCisJLyog
QXZlcm1lZGlhIExpdmUgR2FtZXIgVWx0cmEgMi4xIChHQzU1M0cyKSAtIEJPUyBkZXNjcmlwdG9y
IGZldGNoIGhhbmdzIGF0IFN1cGVyU3BlZWQgUGx1cyAqLworCXsgVVNCX0RFVklDRSgweDA3Y2Es
IDB4MjU1MyksIC5kcml2ZXJfaW5mbyA9IFVTQl9RVUlSS19OT19CT1MgfSwKKwogCS8qIFJlYWxm
b3JjZSA4N1UgS2V5Ym9hcmQgKi8KIAl7IFVTQl9ERVZJQ0UoMHgwODUzLCAweDAxMWIpLCAuZHJp
dmVyX2luZm8gPSBVU0JfUVVJUktfTk9fTFBNIH0sCiAKQEAgLTQzNyw2ICs0NDAsOSBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHVzYl9kZXZpY2VfaWQgdXNiX3F1aXJrX2xpc3RbXSA9IHsKIAl7IFVT
Ql9ERVZJQ0UoMHgwYjA1LCAweDE3ZTApLCAuZHJpdmVyX2luZm8gPQogCQkJVVNCX1FVSVJLX0lH
Tk9SRV9SRU1PVEVfV0FLRVVQIH0sCiAKKwkvKiBBU1VTIFRVRiA0SyBQUk8gLSBCT1MgZGVzY3Jp
cHRvciBmZXRjaCBoYW5ncyBhdCBTdXBlclNwZWVkIFBsdXMgKi8KKwl7IFVTQl9ERVZJQ0UoMHgw
YjA1LCAweDFhYjkpLCAuZHJpdmVyX2luZm8gPSBVU0JfUVVJUktfTk9fQk9TIH0sCisKIAkvKiBS
ZWFsdGVrIFNlbWljb25kdWN0b3IgQ29ycC4gTWFzcyBTdG9yYWdlIERldmljZSAoTXVsdGljYXJk
IFJlYWRlcikqLwogCXsgVVNCX0RFVklDRSgweDBiZGEsIDB4MDE1MSksIC5kcml2ZXJfaW5mbyA9
IFVTQl9RVUlSS19DT05GSUdfSU5URl9TVFJJTkdTIH0sCiAKQEAgLTU2NSw2ICs1NzEsOSBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHVzYl9kZXZpY2VfaWQgdXNiX3F1aXJrX2xpc3RbXSA9IHsKIAog
CXsgVVNCX0RFVklDRSgweDIzODYsIDB4MzUwZSksIC5kcml2ZXJfaW5mbyA9IFVTQl9RVUlSS19O
T19MUE0gfSwKIAorCS8qIFVHUkVFTiAzNTg3MSAtIEJPUyBkZXNjcmlwdG9yIGZldGNoIGhhbmdz
IGF0IFN1cGVyU3BlZWQgUGx1cyAqLworCXsgVVNCX0RFVklDRSgweDJiODksIDB4NTg3MSksIC5k
cml2ZXJfaW5mbyA9IFVTQl9RVUlSS19OT19CT1MgfSwKKwogCS8qIEFQVElWIEFVVE9NT1RJVkUg
SFVCICovCiAJeyBVU0JfREVWSUNFKDB4MmM0OCwgMHgwMTMyKSwgLmRyaXZlcl9pbmZvID0KIAkJ
CVVTQl9RVUlSS19TSE9SVF9TRVRfQUREUkVTU19SRVFfVElNRU9VVCB9LAotLSAKMi41My4wCgo=
--00000000000021700e064a04e382--


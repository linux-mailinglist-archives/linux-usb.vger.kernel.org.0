Return-Path: <linux-usb+bounces-33105-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGqyAuZWg2mJlQMAu9opvQ
	(envelope-from <linux-usb+bounces-33105-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 15:25:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A40E70E0
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 15:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B27983008D44
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 14:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782A4410D39;
	Wed,  4 Feb 2026 14:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=a1rm4x.com header.i=@a1rm4x.com header.b="fGHgzX0k"
X-Original-To: linux-usb@vger.kernel.org
Received: from a4i635.smtp2go.com (a4i635.smtp2go.com [158.120.82.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C726C3D330C
	for <linux-usb@vger.kernel.org>; Wed,  4 Feb 2026 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.82.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215139; cv=none; b=SK3+xaihuw+3600yV7PuH6f94VUdmqsc/ZnfY1z8AFvWRvI6VI3W169nZhZU7iUcfZgVfulxChGa1hcQktKLoC/oSlntE/h/wGYb0zwR1jXKyR+0miqbWsEhT7i+mqSMaXU11tSJ3eqT+l6cMp5XTtKRV2Z4qXsvd3K3OOVKU5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215139; c=relaxed/simple;
	bh=cG0Y1apEASCPh8AudNeJfgBd97p+M2mV9y0AWglrbbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGXSAw0fFmjDPSYnVJDB9hjwVfrNBGQGERKpPtktPq2Wq0FlYvQhqbQja0bBbfXKmUD08QSMX3M8z0v5q48d6vo+Zkzl8Ys1jBULWCPzQWH6I9TX/0/7ETfjG5/ytM1fR2pMD7G9u4m5M3qWXxX7fs4s9knEaaQdxb6r0cyXocg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=a1rm4x.com; spf=pass smtp.mailfrom=em938170.a1rm4x.com; dkim=pass (2048-bit key) header.d=a1rm4x.com header.i=@a1rm4x.com header.b=fGHgzX0k; arc=none smtp.client-ip=158.120.82.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=a1rm4x.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em938170.a1rm4x.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a1rm4x.com;
 i=@a1rm4x.com; q=dns/txt; s=s938170; t=1770215137; h=from : subject :
 to : message-id : date;
 bh=w1LucEodSRv3xIEyCWilyqw2DXaGubQ8g2+9GXMuqBY=;
 b=fGHgzX0kXm36mfZb/i3tbnHDAA+yldUFO/zxbSirTKSxMKvC4gxRWH9SdMCmA7cfpL1MH
 eOtS0YO95v3kn1mhx28HMVPO8PrsifZ2Is0NKRK5MS4Ki2O5eXw3bb7pGlGRWzI0gHPbA77
 qncjocwCheFyc00XQ4/ryNfcNqj4Q2AO3GRm2q0r6ME8RWzG+JNjsdWbsMs3XivZ6bryge6
 ohpktlrOJKOCzI6xbDktwgt2PV5VexkFuK8xJ1JyS5UtjhRpXbOizAq6ZU2nA2hq2j0jTI1
 1FX0Pq97N48+DxLR85O40gRSiIVwUc7beYZP3gUTfqzgrAGuqzSsWlXkWg+g==
Received: from [10.172.245.14] (helo=mail-yw1-f181.google.com)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.99.1-S2G)
	(envelope-from <A1RM4X@A1RM4X.com>)
	id 1vndp1-FnQW0hPw4s9-1V9I
	for linux-usb@vger.kernel.org;
	Wed, 04 Feb 2026 14:25:35 +0000
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79427f739b0so7519447b3.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Feb 2026 06:25:35 -0800 (PST)
X-Forwarded-Encrypted:
 i=1; AJvYcCXHth5tgjw3C9Ng9COEHwXdEBnfOYu6mK9ek2oRZTnY/GF/qE37InjR8LROpsBfUvX9u7WjY6cAa+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr0672MjLGSQqN+iMI3+K7enfGbnHyeVZ+GMPHpaq9MPsZz5Pk
	V6wbcaTt2nlTY0OaGGrKushg5XLP6MzNKU2YlEqqUdjv1sOxsoX2FZzAzFqOKzEuxVH1511hWx0
	MBOYqS55awEFi3/l7IaSpyxkHC/Eq0Yw=
X-Received: by 2002:a05:690c:13:b0:794:ea75:4847 with SMTP id
 00721157ae682-794fe83eb83mr30298537b3.62.1770215134789; Wed, 04 Feb 2026
 06:25:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204032938.61553-1-dev@a1rm4x.com> <2026020457-distrust-vision-e5de@gregkh>
In-Reply-To: <2026020457-distrust-vision-e5de@gregkh>
From: A1RM4X <A1RM4X@a1rm4x.com>
Date: Wed, 4 Feb 2026 09:25:18 -0500
X-Gmail-Original-Message-ID: <CACy+XB-Z26Bx2Zb4omoRq00L4tTAQxe4QWSQ1f=eFMryqb8Ksw@mail.gmail.com>
X-Gm-Features: AZwV_QgMH8H4uMcQtX1cIAd0U3pCTc3v4Z7udUyeV5NwWqKDrF0AoxgxYCb7GL8
Message-ID: <CACy+XB-Z26Bx2Zb4omoRq00L4tTAQxe4QWSQ1f=eFMryqb8Ksw@mail.gmail.com>
Subject: Re: [PATCH] usb: add QUIRK_NO_BOS for several devices
To: Greg KH <gregkh@linuxfoundation.org>
Cc: A1RM4X <dev@a1rm4x.com>, linux-usb@vger.kernel.org, limiao@kylinos.cn, 
	oneukum@suse.com, huanglei@kylinos.cn, lijiayi@kylinos.cn, 
	johannes.bruederl@gmail.com, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000049416c064a005493"
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 938170m:938170ab7bWmC:938170sS1YP7rRpK
X-smtpcorp-track: J9S5ZvTt7l1z.9G2AoW5YLiyP.U_QJzgS3dhs
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[a1rm4x.com:s=s938170];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[a1rm4x.com,vger.kernel.org,kylinos.cn,suse.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-33105-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[a1rm4x.com];
	DKIM_TRACE(0.00)[a1rm4x.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[A1RM4X@a1rm4x.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,a1rm4x.com:email,a1rm4x.com:dkim]
X-Rspamd-Queue-Id: 97A40E70E0
X-Rspamd-Action: no action

--00000000000049416c064a005493
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Please find attached the new patch which fixes the structure of the commit.

Why? If the option is not being used, the speed limit will be limited
to 5000M, which limits the capture capabilities of the device (4K30fps
at 5000M versus the expected 4K60fps at 10000M).

What happens in userspace?
- without patch
[ 5036.674972] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number
2 using xhci_hcd
[ 5041.770595] usb 2-2: unable to get BOS descriptor or descriptor too shor=
t
[ 5041.770605] usb 2-2: unable to read config index 0 descriptor/start: -19
[ 5041.955592] usb 2-2: Device not responding to setup address.
[ 5042.162588] usb 2-2: Device not responding to setup address.
[ 5042.370246] usb 2-2: device not accepting address 3, error -71
[ 5042.373859] usb usb2-port2: attempt power cycle
[ 5043.691464] usb 2-2: new SuperSpeed USB device number 5 using xhci_hcd
[ 5043.887185] usb 2-2: LPM exit latency is zeroed, disabling LPM.
[ 5043.980556] usb 2-2: New USB device found, idVendor=3D2b89,
idProduct=3D5871, bcdDevice=3D 0.00
[ 5043.980561] usb 2-2: New USB device strings: Mfr=3D6, Product=3D7, Seria=
lNumber=3D3
[ 5043.980563] usb 2-2: Product: UGREEN 35871
[ 5043.980564] usb 2-2: Manufacturer: UGREEN 35871
[ 5043.980564] usb 2-2: SerialNumber: PRODUCT
[ 5044.166844] hid-generic 0003:2B89:5871.0007: hiddev99,hidraw6: USB
HID v1.11 Device [UGREEN 35871 UGREEN 35871] on
usb-0000:0b:00.0-2/input4
[ 5044.188946] videodev: Linux video capture interface: v2.00
[ 5044.207601] uvcvideo 2-2:1.1: Unknown video format
30313050-0000-0010-8000-00aa00389b71
[ 5044.207606] uvcvideo 2-2:1.0: Found UVC 1.00 device UGREEN 35871 (2b89:5=
871)
[ 5044.242584] usbcore: registered new interface driver uvcvideo

/:  Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/5p, 2000=
0M/x2
    |__ Port 002: Dev 005, If 0, Class=3DVideo, Driver=3Duvcvideo, 5000M
    |__ Port 002: Dev 005, If 1, Class=3DVideo, Driver=3Duvcvideo, 5000M
    |__ Port 002: Dev 005, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, 500=
0M
    |__ Port 002: Dev 005, If 3, Class=3DAudio, Driver=3Dsnd-usb-audio, 500=
0M
    |__ Port 002: Dev 005, If 4, Class=3DHuman Interface Device,
Driver=3Dusbhid, 5000M


- with patch
[   51.913978] usb 6-1: new SuperSpeed Plus Gen 2x1 USB device number
3 using xhci_hcd
[   52.181717] usb 6-1: New USB device found, idVendor=3D2b89,
idProduct=3D5871, bcdDevice=3D 0.00
[   52.181721] usb 6-1: New USB device strings: Mfr=3D6, Product=3D7, Seria=
lNumber=3D3
[   52.181724] usb 6-1: Product: UGREEN 35871
[   52.181726] usb 6-1: Manufacturer: UGREEN 35871
[   52.181728] usb 6-1: SerialNumber: PRODUCT
[   52.284659] uvcvideo 6-1:1.1: Unknown video format
30313050-0000-0010-8000-00aa00389b71
[   52.284666] uvcvideo 6-1:1.0: Found UVC 1.00 device UGREEN 35871 (2b89:5=
871)
[   52.475086] hid-generic 0003:2B89:5871.000A: hiddev100,hidraw6: USB
HID v1.11 Device [UGREEN 35871 UGREEN 35871] on
usb-0000:0e:00.3-1/input4

/:  Bus 006.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 1000=
0M
    |__ Port 001: Dev 003, If 0, Class=3DVideo, Driver=3Duvcvideo, 10000M
    |__ Port 001: Dev 003, If 1, Class=3DVideo, Driver=3Duvcvideo, 10000M
    |__ Port 001: Dev 003, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, 100=
00M
    |__ Port 001: Dev 003, If 3, Class=3DAudio, Driver=3Dsnd-usb-audio, 100=
00M
    |__ Port 001: Dev 003, If 4, Class=3DHuman Interface Device,
Driver=3Dusbhid, 10000M


If more debug tests are required, please let me know how to proceed.

--------------------------------

Regarding the Signed=E2=80=91off=E2=80=91by line, I would like to use my pu=
blic
content=E2=80=91creator alias rather than my personal identity. Could you
advise how to do this while remaining compliant with the DCO?

Thanks,
A1RM4X

On Wed, Feb 4, 2026 at 12:15=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Feb 03, 2026 at 10:29:38PM -0500, A1RM4X wrote:
> > Add QUIRK_NO_BOS entries for:
> >  * ASUS TUF 4K PRO (0x0b05:0x1ab9)
> >  * Avermedia Live Gamer Ultra 2.1 (0x07ca:0x2553)
> >  * UGREEN 35871 (0x2b89:0x5871)
>
> Why?  What is the results without this option being used here?  And what
> happens when userspace goes and asks for this descriptor?
>
> > Signed-off-by: A1RM4X <dev@a1rm4x.com>
>
> We need a real name, sorry.
>
> > ---
> >  drivers/usb/core/quirks.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> > index c4d85089d19b..ddce45ce9f6c 100644
> > --- a/drivers/usb/core/quirks.c
> > +++ b/drivers/usb/core/quirks.c
> > @@ -453,6 +453,15 @@ static const struct usb_device_id usb_quirk_list[]=
 =3D {
> >       /* Elgato 4K X - BOS descriptor fetch hangs at SuperSpeed Plus */
> >       { USB_DEVICE(0x0fd9, 0x009b), .driver_info =3D USB_QUIRK_NO_BOS }=
,
> >
> > +     /* ASUS TUF 4K PRO - BOS descriptor fetch hangs at SuperSpeed Plu=
s */
> > +     { USB_DEVICE(0x0b05, 0x1ab9), .driver_info =3D USB_QUIRK_NO_BOS }=
,
> > +
> > +     /* Avermedia Live Gamer Ultra 2.1 (GC553G2) - BOS descriptor fetc=
h hangs at SuperSpeed Plus */
> > +     { USB_DEVICE(0x07ca, 0x2553), .driver_info =3D USB_QUIRK_NO_BOS }=
,
> > +
> > +     /* UGREEN 35871 - BOS descriptor fetch hangs at SuperSpeed Plus *=
/
> > +     { USB_DEVICE(0x2b89, 0x5871), .driver_info =3D USB_QUIRK_NO_BOS }=
,
>
> Please read the comment for this structure for how to place these in the
> list.
>
> thanks,
>
> greg k-h
>

--00000000000049416c064a005493
Content-Type: text/x-patch; charset="UTF-8"; 
	name="0001-PATCH-v2-usb-core-reorder-BOS-quirk-entries-alphabet.patch"
Content-Disposition: attachment; 
	filename="0001-PATCH-v2-usb-core-reorder-BOS-quirk-entries-alphabet.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ml84bov50>
X-Attachment-Id: f_ml84bov50

RnJvbSAxN2I1ZGMzYjdiYzdiN2FlNjQzMzM0OTA4YjIzOGU2ZWIxZGZhODFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBMVJNNFggPGRldkBhMXJtNHguY29tPgpEYXRlOiBXZWQsIDQg
RmViIDIwMjYgMDg6MTk6NTYgLTA1MDAKU3ViamVjdDogW1BBVENIXSA9P1VURi04P3E/W1BBVENI
PTIwdjJdPTIwdXNiOj0yMGNvcmU6PTIwcmVvcmRlcj0yMEJPUz89CiA9P1VURi04P3E/PUUyPTgw
PTkxcXVpcms9MjBlbnRyaWVzPTIwYWxwaGFiZXRpY2FsbHk/PQpNSU1FLVZlcnNpb246IDEuMApD
b250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1F
bmNvZGluZzogOGJpdAoKKiB1c2I6IGFkZCBRVUlSS19OT19CT1MgZm9yIHNldmVyYWwgZGV2aWNl
cwogIC0gRGlzYWJsZXMgQk9TIGhhbmRsaW5nIG9uIGRldmljZXMgdGhhdCBicmVhayB3aGVuIHRo
ZSBCT1MKICAgIGRlc2NyaXB0b3IgaXMgcmVhZCAoZS5nLiBVR1JFRU4gMzU4NzEpLiAgUHJldmVu
dHMgdGhlIGtlcm5lbAogICAgZnJvbSBmYWxsaW5nIGJhY2sgdG8gYSA14oCvR2JwcyBsaW5rIHNw
ZWVkLCB1bmxvY2tpbmcgdGhlCiAgICBleHBlY3RlZCAxMOKAr0dicHMvNEvigK82MOKAr2ZwcyBt
b2RlLgoKKiB1c2I6IGNvcmU6IHJlb3JkZXIgQk9T4oCRcXVpcmsgZW50cmllcyBhbHBoYWJldGlj
YWxseQogIC0gVGhlIHRocmVlIFVTQl9RVUlSS19OT19CT1MgZW50cmllcyBhcmUgbm93IHBsYWNl
ZCBpbiB0aGUKYWxwaGFiZXRpY2FsIG9yZGVyIHJlcXVpcmVkIGJ5IHRoZSBmaWxlIGhlYWRlci4K
ClNpZ25lZC1vZmYtYnk6IEExUk00WCA8ZGV2QGExcm00eC5jb20+Ci0tLQogZHJpdmVycy91c2Iv
Y29yZS9xdWlya3MuYyB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9j
b3JlL3F1aXJrcy5jIGIvZHJpdmVycy91c2IvY29yZS9xdWlya3MuYwppbmRleCBkZGNlNDVjZTlm
NmMuLmY0YzgwMDYzODY0ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvY29yZS9xdWlya3MuYwor
KysgYi9kcml2ZXJzL3VzYi9jb3JlL3F1aXJrcy5jCkBAIC0zNzcsNiArMzc3LDkgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCB1c2JfZGV2aWNlX2lkIHVzYl9xdWlya19saXN0W10gPSB7CiAJLyogU2Fu
RGlzayBFeHRyZW1lIDU1QUUgKi8KIAl7IFVTQl9ERVZJQ0UoMHgwNzgxLCAweDU1YWUpLCAuZHJp
dmVyX2luZm8gPSBVU0JfUVVJUktfTk9fTFBNIH0sCiAKKwkvKiBBdmVybWVkaWEgTGl2ZSBHYW1l
ciBVbHRyYSAyLjEgKEdDNTUzRzIpIC0gQk9TIGRlc2NyaXB0b3IgZmV0Y2ggaGFuZ3MgYXQgU3Vw
ZXJTcGVlZCBQbHVzICovCisJeyBVU0JfREVWSUNFKDB4MDdjYSwgMHgyNTUzKSwgLmRyaXZlcl9p
bmZvID0gVVNCX1FVSVJLX05PX0JPUyB9LAorCiAJLyogUmVhbGZvcmNlIDg3VSBLZXlib2FyZCAq
LwogCXsgVVNCX0RFVklDRSgweDA4NTMsIDB4MDExYiksIC5kcml2ZXJfaW5mbyA9IFVTQl9RVUlS
S19OT19MUE0gfSwKIApAQCAtNDM3LDYgKzQ0MCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNi
X2RldmljZV9pZCB1c2JfcXVpcmtfbGlzdFtdID0gewogCXsgVVNCX0RFVklDRSgweDBiMDUsIDB4
MTdlMCksIC5kcml2ZXJfaW5mbyA9CiAJCQlVU0JfUVVJUktfSUdOT1JFX1JFTU9URV9XQUtFVVAg
fSwKIAorCS8qIEFTVVMgVFVGIDRLIFBSTyAtIEJPUyBkZXNjcmlwdG9yIGZldGNoIGhhbmdzIGF0
IFN1cGVyU3BlZWQgUGx1cyAqLworCXsgVVNCX0RFVklDRSgweDBiMDUsIDB4MWFiOSksIC5kcml2
ZXJfaW5mbyA9IFVTQl9RVUlSS19OT19CT1MgfSwKKwogCS8qIFJlYWx0ZWsgU2VtaWNvbmR1Y3Rv
ciBDb3JwLiBNYXNzIFN0b3JhZ2UgRGV2aWNlIChNdWx0aWNhcmQgUmVhZGVyKSovCiAJeyBVU0Jf
REVWSUNFKDB4MGJkYSwgMHgwMTUxKSwgLmRyaXZlcl9pbmZvID0gVVNCX1FVSVJLX0NPTkZJR19J
TlRGX1NUUklOR1MgfSwKIApAQCAtNDUzLDE1ICs0NTksNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHVzYl9kZXZpY2VfaWQgdXNiX3F1aXJrX2xpc3RbXSA9IHsKIAkvKiBFbGdhdG8gNEsgWCAtIEJP
UyBkZXNjcmlwdG9yIGZldGNoIGhhbmdzIGF0IFN1cGVyU3BlZWQgUGx1cyAqLwogCXsgVVNCX0RF
VklDRSgweDBmZDksIDB4MDA5YiksIC5kcml2ZXJfaW5mbyA9IFVTQl9RVUlSS19OT19CT1MgfSwK
IAotCS8qIEFTVVMgVFVGIDRLIFBSTyAtIEJPUyBkZXNjcmlwdG9yIGZldGNoIGhhbmdzIGF0IFN1
cGVyU3BlZWQgUGx1cyAqLwotCXsgVVNCX0RFVklDRSgweDBiMDUsIDB4MWFiOSksIC5kcml2ZXJf
aW5mbyA9IFVTQl9RVUlSS19OT19CT1MgfSwKLQotCS8qIEF2ZXJtZWRpYSBMaXZlIEdhbWVyIFVs
dHJhIDIuMSAoR0M1NTNHMikgLSBCT1MgZGVzY3JpcHRvciBmZXRjaCBoYW5ncyBhdCBTdXBlclNw
ZWVkIFBsdXMgKi8KLQl7IFVTQl9ERVZJQ0UoMHgwN2NhLCAweDI1NTMpLCAuZHJpdmVyX2luZm8g
PSBVU0JfUVVJUktfTk9fQk9TIH0sCi0KLQkvKiBVR1JFRU4gMzU4NzEgLSBCT1MgZGVzY3JpcHRv
ciBmZXRjaCBoYW5ncyBhdCBTdXBlclNwZWVkIFBsdXMgKi8KLQl7IFVTQl9ERVZJQ0UoMHgyYjg5
LCAweDU4NzEpLCAuZHJpdmVyX2luZm8gPSBVU0JfUVVJUktfTk9fQk9TIH0sCi0KIAkvKiBTb255
IFhwZXJpYSBYWjEgQ29tcGFjdCAobGlsYWMpIHNtYXJ0cGhvbmUgaW4gZmFzdGJvb3QgbW9kZSAq
LwogCXsgVVNCX0RFVklDRSgweDBmY2UsIDB4MGRkZSksIC5kcml2ZXJfaW5mbyA9IFVTQl9RVUlS
S19OT19MUE0gfSwKIApAQCAtNTc0LDYgKzU3MSw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNi
X2RldmljZV9pZCB1c2JfcXVpcmtfbGlzdFtdID0gewogCiAJeyBVU0JfREVWSUNFKDB4MjM4Niwg
MHgzNTBlKSwgLmRyaXZlcl9pbmZvID0gVVNCX1FVSVJLX05PX0xQTSB9LAogCisJLyogVUdSRUVO
IDM1ODcxIC0gQk9TIGRlc2NyaXB0b3IgZmV0Y2ggaGFuZ3MgYXQgU3VwZXJTcGVlZCBQbHVzICov
CisJeyBVU0JfREVWSUNFKDB4MmI4OSwgMHg1ODcxKSwgLmRyaXZlcl9pbmZvID0gVVNCX1FVSVJL
X05PX0JPUyB9LAorCiAJLyogQVBUSVYgQVVUT01PVElWRSBIVUIgKi8KIAl7IFVTQl9ERVZJQ0Uo
MHgyYzQ4LCAweDAxMzIpLCAuZHJpdmVyX2luZm8gPQogCQkJVVNCX1FVSVJLX1NIT1JUX1NFVF9B
RERSRVNTX1JFUV9USU1FT1VUIH0sCi0tIAoyLjUzLjAKCg==
--00000000000049416c064a005493--


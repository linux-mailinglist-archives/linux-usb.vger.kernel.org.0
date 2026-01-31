Return-Path: <linux-usb+bounces-32962-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MTxJyovfmlZWQIAu9opvQ
	(envelope-from <linux-usb+bounces-32962-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 17:34:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B183EC3091
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 17:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06A88302A2D7
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 16:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD9933F39A;
	Sat, 31 Jan 2026 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ikmail.com header.i=@ikmail.com header.b="TyyBZhmS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A301A0BE0
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 16:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769877285; cv=none; b=bmUp7UKVzj3X64KlvnT6hYKczWZ/yq4fECg+FSWiJxCEHLJxAnZ5ERlQYIWXvNau9s6QoX3dXvMXaxYYGmvi/VfR3YYiDtoa+Skexy0cPrSJNIZ7yvoXHaJ+RFgIaWQXUAjN8IhdgBno4UKB0rDiVYXn8gdxizGqbwMOr1srlIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769877285; c=relaxed/simple;
	bh=372KzksL40U0p3MmZzzW8Fm1L2xP8hij33KhndI6mXY=;
	h=Subject:Message-ID:Date:From:To:Cc:MIME-Version:Content-Type; b=BGbNw0VMJCPWCAnOj1C1IXYXVxvaEg34XcJoMPVnyJhkMGDqMo6IGlw7SSm5CZp3NKCvJa6zbBxIChcZdzUoQwapL3hLJ/ydwATOT4L6CY1S92eovNOciZj4e9UMP/hcOEsEARmX8+hiq2qd/kGzg27quLv8vvCY1nkqiw9R1GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ikmail.com; spf=pass smtp.mailfrom=ikmail.com; dkim=pass (1024-bit key) header.d=ikmail.com header.i=@ikmail.com header.b=TyyBZhmS; arc=none smtp.client-ip=84.16.66.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ikmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ikmail.com
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f3JPQ6xTPz6dl;
	Sat, 31 Jan 2026 17:34:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ikmail.com;
	s=20210927; t=1769877274;
	bh=372KzksL40U0p3MmZzzW8Fm1L2xP8hij33KhndI6mXY=;
	h=Subject:Date:From:To:Cc:Reply-To:From;
	b=TyyBZhmSwFeW5/goCC8KnKzl2v2mzVhxhCtPDwfh09wF9KIMWzMN1icooPwywBNkg
	 k6tXqiF3gBMWVkpd6JC4vfCYH2YIGfBs9T7HZPRdYLJIn8AdK55g242k3aOiJw66ks
	 7a5v91XWVRG1kPvavYBdGh84+cIX++Hi3Z2MKc5o=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f3JPQ3t09zgSM;
	Sat, 31 Jan 2026 17:34:34 +0100 (CET)
Subject: [PATCH] USB: hub: add early rejection for corrupted or high-risk
 devices
Message-ID: <9fcf5b72-7d3c-4677-aad1-6b7c4adf6a23@mail.infomaniak.com>
Date: Sat, 31 Jan 2026 17:34:34 +0100
From: HackNOW Team <hacknow@ikmail.com>
To: linux-usb@vger.kernel.org
Cc: marco.crivellari@suse.com, khtsai@google.com, gregkh@linuxfoundation.org
Reply-To: HackNOW Team <hacknow@ikmail.com>
X-WS-Location: eJxzKUpMKykGAAfpAmU-
X-Mailer: Infomaniak Workspace (1.3.1120)
X-WS-User-Origin: eyJpdiI6IkJGYjNkMStnV055ZStmZ0UybWdGR2c9PSIsInZhbHVlIjoiNlRWVkJqbVVvdVM5Yyt1aWE2bDUyQT09IiwibWFjIjoiNDFiNWI2NzJmOTY2N2IyYThhYTdkMTZjMzRiMTAyY2IwNmI3OWE0YzlmYzk3OWU1ZTUxMGEzOTQ5ZDY5MTIyYiIsInRhZyI6IiJ9
X-WS-User-Mbox: eyJpdiI6ImFldmdiTzlRWVk4ajMvMXhIWGVTOGc9PSIsInZhbHVlIjoidnozZy9sTHNEckNibGd6ZVRtUmJNdz09IiwibWFjIjoiOGZmNmY5YzY2ZDJmN2FkYjI5ZTY2NDg4NmU2MDkzMTg2NzMxMTZmMGFmNzQ5YmNkNzFmOWQyZWNiZGRmOTgyOSIsInRhZyI6IiJ9
X-WS-LOCALE: it_IT
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=6MNQdsB1
Feedback-ID: :6153226e9ca6b74:ham:d5aade6f0e4dcfc
X-Infomaniak-Routing: alpha
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ikmail.com,reject];
	R_DKIM_ALLOW(-0.20)[ikmail.com:s=20210927];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain,text/x-patch];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32962-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.infomaniak.com:mid];
	DKIM_TRACE(0.00)[ikmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[hacknow@ikmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hacknow@ikmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: B183EC3091
X-Rspamd-Action: no action

--6MNQdsB1
Content-Type: multipart/alternative; boundary=N-EiXL6D

--N-EiXL6D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

This patch adds a defensive security check during USB device=

enumeration
in hub.c to reject devices with malformed descriptors or h=
igh-risk
device
classes such as Mass Storage devices potentially carryi=
ng threats.

Devices that fail the check are disconnected immediately a=
nd a kernel
alert is logged.

This is intended to reduce the attack s=
urface at the kernel level and
prevent potentially malicious or corrupted=
 USB devices from being
fully
initialized. It does not replace userspac=
e malware detection or USB
authorization frameworks.

Patch details:=


--- drivers/usb/core/hub.c
+++ drivers/usb/core/hub.c
@@ -5465,16=
 +5465,53 @@ static void hub_port_connect(struct usb_hub
*hub, int port1,=
 u16 portstatus,
mutex_lock(hcd->address0_mutex);
retry_locked =3D true=
;
- /* reallocate for each attempt, since references
- * to the previou=
s one can escape in various ways
- */
- udev =3D usb_alloc_dev(hdev, hd=
ev->bus, port1);
- if (!udev) {
- dev_err(&port_dev->dev,
- "couldn't=
 allocate usb_device\n");
- mutex_unlock(hcd->address0_mutex);
- usb_un=
lock_port(port_dev);
- goto done;
- }
+ /*
+ * Security check: dete=
ct and block suspicious or potentially
corrupted USB devices
+ */
+ i=
f (!udev->descriptor || !udev->descriptor.bLength ||
udev->descriptor.bLe=
ngth > USB_DT_DEVICE_SIZE) {
+ printk(KERN_ALERT "Banned from kernel: cor=
rupted USB device detected
(VID: %04x, PID: %04x) on port %d\n",
+ =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 udev->descriptor.idVendor, udev->descr=
iptor.idProduct,
port1);
+ usb_free_dev(udev);
+ mutex_unlock(hcd->ad=
dress0_mutex);
+ usb_unlock_port(port_dev);
+ return -ENODEV;
+ }
+=

+ if (udev->descriptor.bDeviceClass =3D=3D USB_CLASS_MASS_STORAGE) {
+=
 printk(KERN_ALERT "Banned from kernel: mass storage device
potentially i=
nfected (VID: %04x, PID: %04x) on port %d\n",
+ =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 udev->descriptor.idVendor, udev->descriptor.idProduct,
po=
rt1);
+ usb_free_dev(udev);
+ mutex_unlock(hcd->address0_mutex);
+ us=
b_unlock_port(port_dev);
+ return -ENODEV;
+ }

Signed-off-by: HNOW=
Foundation <hacknow@ikmail.com>


--N-EiXL6D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, =
sans-serif; font-size: 14px">Hi all,</div><div style=3D"font-family: 'Helve=
tica Neue', Helvetica, Arial, sans-serif; font-size: 14px"><br></div><div s=
tyle=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-s=
ize: 14px">This patch adds a defensive security check during USB device enu=
meration</div><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial=
, sans-serif; font-size: 14px">in hub.c to reject devices with malformed de=
scriptors or high-risk device</div><div style=3D"font-family: 'Helvetica Ne=
ue', Helvetica, Arial, sans-serif; font-size: 14px">classes such as Mass St=
orage devices potentially carrying threats.</div><div style=3D"font-family:=
 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px"><br></div=
><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;=
 font-size: 14px">Devices that fail the check are disconnected immediately =
and a kernel</div><div style=3D"font-family: 'Helvetica Neue', Helvetica, A=
rial, sans-serif; font-size: 14px">alert is logged.</div><div style=3D"font=
-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px"><=
br></div><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, san=
s-serif; font-size: 14px">This is intended to reduce the attack surface at =
the kernel level and</div><div style=3D"font-family: 'Helvetica Neue', Helv=
etica, Arial, sans-serif; font-size: 14px">prevent potentially malicious or=
 corrupted USB devices from being fully</div><div style=3D"font-family: 'He=
lvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px">initialized. =
It does not replace userspace malware detection or USB</div><div style=3D"f=
ont-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px=
">authorization frameworks.</div><div style=3D"font-family: 'Helvetica Neue=
', Helvetica, Arial, sans-serif; font-size: 14px"><br></div><div style=3D"f=
ont-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px=
">Patch details:</div><div style=3D"font-family: 'Helvetica Neue', Helvetic=
a, Arial, sans-serif; font-size: 14px"><br></div><div style=3D"font-family:=
 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px">--- drive=
rs/usb/core/hub.c</div><div style=3D"font-family: 'Helvetica Neue', Helveti=
ca, Arial, sans-serif; font-size: 14px">+++ drivers/usb/core/hub.c</div><di=
v style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; fon=
t-size: 14px">@@ -5465,16 +5465,53 @@ static void hub_port_connect(struct u=
sb_hub *hub, int port1, u16 portstatus,</div><div style=3D"font-family: 'He=
lvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px">mutex_lock(hc=
d-&gt;address0_mutex);</div><div style=3D"font-family: 'Helvetica Neue', He=
lvetica, Arial, sans-serif; font-size: 14px">retry_locked =3D true;</div><d=
iv style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; fo=
nt-size: 14px">-=09/* reallocate for each attempt, since references</div><d=
iv style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; fo=
nt-size: 14px">-=09 * to the previous one can escape in various ways</div><=
div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; f=
ont-size: 14px">-=09 */</div><div style=3D"font-family: 'Helvetica Neue', H=
elvetica, Arial, sans-serif; font-size: 14px">-=09udev =3D usb_alloc_dev(hd=
ev, hdev-&gt;bus, port1);</div><div style=3D"font-family: 'Helvetica Neue',=
 Helvetica, Arial, sans-serif; font-size: 14px">-=09if (!udev) {</div><div =
style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-=
size: 14px">-=09=09dev_err(&amp;port_dev-&gt;dev,</div><div style=3D"font-f=
amily: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px">-=
=09=09=09"couldn't allocate usb_device\n");</div><div style=3D"font-family:=
 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px">-=09=09mu=
tex_unlock(hcd-&gt;address0_mutex);</div><div style=3D"font-family: 'Helvet=
ica Neue', Helvetica, Arial, sans-serif; font-size: 14px">-=09=09usb_unlock=
_port(port_dev);</div><div style=3D"font-family: 'Helvetica Neue', Helvetic=
a, Arial, sans-serif; font-size: 14px">-=09=09goto done;</div><div style=3D=
"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14=
px">-=09}</div><div style=3D"font-family: 'Helvetica Neue', Helvetica, Aria=
l, sans-serif; font-size: 14px">+=09/*</div><div style=3D"font-family: 'Hel=
vetica Neue', Helvetica, Arial, sans-serif; font-size: 14px">+=09 * Securit=
y check: detect and block suspicious or potentially corrupted USB devices</=
div><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-ser=
if; font-size: 14px">+=09 */</div><div style=3D"font-family: 'Helvetica Neu=
e', Helvetica, Arial, sans-serif; font-size: 14px">+=09if (!udev-&gt;descri=
ptor || !udev-&gt;descriptor.bLength || udev-&gt;descriptor.bLength &gt; US=
B_DT_DEVICE_SIZE) {</div><div style=3D"font-family: 'Helvetica Neue', Helve=
tica, Arial, sans-serif; font-size: 14px">+=09=09printk(KERN_ALERT "Banned =
from kernel: corrupted USB device detected (VID: %04x, PID: %04x) on port %=
d\n",</div><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, s=
ans-serif; font-size: 14px">+=09=09&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ude=
v-&gt;descriptor.idVendor, udev-&gt;descriptor.idProduct, port1);</div><div=
 style=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font=
-size: 14px">+=09=09usb_free_dev(udev);</div><div style=3D"font-family: 'He=
lvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px">+=09=09mutex_=
unlock(hcd-&gt;address0_mutex);</div><div style=3D"font-family: 'Helvetica =
Neue', Helvetica, Arial, sans-serif; font-size: 14px">+=09=09usb_unlock_por=
t(port_dev);</div><div style=3D"font-family: 'Helvetica Neue', Helvetica, A=
rial, sans-serif; font-size: 14px">+=09=09return -ENODEV;</div><div style=
=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size:=
 14px">+=09}</div><div style=3D"font-family: 'Helvetica Neue', Helvetica, A=
rial, sans-serif; font-size: 14px">+</div><div style=3D"font-family: 'Helve=
tica Neue', Helvetica, Arial, sans-serif; font-size: 14px">+=09if (udev-&gt=
;descriptor.bDeviceClass =3D=3D USB_CLASS_MASS_STORAGE) {</div><div style=
=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size:=
 14px">+=09=09printk(KERN_ALERT "Banned from kernel: mass storage device po=
tentially infected (VID: %04x, PID: %04x) on port %d\n",</div><div style=3D=
"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14=
px">+=09=09&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udev-&gt;descriptor.idVendo=
r, udev-&gt;descriptor.idProduct, port1);</div><div style=3D"font-family: '=
Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px">+=09=09usb_=
free_dev(udev);</div><div style=3D"font-family: 'Helvetica Neue', Helvetica=
, Arial, sans-serif; font-size: 14px">+=09=09mutex_unlock(hcd-&gt;address0_=
mutex);</div><div style=3D"font-family: 'Helvetica Neue', Helvetica, Arial,=
 sans-serif; font-size: 14px">+=09=09usb_unlock_port(port_dev);</div><div s=
tyle=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-s=
ize: 14px">+=09=09return -ENODEV;</div><div style=3D"font-family: 'Helvetic=
a Neue', Helvetica, Arial, sans-serif; font-size: 14px">+=09}</div><div sty=
le=3D"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-siz=
e: 14px"><br></div><div style=3D"font-family: 'Helvetica Neue', Helvetica, =
Arial, sans-serif; font-size: 14px">Signed-off-by: HNOWFoundation &lt;<a hr=
ef=3D"mailto:hacknow@ikmail.com" data-ik-opengraph-status=3D"anchor">hackno=
w@ikmail.com</a>&gt;</div><div style=3D"font-family: 'Helvetica Neue', Helv=
etica, Arial, sans-serif; font-size: 14px"><br></div></body></html>
--N-EiXL6D--

--6MNQdsB1
X-WS-Attachment-UUID: 052e757c-5184-4212-881b-e70c34062095
Content-Type: text/x-patch; name=0001-USB-hub-add-early-rejection.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 name=0001-USB-hub-add-early-rejection.patch;
 filename=0001-USB-hub-add-early-rejection.patch

RnJvbSAyNzIzMGI5M2Q0NjNkMWI1NDhiZDRkNGNhMDEyOGViNjk5MzA2OTFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYWNrTk9XIDxoYWNrbm93QGlrbWFpbC5jb20+CkRhdGU6IFNh
dCwgMzEgSmFuIDIwMjYgMTU6NDc6MjQgKzAxMDAKU3ViamVjdDogW1BBVENIXSBVU0I6IGh1Yjog
YWRkIGVhcmx5IHJlamVjdGlvbiBmb3IgY29ycnVwdGVkIG9yIGhpZ2gtcmlzawogZGV2aWNlcwoK
VGhpcyBhZGRzIGEgZGVmZW5zaXZlIHNlY3VyaXR5IGNoZWNrIGR1cmluZyBkZXZpY2UgZW51bWVy
YXRpb24gdG8gcmVqZWN0ClVTQiBkZXZpY2VzIHdpdGggbWFsZm9ybWVkIGRlc2NyaXB0b3JzIG9y
IGhpZ2gtcmlzayBkZXZpY2UgY2xhc3NlcyBzdWNoIGFzCk1hc3MgU3RvcmFnZSBkZXZpY2VzIHBv
dGVudGlhbGx5IGNhcnJ5aW5nIHRocmVhdHMuCgpEZXZpY2VzIHRoYXQgZmFpbCB0aGUgY2hlY2sg
YXJlIGRpc2Nvbm5lY3RlZCBpbW1lZGlhdGVseSBhbmQgYSBrZXJuZWwgYWxlcnQKaXMgbG9nZ2Vk
LgotLS0KIGRyaXZlcnMvdXNiL2NvcmUvaHViLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jb3Jl
L2h1Yi5jIGIvZHJpdmVycy91c2IvY29yZS9odWIuYwppbmRleCA2OGQ5NTUxODRjZmIuLmZhZDhj
ZTE0ZDlmOCAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvY29yZS9odWIuYworKysgYi9kcml2ZXJz
L3VzYi9jb3JlL2h1Yi5jCkBAIC01NDg4LDcgKzU0ODgsNyBAQCBzdGF0aWMgdm9pZCBodWJfcG9y
dF9jb25uZWN0KHN0cnVjdCB1c2JfaHViICpodWIsIGludCBwb3J0MSwgdTE2IHBvcnRzdGF0dXMs
CiAgICAgICAgICAgICAgICAgKiBJZiBhIGRldmljZSBpcyByZWplY3RlZCwgaXQgaXMgZGlzY29u
bmVjdGVkIGltbWVkaWF0ZWx5IGFuZCBhIHNlY3VyaXR5IHdhcm5pbmcKICAgICAgICAgICAgICAg
ICAqIGlzIGxvZ2dlZCB0byB0aGUga2VybmVsIGxvZy4KICAgICAgICAgICAgICAgICAqCi0gICAg
ICAgICAgICAgICAgKiBOT1RFOgorICAgICAgICAgICAgICAgICogTk9URTogCiAgICAgICAgICAg
ICAgICAgKiBUaGlzIGlzIGEgZGVmZW5zaXZlIG1lY2hhbmlzbSBhbmQgZG9lcyBub3QgcmVwbGFj
ZSBmdWxsIHVzZXJzcGFjZSBtYWx3YXJlCiAgICAgICAgICAgICAgICAgKiBkZXRlY3Rpb24gb3Ig
VVNCIGF1dGhvcml6YXRpb24gZnJhbWV3b3Jrcy4KICAgICAgICAgICAgICAgICAqLwotLSAKMi40
My4wCgo=
--6MNQdsB1--



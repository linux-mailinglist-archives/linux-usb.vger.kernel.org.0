Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4203C887D
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2019 14:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfJBM3E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 08:29:04 -0400
Received: from mout.gmx.net ([212.227.17.22]:33217 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726034AbfJBM3E (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Oct 2019 08:29:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1570019340;
        bh=xDjyvJ0W5/IgDZfNHUUFixRu2PoIBlgFapkb/1giDj8=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=MKcJIqMsVXoarFs84i28KFKJd51O/RiIY3SVFx7eXEh6Q8R1P0cE/aL2Z7zT+EKCI
         7pVb6DYEL0r0JTKIyI1+RGPgk6UOZJ4Vej8kk8Zj7tFoy5qo08mNN/kqdYLw+mCo7q
         1lyBs1e29WQ1+WNHIroZBUNobrl5tZrwmpus9smo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.132] ([212.88.11.189]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mg6Zq-1hdXJS1krO-00hfI2 for
 <linux-usb@vger.kernel.org>; Wed, 02 Oct 2019 14:29:00 +0200
To:     linux-usb@vger.kernel.org
From:   Bernhard Gebetsberger <bernhard.gebetsberger@gmx.at>
Subject: Regression: USB/xhci issues on some systems with newer kernel
 versions
Message-ID: <3edaf835-7cde-37d9-5a0a-5a9b21a02968@gmx.at>
Date:   Wed, 2 Oct 2019 14:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:W6Rjmh3TdIgWBuSOk0Wp9siVYJQ5S4kzTY9Qo9uJ7RdPU5jOwiK
 vHtjB4jJHb7EqqEWLvryTA94ws4A8ZjgWom1TW42pxGnXgB95b70RBPanms346MNjBEA9fm
 UAgmCcNBAqmh9f7NHczS4pyzs6tBCK/dBtBQbpY6c2TJD7ocTBZCbVjSlGn03W3ioIp6WIO
 QDmTLh986ka0CeNb2KX1A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BfBnqIW6Bw8=:OOR47iqSUNS7XFDnL3f5mg
 oshy2OhXPkLEfkvEHpg8mPl400WP1fcSUr9122qw+3pciJ4iC9SEm+kMRjZPtNYOKv3X9HZ6N
 5zF7AGPGFsJg/opTlvnCPOytB+Pcs3R2DC8j71CtMqm2PSLXFwVU4UMsIO63/JHdQ4Wte1nbB
 Uw9TlthANGHIeil7zjmpkRbMKwf5RlFZx+puADxpypjcti+mjXKD7Vhtlnol4owCkycohpY0+
 0+ePcA0YvEHYCTdvcowga0GsPBnadnQnCM5TXGWz0MV6t6rwHagvEVcwtCEIu+9D780aJAb65
 IymCi03VH6o4dsV5BZVVgmEKTig6r4NGVCCh9yZJ7HpJWJlxraPixrLD6ad2EFnZ1eAvQAnmK
 yvbBIxxwGtKAJXj3PLjmUGt7x3+DJWpP8L59IUyZnFYJ9CUAerqA1R0DUnpkU/RDuZk6LRUzY
 90/s+A5sLon5/CP11D1r7+4SY55FksItOW8/2O6P0kTHJH2T36tAhDZo7WcJNHAYqKPhfnPWV
 bVcX3xaNowg9ciYcFr6cWNlVQNXTj+CF3mhP8v10AyJOK6MU2t71x28Cyi2wkttQkmg5FEuD+
 XXwaSPNvu4nO/pwOjlZa8Iax+ylF7lRPL7o15CS9c7g7skhcsqasyUjKEWRysYXywjAmCvzsC
 E0qGKc2pLkf7nxhOjTEruhxDhzPNPrXn9yuNC33qACc04B2McJEt9PGqKdXrk7JIIlTkf8Wrj
 bQkdMGphquYs1WcoDrJTpjkTFzSxBm4hq+v5WF0kwpMSz5KYODR0cxdFVImbUfevMf0AlVnZh
 k2Esf78tHw3gv3NAAMfQTdQqHmH7yNxQBk4YZydRkUOMMFJZ4Jlu+Qie15eiTh9pOtx4XQV5E
 j7tWjzxQda395wlCXUBJP5CHqzGG4axZbqXBfC2+gR8dkyGprwk3W3SWH4Ffh4jxX65eSP0zs
 oC9FY1csc0BNDS1u05Kd25v+0wmNQ7iR1CQrf3AmVoZx2OV2KKFd8FINa86WSqdTyTA/l3r3k
 MI+G9kR4ElNNGgfokUfZYGOcLsCwgvXJ2WpqRwxWy5nrLIep+tNsg9ru0ex85BUmdXcrIvEpU
 dAG3RFR028ukN9+YYME4iVL98bPpR3vQc3gZOdOYqPk06dFDLMbPiPnxYXp8WBFBzjrTqERm2
 D69xNaAQGIngx09LEGrkbJzjrTGdP8s7uyhdA1taeLFBZI0TnhTljYm7U/JLexQuYJdzlMC2u
 Ed7e8B9I0iRQiOzyta6GRTQ+s8cuPRNKluy247XfZgjJdrODLkZWr3VC7S4g=
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

There has been a regression in the xhci driver since kernel version 4.20, =
on some systems some usb devices won't work until the system gets rebooted=
.
The error message in dmesg is "WARN Set TR Deq Ptr cmd failed due to incor=
rect slot or ep state", although for some reason there are some usb device=
s that are affected by this issue but don't throw the error message(includ=
ing the device I'm using, I got the error in previous kernel versions thou=
gh).
It seems like this bug can also lead to system instability, one user repor=
ted in the bug tracker(https://bugzilla.kernel.org/show_bug.cgi?id=3D20254=
1#c58) that he got a system freeze because of this when using kernel 5.3.1=
.

When looking at the responses in the bug tracker, it looks like it mostly =
affects Ryzen based systems with 300 series motherboards, although there a=
re some other affected systems as well. It doesn't only affect wifi/blueto=
oth sticks, some users even got this issue when connecting their smartphon=
e or their external hard drive to their PC.

After enabling kernel debugging/tracing for xhci_hcd I got the following m=
essages in dmesg(short version, link to the whole file below):
[=C2=A0 231.185635] xhci_hcd 0000:38:00.4: xhci_get_isoc_frame_id: index 0=
, reg 0x1b29 start_frame_id 0x366, end_frame_id 0x6e4, start_frame 0x372
[=C2=A0 231.185642] xhci_hcd 0000:38:00.4: xhci_get_isoc_frame_id: index 1=
, reg 0x1b29 start_frame_id 0x366, end_frame_id 0x6e4, start_frame 0x373
[=C2=A0 231.185646] xhci_hcd 0000:38:00.4: xhci_get_isoc_frame_id: index 2=
, reg 0x1b29 start_frame_id 0x366, end_frame_id 0x6e4, start_frame 0x374
......
[=C2=A0 231.887681] xhci_hcd 0000:38:00.4: xhci_get_isoc_frame_id: index 4=
, reg 0x3119 start_frame_id 0x624, end_frame_id 0x1a2, start_frame 0x633
[=C2=A0 231.887687] xhci_hcd 0000:38:00.4: xhci_get_isoc_frame_id: index 5=
, reg 0x3119 start_frame_id 0x624, end_frame_id 0x1a2, start_frame 0x634
[=C2=A0 231.892346] xhci_hcd 0000:38:00.4: Cancel URB 000000008599ca58, de=
v 1, ep 0x1, starting at offset 0xff388ea0
[=C2=A0 231.892355] xhci_hcd 0000:38:00.4: // Ding dong!
[=C2=A0 231.892363] xhci_hcd 0000:38:00.4: Cancel URB 000000000d35fd5d, de=
v 1, ep 0x1, starting at offset 0xff388ef0
[=C2=A0 231.892368] xhci_hcd 0000:38:00.4: Cancel URB 0000000074e3ee88, de=
v 1, ep 0x1, starting at offset 0xff388e40
[=C2=A0 231.892640] xhci_hcd 0000:38:00.4: Stopped on Transfer TRB for slo=
t 1 ep 1
[=C2=A0 231.892647] xhci_hcd 0000:38:00.4: Removing canceled TD starting a=
t 0xff388ea0 (dma).
[=C2=A0 231.892651] xhci_hcd 0000:38:00.4: Removing canceled TD starting a=
t 0xff388eb0 (dma).
[=C2=A0 231.892653] xhci_hcd 0000:38:00.4: Removing canceled TD starting a=
t 0xff388ec0 (dma).
[=C2=A0 231.892656] xhci_hcd 0000:38:00.4: Removing canceled TD starting a=
t 0xff388ed0 (dma).
[=C2=A0 231.892658] xhci_hcd 0000:38:00.4: Removing canceled TD starting a=
t 0xff388ee0 (dma).
[=C2=A0 231.892661] xhci_hcd 0000:38:00.4: Removing canceled TD starting a=
t 0xff388ef0 (dma).
[=C2=A0 231.892663] xhci_hcd 0000:38:00.4: Removing canceled TD starting a=
t 0xff388f00 (dma).
[=C2=A0 231.892666] xhci_hcd 0000:38:00.4: Removing canceled TD starting a=
t 0xff388f10 (dma).
[=C2=A0 231.892668] xhci_hcd 0000:38:00.4: Removing canceled TD starting a=
t 0xff388f20 (dma).
[=C2=A0 231.892670] xhci_hcd 0000:38:00.4: Removing canceled TD starting a=
t 0xff388f30 (dma).
[=C2=A0 231.892672] xhci_hcd 0000:38:00.4: Removing canceled TD starting a=
t 0xff388f40 (dma).
[=C2=A0 231.892675] xhci_hcd 0000:38:00.4: Removing canceled TD starting a=
t 0xff388e90 (dma).
[=C2=A0 231.892677] xhci_hcd 0000:38:00.4: Finding endpoint context
[=C2=A0 231.892679] xhci_hcd 0000:38:00.4: Cycle state =3D 0x1
[=C2=A0 231.892682] xhci_hcd 0000:38:00.4: New dequeue segment =3D 0000000=
05d174923 (virtual)
[=C2=A0 231.892685] xhci_hcd 0000:38:00.4: New dequeue pointer =3D 0xff388=
ea0 (DMA)
[=C2=A0 231.892688] xhci_hcd 0000:38:00.4: Set TR Deq Ptr cmd, new deq seg=
 =3D 000000005d174923 (0xff388000 dma), new deq ptr =3D 00000000d5c5ed2a (=
0xff388ea0 dma), new cycle =3D 1
[=C2=A0 231.892693] xhci_hcd 0000:38:00.4: // Ding dong!
[=C2=A0 231.892728] xhci_hcd 0000:38:00.4: Successful Set TR Deq Ptr cmd, =
deq =3D @ff388ea0
[=C2=A0 231.897107] xhci_hcd 0000:38:00.4: xhci_drop_endpoint called for u=
dev 0000000043fc1c1f
[=C2=A0 231.897126] xhci_hcd 0000:38:00.4: drop ep 0x1, slot id 1, new dro=
p flags =3D 0x4, new add flags =3D 0x0
[=C2=A0 231.897129] xhci_hcd 0000:38:00.4: xhci_check_bandwidth called for=
 udev 0000000043fc1c1f
[=C2=A0 231.897137] xhci_hcd 0000:38:00.4: // Ding dong!
[=C2=A0 231.898523] xhci_hcd 0000:38:00.4: Successful Endpoint Configure c=
ommand

I have uploaded the whole dmesg file and the tracing file to transfer.sh: =
https://transfer.sh/zYohl/dmesg and https://transfer.sh/KNbFL/xhci-trace

The issues occur since commit f8f80be501aa2f10669585c3e328fad079d8cb3a "xh=
ci: Use soft retry to recover faster from transaction errors". I think thi=
s commit should be reverted at least until a workaround has been found, es=
pecially since the next two kernel versions will be used by a lot of distr=
ibutions(5.4 because it's a LTS kernel and 5.5 will probably be used in Ub=
untu 20.04) so more users would be affected by this.

- Bernhard


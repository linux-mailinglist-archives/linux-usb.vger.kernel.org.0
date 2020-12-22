Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A62D2E0968
	for <lists+linux-usb@lfdr.de>; Tue, 22 Dec 2020 12:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgLVLOu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Dec 2020 06:14:50 -0500
Received: from mout.gmx.net ([212.227.17.21]:53833 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726533AbgLVLOu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Dec 2020 06:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608635598;
        bh=yvCoD5UZNeLHKTQMF8r5Di2/G1rK8erQmQP3wtjjuXk=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=HZjDLQ0CWOzGMqd8i1nyK8tRJHUr0onegHCOvaBqozSNYbxKUmWVLZ1Kzot8PDjmK
         Tnz6LDe1cvFiw225cPAur65qqgEvhspiM6IythROatqiXn7bA9788P0troaLHxh/+C
         /NgwPZ4ETaC80nB8oQgcWePZITCYMYp9zD7Xik3k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ingxiaomi.fritz.box ([88.217.180.51]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mel3t-1kJ9jP2peP-00aih9 for
 <linux-usb@vger.kernel.org>; Tue, 22 Dec 2020 12:13:18 +0100
Date:   Tue, 22 Dec 2020 12:13:17 +0100
From:   Ingo Rohloff <lundril@gmx.de>
To:     linux-usb@vger.kernel.org
Subject: USB Gadget via ConfigFS; define custom String Descriptors
Message-ID: <20201222121317.008f54a6@ingxiaomi.fritz.box>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:B5ettG2kJPuRrmP3QVfP0jwPSX1TLIImMBA6kSiHKmNLm/hna9N
 DhWKWWJ2OGPrXJcXkc8ikWQdf3b4oKUrca4wwq7HqsPKhxZ14kw+a0mC0mrLWmD+x5/5uv/
 NuskXaEFpSzrpUtPXxDU2XA08cvUkBiEjdz1q5YFhHtmEq3fXQ2q5lglOVvJY7V62dg6Y/o
 l6g+V1Dopmp01yIjtv82g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4NWfUP+Dy3k=:j6cRYiX+GUruk9IwK3sTMX
 soJtzSV0RvWUJsovsDqTneM2y+fJ2SMHgXo67HuSonqKWzorHwxmexj13bfe3k73krZ3sYUgn
 lkldPnmvqt03mZGHYqe1jJUt1h+ItA24S6MccXyyYGfVkuHbtn4/1oxfXIQ2Rma33gaVU43DH
 K0KlAP7ze2q6WvEadEESabj1F4m9Z1FeLzv1jfPxjVYZlsrhjPgccyTG1Lix/VxZ/ad5MTPjc
 +Z+10RzqhX+Px0EcZ2XOQKu3hoIZ7jbmNoWXS+7a3EXfUaaA8CPsAC4GMBikjABHUMqtvbgfw
 XO9dTjtc0LrDCeH2Pa5gvTaNVCRncXY0nQhsCMCPiU0Z7ZZiTox4g8pQcDpb9bu9eZN+7btR9
 +Hc2gmrtiGMXHgEU4Ex8pBU/5cj2uQO+X60gYDbiZgvvMafTV29q2z5i7JIWM7jrAnn/AjXin
 p5gAf3+AJbeshOCQVgZLGMnmbniVurv1rUcCAdr723c5MHi5dAx2xODgEVf0AcRUkvKVDYJqY
 8E6yGQGmJJMC5nnZHZsTRXn91RJMio1VUBZWLSMZiKCd32j9SXX7eahtJCWUGytkewzZw2OGv
 p94XNN/qkBFQKwFvzyzBpH8jvXRBrIZ5xttY0gqz3YKpfnkp76DqpBLxkzQzLKd5dpD8cKWFl
 HkeXZaX/HC7lc+02cmiPeH4ldw8GuX3SQjQUpU0BYuoGKDcpmnX8cKmRizAS3CVk7nwWrlU8X
 W0VumNeNUTma+kPEc8bKn3666j4eRcvGTiXr6PWPqJijW3Xxq8VwhT5rgWV5uGGkzJvOZ5lfO
 zjASBgREimqYM/25+SELP0IA3j+De3rIchhLOr1R4Eil/qzF1QgM2wHBm8FLvKlV8Ps39guXn
 QkymFhqPvuTRjEzxEDYQ==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

before trying to implement something I would like to get some opinions
if what I am thinking of seems to be useful, or if I am on the wrong
track.

I am implementing a USB Gadget.
To configure the gadget I use ConfigFS.
Now what I would like to do is to configure some device specific
string descriptors, which have a fixed, custom index.


Now I know that if you for example create a gadget in configFS
at directory
  usb_gadget/g1

you will get the following standard device string descriptors:
  usb_gadget/g1/strings/0x409
    manufacturer
    product
    serialnumber

You might set the content of these string descriptors by writing to
these files.
The indexes of these string descriptors gets auto-assigned as far as I
understand the Linux source code.
These indexes are then put into the USB device descriptor, which is how
a USB host finds out which indexes to use.


What I now want to do is to define additional string descriptors, with
some fixed, custom indexes.

Questions:

* Is this simply not intended by the USB spec ?

* Is there already a way to do that via ConfigFS,
  which I am not aware of ?

* Does a mechanism to define such custom string descriptors sound
  useful ? So is it worth the effort to implement it ?


Just a super simple proposal how to do that; since I have no experience
what's best for ConfigFS, please advise if you think there is a better
way!
If a user creates a file
   usb_gadget/g1/strings/0x0409/
      custom_34

Then this will be accessible as USB device string descriptor,
with index 0x34. So the two characters after the "_" are interpreted as
two hex digits, which define the index.

Does this sound like a viable strategy to allow custom string
descriptors ?


Ingo

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 379D4294D5C
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 15:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408132AbgJUNSM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 09:18:12 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:46625 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394594AbgJUNSL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Oct 2020 09:18:11 -0400
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2AE5140011;
        Wed, 21 Oct 2020 13:18:06 +0000 (UTC)
Message-ID: <5d2dc161951d0717d1ccfc88049c241c8ce8d1e6.camel@hadess.net>
Subject: Re: Bug caused by 53965c79c2db (USB: Fix device driver race)
From:   Bastien Nocera <hadess@hadess.net>
To:     "M. Vefa Bicakci" <m.v.b@runbox.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Pany <pany@fedoraproject.org>, linux-usb@vger.kernel.org
Date:   Wed, 21 Oct 2020 15:18:06 +0200
In-Reply-To: <83bd4ab7-15a6-73c2-decd-1da1c393bad0@runbox.com>
References: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
         <20201017200200.GB842001@rowland.harvard.edu>
         <CAE3RAxvNUvzqKT+GK3A4cQ7Tm_tFRQJKfJ01r0ic-5066fikDA@mail.gmail.com>
         <20201019174028.GF898631@rowland.harvard.edu>
         <cf1e7059-e1d2-2e7a-89c1-0c162850fbb4@runbox.com>
         <20201020152859.GA945128@rowland.harvard.edu>
         <74e25095-53fa-b98c-6baf-c97eea574d1c@runbox.com>
         <e7ecea72755147dc3252e8d5c1735903993caa1e.camel@hadess.net>
         <83bd4ab7-15a6-73c2-decd-1da1c393bad0@runbox.com>
Content-Type: multipart/mixed; boundary="=-+cS8ZMpcbpYYl0SfXRJA"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-+cS8ZMpcbpYYl0SfXRJA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-10-21 at 09:08 -0400, M. Vefa Bicakci wrote:
> On 21/10/2020 07.53, Bastien Nocera wrote:
> [Snipped by Vefa]
> > 
> > I have no idea why there isn't a match function. Patch v1 had a
> > huge
> > table:
> > https://marc.info/?l=linux-usb&m=157062863431186&w=2
> > and v2 already didn't had that comment, but no .match function:
> > https://marc.info/?l=linux-usb&m=157114990905421&w=2
> > 
> > I'll prepare a patch that adds a match function. I'll let you
> > (Vefa)
> > look at which of your patches need backporting though, as I'm
> > really
> > quite a bit lost in the different patch sets and branches :/
> 
> Hello Bastien,
> 
> Having found the root cause of the issue by going through Pany's
> logs and having proposed a solution, I was hoping to get credit
> for the resolution of the issue by authoring the patch.

I don't care either way. Attached are the 2 patches I had made and was
in the process of compiling and testing, feel free to adapt them,
change the authorship, etc.

Note that you mentioned you'd need to "replace the ID table with
a match function", which will mean that the driver isn't automatically
loaded when a device gets plugged in. So that wouldn't have worked.

Let me know when you've made your patch, as I'll need to update this
bug when there's something to test:
https://bugzilla.redhat.com/show_bug.cgi?id=1878347

Cheers

--=-+cS8ZMpcbpYYl0SfXRJA
Content-Disposition: attachment;
	filename*0=0002-USB-apple-mfi-fastcharge-don-t-probe-unhandled-devic.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0002-USB-apple-mfi-fastcharge-don-t-probe-unhandled-devic.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA2NjUyYWY1YjQ2ZjM5ZDk2OTBkNzJkYzExOTAyYjM2YTQ0YzI0MmExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCYXN0aWVuIE5vY2VyYSA8aGFkZXNzQGhhZGVzcy5uZXQ+CkRh
dGU6IFdlZCwgMjEgT2N0IDIwMjAgMTQ6MzE6NTggKzAyMDAKU3ViamVjdDogW1BBVENIIDIvMl0g
VVNCOiBhcHBsZS1tZmktZmFzdGNoYXJnZTogZG9uJ3QgcHJvYmUgdW5oYW5kbGVkIGRldmljZXMK
CkNvbnRyYXJ5IHRvIHRoZSBjb21tZW50IGFib3ZlIHRoZSBpZCB0YWJsZSwgd2UgZGlkbid0IGlt
cGxlbWVudCBhIG1hdGNoCmZ1bmN0aW9uLiBUaGlzIG1lYW50IHRoYXQgZXZlcnkgc2luZ2xlIEFw
cGxlIGRldmljZSB0aGF0IHdhcyBhbHJlYWR5CnBsdWdnZWQgaW4gdG8gdGhlIGNvbXB1dGVyIHdv
dWxkIGhhdmUgaXRzIGRldmljZSBkcml2ZXIgcmVwcm9iZWQKd2hlbiB0aGUgYXBwbGUtbWZpLWZh
c3RjaGFyZ2UgZHJpdmVyIHdhcyBsb2FkZWQsIGVnLiB0aGUgU0QgY2FyZCByZWFkZXIKY291bGQg
YmUgcmVwcm9iZWQgd2hlbiB0aGUgYXBwbGUtbWZpLWZhc3RjaGFyZ2UgYWZ0ZXIgcGl2b3Rpbmcg
cm9vdApkdXJpbmcgYm9vdCB1cCBhbmQgdGhlIG1vZHVsZSBiZWNhbWUgYXZhaWxhYmxlLgoKTWFr
ZSBzdXJlIHRoYXQgdGhlIGRyaXZlciBwcm9iZSBpc24ndCBiZWluZyBydW4gZm9yIHVuc3VwcG9y
dGVkCmRldmljZXMgYnkgYWRkaW5nIGEgbWF0Y2ggZnVuY3Rpb24gdGhhdCBjaGVja3MgdGhlIHBy
b2R1Y3QgSUQsIGluCmFkZGl0aW9uIHRvIHRoZSBpZF90YWJsZSBjaGVja2luZyB0aGUgdmVuZG9y
IElELgoKRml4ZXM6IDI0OWZhODIxN2I4NCAoIlVTQjogQWRkIGRyaXZlciB0byBjb250cm9sIFVT
QiBmYXN0IGNoYXJnZSBmb3IgaU9TIGRldmljZXMiKQpTaWduZWQtb2ZmLWJ5OiBCYXN0aWVuIE5v
Y2VyYSA8aGFkZXNzQGhhZGVzcy5uZXQ+Ci0tLQogZHJpdmVycy91c2IvbWlzYy9hcHBsZS1tZmkt
ZmFzdGNoYXJnZS5jIHwgMTcgKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL21p
c2MvYXBwbGUtbWZpLWZhc3RjaGFyZ2UuYyBiL2RyaXZlcnMvdXNiL21pc2MvYXBwbGUtbWZpLWZh
c3RjaGFyZ2UuYwppbmRleCBiNDAzMDk0YTZiM2EuLjU3OWQ4Yzg0ZGU0MiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy91c2IvbWlzYy9hcHBsZS1tZmktZmFzdGNoYXJnZS5jCisrKyBiL2RyaXZlcnMvdXNi
L21pc2MvYXBwbGUtbWZpLWZhc3RjaGFyZ2UuYwpAQCAtMTYzLDE3ICsxNjMsMjMgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBwb3dlcl9zdXBwbHlfZGVzYyBhcHBsZV9tZmlfZmNfZGVzYyA9IHsKIAku
cHJvcGVydHlfaXNfd3JpdGVhYmxlICA9IGFwcGxlX21maV9mY19wcm9wZXJ0eV9pc193cml0ZWFi
bGUKIH07CiAKK3N0YXRpYyBib29sIG1maV9mY19tYXRjaChzdHJ1Y3QgdXNiX2RldmljZSAqdWRl
dikKK3sKKwlpbnQgaWRQcm9kdWN0OworCisJaWRQcm9kdWN0ID0gbGUxNl90b19jcHUodWRldi0+
ZGVzY3JpcHRvci5pZFByb2R1Y3QpOworCS8qIFNlZSBjb21tZW50IGFib3ZlIG1maV9mY19pZF90
YWJsZVtdICovCisJcmV0dXJuIChpZFByb2R1Y3QgPj0gMHgxMjAwICYmIGlkUHJvZHVjdCA8PSAw
eDEyZmYpOworfQorCiBzdGF0aWMgaW50IG1maV9mY19wcm9iZShzdHJ1Y3QgdXNiX2RldmljZSAq
dWRldikKIHsKIAlzdHJ1Y3QgcG93ZXJfc3VwcGx5X2NvbmZpZyBiYXR0ZXJ5X2NmZyA9IHt9Owog
CXN0cnVjdCBtZmlfZGV2aWNlICptZmkgPSBOVUxMOwotCWludCBlcnIsIGlkUHJvZHVjdDsKKwlp
bnQgZXJyOwogCi0JaWRQcm9kdWN0ID0gbGUxNl90b19jcHUodWRldi0+ZGVzY3JpcHRvci5pZFBy
b2R1Y3QpOwotCS8qIFNlZSBjb21tZW50IGFib3ZlIG1maV9mY19pZF90YWJsZVtdICovCi0JaWYg
KGlkUHJvZHVjdCA8IDB4MTIwMCB8fCBpZFByb2R1Y3QgPiAweDEyZmYpIHsKKwlpZiAoIW1maV9m
Y19tYXRjaCh1ZGV2KSkKIAkJcmV0dXJuIC1FTk9ERVY7Ci0JfQogCiAJbWZpID0ga3phbGxvYyhz
aXplb2Yoc3RydWN0IG1maV9kZXZpY2UpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIW1maSkgewpAQCAt
MjIwLDYgKzIyNiw3IEBAIHN0YXRpYyBzdHJ1Y3QgdXNiX2RldmljZV9kcml2ZXIgbWZpX2ZjX2Ry
aXZlciA9IHsKIAkucHJvYmUgPQltZmlfZmNfcHJvYmUsCiAJLmRpc2Nvbm5lY3QgPQltZmlfZmNf
ZGlzY29ubmVjdCwKIAkuaWRfdGFibGUgPQltZmlfZmNfaWRfdGFibGUsCisJLm1hdGNoID0JbWZp
X2ZjX21hdGNoLAogCS5nZW5lcmljX3N1YmNsYXNzID0gMSwKIH07CiAKLS0gCjIuMjguMAoK


--=-+cS8ZMpcbpYYl0SfXRJA
Content-Disposition: attachment;
	filename*0=0001-usbcore-driver-Check-both-id_table-and-match-when-bo.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-usbcore-driver-Check-both-id_table-and-match-when-bo.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSBmNzcyYmI3MTg5MWI1MDkwNDcyYTc0NGYwN2RiZTI2OGI1ZDQwODFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCYXN0aWVuIE5vY2VyYSA8aGFkZXNzQGhhZGVzcy5uZXQ+CkRh
dGU6IFdlZCwgMjEgT2N0IDIwMjAgMTU6MDQ6MzMgKzAyMDAKU3ViamVjdDogW1BBVENIIDEvMl0g
dXNiY29yZS9kcml2ZXI6IENoZWNrIGJvdGggaWRfdGFibGUgYW5kIG1hdGNoKCkgd2hlbiBib3Ro
CiBhdmFpbGFibGUKCldoZW4gYSBVU0IgZGV2aWNlIGRyaXZlciBoYXMgYm90aCBhbiBpZF90YWJs
ZSBhbmQgYSBtYXRjaCgpIGZ1bmN0aW9uLCBtYWtlCnN1cmUgdG8gY2hlY2sgYm90aCB0byBmaW5k
IGEgbWF0Y2gsIGZpcnN0IG1hdGNoaW5nIHRoZSBpZF90YWJsZSwgdGhlbgpjaGVja2luZyB0aGUg
bWF0Y2goKSBmdW5jdGlvbi4KClRoaXMgbWFrZXMgaXQgcG9zc2libGUgdG8gaGF2ZSBtb2R1bGUg
YXV0b2xvYWRpbmcgZG9uZSB0aHJvdWdoIHRoZQppZF90YWJsZSB3aGVuIGRldmljZXMgYXJlIHBs
dWdnZWQgaW4sIGJlZm9yZSBjaGVja2luZyBmb3IgZnVydGhlcgpkZXZpY2UgZWxpZ2liaWxpdHkg
aW4gdGhlIG1hdGNoKCkgZnVuY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBCYXN0aWVuIE5vY2VyYSA8
aGFkZXNzQGhhZGVzcy5uZXQ+Ci0tLQogZHJpdmVycy91c2IvY29yZS9kcml2ZXIuYyB8IDEwICsr
KysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY29yZS9kcml2ZXIuYyBiL2RyaXZlcnMvdXNiL2Nv
cmUvZHJpdmVyLmMKaW5kZXggOThiNzQ0OWMxMWYzLi41NzUyNzVlNzJkNjUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvdXNiL2NvcmUvZHJpdmVyLmMKKysrIGIvZHJpdmVycy91c2IvY29yZS9kcml2ZXIu
YwpAQCAtODQ1LDYgKzg0NSw3IEBAIHN0YXRpYyBpbnQgdXNiX2RldmljZV9tYXRjaChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfZHJpdmVyICpkcnYpCiAJaWYgKGlzX3VzYl9kZXZp
Y2UoZGV2KSkgewogCQlzdHJ1Y3QgdXNiX2RldmljZSAqdWRldjsKIAkJc3RydWN0IHVzYl9kZXZp
Y2VfZHJpdmVyICp1ZHJ2OworCQlib29sIGhhc19tYXRjaGVkX2lkID0gZmFsc2U7CiAKIAkJLyog
aW50ZXJmYWNlIGRyaXZlcnMgbmV2ZXIgbWF0Y2ggZGV2aWNlcyAqLwogCQlpZiAoIWlzX3VzYl9k
ZXZpY2VfZHJpdmVyKGRydikpCkBAIC04NTMsOCArODU0LDExIEBAIHN0YXRpYyBpbnQgdXNiX2Rl
dmljZV9tYXRjaChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfZHJpdmVyICpkcnYp
CiAJCXVkZXYgPSB0b191c2JfZGV2aWNlKGRldik7CiAJCXVkcnYgPSB0b191c2JfZGV2aWNlX2Ry
aXZlcihkcnYpOwogCi0JCWlmICh1ZHJ2LT5pZF90YWJsZSkKLQkJCXJldHVybiB1c2JfZGV2aWNl
X21hdGNoX2lkKHVkZXYsIHVkcnYtPmlkX3RhYmxlKSAhPSBOVUxMOworCQlpZiAodWRydi0+aWRf
dGFibGUpIHsKKwkJCWlmICh1c2JfZGV2aWNlX21hdGNoX2lkKHVkZXYsIHVkcnYtPmlkX3RhYmxl
KSA9PSBOVUxMKQorCQkJCXJldHVybiAwOworCQkJaGFzX21hdGNoZWRfaWQgPSB0cnVlOworCQl9
CiAKIAkJaWYgKHVkcnYtPm1hdGNoKQogCQkJcmV0dXJuIHVkcnYtPm1hdGNoKHVkZXYpOwpAQCAt
ODYzLDYgKzg2Nyw4IEBAIHN0YXRpYyBpbnQgdXNiX2RldmljZV9tYXRjaChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBkZXZpY2VfZHJpdmVyICpkcnYpCiAJCSAqIGlkX3RhYmxlIG9yIGEgbWF0
Y2ggZnVuY3Rpb24sIHRoZW4gbGV0IHRoZSBkcml2ZXIncyBwcm9iZQogCQkgKiBmdW5jdGlvbiBk
ZWNpZGUuCiAJCSAqLworCQlpZiAoaGFzX21hdGNoZWRfaWQpCisJCQlyZXR1cm4gMDsKIAkJcmV0
dXJuIDE7CiAKIAl9IGVsc2UgaWYgKGlzX3VzYl9pbnRlcmZhY2UoZGV2KSkgewotLSAKMi4yOC4w
Cgo=


--=-+cS8ZMpcbpYYl0SfXRJA--


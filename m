Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C603B1640E4
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 10:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgBSJ4d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Feb 2020 04:56:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:35564 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726385AbgBSJ4d (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Feb 2020 04:56:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 2D3AEAD93;
        Wed, 19 Feb 2020 09:56:31 +0000 (UTC)
Message-ID: <1582106185.9787.9.camel@suse.com>
Subject: Re: usb cdc-acm TIOCSSERIAL may wrongly report EPERM
From:   Oliver Neukum <oneukum@suse.com>
To:     Anthony Mallet <anthony.mallet@laas.fr>
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 19 Feb 2020 10:56:25 +0100
In-Reply-To: <24140.5498.228141.264272@beetle.laas.fr>
References: <24140.5498.228141.264272@beetle.laas.fr>
Content-Type: multipart/mixed; boundary="=-A0aR9OY6X058HHBTCulz"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-A0aR9OY6X058HHBTCulz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Dienstag, den 18.02.2020, 17:48 +0100 schrieb Anthony Mallet:
> Hi,
> 
> A TIOCSSERIAL ioctl(2) performed on a file descriptor corresponding to
> a cdc-acm driver may wrongly report EPERM even when no CAP_SYS_ADMIN
> is required. This concerns almost all recent kernel versions, as I
> explain below.

Hi,

thank you for the detailed report about an unusual bug. Could you
test the attached patch? I have taken the liberty of presuming
to add your 'Reported-and-tested-by'.

	Regards
		Oliver

--=-A0aR9OY6X058HHBTCulz
Content-Disposition: attachment;
	filename="0001-USB-cdc-acm-fix-rounding-error-in-TIOCSSERIAL.patch"
Content-Type: text/x-patch;
	name="0001-USB-cdc-acm-fix-rounding-error-in-TIOCSSERIAL.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA3OGMxYjAyMzc2YjgxNjEwOGFhZGViYTZlZjlhNWQ2OWEzYmZiOWJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBXZWQsIDE5IEZlYiAyMDIwIDEwOjQzOjE3ICswMTAwClN1YmplY3Q6IFtQQVRDSF0gVVNCOiBj
ZGMtYWNtOiBmaXggcm91bmRpbmcgZXJyb3IgaW4gVElPQ1NTRVJJQUwKClF1b3RpbmcgdGhlIGJ1
ZyByZXBvcnRlcjoKCkJ5IGRlZmF1bHQsIHR0eV9wb3J0X2luaXQoKSBpbml0aWFsaXplcyB0aG9z
ZSBwYXJhbWV0ZXJzIHRvIGEgbXVsdGlwbGUKb2YgSFouIEZvciBpbnN0YW5jZSBpbiBsaW5lIDY5
IG9mIHR0eV9wb3J0LmM6CiAgIHBvcnQtPmNsb3NlX2RlbGF5ID0gKDUwICogSFopIC8gMTAwOwpo
dHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvZHJpdmVycy90dHkv
dHR5X3BvcnQuYyNMNjkKCldpdGggZS5nLiBDT05GSUdfSFogPSAyNTAgKGFzIHRoaXMgaXMgdGhl
IGNhc2UgZm9yIFVidW50dSAxOC4wNApsaW51eC1pbWFnZS00LjE1LjAtMzctZ2VuZXJpYyksIHRo
ZSBkZWZhdWx0IHNldHRpbmcgZm9yIGNsb3NlX2RlbGF5IGlzCnRodXMgMTI1LgoKV2hlbiBpb2N0
bChmZCwgVElPQ0dTRVJJQUwsICZzKSBpcyBleGVjdXRlZCwgdGhlIHNldHRpbmcgcmV0dXJuZWQg
aW4KdXNlciBzcGFjZSBpcyAnMTInICgxMjUvMTApLiBXaGVuIGlvY3RsKGZkLCBUSU9DU1NFUklB
TCwgJnMpIGlzIHRoZW4KZXhlY3V0ZWQgd2l0aCB0aGUgc2FtZSBzZXR0aW5nICcxMicsIHRoZSB2
YWx1ZSBpcyBpbnRlcnByZXRlZCBhcyAnMTIwJwp3aGljaCBpcyBkaWZmZXJlbnQgZnJvbSB0aGUg
Y3VycmVudCBzZXR0aW5nIGFuZCBhIEVQRVJNIGVycm9yIG1heSBiZQpyYWlzZWQgYnkgc2V0X3Nl
cmlhbF9pbmZvKCkgaWYgIUNBUF9TWVNfQURNSU4uCmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxk
cy9saW51eC9ibG9iL21hc3Rlci9kcml2ZXJzL3VzYi9jbGFzcy9jZGMtYWNtLmMjTDkxOQoKU2ln
bmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1bSA8b25ldWt1bUBzdXNlLmNvbT4KUmVwb3J0ZWQtYW5k
LXRlc3RlZC1ieTogQW50aG9ueSBNYWxsZXQgPGFudGhvbnkubWFsbGV0QGxhYXMuZnI+CkZpeGVz
OiBiYTJkOGNlOWRiMGE2ICgiY2RjLWFjbTogaW1wbGVtZW50IFRJT0NTU0VSSUFMIHRvIGF2b2lk
IGJsb2NraW5nIGNsb3NlKDIpIikKLS0tCiBkcml2ZXJzL3VzYi9jbGFzcy9jZGMtYWNtLmMgfCA1
ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2NsYXNzL2NkYy1hY20uYyBiL2RyaXZlcnMvdXNiL2Ns
YXNzL2NkYy1hY20uYwppbmRleCA2MmY0ZmI5YjM2MmYuLmY5MDY0ZGJjZDMzMyAxMDA2NDQKLS0t
IGEvZHJpdmVycy91c2IvY2xhc3MvY2RjLWFjbS5jCisrKyBiL2RyaXZlcnMvdXNiL2NsYXNzL2Nk
Yy1hY20uYwpAQCAtOTE2LDggKzkxNiw5IEBAIHN0YXRpYyBpbnQgc2V0X3NlcmlhbF9pbmZvKHN0
cnVjdCB0dHlfc3RydWN0ICp0dHksIHN0cnVjdCBzZXJpYWxfc3RydWN0ICpzcykKIAltdXRleF9s
b2NrKCZhY20tPnBvcnQubXV0ZXgpOwogCiAJaWYgKCFjYXBhYmxlKENBUF9TWVNfQURNSU4pKSB7
Ci0JCWlmICgoY2xvc2VfZGVsYXkgIT0gYWNtLT5wb3J0LmNsb3NlX2RlbGF5KSB8fAotCQkgICAg
KGNsb3Npbmdfd2FpdCAhPSBhY20tPnBvcnQuY2xvc2luZ193YWl0KSkKKwkJLyogd2UgbXVzdCBy
ZWRvIHRoZSByb3VuZGluZyBoZXJlLCBzbyB0aGF0IHRoZSB2YWx1ZXMgbWF0Y2ggKi8KKwkJaWYg
KChjbG9zZV9kZWxheSAhPSAoYWNtLT5wb3J0LmNsb3NlX2RlbGF5IC8gMTApICogMTApIHx8CisJ
CSAgICAoY2xvc2luZ193YWl0ICE9IChhY20tPnBvcnQuY2xvc2luZ193YWl0IC8gMTApICogMTAp
KQogCQkJcmV0dmFsID0gLUVQRVJNOwogCQllbHNlCiAJCQlyZXR2YWwgPSAtRU9QTk9UU1VQUDsK
LS0gCjIuMTYuNAoK


--=-A0aR9OY6X058HHBTCulz--


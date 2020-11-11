Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3F12AEFDD
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 12:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgKKLof (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 06:44:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:53762 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726238AbgKKLoG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Nov 2020 06:44:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1605095041;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=S6/Fhw9ouI0C+k1vQdP1gNHbEEeB2VdJ403X5kFVq/M=;
        b=LkwRJP1xucPsmUWysSDj1SiSJBRuVjgq8Hy3NphpC+M96UiQ4yvzpYCH3I/wbMyY75P7yg
        Q/IwQG1rTvtjwO2UY9bdYqmO5J4ToEbHdhSP/boTTTQDGpshlqnU9t9oarn4ip6kSHyPVU
        T3TLeog9jMctGqVRd/YsZOYFpEQtQIE=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 4C073AC19;
        Wed, 11 Nov 2020 11:44:01 +0000 (UTC)
Message-ID: <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>
Subject: Re: Issues with LaCie USB3 drive and UAS
From:   Oliver Neukum <oneukum@suse.com>
To:     "David C. Partridge" <david.partridge@perdrix.co.uk>,
        linux-usb@vger.kernel.org
Date:   Wed, 11 Nov 2020 12:43:47 +0100
In-Reply-To: <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>
                 <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>
                 <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>
         <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>
         <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>
         <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk>
Content-Type: multipart/mixed; boundary="=-FwkElb1SOxV28Tb8D3P4"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-FwkElb1SOxV28Tb8D3P4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Montag, den 09.11.2020, 15:21 +0000 schrieb David C. Partridge:
> Update: I found out how to do it! 
> 
> Created /etc/modprobe.d/blacklist_uas.conf containing text:
> 
> options usb-storage quirks=059f:105f:u
> 
> followed by: update-initramfs -u
> and rebooted.
> 
> Now the device works fine and mkfs.ext4 finishes in seconds rather than hours.

Hi,

this is good for now. Could you test the attached patch and replace the
"u" in your module options for usb-storage with a "k" (for the new
quirk)?

	Regards
		Oliver


--=-FwkElb1SOxV28Tb8D3P4
Content-Disposition: attachment;
	filename="0001-USB-UAS-introduce-a-quirk-to-set-no_write_same.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0001-USB-UAS-introduce-a-quirk-to-set-no_write_same.patch";
	charset="UTF-8"

RnJvbSA1M2E1Y2FjYmY2MWNlNmE0OTM1NzIzODQ5YWQ2MDJmMzhkOGY5YTUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBXZWQsIDExIE5vdiAyMDIwIDEyOjM3OjE1ICswMTAwClN1YmplY3Q6IFtQQVRDSF0gVVNCOiBV
QVM6IGludHJvZHVjZSBhIHF1aXJrIHRvIHNldCBub193cml0ZV9zYW1lCgpVQVMgZG9lcyBub3Qg
c2hhcmUgdGhlIHBlc3NpbWlzdGljIGFzc3VtcHRpb24gc3RvcmFnZQppcyBtYWtpbmcgdGhhdCBk
ZXZpY2VzIGNhbm5vdCBkZWFsIHdpdGggV1JJVEVfU0FNRS4KQSBmZXcgZGV2aWNlcyBzdXBwb3J0
ZWQgYnkgVUFTLCBhcmUgcmVwb3J0ZWQgdG8gbm90CmRlYWwgd2VsbCB3aXRoIFdSSVRFX1NBTUUu
IFRob3NlIG5lZWQgYSBxdWlyay4KClNpZ25lZC1vZmYtYnk6IE9saXZlciBOZXVrdW0gPG9uZXVr
dW1Ac3VzZS5jb20+Ci0tLQogZHJpdmVycy91c2Ivc3RvcmFnZS91YXMuYyB8IDMgKysrCiBkcml2
ZXJzL3VzYi9zdG9yYWdlL3VzYi5jIHwgMyArKysKIGluY2x1ZGUvbGludXgvdXNiX3VzdWFsLmgg
fCAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL3N0b3JhZ2UvdWFzLmMgYi9kcml2ZXJzL3VzYi9zdG9yYWdlL3Vhcy5jCmluZGV4
IGM4YTU3NzMwOWU4Zi4uMWUxZGFhM2RhNGI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9zdG9y
YWdlL3Vhcy5jCisrKyBiL2RyaXZlcnMvdXNiL3N0b3JhZ2UvdWFzLmMKQEAgLTg3NCw2ICs4NzQs
OSBAQCBzdGF0aWMgaW50IHVhc19zbGF2ZV9jb25maWd1cmUoc3RydWN0IHNjc2lfZGV2aWNlICpz
ZGV2KQogCWlmIChkZXZpbmZvLT5mbGFncyAmIFVTX0ZMX05PX1JFQURfQ0FQQUNJVFlfMTYpCiAJ
CXNkZXYtPm5vX3JlYWRfY2FwYWNpdHlfMTYgPSAxOwogCisJLyogU29tZSBkaXNrcyBjYW5ub3Qg
aGFuZGxlIFdSSVRFX1NBTUUgKi8KKwlpZiAoZGV2aW5mby0+ZmxhZ3MgJiBVU19GTF9OT19TQU1F
KQorCQlzZGV2LT5ub193cml0ZV9zYW1lID0gMTsKIAkvKgogCSAqIFNvbWUgZGlza3MgcmV0dXJu
IHRoZSB0b3RhbCBudW1iZXIgb2YgYmxvY2tzIGluIHJlc3BvbnNlCiAJICogdG8gUkVBRCBDQVBB
Q0lUWSByYXRoZXIgdGhhbiB0aGUgaGlnaGVzdCBibG9jayBudW1iZXIuCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3VzYi9zdG9yYWdlL3VzYi5jIGIvZHJpdmVycy91c2Ivc3RvcmFnZS91c2IuYwppbmRl
eCBjMmVmMzY3Y2YyNTcuLjA4YjQ2OTUxMTA0MyAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2Ivc3Rv
cmFnZS91c2IuYworKysgYi9kcml2ZXJzL3VzYi9zdG9yYWdlL3VzYi5jCkBAIC01NDEsNiArNTQx
LDkgQEAgdm9pZCB1c2Jfc3Rvcl9hZGp1c3RfcXVpcmtzKHN0cnVjdCB1c2JfZGV2aWNlICp1ZGV2
LCB1bnNpZ25lZCBsb25nICpmZmxhZ3MpCiAJCWNhc2UgJ2onOgogCQkJZiB8PSBVU19GTF9OT19S
RVBPUlRfTFVOUzsKIAkJCWJyZWFrOworCQljYXNlICdrJzoKKwkJCWYgfD0gVVNfRkxfTk9fU0FN
RTsKKwkJCWJyZWFrOwogCQljYXNlICdsJzoKIAkJCWYgfD0gVVNfRkxfTk9UX0xPQ0tBQkxFOwog
CQkJYnJlYWs7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3VzYl91c3VhbC5oIGIvaW5jbHVk
ZS9saW51eC91c2JfdXN1YWwuaAppbmRleCA0YTE5YWMzZjI0ZDAuLjZiMDNmZGQ2OWQyNyAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9saW51eC91c2JfdXN1YWwuaAorKysgYi9pbmNsdWRlL2xpbnV4L3Vz
Yl91c3VhbC5oCkBAIC04NCw2ICs4NCw4IEBACiAJCS8qIENhbm5vdCBoYW5kbGUgUkVQT1JUX0xV
TlMgKi8JCQlcCiAJVVNfRkxBRyhBTFdBWVNfU1lOQywgMHgyMDAwMDAwMCkJCQlcCiAJCS8qIGxp
ZXMgYWJvdXQgY2FjaGluZywgc28gYWx3YXlzIHN5bmMgKi8JXAorCVVTX0ZMQUcoTk9fU0FNRSwg
MHg0MDAwMDAwMCkJCQkJXAorCQkvKiBDYW5ub3QgaGFuZGxlIFdSSVRFX1NBTUUgKi8JCQlcCiAK
ICNkZWZpbmUgVVNfRkxBRyhuYW1lLCB2YWx1ZSkJVVNfRkxfIyNuYW1lID0gdmFsdWUgLAogZW51
bSB7IFVTX0RPX0FMTF9GTEFHUyB9OwotLSAKMi4yNi4yCgo=


--=-FwkElb1SOxV28Tb8D3P4--


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85AE424ED6
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 14:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbfEUMSE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 08:18:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:46306 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726344AbfEUMSE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 May 2019 08:18:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 2BFF9ABD4;
        Tue, 21 May 2019 12:18:03 +0000 (UTC)
Message-ID: <1558440305.12672.18.camel@suse.com>
Subject: Re: JMicron JMS578 USB-to-SATA HDD enclosure not working
From:   Oliver Neukum <oneukum@suse.com>
To:     Guido Trentalancia <guido@trentalancia.com>,
        linux-usb@vger.kernel.org
Date:   Tue, 21 May 2019 14:05:05 +0200
In-Reply-To: <1558287345.31240.3.camel@trentalancia.com>
References: <1558121554.3771.12.camel@trentalancia.com>
         <1558182664.16275.8.camel@trentalancia.com>
         <1558287345.31240.3.camel@trentalancia.com>
Content-Type: multipart/mixed; boundary="=-w9BTTORjnk87O9fVSaR7"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-w9BTTORjnk87O9fVSaR7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On So, 2019-05-19 at 19:35 +0200, Guido Trentalancia wrote:
> Thanks to the new firmware and its more meaningful Sense Key, I finally
> realized that the hard-drive was simply "locked" as in the BIOS Hard-
> Disk Password Lock feature.
> 
> Therefore this is not a bug, the UAS driver is working fine with the
> HDD enclosure and the issue was simply a matter of unlocking the drive
> in the BIOS before connecting it to the JMicron JMS578 enclosure.

Hi,

this is an unusual report. It leaves a question open. We need to know
what this error will do during operation of the system. It makes me
wonder about power management operations.

Could you test S3 or S4 with your drive in the locked state?
If there is an error, could you test the attached patch?

	Regards
		Oliver

--=-w9BTTORjnk87O9fVSaR7
Content-Disposition: attachment;
	filename*0=0001-scsi-ignore-a-failure-to-synchronize-cache-due-to-la.pat;
	filename*1=ch
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0001-scsi-ignore-a-failure-to-synchronize-cache-due-to-la.patch";
	charset="UTF-8"

RnJvbSA0OTlkNjAwMTgzMjZjN2U4Yjc5MjJiMDg4N2NmZDk0NTZlNzY1YzQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBUdWUsIDIxIE1heSAyMDE5IDEzOjQ5OjM0ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gc2NzaTog
aWdub3JlIGEgZmFpbHVyZSB0byBzeW5jaHJvbml6ZSBjYWNoZSBkdWUgdG8gbGFjayBvZgogYXV0
aG9yaXphdGlvbgoKSSd2ZSBnb3QgYSByZXBvcnQgYWJvdXQgYSBVQVMgZHJpdmUgZW5jbG9zdXJl
IHJlcG9ydGluZyBiYWNrClNlbnNlOiBMb2dpY2FsIHVuaXQgYWNjZXNzIG5vdCBhdXRob3JpemVk
CmlmIHRoZSBkcml2ZSBpdCBob2xkcyBpcyBwYXNzd29yZCBwcm90ZWN0ZWQuIFdoaWxlIHRoZSBk
cml2ZQppcyBvYnZpb3VzbHkgdW51c2FibGUgaW4gdGhhdCBzdGF0ZSBhcyBhIG1hc3Mgc3RvcmFn
ZSBkZXZpY2UsCml0IHN0aWxsIGV4aXN0cyBhcyBhIHNkIGRldmljZSBhbmQgd2hlbiB0aGUgc3lz
dGVtIGlzIGFza2VkCnRvIHBlcmZvcm0gYSBzdXNwZW5kIG9mIHRoZSBkcml2ZSwgaXQgd2lsbCBi
ZSBzZW50IGEKU1lOQ0hST05JWkUgQ0FDSEUuIElmIHRoYXQgZmFpbHMgZHVlIHRvIHBhc3N3b3Jk
IHByb3RlY3Rpb24sCnRoZSBlcnJvciBtdXN0IGJlIGlnbm9yZWQuCgpTaWduZWQtb2ZmLWJ5OiBP
bGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvc2NzaS9zZC5jIHwg
MyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3Njc2kvc2QuYyBiL2RyaXZlcnMvc2NzaS9zZC5jCmluZGV4IGVi
YzgwMzU0NzE0Yy4uMmE5YTYwMzkzZjUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Njc2kvc2QuYwor
KysgYi9kcml2ZXJzL3Njc2kvc2QuYwpAQCAtMTY1Myw3ICsxNjUzLDggQEAgc3RhdGljIGludCBz
ZF9zeW5jX2NhY2hlKHN0cnVjdCBzY3NpX2Rpc2sgKnNka3AsIHN0cnVjdCBzY3NpX3NlbnNlX2hk
ciAqc3NoZHIpCiAJCS8qIHdlIG5lZWQgdG8gZXZhbHVhdGUgdGhlIGVycm9yIHJldHVybiAgKi8K
IAkJaWYgKHNjc2lfc2Vuc2VfdmFsaWQoc3NoZHIpICYmCiAJCQkoc3NoZHItPmFzYyA9PSAweDNh
IHx8CS8qIG1lZGl1bSBub3QgcHJlc2VudCAqLwotCQkJIHNzaGRyLT5hc2MgPT0gMHgyMCkpCS8q
IGludmFsaWQgY29tbWFuZCAqLworCQkJIHNzaGRyLT5hc2MgPT0gMHgyMCB8fAkvKiBpbnZhbGlk
IGNvbW1hbmQgKi8KKwkJCSAoc3NoZHItPmFzYyA9PSAweDc0ICYmIHNzaGRyLT5hc2NxID09IDB4
NzEpKSkJLyogZHJpdmUgaXMgcGFzc3dvcmQgbG9ja2VkICovIAogCQkJCS8qIHRoaXMgaXMgbm8g
ZXJyb3IgaGVyZSAqLwogCQkJCXJldHVybiAwOwogCi0tIAoyLjE2LjQKCg==


--=-w9BTTORjnk87O9fVSaR7--


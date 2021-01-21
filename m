Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBFAB2FEEDA
	for <lists+linux-usb@lfdr.de>; Thu, 21 Jan 2021 16:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733029AbhAUPbr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jan 2021 10:31:47 -0500
Received: from mx2.suse.de ([195.135.220.15]:49858 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733008AbhAUPbl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Jan 2021 10:31:41 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1611243047; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type;
        bh=j2qtzAuvduKZjvG5q6dUdqvbwQC8zhmdBkegcyXaqxY=;
        b=vQXOjO5SNBRtgT0bUXXVjrMduwdAUDv5wY0Qgk0gJ1dxf2Yq1cTKt22My6GU6uKgr/sUhr
        kd2ciJiAUhJCCTefFiLojrIb52jegnbkuThbiS2vVjWeyIVioYS9HvmZhgrMakUlpPs9g+
        2PmmbFQVnATCiRSkNtE1/ta3mfW9DEA=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 548A7B1D5;
        Thu, 21 Jan 2021 15:30:47 +0000 (UTC)
Message-ID: <3dfe07c7ad08d4dfd7eac7bd54e6b821319abe90.camel@suse.com>
Subject: circular submissions in cdc-wdm and how to break them on disconnect
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     linux-usb@vger.kernel.org
Date:   Thu, 21 Jan 2021 16:30:45 +0100
Content-Type: multipart/mixed; boundary="=-3L4MppYcA33PZcL7G3sw"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-3L4MppYcA33PZcL7G3sw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

you have moved kill_urbs() below

        cancel_work_sync(&desc->rxwork);
        cancel_work_sync(&desc->service_outs_intr);

to close a race, as

rv = usb_submit_urb(desc->response, GFP_KERNEL);

in service_outstanding_interrupt() would submit the response URB,
right? Unfortunately we have in wdm_in_callback() the following code path

        if (desc->rerr) {
                /*
                 * Since there was an error, userspace may decide to not read
                 * any data after poll'ing.
                 * We should respond to further attempts from the device to send
                 * data, so that we can get unstuck.
                 */
                schedule_work(&desc->service_outs_intr);

It looks to me like we have a circular dependency here and this needs some
change to break. What do you think about the attached patch?

	Regards
		Oliver



--=-3L4MppYcA33PZcL7G3sw
Content-Disposition: attachment;
	filename*0=0001-cdc-wdm-support-for-poisoning-and-unpoisoning-the-UR.pat;
	filename*1=ch
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0001-cdc-wdm-support-for-poisoning-and-unpoisoning-the-UR.patch";
	charset="UTF-8"

RnJvbSBlZmRkNTJiNjdmMjRlNGZhMjU1MmY4Y2MyY2JlZGI3MTE4ZjcxMjkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBNb24sIDQgSmFuIDIwMjEgMTc6MjY6MzMgKzAxMDAKU3ViamVjdDogW1BBVENIXSBjZGMtd2Rt
OiBzdXBwb3J0IGZvciBwb2lzb25pbmcgYW5kIHVucG9pc29uaW5nIHRoZSBVUkJzCgpXZSBoYXZl
IGEgY3ljbGUgb2YgY2FsbGJhY2tzIHNjaGVkdWxpbmcgd29ya3Mgd2hpY2ggc3VibWl0ClVSQnMu
IFRoaXMgbmVlZHMgdG8gYmUgYnJva2VuLgoKU2lnbmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1bSA8
b25ldWt1bUBzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL3VzYi9jbGFzcy9jZGMtd2RtLmMgfCAzMCAr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2NsYXNzL2Nk
Yy13ZG0uYyBiL2RyaXZlcnMvdXNiL2NsYXNzL2NkYy13ZG0uYwppbmRleCA1MDhiMWMzZjhiNzMu
LmQxZTRhNzM3OWJlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvY2xhc3MvY2RjLXdkbS5jCisr
KyBiL2RyaXZlcnMvdXNiL2NsYXNzL2NkYy13ZG0uYwpAQCAtMzIxLDEyICszMjEsMjMgQEAgc3Rh
dGljIHZvaWQgd2RtX2ludF9jYWxsYmFjayhzdHJ1Y3QgdXJiICp1cmIpCiAKIH0KIAotc3RhdGlj
IHZvaWQga2lsbF91cmJzKHN0cnVjdCB3ZG1fZGV2aWNlICpkZXNjKQorc3RhdGljIHZvaWQgcG9p
c29uX3VyYnMoc3RydWN0IHdkbV9kZXZpY2UgKmRlc2MpCiB7CiAJLyogdGhlIG9yZGVyIGhlcmUg
aXMgZXNzZW50aWFsICovCi0JdXNiX2tpbGxfdXJiKGRlc2MtPmNvbW1hbmQpOwotCXVzYl9raWxs
X3VyYihkZXNjLT52YWxpZGl0eSk7Ci0JdXNiX2tpbGxfdXJiKGRlc2MtPnJlc3BvbnNlKTsKKwl1
c2JfcG9pc29uX3VyYihkZXNjLT5jb21tYW5kKTsKKwl1c2JfcG9pc29uX3VyYihkZXNjLT52YWxp
ZGl0eSk7CisJdXNiX3BvaXNvbl91cmIoZGVzYy0+cmVzcG9uc2UpOworfQorCitzdGF0aWMgdm9p
ZCB1bnBvaXNvbl91cmJzKHN0cnVjdCB3ZG1fZGV2aWNlICpkZXNjKQoreworCS8qCisJICogIHRo
ZSBvcmRlciBoZXJlIGlzIG5vdCBlc3NlbnRpYWwKKwkgKiAgaXQgaXMgc3ltbWV0cmljYWwganVz
dCB0byBiZSBuaWNlCisJICovCisJdXNiX3VucG9pc29uX3VyYihkZXNjLT5yZXNwb25zZSk7CisJ
dXNiX3VucG9pc29uX3VyYihkZXNjLT52YWxpZGl0eSk7CisJdXNiX3VucG9pc29uX3VyYihkZXNj
LT5jb21tYW5kKTsKIH0KIAogc3RhdGljIHZvaWQgZnJlZV91cmJzKHN0cnVjdCB3ZG1fZGV2aWNl
ICpkZXNjKQpAQCAtNzQxLDExICs3NTIsMTIgQEAgc3RhdGljIGludCB3ZG1fcmVsZWFzZShzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlsZSkKIAlpZiAoIWRlc2MtPmNvdW50KSB7
CiAJCWlmICghdGVzdF9iaXQoV0RNX0RJU0NPTk5FQ1RJTkcsICZkZXNjLT5mbGFncykpIHsKIAkJ
CWRldl9kYmcoJmRlc2MtPmludGYtPmRldiwgIndkbV9yZWxlYXNlOiBjbGVhbnVwXG4iKTsKLQkJ
CWtpbGxfdXJicyhkZXNjKTsKKwkJCXBvaXNvbl91cmJzKGRlc2MpOwogCQkJc3Bpbl9sb2NrX2ly
cSgmZGVzYy0+aXVzcGluKTsKIAkJCWRlc2MtPnJlc3BfY291bnQgPSAwOwogCQkJc3Bpbl91bmxv
Y2tfaXJxKCZkZXNjLT5pdXNwaW4pOwogCQkJZGVzYy0+bWFuYWdlX3Bvd2VyKGRlc2MtPmludGYs
IDApOworCQkJdW5wb2lzb25fdXJicyhkZXNjKTsKIAkJfSBlbHNlIHsKIAkJCS8qIG11c3QgYXZv
aWQgZGV2X3ByaW50ayBoZXJlIGFzIGRlc2MtPmludGYgaXMgaW52YWxpZCAqLwogCQkJcHJfZGVi
dWcoS0JVSUxEX01PRE5BTUUgIiAlczogZGV2aWNlIGdvbmUgLSBjbGVhbmluZyB1cFxuIiwgX19m
dW5jX18pOwpAQCAtMTAzNyw5ICsxMDQ5LDkgQEAgc3RhdGljIHZvaWQgd2RtX2Rpc2Nvbm5lY3Qo
c3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYpCiAJd2FrZV91cF9hbGwoJmRlc2MtPndhaXQpOwog
CW11dGV4X2xvY2soJmRlc2MtPnJsb2NrKTsKIAltdXRleF9sb2NrKCZkZXNjLT53bG9jayk7CisJ
cG9pc29uX3VyYnMoZGVzYyk7CiAJY2FuY2VsX3dvcmtfc3luYygmZGVzYy0+cnh3b3JrKTsKIAlj
YW5jZWxfd29ya19zeW5jKCZkZXNjLT5zZXJ2aWNlX291dHNfaW50cik7Ci0Ja2lsbF91cmJzKGRl
c2MpOwogCW11dGV4X3VubG9jaygmZGVzYy0+d2xvY2spOwogCW11dGV4X3VubG9jaygmZGVzYy0+
cmxvY2spOwogCkBAIC0xMDgwLDkgKzEwOTIsMTAgQEAgc3RhdGljIGludCB3ZG1fc3VzcGVuZChz
dHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwgcG1fbWVzc2FnZV90IG1lc3NhZ2UpCiAJCXNldF9i
aXQoV0RNX1NVU1BFTkRJTkcsICZkZXNjLT5mbGFncyk7CiAJCXNwaW5fdW5sb2NrX2lycSgmZGVz
Yy0+aXVzcGluKTsKIAkJLyogY2FsbGJhY2sgc3VibWl0cyB3b3JrIC0gb3JkZXIgaXMgZXNzZW50
aWFsICovCi0JCWtpbGxfdXJicyhkZXNjKTsKKwkJcG9pc29uX3VyYnMoZGVzYyk7CiAJCWNhbmNl
bF93b3JrX3N5bmMoJmRlc2MtPnJ4d29yayk7CiAJCWNhbmNlbF93b3JrX3N5bmMoJmRlc2MtPnNl
cnZpY2Vfb3V0c19pbnRyKTsKKwkJdW5wb2lzb25fdXJicyhkZXNjKTsKIAl9CiAJaWYgKCFQTVNH
X0lTX0FVVE8obWVzc2FnZSkpIHsKIAkJbXV0ZXhfdW5sb2NrKCZkZXNjLT53bG9jayk7CkBAIC0x
MTQwLDcgKzExNTMsNyBAQCBzdGF0aWMgaW50IHdkbV9wcmVfcmVzZXQoc3RydWN0IHVzYl9pbnRl
cmZhY2UgKmludGYpCiAJd2FrZV91cF9hbGwoJmRlc2MtPndhaXQpOwogCW11dGV4X2xvY2soJmRl
c2MtPnJsb2NrKTsKIAltdXRleF9sb2NrKCZkZXNjLT53bG9jayk7Ci0Ja2lsbF91cmJzKGRlc2Mp
OworCXBvaXNvbl91cmJzKGRlc2MpOwogCWNhbmNlbF93b3JrX3N5bmMoJmRlc2MtPnJ4d29yayk7
CiAJY2FuY2VsX3dvcmtfc3luYygmZGVzYy0+c2VydmljZV9vdXRzX2ludHIpOwogCXJldHVybiAw
OwpAQCAtMTE1MSw2ICsxMTY0LDcgQEAgc3RhdGljIGludCB3ZG1fcG9zdF9yZXNldChzdHJ1Y3Qg
dXNiX2ludGVyZmFjZSAqaW50ZikKIAlzdHJ1Y3Qgd2RtX2RldmljZSAqZGVzYyA9IHdkbV9maW5k
X2RldmljZShpbnRmKTsKIAlpbnQgcnY7CiAKKwl1bnBvaXNvbl91cmJzKGRlc2MpOwogCWNsZWFy
X2JpdChXRE1fT1ZFUkZMT1csICZkZXNjLT5mbGFncyk7CiAJY2xlYXJfYml0KFdETV9SRVNFVFRJ
TkcsICZkZXNjLT5mbGFncyk7CiAJcnYgPSByZWNvdmVyX2Zyb21fdXJiX2xvc3MoZGVzYyk7Ci0t
IAoyLjI2LjIKCg==


--=-3L4MppYcA33PZcL7G3sw--


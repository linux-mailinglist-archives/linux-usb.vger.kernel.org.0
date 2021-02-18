Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F74031EC3F
	for <lists+linux-usb@lfdr.de>; Thu, 18 Feb 2021 17:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233573AbhBRQ3n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Feb 2021 11:29:43 -0500
Received: from mx2.suse.de ([195.135.220.15]:37382 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232931AbhBRM5J (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Feb 2021 07:57:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1613652928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=olSss9fcLE7vBzz4gSSM9hLtKVs1SB0d95iAANnvfx8=;
        b=Y2lU3Lmm8mwXHdOS2pVtzpC/6v/pxxWq4FomqDXi1sgXoRUwvfAlZXwMomrA3cZH2wjcA9
        h4bWDpyzQxVzl6si0nzySDCqG/ozh7KOipg+36Filrxe0vmxAuAl2BgbTqxp2r8ZQh7BD+
        JgZfwlVBRv7m5gtnLwgTSHrbptnJNK4=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E3593AF2C;
        Thu, 18 Feb 2021 12:55:27 +0000 (UTC)
Message-ID: <2db36d52015b644cc1891fcffc87ef09c2b728b7.camel@suse.com>
Subject: Re: circular submissions in cdc-wdm and how to break them on
 disconnect
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     linux-usb@vger.kernel.org
Date:   Thu, 18 Feb 2021 13:55:13 +0100
In-Reply-To: <fc789f07-9b29-a86b-5527-ac6f5b3ef2dd@i-love.sakura.ne.jp>
References: <3dfe07c7ad08d4dfd7eac7bd54e6b821319abe90.camel@suse.com>
         <fc789f07-9b29-a86b-5527-ac6f5b3ef2dd@i-love.sakura.ne.jp>
Content-Type: multipart/mixed; boundary="=-hs5nKjHm7ZncAFldQN0n"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-hs5nKjHm7ZncAFldQN0n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Samstag, den 23.01.2021, 11:57 +0900 schrieb Tetsuo Handa:
> On 2021/01/22 0:30, Oliver Neukum wrote:

Hi,

> Right. Shouldn't remaining
> 
>   kill_urbs(desc);
>   cancel_work_sync(&desc->rxwork);
>   cancel_work_sync(&desc->service_outs_intr);
> 
> sequence in wdm_suspend() and wdm_pre_reset() be updated as well?

Yes, they should.

> >        Unfortunately we have in wdm_in_callback() the following code path
> > 
> >         if (desc->rerr) {
> >                 /*
> >                  * Since there was an error, userspace may decide to not read
> >                  * any data after poll'ing.
> >                  * We should respond to further attempts from the device to send
> >                  * data, so that we can get unstuck.
> >                  */
> >                 schedule_work(&desc->service_outs_intr);
> > 
> > It looks to me like we have a circular dependency here and this needs some
> > change to break. What do you think about the attached patch?
> 
> I don't know how poisoning works. But why can't we simply use test_bit() on

It makes subsequent usb_submit_urb() fail.

> WDM_SUSPENDING/WDM_RESETTING/WDM_DISCONNECTING flags, for schedule_work() in
> wdm_in_callback() is called with desc->iuspin (which serializes setting of
> these flags) held.

In theory this could be done, yet that would take three additional
tests as opposed to the test for poisoning that usbcore does anyway.

> By the way, since someone might interpret "broken" as "out of order / not working",
> I expect not using "This needs to be broken." in the commit message. There would be
> some better idiom.

Right. I changed the message.

Could you test whether the attached patch fixes your issue?

	Regards
		Oliver


--=-hs5nKjHm7ZncAFldQN0n
Content-Disposition: attachment;
	filename*0=0001-cdc-wdm-untangle-a-circular-dependency-between-callb.pat;
	filename*1=ch
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0001-cdc-wdm-untangle-a-circular-dependency-between-callb.patch";
	charset="UTF-8"

RnJvbSAzMDcwOTdlODA2NTdjYTQ0YWM5OWRhOGVmYzgzOTcwNzBiMWFmZjNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBUaHUsIDE4IEZlYiAyMDIxIDEzOjQyOjQwICswMTAwClN1YmplY3Q6IFtQQVRDSCAxLzJdIGNk
Yy13ZG06IHVudGFuZ2xlIGEgY2lyY3VsYXIgZGVwZW5kZW5jeSBiZXR3ZWVuIGNhbGxiYWNrCiBh
bmQgc29mdGludAoKV2UgaGF2ZSBhIGN5Y2xlIG9mIGNhbGxiYWNrcyBzY2hlZHVsaW5nIHdvcmtz
IHdoaWNoIHN1Ym1pdApVUkJzIHdpdGggdGhvcyBjYWxsYmFja3MuIFRoaXMgbmVlZHMgdG8gYmUg
YmxvY2tlZCwgc3RvcHBlZAphbmQgdW5ibG9ja2VkIHRvIHVudGFuZ2xlIHRoZSBjaXJjbGUuLgoK
U2lnbmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1bSA8b25ldWt1bUBzdXNlLmNvbT4KLS0tCiBkcml2
ZXJzL3VzYi9jbGFzcy9jZGMtd2RtLmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2NsYXNzL2NkYy13ZG0uYyBiL2RyaXZlcnMvdXNiL2NsYXNz
L2NkYy13ZG0uYwppbmRleCA1MDhiMWMzZjhiNzMuLmQxZTRhNzM3OWJlYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy91c2IvY2xhc3MvY2RjLXdkbS5jCisrKyBiL2RyaXZlcnMvdXNiL2NsYXNzL2NkYy13
ZG0uYwpAQCAtMzIxLDEyICszMjEsMjMgQEAgc3RhdGljIHZvaWQgd2RtX2ludF9jYWxsYmFjayhz
dHJ1Y3QgdXJiICp1cmIpCiAKIH0KIAotc3RhdGljIHZvaWQga2lsbF91cmJzKHN0cnVjdCB3ZG1f
ZGV2aWNlICpkZXNjKQorc3RhdGljIHZvaWQgcG9pc29uX3VyYnMoc3RydWN0IHdkbV9kZXZpY2Ug
KmRlc2MpCiB7CiAJLyogdGhlIG9yZGVyIGhlcmUgaXMgZXNzZW50aWFsICovCi0JdXNiX2tpbGxf
dXJiKGRlc2MtPmNvbW1hbmQpOwotCXVzYl9raWxsX3VyYihkZXNjLT52YWxpZGl0eSk7Ci0JdXNi
X2tpbGxfdXJiKGRlc2MtPnJlc3BvbnNlKTsKKwl1c2JfcG9pc29uX3VyYihkZXNjLT5jb21tYW5k
KTsKKwl1c2JfcG9pc29uX3VyYihkZXNjLT52YWxpZGl0eSk7CisJdXNiX3BvaXNvbl91cmIoZGVz
Yy0+cmVzcG9uc2UpOworfQorCitzdGF0aWMgdm9pZCB1bnBvaXNvbl91cmJzKHN0cnVjdCB3ZG1f
ZGV2aWNlICpkZXNjKQoreworCS8qCisJICogIHRoZSBvcmRlciBoZXJlIGlzIG5vdCBlc3NlbnRp
YWwKKwkgKiAgaXQgaXMgc3ltbWV0cmljYWwganVzdCB0byBiZSBuaWNlCisJICovCisJdXNiX3Vu
cG9pc29uX3VyYihkZXNjLT5yZXNwb25zZSk7CisJdXNiX3VucG9pc29uX3VyYihkZXNjLT52YWxp
ZGl0eSk7CisJdXNiX3VucG9pc29uX3VyYihkZXNjLT5jb21tYW5kKTsKIH0KIAogc3RhdGljIHZv
aWQgZnJlZV91cmJzKHN0cnVjdCB3ZG1fZGV2aWNlICpkZXNjKQpAQCAtNzQxLDExICs3NTIsMTIg
QEAgc3RhdGljIGludCB3ZG1fcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmls
ZSAqZmlsZSkKIAlpZiAoIWRlc2MtPmNvdW50KSB7CiAJCWlmICghdGVzdF9iaXQoV0RNX0RJU0NP
Tk5FQ1RJTkcsICZkZXNjLT5mbGFncykpIHsKIAkJCWRldl9kYmcoJmRlc2MtPmludGYtPmRldiwg
IndkbV9yZWxlYXNlOiBjbGVhbnVwXG4iKTsKLQkJCWtpbGxfdXJicyhkZXNjKTsKKwkJCXBvaXNv
bl91cmJzKGRlc2MpOwogCQkJc3Bpbl9sb2NrX2lycSgmZGVzYy0+aXVzcGluKTsKIAkJCWRlc2Mt
PnJlc3BfY291bnQgPSAwOwogCQkJc3Bpbl91bmxvY2tfaXJxKCZkZXNjLT5pdXNwaW4pOwogCQkJ
ZGVzYy0+bWFuYWdlX3Bvd2VyKGRlc2MtPmludGYsIDApOworCQkJdW5wb2lzb25fdXJicyhkZXNj
KTsKIAkJfSBlbHNlIHsKIAkJCS8qIG11c3QgYXZvaWQgZGV2X3ByaW50ayBoZXJlIGFzIGRlc2Mt
PmludGYgaXMgaW52YWxpZCAqLwogCQkJcHJfZGVidWcoS0JVSUxEX01PRE5BTUUgIiAlczogZGV2
aWNlIGdvbmUgLSBjbGVhbmluZyB1cFxuIiwgX19mdW5jX18pOwpAQCAtMTAzNyw5ICsxMDQ5LDkg
QEAgc3RhdGljIHZvaWQgd2RtX2Rpc2Nvbm5lY3Qoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYp
CiAJd2FrZV91cF9hbGwoJmRlc2MtPndhaXQpOwogCW11dGV4X2xvY2soJmRlc2MtPnJsb2NrKTsK
IAltdXRleF9sb2NrKCZkZXNjLT53bG9jayk7CisJcG9pc29uX3VyYnMoZGVzYyk7CiAJY2FuY2Vs
X3dvcmtfc3luYygmZGVzYy0+cnh3b3JrKTsKIAljYW5jZWxfd29ya19zeW5jKCZkZXNjLT5zZXJ2
aWNlX291dHNfaW50cik7Ci0Ja2lsbF91cmJzKGRlc2MpOwogCW11dGV4X3VubG9jaygmZGVzYy0+
d2xvY2spOwogCW11dGV4X3VubG9jaygmZGVzYy0+cmxvY2spOwogCkBAIC0xMDgwLDkgKzEwOTIs
MTAgQEAgc3RhdGljIGludCB3ZG1fc3VzcGVuZChzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50Ziwg
cG1fbWVzc2FnZV90IG1lc3NhZ2UpCiAJCXNldF9iaXQoV0RNX1NVU1BFTkRJTkcsICZkZXNjLT5m
bGFncyk7CiAJCXNwaW5fdW5sb2NrX2lycSgmZGVzYy0+aXVzcGluKTsKIAkJLyogY2FsbGJhY2sg
c3VibWl0cyB3b3JrIC0gb3JkZXIgaXMgZXNzZW50aWFsICovCi0JCWtpbGxfdXJicyhkZXNjKTsK
KwkJcG9pc29uX3VyYnMoZGVzYyk7CiAJCWNhbmNlbF93b3JrX3N5bmMoJmRlc2MtPnJ4d29yayk7
CiAJCWNhbmNlbF93b3JrX3N5bmMoJmRlc2MtPnNlcnZpY2Vfb3V0c19pbnRyKTsKKwkJdW5wb2lz
b25fdXJicyhkZXNjKTsKIAl9CiAJaWYgKCFQTVNHX0lTX0FVVE8obWVzc2FnZSkpIHsKIAkJbXV0
ZXhfdW5sb2NrKCZkZXNjLT53bG9jayk7CkBAIC0xMTQwLDcgKzExNTMsNyBAQCBzdGF0aWMgaW50
IHdkbV9wcmVfcmVzZXQoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYpCiAJd2FrZV91cF9hbGwo
JmRlc2MtPndhaXQpOwogCW11dGV4X2xvY2soJmRlc2MtPnJsb2NrKTsKIAltdXRleF9sb2NrKCZk
ZXNjLT53bG9jayk7Ci0Ja2lsbF91cmJzKGRlc2MpOworCXBvaXNvbl91cmJzKGRlc2MpOwogCWNh
bmNlbF93b3JrX3N5bmMoJmRlc2MtPnJ4d29yayk7CiAJY2FuY2VsX3dvcmtfc3luYygmZGVzYy0+
c2VydmljZV9vdXRzX2ludHIpOwogCXJldHVybiAwOwpAQCAtMTE1MSw2ICsxMTY0LDcgQEAgc3Rh
dGljIGludCB3ZG1fcG9zdF9yZXNldChzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZikKIAlzdHJ1
Y3Qgd2RtX2RldmljZSAqZGVzYyA9IHdkbV9maW5kX2RldmljZShpbnRmKTsKIAlpbnQgcnY7CiAK
Kwl1bnBvaXNvbl91cmJzKGRlc2MpOwogCWNsZWFyX2JpdChXRE1fT1ZFUkZMT1csICZkZXNjLT5m
bGFncyk7CiAJY2xlYXJfYml0KFdETV9SRVNFVFRJTkcsICZkZXNjLT5mbGFncyk7CiAJcnYgPSBy
ZWNvdmVyX2Zyb21fdXJiX2xvc3MoZGVzYyk7Ci0tIAoyLjI2LjIKCg==


--=-hs5nKjHm7ZncAFldQN0n--


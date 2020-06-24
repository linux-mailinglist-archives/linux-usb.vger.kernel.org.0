Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34A1C2072AC
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jun 2020 13:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390412AbgFXL5l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jun 2020 07:57:41 -0400
Received: from mx2.suse.de ([195.135.220.15]:47888 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388522AbgFXL5l (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Jun 2020 07:57:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C572EAF2D;
        Wed, 24 Jun 2020 11:57:38 +0000 (UTC)
Message-ID: <1592999831.28236.8.camel@suse.com>
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing
 WDM_IN_USE bit.
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Date:   Wed, 24 Jun 2020 13:57:11 +0200
In-Reply-To: <c491266c-7c13-fa9d-602e-52d147c241b6@i-love.sakura.ne.jp>
References: <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
         <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
         <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
         <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
         <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
         <20200528194057.GA21709@rowland.harvard.edu>
         <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
         <20200528205807.GB21709@rowland.harvard.edu>
         <CAAeHK+xx-uodQWBDA2pJ_Et26uBPb6J7fTwu4h6D1uUTv8t3HA@mail.gmail.com>
         <79ba410f-e0ef-2465-b94f-6b9a4a82adf5@i-love.sakura.ne.jp>
         <20200530011040.GB12419@rowland.harvard.edu>
         <c491266c-7c13-fa9d-602e-52d147c241b6@i-love.sakura.ne.jp>
Content-Type: multipart/mixed; boundary="=-/+alVMUcwyJcehcPErV6"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-/+alVMUcwyJcehcPErV6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Samstag, den 30.05.2020, 13:58 +0900 schrieb Tetsuo Handa:

Hi,

sorry for taking this long. There has been a family emergency.

> > The kernel most definitely does need to protect itself against 
> > misbehaving hardware.  Let's just leave it at that.  If you don't 
> > believe me, ask Greg KH.
> 
> I've made many locations killable (in order to reduce damage caused by OOM
> condition). But I can't make locations killable where handling SIGKILL case is
> too difficult to implement.

We can make flush interruptible. But that will not do the job. We would
get a file that cannot be closed.

> "struct file_operations"->flush() is called from filp_close() when there is
> something which has to be done before "struct file_operations"->release() is
> called.

Yes, in particular error reporting. Without flush() there is no way to
know whether the last write() has actually worked.

> As far as I read this thread, what you are trying to do sounds like allow
> "not waiting for completion of wdm_out_callback()" with only
> 's/wait_event/wait_event_intrruptible/' in wdm_flush(). Then, please do remove
> wdm_flush() call itself.

That would break error reporting. That flush() waits for IO to complete
is basically a side effect. You can know whether IO has worked after it
is finished.

> Therefore, again, please show me as a patch first.

Sure, attached. The difficulty here is that I see three possible
interacting errors, two of which are races.

	Regards
		Oliver

--=-/+alVMUcwyJcehcPErV6
Content-Disposition: attachment; filename="0001-CDC-WDM-fix-hangs-in-flush.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="0001-CDC-WDM-fix-hangs-in-flush.patch";
	charset="UTF-8"

RnJvbSAyN2NkMmUyNWIzN2FmOTczYjYxYjc3MjE3ZmEyZGFkODIyODg5ZmY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBXZWQsIDI0IEp1biAyMDIwIDEwOjUyOjAzICswMjAwClN1YmplY3Q6IFtQQVRDSF0gQ0RDLVdE
TTogZml4IGhhbmdzIGluIGZsdXNoKCkKCldoZW4gZmx1c2hpbmcgYSB0YXNrIG5lZWRzIHRvIHdh
aXQgYSBib3VuZGVkIHRpbWUsIGFzIGEgaGFyZHdhcmUgZmFpbHVyZQpjb3VsZCBtZWFuIGV0ZXJu
YWwgc2xlZXAuIFNvIGFuIGFyYml0cmFyeSB0aW1lb3V0IGlzIGludHJvZHVjZWQuClNpbXBseSBt
YWtpbmcgdGhlIHN5c2NhbGwgaW50ZXJydXB0aWJsZSB3aWxsIG5vdCBkbyB0aGUgam9iLAphcyB3
aGlsZSB0aGUgc3lzY2FsbCB3b3VsZCBub3QgaGFuZywgdGhlIGZkIHdvdWxkIGJlIHVuY2xvc2Fi
bGUuCgpJbiBhZGRpdGlvbiBhIGZsdXNoKCkgYW5kIGEgd3JpdGUoKSBtYXkgYmUgd2FpdGluZyBm
b3IgdGhlIHNhbWUKSU8gdG8gY29tcGxldGUuIEhlbmNlIGNvbXBsZXRpb24gb2Ygb3V0cHV0IG11
c3QgdXNlIHdha2VfdXBfYWxsKCksCmV2ZW4gaW4gZXJyb3IgaGFuZGxpbmcuCgpSZXBvcnRlZC1i
eTogVGV0c3VvIEhhbmRhIDxwZW5ndWluLWtlcm5lbEBJLWxvdmUuU0FLVVJBLm5lLmpwPgpTaWdu
ZWQtb2ZmLWJ5OiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgotLS0KIGRyaXZlcnMv
dXNiL2NsYXNzL2NkYy13ZG0uYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvY2xhc3MvY2RjLXdkbS5jIGIvZHJpdmVycy91c2IvY2xhc3MvY2RjLXdkbS5j
CmluZGV4IGUzZGI2ZmJlYWRlZi4uZWM1NDEyNzczYzU3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3Vz
Yi9jbGFzcy9jZGMtd2RtLmMKKysrIGIvZHJpdmVycy91c2IvY2xhc3MvY2RjLXdkbS5jCkBAIC01
OCw2ICs1OCw5IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUgKHVzYiwgd2RtX2lkcyk7CiAKICNkZWZp
bmUgV0RNX01BWAkJCTE2CiAKKy8qIGZsdXNoKCkgbmVlZHMgdG8gYmUgdW5pbnRlcnJ1cHRpYmxl
LCBidXQgd2UgY2Fubm90IHdhaXQgZm9yZXZlciAqLworI2RlZmluZSBXRE1fRkxVU0hfVElNRU9V
VAkoMzAgKiBIWikKKwogLyogQ0RDLVdNQyByMS4xIHJlcXVpcmVzIHdNYXhDb21tYW5kIHRvIGJl
ICJhdCBsZWFzdCAyNTYgZGVjaW1hbCAoMHgxMDApIiAqLwogI2RlZmluZSBXRE1fREVGQVVMVF9C
VUZTSVpFCTI1NgogCkBAIC0xNTEsNyArMTU0LDcgQEAgc3RhdGljIHZvaWQgd2RtX291dF9jYWxs
YmFjayhzdHJ1Y3QgdXJiICp1cmIpCiAJa2ZyZWUoZGVzYy0+b3V0YnVmKTsKIAlkZXNjLT5vdXRi
dWYgPSBOVUxMOwogCWNsZWFyX2JpdChXRE1fSU5fVVNFLCAmZGVzYy0+ZmxhZ3MpOwotCXdha2Vf
dXAoJmRlc2MtPndhaXQpOworCXdha2VfdXBfYWxsKCZkZXNjLT53YWl0KTsKIH0KIAogc3RhdGlj
IHZvaWQgd2RtX2luX2NhbGxiYWNrKHN0cnVjdCB1cmIgKnVyYikKQEAgLTQyNCw2ICs0MjcsNyBA
QCBzdGF0aWMgc3NpemVfdCB3ZG1fd3JpdGUKIAlpZiAocnYgPCAwKSB7CiAJCWRlc2MtPm91dGJ1
ZiA9IE5VTEw7CiAJCWNsZWFyX2JpdChXRE1fSU5fVVNFLCAmZGVzYy0+ZmxhZ3MpOworCQl3YWtl
X3VwX2FsbCgmZGVzYy0+d2FpdCk7IC8qIGZvciBmbHVzaCgpICovCiAJCWRldl9lcnIoJmRlc2Mt
PmludGYtPmRldiwgIlR4IFVSQiBlcnJvcjogJWRcbiIsIHJ2KTsKIAkJcnYgPSB1c2JfdHJhbnNs
YXRlX2Vycm9ycyhydik7CiAJCWdvdG8gb3V0X2ZyZWVfbWVtX3BtOwpAQCAtNTg2LDggKzU5MCw5
IEBAIHN0YXRpYyBzc2l6ZV90IHdkbV9yZWFkCiBzdGF0aWMgaW50IHdkbV9mbHVzaChzdHJ1Y3Qg
ZmlsZSAqZmlsZSwgZmxfb3duZXJfdCBpZCkKIHsKIAlzdHJ1Y3Qgd2RtX2RldmljZSAqZGVzYyA9
IGZpbGUtPnByaXZhdGVfZGF0YTsKKwlpbnQgcnY7CiAKLQl3YWl0X2V2ZW50KGRlc2MtPndhaXQs
CisJcnYgPSB3YWl0X2V2ZW50X2ludGVycnVwdGlibGVfdGltZW91dChkZXNjLT53YWl0LAogCQkJ
LyoKIAkJCSAqIG5lZWRzIGJvdGggZmxhZ3MuIFdlIGNhbm5vdCBkbyB3aXRoIG9uZQogCQkJICog
YmVjYXVzZSByZXNldHRpbmcgaXQgd291bGQgY2F1c2UgYSByYWNlCkBAIC01OTUsMTEgKzYwMCwx
NiBAQCBzdGF0aWMgaW50IHdkbV9mbHVzaChzdHJ1Y3QgZmlsZSAqZmlsZSwgZmxfb3duZXJfdCBp
ZCkKIAkJCSAqIGEgZGlzY29ubmVjdAogCQkJICovCiAJCQkhdGVzdF9iaXQoV0RNX0lOX1VTRSwg
JmRlc2MtPmZsYWdzKSB8fAotCQkJdGVzdF9iaXQoV0RNX0RJU0NPTk5FQ1RJTkcsICZkZXNjLT5m
bGFncykpOworCQkJdGVzdF9iaXQoV0RNX0RJU0NPTk5FQ1RJTkcsICZkZXNjLT5mbGFncyksCisJ
CQlXRE1fRkxVU0hfVElNRU9VVCk7CiAKIAkvKiBjYW5ub3QgZGVyZWZlcmVuY2UgZGVzYy0+aW50
ZiBpZiBXRE1fRElTQ09OTkVDVElORyAqLwogCWlmICh0ZXN0X2JpdChXRE1fRElTQ09OTkVDVElO
RywgJmRlc2MtPmZsYWdzKSkKIAkJcmV0dXJuIC1FTk9ERVY7CisJaWYgKCFydikKKwkJcmV0dXJu
IC1FSU87CisJaWYgKHJ2IDwgMCkKKwkJcmV0dXJuIC1FSU5UUjsKIAlpZiAoZGVzYy0+d2VyciA8
IDApCiAJCWRldl9lcnIoJmRlc2MtPmludGYtPmRldiwgIkVycm9yIGluIGZsdXNoIHBhdGg6ICVk
XG4iLAogCQkJZGVzYy0+d2Vycik7CkBAIC02NTYsNiArNjY2LDE0IEBAIHN0YXRpYyBpbnQgd2Rt
X29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbGUpCiAJCWdvdG8gb3V0
OwogCX0KIAorCS8qCisJICogaW4gY2FzZSBmbHVzaCgpIGhhZCB0aW1lZCBvdXQKKwkgKi8KKwl1
c2Jfa2lsbF91cmIoZGVzYy0+Y29tbWFuZCk7CisJc3Bpbl9sb2NrX2lycSgmZGVzYy0+aXVzcGlu
KTsKKwlkZXNjLT53ZXJyID0gMDsKKwlzcGluX3VubG9ja19pcnEoJmRlc2MtPml1c3Bpbik7CisK
IAkvKiB1c2luZyB3cml0ZSBsb2NrIHRvIHByb3RlY3QgZGVzYy0+Y291bnQgKi8KIAltdXRleF9s
b2NrKCZkZXNjLT53bG9jayk7CiAJaWYgKCFkZXNjLT5jb3VudCsrKSB7Ci0tIAoyLjE2LjQKCg==


--=-/+alVMUcwyJcehcPErV6--


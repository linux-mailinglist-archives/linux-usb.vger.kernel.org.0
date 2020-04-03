Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC6E219DFA0
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2020 22:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgDCUkr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Apr 2020 16:40:47 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:41945 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727909AbgDCUkr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Apr 2020 16:40:47 -0400
Received: by mail-vs1-f44.google.com with SMTP id a63so5812737vsa.8;
        Fri, 03 Apr 2020 13:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1ZSHTEuE2TrCB0Hc3gLckkl/Eg9IsjGuQDv+RGlo1/w=;
        b=C+CEymTiNTUponn2pCwneJYUaFITPvMHm1nEKdVxJP2jAXG0YIPvbApgCBtXsH+0Bn
         048d8omQenhIyLdIph6iMDxprxF6bvbhJmIB7X5X5FF1uST4mhariHIKEt6Y2V/57UTD
         J6iwU19OPQrAtUuwsmq1kXc6bLUhVslh8uHJ0kmQaR0cp40ngUKiXED0+EB3V+rQUpCt
         dyuCot2FCKAO/+xXxvwl+a046lc3oF4xD9uPzKW6mux/1hoBm9HX6jd6ZgrMg6ZzIjCb
         j8Sw/KuwRMu/Upm+h9v8iFWHmD9li7Zla/mFiEUEXNhyLfsKmtPnS61tv6RCV3pqHZ3m
         ccVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ZSHTEuE2TrCB0Hc3gLckkl/Eg9IsjGuQDv+RGlo1/w=;
        b=R94MbBfB6qhsgC9KrO1eEiJnAUqFC58UOd6GC8p8wUZiGbx/VP9xDrhq0gkAhq+p4p
         Jg4rvJDoooHF2fQsQQ7/m5H8f/Kw5yWwz7zRTBavvQXlp8moEFtS++V2JanvsNNFivwr
         EZE8eYsmMpA4rJo+eaKx1p/6dlT3VEeXUrPyoi96S1xBbgfJq2CKo4QXX/THMXvD2uaL
         lCOKqPYIn2FuRBNkfRzJDY6/q2n90B+fcjLRc+BlfUd+cH+neRC4XIMx/nTyhSrH5leM
         Xy8AqsvoDbMFwsXfD327s3Sup+Wmw/OBiMAXKCHDZcVgiCo1sd+ikfAueiC9Q1RQlDkf
         rYGQ==
X-Gm-Message-State: AGi0PuZQbnPUdJ1dVMTQ/v4YQ4sHl7gaZx+trQEloL+Dw6OFTkIerxXK
        PVsZlQ0s2BQ6IR97okTAE0itHenfy3p9PTuvYWc=
X-Google-Smtp-Source: APiQypJmFQzqaxv4JqwPh3mMnsoWxysKOsU7abBIjTl/yTkm+hlnCxXIHoHPvfemQ0AyBxfRhn3V6ZjYAqMkAng16tw=
X-Received: by 2002:a67:c189:: with SMTP id h9mr8340051vsj.91.1585946443459;
 Fri, 03 Apr 2020 13:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006ac55b05a1c05d72@google.com>
In-Reply-To: <0000000000006ac55b05a1c05d72@google.com>
From:   Qiujun Huang <anenbupt@gmail.com>
Date:   Sat, 4 Apr 2020 04:40:30 +0800
Message-ID: <CADG63jDvVnX=_5oJSEqrsTUsCuYPj6Grz9dEFLvWpa1F=oa1Lw@mail.gmail.com>
Subject: Re: KASAN: use-after-free Write in ath9k_htc_rx_msg
To:     syzbot <syzbot+b1c61e5f11be5782f192@syzkaller.appspotmail.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        ath9k-devel@qca.qualcomm.com, davem@davemloft.net,
        kvalo@codeaurora.org, LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: multipart/mixed; boundary="000000000000657f7f05a268eed5"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--000000000000657f7f05a268eed5
Content-Type: text/plain; charset="UTF-8"

#syz test: https://github.com/google/kasan.git usb-fuzzer

--000000000000657f7f05a268eed5
Content-Type: application/octet-stream; name="ath9k_040401.patch"
Content-Disposition: attachment; filename="ath9k_040401.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k8knjzl40>
X-Attachment-Id: f_k8knjzl40

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg5ay9oaWZfdXNiLmMgYi9k
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoOWsvaGlmX3VzYi5jCmluZGV4IGRkMGMzMjM3OTM3
NS4uMDJiMmY0Y2U1ZTE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
OWsvaGlmX3VzYi5jCisrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg5ay9oaWZfdXNi
LmMKQEAgLTYxMiw2ICs2MTIsMTEgQEAgc3RhdGljIHZvaWQgYXRoOWtfaGlmX3VzYl9yeF9zdHJl
YW0oc3RydWN0IGhpZl9kZXZpY2VfdXNiICpoaWZfZGV2LAogCQkJaGlmX2Rldi0+cmVtYWluX3Nr
YiA9IG5za2I7CiAJCQlzcGluX3VubG9jaygmaGlmX2Rldi0+cnhfbG9jayk7CiAJCX0gZWxzZSB7
CisJCQlpZiAocG9vbF9pbmRleCA9PSBNQVhfUEtUX05VTV9JTl9UUkFOU0ZFUikgeworCQkJCWRl
dl9lcnIoJmhpZl9kZXYtPnVkZXYtPmRldiwKKwkJCQkJImF0aDlrX2h0Yzogb3ZlciBSWCBNQVhf
UEtUX05VTVxuIik7CisJCQkJZ290byBlcnI7CisJCQl9CiAJCQluc2tiID0gX19kZXZfYWxsb2Nf
c2tiKHBrdF9sZW4gKyAzMiwgR0ZQX0FUT01JQyk7CiAJCQlpZiAoIW5za2IpIHsKIAkJCQlkZXZf
ZXJyKCZoaWZfZGV2LT51ZGV2LT5kZXYsCkBAIC02MzgsOSArNjQzLDkgQEAgc3RhdGljIHZvaWQg
YXRoOWtfaGlmX3VzYl9yeF9zdHJlYW0oc3RydWN0IGhpZl9kZXZpY2VfdXNiICpoaWZfZGV2LAog
CiBzdGF0aWMgdm9pZCBhdGg5a19oaWZfdXNiX3J4X2NiKHN0cnVjdCB1cmIgKnVyYikKIHsKLQlz
dHJ1Y3Qgc2tfYnVmZiAqc2tiID0gKHN0cnVjdCBza19idWZmICopIHVyYi0+Y29udGV4dDsKLQlz
dHJ1Y3QgaGlmX2RldmljZV91c2IgKmhpZl9kZXYgPQotCQl1c2JfZ2V0X2ludGZkYXRhKHVzYl9p
Zm51bV90b19pZih1cmItPmRldiwgMCkpOworCXN0cnVjdCByeF9idWYgKnJ4X2J1ZiA9IChzdHJ1
Y3QgcnhfYnVmKikgdXJiLT5jb250ZXh0OworCXN0cnVjdCBza19idWZmICpza2IgPSByeF9idWYt
PnNrYjsKKwlzdHJ1Y3QgaGlmX2RldmljZV91c2IgKmhpZl9kZXYgPSByeF9idWYtPmhpZl9kZXY7
CiAJaW50IHJldDsKIAogCWlmICghc2tiKQpAQCAtNjgwLDE0ICs2ODUsMTUgQEAgc3RhdGljIHZv
aWQgYXRoOWtfaGlmX3VzYl9yeF9jYihzdHJ1Y3QgdXJiICp1cmIpCiAJcmV0dXJuOwogZnJlZToK
IAlrZnJlZV9za2Ioc2tiKTsKKwlrZnJlZShyeF9idWYpOwogfQogCiBzdGF0aWMgdm9pZCBhdGg5
a19oaWZfdXNiX3JlZ19pbl9jYihzdHJ1Y3QgdXJiICp1cmIpCiB7Ci0Jc3RydWN0IHNrX2J1ZmYg
KnNrYiA9IChzdHJ1Y3Qgc2tfYnVmZiAqKSB1cmItPmNvbnRleHQ7CisJc3RydWN0IHJ4X2J1ZiAq
cnhfYnVmID0gKHN0cnVjdCByeF9idWYqKSB1cmItPmNvbnRleHQ7CisJc3RydWN0IGhpZl9kZXZp
Y2VfdXNiICpoaWZfZGV2ID0gcnhfYnVmLT5oaWZfZGV2OworCXN0cnVjdCBza19idWZmICpza2Ig
PSByeF9idWYtPnNrYjsKIAlzdHJ1Y3Qgc2tfYnVmZiAqbnNrYjsKLQlzdHJ1Y3QgaGlmX2Rldmlj
ZV91c2IgKmhpZl9kZXYgPQotCQl1c2JfZ2V0X2ludGZkYXRhKHVzYl9pZm51bV90b19pZih1cmIt
PmRldiwgMCkpOwogCWludCByZXQ7CiAKIAlpZiAoIXNrYikKQEAgLTc0NSw2ICs3NTEsNyBAQCBz
dGF0aWMgdm9pZCBhdGg5a19oaWZfdXNiX3JlZ19pbl9jYihzdHJ1Y3QgdXJiICp1cmIpCiAJcmV0
dXJuOwogZnJlZToKIAlrZnJlZV9za2Ioc2tiKTsKKwlrZnJlZShyeF9idWYpOwogCXVyYi0+Y29u
dGV4dCA9IE5VTEw7CiB9CiAKQEAgLTgyNyw4ICs4MzQsOSBAQCBzdGF0aWMgdm9pZCBhdGg5a19o
aWZfdXNiX2RlYWxsb2NfcnhfdXJicyhzdHJ1Y3QgaGlmX2RldmljZV91c2IgKmhpZl9kZXYpCiAK
IHN0YXRpYyBpbnQgYXRoOWtfaGlmX3VzYl9hbGxvY19yeF91cmJzKHN0cnVjdCBoaWZfZGV2aWNl
X3VzYiAqaGlmX2RldikKIHsKLQlzdHJ1Y3QgdXJiICp1cmIgPSBOVUxMOworCXN0cnVjdCByeF9i
dWYgKnJ4X2J1ZiA9IE5VTEw7CiAJc3RydWN0IHNrX2J1ZmYgKnNrYiA9IE5VTEw7CisJc3RydWN0
IHVyYiAqdXJiID0gTlVMTDsKIAlpbnQgaSwgcmV0OwogCiAJaW5pdF91c2JfYW5jaG9yKCZoaWZf
ZGV2LT5yeF9zdWJtaXR0ZWQpOwpAQCAtODM2LDYgKzg0NCwxMiBAQCBzdGF0aWMgaW50IGF0aDlr
X2hpZl91c2JfYWxsb2NfcnhfdXJicyhzdHJ1Y3QgaGlmX2RldmljZV91c2IgKmhpZl9kZXYpCiAK
IAlmb3IgKGkgPSAwOyBpIDwgTUFYX1JYX1VSQl9OVU07IGkrKykgewogCisJCXJ4X2J1ZiA9IGt6
YWxsb2Moc2l6ZW9mKHN0cnVjdCByeF9idWYpLCBHRlBfS0VSTkVMKTsKKwkJaWYgKCFyeF9idWYp
IHsKKwkJCXJldCA9IC1FTk9NRU07CisJCQlnb3RvIGVycl9yeGI7CisJCX0KKwkKIAkJLyogQWxs
b2NhdGUgVVJCICovCiAJCXVyYiA9IHVzYl9hbGxvY191cmIoMCwgR0ZQX0tFUk5FTCk7CiAJCWlm
ICh1cmIgPT0gTlVMTCkgewpAQCAtODUwLDExICs4NjQsMTQgQEAgc3RhdGljIGludCBhdGg5a19o
aWZfdXNiX2FsbG9jX3J4X3VyYnMoc3RydWN0IGhpZl9kZXZpY2VfdXNiICpoaWZfZGV2KQogCQkJ
Z290byBlcnJfc2tiOwogCQl9CiAKKwkJcnhfYnVmLT5oaWZfZGV2ID0gaGlmX2RldjsKKwkJcnhf
YnVmLT5za2IgPSBza2I7CisKIAkJdXNiX2ZpbGxfYnVsa191cmIodXJiLCBoaWZfZGV2LT51ZGV2
LAogCQkJCSAgdXNiX3JjdmJ1bGtwaXBlKGhpZl9kZXYtPnVkZXYsCiAJCQkJCQkgIFVTQl9XTEFO
X1JYX1BJUEUpLAogCQkJCSAgc2tiLT5kYXRhLCBNQVhfUlhfQlVGX1NJWkUsCi0JCQkJICBhdGg5
a19oaWZfdXNiX3J4X2NiLCBza2IpOworCQkJCSAgYXRoOWtfaGlmX3VzYl9yeF9jYiwgcnhfYnVm
KTsKIAogCQkvKiBBbmNob3IgVVJCICovCiAJCXVzYl9hbmNob3JfdXJiKHVyYiwgJmhpZl9kZXYt
PnJ4X3N1Ym1pdHRlZCk7CkBAIC04ODAsNiArODk3LDggQEAgc3RhdGljIGludCBhdGg5a19oaWZf
dXNiX2FsbG9jX3J4X3VyYnMoc3RydWN0IGhpZl9kZXZpY2VfdXNiICpoaWZfZGV2KQogZXJyX3Nr
YjoKIAl1c2JfZnJlZV91cmIodXJiKTsKIGVycl91cmI6CisJa2ZyZWUocnhfYnVmKTsKK2Vycl9y
eGI6CiAJYXRoOWtfaGlmX3VzYl9kZWFsbG9jX3J4X3VyYnMoaGlmX2Rldik7CiAJcmV0dXJuIHJl
dDsKIH0KQEAgLTg5MSwxNCArOTEwLDIxIEBAIHN0YXRpYyB2b2lkIGF0aDlrX2hpZl91c2JfZGVh
bGxvY19yZWdfaW5fdXJicyhzdHJ1Y3QgaGlmX2RldmljZV91c2IgKmhpZl9kZXYpCiAKIHN0YXRp
YyBpbnQgYXRoOWtfaGlmX3VzYl9hbGxvY19yZWdfaW5fdXJicyhzdHJ1Y3QgaGlmX2RldmljZV91
c2IgKmhpZl9kZXYpCiB7Ci0Jc3RydWN0IHVyYiAqdXJiID0gTlVMTDsKKwlzdHJ1Y3QgcnhfYnVm
ICpyeF9idWYgPSBOVUxMOwogCXN0cnVjdCBza19idWZmICpza2IgPSBOVUxMOworCXN0cnVjdCB1
cmIgKnVyYiA9IE5VTEw7CiAJaW50IGksIHJldDsKIAogCWluaXRfdXNiX2FuY2hvcigmaGlmX2Rl
di0+cmVnX2luX3N1Ym1pdHRlZCk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgTUFYX1JFR19JTl9VUkJf
TlVNOyBpKyspIHsKIAorCQlyeF9idWYgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgcnhfYnVmKSwg
R0ZQX0tFUk5FTCk7CisJCWlmICghcnhfYnVmKSB7CisJCQlyZXQgPSAtRU5PTUVNOworCQkJZ290
byBlcnJfcnhiOworCQl9CisKIAkJLyogQWxsb2NhdGUgVVJCICovCiAJCXVyYiA9IHVzYl9hbGxv
Y191cmIoMCwgR0ZQX0tFUk5FTCk7CiAJCWlmICh1cmIgPT0gTlVMTCkgewpAQCAtOTEzLDExICs5
MzksMTQgQEAgc3RhdGljIGludCBhdGg5a19oaWZfdXNiX2FsbG9jX3JlZ19pbl91cmJzKHN0cnVj
dCBoaWZfZGV2aWNlX3VzYiAqaGlmX2RldikKIAkJCWdvdG8gZXJyX3NrYjsKIAkJfQogCisJCXJ4
X2J1Zi0+aGlmX2RldiA9IGhpZl9kZXY7CisJCXJ4X2J1Zi0+c2tiID0gc2tiOworCiAJCXVzYl9m
aWxsX2ludF91cmIodXJiLCBoaWZfZGV2LT51ZGV2LAogCQkJCSAgdXNiX3JjdmludHBpcGUoaGlm
X2Rldi0+dWRldiwKIAkJCQkJCSAgVVNCX1JFR19JTl9QSVBFKSwKIAkJCQkgIHNrYi0+ZGF0YSwg
TUFYX1JFR19JTl9CVUZfU0laRSwKLQkJCQkgIGF0aDlrX2hpZl91c2JfcmVnX2luX2NiLCBza2Is
IDEpOworCQkJCSAgYXRoOWtfaGlmX3VzYl9yZWdfaW5fY2IsIHJ4X2J1ZiwgMSk7CiAKIAkJLyog
QW5jaG9yIFVSQiAqLwogCQl1c2JfYW5jaG9yX3VyYih1cmIsICZoaWZfZGV2LT5yZWdfaW5fc3Vi
bWl0dGVkKTsKQEAgLTk0Myw2ICs5NzIsOCBAQCBzdGF0aWMgaW50IGF0aDlrX2hpZl91c2JfYWxs
b2NfcmVnX2luX3VyYnMoc3RydWN0IGhpZl9kZXZpY2VfdXNiICpoaWZfZGV2KQogZXJyX3NrYjoK
IAl1c2JfZnJlZV91cmIodXJiKTsKIGVycl91cmI6CisJa2ZyZWUocnhfYnVmKTsKK2Vycl9yeGI6
CiAJYXRoOWtfaGlmX3VzYl9kZWFsbG9jX3JlZ19pbl91cmJzKGhpZl9kZXYpOwogCXJldHVybiBy
ZXQ7CiB9CkBAIC0xMzQxLDggKzEzNzIsOSBAQCBzdGF0aWMgdm9pZCBhdGg5a19oaWZfdXNiX2Rp
c2Nvbm5lY3Qoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGVyZmFjZSkKIAogCWlmIChoaWZfZGV2
LT5mbGFncyAmIEhJRl9VU0JfUkVBRFkpIHsKIAkJYXRoOWtfaHRjX2h3X2RlaW5pdChoaWZfZGV2
LT5odGNfaGFuZGxlLCB1bnBsdWdnZWQpOwotCQlhdGg5a19odGNfaHdfZnJlZShoaWZfZGV2LT5o
dGNfaGFuZGxlKTsKIAkJYXRoOWtfaGlmX3VzYl9kZXZfZGVpbml0KGhpZl9kZXYpOworCQlhdGg5
a19kZXN0b3lfd21pKGhpZl9kZXYtPmh0Y19oYW5kbGUtPmRydl9wcml2KTsKKwkJYXRoOWtfaHRj
X2h3X2ZyZWUoaGlmX2Rldi0+aHRjX2hhbmRsZSk7CiAJfQogCiAJdXNiX3NldF9pbnRmZGF0YShp
bnRlcmZhY2UsIE5VTEwpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDlrL2hpZl91c2IuaCBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg5ay9oaWZfdXNiLmgK
aW5kZXggNzg0NjkxNmFhMDFkLi4yNWI4MDIwYTg1ODEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0
L3dpcmVsZXNzL2F0aC9hdGg5ay9oaWZfdXNiLmgKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3Mv
YXRoL2F0aDlrL2hpZl91c2IuaApAQCAtODYsNiArODYsMTEgQEAgc3RydWN0IHR4X2J1ZiB7CiAJ
c3RydWN0IGxpc3RfaGVhZCBsaXN0OwogfTsKIAorc3RydWN0IHJ4X2J1ZiB7CisJc3RydWN0IHNr
X2J1ZmYgKnNrYjsKKwlzdHJ1Y3QgaGlmX2RldmljZV91c2IgKmhpZl9kZXY7Cit9OworCiAjZGVm
aW5lIEhJRl9VU0JfVFhfU1RPUCAgQklUKDApCiAjZGVmaW5lIEhJRl9VU0JfVFhfRkxVU0ggQklU
KDEpCiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg5ay9odGNfZHJ2
X2luaXQuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg5ay9odGNfZHJ2X2luaXQuYwpp
bmRleCBkOTYxMDk1YWIwMWYuLmQxZDBlZDZlNjUzYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDlrL2h0Y19kcnZfaW5pdC5jCisrKyBiL2RyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGg5ay9odGNfZHJ2X2luaXQuYwpAQCAtOTgyLDcgKzk4Miw3IEBAIHZvaWQgYXRo
OWtfaHRjX2Rpc2Nvbm5lY3RfZGV2aWNlKHN0cnVjdCBodGNfdGFyZ2V0ICpodGNfaGFuZGxlLCBi
b29sIGhvdHVucGx1ZykKIAkJCWh0Y19oYW5kbGUtPmRydl9wcml2LT5haC0+YWhfZmxhZ3MgfD0g
QUhfVU5QTFVHR0VEOwogCiAJCWF0aDlrX2RlaW5pdF9kZXZpY2UoaHRjX2hhbmRsZS0+ZHJ2X3By
aXYpOwotCQlhdGg5a19kZWluaXRfd21pKGh0Y19oYW5kbGUtPmRydl9wcml2KTsKKwkJYXRoOWtf
c3RvcF93bWkoaHRjX2hhbmRsZS0+ZHJ2X3ByaXYpOwogCQlpZWVlODAyMTFfZnJlZV9odyhodGNf
aGFuZGxlLT5kcnZfcHJpdi0+aHcpOwogCX0KIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dp
cmVsZXNzL2F0aC9hdGg5ay9odGNfaHN0LmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
OWsvaHRjX2hzdC5jCmluZGV4IGQwOTFjOGViZGNmMC4uZDJlMDYyZWFmNTYxIDEwMDY0NAotLS0g
YS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoOWsvaHRjX2hzdC5jCisrKyBiL2RyaXZlcnMv
bmV0L3dpcmVsZXNzL2F0aC9hdGg5ay9odGNfaHN0LmMKQEAgLTExMyw2ICsxMTMsOSBAQCBzdGF0
aWMgdm9pZCBodGNfcHJvY2Vzc19jb25uX3JzcChzdHJ1Y3QgaHRjX3RhcmdldCAqdGFyZ2V0LAog
CiAJaWYgKHN2Y19yc3Btc2ctPnN0YXR1cyA9PSBIVENfU0VSVklDRV9TVUNDRVNTKSB7CiAJCWVw
aWQgPSBzdmNfcnNwbXNnLT5lbmRwb2ludF9pZDsKKwkJaWYgKGVwaWQgPCAwIHx8IGVwaWQgPj0g
RU5EUE9JTlRfTUFYKQorCQkJcmV0dXJuOworCiAJCXNlcnZpY2VfaWQgPSBiZTE2X3RvX2NwdShz
dmNfcnNwbXNnLT5zZXJ2aWNlX2lkKTsKIAkJbWF4X21zZ2xlbiA9IGJlMTZfdG9fY3B1KHN2Y19y
c3Btc2ctPm1heF9tc2dfbGVuKTsKIAkJZW5kcG9pbnQgPSAmdGFyZ2V0LT5lbmRwb2ludFtlcGlk
XTsKQEAgLTE3MCw3ICsxNzMsNiBAQCBzdGF0aWMgaW50IGh0Y19jb25maWdfcGlwZV9jcmVkaXRz
KHN0cnVjdCBodGNfdGFyZ2V0ICp0YXJnZXQpCiAJdGltZV9sZWZ0ID0gd2FpdF9mb3JfY29tcGxl
dGlvbl90aW1lb3V0KCZ0YXJnZXQtPmNtZF93YWl0LCBIWik7CiAJaWYgKCF0aW1lX2xlZnQpIHsK
IAkJZGV2X2Vycih0YXJnZXQtPmRldiwgIkhUQyBjcmVkaXQgY29uZmlnIHRpbWVvdXRcbiIpOwot
CQlrZnJlZV9za2Ioc2tiKTsKIAkJcmV0dXJuIC1FVElNRURPVVQ7CiAJfQogCkBAIC0yMDYsNyAr
MjA4LDYgQEAgc3RhdGljIGludCBodGNfc2V0dXBfY29tcGxldGUoc3RydWN0IGh0Y190YXJnZXQg
KnRhcmdldCkKIAl0aW1lX2xlZnQgPSB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJnRhcmdl
dC0+Y21kX3dhaXQsIEhaKTsKIAlpZiAoIXRpbWVfbGVmdCkgewogCQlkZXZfZXJyKHRhcmdldC0+
ZGV2LCAiSFRDIHN0YXJ0IHRpbWVvdXRcbiIpOwotCQlrZnJlZV9za2Ioc2tiKTsKIAkJcmV0dXJu
IC1FVElNRURPVVQ7CiAJfQogCkBAIC0yNzksNyArMjgwLDYgQEAgaW50IGh0Y19jb25uZWN0X3Nl
cnZpY2Uoc3RydWN0IGh0Y190YXJnZXQgKnRhcmdldCwKIAlpZiAoIXRpbWVfbGVmdCkgewogCQlk
ZXZfZXJyKHRhcmdldC0+ZGV2LCAiU2VydmljZSBjb25uZWN0aW9uIHRpbWVvdXQgZm9yOiAlZFxu
IiwKIAkJCXNlcnZpY2VfY29ubnJlcS0+c2VydmljZV9pZCk7Ci0JCWtmcmVlX3NrYihza2IpOwog
CQlyZXR1cm4gLUVUSU1FRE9VVDsKIAl9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGg5ay93bWkuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg5ay93bWku
YwppbmRleCBjZGMxNDYwOTExOTQuLjlhZTYzMWJjYzg0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDlrL3dtaS5jCisrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0
aC9hdGg5ay93bWkuYwpAQCAtMTIzLDYgKzEyMywyMCBAQCB2b2lkIGF0aDlrX2RlaW5pdF93bWko
c3RydWN0IGF0aDlrX2h0Y19wcml2ICpwcml2KQogCWtmcmVlKHByaXYtPndtaSk7CiB9CiAKK3Zv
aWQgYXRoOWtfc3RvcF93bWkoc3RydWN0IGF0aDlrX2h0Y19wcml2ICpwcml2KQoreworCXN0cnVj
dCB3bWkgKndtaSA9IHByaXYtPndtaTsKKworCW11dGV4X2xvY2soJndtaS0+b3BfbXV0ZXgpOwor
CXdtaS0+c3RvcHBlZCA9IHRydWU7CisJbXV0ZXhfdW5sb2NrKCZ3bWktPm9wX211dGV4KTsKK30K
Kwordm9pZCBhdGg5a19kZXN0b3lfd21pKHN0cnVjdCBhdGg5a19odGNfcHJpdiAqcHJpdikKK3sK
KwlrZnJlZShwcml2LT53bWkpOworfQorCiB2b2lkIGF0aDlrX3dtaV9ldmVudF9kcmFpbihzdHJ1
Y3QgYXRoOWtfaHRjX3ByaXYgKnByaXYpCiB7CiAJdW5zaWduZWQgbG9uZyBmbGFnczsKQEAgLTMz
Niw3ICszNTAsNiBAQCBpbnQgYXRoOWtfd21pX2NtZChzdHJ1Y3Qgd21pICp3bWksIGVudW0gd21p
X2NtZF9pZCBjbWRfaWQsCiAJCWF0aF9kYmcoY29tbW9uLCBXTUksICJUaW1lb3V0IHdhaXRpbmcg
Zm9yIFdNSSBjb21tYW5kOiAlc1xuIiwKIAkJCXdtaV9jbWRfdG9fbmFtZShjbWRfaWQpKTsKIAkJ
bXV0ZXhfdW5sb2NrKCZ3bWktPm9wX211dGV4KTsKLQkJa2ZyZWVfc2tiKHNrYik7CiAJCXJldHVy
biAtRVRJTUVET1VUOwogCX0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRo
L2F0aDlrL3dtaS5oIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDlrL3dtaS5oCmluZGV4
IDM4MDE3NWQ1ZWNkNy4uYzNlMjc4Mzc3MzY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoOWsvd21pLmgKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDlr
L3dtaS5oCkBAIC0xODksNiArMTg5LDggQEAgaW50IGF0aDlrX3dtaV9jbWQoc3RydWN0IHdtaSAq
d21pLCBlbnVtIHdtaV9jbWRfaWQgY21kX2lkLAogdm9pZCBhdGg5a193bWlfZXZlbnRfdGFza2xl
dCh1bnNpZ25lZCBsb25nIGRhdGEpOwogdm9pZCBhdGg5a19mYXRhbF93b3JrKHN0cnVjdCB3b3Jr
X3N0cnVjdCAqd29yayk7CiB2b2lkIGF0aDlrX3dtaV9ldmVudF9kcmFpbihzdHJ1Y3QgYXRoOWtf
aHRjX3ByaXYgKnByaXYpOwordm9pZCBhdGg5a19zdG9wX3dtaShzdHJ1Y3QgYXRoOWtfaHRjX3By
aXYgKnByaXYpOwordm9pZCBhdGg5a19kZXN0b3lfd21pKHN0cnVjdCBhdGg5a19odGNfcHJpdiAq
cHJpdik7CiAKICNkZWZpbmUgV01JX0NNRChfd21pX2NtZCkJCQkJCQlcCiAJZG8gewkJCQkJCQkJ
XAo=
--000000000000657f7f05a268eed5--

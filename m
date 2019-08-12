Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5515F89DC0
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 14:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbfHLMMH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 08:12:07 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39156 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727249AbfHLMMH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Aug 2019 08:12:07 -0400
Received: by mail-pl1-f195.google.com with SMTP id z3so970553pln.6
        for <linux-usb@vger.kernel.org>; Mon, 12 Aug 2019 05:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HSImECa5el0iQbQ9v8bXoLa86qat1X+sRH4ZYbDNvcE=;
        b=KAP64pq5qCqCvaIszyzRRyauR6jhBPus5MK8qUsQBBP1On5KDWpz06maD9E/Yju7zv
         mNMYGxq1N+LAI/FibuyCLrDED3l0h2wD0oXwCCSsOxzstoU3+8IQAh6C+Mjmr3iDx0kX
         8WzUkSCz3lyh4+yaKs+BZcAgBWbDjEMY1Suo27tEwS9wJYZHJVeAlE4SUOTWeCm39mVi
         ZD+L3egcC1P1BdPMX0+IJPBCfuteHOgMe+thbFe+Air7cfiRZRVMwfS8DvTh6SwO0cRx
         klZoZ4MNSuSMi9jaDgK2VjbX7wryXxXNUYQVdDgaeMCAcdlhNOG9W636tM2AUX5byfEw
         RgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HSImECa5el0iQbQ9v8bXoLa86qat1X+sRH4ZYbDNvcE=;
        b=iiJbHZA4EmrHfScrmfI3AIsmWLNLTjunn7591hgKfDD9ReWExLu+9SV7s3VX13eQji
         O54M+TO2Pyp/U1WeIrnzSuebrMBfVWJNoBbyj3dpm2qAI/atFw55HxffMK720ayKJbD0
         FTEctDC8LHf6nWQptr9Bw+MhZfHZ3W/v2FA4+vIxf6DcI4hvWKPaFpHNQ4O2P5pgH99k
         u5/j03UU74Qie74+0klhzVSBhbBwitp2pXrilEYWpsHGQ7RJp4l20EYnYuNLPGa690Dy
         bfMFejgqmzQ6iJlWand4dSHjIlNb46PVi67f+PDOktHbDl7PzZ2t9xIV0LSgcW6sIavl
         4E8w==
X-Gm-Message-State: APjAAAX3c/R9i32w8SQXWX7V/gNTqC1BLixX2WbbWQx6X+JD+TTsb3mj
        xDh3vc9/QYreXZCEyCfrXy7v9cj2nWz8pc9lv9FdHw==
X-Google-Smtp-Source: APXvYqxT78Eo6LHh7YWK9fpnAEDU+y7R03K+i1gZRxfwsCXbIXdflLz5Rx06U6cq5esb85O5oAOyONX0Rlt9jGponck=
X-Received: by 2002:a17:902:bb94:: with SMTP id m20mr250579pls.336.1565611926530;
 Mon, 12 Aug 2019 05:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000026d72f058fb33242@google.com> <Pine.LNX.4.44L0.1908091531590.1630-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1908091531590.1630-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 12 Aug 2019 14:11:54 +0200
Message-ID: <CAAeHK+wh=oQo4rorPuKR6dKGbwx4pNL8Of8mDUqbpV-G0kt6_w@mail.gmail.com>
Subject: Re: possible deadlock in usb_deregister_dev
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+a64a382964bf6c71a9c0@syzkaller.appspotmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>, oneukum@suse.de,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: multipart/mixed; boundary="000000000000bd1494058fea6eae"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--000000000000bd1494058fea6eae
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 9, 2019 at 9:32 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, 9 Aug 2019, syzbot wrote:
>
> > syzbot has found a reproducer for the following crash on:
> >
> > HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=15bf780e600000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> > dashboard link: https://syzkaller.appspot.com/bug?extid=a64a382964bf6c71a9c0
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16787574600000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=136cc4d2600000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+a64a382964bf6c71a9c0@syzkaller.appspotmail.com
> >
> > usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> > usb 1-1: config 0 descriptor??
> > iowarrior 1-1:0.236: IOWarrior product=0x1501, serial= interface=236 now
> > attached to iowarrior0
> > usb 1-1: USB disconnect, device number 2
> > ======================================================
> > WARNING: possible circular locking dependency detected
> > 5.3.0-rc2+ #25 Not tainted
> > ------------------------------------------------------
> > kworker/0:1/12 is trying to acquire lock:
> > 00000000cd63e8f1 (minor_rwsem){++++}, at: usb_deregister_dev
> > drivers/usb/core/file.c:238 [inline]
> > 00000000cd63e8f1 (minor_rwsem){++++}, at: usb_deregister_dev+0x61/0x270
> > drivers/usb/core/file.c:230
> >
> > but task is already holding lock:
> > 000000001d1989ef (iowarrior_open_disc_lock){+.+.}, at:
> > iowarrior_disconnect+0x45/0x2c0 drivers/usb/misc/iowarrior.c:867
> >
> > which lock already depends on the new lock.
>
> https://syzkaller.appspot.com/bug?extid=ca52394faa436d8131df is
> undoubtedly a duplicate of this.

I've marked it as one, thanks!

Now that we have a reproducer, let's retry Oliver's fix:

#syz test: https://github.com/google/kasan.git e96407b4

--000000000000bd1494058fea6eae
Content-Type: text/x-patch; charset="US-ASCII"; name="iowarrior.patch"
Content-Disposition: attachment; filename="iowarrior.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jz8cwrb50>
X-Attachment-Id: f_jz8cwrb50

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL21pc2MvaW93YXJyaW9yLmMgYi9kcml2ZXJzL3VzYi9t
aXNjL2lvd2Fycmlvci5jCmluZGV4IGJhMDVkZDgwYTAyMC4uZjViZWQ5ZjI5ZTU2IDEwMDY0NAot
LS0gYS9kcml2ZXJzL3VzYi9taXNjL2lvd2Fycmlvci5jCisrKyBiL2RyaXZlcnMvdXNiL21pc2Mv
aW93YXJyaW9yLmMKQEAgLTg2NiwxOSArODY2LDIwIEBAIHN0YXRpYyB2b2lkIGlvd2Fycmlvcl9k
aXNjb25uZWN0KHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRlcmZhY2UpCiAJZGV2ID0gdXNiX2dl
dF9pbnRmZGF0YShpbnRlcmZhY2UpOwogCW11dGV4X2xvY2soJmlvd2Fycmlvcl9vcGVuX2Rpc2Nf
bG9jayk7CiAJdXNiX3NldF9pbnRmZGF0YShpbnRlcmZhY2UsIE5VTEwpOworCS8qIHByZXZlbnQg
ZGV2aWNlIHJlYWQsIHdyaXRlIGFuZCBpb2N0bCAqLworCWRldi0+cHJlc2VudCA9IDA7CiAKIAlt
aW5vciA9IGRldi0+bWlub3I7CisJbXV0ZXhfdW5sb2NrKCZpb3dhcnJpb3Jfb3Blbl9kaXNjX2xv
Y2spOworCS8qIGdpdmUgYmFjayBvdXIgbWlub3IgLSB0aGlzIHdpbGwgY2FsbCBjbG9zZSgpIGxv
Y2tzIG5lZWQgdG8gYmUgZHJvcHBlZCBhdCB0aGlzIHBvaW50Ki8KIAotCS8qIGdpdmUgYmFjayBv
dXIgbWlub3IgKi8KIAl1c2JfZGVyZWdpc3Rlcl9kZXYoaW50ZXJmYWNlLCAmaW93YXJyaW9yX2Ns
YXNzKTsKIAogCW11dGV4X2xvY2soJmRldi0+bXV0ZXgpOwogCiAJLyogcHJldmVudCBkZXZpY2Ug
cmVhZCwgd3JpdGUgYW5kIGlvY3RsICovCi0JZGV2LT5wcmVzZW50ID0gMDsKIAogCW11dGV4X3Vu
bG9jaygmZGV2LT5tdXRleCk7Ci0JbXV0ZXhfdW5sb2NrKCZpb3dhcnJpb3Jfb3Blbl9kaXNjX2xv
Y2spOwogCiAJaWYgKGRldi0+b3BlbmVkKSB7CiAJCS8qIFRoZXJlIGlzIGEgcHJvY2VzcyB0aGF0
IGhvbGRzIGEgZmlsZWRlc2NyaXB0b3IgdG8gdGhlIGRldmljZSAsCg==
--000000000000bd1494058fea6eae--

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09A345EF505
	for <lists+linux-usb@lfdr.de>; Thu, 29 Sep 2022 14:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235064AbiI2MNR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Sep 2022 08:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232380AbiI2MNO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Sep 2022 08:13:14 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 793A0126B4B
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 05:13:11 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id r6so1873436wru.8
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 05:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=c8K295D1A28WsLr3dxWmH2Z8IhtU9OIdh34R3Zthm1I=;
        b=i35wmlXAHlGTIoaGQJz5d237r4iEQzsgvENIfIVmO2llFZHY7rO8wyPpS4qWJKeqGr
         CMC3zzPHkeIFbweyvDspRI55jegnTaCik/JcQvOH36Qvyura+XO+3e2qLw+nhHliMuB7
         J2GqkokTF89hDJp6DhvILYKQKFC50hNITaYGFiJgVOJqRJIxty22KHvGqIKiI00XTX92
         ZUfCnnIRbFI+CRuR+06l4Gvfsicy4F8mzg82gJVNAq0m7aA1zRtvj2DrwLgchX7Q6F/S
         PtnqhkkPmKW4xKq8fgVFc2ouyzlxL8J/SepU379jtsqjeuhWorLC1MSeN8xGOg5u3PBN
         8UHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=c8K295D1A28WsLr3dxWmH2Z8IhtU9OIdh34R3Zthm1I=;
        b=sPhp9qDWBs6gCn6oTt1BC/k/FHBm7KYjtAF7p6j9PpAKjH729kpneCKSVViEIEhnWE
         Hg9cecvt04KVk8zm+DrZTzg4MTOm1lG5BhbYgKLoSs1CuvIP9GzFlyFJ7gUvLY22qH8+
         6PdKPpdmSIJgBhk3CvajHmuR82saYL0vDEIQGOF0x29A/FG45fVWuEltE2aYOMSR3+pD
         Az2zkmF4wL0HPlD47N/OXxX+diDJ6oaXMzcBreRA+cciT6xMrHqkfHo9l+xIbAwu1I0A
         v8KMwDOBTf48hUTmNftv3o4TOihRTpoZk2r70U1dqHmxNYGMa4A5Pt+B2QjFYuOal2/X
         YpYw==
X-Gm-Message-State: ACrzQf2iBAsuzMoyxJz9OW8qIsIjr5UBJ0wBtcwTDt/YeOaErzmazCnI
        q7fv1H413VqEbkw7kzHHQHcn/rRX56vzCrQAtn/oLGZvHMcbOA==
X-Google-Smtp-Source: AMsMyM5J54QtVNw1UE4918cF978KdhZ7CAHWfewBoH2XTeNxCAOffk8WDlEzO5yLvQXMg7HpJQ+dt/XUlmWgqWBFr3s=
X-Received: by 2002:a05:6000:178a:b0:22b:87b:c995 with SMTP id
 e10-20020a056000178a00b0022b087bc995mr2110288wrg.715.1664453589836; Thu, 29
 Sep 2022 05:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <fe289e7f-dedc-a0bd-f79f-72c80dbd5028@suse.com> <0000000000007e0da805e9cfb183@google.com>
In-Reply-To: <0000000000007e0da805e9cfb183@google.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Thu, 29 Sep 2022 14:12:33 +0200
Message-ID: <CAG_fn=WXcwFZ58ChAMkToG5FQe6sDTMGfs1TS8ZmW8BGUr2xfw@mail.gmail.com>
Subject: Re: [syzbot] KMSAN: uninit-value in idmouse_open
To:     syzbot <syzbot+79832d33eb89fb3cd092@syzkaller.appspotmail.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: multipart/mixed; boundary="000000000000f8506805e9cfcc33"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--000000000000f8506805e9cfcc33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz test: https://github.com/google/kmsan.git master

--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg

--000000000000f8506805e9cfcc33
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-usb-idmouse-fix-memory-leak.patch"
Content-Disposition: attachment; 
	filename="0001-usb-idmouse-fix-memory-leak.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l8n0mv180>
X-Attachment-Id: f_l8n0mv180

RnJvbSBmOTA3ODU5MWRhODU4NmQyMDMyMTJiNTcwNzljNGEwODY0MDM1ODBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBUaHUsIDI5IFNlcCAyMDIyIDEwOjA4OjAwICswMjAwClN1YmplY3Q6IFtQQVRDSF0gdXNiOiBp
ZG1vdXNlOiBmaXggbWVtb3J5IGxlYWsKClNpZ25lZC1vZmYtYnk6IE9saXZlciBOZXVrdW0gPG9u
ZXVrdW1Ac3VzZS5jb20+Ci0tLQogZHJpdmVycy91c2IvbWlzYy9pZG1vdXNlLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9taXNjL2lkbW91c2UuYyBiL2RyaXZlcnMvdXNiL21pc2MvaWRtb3VzZS5j
CmluZGV4IGU5NDM3YTE3NjUxOC4uNmMxOWU1ZDJiNGQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3Vz
Yi9taXNjL2lkbW91c2UuYworKysgYi9kcml2ZXJzL3VzYi9taXNjL2lkbW91c2UuYwpAQCAtMzQ5
LDcgKzM0OSw3IEBAIHN0YXRpYyBpbnQgaWRtb3VzZV9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFj
ZSAqaW50ZXJmYWNlLAogCWRldi0+b3JpZ19iaV9zaXplID0gdXNiX2VuZHBvaW50X21heHAoZW5k
cG9pbnQpOwogCWRldi0+YnVsa19pbl9zaXplID0gMHgyMDA7IC8qIHdvcmtzIF9tdWNoXyBmYXN0
ZXIgKi8KIAlkZXYtPmJ1bGtfaW5fZW5kcG9pbnRBZGRyID0gZW5kcG9pbnQtPmJFbmRwb2ludEFk
ZHJlc3M7Ci0JZGV2LT5idWxrX2luX2J1ZmZlciA9IGttYWxsb2MoSU1HU0laRSArIGRldi0+YnVs
a19pbl9zaXplLCBHRlBfS0VSTkVMKTsKKwlkZXYtPmJ1bGtfaW5fYnVmZmVyID0ga3phbGxvYyhJ
TUdTSVpFICsgZGV2LT5idWxrX2luX3NpemUsIEdGUF9LRVJORUwpOwogCWlmICghZGV2LT5idWxr
X2luX2J1ZmZlcikgewogCQlpZG1vdXNlX2RlbGV0ZShkZXYpOwogCQlyZXR1cm4gLUVOT01FTTsK
LS0gCjIuMzUuMwoK
--000000000000f8506805e9cfcc33--

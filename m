Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 810AEFE4CF
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 19:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfKOSTX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 13:19:23 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35897 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbfKOSTW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Nov 2019 13:19:22 -0500
Received: by mail-pg1-f196.google.com with SMTP id k13so6381916pgh.3
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2019 10:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:to:subject:from:user-agent:date;
        bh=/nPbsdCJvwt5lKKSjGD3DLzTdGucI41FrjpblwIsypo=;
        b=EaoAKkm4BqcYz0t8roJcx9ZGH2ZwnA35uEWBR9b+b+UfNnEGGPfkn2GMxv+SW2BrwE
         kT/LksAzxIDphLmWMWfjlHn57yIe0BUhKtAumfwEy+E0QujKRxuLjqrx5sDVKcQEBB22
         lSgKZXpa6E+Cz/zv/IT9DVHmE/Ol4XZE15gGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:to:subject:from
         :user-agent:date;
        bh=/nPbsdCJvwt5lKKSjGD3DLzTdGucI41FrjpblwIsypo=;
        b=qcwOt2JnhdORofYcu3eD0BlM501q0k8bXTMO5ErYcPgcl8CdRShbHXc18ZCpm6SnjD
         4VmY9MWZkql5+gtXH0FfQYM58LgrNjGedTnzgu7Fj2or5swFjYTbA11tzqQpiDowuI7A
         vahITFXRVyRVTNmmhGN0FwAI3f260Pc1hot7TFZzZ8SP4txYwlBuTRfb//emuKoxsxY1
         R/gI7hguV9FkJ5bHLMYibnG6Id9fh9cmJFYOi7RDtEvHM2Bx/zgkjHUws6roqIwdUHsj
         WrdACWOcMR71VeqgsCbQ4KpjbUhf5bCFD3POkEubq5bARsri6mUXcjW5HkeAFUu+1QTX
         NuMw==
X-Gm-Message-State: APjAAAU+fryAqioirsHagKN0hR2ebCdIQCL/3ORwV1mIfhgtznCRKPHj
        M1ea926ws9YH7bGQHGyYBoD1yA==
X-Google-Smtp-Source: APXvYqw4aSsYPurq2VMWDwYSwROjnsjmTt0F1DX8PauKVTqLhoSLVwwxc6wZfCS/R0GLPZtK1TVkQA==
X-Received: by 2002:a62:ea0b:: with SMTP id t11mr19675909pfh.182.1573841961943;
        Fri, 15 Nov 2019 10:19:21 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k13sm10639792pgl.69.2019.11.15.10.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 10:19:21 -0800 (PST)
Message-ID: <5dceec29.1c69fb81.4c2d0.e24d@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0000000000006062280596203360@google.com>
References: <0000000000006062280596203360@google.com>
To:     alexandre.belloni@bootlin.com, andreyknvl@google.com,
        arnd@arndb.de, gregkh@linuxfoundation.org,
        herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        lvivier@redhat.com, mchehab+samsung@kernel.org, mpm@selenic.com,
        syzbot <syzbot+6d8505fcdf25f00ac276@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com, tytso@mit.edu
Subject: Re: KASAN: use-after-free Read in chaoskey_disconnect
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 10:19:20 -0800
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting syzbot (2019-10-30 05:52:08)
> Hello,
>=20
> syzbot found the following crash on:
>=20
> HEAD commit:    ff6409a6 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D15e1ba24e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D3230c37d44289=
5b7
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D6d8505fcdf25f00=
ac276
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D169b8904e00=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D166f3104e00000
>=20
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+6d8505fcdf25f00ac276@syzkaller.appspotmail.com
>=20

Ok, let's try that again

#syz test: https://github.com/google/kasan.git ff6409a6

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 5b799aa973a3..c487709499fc 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -2440,8 +2440,8 @@ void add_hwgenerator_randomness(const char *buffer, s=
ize_t count,
 	 * We'll be woken up again once below random_write_wakeup_thresh,
 	 * or when the calling thread is about to terminate.
 	 */
-	wait_event_freezable(random_write_wait,
-			kthread_should_stop() ||
+	wait_event_interruptible(random_write_wait,
+			kthread_should_stop() || freezing(current) ||
 			ENTROPY_BITS(&input_pool) <=3D random_write_wakeup_bits);
 	mix_pool_bytes(poolp, buffer, count);
 	credit_entropy_bits(poolp, entropy);

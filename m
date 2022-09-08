Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE6435B2353
	for <lists+linux-usb@lfdr.de>; Thu,  8 Sep 2022 18:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbiIHQO7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Sep 2022 12:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbiIHQOf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Sep 2022 12:14:35 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8730A15732
        for <linux-usb@vger.kernel.org>; Thu,  8 Sep 2022 09:14:31 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id fs14so13481101pjb.5
        for <linux-usb@vger.kernel.org>; Thu, 08 Sep 2022 09:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=9ZFpt/foVGQHDYdWFxLDfNkzYkIk3H2JJygdZbdIkYI=;
        b=qUsZRs8TqTVRrLQv2ZgvhdNh8y/MkuVqCb3R2CFE9sYZBVM8bNszfOIDPxEeT2fM5Z
         DchHUQJWEQLaxvixjHe//G6C4Vmz3lAp4InYzRXeRlPj88/kT9xI/McALoNuNVgK/YRc
         1LKOjWUjKSqQgzyFjlcMVSWurvdGg/KXVQQ4zuFW9RFscd3aWKEaE8hNJvuGlb85H9Zd
         NORY3r4bLz0UZWdypTpqWoPTFYwMsm5K3fP8ImUjpryUO2Ud42g8reAOvpP8df//r9u2
         kx8GLX0luFbift3AlLOrntyHGvBoeLp7Zv5obW7oZvfTg2jaa4WIQOFKC0BOd7LVaq69
         oKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9ZFpt/foVGQHDYdWFxLDfNkzYkIk3H2JJygdZbdIkYI=;
        b=m2a2Rxum5kEVwq/bbLt6ThGKh1+Sef+ofd48Bhxnd5rsbF6ADkUtU/3J8ZJ82lR5fJ
         p/Uk1Kg7JyKBsddfpG4YKi3HYLJW4GZyGAIs19n88QFXC2sCaUQ9FTsokfUVLZ9M4PwH
         WnUMDakEjcLpgb0AEHUy6wP1g9NX7sFujvmwzvezxrka7fv5arTO31E/330iFSB7EDCX
         Urhtbx0riLSNzNoadAE8sRtG7dxRMTjTLydzojTsfN0aG2V9gR+yD3+VWxygSPgCLKwM
         J9k9Xo5XF4KfTUri/DKQd+dI0XtP25V4SODv+yuJ3pdyRIGBP+Xv7pi2Phg6pdHe5m/n
         jsKw==
X-Gm-Message-State: ACgBeo1SRa62FoVTNTV2MqncNYfl/39o09rNE/GLuUGJRA2esCI8tRjz
        HlnFMJ9i1smVMw3ZDMengTzXUqG/tzy4nUuCMVo=
X-Google-Smtp-Source: AA6agR6WBa4UjUtb2iPUSt1G9CzoUaJLoDzONAfTcJv/eQi9pr42g9DyPsPrdFaF4k1vz/EOIvxeTNGtJnTUbGpbaSk=
X-Received: by 2002:a17:90b:4d12:b0:1f5:59e1:994f with SMTP id
 mw18-20020a17090b4d1200b001f559e1994fmr4867196pjb.217.1662653669502; Thu, 08
 Sep 2022 09:14:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:903:22c4:b0:16e:f1d3:9b22 with HTTP; Thu, 8 Sep 2022
 09:14:28 -0700 (PDT)
Reply-To: cfc.ubagroup09@gmail.com
From:   Kristalina Georgieva <unitedbankafricau23@gmail.com>
Date:   Thu, 8 Sep 2022 09:14:28 -0700
Message-ID: <CAF0yg6uDZFZ8JJkh+ei0D4_bUiFjpmdnSpWgVAJX+kHrKVDR9Q@mail.gmail.com>
Subject: XUSH HABAR
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hurmatli Benefisiar,
Men sizga bir oy oldin bu xatni yuborgan edim, lekin sizdan xabar yo'q, yo'=
q
Ishonchim komilki, siz uni oldingiz va shuning uchun uni yana sizga yubordi=
m,
Avvalo, men Kristalina Georgieva xonim, boshqaruvchi direktor va
Xalqaro valyuta jamg'armasi prezidenti.

Aslida, biz atrofdagi barcha to'siqlar va muammolarni ko'rib chiqdik
sizning to'liq bo'lmagan tranzaksiyangiz va to'lovlarni to'lay olmasligingi=
z
o'tkazish to'lovlari olinadi, sizga qarshi, imkoniyatlari uchun
oldingi transferlar, tasdiqlash uchun bizning saytimizga tashrif buyuring 3=
8
=C2=B0 53'56 =E2=80=B3 N 77 =C2=B0 2 =E2=80=B2 39 =E2=80=B3 Vt

Biz Direktorlar kengashi, Jahon banki va Valyuta jamg'armasimiz
Vashingtondagi Xalqaro (XVF) Departamenti bilan birgalikda
Amerika Qo'shma Shtatlari G'aznachiligi va boshqa ba'zi tergov idoralari
Amerika Qo'shma Shtatlarida bu erda tegishli. buyurdi
Bizning Chet eldagi to'lov pul o'tkazmalari bo'limi, Birlashgan Bank
Afrika Lome Togo, sizga VISA kartasini chiqarish uchun, bu erda $
Sizning fondingizdan ko'proq pul olish uchun 1,5 million.

Tekshiruvimiz davomida biz aniqladik
Sizning to'lovingiz korruptsionerlar tomonidan kechiktirilganidan xafa bo'l=
ing
Sizning mablag'laringizni hisoblaringizga yo'naltirishga harakat qilayotgan=
 bank
xususiy.

Va bugun biz sizning mablag'ingiz Kartaga o'tkazilganligi haqida xabar bera=
miz
UBA Bank tomonidan VISA va u ham yetkazib berishga tayyor. Hozir
UBA Bank direktori bilan bog'laning, uning ismi janob Toni
Elumelu, elektron pochta: (cfc.ubagroup09@gmail.com)
ATM VISA kartangizni qanday qabul qilishni aytib berish.

Hurmat bilan,

Kristalina Georgieva xonim

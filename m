Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 865173E0054
	for <lists+linux-usb@lfdr.de>; Wed,  4 Aug 2021 13:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237524AbhHDLhq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Aug 2021 07:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236502AbhHDLhp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Aug 2021 07:37:45 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A09DDC0613D5
        for <linux-usb@vger.kernel.org>; Wed,  4 Aug 2021 04:37:32 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso3080825pjf.4
        for <linux-usb@vger.kernel.org>; Wed, 04 Aug 2021 04:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=8z6k0nvfMeU4+kk1Rlj4CMcpU7JmVD+ziX5/+jJBhDQ=;
        b=riowX95Hs2Ph56J/2jkLUbHYSNrG3H4azMA8HC4p3zk3C9SYu8fkQWP+7ty/Qrz3FB
         0A9cr9/+Mvy7UgNuyN3x8XGfUhr9KxLFZleWhtij2Z0BUTM7cm8Ca4YC/878ahqoSfSx
         UC+GSLk4vN68OMPcqIYskAVGvMhkc+KGDHEriTUrIBVLdGL7FF31xSxTNXbrfGdya4Rm
         KpSrXsCcUHbPdP207h4PAKR4kAha0FUZMyvBdQTIodZMGWzfEfsp+Nj3V35winoRMdh2
         2R7v4JPNB5OfkDS2wGGtXVvz0yswkaFiGxeizQdpfAkk+G5rNkZEFpctT1REdqkBMHcT
         RKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to:content-transfer-encoding;
        bh=8z6k0nvfMeU4+kk1Rlj4CMcpU7JmVD+ziX5/+jJBhDQ=;
        b=DIdswbCPDWd7bDL1CGktnGvuwdHhfpfAHAk26GbYZJBEL1znncfIhtgklDqUk3iSLE
         eVPtGi773oDYzxE46yDj8SUD0qaoZFqAq0VbwBx/h4tTOuFbAbO+7ORjk1KH0OX3J69a
         KtC2tnIct2MXKlEPae5wZaPql0WkKyrP1hw7IRLVA1jfRkvfcTUxmIjEer7v1HPXx07M
         9gyzO3IDnk8iah2lAVOJ6IQfitvzTg8OHCula7JQgzsPrySVul7r91l/ci4o3m74r6zr
         5G1UqzGKE0TpNlZs2UNc7QpHZo5SlAZdJqRg+v/7PxSHq/2T5VY3SPStNOIaEVUC61l9
         FIJQ==
X-Gm-Message-State: AOAM533Gtg/y8YQxnpqIWdttry1sPYpolB448wBweN95190sP+G/hUuu
        qDYd+1kWlIboUiPOjtjknr3W5uJQCDtB/1XYQA==
X-Google-Smtp-Source: ABdhPJy8Xdy7HWiz+2dDNIPY01i3HjjR+vue4DeJr+P0fX8VhceWf9k2asYXAcaZ3o8LAb3uf0ggAilqluNqWGAZTFc=
X-Received: by 2002:aa7:969a:0:b029:3bd:40c4:971f with SMTP id
 f26-20020aa7969a0000b02903bd40c4971fmr15609055pfk.39.1628077052226; Wed, 04
 Aug 2021 04:37:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a11:4418:0:0:0:0 with HTTP; Wed, 4 Aug 2021 04:37:31
 -0700 (PDT)
Reply-To: moneygramdepromo@gmail.com
In-Reply-To: <CAP2Ytbn75uExUqhHVbf-82xNsOgUDVpdecV_Mjrn6Lzt7-6LnQ@mail.gmail.com>
References: <CAP2Ytbmo2_ekULBWsFkTgEKYMVRgzk2XtKfbASZoUy2cQ2eipA@mail.gmail.com>
 <CAP2Ytbns90=yYt50x3ASZ1h64zCK+o5Q1wq3Gnb8Nr4UJgo1Fw@mail.gmail.com>
 <CAP2YtbmeZSyckMVe8_eNDeLT7bVnw-JYPXiT=LB0anzJ7EffKw@mail.gmail.com>
 <CAP2Ytb=FxP+NWq4y8hksn1AQBt8jpBXk42ay8NSoA942Ssk0gA@mail.gmail.com>
 <CAP2Ytb=M6BqWtQerT4tLE2iEbEoToW-PhnFwMKMn1M_giXszHA@mail.gmail.com>
 <CAP2YtbkFu8A2+LLjSja8-Bg8h2-0h_RaYphB27XkFioZ0Be+HQ@mail.gmail.com>
 <CAP2Ytbnc+3t+=sFOqWEtahNtDgtSHXZN5Pehx4EfVLS2cBGhtw@mail.gmail.com>
 <CAP2Ytb=WVcAC=uxsoZPDbt8DcP_5j-e24yyOOURMbC4GZi1MtQ@mail.gmail.com>
 <CAP2Ytb=qa5ACS6ogm222nrabSBPxAO46w7h4Ai7sNWHpNrzPMA@mail.gmail.com>
 <CAP2Ytbke9bShR59+YUjECn8riSaZ63BG8jPdSo+_5xCHOjx+wQ@mail.gmail.com>
 <CAP2YtbnAy-vDK+1M=x-hCLEe_Z57R2mnkOcEtkXdnqXoVm0hYw@mail.gmail.com>
 <CAP2Ytbm-T58feqzihmu8tr=0Yf2ORZWWrMja33X7_ZD1UG5oqQ@mail.gmail.com>
 <CAP2YtbnttcPO30wABw0X4yf5eKO-ooQ2Mdsq7j=bVgBvY_kxbQ@mail.gmail.com> <CAP2Ytbn75uExUqhHVbf-82xNsOgUDVpdecV_Mjrn6Lzt7-6LnQ@mail.gmail.com>
From:   Alexander Holmes <chineduomor6@gmail.com>
Date:   Wed, 4 Aug 2021 11:37:31 +0000
Message-ID: <CAP2YtbnwkgjLXpCYW7rdevY4iM69Ud-pVn8K6i-oW8D7SyTAjA@mail.gmail.com>
Subject: How are you today?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

How are you today?

This is MoneyGram International Inc. we are contacting you concerning
your winning fund $1.500, 000.00 USD; your e-mail won $1.500, 000.00
dollars through Internet contest, and lottery bonus under MoneyGram
International Inc. Worldwide. The lottery bonus is contesting once in
a year, and we are doing it to promote this company MoneyGram
International Inc. The last contest was made through the internet by
people=E2=80=99s email worldwide, for example. USA, CANADA, RUSSIA, EUROPE,
ASIA, AFRICA, UNITED KINGDOM, GERMANY, TOGO, SOUTH AFRICA, UAE,
ETC...........................

We are contacting you because you are among the winning people and
your winning code is [XHMG02639]. We have programmed your daily
transfer payment at the minimum of =E2=82=AC4,500 Euros daily. Therefore yo=
u
are advised to contact branch office Togo, with your complete info,
such as below.

Your surname......................
Your middle name..................
Your name........................
Your home address...............
Your country........................
Your phone number.................
Your occupation/ your work...................
Your passport or Identity Card copy.......................

Kindly contact the MoneyGram Agent Mr. DENIS KODJO, Phone: +228
79541985, via this email ( moneygramdepromo@gmail.com ) to release
your first payment pick up information.

Regards
CEO: W. Alexander Holmes

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFD74EAD13
	for <lists+linux-usb@lfdr.de>; Tue, 29 Mar 2022 14:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236263AbiC2M0H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Mar 2022 08:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236262AbiC2M0F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Mar 2022 08:26:05 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F374D63A
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 05:24:23 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id 2so18901097vse.4
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 05:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=v/yvavUyPwGerxMA/IE+Pbrkfw+f2eQSM7TzLTQJVSI=;
        b=mg0Faty7SLNLy5pOndArGMSje8ncEjvDB/wYdFffN3XRrnXRyObK4XQB5tiE4+t0Ej
         N3mF5HhhSD10C6UXgU/WOOA1Glj8brndU+4+CNXtdEelJaoeAwZgXCwI5OSsNloJGcRt
         ezyDy5fXLTnsj1f4KArL15hTcmML4WD5W6/eZdZw6/d9/1uzzv3fHVQFA4OqO1rCN5QP
         8dgiGEc5p5wu0Zw3Er5qAu7dkj7mlza804aM7VAWatk596ehAe9Cm1sQUG1Wayfy8PMC
         HLixWKgnnlO/x1HJAJ/N7e2tMtHFIIbBy9UQadM16ZhZJyQcvupbdVKRAjjDJkk0sRnD
         Euyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=v/yvavUyPwGerxMA/IE+Pbrkfw+f2eQSM7TzLTQJVSI=;
        b=6NFxgST1KdL4Wjt3ajUj652ekoYdGeYbInOMXm82qxKBsDq9+2oFmNLsOh7XUfdcth
         EVh2cSu2/L51Wu85d2y9o9guGzv/EgN3/PJI2I2o1uMWTF8ZELZdu4eGxEBusuoQfoWX
         iPQk+9A5hQhk5/fUgkNWI+knPc/8NhSBP1tInuNZh7j7xIsKGTZaIjg5l4uTnaOBeIU9
         3bWxnQbnT8YDqVWUFPxN3VgcwUWy4yhY8Xz2BaK855u+XLVbBSHa78WVUXhTuQE6Etnb
         cPpj45ezA7E4CDHUPauClwQLBPHfgkoxiGu2R+nYq/U9XGMLwm+Zp6F2XeK1xO/jkQ++
         udaw==
X-Gm-Message-State: AOAM533xy3ridi4ZXGCHKSDDcA+0d/c3a5EM3ciwSnU1lL2JSCoeX8Cf
        lch6mzif7nnWalL2UfebQOQMv4G78zp1YnfStgU=
X-Google-Smtp-Source: ABdhPJxahA43grWYXuPwEATomnfAA1eslpqwsaenN2xutRkXzqCOBcRMkJ8cxUTRqahVRBmZoPLF0P+D4qhShLfKjsw=
X-Received: by 2002:a05:6102:6d2:b0:325:bbf5:5e73 with SMTP id
 m18-20020a05610206d200b00325bbf55e73mr5056326vsg.85.1648556661779; Tue, 29
 Mar 2022 05:24:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:93d1:0:b0:2a3:2686:e231 with HTTP; Tue, 29 Mar 2022
 05:24:21 -0700 (PDT)
Reply-To: wwheadoffic@gmail.com
From:   "wwheadoffic@gmail.com" <bankdirector001@gmail.com>
Date:   Tue, 29 Mar 2022 12:24:21 +0000
Message-ID: <CACOECaw2fU35=PHrb3hoZFsGTjoReTEUwtdLZ+cxDXSQFfqL=Q@mail.gmail.com>
Subject: hello
To:     bankdirector001@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        NAME_EMAIL_DIFF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=20
 Irod=C3=A1nk el=C3=A9rhet=C5=91s=C3=A9ge: 2554 Road Of Kpalime Face Pharma=
cy Bet, Lome, Gulf.

Ez a WU bank igazgat=C3=B3ja =C3=A9rtes=C3=ADti =C3=96nt arr=C3=B3l, hogy a=
 Nemzetk=C3=B6zi
Valutaalap (IMF) 850 000,00 USD k=C3=A1rt=C3=A9r=C3=ADt=C3=A9st fizet =C3=
=96nnek, mert
megtal=C3=A1lta az =C3=96n e-mail c=C3=ADm=C3=A9t a csal=C3=A1s =C3=A1ldoza=
tainak list=C3=A1j=C3=A1n. Hajland=C3=B3
vagy venni ezt az alapot vagy sem?

V=C3=A1rjuk s=C3=BCrg=C5=91s h=C3=ADr=C3=A9t.

Tisztelettel
  Tony Albert
  BANKIGAZGAT=C3=93

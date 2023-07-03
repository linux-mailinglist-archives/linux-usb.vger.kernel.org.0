Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0B87746123
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jul 2023 19:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbjGCRGc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jul 2023 13:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjGCRGb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Jul 2023 13:06:31 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7ABE5C
        for <linux-usb@vger.kernel.org>; Mon,  3 Jul 2023 10:06:30 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-576903d416fso4519167b3.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Jul 2023 10:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688403990; x=1690995990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3kSUP20XkkVUGMWaaToXa5E+NTrUUerCQspcGfSdnCg=;
        b=AECOAaqbUB08j6ywsSMDg5ItdL4XKkcNrI9vQ9Afo8w44EE79ESML5cwdcX4zYI9Uc
         A1maWk7pEhXY/w+0xkZ9eu5GfNGLICyBc1OIw01lrGW0xjZktxL2ItPeW88JxManAGfj
         /1h3jryabkGZsphJSGQIF5Driw72f2/fAkhM34VhX1t6DsN5DFTy0vmdhESqrLtxVgBk
         TSEQA71N2NKr5V5dUXb2ajKP8Mw3goET9ZGqd05ZoAXt0TFcO/KPTkEe21jGQEgHEIvT
         bKDfiLk6SaOFlFIB1TjyZ9P+aKgLwdopikP9NTICDvbqxLA/yZ7/ELvRAbC/IdACdRaM
         4smQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688403990; x=1690995990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kSUP20XkkVUGMWaaToXa5E+NTrUUerCQspcGfSdnCg=;
        b=ZodjZXWddl/kVH3xC13Dm6dd/uUW0g2SSLc+fb6RcH+QebHEK4rMpO7it4W7ytaDKV
         ANl0VsyfjjpX3ekiBkJ40rRhoCpdNIqd2jgKP7XHgEI+iUL5VFJ4HuiHlikzPl609u5m
         P0GqJUlhtCPHwU4DKA1zV5TQpgXlW7zfzXx64PQ68jjh+O+LsCk5rj+oQ6gZuF3oKa9P
         6JmrlEet1szb9P7Rbz58ocgVD5fJW4wGR++hGJNVyjejlogjgsnDZJItYiiUxQl1k/Ao
         EOcMJNz2v3t7dOiMabgVdWFPMP0r0CLb2VzXCo9ThSNmfvheDxyCygD2UrwaHpTvM8ue
         uznQ==
X-Gm-Message-State: ABy/qLY94vG4GEQiMwYr0QaeMyNr/0ZsQJOeemqmAsecOwiPsiDMxfOP
        5HSFpJZ3krc9Ojf+z3LBvD5NrhASCwOhgcbJAf+frEU1IeA=
X-Google-Smtp-Source: APBJJlHMsobNvjLozjqcnGA5koYtEgW9YLqc5cgZSTHOGwXySWoiJJ9uTGUNGKLvL3H4A/UZWI0jesJVQKwZgh55HYI=
X-Received: by 2002:a25:ac83:0:b0:c24:bd7a:c075 with SMTP id
 x3-20020a25ac83000000b00c24bd7ac075mr6083158ybi.3.1688403989619; Mon, 03 Jul
 2023 10:06:29 -0700 (PDT)
MIME-Version: 1.0
From:   Rajaram Regupathy <rajaram.regupathy@gmail.com>
Date:   Mon, 3 Jul 2023 22:36:18 +0530
Message-ID: <CAD039W5J6Z0xH6Kyf2kg=vH-SDQMwZke2D0MeTyYXfcx+Mg5WQ@mail.gmail.com>
Subject: [ANNOUNCE] libtypec_0.3/lstypec_0.3 is released
To:     linux-usb@vger.kernel.org
Cc:     Jameson Thies <jthies@google.com>, colin.i.king@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Utils:

'lstypec' is an utility that displays information about USB-C ports,
partners and cables in a readable format based on =E2=80=98libtypec=E2=80=
=99.

=E2=80=98typecstatus=E2=80=99 is an utility aimed to provide functionality =
that
monitors USB-C ports of the platform and provides notifications to the
user on the port status. The utility is based on =E2=80=98libtypec=E2=80=99

Version 0.3:

Added Alternate mode VDO parsing
Added partner/cable alternate mode details
Added support to retrieve source and sink PDOs from local and partner.
Added support to read billboard descriptors
Added support in lstypec to parse and display PDO information
Added support in typecstatus to reflect billboard and power contract
of all ports
Fixed various spelling mistakes found using the codespell tool
Added additional CFLAGs to generate warnings and fix all warnings
Fixed various issues found by Coverity Scan static analysis
Added first cut of debian packaging and build shared library

What's Changed

lstypec: altmode vdo decoding, command line args, warnings, ufp/dfp f=E2=80=
=A6
by @Rajaram-Regupathy in #5
Fix various spelling mistakes found using the codespell tool by
@ColinIanKing in #8
fix some build warnings with respect to buffer overflows by @ColinIanKing i=
n #9
Various fixes for issues found by Coverity Scan static analysis by
@ColinIanKing in #12
libtypec: Add PDO support to lstypec by @jthiesatgoogle in #16
First cut of debian packaging by @ColinIanKing in #17

New Contributors

@ColinIanKing made first contribution in #8
@jthiesatgoogle made contribution in #16

Binary : https://github.com/Rajaram-Regupathy/libtypec/releases/download/li=
btypec_v0.3/libtypec_0_3.tar.xz
Source : https://github.com/Rajaram-Regupathy/libtypec/releases/download/li=
btypec_v0.3/libtypec_0_3_Source.tar.xz

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35AA26C4B18
	for <lists+linux-usb@lfdr.de>; Wed, 22 Mar 2023 13:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbjCVMvD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Mar 2023 08:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbjCVMvC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Mar 2023 08:51:02 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5554B27D6F
        for <linux-usb@vger.kernel.org>; Wed, 22 Mar 2023 05:51:01 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a11so8297630lji.6
        for <linux-usb@vger.kernel.org>; Wed, 22 Mar 2023 05:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679489459;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V4zsMeuzQNao0PgvbJ2DoVpAgLA+pjhic9zBtR0ghbg=;
        b=K+En3YWzioTu28qNMKCmHvOrj+TtTKASs+/cP8W+1KAouHthoD1C/wVbsytxZIZdC8
         HP893b9870dPf7uieqqEy0OGYRNxm7m2WOqiE5QLez2MsBhXeGkUL+EEHQmQcljC+5hi
         COoLi+iZxdYTtrrdtyRYKZO47TRLaMB7H6+wPT/oZdx/UJ0BOgh1M8SXr7RR5S9V2RE/
         mLOKayV2TNCsm4hRf8xCxA12QobsN4nVTnkLXRVrrOK+FBNu0bGSuIW/1RBPfhkFqP2d
         PwQwRywq+N0yXsiuUayZjN0FfyDxIn3TnXQqUGgBnK+R3y8msMkDBMgt/ejR4DOjU8Ng
         zIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679489459;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4zsMeuzQNao0PgvbJ2DoVpAgLA+pjhic9zBtR0ghbg=;
        b=L86KNfdR8q/v8rFzUHuALo+KoehdeDSfB+9xn3ldK2rbXeAbemcswK3/KZxRLsHBei
         iIhA9V2i1R0UQ2ED194jbQsBmnQIMVwZ0dx04jqBXA73QH8m0uky7iPU1LuTGVWh9DdS
         b6Tj4/tBPf4D/XNC4jK72KbQ9xknWiXpliZ+FbPabZnPTN6JjRfHY/+bdSvqc0MwRtHN
         lz9rNxThFwepPp/TEa2jBMYa2O1Y4W3u9I1qUp5WEY5NIO2jsZk6ElDOuy/Q4W+qCZ3T
         o2pCog8m4Zo8KL8lfZnDE5Vy1ELUMX4mcuzkdZaD/b97IEWXDerVueYFCz4McxMDxQMT
         RYsw==
X-Gm-Message-State: AO0yUKUd5d6jOQU4UOxEO36k/+opYnxa/2//Yyb1DgwBRo8CMlgvPAZZ
        52Fuvg9TFO527kDncp8IlWNI7HFR6bV8aBsOgCo=
X-Google-Smtp-Source: AK7set8Whu3dapfsJeMibRwUZe8uVImwX6Wiqnf10g9fBCqQcCeMficL5Rl8hH5yI4TxEE/8U+yT4aTOm8H/uHmH/RA=
X-Received: by 2002:a2e:95d5:0:b0:299:ac68:4801 with SMTP id
 y21-20020a2e95d5000000b00299ac684801mr2047273ljh.0.1679489459442; Wed, 22 Mar
 2023 05:50:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9bc7:0:b0:29c:c2bb:30bf with HTTP; Wed, 22 Mar 2023
 05:50:59 -0700 (PDT)
Reply-To: jessicapayne814@gmail.com
From:   Jessica Payne <georgemosesinfo@gmail.com>
Date:   Wed, 22 Mar 2023 05:50:59 -0700
Message-ID: <CABniHm67+b6h83kAZEKd8Gih7L-tzvZymUp1Q8YHxnMAeh-qLg@mail.gmail.com>
Subject: =?UTF-8?B?5oiR6ZyA6KaB5L2g55qE5biu5Yqp?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

5oiR5piv5p2w6KW/5Y2hwrfkvanmgankuK3lo6vlpKvkurrjgIINCuWcqOe+juWbvemZhuWGm+ea
hOWGm+S6i+mDqOmXqOOAgiDnvo7lm73vvIzkuIDlkI3kuK3lo6vvvIwzMiDlsoHvvIzljZXouqvv
vIzmnaXoh6rnvo7lm73kv4TkuqXkv4Tlt57lhYvliKnlpKvlhbDluILvvIznm67liY3kuI7lkIzk
uovkuIDotbflnKjliKnmr5Tkuprnj63liqDopb/miafooYzkuIDpobnnibnmrorku7vliqHjgIIN
Cg0K5oiR5piv5LiA5Liq5pyJ54ix5b+D44CB6K+a5a6e5ZKM5rex5oOF55qE5Lq677yM5pyJ5b6I
5aW955qE5bm96buY5oSf77yM5oiR5Zac5qyi57uT6K+G5paw5pyL5Y+L5bm25LqG6Kej5LuW5Lus
55qE55Sf5rS75pa55byP77yM5oiR5Zac5qyi55yL5aSn5rW355qE5rOi5rWq5ZKM576k5bGx55qE
576O5pmv5Lul5Y+K5aSn6Ieq54S255qE5LiA5YiHIOaPkOS+m+OAgg0K5b6I6auY5YW06IO95pu0
5aSa5Zyw5LqG6Kej5L2g77yM5oiR6K6k5Li65oiR5Lus5Y+v5Lul5bu656uL6Imv5aW955qE5ZWG
5Lia5Y+L6LCK44CCDQoNCuaIkeS4gOebtOW+iOS4jeW8gOW/g++8jOWboOS4uuWkmuW5tOadpeeU
n+a0u+WvueaIkeS4jeWFrOW5s++8myDmiJHlnKggMjEg5bKB6YKj5bm05aSx5Y675LqG54i25q+N
44CCIOaIkeeItuS6sueahOWQjeWtl+aYr+W4leeJuemHjOWFi+S9qeaBqeWSjOaIkeeahOavjeS6
sueOm+S4veS9qeaBqeOAgg0K5rKh5pyJ5Lq65biu5Yqp5oiR77yM5L2G5oiR5b6I6auY5YW05oiR
57uI5LqO5Zyo576O5Yab5Lit5om+5Yiw5LqG6Ieq5bex44CCDQoNCuaIkee7k+S6huWpmu+8jOac
ieS6huWtqeWtkO+8jOS9huS7luWOu+S4luS6hu+8jOS4jeS5heWQjuaIkeS4iOWkq+W8gOWni+WH
uui9qO+8jOaJgOS7peaIkeS4jeW+l+S4jeaUvuW8g+WpmuWnu+OAgg0KDQrlnKjmiJHnmoTlm73l
rrbnvo7lm73lkozliKnmr5Tkuprnj63liqDopb/ov5nph4zvvIzmiJHkuZ/lvojlubjov5DvvIzm
i6XmnInnlJ/mtLvmiYDpnIDnmoTkuIDliIfvvIzkvYbmsqHmnInkurrnu5nmiJHlu7rorq7jgIIg
5oiR6ZyA6KaB5LiA5Liq6K+a5a6e55qE5Lq65p2l5L+h5Lu75LuW77yM5LuW5Lmf5Lya57uZ5oiR
5bu66K6u5aaC5L2V5oqV6LWE44CCDQrlm6DkuLrmiJHmmK/miJHniLbmr43nlJ/liY3llK/kuIDn
lJ/kuIvnmoTlpbPlranjgIINCg0K5oiR5LiN6K6k6K+G5L2g5pys5Lq677yM5L2G5oiR6K6k5Li6
5pyJ5LiA5Liq5YC85b6X5L+h6LWW55qE5aW95Lq677yM5LuW5Y+v5Lul5bu656uL55yf5q2j55qE
5L+h5Lu75ZKM6Imv5aW955qE5ZWG5Lia5Y+L6LCK77yM5aaC5p6c5L2g55yf55qE5pyJ6K+a5a6e
5ZKM6K+a5a6e55qE5ZCN5aOw77yM5oiR5Lmf5pyJ5LiA5Lqb5Lic6KW/6KaB5ZKM5L2g5YiG5Lqr
DQrnm7jkv6HjgIIg5Zyo5L2g6Lqr5LiK77yM5Zug5Li65oiR6ZyA6KaB5L2g55qE5biu5Yqp44CC
IOaIkeaLpeacieaIkeWcqOaRqea0m+WTpeaJp+ihjOS7u+WKoeaXtuWcqOaRqea0m+WTpei1muWI
sOeahOaAu+WSjO+8iDU3MA0K5LiH576O5YWD77yJ77yM5oiR5Lya5Zyo5LiL5LiA5bCB55S15a2Q
6YKu5Lu25Lit5ZGK6K+J5L2g5oiR5piv5aaC5L2V5YGa5Yiw55qE77yM5LiN6KaB5oOK5oWM77yM
5a6D5Lus5rKh5pyJ6aOO6Zmp6ICM5LiU5oiRDQrlnKjkuIDkvY3kuI7nuqLljYHlrZfkvJrmnIno
gZTns7vnmoTkurrpgZPkuLvkuYnljLvnlJ/nmoTluK7liqnkuIvvvIzlpbnov5jlnKjmkanmtJvl
k6XnmoTkuIDlrrbpk7booYzlrZjkuobpkrHjgIINCuaIkeW4jOacm+S9oOS9nOS4uuaIkeeahOWP
l+ebiuS6uuadpeaOpeaUtuWfuumHke+8jOW5tuWcqOaIkeWujOaIkOi/memHjOeahOW3peS9nOWQ
juWmpeWWhOS/neeuoeWug++8jOW5tuiOt+W+l+aIkeeahOWGm+S6i+mAmuihjOivge+8jOS7peS+
v+WcqOS9oOeahOWbveWutuS4juS9oOS8mumdou+8mw0K5LiN6KaB5ouF5b+D6ZO26KGM5Lya6YCa
6L+H6ZO26KGM5Yiw6ZO26KGM6L2s6LSm55qE5pa55byP5bCG6LWE6YeR6L2s57uZ5oKo77yM6L+Z
5a+55oiR5Lus5p2l6K+05pei5a6J5YWo5Y+I5b+r5o2344CCDQoNCueslOiusDsg5oiR546w5Zyo
5Zyo5Yip5q+U5Lqa77yM5oiR5LiN55+l6YGT5oiR5Lus6KaB5Zyo6L+Z6YeM5b6F5aSa5LmF77yM
5oiR5Zyo6L+Z6YeM5Lik5qyh54K45by56KKt5Ye75Lit5bm45a2Y5LiL5p2l77yM6L+Z6K6p5oiR
5oOz5om+5LiA5Liq5YC85b6X5L+h6LWW55qE5Lq65p2l5biu5Yqp5oiR5o6l5pS25ZKM5oqV6LWE
6K+l5Z+66YeR77yM5Zug5Li6DQrmiJHlsIbmnaXliLDkvaDnmoTnpZblm73mipXotYTlubblvIDl
p4vmlrDnmoTnlJ/mtLvvvIzkuI3lho3mmK/kuIDlkI3lhpvkurrjgIINCg0K5aaC5p6c5oKo5oS/
5oSP6LCo5oWO5aSE55CG77yM6K+35Zue5aSN5oiR44CCIOaIkeS8muWRiuivieS9oOaOpeS4i+ad
peeahOa1geeoi++8jOW5tuWQkeS9oOWPkemAgeabtOWkmuacieWFs+WtmOWFpei1hOmHkeeahOmT
tuihjOeahOS/oeaBr+OAgg0K5Lul5Y+K6ZO26KGM5bCG5aaC5L2V5biu5Yqp5oiR5Lus6YCa6L+H
6ZO26KGM5Yiw6ZO26KGM6L2s5biQ5bCG6LWE6YeR6L2s56e75Yiw5oKo5omA5Zyo55qE5Zu95a62
L+WcsOWMuuOAgiDlpoLmnpzkvaDmnInlhbTotqPvvIzor7fkuI7miJHogZTns7vjgIINCg==

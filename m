Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE39576254
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jul 2022 14:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbiGOM4p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jul 2022 08:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbiGOM4o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Jul 2022 08:56:44 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D374E32EF8
        for <linux-usb@vger.kernel.org>; Fri, 15 Jul 2022 05:56:42 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id r25so1800416uap.7
        for <linux-usb@vger.kernel.org>; Fri, 15 Jul 2022 05:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sR2N5JBObuzTnQF7qD8OPJdvsMPk4Ri+jLBK0r6F9jA=;
        b=Ui/Y2Iz2MV4LopodNdQGnOXDElCf1lYa/OaAVmUfazmZqgEkFSq2I1MuVkY1nknDU1
         HmKN62nyntcUpkFeN6LaQCA5Y8uASQojjN+jpZQh+C5VF5b0SZuWmGKhrFo0qIzzdnbd
         7xC1wTqwtFFrk6SRRLGzNSrfJs3h3YuNPZKg3S6v31+Kq12Ov/E4QlwgGRe7T4CpXsEk
         Po/OWZM26WVcIVPlL+XnDNyLoyN1L0V+kPqbMcx0h43LGO/JgiYGn8sgFRpcFVBRR2iQ
         dWhjlr/JsmOcD7wIBGsgRy/ITv59HcPgiqd261zo4kYZJAHB0/MEovF4N3/P6I87UiPx
         7fDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sR2N5JBObuzTnQF7qD8OPJdvsMPk4Ri+jLBK0r6F9jA=;
        b=cq6Q9CG84CYttxLz1ZN94nginSqQ9CAHG1ZfOcx/MrOqdJ9R15zfWR4fBMm2vyCd7S
         6d32O5z+YUz5WKC7oHnVBhjtjjRoqCI95B1O05sYTgSRAPizLQyhOpshpYzzN86RVvew
         DcUSSPswaha1v7+euW7S+66D1FuV27WdGL2PQzzRuwq9iJKTIzKbzr840mjkI/GdVQmv
         weYah/BPX13NV3ZEbFZlYWx0bkmTnQhBYvta4ZmT7b1q3gSu9OxKj8ukw532IuPSB4NU
         oe/9UujXd6xntGDQGcJkUfmYxrwjJBgMbQJ+tYexs/oWapk6x4UcZTIKA3qU7luvljRB
         OQ2Q==
X-Gm-Message-State: AJIora9oNYCppxcE+hQvOhBs/sgANnVNkwg/Zk1Bt/JiDEiOKQvHHGJW
        43tuiPssLE65etvDegUc11Exg0tqt/eBe4+vuCE=
X-Google-Smtp-Source: AGRyM1sAr0lvDefEHda9rByGU4sL9kxWAjqWGTjheYbUTzwrkThH900C5gX3Z41GEerKepz0yOMOk8u2RXg37VXiKMQ=
X-Received: by 2002:a05:6122:1241:b0:374:a56a:83a8 with SMTP id
 b1-20020a056122124100b00374a56a83a8mr5437277vkp.11.1657889801477; Fri, 15 Jul
 2022 05:56:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:612c:229a:b0:2bd:1774:4e3c with HTTP; Fri, 15 Jul 2022
 05:56:40 -0700 (PDT)
Reply-To: cfc.ubagroup09@gmail.com
From:   Kristalina Georgieva <theodoreowen718@gmail.com>
Date:   Fri, 15 Jul 2022 05:56:40 -0700
Message-ID: <CAFBSWGemR-8HD66pNwS4sHEr1Yx_r=ca4RVbPTbTp+EOd35FDw@mail.gmail.com>
Subject: =?UTF-8?B?TEFCQVMgWknFhUFT?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,LOTTO_DEPT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:941 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [theodoreowen718[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [cfc.ubagroup09[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [theodoreowen718[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.0 LOTTO_DEPT Claims Department
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Cien=C4=ABjamais sa=C5=86=C4=93m=C4=93j!
Es jums nos=C5=ABt=C4=ABju =C5=A1o v=C4=93stuli pirms m=C4=93ne=C5=A1a, bet=
 neesmu no jums dzird=C4=93jis, n=C4=93
Esmu p=C4=81rliecin=C4=81ts, ka j=C5=ABs to sa=C5=86=C4=93m=C4=81t, un t=C4=
=81p=C4=93c es to jums nos=C5=ABt=C4=ABju v=C4=93lreiz,
Pirmk=C4=81rt, es esmu Kristal=C4=ABna Georgijeva, r=C4=ABkot=C4=81jdirekto=
re un
Starptautisk=C4=81 Val=C5=ABtas fonda prezidents.

Paties=C4=ABb=C4=81 m=C4=93s esam p=C4=81rskat=C4=ABju=C5=A1i visus =C5=A1=
=C4=B7=C4=93r=C5=A1=C4=BCus un probl=C4=93mas
j=C5=ABsu nepabeigtais dar=C4=ABjums un j=C5=ABsu nesp=C4=93ja segt maksas
p=C4=81rskait=C4=ABjuma maksas, kas tiek iekas=C4=93tas no jums par iesp=C4=
=93j=C4=81m:
iepriek=C5=A1=C4=93jiem p=C4=81rskait=C4=ABjumiem, apmekl=C4=93jiet m=C5=AB=
su vietni, lai apstiprin=C4=81tu 38
=C2=B0 53=E2=80=B256 =E2=80=B3 N 77 =C2=B0 2 =E2=80=B2 39 =E2=80=B3 R

M=C4=93s esam Direktoru padome, Pasaules Banka un Val=C5=ABtas fonds
Starptautiskais (SVF) Va=C5=A1ington=C4=81, DC, kop=C4=81 ar departamentu
Amerikas Savienoto Valstu Valsts kase un da=C5=BEas citas izmekl=C4=93=C5=
=A1anas a=C4=A3ent=C5=ABras
kas ir aktu=C4=81li =C5=A1eit, Amerikas Savienotaj=C4=81s Valst=C4=ABs. ir =
pas=C5=ABt=C4=ABjis
m=C5=ABsu Overseas Payment Remittance Unit, United Bank of
=C4=80frika Lome Togo, lai izsniegtu jums VISA karti, kur $
1,5=C2=A0miljoni no j=C5=ABsu fonda, lai ieg=C5=ABtu liel=C4=81ku iz=C5=86e=
m=C5=A1anu no j=C5=ABsu fonda.

Izmekl=C4=93=C5=A1anas gait=C4=81 m=C4=93s atkl=C4=81j=C4=81m ar
sar=C5=ABgtin=C4=81ts, ka j=C5=ABsu maks=C4=81jumu aizkav=C4=93ju=C5=A1as k=
orump=C4=93tas amatpersonas
no bankas, kas m=C4=93=C4=A3ina novirz=C4=ABt j=C5=ABsu l=C4=ABdzek=C4=BCus=
 uz j=C5=ABsu kontiem
Priv=C4=81ts.

Un =C5=A1odien m=C4=93s jums pazi=C5=86ojam, ka j=C5=ABsu l=C4=ABdzek=C4=BC=
i ir ieskait=C4=ABti Kart=C4=93
UBA Bank VISA un t=C4=81 ar=C4=AB ir gatava pieg=C4=81dei. Tagad
sazinieties ar UBA Bank direktoru, vi=C5=86u sauc Tonija kungs
Elumelu, e-pasts: (cfc.ubagroup09@gmail.com)
lai past=C4=81st=C4=ABtu, k=C4=81 sa=C5=86emt bankom=C4=81ta VISA karti.

Ar cie=C5=86u

Kristal=C4=ABna Georgijeva kundze

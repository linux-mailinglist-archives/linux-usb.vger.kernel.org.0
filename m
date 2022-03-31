Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAD6C4EDAA9
	for <lists+linux-usb@lfdr.de>; Thu, 31 Mar 2022 15:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236915AbiCaNiy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Mar 2022 09:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235124AbiCaNix (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Mar 2022 09:38:53 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764AC1FB51C
        for <linux-usb@vger.kernel.org>; Thu, 31 Mar 2022 06:37:04 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id l184so13398590vkh.0
        for <linux-usb@vger.kernel.org>; Thu, 31 Mar 2022 06:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ASNwqXc+Erq22q6HKuoW7c1SOpwzLs4uTDBGUqT2wrs=;
        b=pKYGqTd/bG3HCWze1Z7lqmAjlY/KrK4S6hshNdE5vTrxueI0LrniBuTanXSiEdDRNm
         8y3OlGOEvButA0FAyGfaYwl+CYEWH9l6h8NvsGqVIogYmWxl2+3dqBSLnHEqjkQoG/9u
         D5N0ifmgGSK04vaE09Jni5HhUKnn9MYbbiAfHmIGHyoLx77H0+uhQUYvaqgnwZ6W3Gmb
         Eq8k1/zV+3RAL1OtTyjLDyk86/KwP5LHeQLfxpSOIJTbn1+Nxa5hIxt4AjxZ4VifRd+t
         ojC7Y0EUqKNQgiQ/bQxedaXWyqE5T0Gx6f3BJICp4H4HMxnvvm7GBPF13BVBRTMysvxJ
         2upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=ASNwqXc+Erq22q6HKuoW7c1SOpwzLs4uTDBGUqT2wrs=;
        b=XUUbfK9Biu9GmduQf15R/8GHf+uuldIVh7NKAKltofnBThQaiQiFRZg0psCIb0xZET
         ue7Vrj5GQaJ2Cc8y/skeH7xdDPMosEqjYEk4XEIpL1IBAEFwGSZ/2ab66ujx31nrh60G
         e6RY0nYWTIfR3u/S2+v5oHgVgJnJKUTH94HpEVRE9t0mbouKxZIPHLvgBnEg1hMUFrYA
         /l5OWoMS8QBntLtVW3v6cnhJpiOTAbmvlwm+9noxJocaOL7cBNBh2RYHwQV19qnrg9D7
         eRlZ/8jMb58VooWu68x0QH+e5jXxFlqL76UFESxO/49fdVGKP2vfEJom7o1ZW671MhoP
         AMFA==
X-Gm-Message-State: AOAM532NX3bApEAWm8jiQFB+Pt8Kz5DtfQC3WASdE79ktzj42R4I5X2H
        HwvaQMjqyXE7hMaBXjcpKZPu4tbg5vrDTFzaMFo=
X-Google-Smtp-Source: ABdhPJyJWOaFVSGw+uDmTd2/RJv6nMUpiJQLj9DTg/P2wHpapLV4/DJlQjF0lmBFcrQuGXEDW8HBh18Z6FqHtOYiFm8=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr2043744vkf.35.1648733823545; Thu, 31 Mar
 2022 06:37:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3194:0:0:0:0:0 with HTTP; Thu, 31 Mar 2022 06:37:03
 -0700 (PDT)
Reply-To: susanneklatten64@gmail.com
From:   Susanne Klatten <yauaminu67@gmail.com>
Date:   Thu, 31 Mar 2022 14:37:03 +0100
Message-ID: <CA+pcR4QuV49zg+8O58Yb=VatbjHFNbDdL9ub6JBDCC2tsVX1VA@mail.gmail.com>
Subject: Darlehen
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,REPTO_419_FRAUD_GM_LOOSE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:a31 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [susanneklatten64[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [yauaminu67[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [yauaminu67[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  1.0 REPTO_419_FRAUD_GM_LOOSE Ends-in-digits Reply-To is similar to
        *      known advance fee fraud collector mailbox
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=20
Hallo

Ich bin Susanne Klatten und komme aus Deutschland, ich kann Ihre
finanziellen Probleme ohne R=C3=BCckgriff auf Banken im Bereich Kreditgeld
in den Griff bekommen. Wir bieten Privatkredite und Gesch=C3=A4ftskredite
an, ich bin ein zugelassener und zertifizierter Kreditgeber mit
jahrelanger Erfahrung in der Kreditvergabe und wir vergeben besicherte
und unbesicherte Kreditbetr=C3=A4ge von 2.000,00 =E2=82=AC ($) bis maximal
500.000.000,00 =E2=82=AC mit einem festen Zinssatz von 3 % j=C3=A4hrlich. B=
rauchen
Sie einen Kredit? Senden Sie uns eine E-Mail an:
susanneklatten64@gmail.com

  Sie k=C3=B6nnen auch meinen Link anzeigen und mehr =C3=BCber mich erfahre=
n.

  https://en.wikipedia.org/wiki/Susanne_Klatten
  https://www.forbes.com/profile/susanne-klatten

  E-Mail: susanneklatten64@gmail.com
  Unterschrift,
  Vorstandsvorsitzender
  Susanne Klatten.

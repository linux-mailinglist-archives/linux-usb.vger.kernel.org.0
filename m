Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70CED4E8486
	for <lists+linux-usb@lfdr.de>; Sat, 26 Mar 2022 23:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbiCZWUO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Mar 2022 18:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233852AbiCZWUN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Mar 2022 18:20:13 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4339AE0F4
        for <linux-usb@vger.kernel.org>; Sat, 26 Mar 2022 15:18:36 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id c23so11683407plo.0
        for <linux-usb@vger.kernel.org>; Sat, 26 Mar 2022 15:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Zn9hUS9+TJuj5BOExyChQI9blhGPAAw70oe9ehMu1C8=;
        b=YdLqSJCaxeDoszeI1HsCA6L9lCAFsdqkKTgMJhgEohIbCVwmPRCmFy4CNsYR071iWO
         S5NbX5OQ4JNIGQUxkjyxwcTeXJB7b8/hHIeBtNpTHbfKISnEWCCF/pliS466HeBsOeuX
         Jzf7AjanB8WJSpHcCDgWiHpDtLdlKtt2GdJldmey1Mzb/CeYDyFfoqskq2x5iC1TGAME
         VivtU3/YpdNVYPa/FiiJk4t7ldmdvX3o+5I44iHn3QQWHIfBen2+Eetkvs7IgMROi85M
         106KObN8lcOt8QJPSmTCEwwbFMjJ9WZE5gQMxqpucmBGajpi95VMRzmM7tmsaESRcNVU
         jL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Zn9hUS9+TJuj5BOExyChQI9blhGPAAw70oe9ehMu1C8=;
        b=kgcLqOarbYLKVk1ruP600DLHzoBU3JzinLJ1YcdO/7IHPtTFqiYs+GkPnvYad4yqLF
         c0kxD+L8aNoZMXzZu+/RsbJ9IDVwt6RZqTrfHwePrn8QtD2Asu9Z0xeZnSsyqwDXIPbx
         WE7BXV7RYmyW6Fu5bdAnf0PfpQYWK6oMJVk66+mtOTlL1/1/JvyBRHQ+kLuFS/JiInBa
         j3DPuAcPLlzLEDhznONVP5wDvW2xwb9otJi5509thOMmyz7jjaf9LuCJYrXEs/ZtsR0t
         0Nn8rQO+YyZvaH4JhK/LsS6XbU1PjjioYPfouuy7N9SyqWOKTqX3zcUqcaB+Qdbh6VZq
         bJLg==
X-Gm-Message-State: AOAM530stlHJmVJBoiH6K7gqpoNUoETnZxPdSsVvXCnakXMplzhhzyOp
        od3m7MrNze4s3AoHNDGzVgDMZ7G1DLlXbpx3mv4=
X-Google-Smtp-Source: ABdhPJy5WeI+eOzRwchW/gzPu0QVuZs9oQteWJWwpPeyLzCReiwjhNT0OFan94TG1wpW9VHmMmJNPT+Tfjbv1lavtyE=
X-Received: by 2002:a17:90b:1b10:b0:1c7:3413:87e0 with SMTP id
 nu16-20020a17090b1b1000b001c7341387e0mr20846365pjb.132.1648333115787; Sat, 26
 Mar 2022 15:18:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac4:db43:0:b0:48b:3c2a:99ef with HTTP; Sat, 26 Mar 2022
 15:18:35 -0700 (PDT)
Reply-To: chrisbonnivier@gmail.com
From:   CLARK POWER <alaminabubakar525@gmail.com>
Date:   Sat, 26 Mar 2022 23:18:35 +0100
Message-ID: <CAM-AdgUAeTcDEbqApQSWrk+ctAxUBY88ji9eAnw1TaUrApw_5A@mail.gmail.com>
Subject: =?UTF-8?Q?ANTWORTEN_SIE_ZUR=C3=9CCK=2C_WENN_SIE_EINEN_SCHNELLEN_DARL?=
        =?UTF-8?Q?EHEN_BEN=C3=96TIGEN?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:629 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [alaminabubakar525[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [alaminabubakar525[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
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
Ben=C3=B6tigen Sie finanzielle Hilfe? Wenn ja, kontaktieren Sie uns f=C3=BC=
r
weitere Details.
Vollst=C3=A4ndiger Name:
Land:
Menge:
Dauer:
Handynummer:

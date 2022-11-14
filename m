Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACC5627A68
	for <lists+linux-usb@lfdr.de>; Mon, 14 Nov 2022 11:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235824AbiKNKZT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Nov 2022 05:25:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236008AbiKNKZP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Nov 2022 05:25:15 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886BF1CB3D
        for <linux-usb@vger.kernel.org>; Mon, 14 Nov 2022 02:25:14 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id s24so12514266ljs.11
        for <linux-usb@vger.kernel.org>; Mon, 14 Nov 2022 02:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DXJ4D4qYExayAY3gp0cDZmCDHlHBEdp8gcPyYwHuuWc=;
        b=LvgwzCZdIDRsVWbcl9GrQ+utH7HjqpKGs5KlQn4NM16kBI1xGr1cp/sRSYU/NP7mJi
         mEZ9GsVvQtZIeLy+h5Nk3xSbFS83xVxygYZwjvrQLXjSnKJe/GomgONHPxdGCUeLjXm1
         sGhFutjQ8pM5UtjvbXNMVfBFbz4BOzgFUnnQYAa0aYMdFAs8eYjMb90J5XpVIBdDSci2
         YWPKSn2cJelagfCyJMO2OM52FIqERV5dmOs0Ab1fydxo25k7mL8F5lwxJ5mdjLfjqHvi
         faal0hGJzSGlRXqCb3tNpoG04cSM8wUbTVB2TQC93Kj8MijFfnVR/e/5HQOajZdq5uvT
         EDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXJ4D4qYExayAY3gp0cDZmCDHlHBEdp8gcPyYwHuuWc=;
        b=hCWRGzn3M55Relc+iLatcCP0IcrzMGJHk99SNLRvhMpAjh1l4+myVn2VR+tpersXXE
         lRgWaIoMpjhWfT0dfhUN1We8uo4IVeGFXpSTiQrWTYZMCNzB7+jsEzXczv177wQkvKYh
         YxRr0GdT7m/eNX4FBSRgF+L0DQMlXgTc2Qk+i15ZChhx4VVSEa75Qm8iGXAtm64b3ppe
         RCxnEXpt3RUGEQPrFbkIc4LGO75deh7Qtt2AFYoC5Lrsa0KgEddNHeChMDKbCdk/9tbU
         kaC32Lg+WQefJFtsAJfrh+AxICK/RqcGg/HwSYAkKcoJB3n0Zx0PESB4KTcrVWDuDwI1
         TyJg==
X-Gm-Message-State: ANoB5plPbkqPEAZ7W3mgFCAsfUe15mNFtkqRjM7MDD/B2dOumTCcOtmS
        P6K2K2VJn+ra5sxheZvTJJhnni/NVrkZgy0Jrdg=
X-Google-Smtp-Source: AA0mqf4H/3QFX6oGMTsUqFuIddvpUo/IhuXX/8yQGIUq8z0RnRfEi1ttijpEQc6SOGCplx66svcohxzal3HJWLDvdnI=
X-Received: by 2002:a2e:9042:0:b0:277:351f:bcdc with SMTP id
 n2-20020a2e9042000000b00277351fbcdcmr4080108ljg.351.1668421512762; Mon, 14
 Nov 2022 02:25:12 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6500:e9a:b0:171:344c:edc3 with HTTP; Mon, 14 Nov 2022
 02:25:12 -0800 (PST)
Reply-To: mrschantal2000@protonmail.com
From:   Mrs Bill Chantal Lawrence <mrschantalabubakar2021@gmail.com>
Date:   Mon, 14 Nov 2022 12:25:12 +0200
Message-ID: <CABHxZ1poBsBiYk96Uch2316ai=Bji_=L38fiPOBjVafvx42L9A@mail.gmail.com>
Subject: =?UTF-8?B?7Lmc7JWg7ZWY64qUIOyImO2YnOyekA==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM,UPPERCASE_75_100 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:22f listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5018]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrschantal2000[at]protonmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrschantalabubakar2021[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mrschantalabubakar2021[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 UPPERCASE_75_100 message body is 75-100% uppercase
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

7Lmc7JWg7ZWY64qUIOyImO2YnOyekA0KDQrri7nsi6DsnYANCuycoOyXlCBBVE0g67mE7J6QIO2Y
le2DnOuhnCDsp4DrtojsnbQg66y47KCc6rCAIOuQoCDqsoPsnoXri4jri6QuDQrsubTrk5zrpbzt
lZjqs6Ag7J2A7ZaJ7JeQ7IScIOuztOuCtOyLreyLnOyYpC4NCg0KQVRNIOy5tOuTnOulvCDrsJvs
nLzroKTrqbQg7ZWE7JqU7ZWp64uI64ukDQrqt4DtlZjsnZgg7KO87IaMLCDsl6zqtowg67CPIOq3
gO2VmOydmCDslbEg67KI7Zi464qUDQrsmpTssq0g65CcIOygleuztC4NCg0K6rCQ7IKsDQo=

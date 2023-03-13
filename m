Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 509E56B74DE
	for <lists+linux-usb@lfdr.de>; Mon, 13 Mar 2023 11:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjCMK63 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Mar 2023 06:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjCMK62 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Mar 2023 06:58:28 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D6B430D8
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 03:57:56 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id p2so7938081uap.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 03:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678705075;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OYOTx6MKssQVxsptL9eioMeZuDQaG7kJkv5PSGxD65A=;
        b=hsJU8x3MjeeiyYc2AB0d34ieU6fNVow+Y++fwhMskJ330cusr/f1ARQIgIXkkH9XHc
         MRBzDOaioaZOVNczYF62ffUDn/fpc8lsZo3ECqWdxjTS9g4U+HSLcDSLdVNT9bWJLrVh
         jmZOQONS4ZbOKnTdig+9ZJ/WbfbOOT9+AHxQ1LsB7hscKxN4m8jBXLf8udT1Edci+rfz
         4f8IUPG1TEGR5V/3bz2gGG+L7D2IjMAA1czECF0c+quHfMhstyS5jM2PeX5KsV/NxhVC
         8k4RK8YyTQ+PzR4a+qpINnKj7tMU2OPYKdKztmooDGMgBqOddSU8ZLpPONFx1idu0xsU
         Of1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678705075;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYOTx6MKssQVxsptL9eioMeZuDQaG7kJkv5PSGxD65A=;
        b=AoHw5OKgfspayZum5mnbonhAtITTektqRPpTFbvqgauYw/gpqqZ92Se5lsx8LkOqG0
         n2q1h72MCwbOCErIr5pfpcZbt2yFg+vPTB4UPD9omD7fOEp7cPPPS7CC1Gj33kCUKgAt
         wqofFgX4E6PBLSmor04tJ1klQd7KfHT+Z9OB7I4HnixzPavcCIKz29WXWRYsFxco3b8J
         vmKKChR2IQ8NXSgZQQc+sPatNpgIR/CvtK+DlDCHkDPDl9z/gi8Y2DBbdKTi3yfALlVw
         YUh3Y9evuhuSiYvzppL0kOOA5h2262S+QshU21OSom3c1vFW5vIs5TejH3+vGqgPGP9K
         9rSQ==
X-Gm-Message-State: AO0yUKW5sgXvdoWhGc0tVF3Abjb9yFNHPRQJQtrAH+AkOIC7GLVBoWIz
        tnlQfHAGbkY+0OPeNnnuX7Qn6cbPldFqJosXshc=
X-Google-Smtp-Source: AK7set8Vaw/x+ZV9mi5kd2t8+iYRTojILRtQ3EuxII2xYCTk7P7z7gK+/qsExLI27/NCuxtcQDbAgJ2ULbYPL+FDuAE=
X-Received: by 2002:a1f:c847:0:b0:411:ff57:d3b9 with SMTP id
 y68-20020a1fc847000000b00411ff57d3b9mr19057489vkf.2.1678705075313; Mon, 13
 Mar 2023 03:57:55 -0700 (PDT)
MIME-Version: 1.0
Sender: naziroubalat120@gmail.com
Received: by 2002:a59:a8a2:0:b0:3aa:4321:3961 with HTTP; Mon, 13 Mar 2023
 03:57:54 -0700 (PDT)
From:   Miss sherri <sherrigallagher409@gmail.com>
Date:   Mon, 13 Mar 2023 10:57:54 +0000
X-Google-Sender-Auth: tydX2gfwmdFsnxxbuZ7x4q1RD4k
Message-ID: <CAJyv1owd=++Sos3pPoJ0Uw66Qi9FZq=an=rMn-4Sk+=jaqL=Cg@mail.gmail.com>
Subject: RE: Hello Dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hell=C3=B3,

Megkaptad az el=C5=91z=C5=91 =C3=BCzenetem? M=C3=A1r kor=C3=A1bban felvette=
m =C3=96nnel a
kapcsolatot, de az =C3=BCzenet nem siker=C3=BClt visszak=C3=BCldeni, ez=C3=
=A9rt =C3=BAgy
d=C3=B6nt=C3=B6ttem, hogy =C3=BAjra =C3=ADrok. K=C3=A9rem, er=C5=91s=C3=ADt=
se meg, ha megkapja ezt, hogy
folytathassam.

V=C3=A1rok a v=C3=A1laszodra.

=C3=9Cdv=C3=B6zlettel,
Sherri kisasszony

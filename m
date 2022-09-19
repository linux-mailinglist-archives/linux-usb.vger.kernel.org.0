Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6214B5BCF4E
	for <lists+linux-usb@lfdr.de>; Mon, 19 Sep 2022 16:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiISOmK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Sep 2022 10:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbiISOlx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Sep 2022 10:41:53 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4A713CE2
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 07:41:51 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id s10so33474232ljp.5
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 07:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=d0PlgnOUHqWSrfkO999QdGVEewNSct5XFVIY4edfUR9ftwo0E48X3wTkFABK7njVWl
         pc+pqvjt8uZTUHFVmxUdWyIV0jyioote4Qc9uG4MeKO5QnDOcb5S2YMERDBtumq+FM16
         Jkd1ruRFpqGgQIU8JpBAyrWxJr0F/rcgsq4s2gViTSXpbCJ1jb4iczyAo6lMxdUJHmm9
         o4Vkm97K2O6OFti8R58Tf9Jun8T0lcKWn8yw5l6ynDUjovw2t6Hv5nzdHkmJflVFOVuc
         nqdFHAt3+ocRPqRRQcK4kxT44s4SafB9qUPUD6cXubnw1wqLjNk3EyuYc84ftZajcPyd
         993A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=cW5HMKWX/mzuNJqvHWAdiC34Zb8njNVg+tfN0py11QtzcIoOzMFsETdkNXuEoCB+2k
         Dr5nnqg91t6rFQnuizH6fVzRBKQUMWpue9XCB2ulpsS2dY4SSqRr+d0yxz+B8qaODY1K
         nT5/1yBSRMVx9SiGDcTb4rtzWGIKNilvWWdBOdZgPPrW2NnEjMaLFp9DHpVaecOvTvMx
         qS0n+XpBdCGK9SgNaExygezjxytHIgYEKeyb4qJOVs23KaQA3f2Y1D42iK1mpJos692H
         p1gxn0yA4Yt508RJlXDC0i8h/w7gcLqeZpN6e2byY+4CTphXeNIf5QBreEd2IRkLdChb
         YVFA==
X-Gm-Message-State: ACrzQf0XsZgY81h223J5WMe7RIaK2Pv9TwNTTKbOu7MvVrWOyp9yZSSB
        FHf13s4PAHKDy5kcUEt2kj5MIhWTkUEIufi5KJE=
X-Google-Smtp-Source: AMsMyM4HaPFTYyqbzzKv3txtFPlOFrJvujo7yZLM5g7J+82xgcqYAaa0GwuURYqLebryCZXCDbeDjpakuVlb7Acp6LI=
X-Received: by 2002:a2e:a274:0:b0:26c:39f6:7acf with SMTP id
 k20-20020a2ea274000000b0026c39f67acfmr5386584ljm.291.1663598510171; Mon, 19
 Sep 2022 07:41:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:7ad6:0:b0:1e7:20cb:db2e with HTTP; Mon, 19 Sep 2022
 07:41:49 -0700 (PDT)
Reply-To: kl145177@gmail.com
From:   Ken Lawson <cazareehzohg892@gmail.com>
Date:   Mon, 19 Sep 2022 14:41:49 +0000
Message-ID: <CA+u1qxvsik6EW9-X45gg5Bew816u+SXVY4BUR4-wta0NDxksLA@mail.gmail.com>
Subject: Did you receive the email I sent for you?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:235 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4605]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [cazareehzohg892[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [kl145177[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [cazareehzohg892[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



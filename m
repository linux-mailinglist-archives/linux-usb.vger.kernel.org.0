Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E69115BB973
	for <lists+linux-usb@lfdr.de>; Sat, 17 Sep 2022 18:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbiIQQhM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Sep 2022 12:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiIQQhH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Sep 2022 12:37:07 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3588330556
        for <linux-usb@vger.kernel.org>; Sat, 17 Sep 2022 09:37:05 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id a67so36860707ybb.3
        for <linux-usb@vger.kernel.org>; Sat, 17 Sep 2022 09:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=gmLtpZyDhCoapA9r0Gn9w+9NMSiTApaWi0GAjYNSPZM=;
        b=AVVjKcldcnE6A0KV1YXdSrZDsKCeBFvcQUIR2tHGnkC12D/DHC0D9ke2earZT54GsL
         4uIUKmI6igFFCn5E6T5rDVLpP0CRs1AtjMsrRG9Scsn5IS5cbqSJw6hoEWDETWn+HFWb
         pMQPn8tj48IxGmqdwE9z/XpW4qBOdLupSlg4Zbzns48no6Mz2Io5h5VtqLjcP2sVEezW
         oqaNN/AMP8SpnJQqJwahswi70UiRYFFrtGHaHkNNOz0JrGeOck4NHbz/fKwpn4IESj8b
         wU2Ffhnm16ObzGnioWP9bXrRClwEc9GnOK+hVf9EKwX7Hm5dKoIZkZai0jDTswLWfgFR
         E+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=gmLtpZyDhCoapA9r0Gn9w+9NMSiTApaWi0GAjYNSPZM=;
        b=Qfwb5CDx1JcxweclALe1OBjnuB0ohxchL7jXUva9AmFvei1OsQ9oVrCUL2tukZI0FC
         PxeZ+Hqso4G8eEIZSNJkmy1gamBzz3zIRbYaRWoUf8WGW3BNmHTpo5vyoLlLs2CPqgw7
         OFpZUWtnnVmIZtYLliVwt+ynzR45ja/T12LywxsmXuyfENbd4a5q+4VeO3kmhije40Zg
         +BLCu0s9PKH2x/KPZ/+rEgS7rE93Gczz5AkW9Hw5CQgvdH4QR3dUd+zJjVlw5p4S/sPc
         bUIRWP6DDNI47RrSOX4qpqiE1Xx2U5vwGagWQHcXx8wUPYMkLZ7aaTCtqLcnc2ZYSBpJ
         MolQ==
X-Gm-Message-State: ACrzQf2Hj/zAQ+nfQ2EXae1KIwiyU10FfzegkbqlHOZg/LHCNgl7PRHg
        nZ/sy+JM0sy5++K4q8Qem3bpYgkA+lXmp7C6ZJY=
X-Google-Smtp-Source: AMsMyM7Tsfegpv6gDv5PqV+iRsNcDABCidGwg8Dy9b6EyOLJdwdFKYD3Vw1Q4OIVYDSVuiJsOFElKgQoYfE1r8Bje8o=
X-Received: by 2002:a25:4286:0:b0:6ae:6f2b:a8d4 with SMTP id
 p128-20020a254286000000b006ae6f2ba8d4mr8889602yba.530.1663432624398; Sat, 17
 Sep 2022 09:37:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a81:65c4:0:0:0:0:0 with HTTP; Sat, 17 Sep 2022 09:37:04
 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   Kayla Manthey <amoussouakele@gmail.com>
Date:   Sat, 17 Sep 2022 16:37:04 +0000
Message-ID: <CADaibaV4zaaFbim-nePFkk2u-+ccwMgOcekG8y1MhmW2FwniTg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b30 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4977]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [amoussouakele[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [sgtkaylla202[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
Bok draga, molim te jesi li primila moju prethodnu poruku hvala

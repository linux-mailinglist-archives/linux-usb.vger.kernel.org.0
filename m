Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAD2B6D7601
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 09:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237240AbjDEH5P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 03:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237239AbjDEH5J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 03:57:09 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD69F4EEE
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 00:57:04 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5027d3f4cd7so237959a12.0
        for <linux-usb@vger.kernel.org>; Wed, 05 Apr 2023 00:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680681423;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2eIUIgQam+Znm92t75ub3SSql/5kD/CSnGjaZOIeRE=;
        b=ZFAmFQTn20XXB58Hm1LdXdWSQ5ZKxD4voHxxAhS1cKrInxf7DLRcTSbw0glAYuheNd
         QsgC19PfAnkNACoih4X9yWq8Ua2f3Z5aqpAwmyG7K5XHuwPNdYpOLvr+4dizYlmkwqvh
         8ippA6GSg6vwbKsguRd+gNlt6Q3d6qdPQH52wPe4yUNm7drYy8w79XnI6OkaMCxGYxXe
         MDkio/NlgHAyk3tGfHbZ8+FvtwIbKJyHeY9Hl3c4m/UBMxdY642/4m0lMYD1+lZcL9DU
         GTGlzj7aK8t/dfhFV0ZGCnZD6XTAnjOEHb+Mkw5/16dwcMVpicpYd4/+ImRJVe79/Ozv
         w6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680681423;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2eIUIgQam+Znm92t75ub3SSql/5kD/CSnGjaZOIeRE=;
        b=gzhOkkq8LZCp9bBYemBlLxk2XNB1Rkhb+0Zo2s4/S03myVwUFCXffFzrgLYb2SYtHi
         86MaahR7ZF0b1u6qjHP6Wt/sG8gEZ3sm9hSisECscCwOZGbwwedkwdcM6IG/ven390Zn
         NSU9h4tM4aAjv619mS3RO7bgMoKv7xsSy6Pa5zd6I61VZYairfS9JFC0FAZtO8XMVz4I
         8kqim0tpXA5Fu3fUq+B4sBJ3b5FuJbaupMN/A8AfYoc7mdmcjSRTEXDZ0B1AemAmK1Pe
         bmWVyGALxhUV/tG1bBEffoVXW+9ARGwRJ12/EXr2StU9VtuXKlG4maG64oLzzSp/7b87
         oOmw==
X-Gm-Message-State: AAQBX9dw9oNy0og7CGjZdrAfvBJunaq3cmxsGsSxEV+WDoeiPODmPW/m
        Y8E/ZNfGgP0jkSgQOSXCmUPX/FtIXN6pJVPb2Zk=
X-Google-Smtp-Source: AKy350b+6mlAYsE5jCYer29QJ01MP1yshNVCPV/yu1iTNStkeOVxzQSr9n/dP8VlK7PnohYB4ysIDujVG47xryzVK58=
X-Received: by 2002:a50:d781:0:b0:500:547b:4e1b with SMTP id
 w1-20020a50d781000000b00500547b4e1bmr691870edi.6.1680681423244; Wed, 05 Apr
 2023 00:57:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7208:2202:b0:65:e547:3943 with HTTP; Wed, 5 Apr 2023
 00:57:02 -0700 (PDT)
Reply-To: tamimbinhamadalthani00@gmail.com
From:   Tamim Mohammed Taher <cisskhadidiatou890@gmail.com>
Date:   Wed, 5 Apr 2023 00:57:02 -0700
Message-ID: <CAAYY=dZe5ZjJ2b2KEkYbGOEnyScbFaaGqjvb6EmPHE7Lypp0cg@mail.gmail.com>
Subject: RE:Saudi Arabia-Inquiry about your products.!!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.9 required=5.0 tests=DEAR_SOMETHING,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:52a listed in]
        [list.dnswl.org]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [tamimbinhamadalthani00[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [cisskhadidiatou890[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [cisskhadidiatou890[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  1.7 DEAR_SOMETHING BODY: Contains 'Dear (something)'
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear Sir/Madam,



Can you supply your products to  the government of (Saudi Arabia). We
buy in larger quantity if your company can supply please reply with
your products detail for more information.

Looking forward to hearing from you.

Thanks and Regards

 Mr.Tamim Mohammed Taher

Email:tamimbinhamadalthani00@gmail.com

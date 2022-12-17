Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C428564F925
	for <lists+linux-usb@lfdr.de>; Sat, 17 Dec 2022 14:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiLQNxa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Dec 2022 08:53:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiLQNx1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Dec 2022 08:53:27 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10F313F1B
        for <linux-usb@vger.kernel.org>; Sat, 17 Dec 2022 05:53:25 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id c7so4858658qtw.8
        for <linux-usb@vger.kernel.org>; Sat, 17 Dec 2022 05:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UleXfybfkB/Pp7XCNYIxvDWfUpO/oLpvjkUbrsMk7bk=;
        b=CZU36O8CLfgby+5KfU0HIWiFT6/ES/nAFon6gK/6m//5pkHD5C2QqYhRt6RgR06Fp8
         xEZoWZGdssgCe0CeGQlS8N4la7zGcK8UcXd9Kclr3yz0S3+dBRhCYwTRhJnn2G/e1y/0
         dGKjFwZWMyTkgo36jm/cHD2bdU4bEQFVZVApjF2PfFhaiwwn+E6qz/DdDqE/zk9INy5S
         zNJG7/bRh59O/rGyV5Oawj3MeP3Rr3+lDO/630EHd2vaelBDA8Iv+E+Usui+UJ0/WFoa
         S9xG4SCOV/am0Av0aFeYV9BdpOGnIxoSmqmIqCvzVCBD/3bHOCqj0qGZlXe3TQumN44n
         mPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UleXfybfkB/Pp7XCNYIxvDWfUpO/oLpvjkUbrsMk7bk=;
        b=KqskpH6Uv+nu/a42Q1nuCQC9edSf9nIZKylYk/H8hKfxn/qbywwLLBPZwMrc4CzU6E
         ay+4qyHXlg+ydiE9f6QFT1PZ0IC33hWF9BurupfTdOeSjumnl75RtPcYoKSoFlRW7E2e
         e1mJpIiHKOLZIdciqxWuu3xs9Mj/ms06aRNR2R+rlVezzzc0h5Huh5d2FVjVBISSQwmt
         Dyxuk4ftNcvd5FjohFB4gwCYx802I4BK3qN8yIrtBduHCRNoyAt+pQaenRDPPim0EpXX
         mrc0Ldi8qmn0urhEdimxeAEYsJqm/2Kt/AkKBLci3Yt8yrG62FRbWgO8dEXTRVkxyRtD
         upNQ==
X-Gm-Message-State: ANoB5pnRxMm6G9w2FnYnfTmw9EUG53kcEe7ohSogH28o+WGY0H3TK7mI
        R6e2dBkL8ePDC6V1mNFl6e+F5Gm772+u4yhAD2k=
X-Google-Smtp-Source: AA0mqf4XZPYuuDiEiE6MNsIBFfUgOno9/8TXEF61WREm5tAP07Bj/IH7AQ/EKqkYk5fotQ7dR0LdzPdWVF/4WPZ4WZA=
X-Received: by 2002:a05:622a:98b:b0:3a8:17bc:3c5 with SMTP id
 bw11-20020a05622a098b00b003a817bc03c5mr895559qtb.127.1671285204959; Sat, 17
 Dec 2022 05:53:24 -0800 (PST)
MIME-Version: 1.0
Sender: asfiss2018@gmail.com
Received: by 2002:a05:622a:38f:0:0:0:0 with HTTP; Sat, 17 Dec 2022 05:53:24
 -0800 (PST)
From:   John Kumor <a45476306@gmail.com>
Date:   Sat, 17 Dec 2022 13:53:24 +0000
X-Google-Sender-Auth: 99R6m2oYrjNxwuYY6gnQge8WqD8
Message-ID: <CAMhHx792FzSQWy_E_8ki17gDszJkaDchkuhC4HO4MuxA07yKwQ@mail.gmail.com>
Subject: Kindly reply back.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greetings!!
Did you receive my previous email?
Regards,
John Kumor,

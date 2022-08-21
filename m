Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0549059B33B
	for <lists+linux-usb@lfdr.de>; Sun, 21 Aug 2022 13:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiHULSN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Aug 2022 07:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbiHULSH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Aug 2022 07:18:07 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96D924F26
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 04:18:06 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id b142so6326557iof.10
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 04:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=jKDuPhJC986wm/PioH9rC+ElgZq8iQeftdELOGqclvQ=;
        b=nQmbgP1+51D7xwpqyZW9x0hkWzsTQ5CweF5wVhtP6dLtZVzsUeD3EXCM95EtSjwYtu
         IosBnMVhP/Wgz2lzVJV4pUjTImQEitgXusKjRdWoA7oIfXR5sMcB0x92qVKj4SiVxy6p
         bkilRrZ5xHIRPrprvdG+uIqTJXYMa96VNE9DKciBgYK5M3JHr2uDYeQ9aGjf+DO3mTFl
         v89uf/sq6gVk9YvFdny52bSRGTvhipPmeCbXckjZ17BeFDcas7K14JwzqGuCaCeLrrMq
         laNse2b65ljf1iebAxVEuedK/G77m05sufBNMo5zcmqnHQ0EYOGqjpFfGlfnBlb0LX0U
         3W1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=jKDuPhJC986wm/PioH9rC+ElgZq8iQeftdELOGqclvQ=;
        b=LFxR2WK2YTMADhNbE1evmVrTa70RRS8z8tWoELYJS0VGhHzkbQzoBA4m/ca9VoNE+o
         xYuaUFK1FarfirvygdteyzHs3psNL3GFP98pkOTryEIDLs6a5ZPYBdemcdzPFh0m+QkF
         1NiszVfNXffNYRzIQhAZCECpOD0pdrg215ESUxkBXsAN2N8xXOp4dJQJILzKv7DU57ka
         rL9OiK4SYq4jlmbXcQD2M8+O0hnL4qmjhXpkdqTo8XorAfizQJGjaggypr47nSQaeaIk
         CYPeARJrB0E+i15GXrMmF/SmNW2v6LF3Xq/ACVDxuq5sCHFrEjlWqj93BjZnw0u1Dw2n
         fYmg==
X-Gm-Message-State: ACgBeo2gmz+Mwjdt+7XQarWzjyASYqrfO+9nTjBfDAuPWbAcq8du7Sgc
        nWvF3ghxfGKmlC/mJm/UhAekPCfcZMoIaL3kg5RyYDC9o1ylcg==
X-Google-Smtp-Source: AA6agR5a7Spf7lbeo6bHhgneJhsPTuIEvF6eLrxq8096LUW3GrtjaKJF9jsFa++Ld+ZyqYjWPsI3a2KzpMSbCKXDAkA=
X-Received: by 2002:a02:ce88:0:b0:344:ccc5:1b4a with SMTP id
 y8-20020a02ce88000000b00344ccc51b4amr7148642jaq.141.1661080686065; Sun, 21
 Aug 2022 04:18:06 -0700 (PDT)
MIME-Version: 1.0
From:   James Dutton <james.dutton@gmail.com>
Date:   Sun, 21 Aug 2022 12:17:30 +0100
Message-ID: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
Subject: USB disk disconnect problems
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Say I have mounted a usb disk.
I then disconnect the usb device
Linux complains about failed writes etc.
I then plug the usb device back in
Linux still complains about failed writes, and does not recover.

How do I get Linux to recognise the reinserted usb disk and carry on as normal?

I know my suggested behaviour might be detrimental for some users, in
case one modifies the usb disk in another computer and then comes
back, but I would like an option that assumes it has not been plugged
into anything else.

The reason being, I have a system that boots from a USB disk.
Due to interference, the USB device disconnects for a second or two
and then comes back, but Linux does not see it and I have to reboot
Linux to recover. So, in this situation I wish Linux to be able to
recover immediately, without needing a reboot.

The physical USB device removal then reinserting reproduces the
problem I am seeing, so I thought it would be a good example to get
working, if we could.

Can anyone give me any pointers as to where to start with fixing this?

Kind Regards

James

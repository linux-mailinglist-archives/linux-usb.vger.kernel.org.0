Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1789B52A7E2
	for <lists+linux-usb@lfdr.de>; Tue, 17 May 2022 18:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242407AbiEQQ1M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 May 2022 12:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350909AbiEQQ1J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 May 2022 12:27:09 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B0327B1F
        for <linux-usb@vger.kernel.org>; Tue, 17 May 2022 09:27:08 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id v71so8251523ybi.4
        for <linux-usb@vger.kernel.org>; Tue, 17 May 2022 09:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ccR85oCJ3n64QomGkmAMizR2EHWGCZjrjkYYmZ/oKLk=;
        b=jr3h0kRqIAr2U/t1KHRb6Bp7w/KEizyUSzirCxTYcAWUh8Fxpgez0mssUwepdqRWOZ
         cX/xzlPixmqovW1e1X/g9fiNEfl/HF+NaKFShPURh9xMqFOTXx3lcl4myD5Smod3EenJ
         W+iZy6mnXPzggkiKAtrVjRE9qNc2q1+kPNGo+rW26JA4qBa4kdETmA7y5q3f1NhJn8Mo
         51hkB0MxSrUMpU9zZ8MnJSGsFrenh2hsLbrXFdloeXMVbIuxlcidzWGM2T5WA5sECYRm
         /SxrUQkECR8a2pz4pzBPQgQ+zaxCVFReOim8yDQlC7DImXft6hWa45+6mWOcu33cQmKN
         gi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ccR85oCJ3n64QomGkmAMizR2EHWGCZjrjkYYmZ/oKLk=;
        b=jp0+zyi0Je3am+k+EmGAyxIZH2NO+lppFRZY4buhOIAVfbQB8ZHx2Th/YkW/HMgw1w
         Qn7a64QzH3WzaZAVwnKW73u/ZEAl/EMXfKh/JMX+q/8uP5TUEshYZwjycFWw6Hw32ir+
         o7AvQSR5bcGGCkxo6a7CLvLbU2BsRueMr5txRBpU8QbdlEOIpNr5nJsSaJNhKBnpBxOo
         /LTC5hoUc2jUdIB9/2GrqqTYYElWqBIoxz8p1aAVJPW29ieezGwfG2wZr0e7cUYgjPKV
         j6XDVjdckCeABrt4zpNker60hy4GSWbixqk44hBiaqrj5PlN43Mgh3NXS39GiNzVXQvj
         2QOQ==
X-Gm-Message-State: AOAM530PQg6d1DDEJMc+Ili6YyaLLtR/kkZNqVg2O/kFsQkGIG5wE+NE
        Tw2Ag4gf0gphAixAd7osn9yVeZB60ZmO6ggNuFoazYWIwu4=
X-Google-Smtp-Source: ABdhPJz7l8r9BQvdxk+0NqDycjSBP1ZDsdtlxEo63akqHx/nFki/z9X9cq+nWqd7G2vabPOrxUlVJ5dIPPTFp0Vpy+4=
X-Received: by 2002:a25:4944:0:b0:648:a796:a2 with SMTP id w65-20020a254944000000b00648a79600a2mr25044887yba.123.1652804827467;
 Tue, 17 May 2022 09:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAJixRzqf4a9-ZKZDgWxicc_BpfdZVE9qqGmkiO7xEstOXUbGvQ@mail.gmail.com>
 <YoPGdxtPqCsAiM8M@hovoldconsulting.com>
In-Reply-To: <YoPGdxtPqCsAiM8M@hovoldconsulting.com>
From:   Gary van der Merwe <garyvdm@gmail.com>
Date:   Tue, 17 May 2022 18:26:56 +0200
Message-ID: <CAJixRzoZ5NeTE+p0gpUsnskmHu+AgEPTPf7U9g2s68obt0SAkw@mail.gmail.com>
Subject: Re: Bug report: pl2303 unknown device type -
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
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

On Tue, May 17, 2022 at 5:59 PM Johan Hovold <johan@kernel.org> wrote:
> Heh. USB 1.01? I'll add a workaround to continue treating this as 1.10
> (and an HX device).

Thanks!

> Can I credit you using name and email in the commit message for
> reporting this?

Sure. In hindsight, please use my work email, as it was done for work,
and during work time: gary.vandermerwe@fnb.co.za

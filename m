Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A471652596
	for <lists+linux-usb@lfdr.de>; Tue, 20 Dec 2022 18:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233717AbiLTRcc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Dec 2022 12:32:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233923AbiLTRc0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Dec 2022 12:32:26 -0500
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E57141A3A3
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 09:32:24 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id s25so3029706uac.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 09:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UAJ6ozZf1vu2YYAWt3gFC9VQjMPZpc1AMSbQVjo7i1o=;
        b=gqNpcDSXd9iWJlYUJaZWTXX3W+vCHukpVRLhAaqrlQ+19MKELs0kkmqcKLzUonANkU
         ieOS9elD7sGFkMh/CKr9xRNK8TZDV36VRXUSe7S8xh3oJYV0pcw4/l5jy6fM2gTMm8jZ
         TblIKBFxsChHQFo7eDzhsjYEFW5FPCKDbaOrtTCMNT1ODtFI/ZsITFsdlMOO6A+H82o6
         AoyO1KzZc/5NxGkGXLW+Q4P2s/M4JBl282hLQsiG+6YW57zaXc3Ht32XiKn9m6mtX+T9
         IIeazx9Q1vrZxXM+QXZxIfV63ig1aQNLhX1nOI3pVIMaxONugcAyeDsrQ5qhgoSbbJiH
         Zikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UAJ6ozZf1vu2YYAWt3gFC9VQjMPZpc1AMSbQVjo7i1o=;
        b=6RXeshnGL9O5AkHWy9nh5iR0glyE22PwfG/iD3seyPIwhl/T9Vqc5mkLlXyXVL1GHi
         o1jFLn3ZG9eQqZ30gaENFobyEiGXEqzpLGzVaCtt2wpCilXzH0IfO/POwMfCWhCUDAvN
         uMQMNcIPD1a1+jCOGLo0pRFQm0I55+vR1JIQsCwzn8VA3GeR2mfs42T/AR7ug6Ao5dC2
         x+BN4D76h2f3bE4hY5/1Aq09jekkdjAAEZ9KwnU6iEDm9v1rVrfMrx6DNDdq+mSvCgid
         EcWaxT3MUBC2NUU+NYusRozcyDxg9V5T/420kO81K1Iqntyc8LGp2aH+PNVkEkW2Pr3s
         vtfQ==
X-Gm-Message-State: ANoB5plGxEOocCVxgqCEz6G5ok0UY+iFgqajXPdX0wUxrbdzsPXBM1/5
        +HyRHVvzu9gjEa6I5yIFXELGVIOrk2wkjFxqtrXBZQ==
X-Google-Smtp-Source: AA0mqf5kqYpjjbeudDgMyNOjausfNjbZmWzkWJCBlhwfP1+5mUAvDokT6sGoWku9veOqPqbeJIqGoG2CUdnsG7kWaW4=
X-Received: by 2002:ab0:1054:0:b0:418:f8ed:3313 with SMTP id
 g20-20020ab01054000000b00418f8ed3313mr42866251uab.0.1671557543767; Tue, 20
 Dec 2022 09:32:23 -0800 (PST)
MIME-Version: 1.0
References: <20221219191855.2010466-1-allenwebb@google.com>
 <20221219204619.2205248-1-allenwebb@google.com> <20221219204619.2205248-8-allenwebb@google.com>
 <Y6FZniRwpogJ0HaG@kroah.com>
In-Reply-To: <Y6FZniRwpogJ0HaG@kroah.com>
From:   Allen Webb <allenwebb@google.com>
Date:   Tue, 20 Dec 2022 11:32:12 -0600
Message-ID: <CAJzde05B0Ag1e7Lpbg5hKK+2SYj0JYLKLkMQNoag3MBXKWUd6g@mail.gmail.com>
Subject: Re: [PATCH v9 07/10] modpost: Add -b option for emitting built-in aliases
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 20, 2022 at 12:43 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Dec 19, 2022 at 02:46:15PM -0600, Allen Webb wrote:
> > This adds an unimplemented command line flag for writing the built-in
> > aliases to a file.
>
> If it is unimplemented, why add it?

This is a fairly self contained change even though the code that
populates mod->modalias_buf is in the next patch. I could flatten the
two commits, but I was trying to keep this to a single logical change.
There is somewhat of a chicken and egg problem here. If the other
patch comes first it will be dead code, if this comes first it is
pretty much dead code.

>
> And this needs a lot more description as to why you are changing this
> here, as well as documentation for the flag you added, right?

I might be missing something, but I don't see an obvious place where
the other command line parameters for modpost are documented, so I
will add a comment inside the case statement unless you have a better
idea.

>
> thanks,
>
> greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98647607D90
	for <lists+linux-usb@lfdr.de>; Fri, 21 Oct 2022 19:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbiJURa6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Oct 2022 13:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbiJURa4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Oct 2022 13:30:56 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10AD2F01C
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 10:30:55 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id h10so2271195qvq.7
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 10:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BKY1L+lJIm4gPIxJdoGGbk/A7TDtsvdp4yyzJCKLBqM=;
        b=JRbXxQcsHuXNTo4JRd4r631w0scHbQpGmP/39nHpYieavieNk4jUPngmABP9sTEHFj
         6PWhkBdteDM0nqif6TGLlmPSRtEApQVMhKNR88q3OEInoDgh8NwHSxNcSU52UzHR6sY8
         dFofSJNlVbDCkSLnOAr4UJ64KMsV2vvhJZcWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKY1L+lJIm4gPIxJdoGGbk/A7TDtsvdp4yyzJCKLBqM=;
        b=4xaJMuy9z3gUxPEP9nr583HvIoaEpbMEBLpDPpC2GJ9f4W47zMcrUUFAfGzGfIJ88Q
         UU7/CpqVeQBN2lPmarHs3UHMUwMFO9iOir6s3GKqzQf1R8TC8Zr8cYu301cFEk3cheA0
         YoyZAk9SsnlUnLhFTwGVwEHOdy2+cvft0to4OmgJXaOMxPc/BESWVXGz54bVChlaSTel
         VkoPaWmxdLL7Dn/FFdFYxaye6Mr1qE7Os6jOuXWS7DXjYm34v70ZQWgLo4NUFoyl3c8c
         3LqroMKy7yPeWrofn9cXqPpMcBiwGRmiwcRGLOx5e8uUR2bggPbGcmvh7CpShIZfCGvy
         LEpQ==
X-Gm-Message-State: ACrzQf1r6V/9RcHJlFaWEZJjfXpkYZeNqV/CUC9ZRylxSqq3ZQHZShxY
        3Z9l530pcmGJyLfw8219oJubdUdzFWPXwA==
X-Google-Smtp-Source: AMsMyM5mhwxOOqkBzQFQTa9I5+p8ZhshRcBZP42k673flU/wGpVvUBOXVMg4o05BhzLo9wVCmnRObw==
X-Received: by 2002:ad4:5941:0:b0:4b4:46b5:e36b with SMTP id eo1-20020ad45941000000b004b446b5e36bmr17231242qvb.33.1666373454528;
        Fri, 21 Oct 2022 10:30:54 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id h24-20020ac85158000000b00304fe5247bfsm8269573qtn.36.2022.10.21.10.30.53
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 10:30:53 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-36847dfc5ccso30759057b3.0
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 10:30:53 -0700 (PDT)
X-Received: by 2002:a81:6088:0:b0:361:52e4:dec8 with SMTP id
 u130-20020a816088000000b0036152e4dec8mr17641670ywb.352.1666373453275; Fri, 21
 Oct 2022 10:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221021064453.3341050-1-gregkh@linuxfoundation.org>
In-Reply-To: <20221021064453.3341050-1-gregkh@linuxfoundation.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 21 Oct 2022 10:30:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wggc19mf+WR=eg7h7MfVVNbE1c8b5vcOc6wmDASNTMddg@mail.gmail.com>
Message-ID: <CAHk-=wggc19mf+WR=eg7h7MfVVNbE1c8b5vcOc6wmDASNTMddg@mail.gmail.com>
Subject: Re: [PATCH] USB: gadget: dummy_hcd: switch char * to u8 *
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jakob Koschel <jakobkoschel@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 20, 2022 at 11:44 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> The function handle_control_request() casts the urb buffer to a char *,
> and then treats it like a unsigned char buffer when assigning data to
> it.  On some architectures, "char" is really signed, so let's just
> properly set this pointer to a u8 to take away any potential problems as
> that's what is really wanted here.

I think you might as well also remove the cast that was always a bit odd:

                buf[0] = (u8)dum->devstatus;

although maybe it's intentional ("look, ma, I'm truncating this
value") because 'devstatus' is a 'u16' type?

I suspect a comment would be more readable than an odd cast that
doesn't actually change anything (since the assignment does it
anyway).

Or maybe people wrote it that way on purpose, and used that variable
name on purpose.

Because 'dum' is Swedish for 'stupid', and maybe there's a coded
message in that driver?

                  Linus

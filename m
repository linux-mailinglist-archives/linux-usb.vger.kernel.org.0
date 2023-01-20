Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA96675EAF
	for <lists+linux-usb@lfdr.de>; Fri, 20 Jan 2023 21:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjATULR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 15:11:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjATULR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 15:11:17 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B81F1287F
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 12:11:16 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id n85so2962327iod.7
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 12:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HRqU9uEBTqzhDiWyPAG5GchN799BBQRFlOwkfwzE5+8=;
        b=XalxLION0iG89LP1bqX3jc+pOUHoY39NkgqmsISKgQsFnV0BozjJw8zs7wrAeGEllH
         KxkbKFzj7PIlMwoFnX8vj0hzMSOYjUehwgL5dYgotnBsQOlyGwfF4X6KK2tNRE1XHMwh
         R2hT7qcUX5il3jWHMOCROBfBvSmvAdpuIXBty6QMzyWBAFj5hDhXdrlg7TcL7vxw+OV9
         r0zqejByo+WXzylrgfCT9SD2OuTc/1A7Mt3RZr1waUVmfWXbdD3tiHaK2yywuQfoRomp
         ONKEyKV8EaYwTuuEcvQ1YbjT4Vdj6pWiqoNc15nPdbz6ier5tVV5C5ZpXRiYX/nThp5q
         veBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRqU9uEBTqzhDiWyPAG5GchN799BBQRFlOwkfwzE5+8=;
        b=V3M8y40dn/F88CbPQcpL5vQosAQ4+MeBxSGYIkfrekQ5ir1xLFkK5G5dtlu+462H8s
         HjAepWfCiLLsz3hINzdcwlCyjsmYUBJKGQ5p1Mz3NJ/c9Au9+rmIXvrlBU8Pj264XzQK
         O4OLH9sBztq8tZdJ12a+iJdRw5tyfx3dEvhHLLQ0gSQqHkgaGxw8elwGkC446qFtHaHT
         GBk448ShiqSx1YcjHA93Le18x/nZRyjLDYYka2ohmYrdcN0c0Ll34OSN5DiMM6sLN909
         ucnnVUGvy4zx+7tZGNxnrz0loP6FrEyKGmfqumniGfDw8YvPv133nyCwinQgWsShLtAa
         B4lQ==
X-Gm-Message-State: AFqh2kopd8JGlvLFw6RcmypQIwsZvRwAoseRCvR7MeK8rQGVu7mmMf9Q
        b3G9kLS/eS5EAtkCRp8LxDkNUyf/hZuoTFJ3ADwVrA==
X-Google-Smtp-Source: AMrXdXsyHF+kdJryuvQKVYsxIhQ9BgXT893vLRtX10dVbY4MlCqk+9xKxeIscyJz/ZJijI41e1pk3DF2B1bQWgmIhU4=
X-Received: by 2002:a05:6638:419f:b0:3a4:e0b3:e6c7 with SMTP id
 az31-20020a056638419f00b003a4e0b3e6c7mr2056913jab.116.1674245475605; Fri, 20
 Jan 2023 12:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20230117131839.1138208-1-maze@google.com> <Y8rrGaaDnIQyBSD0@donbot>
In-Reply-To: <Y8rrGaaDnIQyBSD0@donbot>
From:   =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date:   Fri, 20 Jan 2023 12:11:03 -0800
Message-ID: <CANP3RGdkOqtuV1bRq5wFmpr0Lw5yTa0L=mU-hJgim+Skd=iOVQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: fix potential NULL ptr deref in ncm_bitrate()
To:     John Keeping <john@metanate.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lorenzo Colitti <lorenzo@google.com>,
        Carlos Llamas <cmllamas@google.com>, stable@vger.kernel.org
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

> This looks like the wrong place to fix things - if this case is hit,
> don't we go on to call usb_eq_queue() which can't be valid if the gadget
> has been destroyed?
>
> I don't see how cdev->gadget can be set to null without cdev being freed
> so is this actually a use-after-free not a simple null-dereference?
>
> My guess is that somehow the gadget is being destroyed while the network
> interface is held open (we've seen similar issues in other, non-network,
> gadget functions), but I don't know enough about the network side of
> things to know how to cause that from userspace.

I'm still waiting on confirmation of whether this fixes things.
So far we've seen it crash twice without the fix...

I don't know what triggers it - it's being triggered in some huge
automated test framework.
Whether the issue is lack of bind, or a too early gadget unbind... or
something else...

As mentioned in the patch, I'm not entirely sure if this is the right fix...
I certainly don't claim to understand the usb/gadget stack.

It does seem like usb_ep_queue() at least has some protections in place...
though no idea if they're enough - and whether we'll hit a
WARN_ON_ONCE now instead?

Honestly I don't even understand *why* we're sending out this speed
notification out of ncm_close...
(and if we do send speed notification of out ncm_close()... shouldn't
it always just say speed 0?)

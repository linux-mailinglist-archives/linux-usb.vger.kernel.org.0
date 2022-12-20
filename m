Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B19D6652941
	for <lists+linux-usb@lfdr.de>; Tue, 20 Dec 2022 23:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233909AbiLTW7d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Dec 2022 17:59:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233881AbiLTW7b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Dec 2022 17:59:31 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90461EC7B
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 14:59:30 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id gt4so13951243pjb.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 14:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ICLf78g069YlarZFOH/RAfq/kPyBj0gwwFdq8yqL+kY=;
        b=an3nNST4k6pANUJ6FHis5g0oN1arkIBWn4ilAFg7EcBcScdjimkNix6gTFVAI9JnNw
         7e0mA8rrAfcNnyGqGetv/m4b5N2sLG0C6L/d4Oa/yZxbJBoHV3EKHdTSsBhWdvfGKTkj
         ricVyuRRxm/AtVEcR+jzx1uqGNvOv4tIJHWcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICLf78g069YlarZFOH/RAfq/kPyBj0gwwFdq8yqL+kY=;
        b=Vaqk/NPoph5Rbn+j2mM0yInArZ/krW9QK4FQpDKJIbDr7thZ4FCFMTaa/B4iS7eMkM
         i7hJPxCNTTTKeiTrALKxVTdEvrm2Zo0cpGPPzVS91f37rPhOALxKxz2SNCVcfoXRtXNF
         xT22ALUvsO4TpnyBiFGq6D2TBsFhR7HnMF/l46TOGeun+bdudL+0k+xmdnqm5blpFp7o
         SRCGyi9Y+XtH0ReWBvl9Jp0HmRKhJYvYaBEiZvEvRlFzlsP2rOQ5WarmVKTPxJcnZrnH
         HUtHZ9CgW2/Jo8Fr41yXm+c1oGISACsfQngmfG8lWZc1AYNkrK0swH+X5vdBzxDrdGl+
         x4kg==
X-Gm-Message-State: ANoB5pnOC6uFHQgnAfQWgpk/hIJS13LWNt0H8jD6M0CJ8uOpqh7ldc2A
        z+rBj2U4218THIMPmO2+X5tWp+Az7f1u7GYgG0w=
X-Google-Smtp-Source: AA0mqf5bUVfatTp7MtF8uEuu+TFL0gEAR3j0WwAZKgZPBgL4mVFoZ2Gxk66iLV6Ykb5ESmA3SpUPQQ==
X-Received: by 2002:a17:902:c948:b0:190:cd21:1ebe with SMTP id i8-20020a170902c94800b00190cd211ebemr40913999pla.1.1671577169870;
        Tue, 20 Dec 2022 14:59:29 -0800 (PST)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com. [209.85.216.42])
        by smtp.gmail.com with ESMTPSA id jf14-20020a170903268e00b00189a50d2a3esm9813651plb.241.2022.12.20.14.59.27
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 14:59:28 -0800 (PST)
Received: by mail-pj1-f42.google.com with SMTP id gt4so13951126pjb.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 14:59:27 -0800 (PST)
X-Received: by 2002:a17:90b:1489:b0:219:8132:70db with SMTP id
 js9-20020a17090b148900b00219813270dbmr2554503pjb.183.1671577167363; Tue, 20
 Dec 2022 14:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20221214-uvc-status-alloc-v3-0-9a67616cc549@chromium.org>
 <20221214-uvc-status-alloc-v3-2-9a67616cc549@chromium.org> <20221215124837.GA19113@lst.de>
In-Reply-To: <20221215124837.GA19113@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 20 Dec 2022 23:59:16 +0100
X-Gmail-Original-Message-ID: <CANiDSCsA-Rq4xSLUsAazv=ZjYDOAJNDqFjbNKDno1VzZmUrCDA@mail.gmail.com>
Message-ID: <CANiDSCsA-Rq4xSLUsAazv=ZjYDOAJNDqFjbNKDno1VzZmUrCDA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: uvcvideo: Do not alloc dev->status
To:     Christoph Hellwig <hch@lst.de>
Cc:     Max Staudt <mstaudt@chromium.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ming Lei <tom.leiming@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yunke Cao <yunkec@chromium.org>, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Christoph

On Thu, 15 Dec 2022 at 13:48, Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Dec 15, 2022 at 11:57:19AM +0100, Ricardo Ribalda wrote:
> > +     /*
> > +      * Ensure that status is aligned, making it safe to use with
> > +      * non-coherent DMA.
> > +      */
> > +     struct uvc_status status __aligned(ARCH_KMALLOC_MINALIGN);
>
> This should be ARCH_DMA_MINALIGN, not ARCH_KMALLOC_MINALIGN.
>
> Note that without an __aligned tag on the next member as well, those
> next members might get cache corrupted.
>
> >
> >       struct input_dev *input;
>
> .. and without also aligning the next member you'll might still
> corrupt everything adter the DMAed member.
>
> That's the reason why I generall advocate against playing these
> __aligned games as they can easily go wrong if someone reorders
> the structure.

Thanks a lot for the explanation. I agree, we should keep the
allocation as it is :). Sorry for the noise

Best regards!



-- 
Ricardo Ribalda

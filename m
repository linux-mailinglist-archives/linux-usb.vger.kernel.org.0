Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5959664E856
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 09:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbiLPIz2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 03:55:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbiLPIz0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 03:55:26 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A81F4389D0
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 00:55:25 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id u5so1803817pjy.5
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 00:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KIfEz81U3HVJ4JhGoBJFjs00sIawE7R6JvvebcBdLcA=;
        b=b3xVmZlRg/35qPV3zrDnmMxZkqYqnSqQ92eIj7WqDRIoee+cdDAs4Ul/3HBALrIqqK
         ubUyl/4ZMRICi20VLa/qyvnIhVeNsUPHmnSesSDprBIlo+BBr5vWDWITYMiGY9Au1vCQ
         HSSzbuGh0EU0goHPY7eXRo96OHIB0DXuXTeNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIfEz81U3HVJ4JhGoBJFjs00sIawE7R6JvvebcBdLcA=;
        b=8NXfjVmZpbCFcPlIvqjDiWbVRWe5zsLula8XFbDad3HSh/FPg8jmxy/Grmxn1G7snj
         ch1KciJ7AOIH34fv+DvBBuNvmtNfOW5Xm4kyf6NExYnifjKmmyDF56KmmqOcM1/+JaDH
         iLuptn5QwJF3H2bm4tD1RW4MmcF/6EmTQ1gQ2J4Y7SIc9Wa/z2gV6CXMytTUgz++QbWk
         mmtn3XZfMObp10J9FoFPtcA5BWIthqlKAwHdrO6hE5p/QOQ1awagilpfcju7U0UCafFf
         wMTRlELdcY7nSCpVLiOxpXir5khyl7Mas+dpnPfNrUNPMt1nG7I4yRYOf9UncAreXEvi
         D51Q==
X-Gm-Message-State: ANoB5pmwUFM2CK9PVTFsmu+KvqaPXqrEZfvg8BBLxPmK2xCKCT+HY9l2
        s+I7RGdwgMxwCNLYmaCQAQHD6Scs4tCYel7Y5CA=
X-Google-Smtp-Source: AA0mqf4poQN56akJ4j3eEst9rsUf7XO6pRecEk1n5rEb3OZ8ugZ8d5Tz1007bbWY8XcflN6FCdoY/Q==
X-Received: by 2002:a17:902:eb83:b0:18e:8223:6447 with SMTP id q3-20020a170902eb8300b0018e82236447mr24196164plg.22.1671180924985;
        Fri, 16 Dec 2022 00:55:24 -0800 (PST)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com. [209.85.214.176])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b00189adf6770fsm1034255pli.233.2022.12.16.00.55.21
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 00:55:22 -0800 (PST)
Received: by mail-pl1-f176.google.com with SMTP id 17so1730207pll.0
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 00:55:21 -0800 (PST)
X-Received: by 2002:a17:90b:1489:b0:219:8132:70db with SMTP id
 js9-20020a17090b148900b00219813270dbmr697624pjb.183.1671180920433; Fri, 16
 Dec 2022 00:55:20 -0800 (PST)
MIME-Version: 1.0
References: <20221214-uvc-status-alloc-v3-0-9a67616cc549@chromium.org> <Y5s+kuxCAtS8Eixj@rowland.harvard.edu>
In-Reply-To: <Y5s+kuxCAtS8Eixj@rowland.harvard.edu>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 16 Dec 2022 09:55:09 +0100
X-Gmail-Original-Message-ID: <CANiDSCudMRATbHU4=hyjiVhwLr6zQubXPzzpYtXCxdMPsZFcuw@mail.gmail.com>
Message-ID: <CANiDSCudMRATbHU4=hyjiVhwLr6zQubXPzzpYtXCxdMPsZFcuw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] media: uvcvideo: Code cleanup for dev->status
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Max Staudt <mstaudt@chromium.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ming Lei <tom.leiming@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yunke Cao <yunkec@chromium.org>,
        Christoph Hellwig <hch@lst.de>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan

On Thu, 15 Dec 2022 at 16:34, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Thu, Dec 15, 2022 at 11:57:17AM +0100, Ricardo Ribalda wrote:
> > There is no need to make a kzalloc just for 16 bytes. Let's embed the data
> > into the main data structure.
> >
> > Now that we are at it, lets remove all the castings and open coding of
> > offsets for it.
> >
> > [Christoph, do you think dma wise we are violating any non written rules? :) thanks]
>
> There _is_ a rule, and it is not exactly unwritten.  The kerneldoc for
> the transfer_buffer member of struct urb says:
>
>         This buffer must be suitable for DMA; allocate it with
>         kmalloc() or equivalent.
>
> Which in general means that the buffer must not be part of a larger
> structure -- not unless the driver can guarantee that the structure will
> _never_ be accessed while a USB transfer to/from the buffer is taking
> place.
>

Thanks a lot for the clarification. I was mainly looking at the kerneldoc from:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/usb.h#n1687

and I could not see any reference to the DMA requirements.

Mind if I send a patch to add a reference there?


> There are examples all over the USB subsystem where buffers as small as
> one or two bytes get kmalloc'ed in order to obey this rule.  16 bytes is
> certainly big enough that you shouldn't worry about it being allocated
> separately.
>
Yep, we should keep it malloced. Thanks a lot for looking into this :)


> Alan Stern



-- 
Ricardo Ribalda

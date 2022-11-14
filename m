Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 478A56285BB
	for <lists+linux-usb@lfdr.de>; Mon, 14 Nov 2022 17:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237885AbiKNQnG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Nov 2022 11:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237881AbiKNQnE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Nov 2022 11:43:04 -0500
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6017F65F9
        for <linux-usb@vger.kernel.org>; Mon, 14 Nov 2022 08:43:02 -0800 (PST)
Received: by mail-vk1-xa2d.google.com with SMTP id v81so5239316vkv.5
        for <linux-usb@vger.kernel.org>; Mon, 14 Nov 2022 08:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r6+Uc7KspS9LnQ7lQ8KADE8xYhNwIZ0EslnJy4rOJIQ=;
        b=pXlLzqqea3rFwcAo0BCKnnKZine2dIaVs1WKl0zC8f4r5mX8yfoWOTYXBcNQ2k/CTC
         gyonvxZA1RIE8qxHdaqSwRlS7sZDrmqAVs0CnAJqR8m8BRyFOMRk+o05e9V4RPFowx1h
         y8ZHwMXLftERyS8j3xA5e3N3ogEVd/3ej8xV8nVh2rGuMmI36uy1Dbrm6fTf6+LaUeu1
         hEBfdKjruLa+K7j9XDqq64OZyLc4emGZDSwhaT9X1htGTY289G/xd4+E26slJ6ESzO5f
         y1NivQybEzJ7mRb8u4RBBFZYiCZx8WczDldkFTGRjok2QuPet9Ciklqo50m3x4u0pcXp
         5e0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6+Uc7KspS9LnQ7lQ8KADE8xYhNwIZ0EslnJy4rOJIQ=;
        b=12vyvKBx544a7GhQ26VQzfojM+yuLWEwSm3t30Du6se+kAAinCuD0pKvFOyaSDivmR
         1kUnq8xFP2qK0hdxqxgsCJrXl18Ky/QOKZ8p/4wWQqqpTrB9bTR/9CG9uOzb96EmnYBh
         j3hxf0QYjuPxqIpE00FxHtIGBHOAjxPB9iwRKkjE4OnvCUIhpgq02Y76Yr8ZQWNdRjbh
         ZkFzRxSYNAwzDCHEvFdFYXQG2Vmgj/BSZvybN0Ilyu4SsK097ufTZtFYjNQMRaqLXAEF
         QestNk0/mbeQ3iWOy8CA14YZqrjTS2UkG5QU/05c1LmNwx+ObYl5sZ2KUNp2X7f0L3ye
         72RA==
X-Gm-Message-State: ANoB5pk9o2/c/BLJdqmSqVNl8MTcCtFTTrPBt6SsxYYFRAI3JRoMuNcV
        OEqXT5E4spRS+ps7g7hrnHjSh6PEbktZayo9hWZ1zQ==
X-Google-Smtp-Source: AA0mqf4JZZcyI0e3LlhvIJqy5/kKz/rCYZl9cgjvokgRpT+9Gh2L4+/4nkyXKZB7aoi88JomTTlBCNt8+58AZgDef1U=
X-Received: by 2002:a05:6122:1989:b0:3b8:1bb4:b750 with SMTP id
 bv9-20020a056122198900b003b81bb4b750mr6892769vkb.20.1668444181396; Mon, 14
 Nov 2022 08:43:01 -0800 (PST)
MIME-Version: 1.0
References: <b2d1004d-4a76-ab0b-d369-a38c2d7c1624@csgroup.eu>
 <20221111152852.2837363-1-allenwebb@google.com> <Y26UcbviRaoK9a3C@bombadil.infradead.org>
In-Reply-To: <Y26UcbviRaoK9a3C@bombadil.infradead.org>
From:   Allen Webb <allenwebb@google.com>
Date:   Mon, 14 Nov 2022 10:42:50 -0600
Message-ID: <CAJzde06b4d065y7KSoGO6qQBgvcVdkUai1WAy_TkrkTCDHS41A@mail.gmail.com>
Subject: Re: [PATCH] modules: add modalias file to sysfs for modules.
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Lucas De Marchi <lucas.demarchi@intel.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Fri, Nov 11, 2022 at 12:29 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Fri, Nov 11, 2022 at 09:28:52AM -0600, Allen Webb wrote:
> > USB devices support the authorized attribute which can be used by
> > user-space to implement trust-based systems for enabling USB devices. It
> > would be helpful when building these systems to be able to know in
> > advance which kernel drivers (or modules) are reachable from a
> > particular USB device.
> >
> > This information is readily available for external modules in
> > modules.alias. However, builtin kernel modules are not covered. This
> > patch adds a sys-fs attribute to both builtin and loaded modules
> > exposing the matching rules in the modalias format for integration
> > with tools like USBGuard.
> >
> > Signed-off-by: Allen Webb <allenwebb@google.com>
>
> Thanks for the patch Allen!
>
> I'd rather have something generic though, and it would seem kmod [0] already
> does this, have you seen the kmod support for builtin.alias.bin
>
> Can't that be used?

Probably, but I don't see the builtin.alias.bin in my build. Is it experimental?

>
> [0] git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git
>
>   Luis

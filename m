Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 396D5629E72
	for <lists+linux-usb@lfdr.de>; Tue, 15 Nov 2022 17:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbiKOQFt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Nov 2022 11:05:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbiKOQFs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Nov 2022 11:05:48 -0500
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440DD62F7
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 08:05:47 -0800 (PST)
Received: by mail-ua1-x934.google.com with SMTP id w2so3186406uap.1
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 08:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lC7HjZv0YJWdCVBbJCdX8oFBfIQJ4Z3YaREpAMcE+Wk=;
        b=KgVjl7BfpCjRgjtSt2c/YBlO7fe/v0kF+BVh0VYOX/B/FaIDt++uPju25o7yqcAQ3Y
         17By9vzo9dpgu3y88VCU0NtpPmJAiFbr5iTH9vfwhKUAmkLkxlg9A411Vdw2LXOge+4x
         QQNiWdTmaD6rFo80fd1cdH7kERGpZaCRgblqBAR4bfDHiPQGKzTyHCgWKDLETrz8JIh3
         Ns7kNVu+m4hB5wbqtTQQ+B1hFiGZTkpCPW7AuOGq0xNfFRULnaza5rMNMBQbug+F5CDk
         +Q30rkH5YEHY4r2mBwxhXFKUAj0RCByz+Cbzg6l7awtZNPBMWqQ1aieAMin5+XLAKNuJ
         F7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lC7HjZv0YJWdCVBbJCdX8oFBfIQJ4Z3YaREpAMcE+Wk=;
        b=8EkI0TYPrsPIURG97NYQJ+1sF4VY2Qo1hPbbSVgzaa1jqCY6ABJB6WF4vMQaOTDaZV
         WBcGgsXop2EU+b6aIy2nYHEBpu0Pd4jS+JbU+gwac+l3I3/t0r6DKg9Tx9+P8xOZmLhw
         DFVTj1KUSTCo2HTP4s4DVqEv+IKqFMMC+M1wiadhJbl0lKSYH60YiqAhdMoL044KmKuw
         /g0bEI7Gp+9KyybEV9s3xcptzo9eoNIhExTvqJIxtGlOtkQEd0jcUV/kHc2sBYv6Xm1/
         r8KXQeJ36TjCpMUFEW5tArEWNjnctXaIqsWpJzIFay9/XubYidUjvlfwX++AxGjSDaw6
         Dz8g==
X-Gm-Message-State: ANoB5pkQ3B6xNO+jMXjZ75wkMNxCTwBHcoPAMz7YhCk0An3L5PGGXP8o
        2sNUT/KzEZ2bddAZ0YyldiqVxp5pftBtznSj0mHOVQ==
X-Google-Smtp-Source: AA0mqf7XZPLE4b06KBKnQS2e/lwLCOJPIb0LYbRgKMs1aOxiUs5qRglW1N48luGT5NFDiDl8N53CwuC13k5IFjoy8BA=
X-Received: by 2002:ab0:2044:0:b0:411:7c09:b011 with SMTP id
 g4-20020ab02044000000b004117c09b011mr10000001ual.95.1668528346162; Tue, 15
 Nov 2022 08:05:46 -0800 (PST)
MIME-Version: 1.0
References: <b2d1004d-4a76-ab0b-d369-a38c2d7c1624@csgroup.eu>
 <20221111152852.2837363-1-allenwebb@google.com> <Y26UcbviRaoK9a3C@bombadil.infradead.org>
 <CAJzde06b4d065y7KSoGO6qQBgvcVdkUai1WAy_TkrkTCDHS41A@mail.gmail.com> <20221114172214.ilnk5wj3eevpsqts@ldmartin-desk2.lan>
In-Reply-To: <20221114172214.ilnk5wj3eevpsqts@ldmartin-desk2.lan>
From:   Allen Webb <allenwebb@google.com>
Date:   Tue, 15 Nov 2022 10:05:35 -0600
Message-ID: <CAJzde04id1kWhnR5HfuFEZR+ej7xXAsmQ9HpwYT5rQEY4Jsntw@mail.gmail.com>
Subject: Re: [PATCH] modules: add modalias file to sysfs for modules.
To:     Lucas De Marchi <lucas.demarchi@intel.com>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
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

On Mon, Nov 14, 2022 at 11:22 AM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Mon, Nov 14, 2022 at 10:42:50AM -0600, Allen Webb wrote:
> >On Fri, Nov 11, 2022 at 12:29 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >>
> >> On Fri, Nov 11, 2022 at 09:28:52AM -0600, Allen Webb wrote:
> >> > USB devices support the authorized attribute which can be used by
> >> > user-space to implement trust-based systems for enabling USB devices. It
> >> > would be helpful when building these systems to be able to know in
> >> > advance which kernel drivers (or modules) are reachable from a
> >> > particular USB device.
> >> >
> >> > This information is readily available for external modules in
> >> > modules.alias. However, builtin kernel modules are not covered. This
> >> > patch adds a sys-fs attribute to both builtin and loaded modules
> >> > exposing the matching rules in the modalias format for integration
> >> > with tools like USBGuard.
> >> >
> >> > Signed-off-by: Allen Webb <allenwebb@google.com>
> >>
> >> Thanks for the patch Allen!
> >>
> >> I'd rather have something generic though, and it would seem kmod [0] already
> >> does this, have you seen the kmod support for builtin.alias.bin
> >>
> >> Can't that be used?
> >
> >Probably, but I don't see the builtin.alias.bin in my build. Is it experimental?
>
> no. That is generated by depmod since v27 using modules.builtin.modinfo
> generated by the kernel build system. Highly recommend v30 though
> as there were fixes in v28 and v29 and some changes to speed up its
> generation/use in v30:  See entries mentioning
> builtin.alias and bultin.modinfo in
> https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/tree/NEWS
>
> libkmod/modprobe/modinfo also have the corresponding changes to lookup that
> index when resolving aliases.

I see the file but it is largely missing the aliases I am interested
in, so it looks like I might need to modify my patch that creates
buildin.alias to add the missing alias defines in the header along
with the other module metadata for builtin modules. Does this sound
right to you?

>
> Lucas De Marchi
>
>
> >
> >>
> >> [0] git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git
> >>
> >>   Luis

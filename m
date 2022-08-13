Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2519591A15
	for <lists+linux-usb@lfdr.de>; Sat, 13 Aug 2022 14:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239419AbiHMMEV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Aug 2022 08:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237536AbiHMMET (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Aug 2022 08:04:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5A2543C178
        for <linux-usb@vger.kernel.org>; Sat, 13 Aug 2022 05:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660392256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=r6uxi7nV92mK42y8sB6nwlqWyJcfn4mYRHPUi/SDIbU=;
        b=RCPVXyumVeJ7LZmnO4wVvZgrcTAAw/jOstVHQR2SEIEVTbJG398r4KFej1n8yNTOMR69PW
        6rnWM7i1InxV/kw+q3onPFOyNPuNOD37V0z798IPplRx+IoQo01vocIJ+oiczh5dfqPSp+
        eAME2J67P4lielKDj1kFxv6vfcIsiD4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-hQd0iL4KO3iqh8liNq-jGw-1; Sat, 13 Aug 2022 08:04:15 -0400
X-MC-Unique: hQd0iL4KO3iqh8liNq-jGw-1
Received: by mail-ed1-f71.google.com with SMTP id r12-20020a05640251cc00b00440647ec649so2139124edd.21
        for <linux-usb@vger.kernel.org>; Sat, 13 Aug 2022 05:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=r6uxi7nV92mK42y8sB6nwlqWyJcfn4mYRHPUi/SDIbU=;
        b=NWuIhESgoBEqVF5FeLpBIrtFKztDBYsA4BjY4G/PNHqmC1oQYyizVFu5dCQufAXPla
         vTjKzJKR5jrGIIsVfM8BUc5HU/3PRh+0NLKp5DVl0/8uaZf6hyFtTmfBtVfejAmTs829
         FEDEM8aL3ys7sy4vAXmLQ5Ep9hrFDpRPydX7MClRsCnniq9M7QDQ2j6KMWRzSbQaPJ6B
         uXrKm1z7r2PJbihvLzpG2Hr/aU7SuRyeJpaFq2+H0OWcr+3PNixB41wYTqW9GlTK2abU
         LDeY4hm2qVEPp9RaoRtsd+AWFos64RpOI9xaMq70l5qsO8uyz+qTeSoxIo73Lcn0HGCP
         BRQQ==
X-Gm-Message-State: ACgBeo3LUPk1JBTWgc9Ptjbb5NqjW4nM3NS8O7XWngA3i+uWzLh89UWW
        mzPjc+QxVc5gXHp8PsuD6D5UD8zgOJiFgqABaaJ9I8FuxXCe0CmIGKhqOv5u7BhWpqgXnIEYODB
        Yk1L1IaCSYlStrVvTO7GlKIvGEjyvrfruEgbE
X-Received: by 2002:a05:6402:24a4:b0:440:8c0c:8d2b with SMTP id q36-20020a05640224a400b004408c0c8d2bmr7032697eda.311.1660392253778;
        Sat, 13 Aug 2022 05:04:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5UTIrmjwvc3z94DGmCWBcjO/hNjbGLTuu7gfNcYsudkMJGsF2zfJL9wieqjhI3LLUIhcijKigw22TipmtW7Qg=
X-Received: by 2002:a05:6402:24a4:b0:440:8c0c:8d2b with SMTP id
 q36-20020a05640224a400b004408c0c8d2bmr7032667eda.311.1660392253527; Sat, 13
 Aug 2022 05:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220810234056.2494993-1-npache@redhat.com> <CABVgOSmUgkeuKKS_UYMOTUE4vARLpw--j77J9=zAkk5Zr30N9g@mail.gmail.com>
 <CAA1CXcBjf411E7gCbTfowpOmas-ykuVCyn1B4oAua_VKxMkOCg@mail.gmail.com> <CABVgOSk74DvJsizPB+=UZ7sgw88_=7D6bBtHCEOWgpgWytKJeQ@mail.gmail.com>
In-Reply-To: <CABVgOSk74DvJsizPB+=UZ7sgw88_=7D6bBtHCEOWgpgWytKJeQ@mail.gmail.com>
From:   Nico Pache <npache@redhat.com>
Date:   Sat, 13 Aug 2022 08:03:42 -0400
Message-ID: <CAA1CXcB=8S5BnLmrdjc=6NBD-ZxUXMAmFMUTppBjnrXEM+C+Ng@mail.gmail.com>
Subject: Re: [PATCH] kunit: fix Kconfig for build-in tests USB4 and Nitro Enclaves
To:     David Gow <davidgow@google.com>
Cc:     Joe Fradley <joefradley@google.com>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel Latypov <dlatypov@google.com>,
        Brendan Higgins <brendan.higgins@linux.dev>, alcioa@amazon.com,
        lexnv@amazon.com, Andra Paraschiv <andraprs@amazon.com>,
        YehezkelShB@gmail.com,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        michael.jamet@intel.com, andreas.noever@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 12, 2022 at 2:43 AM David Gow <davidgow@google.com> wrote:
>
> (+joefradley@google.com to comment on what Android is doing here)
>
> On Thu, Aug 11, 2022 at 8:44 PM Nico Pache <npache@redhat.com> wrote:
> >
> > On Wed, Aug 10, 2022 at 8:20 PM David Gow <davidgow@google.com> wrote:
> > >
> > > On Thu, Aug 11, 2022 at 7:41 AM Nico Pache <npache@redhat.com> wrote:
> > > >
> > > > Both the USB4 and Nitro Enclaves KUNIT tests are now able to be compiled
> > > > if KUNIT is compiled as a module. This leads to issues if KUNIT is being
> > > > packaged separately from the core kernel and when KUNIT is run baremetal
> > > > without the required driver compiled into the kernel.
> > > >
> > > > Fixes: 635dcd16844b ("thunderbolt: test: Use kunit_test_suite() macro")
> > > > Fixes: fe5be808fa6c ("nitro_enclaves: test: Use kunit_test_suite() macro")
> > > > Signed-off-by: Nico Pache <npache@redhat.com>
> > > > ---
> > >
> > > Hmm... I'm not quite sure I understand the case that's broken here. Is it:
> > > - KUnit is built as a module (CONFIG_KUNIT=m)
> > > - USB4/nitro_enclaves are also built as modules, with the test enabled.
> > > - The kunit module is not available at runtime, so neither driver
> > > module can load (due to missing kunit dependencies)
> > Exactly, except the issue is also when the USB/NE=y not just when they
> > are modules. This is currently creating an issue with our build system
> > during the depmod stage and has been preventing us from generating
> > Fedora builds.
> .
> Yeah: there's a nasty tradeoff here in that having these depend on
> KUNIT=y does (obviously) mean that it's not possible to run these
> tests with KUNIT=m. I'd agree that being able to ruin some tests is
> better than none, but there are quite a lot of tests which are doing
> the same sort of tricks as USB4/nitro_enclaves to embed tests in the
> same module as the code being tested. In particular, I think apparmor
> is doing something similar, and the incoming AMDGPU tests also build
> all of the tests into amdgpu.ko. If we require KUNIT=y for these,
> we're leaving a lot of tests on the table for KUNIT=m cases, which
> would otherwise work.
>
> The ideal solution would be to split the tests for these systems out
> into their own separate modules, but that's often quite tricky due to
> the sheer number of otherwise internal symbols which need exporting.

I have already started trying to separate out all the built-in tests.
There are a few which may have to stay as built-in if I can't find a
viable solution, but expect a patch-set doing just this soon :)

> > >
> > > If so, that's not a case (i.e., the kunit.ko module being unavailable
> > > if it was built) we've tried to support thus far. I guess a de-facto
> > > rule for supporting it would be to depend on KUNIT=y for any KUnit
> > > tests which are built into the same module as the driver they're
> > > testing.
> > Yeah, although it's not been a case you've been trying to support, it
> > has been working so far :) This has been the case (built-in tests
> > utilizing 'depends on KUNIT=y') since we began supporting KUNIT in our
> > testing infrastructure and it would be nice to keep that as a de-facto
> > rule :)
>
> Okay: let's try to stick with that for now, then (unless there are any
> objections from the people working on those particular tests), and
> look to either reinstate it if we find a better way of dealing with
> the missing/disabled kunit.ko case, or the tests can be split into a
> separate module. Personally, I don't expect we'll get either of those
> working in the short-term, but it's definitely a problem we'll have to
> confront more eventually.
>
> In the meantime, I think the KUnit position on this will be to note
> this as a consequence of building KUnit tests into bigger modules, and
> leave the final decision up to the maintainers of those
> subsystems/tests. This may result in there being some tests you have
> to explicitly disable (rather than being able to use KUNIT_ALL_TESTS)
> if an important module decides that they really want their tests to
> run when KUNIT=m (which may not happen, we'll see...)
Yep, explicitly disabling them is also an option for us, but I
submitted this patchset because I noticed a change in the pattern for
built-in tests (depends on KUNIT=y). So if people object to some tests
not having kunit module support, we do have the ability to work around
it.

Thanks for your review!

Cheers,
 -- Nico

>
> > >
> > > Alternatively, maybe we could do some horrible hacks to compile stub
> > > versions of various KUnit assertion symbols in unconditionally, which
> > > forward to the real ones if KUnit is available.
> > >
> > > (Personally, I'd love it if we could get rid of CONFIG_KUNIT=m
> > > altogether, and it's actually broken right at the moment[1]. There are
> > > still some cases (unloading / reloading KUnit with different filter
> > > options) which require it, though.)
> > Personally I'd hate to see KUNIT=m go as that is how we have been able
> > to support running Kunit tests so far.
> >
> > A little background on how we utilize Kunit. We build with KUNIT=m and
> > KUNIT_ALL_TESTS=m and run the tests baremetal.
> > Our build system creates 3 packages (kernel, kernel-modules, and
> > kernel-modules-internal), this allows us to ship the kernel and its
> > modules, while also isolating packages that we dont want to ship
> > outside of QE and developers. We then have our own infrastructure in
> > place to run and collect the output of these tests in our pipelined
> > environments. We dont utilize UML because we dont support that feature
> > in RHEL.
> >
> > Fedora uses this same methodology for running KUNIT, so we are
> > frequently running kunit on an 'upstream' variant.
> >
> > I'm not sure how many organizations are supporting continuous KUNIT
> > testing, or how they are achieving it, but dropping module support
> > would prevent us from doing the CI testing we have in place.
> >
> > Cheers!
> > -- Nico
>
> Fair enough -- we definitely won't get rid of it unless there's a
> replacement which works as well if not better.
>
> The reason it's tempting to get rid of KUNIT=m is simply that there's
> a chunk of KUnit code which needs to be built-in, even if the rest of
> it is in a module. So a kernel with KUNIT=m still has a fair bit of
> the overhead of KUNIT=y, and this is likely to get more significant as
> more such features land (e.g., static stubbing:
> https://lore.kernel.org/lkml/20220318021314.3225240-2-davidgow@google.com/
> ).
>
> Traditionally, our expectation has been that a separate, KUnit-enabled
> kernel config / build makes sense, as that allows the
> release/production build to run without any testing-related overheads
> at all. That being said, I know Android are looking to enable KUnit in
> all GKI builds, and to implement a separate kunit.enable option to
> effectively "disable" it at runtime. This doesn't remove all of the
> overhead, but does allow KUnit to always be present without the risk
> of compromising the integrity of the running kernel by running tests
> in production.
>
> Regardless of whether any of those seem interesting to you, we won't
> be getting rid of KUNIT=m in the short-term (and definitely will be
> supporting individual test modules, even if we later want to have the
> core executor built-in).
>
> One other note is that KUNIT=m is actually broken right at the moment:
> the fix is here:
> https://patchwork.kernel.org/project/linux-kselftest/patch/20220713005221.1926290-1-davidgow@google.com/
>
> Cheers,
> -- David
>


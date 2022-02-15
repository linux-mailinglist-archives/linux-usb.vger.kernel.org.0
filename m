Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7D234B611B
	for <lists+linux-usb@lfdr.de>; Tue, 15 Feb 2022 03:39:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233682AbiBOCjs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Feb 2022 21:39:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiBOCjr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Feb 2022 21:39:47 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 765AE108BD6
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 18:39:38 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id p15so41197824ejc.7
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 18:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jaryyCy86//dz9qBeVri9T8GTUIyNEYlglAv0ZptOz4=;
        b=FEzhnt2zAT6+OZcXvJm33uyLiD9WzftgV+IrdJ9vkN4KXk7l0TWXF9J5ZoRYKfiRQf
         NU8TUebskAjvRuyLeOuQpOdMCIRG5ZRURn8SRN4UVZKtEcEIeiKS3fvZ2EWf8EasUAYW
         VX7jlJRIvxfphQp7Jez9rdkashnSoxH5UVi3g/44A8e+tpR463sNQThnGpLLoYJ7LFDD
         VbsFJOTbYZ9LpImUKDeFhMQSwYleZlyFDNKv/S/ZZVc4LGvsLc7plah/hx+UNll9TK7n
         PsVdW3JVdhpRlz8ReobPRLfijh9k/gey5KhKsWXWozrUlKLt1x7FDQhA+R6PktBH+7zp
         r7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jaryyCy86//dz9qBeVri9T8GTUIyNEYlglAv0ZptOz4=;
        b=HchWyS82hyf1ROlDrFaWuvovl2/S5S6JA0GD/A8hying31t8kkhMchjtl0shSXH/yd
         ZqB/JaCQV6mf+IkKSiayyZyqmaoXGEgHm2HDI0Rx00vKqadNvGi/EeCcgv+RP1x+PeHo
         qzDSATNaytrIl8LT3BZwpbaiqjPTMmK9Ec64v9Eqe+QNwZx1rOTHjCJlPI/tBCxxGPmJ
         ZsW9B+ZXhNLbxOMr8LLzCdWvVKIJcKGog6FyT32tbeaG9GFGSS+ilt9aMOu5hzDEvdcT
         KW6LLOAQJj6CDrctRSQ2FlB4UTyJmVPZmRlUAKyOv/Qa9fQhOX8vf4Icx1rICxKaA0YJ
         7+gQ==
X-Gm-Message-State: AOAM531hff/tVa12HbqFoXO8TN71Ke09QDMlODToParlto0YVEQ11kzO
        msjZ+e6+xzUtwRM5tAXdXLEPqS3Zz3b8tWccYdRIUQ==
X-Google-Smtp-Source: ABdhPJyxPBm3r3M0pR5LUTGeculiA4q6ITa+Z9MHI2p8eYNxjbLEm1/PlSc8I9cCf9TIigzR7beHjLcvluhKgrlCd8I=
X-Received: by 2002:a17:906:782:: with SMTP id l2mr1249582ejc.631.1644892776838;
 Mon, 14 Feb 2022 18:39:36 -0800 (PST)
MIME-Version: 1.0
References: <20220214184104.1710107-1-dlatypov@google.com>
In-Reply-To: <20220214184104.1710107-1-dlatypov@google.com>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Mon, 14 Feb 2022 18:39:25 -0800
Message-ID: <CAGS_qxomM_mGzvFokZH5dnf7L3kCitB3dWD8JH56fPcDSb6PeA@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: test: get running under UML, add kunitconfig
To:     mika.westerberg@linux.intel.com
Cc:     brendanhiggins@google.com, davidgow@google.com,
        linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 14, 2022 at 10:41 AM Daniel Latypov <dlatypov@google.com> wrote:
>
> These tests didn't work under the normal `kunit.py run` command since
> they require CONFIG_PCI=y, which could not be set on ARCH=um.
>
> Commit 68f5d3f3b654 ("um: add PCI over virtio emulation driver") lets us
> do so. To make it so people don't have to figure out how to do so, we
> add a drivers/thunderbolt/.kunitconfig.
>
> Can now run these tests using
> $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/thunderbolt
>
> Potentially controversial bits:
> 1. this .kunitconfig is UML-specific, can't do this for example
> $ ./tools/testing/kunit/kunit.py run --arch=x86_64 --kunitconfig=drivers/thunderbolt
> 2. this removes the manual call to __kunit_test_suites_init(), which
>    allowed us to control exactly when the tests got run.

kernel-test-robot points out something I had forgotten.
Doing this prevents us from being able to build this test as a module.

kunit_test_suites() defines an init_module() which conflicts with the
existing ones.

There's some relevant discussion about reworking how kunit modules
work here, https://lore.kernel.org/linux-kselftest/e5fa413ed59083ca63f3479d507b972380da0dcf.camel@codeconstruct.com.au/

So I think we have two options for this patch:
a) proceed, but disable building the test as a module for now (tristate => bool)
b) wait on this patch until kunit module support is refactored

Basically the question is: does this slightly easier way of running
the test seem worth losing the ability to test as a module in the
short-term?

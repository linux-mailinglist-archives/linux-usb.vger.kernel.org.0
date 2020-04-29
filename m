Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C281BD238
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 04:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgD2CYG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 22:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbgD2CYF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Apr 2020 22:24:05 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7942BC03C1AC
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 19:24:05 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id n11so283938pgl.9
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 19:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m7gylSSz/E/yRjq0410kXNqX+Z/qWnz9dirkExMJqdI=;
        b=N/odiyfPK4S8a+OPyqbVO6msxQdgfVn5ClgY4jTW5hajWnWJrLvVuwUFhtJHAWtDHk
         OZ0KLmPVmP84uXcRXNcNBHWw/SMMxhZwLKgdqORgM4CfGCyqJzAQ+KrzkZb1RpkKUqya
         s/n+U2KSar0gLzTbGGufq+DoiATaLzJ2KgbEd5t38x2jfpOlILPn/nPcxEaaDi6g+bwi
         r6LMcdtKmzBi9KpusAr7JbPGwKDc/D5pwcYCsm+gGSMtZmiDTL/hNkzD10BG+uKhyGi/
         o7hmr+FjWIRdzunsKsRYyLfsoFkLK/tphFikWWAsi8bS71rGUL0U1LB4C41cdMbe+PkV
         tUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m7gylSSz/E/yRjq0410kXNqX+Z/qWnz9dirkExMJqdI=;
        b=l4onHL6NEylTlwAf100tCZ7KX01cuS7/57z+IwdCFns6+cYThuLLHO449umAHGB36j
         pgiWGSs7IuWz1KBVf+6NU//tio/mi+JKrHecP9B0Q07dGKkcmh1ZklCJTZ0A7KfgHanN
         0Sg7/MnxvqKYNK2/HLPvu1m6rnjBt/ijaRZ+qwBCnjw+/QhDKFIijefsHC8696DyFy/t
         o73XcBHczICuMWClfApyhihEsI+jTL+k8uoy7OSAIGit/azEJ+ev8pwRsWInw5DeoEpS
         yZhl6LATXoOH49SguXXLU8y6CHgd9B1jpH4W/dKmLgsHioH8G166WET45vLM4y8iyIfD
         nLzw==
X-Gm-Message-State: AGi0PuaCxeqeyyl5L7hg0nr03LHzW3S2rryh4ZF1pnRitlhg80I3bGNw
        fSIUJJsQf96DV+oIwUqjUM7F3quqKaHZWlAwag+zWg==
X-Google-Smtp-Source: APiQypKZSfLZWLQJSDLA5I7dLXG0MpWehIaX8EIMdHN4sP57rnxOFNfQ23iKhvHcunYkUXB+A3t8SrUYCckm34WIdSo=
X-Received: by 2002:a62:5289:: with SMTP id g131mr23522442pfb.318.1588127044578;
 Tue, 28 Apr 2020 19:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+zBLWKn-YQjoD6S5uwwhuB-kTmdnBD28E06ujrx8ymv7A@mail.gmail.com>
In-Reply-To: <CAAeHK+zBLWKn-YQjoD6S5uwwhuB-kTmdnBD28E06ujrx8ymv7A@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 29 Apr 2020 04:23:53 +0200
Message-ID: <CAAeHK+wWpt5fJkLjA=F804xkHkTQWJJf7qfxRw2WDOZn3TQPkg@mail.gmail.com>
Subject: Re: Recommended USB3/SuperSpeed gadget device
To:     Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 29, 2020 at 12:36 AM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> Hi!
>
> What is the recommended driver/device to test USB3/SuperSpeed gadgets?
> Ideally something cheap, but at the same time with good driver
> support.
>
> I have a EC3380-AB board [1], which kind of works with net2280 driver,
> but it passes almost none of the usbtest tests with g_zero (only tests
> #1 and #9). I need something better.
>
> Thanks!
>
> [1] http://www.hwtools.net/Adapter/EC3380-AB.html

Just to clarify: I mean a UDC device/driver, not a host one.

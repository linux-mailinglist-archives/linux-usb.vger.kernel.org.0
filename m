Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42692348B66
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 09:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbhCYISx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Mar 2021 04:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbhCYISm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Mar 2021 04:18:42 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90588C06174A
        for <linux-usb@vger.kernel.org>; Thu, 25 Mar 2021 01:18:41 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 15so2085349ljj.0
        for <linux-usb@vger.kernel.org>; Thu, 25 Mar 2021 01:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=unhzrUlUmxwMo4jU+o1qS+odD5qv386ZSHOjsI10bcg=;
        b=KW+CwKvpsTmTXENRiHTcGBk+qdowqv7nij4ijO8bcKk0+nnnkCUBATgOTB40qpIiy2
         qPyEes6ddLFjiNJVxiLceQFKjOCf34PuJq9FFiq7FzpDBOF65i9Ipb/U14FjTGEeBV7R
         eJJpddCVwcb0HV2NCJygpgPQhgYGHhZfNexDnbfDgyDN2YzbqvEuAvFLYErj/LQvNsbk
         p/UXbEXWlwdb6DhVU3uM3udvSquMD4S3bMBZaT1hbTvkMeS/DUV9iPqH/QA7Jq0rtkG3
         qKIYoSKP/Rve+Mkxc/1giDgxcTHyMGR+2zPRow2jZ+ITLHX1/3zil+TDBFszcWI3vkXD
         MRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=unhzrUlUmxwMo4jU+o1qS+odD5qv386ZSHOjsI10bcg=;
        b=Y70Q8WYHeuUR/SfahoiHX4ipzhRLKASKsQzl0IsQpSdCI8uVD6CzXTeEZ7wrYY+rQz
         eMyn4/aztMGSACCuHj+hwcZBmoNR92P2CuIdITCcbMRwUKzVZ/LmELn4Wqw0Hdkt15TD
         XeYfi38/72fLL5Fil+vPRTSRoQED6qJ/zJl43Z61RbA+ct9hwNVy5lEf7Q1vVwnOC6oh
         hl2+9TCcIVqGdPUJ//oWpkhUmMC13HBWaCc8pKaVm7Wna7GEqwaUSZBD/8v/7Q71GMR/
         iRIa+ZZxGsGshEOSyVRDpfbVm9UeLPhu+HvDI1R6wdhyGyvVWcKIIrFhyB4by21gp19v
         n4fw==
X-Gm-Message-State: AOAM53341wbM5AQT95LizGcAJbkn/P1zyG+ybJx2nWIELnu6c3sPxI8C
        djLUV+IilQUmXnFnQ4OARvxfG4vaF5HlwuaOFLg0auSujMX3vyJ2
X-Google-Smtp-Source: ABdhPJz0GzVY64RszF7GBBC+BDXbk6Gq5VBz8iBMXhq6HISdgBwxj4LgMrMlFmbqi4hFQveaCR0pmnCpNjorxi3YHXk=
X-Received: by 2002:a2e:700a:: with SMTP id l10mr4847470ljc.368.1616660320111;
 Thu, 25 Mar 2021 01:18:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210323153626.54908-1-andriy.shevchenko@linux.intel.com> <20210323153626.54908-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210323153626.54908-7-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 09:18:29 +0100
Message-ID: <CACRpkdZY3nugyG7ie5tDmuipjjY30F1VfTSwMNhK5Hwt-BQ0kw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] usb: gadget: pch_udc: Provide a GPIO line used on
 Intel Minnowboard (v1)
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 23, 2021 at 4:36 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Intel Minnowboard (v1) uses SCH GPIO line SUS7 (i.e. 12)
> for VBUS sense. Provide a DMI based quirk to have it's being used.
>
> Fixes: e20849a8c883 ("usb: gadget: pch_udc: Convert to use GPIO descriptors")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7374C26AE17
	for <lists+linux-usb@lfdr.de>; Tue, 15 Sep 2020 21:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgIOTvn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 15:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727826AbgIORHz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Sep 2020 13:07:55 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCBE5C061356
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2020 10:00:30 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id c63so996500vkb.7
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2020 10:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AD44iUMYidPiEvY0GREEGObw8s+cZqGFqFLZt/WuWbY=;
        b=HXXdpEQu7Pg7iPzOEaa08AqlWK3FNqlZevxpAIv60vMGwoWlBshZDNmw3Sw33p+IJJ
         O5dG1xbSbC+g24gEX/HVlccbvpQBGBXG18HZA7mwmby4fM1dQJccbJvUHnfV8DIv6qA4
         qk36l5nqIP8fepYx0Nh2UYAGnOPjOQ8AYkQzw9kp2LZj2UOQWOunLTzXyMeT2CY3CGTT
         HkrpIOrWybwprMRsiBIaTH0f1nIUqMj/lGT4KtaapT1FRAxIRME1VX0rJCLObHBtHzYR
         mkO/hS0B2EEqdHG7sLsRQpNs1g9GuSId5vVjiInO5ySX9awBX2fZgdTYY6gYKw4ye8pe
         c3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AD44iUMYidPiEvY0GREEGObw8s+cZqGFqFLZt/WuWbY=;
        b=AfbHZYI9zve96stvIdMeHEB4pORFFgnpV0584rYYZv0vue238IdvOJ80VzMXv+7Ri7
         qhlg9bEutLp5PFhLfPASa7jFHqClQkTPllOsC6tvrSyekBkUdQ5V3K6uYgXgv3AIkcOn
         HQxXfxbT9ylZgFaSfCykMjfbrWr2HJkzDU/vI5GQAkDfLbGP3AHunCMK2OT4mS6ryRbV
         o5hHPJ9qznIQ+wWOQHo+Rv9nokLxA24ilpOF0FL/uP0oZBYvDdyTmKvYuad2WI8l3T/D
         7zMqLrULEnBZwolAeDfZvCIAPJKEYWGT9fM7trpYaFhLoCzgI1q/WcNTlFH5pfHQnDoV
         1kzA==
X-Gm-Message-State: AOAM531TfpJBENCMnG2zvlEB67srEq07PLcZq9vkL1xEjXahOSvibk9w
        Hgjx/7vBYKrKEKW/IKXropOycUVkiv61m6jKh6pb7g==
X-Google-Smtp-Source: ABdhPJxyiyh7xsUQINRaFa+K9y6YtLwuY9B97luN6UU9cNTRgWjfWfKwWmuV2bx1S55GGixSJn7HoJPKCiN/Z0lSV+A=
X-Received: by 2002:a1f:964c:: with SMTP id y73mr11317771vkd.8.1600189229548;
 Tue, 15 Sep 2020 10:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200901025927.3596190-1-badhri@google.com> <20200915133347.GK1139641@kuha.fi.intel.com>
In-Reply-To: <20200915133347.GK1139641@kuha.fi.intel.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Tue, 15 Sep 2020 09:59:53 -0700
Message-ID: <CAPTae5LbTO0MH6VasNXzHTR1UkiuR4Qw52V3nVus-7-e6UB4Tw@mail.gmail.com>
Subject: Re: [PATCH v6 00/14] TCPM support for FRS and AutoDischarge Disconnect
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 15, 2020 at 6:33 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Aug 31, 2020 at 07:59:13PM -0700, Badhri Jagan Sridharan wrote:
> > First of all apologies for mixing up the patch version as noted by
> > Heikki and Greg. All of them were v1's but since I was manually adding
> > the version numbers I mixed them up. Using the --reroll-count option
> > now. Updating the patch version to v6 (highest version number in the
> > previous patchset + 1) to avoid confusion.
> >
> > I also rebased on to off of the recent usb-next tip:
> > 5fedf0d295d3 (origin/usb-testing, origin/usb-next) Merge 5.9-rc3 into usb-next
> > Which had the following changes causing merge conflict:
> > 3ed8e1c2ac99 usb: typec: tcpm: Migrate workqueue to RT priority for processing events
> > 6bbe2a90a0bb usb: typec: tcpm: During PR_SWAP, source caps should be sent only after tSwapSourceStart
> >
> > Addressed comments from Heikki and Randy which have described in the
> > individual commit's change history as well.
>
> I'll try to study the AutoDischarge a bit before reviewing the last
> patches. They all appeared to be only about AutoDischarge. Sorry, I
> didn't have time for that yet. If Guenter is fine with those, then
> feel free to add my ACK to those patches. But Guenter really should
> review these in any case. Hope he has time.

Really appreciate you spending time on reviewing the patches. So
thanks for doing that.
I quickly went through the comments you have given. Will respond today.

Thanks & Regards,
Badhri

>
> Br,
>
> --
> heikki

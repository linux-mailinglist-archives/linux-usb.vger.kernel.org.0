Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED1F30DE7D
	for <lists+linux-usb@lfdr.de>; Wed,  3 Feb 2021 16:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234640AbhBCPne (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 10:43:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234638AbhBCPn0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Feb 2021 10:43:26 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E56AC06178A
        for <linux-usb@vger.kernel.org>; Wed,  3 Feb 2021 07:42:46 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id d15so17794678qtw.12
        for <linux-usb@vger.kernel.org>; Wed, 03 Feb 2021 07:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ihoLZcZRyoEW0VgthAIYy/Wrfm42/ApXno9WsQqxkNU=;
        b=EoLZC0YrqtaMnD9fFHdOTe28Sq/Oq9SXXrQvYof6S3pgN8mPpoysrzaICfVrAWKMFZ
         dYTQFH07BnbrYxiv1+GgFXaJbTOwGZNRTohTHUC+19KCN5exgL/Jv/MNZCrrg9oMMuzx
         w674xHO/fY+x4ZFP1JWOyGdUgSlVOu+DCOLM5fFXvvX7UlBe6Il55wlTos8uZHsHsMdg
         9KsAQfSFXg6R6lMQSYLhU5RNkOia8sD3Nk3R0KhwD6f/L6exZ3TqtbNZN9VLbmdHajgN
         ExNb/1MH7mgrolJuYEQrZUOZ5l3jW00/n77Ezron+rfwlrId2v5OxB9ojU+rB2cr1MoK
         CB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ihoLZcZRyoEW0VgthAIYy/Wrfm42/ApXno9WsQqxkNU=;
        b=qvIL86r/ExoIxz+U/V8wva+QovascY7tq7t1fWURDE9U7hRU+EgdHfiuqt09a7zI3u
         GsCy29N6q6rC6vWXUwbM3pFG5D9d6QKfbP9FMYYAobwkyVrr/ayWqyjd8zjDCpTDIg0T
         jzk2d4gdurF01TXl/ioCbFXWygXjYpqkwRJj+V+8NjobHwKogbPM2JyS2MqJ2nxriYY3
         e73suQHjHMaAOuEnQM8SgpUHii95zEY5WNX7/MPrpBGlJhOmZek+jO8PbCLgH0Olsrdh
         bDpyVjwcQhNbyQ6TzY8oTfXWp7EbS6HP433Equv/m+LIiTWhHFVAdxFJuwWkAR4hix7K
         Ithw==
X-Gm-Message-State: AOAM533lt46zkmpPD/n4CGJuUvil2PC9digQ1x8fOaP38fGxhhKAPUOR
        7W8Kltd9wWfGvYK12SbKB35lIi6YDUTVjj20gRc06w==
X-Google-Smtp-Source: ABdhPJx9j8LPPgRdIBOzrJip12wYThmZ7w8kPmoBmUPYnNAGBqHDdVBR/Q48vevfvHS/9OhLwOItlwZqDHNvm95GqUc=
X-Received: by 2002:ac8:1009:: with SMTP id z9mr2954958qti.347.1612366965030;
 Wed, 03 Feb 2021 07:42:45 -0800 (PST)
MIME-Version: 1.0
References: <20210202161733.932215-1-kyletso@google.com> <20210202161733.932215-2-kyletso@google.com>
 <20210203124724.GD1687065@kuha.fi.intel.com> <20210203145143.GA58095@roeck-us.net>
 <20210203150121.GI1687065@kuha.fi.intel.com> <20210203150419.GJ1687065@kuha.fi.intel.com>
In-Reply-To: <20210203150419.GJ1687065@kuha.fi.intel.com>
From:   Kyle Tso <kyletso@google.com>
Date:   Wed, 3 Feb 2021 23:42:28 +0800
Message-ID: <CAGZ6i=3ToBe51NkBzgvoOmEuJoq+LmLhhk+FGb=vptw5+Xh+gw@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] usb: typec: Manage SVDM version
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thank you Heikki and Guenter for these valuable reviews.
I will update it in the next version.

thanks,
Kyle

On Wed, Feb 3, 2021 at 11:04 PM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Wed, Feb 03, 2021 at 05:01:26PM +0200, Heikki Krogerus wrote:
> > On Wed, Feb 03, 2021 at 06:51:43AM -0800, Guenter Roeck wrote:
> > > Thinking about it, would it make make sense to define the functions as
> > > static inline ?
> >
> > I (and I believe Guenter too)
>
> s/I believe Guenter too/I thought you too/
>
> > want to keep these structures protected
> > for now. If the API starts to get too bloated, then I guess I have to
> > reconsider that. But I don't think we are there yet.
> >
> > I have been thinking about moving the USB PD negotiation details to a
> > separate structure that could be more accessible for everybody. That
> > should allow me continue to protect my precious structures. But I have
> > not yet put much though into that.
>
>
> --
> heikki

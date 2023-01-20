Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46197675D35
	for <lists+linux-usb@lfdr.de>; Fri, 20 Jan 2023 19:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbjATS5T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 13:57:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbjATS5R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 13:57:17 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498C6C41EE
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 10:57:16 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-4b718cab0e4so85521147b3.9
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 10:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mbJBQ/QNe3N4k5AQeZLZDsaOTwFekuD7h3aFXUEjErE=;
        b=XY/aPGJF5s1t0ViUZ64imTUVbWIWEsrKzM7m6y9Prq/1GonmrRHDzvqHddP1SqAkNc
         AGJcJBKY9i5xehpcWW59FnUwsSI3nra/1Osl9zUz2CaBK6hurxF8rQ8+V/0veM590lJz
         OokbEClM1EX6igLVydpdmwpAItIWzrSTzQzyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbJBQ/QNe3N4k5AQeZLZDsaOTwFekuD7h3aFXUEjErE=;
        b=WBNLMmZd67Sn278q1rhtakKCsdXavdQXKX4p605PG5AlWXmnVSe5XpYOy9/lzLS4al
         l/n1ctBSzJwtjLFwzAyZQmR7TzEHRYp+ETVCrsz/hamedblOII3Rq8XhFx4wBqoWKCw/
         uMCktMxAyJLozwbnXIRb0Yoq98KAafcJ4lM2JdK+8TgjBRnlvdncHz1iYhcN2C+ia7fi
         Z0ypFrvS8TL3CqxQZKOkJdLTFCCGJ1QVdGxo0blZzWihIauASda8wAt2kSVwflgk/qXS
         5hN4RGSfgyxkwDTcSvYPdhUr0aoyqabukQbI4Plr+aeoJM0ZTtd24k9kofvoiZ45QUFh
         T+/Q==
X-Gm-Message-State: AFqh2kqerFc8/phq28S8BTO0AgsBILT+AG3Z4dUfgiF4eu+NBq92xM8+
        AP9DzAVSrMZXz3r+OX43htrr9z5NZk2SeD8D739t8w==
X-Google-Smtp-Source: AMrXdXtbRwrhsETPSpzdFoX/sF7xdUw/sHjyyeAXaIonbA7r+3iCHQib6JsUcneLeqrwfhYhrGz8psuDJ10yZ2bfq0M=
X-Received: by 2002:a0d:e8c9:0:b0:4e0:7220:22fd with SMTP id
 r192-20020a0de8c9000000b004e0722022fdmr2041281ywe.272.1674241035508; Fri, 20
 Jan 2023 10:57:15 -0800 (PST)
MIME-Version: 1.0
References: <20230118031514.1278139-1-pmalani@chromium.org>
 <Y8e+YlKiC6FHdQ5s@kuha.fi.intel.com> <CACeCKafPzxYWh5a4xmeggc+4zRou73kHnwV-G5xMfQDheGgGdg@mail.gmail.com>
 <Y8kMsw/wT35KN7VK@kuha.fi.intel.com> <CACeCKaceu1KCPtpavBn23qyM29Eacxhm6L9SN78ZQxdzRCOk6Q@mail.gmail.com>
 <CACeCKaea_ZtzUZNAHMaDU9ff_BBs6sF_DqqMnkFcW_=_txVL4w@mail.gmail.com>
 <Y8pb+BTd7VJqwLzq@kuha.fi.intel.com> <Y8pdha65Co0DCihr@kuha.fi.intel.com>
In-Reply-To: <Y8pdha65Co0DCihr@kuha.fi.intel.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Fri, 20 Jan 2023 10:57:04 -0800
Message-ID: <CACeCKac6zNNm7_aFLoy3eDLjcrvcKCdKLrHZq38dVLMSzW9ZTA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: altmodes/displayport: Update active state
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        bleung@chromium.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 20, 2023 at 1:23 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Fri, Jan 20, 2023 at 11:16:43AM +0200, Heikki Krogerus wrote:
> > It's not be possible to enter a mode with tcpm.c unless there is
> > a driver for the altmode currently. Something has to take care of the
> > altmode, and if that something is not the altmode driver it would need
> > to be the user space. Right now we don't have an interface for that.
> >
> > In any case, if there's no driver for the altmode, then the partner
> > altmode "active" file should not be visible.
>
> I meant read-only :-).

Got it. Thank you for explaining this to me :)

I will send out a v2 soon.

BR,

-Prashant

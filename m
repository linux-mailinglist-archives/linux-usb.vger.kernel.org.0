Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33BC427BC0D
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 06:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbgI2EaJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 00:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgI2EaJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 00:30:09 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C62E8C061755
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 21:30:07 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id o9so3537945ils.9
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 21:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XJSi4zHQ8aRAeaZP/mbDWj8sPeoh/uhgWU7jT523VVI=;
        b=A8OGHzuGcpXSZhO31woQKPbTDl0zaVEMQvYJnEIxrsyDXC2p46qArTXnQAjkGNhqwa
         cVppAvg9MWZYjOkPf6bUsnhqLhBdW4WiFMlOr7lXtkDG8eRGAq8Y0sKGYT6IBNhdHuyo
         XhUw588Pf3aFy0Xt59GaKVBtqTSFd+OMJqbWq8DmYlFY5bnAcpO5A7CLkOl4nCrZj/J3
         5ASdzD6d7Z1CF2KYYUa1hAgUcHbRaGA8q9R/EU/f4dzF3u2rjNmP/BmoY/ju6W8kI+S2
         pGga1m9aIdTtmM8BGsvmFQ2hQF68eFEEv8nCHYA4LdKFR4Lo+V5IWNn/Dzks4CkgUGgV
         nBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XJSi4zHQ8aRAeaZP/mbDWj8sPeoh/uhgWU7jT523VVI=;
        b=YFFMxSMKFyLo7Tx5Fc+FODabu2Qe37QdU3rVzXFkJV0aPLZR5l7oD+9zrlNFbyE4an
         FF/Ly0pqK0RuXWQjNRxQWIGOLDvi2myjs/8CE84z4zef46qRQdOrJPJ1hXl6JOtbcJQe
         2BFn9lHi7Cl17ZhO3THao9bYMlKVL0HXdOIXwMC9edWp6GgqF61LU5zbfL8YiyqZv64j
         5G/3x6vU6BWgIg/h0Ryrk5QBQ8YG8IxLkK4qDRtB8E00z+0wHDh0Lvhb0QqbVtU/K7mS
         jChCxn7xcenDkVWV3ZoJFv5tha2UWOckrVuzMUnAJuC3ip+KNvRDsm+CJDGlf+HMrD+x
         z2GQ==
X-Gm-Message-State: AOAM531FMnkq/Wez2abPdx0r7TdbfLZUNFMG0O0CQIngSnKUlV2jUGXx
        PT62PxtOtyIvKc5XwisURbmmuVKHUiT3D0l0DlQf0/zB9Ec=
X-Google-Smtp-Source: ABdhPJyjm2o9X/vgQ0auDA5B0jtfwTsM8mJVYBt6jKt3ZiIQ/2skKFSCyrwqf6MlGtnxeth6JjvTcWHFiNU3lupqMCA=
X-Received: by 2002:a92:b699:: with SMTP id m25mr1608248ill.0.1601353806647;
 Mon, 28 Sep 2020 21:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200825055505.765782-1-lorenzo@google.com> <20200825055505.765782-2-lorenzo@google.com>
 <6e4fe5a7-5088-4b31-9477-9cdb2ad83f9d@www.fastmail.com>
In-Reply-To: <6e4fe5a7-5088-4b31-9477-9cdb2ad83f9d@www.fastmail.com>
From:   Lorenzo Colitti <lorenzo@google.com>
Date:   Tue, 29 Sep 2020 13:29:55 +0900
Message-ID: <CAKD1Yr0+z1+Mr70_kPyc2p+pPHEUwwVtHhtQ7kTaLe8w4PSMCg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] usb: gadget: f_ncm: fix ncm_bitrate for SuperSpeed
 and above.
To:     Sid Spry <sid@aeam.us>
Cc:     linux-usb@vger.kernel.org,
        =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 29, 2020 at 11:52 AM Sid Spry <sid@aeam.us> wrote:
> I apologize for hijacking your patch message, but on what hardware
> are you testing? I've been trying to find USB3 device-mode-capable
> hardware for ages.

I'm using a rooted Pixel phone. Not great as a development platform though.

I think my colleague Maciej (CCd) has a better option involving a
developer board.

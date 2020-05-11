Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4051CDB72
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2020 15:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729546AbgEKNkN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 May 2020 09:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726115AbgEKNkN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 May 2020 09:40:13 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FB9C061A0C;
        Mon, 11 May 2020 06:40:13 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id u5so1970612pgn.5;
        Mon, 11 May 2020 06:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4dSKfo4BB8XKhh+B2SEjxAoByaA8GenGemeaNW0Wgtk=;
        b=tJUFehzsx9NE8C3Nfpwlix9zA/6zXpqSXQYSvSF/Ej63HHRVPTGniQaWJNTjEkywuK
         H6ERbyt5iYUbPfYTQe4VMvE08Wtdv3Q7B/pekO/JGiidWawx8oZVuEYgLjvyiG3iKPNl
         zFfeGEdCyc/u9qR8QKN4dbVBkXZJz5y6qkD8AvAHINYaPl8GmMPbguKUKXcXuNTax/Ht
         Gf7ygazBTt5nz8rFfa+jH66TBhMJlL/px9tHyvQhS5TW5TBZcwQCz0pDqUcA2Ne+i7aL
         /43TGzR/nEWmwy54D4H+uqzLChcHVXFDtUCr1HW1iDrDEMfcwkRcZLkN81QsY8itPcIh
         YMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4dSKfo4BB8XKhh+B2SEjxAoByaA8GenGemeaNW0Wgtk=;
        b=X3/XKDduMV0OPHSJGMoga4eStDOi8bDA2oHE2a+W3gf923LWCH8/s7OpTRW7k/Z9m2
         EHRwp/U467U5cSOkcYH2K3UXSAOkoK9ZduJqxDI+TYN3gxPZVs5XG7eyTm+ABnQ4M5GM
         KuTPuvdc7I3uN6mxkMmN3mMPpQzERclBdaHCjjqDm+5flLSQjReQsjfNIF94eQYsxUFK
         NqYCK7yqF+sJotqMTv7Bl9s2WVYZKQaXrIt/KazpialQblE7EWQJtdth/bMGi2WDVtIE
         1Ri4+x6t3RGZTeV/uKoPJB//0m6kc9YQwrU0TSWQdMRXBT4PpRA30giUDmluWh7GbgeX
         ZvKA==
X-Gm-Message-State: AGi0PuZ/cJaEMawAGdSvjfJ1QhQZ4aYgZabHVDSH6KAAFwG5MKcf5e77
        lXz4L4odwYtbQx/MTC0MaQ92U2RQssv+3fmoOwY=
X-Google-Smtp-Source: APiQypJNu08YGox6J7Brmn/GRAXX6e4vbSjZ02oGKZ/tcJXxW/ZoFrpsbwsCZZ1AibyOYf78YMLTFqRa+WUgBbx3NOQ=
X-Received: by 2002:a63:1d4:: with SMTP id 203mr14142201pgb.74.1589204412529;
 Mon, 11 May 2020 06:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <526351589195104@mail.yandex.com> <20200511113506.GB2062175@kuha.fi.intel.com>
 <CAHp75VcwUcbtZFQExEoJg9sFFVa_ueUT71SiMCVWetgaQg6kDQ@mail.gmail.com> <5ee2b9ef-25e3-c049-3f82-d3d51d392824@redhat.com>
In-Reply-To: <5ee2b9ef-25e3-c049-3f82-d3d51d392824@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 11 May 2020 16:40:05 +0300
Message-ID: <CAHp75VdUeBt++mJCvWkHm82XQ+ze1U6OpQ9fv8Hb2d1Nfsz3pw@mail.gmail.com>
Subject: Re: your mail
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>, jakub@bilan.me,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        USB <linux-usb@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 11, 2020 at 3:29 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 5/11/20 1:44 PM, Andy Shevchenko wrote:

...

> > I would rather disable them and issue a firmware bug.
> > Vendors, including us, should do something sane about this.
>
> I have to partially disagree here. I agree that for future hardware
> versions the firmware team of those devices should offer a saner
> interface. But for the current hardware gen I guess we are stuck
> with this and having a DMI table for popular models (well any model
> a Linux user is willing to submit a quirk for) is better then simply
> not having things working under Linux.
>
> I do wonder what Windows does here though. Perhaps the INT3513 device
> has some ACPI methods to query for more info, like how many Type-C
> controllers there actually are?

I think they do silly things there in usual obscure MS way, i.e.
hardcoding everything in the driver per platform.
That's why I'm really disappointed how things are going on.

-- 
With Best Regards,
Andy Shevchenko

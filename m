Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D12C172ADA
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 23:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730269AbgB0WH3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 17:07:29 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:41334 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730120AbgB0WH2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 17:07:28 -0500
Received: by mail-vk1-f196.google.com with SMTP id y201so363486vky.8
        for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2020 14:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b8QGsDauXMWl04pUSYOUK2oYeibV2ZardTahQjqaKFk=;
        b=HggjBvjjWDPJZSURFuVLSTpxwz1KWndp/rAWYhrL+pln1rYsnyCMEyQ3snRtzaNEHg
         n9IRY4ZR5Wo1EHVL64wxWm9xoF5McMgaU5AOtlrZ+WFnqVK2tbpUk0G/Ph785hgt6It4
         oS3tzrIWm2mJXWPO4lcujLYuwTH+J1DQiTTc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b8QGsDauXMWl04pUSYOUK2oYeibV2ZardTahQjqaKFk=;
        b=KKxscWCZ+XADnYYm5/kqqUrEA0opEQuGSxG1i9naofu4dar/mJ3DwvHYyOV4P23qVc
         1H9/DdYsMStI8xgJg7H/oWFNItzt6SbuOHoEmM56JDOhPnUJfkZ30ue9jknC2CsLs1DQ
         2VoykX686tGM2rNcOpCH3gdjzhxkoGVMhAxut6mg6xOXbEr8TgRqOFTRWHqnpGe9j+OS
         Str0N1spyyYuGpqZg0c17+ufQZb7yGERk/894sKOF7bmXmvTLofwF3wtRi1/+3x2laDU
         zPKmdlB38fQUI0M0kNJS7xafHl9Smsudysg+onvHc7NtC4H0elyZtSw0GlyUCqIdapdm
         JQRA==
X-Gm-Message-State: ANhLgQ3WopiuuZxun3lM9F9tWTPU4NaV08Sl6VBdD953qRR/62h+opBG
        SIOjHF6bV0wGMNU2Lm1cfr4C0cpIAio=
X-Google-Smtp-Source: ADFU+vuNcpkn/WXiFyIjmthB9mysgCXQ8cal/HQMBHXx3rqK9HjzDnisdh1J8ipkHLOLUa5CwAcTng==
X-Received: by 2002:a1f:1806:: with SMTP id 6mr858782vky.85.1582841247264;
        Thu, 27 Feb 2020 14:07:27 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id d8sm2180477uan.13.2020.02.27.14.07.25
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 14:07:26 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id l6so238649uap.13
        for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2020 14:07:25 -0800 (PST)
X-Received: by 2002:ab0:6605:: with SMTP id r5mr531711uam.0.1582841245045;
 Thu, 27 Feb 2020 14:07:25 -0800 (PST)
MIME-Version: 1.0
References: <20200226210414.28133-1-linux@roeck-us.net> <20200226210414.28133-5-linux@roeck-us.net>
In-Reply-To: <20200226210414.28133-5-linux@roeck-us.net>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 27 Feb 2020 14:07:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VZYOV-uNwPB3zBpfdWV6U0qFeC1HTqwEWR1+x962J3mA@mail.gmail.com>
Message-ID: <CAD=FV=VZYOV-uNwPB3zBpfdWV6U0qFeC1HTqwEWR1+x962J3mA@mail.gmail.com>
Subject: Re: [RFT PATCH 4/4] usb: dwc2: Make "trimming xfer length" a debug message
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>,
        Boris ARZUR <boris@konbu.org>, linux-usb@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Martin Schiller <ms@dev.tdt.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Feb 26, 2020 at 1:04 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> With some USB network adapters, such as DM96xx, the following message
> is seen for each maximum size receive packet.
>
> dwc2 ff540000.usb: dwc2_update_urb_state(): trimming xfer length
>
> This happens because the packet size requested by the driver is 1522
> bytes, wMaxPacketSize is 64, the dwc2 driver configures the chip to
> receive 24*64 = 1536 bytes, and the chip does indeed send more than
> 1522 bytes of data. Since the event does not indicate an error condition,
> the message is just noise. Demote it to debug level.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/usb/dwc2/hcd_intr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Suggest a "Fixes" or "Cc: stable" tag.  This one isn't as important as
the others, but presumably you'll start hitting it a lot more now
(whereas previously we'd just crash).

Reviewed-by: Douglas Anderson <dianders@chromium.org>

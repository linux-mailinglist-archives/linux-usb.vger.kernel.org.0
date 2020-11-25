Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B78982C3D3F
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 11:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbgKYKIX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Nov 2020 05:08:23 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43660 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727376AbgKYKIW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Nov 2020 05:08:22 -0500
Received: by mail-lf1-f68.google.com with SMTP id d17so2291532lfq.10
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2020 02:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QYwVkWBRLBBcc2p2VCNmphBh3zbzfm3oi05bo7e5Ux4=;
        b=jKna8/B69jivfj6jU5xC5+inCcG8lbNsojyQlsy+x2R6Lt9s4mHAuzxIjkOV8JUBkQ
         K7zbP90LH6S3P/NbwEQNl30BCTFOqVZG5HnEwchtDEfscdJ8QGNgPmx4OlYypYVskN9D
         QHFfJbVyS/sFqL58gEWrMOLFCjuHOlkxB5Pj+gC6j4SMB6Pez7Oht86oPCsrDB/TW7gX
         SrFJiLfJm5UX0BFXjFokjmB+XKK2D5/ShBUDZF24UzePSFByBzGRyeSUdxscng7Gi4Oq
         XLgAQJpqLVk12ca/ZHR+0Iil31SnpA0T9tjfw8y07FvHknRdDUAmLHN+gXEyW8IxBKEB
         itvQ==
X-Gm-Message-State: AOAM530UPKSCq9Df1fsypqOLWaWj41jci+g9zanOdJpjeSbulrD1nsNX
        lZ5kYWtWOnw0Vu8cBfMbbAE=
X-Google-Smtp-Source: ABdhPJyYfR5ev04GpgZAobs7OzbD7SQPHz8KYbyEaQ/jAKcB6Vc20nQoAF96RS6VuIJz+gNLifbUDA==
X-Received: by 2002:a19:c3cd:: with SMTP id t196mr1091319lff.26.1606298900720;
        Wed, 25 Nov 2020 02:08:20 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id b79sm198235lfg.243.2020.11.25.02.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 02:08:20 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1khrj0-0003Au-At; Wed, 25 Nov 2020 11:08:35 +0100
Date:   Wed, 25 Nov 2020 11:08:34 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Giacinto Cifelli <gciofono@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        Lars Melin <larsm17@gmail.com>
Subject: Re: [PATCH] option: added support for Thales Cinterion EXS82 option
 port.
Message-ID: <X74tIqR+UOH/E4Sz@localhost>
References: <20201124094155.10510-1-gciofono@gmail.com>
 <X74mk/lw2NYJ78jq@localhost>
 <CAKSBH7Gha4rwacF-gE26x9pTsAgeV3ASvb+BYm5Xz_B3jN_BqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKSBH7Gha4rwacF-gE26x9pTsAgeV3ASvb+BYm5Xz_B3jN_BqQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 25, 2020 at 11:00:26AM +0100, Giacinto Cifelli wrote:
> Hi Johan,
> 
> On Wed, Nov 25, 2020 at 10:40 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Tue, Nov 24, 2020 at 10:41:55AM +0100, Giacinto Cifelli wrote:
> > > There is a single option port in this modem, and it is used as debug port
> > >
> > > Signed-off-by: Giacinto Cifelli <gciofono@gmail.com>
> >
> > Thanks for the update (and thanks for the review, Lars).
> >
> > Using the option driver for just a debug port seems like overkill, but
> > ok.
> >
> > Some form issues:
> >
> >  - When updating a patch always include a patch revision number in the
> >    Subject prefix (e.g. "[PATCH v2] USB: serial: option: add ...").
> >
> 
> technically this is a new patch, as I have changed the name, but I was
> reserving the v2 for the actual MV31 patch that I will send in the
> near future.

Since it's the same PID you're adding I'd still consider this a v2 even
if you changed the product name, but I see your point.

> >  - Try to follow the convention used by the subsystem for the Subject
> >    prefix (i.e. "USB: serial: option: add ...").
> 
> ok. Should I re-submit this patch?  Do you prefer v2 or v3 for a new submit?

Yes, please do send a v3.

Johan

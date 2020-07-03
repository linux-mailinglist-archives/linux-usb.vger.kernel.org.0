Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98689213585
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 09:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgGCHur (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 03:50:47 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39500 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgGCHur (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 03:50:47 -0400
Received: by mail-lj1-f195.google.com with SMTP id b25so32272691ljp.6
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 00:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WBAc4pReStgdvHteA5FOrcvAVai/UfDiQcL1d/Y07Zw=;
        b=n3UIuZ8NoO1e28Fo87HrMO3FLhbnAAwzofrRJ0C9byqKIYrhMrTdcUf/i87L1MfGRJ
         taLOyDksgATrw6DORuBzUZMMmVOm0sDWMYbmNgQOzwY2LqW2e7ncQthxabJa8zsI+Khv
         JQmF1Pw04kTjLjnnSUVHemK32Bg28iuuKgYYy1QpauaDcl0RTk5cCg6LO1XmGpQUZ2Mp
         B1Eex3xY62hnBbi+BpJtDPTrJBmSakG/ktn5aFf9fYLwoBiECTBlqKzte0Tp+ketviBU
         b4Skc7KEjEo0FxauenwxvwxdVsvw+G1epGXcAPQJkUV3ZEKFstBGiMDtWj4taDhvzvZM
         rs+A==
X-Gm-Message-State: AOAM533OHZ+Qqem3L61eGJu80JMKB6/OQzqPHnGQtkYvLT1Uwb02SmMA
        2qS6tH0bQJdyEW3tSJCsybA=
X-Google-Smtp-Source: ABdhPJzekP9vBnfd0uZAvfTslIo7L3hRvDKCGvwasSf9KpODLtRDff8RO+8wgxjhHDpOeLdArK35wA==
X-Received: by 2002:a05:651c:2043:: with SMTP id t3mr19095659ljo.0.1593762644883;
        Fri, 03 Jul 2020 00:50:44 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id u8sm2927403lff.7.2020.07.03.00.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 00:50:44 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jrGT2-0005x0-0p; Fri, 03 Jul 2020 09:50:40 +0200
Date:   Fri, 3 Jul 2020 09:50:40 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Rob Gill <rrobgill@protonmail.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, johan@kernel.org, oneukum@suse.com,
        stern@rowland.harvard.edu
Subject: Re: [PATCH v4] driver/usb MODULE_DESCRIPTION entries to usb modules
Message-ID: <20200703075040.GC3453@localhost>
References: <20200703045811.28154-1-rrobgill@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703045811.28154-1-rrobgill@protonmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 03, 2020 at 04:58:55AM +0000, Rob Gill wrote:
> The user tool modinfo is used to get information on kernel modules, including a
> description where it is available.
> 
> This patch adds a brief MODULE_DESCRIPTION to the following modules in driver/usb.
> 
> isight_firmware
> mxuport
> u_ether
> uas
> 
> Signed-off-by: Rob Gill <rrobgill@protonmail.com>
> 
> ---
> Changes in V4
> 
> Descriptions updated after review, thankyou.
> 
> Patch format corrected

But you never replied to my questions: Why do you want to do this at
all; and why this arbitrary and incomplete set of drivers?

As I mentioned there are thousands of modules with no description (about
a hundred in USB, IIRC).

Johan

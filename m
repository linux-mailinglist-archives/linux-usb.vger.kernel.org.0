Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 671CE2A625F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Nov 2020 11:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729631AbgKDKk5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Nov 2020 05:40:57 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41697 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729548AbgKDKkz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Nov 2020 05:40:55 -0500
Received: by mail-lj1-f195.google.com with SMTP id p15so22472204ljj.8
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2020 02:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a5lFtAHp3P0yH87RVgYEFAQoEcz/a9/NK/fmMRnbelI=;
        b=LUFPH1yOawN+p4h2AmMpQ8XfCAZOeV5zVSpO4cpyZMXAJdo0YeFhAya8v6821k5kiq
         cRfnb3KZUxuCLSwNh5bpnSKAd35ZY7AdbyBlR6YNh9UYwPsVEOcaQ5uEwZBMUkLDeNaB
         pcl02mcAIIQbAUL3NvC7d4Z0PfLSeAJMomcmvZ4Xv3B+v867Wf6YyRdYQ6YBQlOm4lJT
         VxcvUrwmBe1GEQDgpouV89dQjZRsp6G7Nt5bmGbeid0h6fs1/WfJOX+48VZpn7Bo695S
         ifdgqije+V8ZdBkZeKiPbflliOUggFAX/Fh9J8M0pBtTWm2kHi1ZxU8XVW5esVar497a
         q0Ug==
X-Gm-Message-State: AOAM531r/Q2xWHzbTbLs6aF2N5ZZbqYGVTdjStllkYk2rNg+cLQQ6bOY
        giXuY7fdFo27tF7LK3ZxlYI=
X-Google-Smtp-Source: ABdhPJx3Uk5CkLebNWC7nFQWRpCYG36ISM0mFUXGU7Vms0Z08K9TnvvUxY+aRJpmEZNxh2KLU7juQg==
X-Received: by 2002:a2e:879a:: with SMTP id n26mr10781528lji.347.1604486453704;
        Wed, 04 Nov 2020 02:40:53 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id g20sm474777ljn.134.2020.11.04.02.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 02:40:52 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kaGDo-0003gd-8d; Wed, 04 Nov 2020 11:40:57 +0100
Date:   Wed, 4 Nov 2020 11:40:56 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Yann Garras <yann.garras@y3s.fr>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: creating of the missings constants
 for Telit products
Message-ID: <20201104104056.GV4085@localhost>
References: <20201030153927.20795-1-yann.garras@y3s.fr>
 <20201030154431.GM4085@localhost>
 <CACosQq_fHtfdp9sevpVz4jn0uao1m2S5Lmd_27p3LGbFRwScLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACosQq_fHtfdp9sevpVz4jn0uao1m2S5Lmd_27p3LGbFRwScLw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 30, 2020 at 06:22:20PM +0100, Yann Garras wrote:
> Hi,
> Thank you for your response.
> 
> Personally, I find more valuable to read :
> { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_LE910C1_EUX,
> 0xff),
>          .driver_info = NCTRL(0) | RSVD(3) },
> 
> Rather than
> { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1031, 0xff),
>          .driver_info = NCTRL(0) | RSVD(3) },

Sure, but we try to keep the model name in a comment after the entry.
That way you get a more compact notation (one line less) and you can
still find the model name easily.

> But where I agree with you, is to make a choice and apply it.

Yeah, the current half-measure isn't optimal.

Johan

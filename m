Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C5A229416
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 10:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgGVIyV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 04:54:21 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43293 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726807AbgGVIyU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 04:54:20 -0400
Received: by mail-lj1-f193.google.com with SMTP id f5so1623505ljj.10
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2020 01:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VIxyEY5Wm3emWAY7+amjFgiqcLKULhJpDOjWsiR3qFY=;
        b=BQfdGMtw72mGRBsr3Sc5SK+tHMOtJsm8rflVwzJaaCzBc9MVeDorghwGcQfzEoUSVd
         ONt57br/17ddCLl37YBhNfVVWXFoKNJurNXtahVATiSco47dVMGvFS0lhqBSfl/eI4TI
         oX92KbK8tic7qAKYN+TMNH0c1XQxrWrlYTHplECfRSBqtUQeNdOw83tX/c9/L95Jw0Vl
         VZNnJlKxYx8o25f2hf/vArUQZ/d5DLZzzPchMqoGS8Xliy+NagjoZVJ2mvx00Kgz6ytk
         18iIIJQPNBRu5GHoddy7XZY9r4ll3jlaWJgcVIAwqV43iu8iQKEp0FwMZkrPyfXELxsp
         Olaw==
X-Gm-Message-State: AOAM533mxZI7Z0F8vrAnY4Zf7c1yla3nGKWDdLjeYbWepjvW5nVu+gig
        yRNIscuzhKsFAUmKDXhiC1I=
X-Google-Smtp-Source: ABdhPJx23Ua6IEUFW7L9W72x3BlFIQLg/Btf5Y/4pqtuBcGlMZM2QDsT4WDqCPt5wem6IvhLjGyS3A==
X-Received: by 2002:a2e:2242:: with SMTP id i63mr15421590lji.370.1595408058159;
        Wed, 22 Jul 2020 01:54:18 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id r11sm6245990ljj.76.2020.07.22.01.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 01:54:17 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jyAVw-0005ax-Nf; Wed, 22 Jul 2020 10:54:12 +0200
Date:   Wed, 22 Jul 2020 10:54:12 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-usb@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] USB: serial: add support for MaxLinear XR21V1412
Message-ID: <20200722085412.GH3634@localhost>
References: <20200709222126.5055-1-angelo.dureghello@timesys.com>
 <20200714100851.GB3453@localhost>
 <CALJHbkBiRM1=rV_T_c4xHFpg98en3PS3EiQqcM+v_s-Uts3MbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALJHbkBiRM1=rV_T_c4xHFpg98en3PS3EiQqcM+v_s-Uts3MbA@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 14, 2020 at 01:16:48PM +0200, Angelo Dureghello wrote:
> Hi Johan,
> 
> On Tue, Jul 14, 2020 at 12:08 PM Johan Hovold <johan@kernel.org> wrote:

> > There was another driver for this device posted recently, and which
> > appears to have more features:
> >
> >         https://lore.kernel.org/r/20200607162350.21297-2-mani@kernel.org
> >
> > Would you mind taking a look and see if that one would work for you?
> 
> oooh
> 
> I grepped for this driver in the mainline, found nothing, so thought
> it was missing.
> Probably a check in the mailing list could trigger it.
> No problem, it was a good exercise that i am happy with.
> Yes, Manivannan driver seems more feature-rich, sure.
> 
> Goung in "idle" mode, let me know if you need anything from my side.

Ok, thanks! Another pair of eyes on the driver and if you're able to
test it before merging that would be really great.

Johan

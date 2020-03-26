Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88EE3193E2D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 12:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgCZLsr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 07:48:47 -0400
Received: from mail-pj1-f41.google.com ([209.85.216.41]:54231 "EHLO
        mail-pj1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727970AbgCZLsr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 07:48:47 -0400
Received: by mail-pj1-f41.google.com with SMTP id l36so2334199pjb.3;
        Thu, 26 Mar 2020 04:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SDvQOZJ+z1FKNbiL9FyHx2teONjRmGEPng9pjTyfUhw=;
        b=DxvS7Di7vGig5VierRsGTFrp2KHACmu3N0VCuAVhl71TaPVIWJxh7/QAhK2sWXwrb+
         12uJ8ysbnuNAwHHJZSuQ1SYV+2opZs3coSegia7jVI3BfmbJQzTvTV3YYAZVCssGLL94
         joSeBLv6kJxp1lDcBai9W31UPopoayRdA+CUC0DsRu0vb72aB0L3wse5BzKW2eUaHlUJ
         ObqFPqqOtmpK1f5SK8QWgU1dFLlB6nXbrK9A9lRNErXVGmnBV4nVa6eFG+u+e3qHuHh5
         hQYB2VseyxTKW+e5xb/nQjTYpFzedzDd7bImpJbH5umAHlZAkPIOL1KCwH83L25Bu+Ae
         6nQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SDvQOZJ+z1FKNbiL9FyHx2teONjRmGEPng9pjTyfUhw=;
        b=fF2Qmlok4G0xfoeSktkO09YgiPz3Rdcq7ikOTuopxIPsX4YwCBjKX8PGrcMvflXspw
         2WpYP+zlTnmAJ3hvi/UOEwLcJvfZMGDguF8Gl06JR1O88cVmb2ce/QATZJYmGtNHCrcj
         QHlsa4tlnu9/slZ8DGQl3JljxxG18BUMSAALgMe74oaMJ6hfY1jYTSU/+6YWAVWa/szy
         yPEDLVItgpxkDW6mSjGHxFDoxRGTL7cBDH+x7cVB8nkjwSWM6l7Sbo7jZRugBz0vbZA8
         yq9+6gjMZX7x4eFxLLZcfzGZuY0uXGrjVWsc+muUq5xbzAF8IX4FL6eHX2QpQqGRCnnt
         z44A==
X-Gm-Message-State: ANhLgQ0bxDRJ55d5mxngQmFu1dCDPUr+LfoHCTHjUCHQclObcFlw2dzi
        fVtvfrZzS/PzQQ3DvDj+//4aGnIL
X-Google-Smtp-Source: ADFU+vvgVqxrdWwarHW1Pqe7wx8TuoinIozZiNkO0UZgT4jrKt06QFL5k3UW4nkoR/AzEdWRBWQvBA==
X-Received: by 2002:a17:90a:aa88:: with SMTP id l8mr2687590pjq.10.1585223325597;
        Thu, 26 Mar 2020 04:48:45 -0700 (PDT)
Received: from SARKAR ([106.51.108.92])
        by smtp.gmail.com with ESMTPSA id h71sm1489894pge.32.2020.03.26.04.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 04:48:44 -0700 (PDT)
Message-ID: <5e7c969c.1c69fb81.37131.654a@mx.google.com>
X-Google-Original-Message-ID: <20200326114842.GA3906@rohitsarkar5398@gmail.com>
Date:   Thu, 26 Mar 2020 17:18:42 +0530
From:   Rohit Sarkar <rohitsarkar5398@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Hubert CHAUMETTE <hubert.chaumette@kolabnow.com>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        linux-newbie@vger.kernel.org
Subject: Re: Beginner query regarding usbhid
References: <5e7b5fbc.1c69fb81.cace7.7aa1@mx.google.com>
 <1585147543.3831.8.camel@suse.com>
 <5e7b6f15.1c69fb81.d92d3.facb@mx.google.com>
 <b799aa1720fecb94d832264b4561eb8a@kolabnow.com>
 <5e7b9127.1c69fb81.f2f8b.582c@mx.google.com>
 <cfda560c-ad5f-5e71-ab22-d8639688722b@infradead.org>
 <5e7c3e48.1c69fb81.7da14.34ab@mx.google.com>
 <fdc818d7-842c-cfef-3654-0478e74bfa73@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdc818d7-842c-cfef-3654-0478e74bfa73@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
On Wed, Mar 25, 2020 at 11:07:55PM -0700, Randy Dunlap wrote:
> 
> So /home/rohit/kernels/staging is the top-level kernel source directory?
> 
> "M=dir" is for external modules to be built.  AFAICT you are not building any
> external modules.
> 
> Just run
> $ cd <top of kernel source tree>
> $ make all
> $ sudo make install

Wow it worked now.
I ran make and make modules_install install. After that I restarted the
system.

Does this mean everytime I do some changes to an intree module I need to
reboot my system?
> 
> 
> -- 
> ~Randy
> 
Thanks,
Rohit

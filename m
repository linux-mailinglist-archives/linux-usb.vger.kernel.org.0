Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C91E7376028
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 08:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234479AbhEGGTQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 May 2021 02:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbhEGGTI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 May 2021 02:19:08 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F8BBC061574
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 23:18:07 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id a11so4617916plh.3
        for <linux-usb@vger.kernel.org>; Thu, 06 May 2021 23:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KyDiuqMW0s1s2aQ/Z7faQGRpPjITTWlTsC+vEZZUdCk=;
        b=KhY93QcXel4wXvLNXZDh6sgiqYKSBluSPZtN4eaTHLrvYyBhxEtr5KdFza9e09OLjA
         tonG++7sPOBaVceVdDu/o/bTg47A7pa25FVJnt7qC0zg4l3/N9e1dqo/kB7zhYLNtF9U
         /L1003Cbhj4DQnGtnmzwjieZIIC3RPp2/wj/iPCLRf0RUMutjUc/zaDIZwCGsBc47dSu
         A2ZmJXvJlgzizqx1R9YxWptSnyeNYYA2d3sZN8r7nHy5RVp2pxdyiOClwkBpoPMuTsmB
         tmtuZE2Eb+AIlG+TqJb9E7rcq4ordKXVuXcxux9GanaoTT9Tw8dm5+ZuXrFODvkqFvkI
         dRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KyDiuqMW0s1s2aQ/Z7faQGRpPjITTWlTsC+vEZZUdCk=;
        b=s5py0BQspvydhnsyvHzz9WZ/7PrQ3zrl9gYXJ8LKsvbEm3MX/apixAlzZuMflIcrFS
         Pq5vIZXBNw2HxXh3x5+xG9Y+IwAA0PPpGqxux4q2Wi84hhvq1Fl9nss8Hb34/+b17cG2
         0YApFQFjzFqmLxlgBjEcLR5JIvN8+00ncc/LDhLHB6r+uH5ATES0TH4GacbkLyc1llQv
         j3FIutni7thGStDz8XbolHpZGWMYRkw9YuuAv7Ygg8WSeg8Ggs9CXi8HlTm6UAu2maJy
         FPZgc8LAuH03wAtgbzdECjkw/HpXtPutvETkicmVBys+SZ3GIltaccxG4qKlYMknm8eQ
         EXqg==
X-Gm-Message-State: AOAM533Ipmc/1pbuOvU0o+3+1gD6Dcvx6umLSmDetJHLGialsyecqi8C
        0zH4rteKpwoUu0bWsHJqHeX9W/03ZBs=
X-Google-Smtp-Source: ABdhPJxWmBenp62nvhLjrqHeW9ewq1DmD6XXixydEIczi/0Gye7JXt/pFPQaTwflGwx4Oe5/0uh1oQ==
X-Received: by 2002:a17:90a:a581:: with SMTP id b1mr8790758pjq.53.1620368286678;
        Thu, 06 May 2021 23:18:06 -0700 (PDT)
Received: from user ([2001:4490:4409:2c26:38dc:7b11:ac4b:4ec7])
        by smtp.gmail.com with ESMTPSA id f18sm4397909pfk.144.2021.05.06.23.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 23:18:06 -0700 (PDT)
Date:   Fri, 7 May 2021 11:48:00 +0530
From:   SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] *** SUBJECT HERE ***
Message-ID: <20210507061800.GB7789@user>
References: <cover.1620361861.git.saurav.girepunje@gmail.com>
 <YJTXfYKA8B7RA/z8@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJTXfYKA8B7RA/z8@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 07, 2021 at 08:00:29AM +0200, Greg KH wrote:
> On Fri, May 07, 2021 at 10:06:17AM +0530, Saurav Girepunje wrote:
> > *** BLURB HERE ***
>
> No subject or blurb?
>
> >
> > Saurav Girepunje (2):
> >   usb: musb: remove unused function argument
> >   usb: musb: Remove unused function argument
>
> Again, these have the same subject line, which is not allowed.
>
> Please fix up and resend them all (we only saw 1 on the mailing list.)
>
> thanks,
>
> greg k-h


Plese ignore this mail.

I was trying to learn how to send pathes with cover letter from below
https://kernelnewbies.org/FirstKernelPatch

and did not realized that on sample command set the cc list
git format-patch -o /tmp/ --cover-letter -n --thread=shallow --cc="linux-usb@vger.kernel.org" 3b12c21^..b7ca36a



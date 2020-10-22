Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD8FB296488
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 20:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2902409AbgJVSTF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 14:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2902404AbgJVSTD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Oct 2020 14:19:03 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B77FC0613CE
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2020 11:19:01 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id a23so2566657qkg.13
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2020 11:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DH64Jki2b0cRGtwK2eLq82tqva3V/YIIJDOJFec/tqg=;
        b=kx4xqwnj6h5/3l+RNf43SX2STa83rjQXy3KG/a57ZTQkXBDa9URlcOtQNuoZxZ+9j8
         VH5+uCDuYnjNMzJPkQWVKMHY8/xJeN9Xrnwzflr2X5OaBEVrNldjMTOgKYeyqSYOhhaq
         wa6Spyb+lqtHxPLCUC5GqK82Fa2BOmDT2WLOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DH64Jki2b0cRGtwK2eLq82tqva3V/YIIJDOJFec/tqg=;
        b=nYYuCSYeIQcMggYqGpZRIpcUQg8Hu9JZM5tMhXYBS4D82ZW9UHGECHwsisRiW53vz5
         FSRxjg0fX4OkKZ3mWuk19tNdvttyg6bvPshH74HhthZv/H2zlZt/3Mu46X5dswssPyy6
         vK4rkTrqvvP9INOkmAWK3CBXjv7f45eOrvr6n5g+IbtrK5sKGleTjsXWcY2cjOTGFRkA
         8zznNKjGWv9sfamVZGgAQXELnr3q60hACH0ntjpzGkzthGtCjhk+eLoHzOjL9ojWh8WM
         K5e6EGnhr1z1QthBIxvs5+iwf6pNcKbxBaboqqIyTRrfZ5NHdh2whYB4Orb4U/szRie8
         z1cg==
X-Gm-Message-State: AOAM530pKVuEaRI44FaEOXeAF7f9Dt/JHt1+BWvVBKpfAhDa9DTh++0+
        Dz8m+JY1FAOnQZMOLwglDI4Iky3SBGLgwbyV77M1Fgu/sz4=
X-Google-Smtp-Source: ABdhPJw5W1L6+mWM55SD0J8J4cwzi+kKAcsvzkV/zqpOXBZzOpkXGXfNRiyR/JmB2qgrw0akBx4ZT225n3JmCsanr70=
X-Received: by 2002:a37:a9c9:: with SMTP id s192mr2183416qke.128.1603390740776;
 Thu, 22 Oct 2020 11:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201022061554.3418060-1-pmalani@chromium.org>
 <20201022065719.GA1440360@kroah.com> <CACeCKacvhtSfQ=hGYHi3AdrTT+XY2RpKmPHuYWoxNVmRWMeBBA@mail.gmail.com>
 <20201022071753.GA1470296@kroah.com> <CACeCKafjm-T5WnQNRbpKm3OwxqYH+_MxLMg60-=RrpJFBzcKyA@mail.gmail.com>
 <20201022124248.GQ1667571@kuha.fi.intel.com>
In-Reply-To: <20201022124248.GQ1667571@kuha.fi.intel.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Thu, 22 Oct 2020 11:18:49 -0700
Message-ID: <CACeCKadwa4-xOrihjv-6mkxxFtR5VeFuExP48hTrmteXw=fr9w@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: Expose Product Type VDOs via sysfs
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

Thanks for your feedback.

On Thu, Oct 22, 2020 at 5:43 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Thu, Oct 22, 2020 at 12:25:07AM -0700, Prashant Malani wrote:
> > Hi Greg,
> >
> > On Thu, Oct 22, 2020 at 12:17 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > Given that your current implementation is not acceptable, something has
> > > to change :)
> >
> > Got it. I'd like to see if Heikki has any suggestions on naming these
> > entries better.
>
> Why not have product type specific attribute files?
>
> So if the partner is UFP, then we expose ufp1 and ufp2 files that
> return the UFP1 and UFP2 VDO values and hide the other files:
>
>         % ls /sys/class/typec/port0-partner/identity/
>         id_header cert_stat product ufp1 ufp2
>
> If the partner is DFP, then you expose the dfp file and hide
> everything else:
>
>         % ls /sys/class/typec/port0-partner/identity/
>         id_header cert_stat product dfp
>
> And so on.
>

Makes sense, thanks! The only query I have here is , does the kernel
*need* to implement this logic? Userspace can read id_header VDO and
figure this on its own (parse the Product Type specific VDOs
accordingly).

Apart from that, I can work on implementing this if there are no concerns.

Best regards,

> thanks,
>
> --
> heikki

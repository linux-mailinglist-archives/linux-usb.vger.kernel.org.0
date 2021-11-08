Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7E44480CC
	for <lists+linux-usb@lfdr.de>; Mon,  8 Nov 2021 15:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237673AbhKHOIi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Nov 2021 09:08:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236375AbhKHOIh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Nov 2021 09:08:37 -0500
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE3EC061570
        for <linux-usb@vger.kernel.org>; Mon,  8 Nov 2021 06:05:53 -0800 (PST)
Received: by mail-vk1-xa2a.google.com with SMTP id d130so8276370vke.0
        for <linux-usb@vger.kernel.org>; Mon, 08 Nov 2021 06:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shantur-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tZJpdHOaG0iUf4w7R7AzyCRtmPHuDKsAWZnrMbfncFM=;
        b=VgjaKR55G/D4nZjX1YOC3DX3oSIfBkO1J0otGZr9fOqR/ddB1D1DxTcIWWaIU4tZti
         E08BrbDlphyvf9JuDqrLT2ONmgvv9ne40A9Cljfb0AWEwJUKEaPaPO4gmJwtqdRWLTQ1
         rfh1FGnC8aO970qf0KWTmM4YZ42z87ebIT4DWENDbVq1AsP4Dw/mLyE7T93WLCbPQe4O
         94MHpBCPJRsJSj7oxTwM5J3Ko2wGAunnt+Ee9cVjptAioF30SPP7f8451OeSrw2YXor7
         vGHf3fKoXFiFfDIAJ5rKcRbSCGa2dSygT6a+eimVA6Z8kK6DcUzPwLHbEXbUPzWCj7hv
         b3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tZJpdHOaG0iUf4w7R7AzyCRtmPHuDKsAWZnrMbfncFM=;
        b=u/ECyDmYAAvUJ6I8eTnj/+AWOb7iridNu1+mGsktojW0O8Mid/tl/cg8pyhuj6/ya8
         eThiRUVr/Q3yGrC+Hvnii0d7szVZwajhzu+xxdXcAhxf6ehP/7gZTifAnRJcO4O06Bnv
         ZDuduRRNvJT271z71TcZNETRO46LHsW3g/GwMnjAmVd17lnz2sFp0rfqbvH9/RRqSQ5F
         +Vapa+kfreXYcPWhK485cMCIzJGroONzvUXRrlN+0rFITwkW29Skxpi2E3XgT9i7vLNV
         3IiFxESjALj6dRC6igwYQ5j8FDPhGhZioh3LFu3gHSFHpSKm91nh/6EngS31OuXZjLXq
         DdeA==
X-Gm-Message-State: AOAM533InUcI1HyxUzZFdQFFO+hOi3aIvgPeEXX+qE9yg2Xc8c3cK//O
        Qz50/wG3GwqYHX7mI83VfbUjLZBrFfK0lWxXSEQDzw==
X-Google-Smtp-Source: ABdhPJz6OUqE+9l/eylnaLABbYLSl68+5HfjObbW0tS07s3Ll7rPpxn7Z77euCFxg4+Yxbb9s/PShMgZOigjAYB7bIk=
X-Received: by 2002:a05:6122:1693:: with SMTP id 19mr32618153vkl.2.1636380352332;
 Mon, 08 Nov 2021 06:05:52 -0800 (PST)
MIME-Version: 1.0
References: <CABEcMwWwsa1Q_mZaf=QUQb-Gc-xe=gmL6F2v3BPGyrJ7-mfB2g@mail.gmail.com>
 <87sfw6eqx8.fsf@kernel.org>
In-Reply-To: <87sfw6eqx8.fsf@kernel.org>
From:   Shantur Rathore <i@shantur.com>
Date:   Mon, 8 Nov 2021 14:05:44 +0000
Message-ID: <CABEcMwWfXnxY=J1Q7HPSXEFehRi902OzdkNse1+mYfwj33aO+w@mail.gmail.com>
Subject: Re: usb-gadget: dynamic reconfiguration
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 8, 2021 at 1:08 PM Felipe Balbi <balbi@kernel.org> wrote:
>
>
> Hi,
>
> Shantur Rathore <i@shantur.com> writes:
> > Hi all,
> >
> > I am trying to figure out if it's possible to reconfigure a usb-gadget
> > when it's live.
> > The idea is to create a gadget with 1 function - lets say a serial gadget.
> >
> > Upon communication with the host, the host could specify (via Serial
> > communication) which is the next gadget it needs for example a mass
> > storage or ecm and the next gadget can be added to the configuration.
> >
> > For now this only works if the gadget is disconnected and reconnected
> > to the UDC.
> >
> > I want to understand if it is technically possible to add more
> > functions to a live config without affecting existing functions.
>
> the only thing you can do is upon a certain command, logically
> disconnect from the bus and connect again as a new device.

thanks guys, always helpful.

>
> --
> balbi

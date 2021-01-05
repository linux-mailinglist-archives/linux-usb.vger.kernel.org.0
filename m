Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD422EB343
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 20:07:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729656AbhAETDx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 14:03:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbhAETDx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jan 2021 14:03:53 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B12C061793
        for <linux-usb@vger.kernel.org>; Tue,  5 Jan 2021 11:03:12 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id l11so1012941lfg.0
        for <linux-usb@vger.kernel.org>; Tue, 05 Jan 2021 11:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0mQi61kKvm41e4wgxNo9PBR5OcYhOqWErtMbIo1KIhw=;
        b=tx9+QRx3HjQqPDExvf7myex7u7yEQcoISPhkrytY7IGBi3IitE+CDhnnB8pqUEKPMb
         MdZJzCq3/vA1ScsCGsje3qERHVLxk+3Yl5+1tQ5OkDv35qLZZcEkT5LnqUyBoJNIS+6M
         +VVGoS8kjILGmFnaFktM1XfUzB6BRuAuEe0NLkLYU9jGKAQCmgpM12OC6h1jIoPLCtZ4
         F8XQozFRTbxU15EvRRZu7QZhHXo2bRDDiO0SU6P9683l+L4xaHARekXfjAk7XrZUj1+Z
         eAtreCiapd0ldkKl1TBPn7FY9LLL7TIsqwPDbdaWGDeHNP75nC/tOzJQgt16vGrsGq6F
         mhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0mQi61kKvm41e4wgxNo9PBR5OcYhOqWErtMbIo1KIhw=;
        b=DEwHjvNN+iviAafOn5yZxjQjbXRw3GDRX7j5CSht55P6O/7bZUEAp+oy7wdRpcdtMm
         Ptx+3VUgjWNmzyelRqdD+poKeYdIudkPHyJNKPuPCEtgKfNBz/d5WCEeFDOcaOB3pdbl
         I+i4vylIA6yzo2sHfx1YCuJhAuBeHS4Zyg4QyAJnXJSHAi2s3AIPqq2ttG0rdYjRHeNh
         5GIpdRF/XpGZt5F0mSsLF+sl0SVvAlgSWW/t56H0DWIOJG4aZornLWXnDMx1miy3JhX+
         GVuwSrYuKDsEP5Ui+MkYC8sqVVPq8zEJl2QJGd6o/zXmlFgCyHEu+pEbtlwJf0uY6n7s
         JWJg==
X-Gm-Message-State: AOAM532/l/FuVL6JefeJ35d61s4GLUShaDWOkGIVbVoR88hibygEmhA9
        YrCznGVHNQmBL74IXE539I9Rs8q6yTTXtm73mALo9gMndbs=
X-Google-Smtp-Source: ABdhPJw6TWE2jP/Jrfg5Wky05/kg5BrfWPj1uNhRwwaYj3QpH3/66NjRRf4hRe/WDfmdWIBhVP2+/4D9ytVimD9Kpi8=
X-Received: by 2002:a19:810c:: with SMTP id c12mr306465lfd.244.1609873391123;
 Tue, 05 Jan 2021 11:03:11 -0800 (PST)
MIME-Version: 1.0
References: <CAAH9jopk2ngwBDxfmQ8CQsvntW0uUU2e4h3R=drXV2n2y6+Nuw@mail.gmail.com>
 <X/QL6zRpW2gCMn5a@kroah.com>
In-Reply-To: <X/QL6zRpW2gCMn5a@kroah.com>
From:   Tomasz Grobelny <tomasz.aleksander.grobelny@gmail.com>
Date:   Tue, 5 Jan 2021 20:02:47 +0100
Message-ID: <CAAH9joq-mQRUWyJdXx2e7s+92R-7d4jEerTKv6FAJk4yC5weAw@mail.gmail.com>
Subject: Re: dwc2 gadget mode different behaviour with different hosts
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 5, 2021 at 7:49 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jan 05, 2021 at 02:02:16AM +0100, Tomasz Grobelny wrote:
> > Any idea why this might be the case? Can I somehow enforce that the
> > device reintroduces itself on the bus and gets new address? Can I
> > somehow debug what happens when my device is connected as gadget (eg.
> > see control messages for device/configuration/string descriptors)?
>
> Why does it matter what USB "address" your device gets?  That's a random
> number that nothing should care about as the USB spec allows it to be
> reused if the host controller wants to.
>
Not that I know 100% it matters, but until now this is the only
observable difference in dmesg. It is just my guess that something
might have gone wrong with reinitialization. Also see other questions
how to debug this.

> What requires a "different" address each time?  Shouldn't that userspace
> bug be fixed instead?
>
The userspace code does not require different address, not even sure
it could get one via functionfs.

Best regards,
Tomasz Grobelny

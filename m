Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E330A2F53DA
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jan 2021 21:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbhAMUH4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 15:07:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbhAMUH4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 15:07:56 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8350EC061575
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 12:07:15 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id r9so6651798ioo.7
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 12:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KzkNfs4/imopAocbFGy0VBdJlcTsJ8WoqZQGFlTzMF4=;
        b=mW5zw6WvG9nP1PStwRNnJR9bV1tVh6caG5zlhbZtETWT8nJCb96wUkFz0X/aMgfeKl
         fATp9LqR/OwNne0zgvAuKnUuakK3Pga1ZSyWrenF2TizA7ooZ+HyvNjTwuTA1M47Q2/b
         aDqLIu8KiTnxeoz4fqdOdHf5I+MYdMfEe6qfqgkdgqCfOw/tdr6Pq4wIpPqg2JeptxCj
         RFSLyd2PBbFqjo3fYBbTkzoUiZEgV5wK/62mnPyUZ19IB14wZ9j+UqniJ0xy9SupJTVZ
         mVo24vN237SSvGRN8Gjix7yBVrwfegMcwUB0Tpdf+qwujS7Uf11Jk+gysGfnjoDRk9Sr
         R6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KzkNfs4/imopAocbFGy0VBdJlcTsJ8WoqZQGFlTzMF4=;
        b=GwllvqnGWamvAOfkBitfjpeN4zAK2AjUOurfLwoKV6QIiPdFM+ExfDIKhSVSODq5OP
         n7ljUxHr446f+9xw3k9MkxTS31+Csdly7b3iKUhSGvNZ+I342TvS0MExWWEZNY8xMhHM
         VSgjgDjJ+2gf++4Y76NC/2H5CK2A16u8wAEEVJqLkNVHZ/yoamK5lheP9vsioxDBX94F
         CTLisMLrnEOGaEulkVsSQJUdWAsxnLE0IDqNwVRd3arbyTqtZI0wtvzbXS2WTuoBNGig
         c8HyjimgoXNiNzIpBydwGuzzbDo3NYA5mC+GhpWmn1ypY3MVeciFFRm71lhWCPynvRCb
         EQYQ==
X-Gm-Message-State: AOAM5311xdOc/JbJNfopbwNG9xY2FvO8F1bylXtE3WHjtaWK2O7V5gBN
        XdQq8YYqobjUur8DKiuaCz7aHTr0OAJZevieBWA2Axkg
X-Google-Smtp-Source: ABdhPJxDK0v09suGKR4737SyQGhkIPNCWaaZKYvgQ2Djhn/4f5GeZL95EEbuR5+JziBX3PyWUIDc+Ey2+UzWSIgCFTQ=
X-Received: by 2002:a5e:c012:: with SMTP id u18mr2994768iol.15.1610568434580;
 Wed, 13 Jan 2021 12:07:14 -0800 (PST)
MIME-Version: 1.0
References: <CAMeQTsacNs-YVWeX6vFJyMBLeD_AX6imNQRodV_X-QS54wAREA@mail.gmail.com>
 <X/y1ekqBrjXK8lZO@kroah.com> <CAMeQTsaL0mx=WW2Ekr2gh_aCWKnumS4mSr5tTH_ac+cdarzxMA@mail.gmail.com>
 <CAOGqxeUkZ8VK-D3xutVvQk7e2t1=9GzLQL7oHz0GTj_FMdVeqw@mail.gmail.com>
 <CAMeQTsZA7a9WcJq2tudWhaJbc6Z4vb4jtcUnHOCzg9u3oLxzbw@mail.gmail.com>
 <X/1ksTC4SBgrQoak@kroah.com> <CAOGqxeXE4D7Dyf-9c=evZMG+PTGrycKTpY1=VBk7OVAWKmyh0A@mail.gmail.com>
 <X/7KJ1gbcnQDUWx3@kroah.com>
In-Reply-To: <X/7KJ1gbcnQDUWx3@kroah.com>
From:   Alan Cooper <alcooperx@gmail.com>
Date:   Wed, 13 Jan 2021 15:07:03 -0500
Message-ID: <CAOGqxeWYcsQMRfGQeefufriba33hZ7__g+77dzwE=kT=csWywA@mail.gmail.com>
Subject: Re: Conflicting PCI ID in bdc driver
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Just to be clear, I'm only interested in removing the bdc_pci.c file
and not the rest of the BDC driver.
I talked to the hardware engineer that designed the BDC core and he
said that there were only a few of these PCIe/FPGA boards. They were
used for development until the BDC core was added to various ARM SoC's
as a memory mapped platform bus controller. The original PCIe boards
are no longer in existence.

Al

On Wed, Jan 13, 2021 at 5:22 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jan 12, 2021 at 02:51:05PM -0500, Alan Cooper wrote:
> > I just checked with the hardware engineer that designed the BDC core.
> > The BDC PCI driver was used with an FPGA/PCIe board for design
> > verification and no one should be using this driver. I'll send a patch
> > that will remove this driver.
>
> Based on the recent patches for this driver on the mailing list, are you
> sure that no one is using this?  We can't delete a driver that people
> are using.
>
> thanks,
>
> greg k-h

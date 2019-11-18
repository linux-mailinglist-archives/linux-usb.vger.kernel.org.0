Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8323A1008DC
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 17:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfKRQEA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 11:04:00 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35669 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbfKRQEA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Nov 2019 11:04:00 -0500
Received: by mail-ot1-f68.google.com with SMTP id c14so7965658oth.2
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2019 08:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Rem/p36hqRjeTRexcoTJMcufyxeZ4MVGJQGRmQDv2+A=;
        b=Vq/vQcsLeOt5gdmiJvXVO5I0YkUs96xHpByQea0oBeZRrvJKKCpoCNLTdRwkctDI4z
         Z3/vbPXhjESE/29ycmDt7B1m6PKeLvJgtrIy/t+rbRHNhNE8CgZhYC8/KxdbQt8t7o1g
         dIVIZZJ6RwQaRu0R2jbQOE6vGDakwz6kD5zi/G55HCWL6n1fsApR0HZEGnBwWKs79gcp
         G+W6LJc7zMYP6VFMZYCbd8PlIC2/4KVMvK5aQfEXHCZ4VGbQh6oNYhaFVhtwAPlJrch+
         h4RD7XeYt0bctjcNMTYv3cDmoXcH8zyD/UCJpxzAjr/oPCmBuW/tu9lo/00oeOLOly8+
         yRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Rem/p36hqRjeTRexcoTJMcufyxeZ4MVGJQGRmQDv2+A=;
        b=GaImF3Z3ymYMY2thoLHIRxXecXXrrYWZK7TgIN/78o8G4+fd6SI5yn1TbQV3RHtJQp
         5JPHlpjKL7GiIE89l35lUrGJLAuFU9N1c0Ba52EOQDYrss+uRapGQKTQhrPwtXu6sQqA
         vO29NWoUdBYfpYDe7SbWfuDEUyURey3rG93HlzQHy93hutypR0MYa48owL8kC9H1lgOm
         vMGVjg0cLQrkJQNsTuuwewRpJ8gb7+S8yw+j5dXrfMBOjlZmFmWq48CIBB9/Gpn3oCCY
         HL1KPMPG6Affx2mpq+8IdZYdGF/WzesdOh4lpRJUnLCsLucsVBd1QJ4G4IV4oAMJJdIX
         fC7Q==
X-Gm-Message-State: APjAAAW+otMtAmcaqEnswyEtBfyAlSjzKC47ZWswrh8CJhUkbQqN/ihp
        z5Xjc8lXdeVI7yPCgA2u9fXeYxmHVUfdiBUHbg==
X-Google-Smtp-Source: APXvYqxstwnfXWuxForAEl1NeIJVugYYSuwNzVNzyYYvVJ+wGYtHrS/tDF9VZoYqFBrq8WkFDoS/jVaqiRq9fEG6bSI=
X-Received: by 2002:a05:6830:1682:: with SMTP id k2mr9190otr.336.1574093039351;
 Mon, 18 Nov 2019 08:03:59 -0800 (PST)
MIME-Version: 1.0
References: <CAHG43MtDYqiV6pye91D8_bA-4bMvVHWFHjsDgEMsmhh2n-Z2ww@mail.gmail.com>
 <20191118112837.GE156486@kroah.com> <ead122bf-4fb5-a9a8-053d-37426a4b7605@redhat.com>
 <20191118155859.GA553955@kroah.com>
In-Reply-To: <20191118155859.GA553955@kroah.com>
From:   Pacho Ramos <pachoramos@gmail.com>
Date:   Mon, 18 Nov 2019 17:03:48 +0100
Message-ID: <CAHG43MukMye9ageQQ5QPYYWvxFpc67Fj5ZL+E8Qi48tyDfxYLQ@mail.gmail.com>
Subject: Re: JMicron USB to ATA/ATAPI Bridge requires usb-storage quirks to
 disable uas
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Laura Abbott <labbott@redhat.com>,
        Laura Abbott <labbott@fedoraproject.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks a lot!

El lun., 18 nov. 2019 a las 17:00, Greg KH
(<gregkh@linuxfoundation.org>) escribi=C3=B3:
>
> On Mon, Nov 18, 2019 at 10:44:03AM -0500, Laura Abbott wrote:
> > On 11/18/19 6:28 AM, Greg KH wrote:
> > > On Mon, Nov 18, 2019 at 11:07:55AM +0100, Pacho Ramos wrote:
> > > > Hello,
> > > >
> > > > I would like to forward the patch that is being used for years in
> > > > Fedora and Gentoo to fix connectivity issues of JMicron devices wit=
h
> > > > UAS when they got into idle state:
> > > > https://bugzilla.redhat.com/show_bug.cgi?id=3D1260207
> > > > https://bugs.gentoo.org/640082
> > > >
> > > > The problem is still valid with current kernels, then, I guess the
> > > > patch wasn't forwarded here or got forgotten for some reason. This
> > > > patch works fine for current kernel 4.13.11 too
> > >
> > > Laura, any reason this patch was never sent upstream to us?  Any
> > > objection for the patch below to be merged?
> > >
> >
> > Huh this must have completely slipped off my radar. No objections.
> > Thanks for the follow up!
>
> Ok, now queued up, thanks.
>
> greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFEA39B4C4
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 10:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhFDIYW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 04:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhFDIYW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Jun 2021 04:24:22 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FC2C06174A
        for <linux-usb@vger.kernel.org>; Fri,  4 Jun 2021 01:22:24 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id l2so8415187wrw.6
        for <linux-usb@vger.kernel.org>; Fri, 04 Jun 2021 01:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=/SF7msZ6RZkO8FLmmvLTe36Mf4HzOKhqGaAVIdE3wOk=;
        b=PqHG/04wvWGhz4v745toSclNdYIcRJdEj8Gsg4OePpMsur6qz6W96zlfAtgVBtOd0v
         zJMM9MExH+ShqZLsYJDNjuhD7tCeHARYScYywghSmeAlCWMzIEqkrYNaq5ZdWu+t6WjD
         kSi2MBh2ttbJDqK+mtPtW3Vxn+Soyh2pdS+anxbiOGmQDsWmEblInyRh0pi2sJUbp7kQ
         wCkzoJs0V8S0gAcYOTtHAjG6prg/xG2/OWn0hauZGo8VquWrozH71Fn0neJ3WPC44hoN
         B1jXNdUsUNlyeA1Zb6Ww88xca6InwWefQmLuLzoJGnCF//vxlkU+beROOrpEEXOcatHu
         m0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=/SF7msZ6RZkO8FLmmvLTe36Mf4HzOKhqGaAVIdE3wOk=;
        b=USssnQjML7M5fgLE2gpe0aJVD261gG1/8ZgUzGbMzvigBp3SdiAj/3KKQPAGrNHLf3
         +MFUfkR1hpRqBQkmzehAPxhUfbXtOF5PRnb3/m88lAGYwXl5+BID0QZidoJWvekkqjdQ
         BSfEljo/o678P7CNNTmrFkjp1Jf8Mo3lhEKOqwNFAaFWYMfpIY4klmWJ834TAA6VxcW/
         dVfwJ+FXD5zR0GSEptoQ3OxuiF56WOCcq/NAC0sBkzZ3aWUQPDtO6er9f31PcjsAdmvH
         c2/0l4mf1iftEfWykC609RhJABKxH2+WXK9KH2Rex/oeUZPAzM8fVWpOmcYrQQC1NAQb
         AlCQ==
X-Gm-Message-State: AOAM531YalQ28tNH4f6TXfvD5Lbf4hQhxgTllmy6aPvoaUcDqTlEis6X
        BF0fARlpRUQRrWmw84IXaEjyTg==
X-Google-Smtp-Source: ABdhPJwj4w/NdZJEvVw2NG8tY4Pi2OeTw0UqTE6BV/Bc5tVUbnogr8hRm1Mctc++rcEUBXqL04vrbQ==
X-Received: by 2002:a05:6000:110b:: with SMTP id z11mr2519579wrw.278.1622794942603;
        Fri, 04 Jun 2021 01:22:22 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id b22sm1674294wmj.22.2021.06.04.01.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 01:22:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 04 Jun 2021 09:22:21 +0100
Message-Id: <CBUOSO6T5NP7.FJOIWX8PSVP8@arch-thunder>
Cc:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] usb: isp1760: Fix meaningless check in
 isp1763_run()
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
To:     "tongtiangen" <tongtiangen@huawei.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <20210601100311.70200-1-tongtiangen@huawei.com>
 <YLjAweuyJXzDn9pe@kroah.com>
 <bb426fd3-ec56-ec95-0c6a-092627d547b6@huawei.com>
In-Reply-To: <bb426fd3-ec56-ec95-0c6a-092627d547b6@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Tiangen,
On Fri Jun 4, 2021 at 3:09 AM WEST, tongtiangen wrote:
> On 2021/6/3 19:45, Greg Kroah-Hartman wrote:
> > On Tue, Jun 01, 2021 at 06:03:11PM +0800, Tong Tiangen wrote:
> >> There's a meaningless check in isp1763_run. According to the
> >> similar implement in isp1760_run, the proper check should remove
> >> retval =3D 0;
> >>
> >> Fixes: 60d789f3bfbb ("usb: isp1760: add support for isp1763")
> >> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> >> ---
> >>   drivers/usb/isp1760/isp1760-hcd.c | 1 -
> >>   1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/i=
sp1760-hcd.c
> >> index 016a54ea76f4..27168b4a4ef2 100644
> >> --- a/drivers/usb/isp1760/isp1760-hcd.c
> >> +++ b/drivers/usb/isp1760/isp1760-hcd.c
> >> @@ -1648,7 +1648,6 @@ static int isp1763_run(struct usb_hcd *hcd)
> >>   	down_write(&ehci_cf_port_reset_rwsem);
> >>   	retval =3D isp1760_hcd_set_and_wait(hcd, FLAG_CF, 250 * 1000);
> >>   	up_write(&ehci_cf_port_reset_rwsem);
> >> -	retval =3D 0;
> >>   	if (retval)
> >>   		return retval;
> >>  =20
> >> --=20
> >> 2.18.0.huawei.25
> >>
> > Did you test this change to verify that the driver still works properly=
?
> > You are now checking something that never was checked before...

Thanks Greg for asking the right question here :)

> >
> > thanks,
> >
> > greg k-h
> > .
> Sorry,  this fix was not send to Rui.

Yeah, I did not get the original, no. I will need to add entries in
MAINTAINERS for this driver to be easier for others.

>  From the point of view of code logic, there should be a problem here.

It looks like. Only if we fail to setup the Configure Flag,
something that it's not really expected to fail.

>  I don't have the actual hardware to verify whether it works
>  properly. Rui may know if the patch affects the original workflow.

Thanks for the patch and I will test this and get back to you.

------
Cheers,
     Rui

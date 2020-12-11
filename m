Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16DF2D77B5
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 15:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729208AbgLKOWD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Dec 2020 09:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405898AbgLKOVv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Dec 2020 09:21:51 -0500
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5EBCC0613D3
        for <linux-usb@vger.kernel.org>; Fri, 11 Dec 2020 06:21:10 -0800 (PST)
Received: by mail-ua1-x943.google.com with SMTP id f29so2888857uab.0
        for <linux-usb@vger.kernel.org>; Fri, 11 Dec 2020 06:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZnFp9RbB9wQQJXRSh+J9XRRP7zAmGLoO9EugBvK4tDg=;
        b=rDPJ7Ckd3C/fw0396+Qmzza6rNsVm0sElX2DKpLjVtSwcKdhsQPe++zFmI0+S3hD4E
         Fiy2lO6bMrKh5klWqOWHL/UkZiwO7RDm/gJW0xlBVKOUBzLPd2cdycJAHt1FExaevdwY
         Vj+/LfuUsv3jEw6+5MMxLRZWGTfk7sUH2gFfCdE24XbJNC34u9FxRVJO6aq4MVUKxq5z
         77ozEwUhnmjptB7xGs0X3weaby2g+W8In5hCaDjriKx6kDfNFSODivyso/dKvLK2V2k9
         sOSQH/oeIaEM2Ki91VTAYQDNISpn1EcuvAZYkdBAoMVqD5VV4Q84eep2yAR6n7quVOeS
         pEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZnFp9RbB9wQQJXRSh+J9XRRP7zAmGLoO9EugBvK4tDg=;
        b=cseqboT+VdW1E6/T3+0wLpzQ5GrfMlqOR9vzODXcmShjZlczDz+lPdykCIdA+5APsz
         CciHLxp+9YjAg4VDBVuonxEwAxbKd5hdVP2iXKwINMB+GtitPKbjcP2fWwsWpVyTbd3a
         i3BPNxYyEd1BtAkrHSN2MQg2+wyUXOqHu+zQqfBXgOH847sG/a3RBh0MG8Op4WLekqRv
         eQ2EnWZsd27lkc6Es8+2PhrgW+UPJ8PnSZGT+Plb7nYMibWwzC/nhaLZWefoXSh1L09i
         OBKD206Im22aOyxkupXUmXRCPXHyK9EHLRu5JkPPkhqYKuhWHP8Xlt4+RJVAQX221CSM
         DjUw==
X-Gm-Message-State: AOAM530sIE91GkWifHPlyOTgmw0IgRFONE1Gc1Rt1tH+xl/LFdcgXVCa
        ZiV/Z7t1ohCbW5aQ5xQhZxP6FVQaX80E9ednjdMjDw==
X-Google-Smtp-Source: ABdhPJyQLTaKPvIqxy25PPhpXK+U6oey+7qtJRvdYCJWsNqNjLPhBQuXQsmqEUuVCc/AT7jY3M8WQT3Pd9pJCK4Twss=
X-Received: by 2002:ab0:1c07:: with SMTP id a7mr12507808uaj.17.1607696470025;
 Fri, 11 Dec 2020 06:21:10 -0800 (PST)
MIME-Version: 1.0
References: <20201210203318.6914-1-semen.protsenko@linaro.org> <20201211141624.GQ4077@smile.fi.intel.com>
In-Reply-To: <20201211141624.GQ4077@smile.fi.intel.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 11 Dec 2020 16:20:58 +0200
Message-ID: <CAPLW+4k3z4TjR6RPTLwkOO8tqY4ptDhPRCEJBZH0cfXu+qA2kg@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: dwc3: drd: Avoid error when extcon is missing
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Andy,

On Fri, 11 Dec 2020 at 16:15, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Dec 10, 2020 at 10:33:18PM +0200, Sam Protsenko wrote:
> > If "port" node is missing in PHY controller node, dwc3_get_extcon()
> > isn't able to find extcon device. This is perfectly fine in case when
> > "usb-role-switch" or OTG is used, but next misleading error message is
> > printed in that case, from of_graph_get_remote_node():
> >
> >     OF: graph: no port node found in /phy@1234abcd
> >
> > Avoid printing that message by checking if port node exists in PHY node
> > before calling of_graph_get_remote_node().
>
> By some reason you have two separate messages (missed --thread when run `git
> format-patch ...`?).
>
> In any case I think it should be dropped or reworked and resent since patch 1/2
> got comments.
>

Yep, the patch version bit shouldn't be there, just forgot to remove
it after `git format-patch'. So this is not a series, just two
separate patches, and 2/2 was just dropped. Anyway, I'll resend this
one soon, to remove the confusing versioning part.

Thanks!

> --
> With Best Regards,
> Andy Shevchenko
>
>

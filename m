Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7842A5ED6
	for <lists+linux-usb@lfdr.de>; Wed,  4 Nov 2020 08:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729155AbgKDHiu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Nov 2020 02:38:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729032AbgKDHir (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Nov 2020 02:38:47 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84AF7C040203
        for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2020 23:38:45 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id j24so28307427ejc.11
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2020 23:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6cit8dw3cwwFO1kgGkrRIiL6fmyUWIN9HtRu0U/brQ4=;
        b=D9Zt8lqliNuOKmjX30oo1Vlm5cNO++VXSqejesJ2XYYd5DKrxqQKOsBMuN3bFh94vL
         tcD6uLLr+HHnLgz8ION91I0E2PtMC7Ke0FIOlg/u+Id4Y2Mj/Ci98QaJGunyIUbSJ3mH
         dQIG9h2RYyES4aFccuYykv/IKtxne8nAHpi8I13Z4WjJhkXQId69ueX81j7dlBeHm0k6
         QikVLv0mnYYwj9DiF5FzUwUP/P85BO7hHEAOWu+XmXharHc55xvIN1P9XXT+uZapOLdG
         Z+oMs81NXATNwjj0+9ybiOd8KogGpWscGynvrtR2z42wSh1AWCd8axcq0ZOX0w7ARXWG
         xokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6cit8dw3cwwFO1kgGkrRIiL6fmyUWIN9HtRu0U/brQ4=;
        b=QODWaOYkMekbgRvYni3dvNni7sv+iA8mYZc0Z3bgxd4z2xx7rxNMXm5NPQEi90O83o
         tDGNVi8UwSEDSV/LuLNVGe+dnQFshbnGpA99xw1FyUjUIwBvHhl2tcQaO94fohkNtQUC
         ywFQUVv+9YttnGjHnFgA132ib8TnqfEAkRs6QBTTtu+qyK9xupyrdDRRoSKsooCysBvk
         8MnirNVk/Ne73gnYVBUNlN3AWrtYTfNNgu6b+GhLbVkKqHcC5RlfUTEXDKdjjDz/oOMG
         4d4+qOFMDLody/RHJIRowaKd3AuP0ADEdpLIikWr0N0L9TuzgVaD8Og9m3yN5eWxIeRx
         5f9Q==
X-Gm-Message-State: AOAM533mDUkF3VJxcbJoEOW2lz8XVaUcCG+YZYdrEcSdabEewPrRq/dQ
        COTOQDX3fWRZ8WRlZnML8E5eTPboKmPjVR5gthnXew==
X-Google-Smtp-Source: ABdhPJzJaA5JtUm+zRFkxK5zQ0UYsHFTUsvldC5t51qzT7h9BHgnTWfVM6KkMR0vOrtR7y+EZvTteQUIaPqSp7yycvM=
X-Received: by 2002:a17:906:4742:: with SMTP id j2mr23140948ejs.247.1604475524012;
 Tue, 03 Nov 2020 23:38:44 -0800 (PST)
MIME-Version: 1.0
References: <20201103203348.153465465@linuxfoundation.org> <CA+G9fYsrppNwC0S4vkrS8jGW4k2fgmbAzy=oMLV6X9=DHkznpw@mail.gmail.com>
In-Reply-To: <CA+G9fYsrppNwC0S4vkrS8jGW4k2fgmbAzy=oMLV6X9=DHkznpw@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 4 Nov 2020 13:08:32 +0530
Message-ID: <CA+G9fYvser2+M4D=_UmyiaXFm44eGUsVxYvednPLSS9BLtAuNA@mail.gmail.com>
Subject: Re: [PATCH 5.9 000/391] 5.9.4-rc1 review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Shuah Khan <shuah@kernel.org>, patches@kernelci.org,
        lkft-triage@lists.linaro.org, pavel@denx.de,
        linux- stable <stable@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 4 Nov 2020 at 12:42, Naresh Kamboju <naresh.kamboju@linaro.org> wro=
te:
>
> On Wed, 4 Nov 2020 at 02:07, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 5.9.4 release.
> > There are 391 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Thu, 05 Nov 2020 20:29:58 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patc=
h-5.9.4-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git linux-5.9.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
>
> Results from Linaro=E2=80=99s test farm.
> No regressions on arm64, arm, x86_64, and i386.
>
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> NOTE:
> The kernel warning noticed on arm64 nxp ls2088 device with KASAN config
> enabled while booting the device. We are not considering this as regressi=
on
> because this is the first arm64 KASAN config enabled on nxp ls2088 device=
.
>
> [    3.301882] dwc3 3100000.usb3: Failed to get clk 'ref': -2
> [    3.307433] ------------[ cut here ]------------
> [    3.312048] dwc3 3100000.usb3: request value same as default, ignoring
> [    3.318596] WARNING: CPU: 3 PID: 1 at
> /home/jenkins/ci/lsdk/master/all/packages/linux/linux/drivers/usb/dwc3/co=
re.c:347
> dwc3_core_init+0xd14/0xd70

Please ignore this warning that this is coming from stable rc 4.19.

- Naresh

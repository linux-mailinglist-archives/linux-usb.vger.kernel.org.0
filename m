Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C0037552C
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 15:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234160AbhEFNyH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 09:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234158AbhEFNyG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 May 2021 09:54:06 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CCBC061574
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 06:53:07 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso5351249wmh.4
        for <linux-usb@vger.kernel.org>; Thu, 06 May 2021 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=XPfYrKMQzfrqBh3ClWqpir12WfBhVdLSsTptX2KRfKA=;
        b=Nl1s4Jy6G1l6eWkrP5jHcmjBfSCyqrVBP7vSIQDDHxRAbuE0ptfiVDWchf3jitiGNw
         RsRjRH8efe4RvRweyk2pE6/ZB1252Qqqwtj8EZfpYVZpRi9lRf+qhwMIbPoexlqndjhH
         lbu9VZ7kraUdh/4x6O7INC7QT3nW7KMNWFCw6p9fGb6puQRGS72XFDkBgyLC5Bq+lfDB
         8K6+tDk4O6FdqtLnnKYgtuM2KzGQ/n4ybAvCNPhHNUQ6hw+P3i8bFVst4H4FFelp2X3r
         UoUu3stZBckFKT/8dTd2OjEMDqESLIZIPao7IU0ocnCln5U9UGQGllZBtrnSHCRpZcW1
         QaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=XPfYrKMQzfrqBh3ClWqpir12WfBhVdLSsTptX2KRfKA=;
        b=Gp/+ax2elQ1j8p6IwO6ni2Y0K4hxQYwjqAwHqpq9hrCyN4uU6RV2wuFCYzYqaUDMdd
         tDxNer49c6KDh16MT9X1HPQK5afEbw92efanEwJLCsfUQdwctCf5h9mgAP8k3fS/+YKS
         2nQsW4jGJmf2DmJCTOu3i8ZLs5GcjpuLikzq4wQwGFSngy7aokuIWuEpB7e2xr+Y0OtT
         mchrccMh7fknSvDZt7zY6SWpbjyxpqP1dUhIRJLdclHkIX8rXCJrs2oOZVnvqOX1TyPx
         0LgssNoWcTWbls3BrCDnP6/btsW4cPwkVbNPRUbjaQVz0ulYXsgM0cB53ORP+Ag4e+pZ
         2f3A==
X-Gm-Message-State: AOAM532BS9DBxol2tieHWIeamtmkVScDNidm0DijWVuc/ZE8eK8wtJKr
        PteSy8EM5SIN5PZhQceehJTi/A==
X-Google-Smtp-Source: ABdhPJzgsmm1KnMRFds1I4M+GELKeKBu+8XXlkkF1IOyOb5CB5WEJZxYaNjW/k4IXoqFeu2s4oWevQ==
X-Received: by 2002:a7b:cbc1:: with SMTP id n1mr15566069wmi.50.1620309186194;
        Thu, 06 May 2021 06:53:06 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id g11sm4613159wri.59.2021.05.06.06.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 06:53:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 06 May 2021 14:53:05 +0100
Message-Id: <CB67O3M2S853.22F89BB6QKMRU@arch-thunder>
Cc:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Sebastian Siewior" <bigeasy@linutronix.de>,
        "Rob Herring" <robh+dt@kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 0/7] usb: isp1760: extend support for isp1763
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
References: <20210504101910.18619-1-rui.silva@linaro.org>
 <YJPJ3aKf9BdQ8UKx@kroah.com> <CB675UH9U35P.3SQ8NI93618E5@arch-thunder>
 <YJPxY55h8c4bBsBQ@pendragon.ideasonboard.com>
In-Reply-To: <YJPxY55h8c4bBsBQ@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu May 6, 2021 at 2:38 PM WEST, Laurent Pinchart wrote:

> On Thu, May 06, 2021 at 02:29:14PM +0100, Rui Miguel Silva wrote:
> > On Thu May 6, 2021 at 11:50 AM WEST, Greg Kroah-Hartman wrote:
> > > On Tue, May 04, 2021 at 11:19:03AM +0100, Rui Miguel Silva wrote:
> > > > The Arm MPS3 FPGA prototyping board [0] have an isp1763 [1] as USB =
controller.
> > > > There is already support for the isp1760 and isp1761 in tree, this =
series extend
> > > > the support also for the isp1763.
> > > >=20
> > > > Move register access using regmap, remove some platform data and co=
de, refactor
> > > > the mempool, use dr_mode to align to existing bindings, then add th=
e support for
> > > > isp1763 host mode, add bindings files that did not existed and at t=
he end
> > > > add also support for peripheral mode for isp1763.
> > > >=20
> > > > @Laurent and @Sebastian, I add both of you in the bindings files as=
 maintainers
> > > > (it is a mandatory field)since you were the ones which contributed =
with the
> > > > initial code and peripheral code, let me know if you are ok with it=
.
> > > > If yes I may send a follow up to add also entries in MAINTAINERS fi=
le that it is
> > > > also missing.
> > >
> > > First 3 patches now applied, feel free to rebase and resend the rest
> > > based on the review comments.
> >=20
> > Thanks, yeah, I was taking the chance to clean all the pre-existing
> > sparse warnings in that driver, since this was triggering some new
> > ones.
> >=20
> > And I knew that you merging this first ones would make Laurent jump
> > from his chair and review this, eheh. Thanks for that also.
>
> You've planned it together, haven't you, you naughty scoundrels :-D

No, but I wish :)


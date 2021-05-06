Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B99B375574
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 16:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234489AbhEFOQl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 10:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234357AbhEFOQk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 May 2021 10:16:40 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CDA0C061761
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 07:15:40 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id h4so5788938wrt.12
        for <linux-usb@vger.kernel.org>; Thu, 06 May 2021 07:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=AbzHH6Jizrq7mi1btUna9Y8FC2KjGyh0uob3YcCLNCI=;
        b=H6Xk6znbye8x4IlMzs0c4nH269k+XyIax8kWkD0gTcE+19v/r76A93wizBnS9T2Kx4
         KWdE9JmUaCOUyRTbFXSzLy1TrsHp8hD7jPzQXUhNJ9dZNUwrVY22P8w3cPoga5gt0UYz
         12b/ToVjuqT6Td7dHhf0x3KQhyKPCCjSPodWRqs/wo2mDus8DFDfGtwhRzjEAdO5dA+K
         pdVi38FN/9JNQ6+3v9Xb1q6SFb4rdPuJEK3qUD6EgUQ8n2YCHCg3GHZBq22f+hkEp/Br
         TfOcT0B58DPkHuGNnuoc2KIcjctc2vy3NCtdI+QTzt/rTcbzoia8cwOMA9xQW5Hksj7t
         67Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=AbzHH6Jizrq7mi1btUna9Y8FC2KjGyh0uob3YcCLNCI=;
        b=MZNh6cKWuLvsA4Uxkv7Ehd4FCqSrq3nNfb+tv6DPdVnbxD1cfUoXq5aSf7UOCFqWTi
         Q3fXFoDSNvJRL0JhH4o2oxnb7sZRdVP872HjP91IU+lVXOs1an5quM+iiCLO8e6tGC6R
         MRxnwAC414YD/+DUZP2r++rax2HIfjAHi27LPgsxfFZHfo6h1vV/1hsrSOHprawoWUoY
         mrns2C2yOeyWsWQw9Z6c3AKHJjZfP1SFJ/7NSUnzQpf/c2dC7A7b7f2TyTtAJSJEmelp
         TyeutXnNQhCZuFGGKGScCDSf24w903zdN4dUBZNtoWFiPMGvgR703oZOvRJFMNA/wkBW
         r1XQ==
X-Gm-Message-State: AOAM533a+fE4lsWdMo2/En7DZW2/CXwCWeAO9MjjuMtWTRw+yxPqGTXj
        /ltuxWmEPKAYTIPrOeLaEyeRDw==
X-Google-Smtp-Source: ABdhPJwIoicYSAluEEcJ872zOzCWfAee9CRSs4gTJooNTOyFU+fm0qkCt6DG6MQZbBIrELefALYyyQ==
X-Received: by 2002:a5d:6551:: with SMTP id z17mr5398858wrv.372.1620310538748;
        Thu, 06 May 2021 07:15:38 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id v20sm3629249wmj.15.2021.05.06.07.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 07:15:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 06 May 2021 15:15:37 +0100
Message-Id: <CB685CSIVRJH.1ON382GDP7YNN@arch-thunder>
Cc:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        "Sebastian Siewior" <bigeasy@linutronix.de>,
        "Rob Herring" <robh+dt@kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 0/7] usb: isp1760: extend support for isp1763
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <20210504101910.18619-1-rui.silva@linaro.org>
 <YJPJ3aKf9BdQ8UKx@kroah.com> <YJPgO6TPyuY0w0EH@pendragon.ideasonboard.com>
 <CB67F1ESC5PY.3UAAKCJRWDQ3N@arch-thunder> <YJP225qBXYtmWKQk@kroah.com>
In-Reply-To: <YJP225qBXYtmWKQk@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu May 6, 2021 at 3:02 PM WEST, Greg Kroah-Hartman wrote:
> On Thu, May 06, 2021 at 02:41:14PM +0100, Rui Miguel Silva wrote:
> > Hi Greg,
> > On Thu May 6, 2021 at 1:25 PM WEST, Laurent Pinchart wrote:
> > > Hi Greg,
> > >
> > > On Thu, May 06, 2021 at 12:50:05PM +0200, Greg Kroah-Hartman wrote:
> > > > On Tue, May 04, 2021 at 11:19:03AM +0100, Rui Miguel Silva wrote:
> > > > > The Arm MPS3 FPGA prototyping board [0] have an isp1763 [1] as US=
B controller.
> > > > > There is already support for the isp1760 and isp1761 in tree, thi=
s series extend
> > > > > the support also for the isp1763.
> > > > >=20
> > > > > Move register access using regmap, remove some platform data and =
code, refactor
> > > > > the mempool, use dr_mode to align to existing bindings, then add =
the support for
> > > > > isp1763 host mode, add bindings files that did not existed and at=
 the end
> > > > > add also support for peripheral mode for isp1763.
> > > > >=20
> > > > > @Laurent and @Sebastian, I add both of you in the bindings files =
as maintainers
> > > > > (it is a mandatory field)since you were the ones which contribute=
d with the
> > > > > initial code and peripheral code, let me know if you are ok with =
it.
> > > > > If yes I may send a follow up to add also entries in MAINTAINERS =
file that it is
> > > > > also missing.
> > > >=20
> > > > First 3 patches now applied, feel free to rebase and resend the res=
t
> > > > based on the review comments.
> > >
> > > That's a bit fast, I've just review 1/7.
> >=20
> > Let me know if you will drop the patches from your queue, or do you
> > want me to send some follow up, since Laurent comments are not very
> > large?
>
> Follow-up is fine :)

Will do, thanks.

------
Cheers,
     Rui

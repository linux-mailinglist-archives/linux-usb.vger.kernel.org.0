Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9906B3754BA
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 15:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234033AbhEFNaT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 09:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234028AbhEFNaP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 May 2021 09:30:15 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88118C061761
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 06:29:17 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id a4so5634532wrr.2
        for <linux-usb@vger.kernel.org>; Thu, 06 May 2021 06:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=zFASyJ+yRsxDfoT4di1orgSaUU5Hyf5hF6wl6yP0d44=;
        b=NDdmq/ZQBD3paXjPKhumLvgKqUxAQfM4x25mTc1QzcNzpZPerX42wpU5mU5HE0Z8YE
         Pdkoa4L2qUrrsV6qcWZcqN4XawhEYDqBqvP8m8OVD0G8lNXbTjYwYVZBlfGi7xJgRDhU
         bokhwvwKgOdR4N5uTO7NqKEVj6xnc+40a7NeYheW8rGsgesvV6OuDuXbvjZiWG44I1uC
         ZeSuwL4DHDLl1NqoUnGxvLm9b7AEKVUzqNwLdYvZIOzOpIA8krDAkXJPjm4zjyQi5HbY
         VO+4RhasRhtwwk08Cbv/SooiQmW652IStcy+wq+CcsBhTj1kTmAb3fA7c7i4lxIxGmdM
         9q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=zFASyJ+yRsxDfoT4di1orgSaUU5Hyf5hF6wl6yP0d44=;
        b=aXPBKsjD+Doz4XZcHVjj9v6o+konMS4/xJmxs5VvIMxdjqpuCUUfWkOJn8nhHKDsA2
         /MEN4f4sgYejzLNOZ0lm0Y8lKaqHeEXq8/SHTWveZ207LdlSThSd6mzpvhoXCwbD9COa
         A1iRo9PBTMALu5DFbUMpmoUKqw7a047z5uizGEq/7CTN2blSLfobbWyS0CeiHiJ4WZRk
         +WNzKoHpn3qTOy3A3b7mCIQcpJoBnvp9x4dH15xRs1NDMTa2iUlUz6/tP0DfsN9f0919
         7Q//eQmaH7D5BICnNGr1Ub17wo3lSmArmYmbtveqK25Ks+ncMnn1ntuDukwcdk1bPix5
         yvog==
X-Gm-Message-State: AOAM531OLuwthkrAPqZ7zQqdzF/ML2E5tt5rkqnMz6yEol9pY/SJ8TgN
        X6pMghJIEo+TMw62oFFzdYk2qw==
X-Google-Smtp-Source: ABdhPJw+aQmDlEOJSw20kGOh9sWomiEM3YoeyjMYkpxKI2A6XJLRkFfmvGL3rVSdonKKAWpvj3kSjg==
X-Received: by 2002:a5d:4bd2:: with SMTP id l18mr5167097wrt.197.1620307756255;
        Thu, 06 May 2021 06:29:16 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id d3sm4060348wri.75.2021.05.06.06.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 06:29:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 06 May 2021 14:29:14 +0100
Message-Id: <CB675UH9U35P.3SQ8NI93618E5@arch-thunder>
Cc:     "Sebastian Siewior" <bigeasy@linutronix.de>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        "Rob Herring" <robh+dt@kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 0/7] usb: isp1760: extend support for isp1763
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <20210504101910.18619-1-rui.silva@linaro.org>
 <YJPJ3aKf9BdQ8UKx@kroah.com>
In-Reply-To: <YJPJ3aKf9BdQ8UKx@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,
On Thu May 6, 2021 at 11:50 AM WEST, Greg Kroah-Hartman wrote:
> On Tue, May 04, 2021 at 11:19:03AM +0100, Rui Miguel Silva wrote:
> > The Arm MPS3 FPGA prototyping board [0] have an isp1763 [1] as USB cont=
roller.
> > There is already support for the isp1760 and isp1761 in tree, this seri=
es extend
> > the support also for the isp1763.
> >=20
> > Move register access using regmap, remove some platform data and code, =
refactor
> > the mempool, use dr_mode to align to existing bindings, then add the su=
pport for
> > isp1763 host mode, add bindings files that did not existed and at the e=
nd
> > add also support for peripheral mode for isp1763.
> >=20
> > @Laurent and @Sebastian, I add both of you in the bindings files as mai=
ntainers
> > (it is a mandatory field)since you were the ones which contributed with=
 the
> > initial code and peripheral code, let me know if you are ok with it.
> > If yes I may send a follow up to add also entries in MAINTAINERS file t=
hat it is
> > also missing.
>
> First 3 patches now applied, feel free to rebase and resend the rest
> based on the review comments.

Thanks, yeah, I was taking the chance to clean all the pre-existing
sparse warnings in that driver, since this was triggering some new
ones.

And I knew that you merging this first ones would make Laurent jump
from his chair and review this, eheh. Thanks for that also.

I will rebase and send follow up series that will address all
that sparse warnings.

------
Cheers,
     Rui

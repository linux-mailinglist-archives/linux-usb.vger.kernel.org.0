Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5736D3688B2
	for <lists+linux-usb@lfdr.de>; Thu, 22 Apr 2021 23:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236877AbhDVVoT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 17:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235977AbhDVVoR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Apr 2021 17:44:17 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E22AC06174A
        for <linux-usb@vger.kernel.org>; Thu, 22 Apr 2021 14:43:41 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id s1-20020a4ac1010000b02901cfd9170ce2so10271567oop.12
        for <linux-usb@vger.kernel.org>; Thu, 22 Apr 2021 14:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=17RfyaTeIokTgRDeo35cefRpLMh7tU98i8pYpROElO0=;
        b=PqX7Wx1GDjMnldVpYXbkC66iKUtc3CNsfbF1O4XgF7ZthMmuTr3QPfutSPuJ/3q2QY
         NN0ALoFEZgT3ePeNb10Ef7gWTVkDSuzNNOYenQC5VbcG5Vi230kHb+qrOFT5eJKQdupy
         VLY96TSiQ57Q9yYVA4NbLheuJrPqYlXQwhwtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=17RfyaTeIokTgRDeo35cefRpLMh7tU98i8pYpROElO0=;
        b=h7kBbpXHcwbpJZ+aUi6Tm6KXZ2ucQQSWvTV2z+N+PKhAZR25GvbaUbvMuziJuBaC+T
         b/0CO92Niy+JW1TqRe2J4kdDl4pbb3WCCDRtZBsWQygQhAX8XK6BcXA6zKKJizwkEgRE
         ev1bNCwkuDlF6wWY77L9lg3nkONVGuO4ADQYDuU6y975Gb4kn46HwA49hiTczdr49SsF
         9xkeZYyv1x1y+jGqbsHgLteXluMGJSrZh+hD3k5rbSIBrF4jCPx6F7gZID26guFMJfgg
         32VGyg/ueMTVopeUmjsCcBwes1iEx43tOv5Q0CaEWBOmSPljhZmkXstjEMkB/wKHjv++
         SDKw==
X-Gm-Message-State: AOAM533BKPrUOTHEjXROqNoaVShmfJGBHD/Mmn/nwO9qbwh1WG7tDU4b
        8hNZ+E99aNSpq93pR/ZR0wKg9QYMqfhrQg==
X-Google-Smtp-Source: ABdhPJwGXLgCVs9zpl2EyN6FtWvrbPbC6cwfT8gd7HVMkiZbzFrcEUv0739gWnqmZEO7ELTahI86Fw==
X-Received: by 2002:a4a:e749:: with SMTP id n9mr413812oov.89.1619127820299;
        Thu, 22 Apr 2021 14:43:40 -0700 (PDT)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com. [209.85.161.44])
        by smtp.gmail.com with ESMTPSA id u185sm804902oie.12.2021.04.22.14.43.40
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 14:43:40 -0700 (PDT)
Received: by mail-oo1-f44.google.com with SMTP id d16-20020a4a3c100000b02901f0590a614eso2463661ooa.8
        for <linux-usb@vger.kernel.org>; Thu, 22 Apr 2021 14:43:40 -0700 (PDT)
X-Received: by 2002:a05:6902:4c3:: with SMTP id v3mr1207135ybs.276.1619127494005;
 Thu, 22 Apr 2021 14:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <1619112931-2144-1-git-send-email-sanm@codeaurora.org>
 <1619112931-2144-2-git-send-email-sanm@codeaurora.org> <YIHBzxN/9O9a98Xd@google.com>
In-Reply-To: <YIHBzxN/9O9a98Xd@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 22 Apr 2021 14:38:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vzx29E6hH+L8rZyyrOjt2JLzS8ho1Cym6bNY6gt5dO9w@mail.gmail.com>
Message-ID: <CAD=FV=Vzx29E6hH+L8rZyyrOjt2JLzS8ho1Cym6bNY6gt5dO9w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add USB related nodes
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,


On Thu, Apr 22, 2021 at 11:34 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Thu, Apr 22, 2021 at 11:05:31PM +0530, Sandeep Maheswaram wrote:
> > Add nodes for DWC3 USB controller, QMP and HS USB PHYs.
> >
> > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > ---
>
> What changes with respect to v1? Please always include a change log for
> versions > 1

It looks like this was here:

https://lore.kernel.org/r/1619112931-2144-1-git-send-email-sanm@codeaurora.org/

...which I guess is a "cover letter", though it's not really formatted
properly (it should usually be listed as "patch 0" in the series) and
also cover letters are discouraged for singleton patches like this.
Also: even when history is added to a cover letter it's usually
friendly to reviewers to also include it after-the-cut in your patch.

-Doug

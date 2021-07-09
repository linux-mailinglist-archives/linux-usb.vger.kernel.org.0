Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7F73C1CCA
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jul 2021 02:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhGIAjP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jul 2021 20:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhGIAjP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jul 2021 20:39:15 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7806C061762
        for <linux-usb@vger.kernel.org>; Thu,  8 Jul 2021 17:36:32 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id j10-20020a05683015cab02904b568e08dccso1527484otr.4
        for <linux-usb@vger.kernel.org>; Thu, 08 Jul 2021 17:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=tuF3IuVNzqSNHva85jiAQLO3B1aho/MneB4ZBDZXRy8=;
        b=jpIHei6yaeR9akW+Y2UzwS3BRvAlIRfRrFNZhvlYnqWDx7G9nDGozYWuVtpWL/BHM3
         AfduFwh+mXRuS511r5CPbsQLpr3d+wy4/CKTpAB0UONTXs6Umz++imz9TOtz+faqMw3e
         A8AwypOmuQO/6PYrPosJ0P+dgDSl0gaE8YheE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=tuF3IuVNzqSNHva85jiAQLO3B1aho/MneB4ZBDZXRy8=;
        b=G0CIgyHOP4Q5xxMPBYFm8SvpJyfZExcUzLOyIi7+ldHhlbBZtyj02Y3xgRBbEBMJkf
         stw1imcWd/xpy3oLPglABhC0yO1W8It2jtCzEtnxVG2Na7zcNBatORK2Pbz6L8oTA1Z4
         u7AzkVdCI71At/tuMH+wXWTB1up6fVkZ1sleS1AZhp67gIlYoku22al6IErrmT9++9W9
         sQ+VHsQnmBNuO0BXrDLavWhFKyqwymqjzzNtcWosLS7G2ygsTr399zN3Qgt1Z7UAQa5b
         eYMmQ7LTHOcQ21UBmFztH+mndAUw1XaQ8MLvw0yHfHjYkeFH6zaTbnuNkLBGw4NgxeJC
         SZMw==
X-Gm-Message-State: AOAM53388+D79lfdoRfNUaoy/w8sxTQN8dfzevIyUGZahvQds+hjuzA4
        6AaITYAVEyPt/rVfwaSmpar7+fgsvUz0jJIh9x+CoQ==
X-Google-Smtp-Source: ABdhPJx8hj2gTCj9PYRTgACjYv7kxabHym1eg1FH9L7bh5Agk44u+REO6GOw2ek1V3BqEZO2n50wOS9SKzQHTosBO2I=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr26372930otf.25.1625790992061;
 Thu, 08 Jul 2021 17:36:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 9 Jul 2021 00:36:31 +0000
MIME-Version: 1.0
In-Reply-To: <1625576413-12324-4-git-send-email-sanm@codeaurora.org>
References: <1625576413-12324-1-git-send-email-sanm@codeaurora.org> <1625576413-12324-4-git-send-email-sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 9 Jul 2021 00:36:31 +0000
Message-ID: <CAE-0n520agdVS4H9Lfrs8agF4T6+P8665YTXjWcr_aqEDcRy4Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sc7280: Add USB nodes for IDP board
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratham Pratap <prathampratap@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Sandeep Maheswaram (2021-07-06 06:00:13)
> Add USB nodes for sc7280 IDP board.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

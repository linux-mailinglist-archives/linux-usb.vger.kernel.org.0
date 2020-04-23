Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 004361B654E
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 22:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgDWUUi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 16:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgDWUUi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Apr 2020 16:20:38 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EF2C09B042
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2020 13:20:38 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id rh22so5698093ejb.12
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2020 13:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YmiZ/ZxWr1VybX2u36jFFBljJvMI6PQcBnakrRBuFvc=;
        b=CYKHU/i/9Ack1w8T06q57x++2/81CCj12RQI1wHZVm/LaDgSLWabuo6CJLToatB+zj
         G/lV1NFsVlKnLURyRX+tVWQCUStABg+s+IBLXkO+jArdAtHdPWWOIpsKw/A48oG+sTiJ
         fo+w9tpow9sy6LH2l9frtCS/yhB1JgkG20vsArzt//cZ2i3ieUqQTs1glPd1jt6DBQQW
         OMn1zmZNuDfN6cUg1fGAetrIK10VLs5nqHD8EbyoPNaVfAs8U0s3nE73/13p/jspDzD3
         qGk42G2pHMDz/7U06BOF/vkonFDXVV+vjv83lkUY5pbUMsWg9NDLfaVAPzUl4762i6w5
         GwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YmiZ/ZxWr1VybX2u36jFFBljJvMI6PQcBnakrRBuFvc=;
        b=MUFfH8mxXmdgXrttTF1TWOTFP9pBA3fBoapvua6uw/qZXTMZNYM84swSn242KEBFgL
         CaAFiC4K8401wzazhunZlqLjpCTbm4UGwcAMGHS+oF8FWa7mbI6euICqtlDdBMuWCPlc
         trR4xCLXGizqMcls/6KhaTtESjwPFzufVHj34tUVYkrK4BOuiRoG4DBpX/ht80twqCaS
         MRt0H0szxcL4yPJ9ilUj/ivqK4Ndkr3hKFhujyxw1rtRKesFb9HFojgUfSrrUuc8dhco
         8rRqcKwD+7vAfJX7OTMJZ9mwyBkR7wKXV4KU6NG08nP5777dNCsi5/BdfbhI4EHVtjU5
         G88Q==
X-Gm-Message-State: AGi0Pua5U3wEJkcO4oQIjBDhonNuwOTSvm5jheh2PXNYw5jPNZCFC9UH
        B6/tAUX5UTaeRT6dgcrSF+CVxMPTPjvo3jZYWQY=
X-Google-Smtp-Source: APiQypLFRFUo8oCx8s1iec0XKMbb96VyOkGXbH/rG/5y1AOLbu+4xWQm+HOgQlwjdJd+++Z7AvXASdzqNqbctlxMVLE=
X-Received: by 2002:a17:906:ce49:: with SMTP id se9mr880124ejb.345.1587673236511;
 Thu, 23 Apr 2020 13:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191028182254.30739-1-pgwipeout@gmail.com> <5230f80c-9684-72e0-8f96-602428a9e655@arm.com>
 <9e5546de-f5b6-7f60-96d0-612249e832ce@arm.com> <CAMdYzYrZhof2DtrNH4+Amu1ZN-6sWw57rC+2joqXSyWVn99wWw@mail.gmail.com>
In-Reply-To: <CAMdYzYrZhof2DtrNH4+Amu1ZN-6sWw57rC+2joqXSyWVn99wWw@mail.gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Thu, 23 Apr 2020 16:20:25 -0400
Message-ID: <CAMdYzYppYADDTGD26uO4zpUCZWSW8eRpcdtLsUQGDqppW3_7vA@mail.gmail.com>
Subject: Re: [PATCH 0/5] add rk3328 usb3 phy driver
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, kishon@ti.com,
        katsuhiro@katsuster.net,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As a status update for this, I have spent quite a while working on this driver.
In the end, it appears the available documentation is insufficient.
The original driver calls a few registers that are not documented in the TRM.

What I have found is the following:
The 2.0 functionality works as documented in the original rockchip driver.
The 3.0 functionality does not.
A 3.0 device does not trigger the interrupt like a 2.0 device does.
A 3.0 device causes 0x34 bit 6 to toggle, which is usb3otg_pipe3_phystatus
I've enabled all usb3phy interrupts, and cannot get a 3.0 device to
trigger any of them.

Did the original driver ever work correctly?

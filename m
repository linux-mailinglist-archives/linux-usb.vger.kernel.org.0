Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B89D61D8ABE
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 00:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbgERW0u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 May 2020 18:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgERW0u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 May 2020 18:26:50 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFECDC061A0C
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2020 15:26:49 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id u15so11608446ljd.3
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2020 15:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U4BCVLRt8CC3bx65/x59hJGRt9Oaodvxu19LE1zktj8=;
        b=Wez2aN3Tpca4GrJdr39ccumwxICXjf/tskT23VCXUv3KcNxgdtxHDJ5w0c8xlnMWkr
         0UO5DanUgk87i8Q11110+zOQJrXWtxbrOv3pYsDh0hcHz7lLADAymYlMlgWz5xzoEbxE
         jKvh8+CbrzCIFJFcnL8P/my5JPwBcNd0npuMDN+r8kSoitTpOnplJQOcwLE2CTAG4n+0
         9m4lP4biaYTFR/9wLCTywb4qNIXh+DXkH76SqqUNBHW/uwslpDI1RGQZiYFf66KrXGpL
         m7gS/xk+p8eApaBCJnnEM+/71PSzklXhYLhWmrEPMKDbKR8KHCARN+Ue/JHfkk7Ts/xN
         FFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U4BCVLRt8CC3bx65/x59hJGRt9Oaodvxu19LE1zktj8=;
        b=IaE4WYipS+g5CGp/4iMhzR0WfGIXFjl6HHIIT48fOOUz5u3I4W99HKCdMOBL7viLf+
         CKcMrXS//fgPjz38a5/HtF5dSGr6nA16AU68fx4JRDCWKduXzg3+lVq5B0K+4AJ3rnxb
         vm5GtI9XScGeaacrgZ0Gmkg6VJxqpHKvcj57nPTTo1rAyWU6PhaoPceV7aw7xXnVWf3m
         afT/Ke+2aQ6qVI0JVtKx0L/NVsigBROmq0vuiBPrhSJrw9vF+zmVUZQ4M+oMDEZcc4hp
         D2H96V247p9AWvrT8pQBEE4ByL1XvxlOS/Y86Mt7ZiBIqed0hchPN8KUAuof9AXAAj8X
         UVRg==
X-Gm-Message-State: AOAM531pzA6FG0PdJtSkyiIAi12OCX7eiePTpPjGc9Y1ISQbl/ERA9M7
        +CejvxE6IFK83LNUf7wh3nrNLakViuFEVG+bI2w=
X-Google-Smtp-Source: ABdhPJxgWqwhZANzZc4ojHa5mQqmn/PpsSPPNFe1aYIBDnzTa50GFQQSkxfIg2etJ2eOswhF01tMr+HCRaT6dXttx+I=
X-Received: by 2002:a2e:b0ec:: with SMTP id h12mr6239026ljl.269.1589840806943;
 Mon, 18 May 2020 15:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5C1jm4Nr4uTvn14sRqe3mb1Li-iTJ4EhZSBju-x1pzyXg@mail.gmail.com>
 <VE1PR04MB6528C12091A5B0BD2DA0E51A89BA0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <CAOMZO5DzV6Kcxtd=UUL6iYW82rArviB7SA_y2eOzkKa3YjWe8g@mail.gmail.com> <VE1PR04MB652825D4B99C4EE47F75216789B80@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB652825D4B99C4EE47F75216789B80@VE1PR04MB6528.eurprd04.prod.outlook.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 18 May 2020 19:28:07 -0300
Message-ID: <CAOMZO5Bp8A5rrWJqBSWokE1EQQnE6G5AQCNWaMkm_LvTpWhsSA@mail.gmail.com>
Subject: Re: usbmisc_imx: charger detection errors
To:     Jun Li <jun.li@nxp.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Li Jun,

On Mon, May 18, 2020 at 9:09 AM Jun Li <jun.li@nxp.com> wrote:

> Please dump the below registers after connect the otg port
> to the power source for issue case:
>
> Non-core:
> 0x30b10400 ~ 0x30b10440

Today I was going to dump these registers, but I cannot see the
original error anymore.

If I ever see it again, I will dump these registers and will let you know.

Thanks

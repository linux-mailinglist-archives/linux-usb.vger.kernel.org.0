Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB662511D1
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 07:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgHYF6w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 01:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgHYF6w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 01:58:52 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA1DC061574
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 22:58:52 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id s2so11292122ioo.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 22:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=X9IvgIfh1N6W+tzg3lOSiIZ7jM8jhhGAt/+Zg04VhQk=;
        b=e83iRL2Kq1qzaDR4rC524dwaQkBOsJqbxnN8qeLavk4vW0b/HE9zt2CdG6GYhLRs2y
         5tC8SBRcuS7fOA0cOlTqjlZeh6B2Ez89s7HmV/nl+rB1VL18+KfuKk9inQ/qO/R2uIoq
         190tRhepwFdUOTQJ2rvZyCxK0IlGJG70cVLksDEjgfUgntjSFETZWOaUoVPCVBsrRT8M
         wNVJxT3IohyFkSKokkvjRnbENcS/KRKdjsc0TRfv0AsqrfNwuNYO0KuJpytd8oLkrnmk
         rcXrH+JO8ORVvKnZ1+EUDSwzL2vggUchQVXHXFZlY4fpCV1o6r/tgTh/0xYmxNev9MoB
         toHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X9IvgIfh1N6W+tzg3lOSiIZ7jM8jhhGAt/+Zg04VhQk=;
        b=tHMXOxkUCF/mBorLNsxftUo2v56sEiHsSsTDAvuOgjW/ag8tfe/sd4h9ePSpeRIfFm
         swteG4aX26me1tinjLj9KyucOm0TfdI9tVy1qHZP6rb8GRF1IPhshHQWzeFQkjhkpp8g
         mhAr5WXqU5tIOa+kNFbb1+5uRKZa+CyczpBgPsRyHwFxoPBqqxr3q6hRfPXEs4skOALp
         ElqTLEr5iBFn01PaY3duncwCfFFLEZR5vP7R/GwC9wSH+2+MSVPp916cWzsTW8zP80qf
         +9mQete6UEJfmODLbC9HlkKnY3Jmer+pM3mfvTXgcDGmyR32tSIAl6CeX54CjNjHzhCG
         cTcw==
X-Gm-Message-State: AOAM533TAXCBt6FKl2a/J2xKTX2C30KnSMg75njX1lqElFMv05PWw43b
        AatnY1QZeacQTPpjnAwWW4h7L6Z1p2b6KIn7hvyPYg==
X-Google-Smtp-Source: ABdhPJzLSjdzRVIp9nAT1UOBK4tJcosW8V2M62wduNBwxnOGFKkY+bOtQnXYE9pUCw2ZxcFDHipaiLbnWuHFvUvv42g=
X-Received: by 2002:a5d:80cb:: with SMTP id h11mr7782975ior.189.1598335131628;
 Mon, 24 Aug 2020 22:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200818161949.4083551-1-lorenzo@google.com> <CAHo-OozLD+uE3Oi+dp2O3LcbYc8QcWuhcVfK1VXPNp8HO+QcOQ@mail.gmail.com>
In-Reply-To: <CAHo-OozLD+uE3Oi+dp2O3LcbYc8QcWuhcVfK1VXPNp8HO+QcOQ@mail.gmail.com>
From:   Lorenzo Colitti <lorenzo@google.com>
Date:   Tue, 25 Aug 2020 14:58:39 +0900
Message-ID: <CAKD1Yr2y6L1-4gzN9FuSZO02oDJn90PnNfhcj95HpB40Xg_Rsw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: gadget: u_ether: enable qmult on SuperSpeed Plus
 as well
To:     =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 19, 2020 at 6:07 AM Maciej =C5=BBenczykowski
<zenczykowski@gmail.com> wrote:
>
> > The u_ether driver has a qmult setting that multiplies the
> > transmit queue length (which by default is 2).
>
> Reviewed-by: Maciej =C5=BBenczykowski <maze@google.com>

Felipe, Greg: Is there anything that I should be doing about this
patch, or should I just expect it to be merged at some point?

If you were thinking of looking at it again when the comments on the
NCM SuperSpeed patches are addressed, I just posted a new version of
those (v3), with a cover letter to explain what changed.

Thanks,
Lorenzo

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDDF52072F
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 23:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbiEIV7L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 17:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbiEIV66 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 17:58:58 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010142D9EEB
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 14:51:43 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2f7d621d1caso159832187b3.11
        for <linux-usb@vger.kernel.org>; Mon, 09 May 2022 14:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AvO3ygd/UqQBdhP/KL3f8qnTPDYPqb0azYvzR8YOfT8=;
        b=R3Bl52ygNd7YCtVGI1Dw5zkcyKwpLE8CGq7E2JVCvhEmmiwnJ4wmVpVM4hlSvlECuc
         OQDjh4PbkC9KiRGsYt0AXq17RBizWsfzpjBDi44Q8JKJVglwWIHC0BYVTNq/nQC/gYia
         I4x5J+hUljknRIc8rVa8KUkLegjNrIQsTA4RjmG7enjhjU7pf9lmdlt0hY4Xx2xd7Eud
         CbDnUZubySlms7d+G+FN3irKBt4FdgSC6BgxnsVCA3QRtieNX4s3giofwSk9qxOPcB/H
         bqwRhSvS+2yebAoixhhQ2quEtBR3/WErNLr/69uUN0Bm818iDpAErl2YPNBfXBbMM2zy
         eOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AvO3ygd/UqQBdhP/KL3f8qnTPDYPqb0azYvzR8YOfT8=;
        b=stMohJOlypJ4whMml0eRoW2rsrm5tGCOLaXNalETPmAxFEI8BywIuexdrMO62/RuyL
         rePBLSUJfQvscAXTavQ4XoCcFkTA8mWVTAaI0tlNp6kWc6q39neoiBzhenztgwVST7p4
         OYSuG5fSo5LXFPFMaWgrxVzIH70+jMLvgRwtTgajxCFOQ6P/b3m6r07Zjnz5EckDuj4l
         geKpWtNNNREgjq6TJX73KgK9Ex88ujRPhsllI1to7R6/xtDXiEPUvMeEVzyRBHeJ+iLl
         O7rdDrD9d05zDjcbXomZv6M+bt0/tcU7GfQt+A4AoKsLlPrzjvvg7/jhiNOcFyDAlBnH
         d7RQ==
X-Gm-Message-State: AOAM530djSvsT5hJipdDph8fLD7f5OTcdc2nRLpx3U+awpVOd+9ISEWK
        o7iAExlRtGdSSJUQbwIFZl2jzJbFwUoeDXYId4amSQ==
X-Google-Smtp-Source: ABdhPJz66qKQ182cMfzUcfRuUB+ezFafeLeHufnODn96xLMf/SFpFj0VGuEdSlO2r018rYSvQhdo92Derlajd83ax3s=
X-Received: by 2002:a0d:e5c6:0:b0:2f8:c866:7af9 with SMTP id
 o189-20020a0de5c6000000b002f8c8667af9mr16673482ywe.268.1652133101967; Mon, 09
 May 2022 14:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220421074204.1284072-1-hch@lst.de> <CACRpkdbdKBfmXGdyTm3T-MFAK30N-z4KH0k8eD8F7xaYUbDDhA@mail.gmail.com>
 <Ynk2wjRyH05uEJiO@shell.armlinux.org.uk>
In-Reply-To: <Ynk2wjRyH05uEJiO@shell.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 May 2022 23:51:29 +0200
Message-ID: <CACRpkdYVrPt_GHt19pT2BQZJ08QrS87XfvU-aWVibzP2qBSV2g@mail.gmail.com>
Subject: Re: fully convert arm to use dma-direct
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Christoph Hellwig <hch@lst.de>, Marc Zyngier <maz@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 9, 2022 at 5:44 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:

> Assabet is what needs testing for that, or one of the SA1110 machines.
> I'm away from home on my boat (and have been for the last two and a bit
> weeks) so can't test. Sorry.

Hm I actually have an Assabet, but I never even powered it up. I'm
on parental leave for another week but after that I could actually
try to get that machine up, but it'd be a bit late for this merge window
indeed.

BR
Linus Walleij

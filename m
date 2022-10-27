Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36DA9610693
	for <lists+linux-usb@lfdr.de>; Fri, 28 Oct 2022 01:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234560AbiJ0X5J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Oct 2022 19:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbiJ0X5I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Oct 2022 19:57:08 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D236D9E6
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 16:57:08 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c24so3340901pls.9
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 16:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tGKV5Nf2Jk21aZWVInuk/RjQUQoK1agLdBbsQYHrFSs=;
        b=TtOfdFq6WSn2lVr0vT05rhzYptg2X0aGPNyp4uNbF94m23GOhBllZAUd+rvHT8hGH8
         UMwMDmzD1OjSBtDesYg+Z7wUr1R28QjARLcCkcPf5WmND44BcHGt3CchBD8pEvkUIA8r
         aC8JE3YlPdI2hbWbtLnUI8xIPS7Ti2PAt+h58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGKV5Nf2Jk21aZWVInuk/RjQUQoK1agLdBbsQYHrFSs=;
        b=kUhIyG5TcHTZE0b4ET6jnsrbYB4NUgnfPzs2ij+VWVbWOEZLSnuhEzM8AZN9MH74pf
         bxDf5CiYSKgk1U/dvQkYb81OKRVqKgwE1FzgFxkcVAqqmmOgkXE3VpX0BWwH9KLDYyp4
         N3DbivVlo4p8rKMQJAiYvtMtxF6t2SY2cCl1O5CM+mvcJ+L1eRxIkeopDkSOH/+cWhfL
         QkMfwS2hae11WD5vnQ/HMt5yt7ZWZX+eOaEeA1pAWGEP5SBfdRM/viIeQKNNgMQSIHbR
         ra7Ss4YqJPMl9cGp4AMpCPSOBxppFC48A1UjcKBQmHPLgZNNEfT+gorjcKH2oZPn6qwF
         bAWQ==
X-Gm-Message-State: ACrzQf1/RGoo6CXbbgUi7XGWa3MzRH3Ku6wbtpUWWClgGC+oy8GWUVum
        oe5xI+LnKaVuiOJ3wHrshYmsJCaDAm895gjQXDTigGoWqO8=
X-Google-Smtp-Source: AMsMyM7Cuh6/VCUCIFkfdMLO8/hwS5Bcx50734KVdtKHu/QUAwsdU3j00obpsgvgGjHOSGIAAdZPH096GjGM7ani0/4=
X-Received: by 2002:a17:902:c40f:b0:186:b221:f378 with SMTP id
 k15-20020a170902c40f00b00186b221f378mr21282556plk.69.1666915027545; Thu, 27
 Oct 2022 16:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221027053407.421783-1-rekanorman@chromium.org> <Y1ohUyZJItFh3xDs@kroah.com>
In-Reply-To: <Y1ohUyZJItFh3xDs@kroah.com>
From:   Reka Norman <rekanorman@chromium.org>
Date:   Fri, 28 Oct 2022 10:56:56 +1100
Message-ID: <CAEmPcwtZt0RoksByW0OnkNsBiPJ-wHqzR9nuZEwAn3d2m=fyOA@mail.gmail.com>
Subject: Re: [PATCH] xhci: Apply XHCI_RESET_TO_DEFAULT quirk to ADL-N
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 27, 2022 at 5:11 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 27, 2022 at 04:34:07PM +1100, Reka Norman wrote:
> > ADL-N systems have the same issue as ADL-P, where a large boot firmware
> > delay is seen if USB ports are left in U3 at shutdown. So apply the
> > XHCI_RESET_TO_DEFAULT quirk to ADL-N as well.
> >
> > This patch depends on "xhci: Add quirk to reset host back to default
> > state at shutdown".
>
> What is the git commit id of that change?

It hasn't been merged in mainline yet, only in the xhci tree:
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?id=feb0b04b09c82589af65c84398b7d3fefaa7b7ac&head=for-usb-linus
Should I add the commit id from there? Or add the lore link?

>
> And is this needed in stable kernels?  If so, how far back?

Sorry, I'm not sure how to answer that properly.
It looks like most ADL-N support was added starting from 5.16.
The issue it fixes is a ~20s boot delay in the specific case of booting from S5.
It probably makes sense for it to go wherever the ADL-P patch goes.

>
> thanks,
>
> greg k-h

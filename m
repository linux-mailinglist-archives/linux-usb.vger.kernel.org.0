Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01BCB52B920
	for <lists+linux-usb@lfdr.de>; Wed, 18 May 2022 13:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235902AbiERLyP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 May 2022 07:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235939AbiERLyO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 May 2022 07:54:14 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF57381A2
        for <linux-usb@vger.kernel.org>; Wed, 18 May 2022 04:54:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AB251B81F93
        for <linux-usb@vger.kernel.org>; Wed, 18 May 2022 11:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4C8C385A5;
        Wed, 18 May 2022 11:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652874850;
        bh=iPWlo+xMTHEGHPNmN5xE6a/2rAdtp/CcYaTRGR5uBXE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E3bmIqXi4/WUWrkVjgRyh/1lEEMHe/6fqBTxn6NmtYyAe1PrCJ41fDaa/ZcxIXFdD
         OtWOyuVxEWCdGShqpweE+nDEP15n5t5ooI7S/XVoh6CXAoBH7GrNUHf6BCUmFmUMyp
         /omXJ4362QoGUoDb+1BYlSSgj3gsWhN58NhJBI9XJWPgabHmpbFf/6uH3ssV0z1RLu
         Rsp6er3tpy1luo+4xrjp3fMv23N8CNGhf3EN2dE0B90d2S5j5rg9VkilNWzxCoUKDC
         qzUhF4NiSVAp0Zp7aUCTgwDnudjj1KaGTUTAl+5b4kaZ466Lc114tKFfZQMWSwqwE5
         Wtiz3b9CrBkgg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nrIFn-0000QQ-5c; Wed, 18 May 2022 13:54:11 +0200
Date:   Wed, 18 May 2022 13:54:11 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Gary van der Merwe <garyvdm@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Bug report: pl2303 unknown device type -
Message-ID: <YoTeYzXRpS9NyMN9@hovoldconsulting.com>
References: <CAJixRzqf4a9-ZKZDgWxicc_BpfdZVE9qqGmkiO7xEstOXUbGvQ@mail.gmail.com>
 <YoPGdxtPqCsAiM8M@hovoldconsulting.com>
 <CAJixRzoZ5NeTE+p0gpUsnskmHu+AgEPTPf7U9g2s68obt0SAkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJixRzoZ5NeTE+p0gpUsnskmHu+AgEPTPf7U9g2s68obt0SAkw@mail.gmail.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 17, 2022 at 06:26:56PM +0200, Gary van der Merwe wrote:
> On Tue, May 17, 2022 at 5:59 PM Johan Hovold <johan@kernel.org> wrote:

> > Can I credit you using name and email in the commit message for
> > reporting this?
> 
> Sure. In hindsight, please use my work email, as it was done for work,
> and during work time: gary.vandermerwe@fnb.co.za

I've applied the fix with a 

	Reported-by: Gary van der Merwe <gary.vandermerwe@fnb.co.za>

tag now.

Thanks!

Johan

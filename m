Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAD8D415A58
	for <lists+linux-usb@lfdr.de>; Thu, 23 Sep 2021 10:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240023AbhIWIyV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Sep 2021 04:54:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:37022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239985AbhIWIyT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Sep 2021 04:54:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA9866126A;
        Thu, 23 Sep 2021 08:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632387168;
        bh=YqofSDjCBmN18EhkzyJ94tSs/sDA+sJ1cHa3mXKMpK0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k5d1pU9g9UQN0sTxpCU0mhs9vH4E1Lg6wuP9XstzZA/yTKolwUGXxuBn3cjgj0U0N
         L9TOULvw6avo5EKtjGszI2pPsVEB9Pi57wnPE2eMVvah0iDDgyk4sozEFoNtKzKWmo
         J3q7+kLmzGZnVzoli33dDFtQAPAd6aCLeqPz94TMrlq5Ra3N2+pF4k1G5MFPbTofdw
         EXF9EeT+qKzQjoCiz9pVT22Vtd1JZp8pgSGwWY2dP9fhQE5KvPjm7StVAUmTUH7U5j
         onF9Zt7+ytNLxYq2+XiNxGgeNfG4mGs15tez9iF8NmFTkhyuwWhMGDu8LLqnZYlNNc
         mq0IKqSPc9Cuw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mTKTJ-00010X-St; Thu, 23 Sep 2021 10:52:49 +0200
Date:   Thu, 23 Sep 2021 10:52:49 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Malte Di Donato <malte@neo-soft.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Possible bug in the cp210x kernel driver?
Message-ID: <YUxAYQggIYhZBDID@hovoldconsulting.com>
References: <zarafa.614a0e7a.4925.15cc733978d29bb6@neosoft.neo-soft.org>
 <YUsTYFOdMH/kQEyE@hovoldconsulting.com>
 <ecb45e46-a093-0bc8-7855-0c0714ee447b@neo-soft.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecb45e46-a093-0bc8-7855-0c0714ee447b@neo-soft.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 22, 2021 at 10:25:24PM +0200, Malte Di Donato wrote:
> On 22.09.21 13:28, Johan Hovold wrote:

> > Unfortunately your mails won't be seen by anyone else one the list
> > unless you can disable that html.
> finally it seems that I've got fixed that by now.
> Not so easy with "limited everything" on vacation :/

I understand. Good you got it sorted before your next diving trip. :)

> > I'll reply to this mail with a fix that fixes the dropped character
> > issue by disabling event-insertion mode (and thus parity reporting) for
> > devices such as yours.
> > 
> > I've verified it here as well as I could, but could you give it a spin
> > with your device as well? If you want you can reply to the patch mail
> > with a Tested-by tag and I'll add that to the commit message as well.

> Successfully tested the patch in debian kernel 5.10.0-8-amd64!

Thanks, and enjoy your vacation!

Johan

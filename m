Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC11F1008D2
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 17:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfKRQAL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 11:00:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:35880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbfKRQAL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Nov 2019 11:00:11 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 327C7206F4;
        Mon, 18 Nov 2019 16:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574092809;
        bh=inSJoXR4FGHau5GlVJvXkBq54clliW1jLQ/TpRWK+dQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xtM/GofXz5wxzbOPeQ01aM7bVLl2CZbZxaOeThC+GX8vcAH4uCKfH2ymV4UvnT0Su
         abYrmMPTUxwPaHJRKorXkSc2psWuyfqELsq5POPGWsEyCyOG/jS8106DKlYstS9KoG
         rtINSh11DWsaol4slM+oPDc7gvR8ZYjS4jQ4DHN4=
Date:   Mon, 18 Nov 2019 16:58:59 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Laura Abbott <labbott@redhat.com>
Cc:     Pacho Ramos <pachoramos@gmail.com>,
        Laura Abbott <labbott@fedoraproject.org>,
        linux-usb@vger.kernel.org
Subject: Re: JMicron USB to ATA/ATAPI Bridge requires usb-storage quirks to
 disable uas
Message-ID: <20191118155859.GA553955@kroah.com>
References: <CAHG43MtDYqiV6pye91D8_bA-4bMvVHWFHjsDgEMsmhh2n-Z2ww@mail.gmail.com>
 <20191118112837.GE156486@kroah.com>
 <ead122bf-4fb5-a9a8-053d-37426a4b7605@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ead122bf-4fb5-a9a8-053d-37426a4b7605@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 18, 2019 at 10:44:03AM -0500, Laura Abbott wrote:
> On 11/18/19 6:28 AM, Greg KH wrote:
> > On Mon, Nov 18, 2019 at 11:07:55AM +0100, Pacho Ramos wrote:
> > > Hello,
> > > 
> > > I would like to forward the patch that is being used for years in
> > > Fedora and Gentoo to fix connectivity issues of JMicron devices with
> > > UAS when they got into idle state:
> > > https://bugzilla.redhat.com/show_bug.cgi?id=1260207
> > > https://bugs.gentoo.org/640082
> > > 
> > > The problem is still valid with current kernels, then, I guess the
> > > patch wasn't forwarded here or got forgotten for some reason. This
> > > patch works fine for current kernel 4.13.11 too
> > 
> > Laura, any reason this patch was never sent upstream to us?  Any
> > objection for the patch below to be merged?
> > 
> 
> Huh this must have completely slipped off my radar. No objections.
> Thanks for the follow up!

Ok, now queued up, thanks.

greg k-h

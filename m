Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3FF21617ED
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 17:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbgBQQaU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 11:30:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:37906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726866AbgBQQaU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Feb 2020 11:30:20 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1A83214D8;
        Mon, 17 Feb 2020 16:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581957020;
        bh=aEmbtnOK/j3I6JyrPr4ubDGEdFkeKQjZqNn69A2RAUc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EpbxeZg+qt0AehYvMaxXGa6Qbf/4LnM+/G1r9WlZWpjP4hzEMtb9ll4iSvv/V74/7
         8EoyZY+et23Ajy+1fLwRBIs01Nf6+nJzc6QID+61FXKrfvIxlyZTX1dQ3vZK//O5rh
         kiI1VRpwwbDByblCCsCkyABBR46yedacsqxd5fYI=
Date:   Mon, 17 Feb 2020 17:30:18 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alberto Mattea <alberto@mattea.info>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: apply XHCI_SUSPEND_DELAY to AMD XHCI
 controller 1022:145c
Message-ID: <20200217163018.GD1502885@kroah.com>
References: <5340061.DvuYhMxLoT@alby>
 <20200217154538.GA1457504@kroah.com>
 <5575017.lOV4Wx5bFT@alby>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5575017.lOV4Wx5bFT@alby>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 17, 2020 at 05:07:17PM +0100, Alberto Mattea wrote:
> In data lunedì 17 febbraio 2020 16:45:38 CET, hai scritto:
> > On Mon, Feb 17, 2020 at 04:21:50PM +0100, Alberto Mattea wrote:
> > > Fixes suspend/resume
> > 
> > We are going to need a lot more information here, sorry.  Please be
> > explicit as to what you are doing and why.
> > 
> > thanks,
> > 
> > greg k-h
> > 
> 
> Sure, what about
> "This controller timeouts during suspend (S3) with 
> [  240.521724] xhci_hcd 0000:30:00.3: WARN: xHC save state timeout
> [  240.521729] xhci_hcd 0000:30:00.3: ERROR mismatched command completion event
> thus preventing the system from entering S3. Moreover it remains in an undefined state
> where some connected devices stop working until a reboot.
> Apply the XHCI_SUSPEND_DELAY quirk to make it suspend properly."

I sure beats the original 3 words you wrote :)


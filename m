Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C6B25BD59
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 10:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgICIdn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 04:33:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:35286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726025AbgICIdl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Sep 2020 04:33:41 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E24BA205F4;
        Thu,  3 Sep 2020 08:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599122021;
        bh=LQ5YIeW3yVJ0orrnIazbbtS8PK+RU6WwnBOd0cI68e0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cVik3WA4a2IX9Fel/jTq0TaeEI96aFl3sNtyRHtUvyb1gOahu697BQooWrEo2gnuB
         v14HBldVFckgMBDEicSYNzytLvQDOv0HT90o35GNa59a5fa+fJTnTbmD3+kT7A3C8M
         EtvYGyIalJLnTFzmogvi8mEVdCye3+o8ouk9+QOo=
Date:   Thu, 3 Sep 2020 10:34:04 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Tom Yan <tom.ty89@gmail.com>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Arnd Bergmann <arnd@arndb.de>, cyrozap@gmail.com,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v3 1/2] usb-storage: fix sdev->host->dma_dev
Message-ID: <20200903083404.GA2169202@kroah.com>
References: <CAGnHSE=4YNGTeoxQj+Hjy_EtRanhc-EEdiO_i8MRaLq1mKUCUw@mail.gmail.com>
 <20200903075639.31138-1-tom.ty89@gmail.com>
 <20200903082017.GB2166291@kroah.com>
 <CAGnHSEnSHD4P5D4EE+g55htoNhxKmS_V0FekNXAsJMDXBr=igg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGnHSEnSHD4P5D4EE+g55htoNhxKmS_V0FekNXAsJMDXBr=igg@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 03, 2020 at 04:28:53PM +0800, Tom Yan wrote:
> Hmm, actually the older versions were pretty much an entirely
> different approach/patch (not involving fixing the dma_dev at all).
> Should I just resend without the "v3"?

As you already sent a v3 patch series, the next one would be v4, right?
:)

thanks,

greg k-h

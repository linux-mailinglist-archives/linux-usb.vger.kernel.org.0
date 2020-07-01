Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C988921042A
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 08:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgGAGtJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 02:49:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:48864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbgGAGtJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 02:49:09 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 344F920747;
        Wed,  1 Jul 2020 06:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593586148;
        bh=QEBQrxZVM9HQ3uowb8hGXNoe0tIJpUE81nlcfRcemhc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o4QhDKEz/G2ez/no2RkaNsf6xNDdFzju45cTFL6m9O88NAWRZcAFKX6PRItpO9TnL
         a9nYg4eNmpf8kOEMSoyODatJ+7JDh7Nm7TDkhTG40rz+aCBtRFOy59im6RrCwsatlf
         5+doWk+rc380ToPrIccmSo5kJXAQzzk32yumynIs=
Date:   Wed, 1 Jul 2020 08:48:55 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: Fix up terminology
Message-ID: <20200701064855.GA2044019@kroah.com>
References: <20200630174123.GA1906678@kroah.com>
 <875zb791x1.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875zb791x1.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 01, 2020 at 09:36:58AM +0300, Felipe Balbi wrote:
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> 
> > USB is a HOST/DEVICE protocol, as per the specification and all
> > documentation.  Fix up terms that are not applicable to make things
> > match up with the terms used through the rest of the USB stack.
> >
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Do you want me to pick this up and send it back to you on a pull
> request? It's fine for me either way:
> 
> Acked-by: Felipe Balbi <balbi@kernel.org>

Thanks, I'll just take this as a whole patch, as it touches many files
in drivers/usb/ at once.

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B04F345462
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2019 07:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbfFNF46 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jun 2019 01:56:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:49584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbfFNF46 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Jun 2019 01:56:58 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E30B20850;
        Fri, 14 Jun 2019 05:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560491818;
        bh=0gD2EJhB725ESNjlaMEzRZKW9RwyLks4ClzrL8btopA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wear+1+iuBjex4nJUBBY3LMjmaw4xIWgNVwviq2LiMWzdt6uSmT+08rAAV4VgVVDq
         7YFhwW0j6QKf20uyOS3xSYd7VzmePEj5HJUUAbY6r/pWdLK5pPP+6Eah/3WaNCAiMF
         UVJ0GBb4kkNZx6M2DvPP8XUe893ooK4vbFaDtVbw=
Date:   Fri, 14 Jun 2019 07:56:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jonathan Olds <jontio@i4free.co.nz>
Cc:     'Johan Hovold' <johan@kernel.org>,
        frank@kingswood-consulting.co.uk, werner@cornelius-consult.de,
        boris@hajduk.org, linux-usb@vger.kernel.org
Subject: Re: linux/drivers/usb/serial/ch341.c calculates some baud rates wrong
Message-ID: <20190614055655.GB1011@kroah.com>
References: <000901d50e93$7cb31470$76193d50$@co.nz>
 <20190603072337.GB3668@localhost>
 <000001d51dbe$1245e560$36d1b020$@co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000001d51dbe$1245e560$36d1b020$@co.nz>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 08, 2019 at 05:49:51PM +1200, Jonathan Olds wrote:
> Hi Johan,
> 
> Thanks for the info. I followed
> https://nickdesaulniers.github.io/blog/2017/05/16/submitting-your-first-patc
> h-to-the-linux-kernel-and-responding-to-feedback/ and made a proposal patch
> ("[PATCH] USB: serial: ch341: fix wrong baud rate setting calculation"). The
> Get_maintainers.pl file didn't work for me I got...
> 
> ../../../scripts/get_maintainer.pl
> 0001-USB-serial-ch341-fix-wrong-baud-rate-setting-calcula.patch 
> ../../../scripts/get_maintainer.pl: The current directory does not appear to
> be a linux kernel source tree.

Call get_maintainer.pl when sitting in the 'root' of the kernel source
tree, not burried in a subdirectory.

thanks,

greg k-h

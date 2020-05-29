Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652DC1E7742
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 09:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbgE2HmU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 03:42:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:53324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgE2HmU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 May 2020 03:42:20 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F27320810;
        Fri, 29 May 2020 07:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590738139;
        bh=LPhb+p4Iza6Iux/AbIEEs638l29o2HWX+riL9qtt0W4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H0CirLsbLBMSuihL1Z11VgQVLl5VcWhh+QUXEhUTHylhiDRaUJuJqIxcAaaNB8QYV
         24p6XrQon1GdA5OCqeq1diAtImnaZuXkbPM6vhA0IMIkjWuIbOOipNktW8b239ARLV
         M31hCyjqkYvs1w0e2B+jOuXlKaa45QhPHI2L1pZY=
Date:   Fri, 29 May 2020 09:42:10 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial updates for 5.8-rc1
Message-ID: <20200529074210.GA599635@kroah.com>
References: <20200529072802.GA12532@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529072802.GA12532@localhost>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 29, 2020 at 09:28:02AM +0200, Johan Hovold wrote:
> The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:
> 
>   Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.8-rc1

Pulled and pushed out, thanks.

greg k-h

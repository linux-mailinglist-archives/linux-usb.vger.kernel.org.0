Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B815ECE7B6
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 17:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbfJGPgW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 11:36:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:45294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727876AbfJGPgW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Oct 2019 11:36:22 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DD282206C2;
        Mon,  7 Oct 2019 15:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570462581;
        bh=E/ltM2kjdhSKlUTVtYaNcpPKHP81l4wIo/fVo8ykSjM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FM0uCSWmh9mYzAe6waMA2WXlCa3dlIxKSPqmnyNWZER9zzc1Kt5nZWi6BX0MCywpR
         JRCQHt6TOcJ0/GeU/qBuCWCI49wBcs+xF+OBhxHliAdQ4zwGkYLinjnCnMfWh9SyQM
         ppgriF3qOCJcAQVuj54NUbaJthNa+8zCuvYwID78=
Date:   Mon, 7 Oct 2019 17:36:18 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Chris Clayton <chris2553@googlemail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org,
        Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>
Subject: Re: depmod warning on 5.4-rc2
Message-ID: <20191007153618.GB985210@kroah.com>
References: <9047f80f-f6eb-a45d-2505-08e4ad3a92df@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9047f80f-f6eb-a45d-2505-08e4ad3a92df@googlemail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 07, 2019 at 07:07:38AM +0100, Chris Clayton wrote:
> Just built and installed  -rc2 and get the following when depmod is run.
> 
> depmod: WARNING: /lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
> depmod: WARNING: /lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
> 
> .config is attached.
> 
> Please cc me on any reply, I'm not subscribed to any of the lists

This is a known issue in depmod right now, people are working on it if
you look at the kbuild mailing list...

thanks,

greg k-h

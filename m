Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19F5E24999
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 10:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfEUIAC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 04:00:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:58126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbfEUIAC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 May 2019 04:00:02 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58C292173C;
        Tue, 21 May 2019 08:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558425601;
        bh=TFwSkOxIndAaN2K59b4QOaMflwcLifnWjtAOfy4v02M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tvjY78tVwG1qYMv7nmPzcfXi0aXPxL8h8xXkTIWay8hGktjwxkS1kPEfKPcn71NLq
         VoldWl9MvRf6EwpqMUymIKoLveEntuFuZ+MeDQuFogzQ+J2T7KvgMJIVgmXseLzmxr
         7vP8zVBMU9+OIxUkh9nrBZyMTfK6xz0cU7Ej8OM8=
Date:   Tue, 21 May 2019 09:59:59 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     linux-usb@vger.kernel.org, devel@driverdev.osuosl.org
Subject: Re: TODO advice for octeon-usb?
Message-ID: <20190521075959.GA24848@kroah.com>
References: <20190520230532.GA3621@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520230532.GA3621@darkstar.musicnaut.iki.fi>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 21, 2019 at 02:05:32AM +0300, Aaro Koskinen wrote:
> Hi,
> 
> I'm looking for input what should be done next to get
> drivers/staging/octeon-usb out of staging.
> 
> Thousands of checkpatch errors/warnings have been fixed (starting point
> was <https://marc.info/?l=linux-driver-devel&m=137028876225266&w=2>),
> also the size of the driver has shrunken considerably.
> 
> If there are still some other bigger issues with this driver, please
> let me know.

Submit it as a patch that just adds the files to the drivers/usb/host/
directory so we can review it on linux-usb@vger and if it gets accepted,
I can then drop it from the staging directory, or just move it over if
no changes are needed.

thanks,

greg k-h

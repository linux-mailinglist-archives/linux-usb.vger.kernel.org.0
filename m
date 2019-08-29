Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A64FBA1293
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2019 09:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbfH2HZp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Aug 2019 03:25:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:40464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbfH2HZp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Aug 2019 03:25:45 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D56B20828;
        Thu, 29 Aug 2019 07:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567063544;
        bh=ajtKcpiPh1I4+3hUGcuVhSVsvUYBDVPK5BMuRw9jyfw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0DsdleN6EZDUWUpDhbiNTgGJkvXOMwBpbnssFEMwQ4rx0FqmsITdnD6cu9nAPvuF4
         CxbgD+TCyXYAgplD2/AR27xntzFlR8DCy4YHb08XHKpeIsXDYSHVMRv8imZjatgvzW
         LpQTu83+f1bJrC93bHwTNWh/3rExK4KM4VbYgPEk=
Date:   Thu, 29 Aug 2019 09:25:41 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Julius Werner <jwerner@chromium.org>
Cc:     Dan Williams <dcbw@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        USB Storage list <usb-storage@lists.one-eyed-alien.net>
Subject: Re: [PATCH] usb: storage: Add ums-cros-aoa driver
Message-ID: <20190829072541.GA5779@kroah.com>
References: <Pine.LNX.4.44L0.1908281155100.1302-100000@iolanthe.rowland.org>
 <bac067d344bef4e6fff7862fcad49cdbf4cd4ab5.camel@redhat.com>
 <CAODwPW-+c6Ty_gqEFEaE0YhtutMR2tFnhEFOQre81uyM3mfMVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW-+c6Ty_gqEFEaE0YhtutMR2tFnhEFOQre81uyM3mfMVA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 28, 2019 at 08:26:15PM -0700, Julius Werner wrote:
> Well... okay, let me think through that again. I just found the new_id
> sysfs API that I wasn't aware of before, maybe I could leverage that
> to bind this from userspace after doing the mode switch. But it looks
> like that only operates on whole devices... is there any way to force
> it to only bind one particular interface?

USB drivers only bind to interfaces, are you saying that your device has
multiple interfaces on it?

thanks,

greg k-h

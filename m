Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07CE11BBB96
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 12:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgD1KuV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 06:50:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:53664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726312AbgD1KuU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Apr 2020 06:50:20 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3B5E206A1;
        Tue, 28 Apr 2020 10:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588071020;
        bh=rxb/0vY2FClH3YjatA1F1gNfn4+FZevJnh4ToaKxA+A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vXvkfi/PK2q0V7nXwLn/V9USydwZGQXW3Zctrz5nNgHlX4ukP7xgdSKi+LHcnwAeI
         DluyHgUvauVg0YL+LrtXAVuJ4Moqn/a8QLzU7RHQkH9cJPAtgNstMqxH54m6cWkGyX
         KazBXE2dzsqiLf9t6SrwfVmKWf6uPrCqayYZw4Mk=
Date:   Tue, 28 Apr 2020 12:50:18 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fix for v5.7-rc4
Message-ID: <20200428105018.GA1143911@kroah.com>
References: <20200428090956.GR487496@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428090956.GR487496@lahna.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 28, 2020 at 12:09:56PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:
> 
>   Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-fix-for-v5.7-rc4
> 
> for you to fetch changes up to 9d2214b14103594efdbf33018b893b9417846d42:
> 
>   thunderbolt: Check return value of tb_sw_read() in usb4_switch_op() (2020-04-20 11:54:19 +0300)
> 
> ----------------------------------------------------------------
> thunderbolt: Fix for v5.7-rc4
> 
> - Fix checking return value of tb_sw_read() in usb4_switch_op().
> 
> ----------------------------------------------------------------
> Mika Westerberg (1):
>       thunderbolt: Check return value of tb_sw_read() in usb4_switch_op()

Why does this commit not have a cc: stable tag on it?  I can apply it by
hand and add it, but that will not show up as a pull request/merge, is
that ok?

thanks,

greg k-h

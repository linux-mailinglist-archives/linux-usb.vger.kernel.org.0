Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48D203DFCF4
	for <lists+linux-usb@lfdr.de>; Wed,  4 Aug 2021 10:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236578AbhHDIds (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Aug 2021 04:33:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:60494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236575AbhHDIdr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Aug 2021 04:33:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7FAA60F02;
        Wed,  4 Aug 2021 08:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628066015;
        bh=aDeGF4pooaG1hjRNoV3CAXip0tV7XY7eRqtREyadNuA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XNeiWT519vur7bkyTajolw73CAIFkbMc4zpUW7E6Zg4sTZUaHwOhTPXXjx45jXV01
         XdRPvV/hY+WjKZyoh2RmuAyt27bG/0s2OJ58ZytQlef3anh/Wi6GSWwAztbJg0Sx68
         U0BMrGGyB6H5dIZX/kjCeOu+vSai6uqdiDUdBQhdYWSKLo+LgDEiOs6wYY1JQ89IhQ
         N6PiotnAE6aorRRmrE114s+J8olorzetszWYm6Atb4vuBj67I7dnJwKPhUsdWp5IVu
         0ZkEGA1Qfpy/MxwNlXT1sayzOZPdjxrifl1wTljIH/NjOBF+4jT2tq6hsShbRROenj
         HMagjmf+Bl01w==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mBCKb-0006AC-Tb; Wed, 04 Aug 2021 10:32:53 +0200
Date:   Wed, 4 Aug 2021 10:32:53 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] usb: serial: option: add Telit FD980 composition
 0x1056
Message-ID: <YQpQtW87OVFmIbyO@hovoldconsulting.com>
References: <20210803194711.3036-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803194711.3036-1-dnlplm@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 03, 2021 at 09:47:11PM +0200, Daniele Palmas wrote:
> Add the following Telit FD980 composition 0x1056:
> 
> Cfg #1: mass storage
> Cfg #2: rndis, tty, adb, tty, tty, tty, tty
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>

Thanks, Daniele. Now applied.

Johan

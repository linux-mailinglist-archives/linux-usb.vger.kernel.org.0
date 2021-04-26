Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E4A36AF98
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 10:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232313AbhDZIRN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 04:17:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:58596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232241AbhDZIQL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Apr 2021 04:16:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74730610A5;
        Mon, 26 Apr 2021 08:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619424915;
        bh=U/Otkz85HiOyCqduJ/iNCH0bHdrS0KNOwlLPffI1les=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CqEnJAwI2tb93cIhqJRR8l8/u8rwM/Mlm/GQbZfO50TFxwIsN1tLsNXaJH05yd9g/
         y+0JijVxQ9op+iu56COwmZ94sJa+MWC+MuLtMn/sRFFYA03QTAS9rlkIBknRUO+3XM
         vfmHmpXHlNFdehIZiX9jk2L+Aol3/rQ1/E1iED5EW13ty8r9QHTMLSkJeRosKeu9NW
         4SBpd9T1SFk62sPcMfM0MgJa1mK/ktO4uG2w85QnIWh1rLM343wP9k0OxI3pq1piYL
         Cxu5mM11M0TtdOU50C9LxOLnd23PmcA0jqRK3FtiYnlPTSf6qEBmt67I4gB5l+eoO5
         bZi4WlEXEcJrA==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lawOr-0002kY-Q1; Mon, 26 Apr 2021 10:15:25 +0200
Date:   Mon, 26 Apr 2021 10:15:25 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Leonardo Antoniazzi <leoanto@aruba.it>
Cc:     linux-usb@vger.kernel.org
Subject: Re: hso driver kernel NULL pointer dereference
Message-ID: <YIZ2nUbwUc3ABDWg@hovoldconsulting.com>
References: <20210425233509.9ce29da49037e1a421000bdd@aruba.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210425233509.9ce29da49037e1a421000bdd@aruba.it>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Apr 25, 2021 at 11:35:09PM +0200, Leonardo Antoniazzi wrote:
> Hello,
> removing my usb-modem (option icon 226) i get this oops (i attached the dmesg output):
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000068
> 
> reverting this patch fix the problem on detaching the modem:
> 
> https://marc.info/?l=linux-usb&m=161781851805582&w=2
> 
> I'm not a developer, i hope the attached dmesg.txt will suffice

Thanks for reporting this.

Can you confirm that the fix I just posted resolves this (and reply to
that patch with a Tested-by tag if you want)?

	https://lore.kernel.org/r/20210426081149.10498-1-johan@kernel.org

Johan

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C38F2EEA80
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 21:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbfKDUxv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 15:53:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:44402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728332AbfKDUxv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 15:53:51 -0500
Received: from localhost (6.204-14-84.ripe.coltfrance.com [84.14.204.6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 24E192067D;
        Mon,  4 Nov 2019 20:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572900830;
        bh=DAb2Ay7cCskNOF/bgmTl5Fi0myhxr5UbOH5Sizpb5Yo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eJa58TIRWrq2PHLuqYI6WWOPXlBZWvrEu4i++D4bBRGm/OVaiM/YKyfUIfj2RXF3K
         QDSQMQqQTw8D0bv9Z165PZ7/g6mee24/St7NhyFwhy+p8HlSRqGEW0rjnjwD4YM2XT
         yWpzVtdN+iZe0G1CKnNmALwS5k4P0a2ac+tEb+V8=
Date:   Mon, 4 Nov 2019 21:53:48 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 00/18] usb: typec: API improvements
Message-ID: <20191104205348.GA2409544@kroah.com>
References: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
 <20191104150524.GA2237300@kroah.com>
 <20191104185332.GA5250@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104185332.GA5250@roeck-us.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 04, 2019 at 10:53:33AM -0800, Guenter Roeck wrote:
> On Mon, Nov 04, 2019 at 04:05:24PM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Nov 04, 2019 at 05:24:17PM +0300, Heikki Krogerus wrote:
> > > Hi,
> > > 
> > > I removed the extra error messages from ucsi_acpi.c and ucsi_ccg.c as
> > > requested by Guenter.
> > 
> > I've applied the first 11 patches now, as it looks like Guenter wanted a
> > better comment in patch 12 :(
> > 
> Sounds like I am too picky. Feel free to ignore and go ahead.  
> FTR, I'll send a Reviewed-by: for that patch.

Fair enough, thanks for this, I'll go queue up the rest now.

greg k-h

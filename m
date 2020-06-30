Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B827620F0AA
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jun 2020 10:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731591AbgF3ImE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jun 2020 04:42:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:53436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728132AbgF3ImD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 30 Jun 2020 04:42:03 -0400
Received: from localhost (unknown [84.241.197.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A37D120768;
        Tue, 30 Jun 2020 08:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593506523;
        bh=mJs4t0mBRaMgW/kxuteoU02aAN42rC3YXh1wDRb09bY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VoOof0SEl4WeUh4qu63HU7NkAq3d04JuRsgFTRVsAlCZI8E4jr7+M8uqEC1HZdmVx
         bS0ORnZmbD8FyZWc7odqk1cYvvOcr7zK97K2rnI+b8WoDfS8juPdJTqq45cRFUllka
         dmyAeYl/5sw4gA1GS4gD5QxgDPMOKT9sEZEPyBbE=
Date:   Tue, 30 Jun 2020 10:42:00 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@dell.com>
Subject: Re: Dell XPS 13 9360: PM: Device 0000:39:00.0 failed to resume
 async: error -19
Message-ID: <20200630084200.GB637154@kroah.com>
References: <407332cd-c176-23b9-7e5f-76b27c9c7c06@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <407332cd-c176-23b9-7e5f-76b27c9c7c06@molgen.mpg.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 29, 2020 at 10:30:59PM +0200, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> On the Dell XPS 13 9360 with Ubuntu 20.04 LTS and Linux 5.4.0-39-generic,

That is an old kernel (and a distro one), can you please try 5.7.6 from
kernel.org?

thanks,

greg k-h

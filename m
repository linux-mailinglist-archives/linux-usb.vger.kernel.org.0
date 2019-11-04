Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66CA4EE314
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 16:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbfKDPFz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 10:05:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:59346 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728287AbfKDPFz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 10:05:55 -0500
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 40CE921850;
        Mon,  4 Nov 2019 15:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572879954;
        bh=SOM85/43NUw5+DsBwnssM1Wxi9cXxFtzxROmUpSM4A0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JoS4ufLTNCOlbNNMM2tFJcAx4h1bzedeBMfLcLpr0ncKWYqVvuvtZa3Wr9Ad63gCg
         eT4ilFTHttE87rVBLp+8h8m74pQvZCofnZdg0VwFs9CIwxUHVDJlfH3oAgqBDdD3ca
         1CEjmvndA1rzSDiP4WOGj02xsjeZJlsWACGyWUjM=
Date:   Mon, 4 Nov 2019 16:05:24 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 00/18] usb: typec: API improvements
Message-ID: <20191104150524.GA2237300@kroah.com>
References: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 04, 2019 at 05:24:17PM +0300, Heikki Krogerus wrote:
> Hi,
> 
> I removed the extra error messages from ucsi_acpi.c and ucsi_ccg.c as
> requested by Guenter.

I've applied the first 11 patches now, as it looks like Guenter wanted a
better comment in patch 12 :(

Feel free to rebase and resend the remaining as a new series.

thanks,

greg k-h

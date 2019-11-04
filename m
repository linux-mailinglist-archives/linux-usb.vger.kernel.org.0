Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A27C9EEA82
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 21:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729367AbfKDUyE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 15:54:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:44476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728602AbfKDUyE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 15:54:04 -0500
Received: from localhost (6.204-14-84.ripe.coltfrance.com [84.14.204.6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 786D120717;
        Mon,  4 Nov 2019 20:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572900843;
        bh=94VpGBso0EiMOXI5aL2nbQ7ZcrVPrd8v37rWOvx1z3k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E5bA+ESHbb9VK4d8i8xb6OddEsTBLdxIuCwD5YUUlYSk/JcHZ/dhJki4un6NxbLL3
         ZS5Uxmtk5mCK6yYGdJ8j6do1upv6DSPGP10Yfc2bAnRStohS8mf63eHl+izPkm8qGJ
         W2Znrcbom9h89ItaX2iQAv2tzmsoy3GtkvrYMvac=
Date:   Mon, 4 Nov 2019 21:54:01 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 00/18] usb: typec: API improvements
Message-ID: <20191104205401.GB2409544@kroah.com>
References: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
 <20191104150524.GA2237300@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104150524.GA2237300@kroah.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 04, 2019 at 04:05:24PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Nov 04, 2019 at 05:24:17PM +0300, Heikki Krogerus wrote:
> > Hi,
> > 
> > I removed the extra error messages from ucsi_acpi.c and ucsi_ccg.c as
> > requested by Guenter.
> 
> I've applied the first 11 patches now, as it looks like Guenter wanted a
> better comment in patch 12 :(

Oh, and very nice work.  thanks for doing this.

greg k-h

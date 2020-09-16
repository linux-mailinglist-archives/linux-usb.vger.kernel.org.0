Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 150A826C0DD
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 11:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgIPJmQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 05:42:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:56904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726392AbgIPJmN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 05:42:13 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C477721974;
        Wed, 16 Sep 2020 09:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600249333;
        bh=Zyz1k6+4C95Uq9AAHgQJys/Qg/hwN8GgPH4IQdZSgmU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pfhppxslLK+WkRCPGNnOPmAorHZQA4r7hh+thJND1dlVKOHspJa7NN+Fs2aXIbpzS
         Jyl9rWhj7KSy78QtPhGdSToxHVgipbetcrq5nD2vjv42FHnW7VQViAhrhks45OMjYF
         PvAj9ch9n6qYridTAAm0t45QDDj2cfYWLZw5eSng=
Date:   Wed, 16 Sep 2020 11:42:48 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org,
        Madhusudanarao Amara <madhusudanarao.amara@intel.com>
Subject: Re: [PATCH 3/3] usb: typec: intel_pmc_mux: Handle SCU IPC error
 conditions
Message-ID: <20200916094248.GA740415@kroah.com>
References: <20200916091102.27118-1-heikki.krogerus@linux.intel.com>
 <20200916091102.27118-4-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916091102.27118-4-heikki.krogerus@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 16, 2020 at 12:11:02PM +0300, Heikki Krogerus wrote:
> From: Madhusudanarao Amara <madhusudanarao.amara@intel.com>
> 
> Check and return if there are errors. The response bits are valid
> only on no errors.
> 
> Fixes: b7404a29cd3d ("usb: typec: intel_pmc_mux: Definitions for response status bits")

This is in 5.9-rc4, so shouldn't it go in for 5.9-final?

thanks,

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1F225FCCD
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 17:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730069AbgIGPQa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 11:16:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:37790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730135AbgIGPPb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 11:15:31 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C62C217A0;
        Mon,  7 Sep 2020 15:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599491251;
        bh=nVx7p/+/FpUSEtrPVHaj11w9VB7peYgI21e7trFu9dE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NWt9m7mMaqnOZnVPxnkrTK7o1MvGJ1wuHavZMZapiWQED7US8C8QO3gcJPxWHaPpb
         LuY0WgzCS10xoysZjeGK0h3PryoDlgKfWwMaBwQ43l6Q6bKMqg5zfHJkv/s5FzpdeF
         8fMhjeVb/yxO4E6aZYUGCSbU/2JN+S53QoIlk5YE=
Date:   Mon, 7 Sep 2020 17:07:45 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Utkarsh Patel <utkarsh.h.patel@intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 0/2] usb: typec: intel_pmc_mux: Port status from IOM
 microcontroller
Message-ID: <20200907150745.GA3782597@kroah.com>
References: <20200907142428.35838-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907142428.35838-1-heikki.krogerus@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 07, 2020 at 05:24:26PM +0300, Heikki Krogerus wrote:
> Hi,
> 
> This is the third version of the series. The original two were send by
> Rajmohan. There is now no separate IOM driver. Instead the mux driver
> simply reads the IOM registers directly.

Much cleaner, or at the very least, self-contained :)

thanks for the changes,

greg k-h

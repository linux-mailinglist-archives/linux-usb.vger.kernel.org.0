Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A3425FC59
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 16:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730055AbgIGOyv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 10:54:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:59660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729889AbgIGOxW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 10:53:22 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7CD7A207C3;
        Mon,  7 Sep 2020 14:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599490382;
        bh=JC9nnzVrHcw3JNmXn1wBkr67sKeHB8MZJZI1vvATfwA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S4wPrTOYk2TQzK/mk8Ts5ernOC/TKoNkGo6E4Mqy85c8JSyc4vo8F0ip95zu6U7uq
         KAJDK1KJOjo4ODMWFzPJR+uYceGKEnmyhrn2RtIR8WxR8BvlsSlkM9BqCO2X62BorX
         +mh7yUagGhAjotbzonJg7k/iVFFWjfj0KfVWEAcc=
Date:   Mon, 7 Sep 2020 16:53:16 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Utkarsh Patel <utkarsh.h.patel@intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: intel_pmc_mux: Do not configure SBU and
 HSL Orientation in Alternate modes
Message-ID: <20200907145316.GA3767242@kroah.com>
References: <20200907142152.35678-1-heikki.krogerus@linux.intel.com>
 <20200907142152.35678-3-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907142152.35678-3-heikki.krogerus@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 07, 2020 at 05:21:52PM +0300, Heikki Krogerus wrote:
> From: Utkarsh Patel <utkarsh.h.patel@intel.com>
> 
> According to the PMC Type C Subsystem (TCSS) Mux programming guide rev
> 0.7, bits 4 and 5 are reserved in Alternate modes.
> SBU Orientation and HSL Orientation needs to be configured only during
> initial cable detection in USB connect flow based on device property of
> "sbu-orientation" and "hsl-orientation".
> Configuring these reserved bits in the Alternate modes may result in delay
> in display link training or some unexpected behaviour.
> So do not configure them while issuing Alternate Mode requests.
> 
> Fixes: ff4a30d5e243 ("usb: typec: mux: intel_pmc_mux: Support for static SBU/HSL orientation")

5.8 is still a stable kernel now, so I'll add cc: stable to this...

thanks,

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C998EE1D0
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 15:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbfKDOE1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 09:04:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:38158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727782AbfKDOE1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 09:04:27 -0500
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ED73C218BA;
        Mon,  4 Nov 2019 14:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572876266;
        bh=JfrQzHk4VVvW0rbpX/mHKv3AhoW6sHfAbE/yIi+CTlw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OdhRoJc2/mmWkG31jP61Am6yxGJtjcNlbjKsqUEKhGxkK/ZlTuKDc4wu4abLZEDvl
         23gUmKGO4Zs1HDYlNKY81PVAHb5crSCh7gPWLMdV6/D3ARzMhtXztdu2HUR13/yGgC
         Go7RsFy4ngzpyHSew0LA5k1YGqZxmhk8x/xh2afE=
Date:   Mon, 4 Nov 2019 15:04:22 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 0/2] extcon: axp288: Move to swnodes
Message-ID: <20191104140422.GA2180983@kroah.com>
References: <20191008122600.22340-1-heikki.krogerus@linux.intel.com>
 <8120fbf2-08d3-6ee2-21bf-458a4e12b29c@redhat.com>
 <20191104130904.GC29493@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104130904.GC29493@kuha.fi.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 04, 2019 at 03:09:04PM +0200, Heikki Krogerus wrote:
> Hi Greg,
> 
> On Tue, Oct 08, 2019 at 03:59:23PM +0200, Hans de Goede wrote:
> > Hi,
> > 
> > On 08-10-2019 14:25, Heikki Krogerus wrote:
> > > Hi Hans,
> > > 
> > > Fixed the compiler warning in this version. No other changes.
> > > 
> > > The original cover letter:
> > > 
> > > That AXP288 extcon driver is the last that uses build-in connection
> > > description. I'm replacing it with a code that finds the role mux
> > > software node instead.
> > > 
> > > I'm proposing also here a little helper
> > > usb_role_switch_find_by_fwnode() that uses
> > > class_find_device_by_fwnode() to find the role switches.
> > 
> > Both patches look good to me and I can confirm that things still
> > work as they should on a CHT device with an AXP288 PMIC, so for both:
> > 
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > Tested-by: Hans de Goede <hdegoede@redhat.com>
> 
> These two patches in this series are basically about the usb role API,
> so can you take them?

Sure, will do that, thanks.

greg k-h

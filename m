Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B13D7434ADB
	for <lists+linux-usb@lfdr.de>; Wed, 20 Oct 2021 14:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhJTMMb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Oct 2021 08:12:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:43042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229941AbhJTMMb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 Oct 2021 08:12:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E53261074;
        Wed, 20 Oct 2021 12:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634731816;
        bh=6Ks1/eR+X7U36GpSUhjOn7JjPSsSzjIPabkDWckSdnA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GoQ/wmYVukyLJw/lhbTDdLET8gH3Zz7Jttgjn8z9plPWfO52znmTKnCyRoUHNKl/k
         udsvM/r4P0pdhyolpLUKpE6ZP7l5kVJRIg9Iv9i4JKkIZsRFTnrJIKl1ArSGSunIcM
         us00TbPX5ZB2TLuqf8T1nvUeV9MesO/8dtJ5pjG8=
Date:   Wed, 20 Oct 2021 14:10:13 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Saranya Gopal <saranya.gopal@intel.com>, linux-usb@vger.kernel.org,
        heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        rajaram.regupathy@intel.com
Subject: Re: [PATCH 0/2] Fix IRQ flood issue in TI PD controller
Message-ID: <YXAHJZH1KHKmgDgY@kroah.com>
References: <20211020022620.21012-1-saranya.gopal@intel.com>
 <5d717e4a-f859-da28-8cf0-7bca373161c9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d717e4a-f859-da28-8cf0-7bca373161c9@redhat.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 20, 2021 at 01:54:39PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 10/20/21 04:26, Saranya Gopal wrote:
> > Hi,
> > 
> > There was an issue reported that the TI PD controller driver is causing 
> > high CPU load due to a flood of interrupts. So, a patch was added in 
> > the i2c-multi-instantiate driver to stop the TI PD driver from loading 
> > in devices with INT3515 ACPI nodes.
> > We identified that required event interrupts are not being set in the interrupt 
> > mask register from the driver to the register of the controller.
> > We enabled only the necessary events like data status update, power status update 
> > and plug events in the interrupt mask register of the TI PD controller. 
> > After enabling these events in the interrupt mask register, there is no interrupt flood.
> > This patch series contains the fix for the interrupt flood issue 
> > in the TI PD driver and another patch to re-enable the INT3515 platform device.
> > I prefer this patch series to be taken through usb tree since the fix is in 
> > the TI USB PD driver and the second patch is just a revert patch.
> > 
> > Hi Hans,
> > Could I get your Ack to take this series through the usb tree?
> 
> Since Heikki has reviewed the revert, I'm fine with this and I'm
> also fine with taking this upstream through the usb tree:
> 
> Acked-by: Hans de Goede <hdegoede@redhat.com>

Thanks, I'll queue it up.

greg k-h

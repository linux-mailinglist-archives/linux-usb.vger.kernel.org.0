Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4DA41F56D9
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jun 2020 16:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgFJOcV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Jun 2020 10:32:21 -0400
Received: from netrider.rowland.org ([192.131.102.5]:51685 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726506AbgFJOcV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Jun 2020 10:32:21 -0400
Received: (qmail 14093 invoked by uid 1000); 10 Jun 2020 10:32:20 -0400
Date:   Wed, 10 Jun 2020 10:32:20 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     mathias.nyman@intel.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] xhci: Suspend ports to U3 directly from U1 or U2
Message-ID: <20200610143220.GC11727@rowland.harvard.edu>
References: <20200610064231.9454-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200610064231.9454-1-kai.heng.feng@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 10, 2020 at 02:42:30PM +0800, Kai-Heng Feng wrote:
> xHCI spec "4.15.1 Port Suspend" states that port can be put to U3 as long
> as Enabled bit is set and from U0, U1 or U2 state.
> 
> Currently only USB_PORT_FEAT_LINK_STATE puts port to U3 directly, let's
> do the same for USB_PORT_FEAT_SUSPEND and bus suspend case.
> 
> This is particularly useful for USB2 devices, which may take a very long
> time to switch USB2 LPM on and off.

Have these two patches been tested with a variety of USB-2.0 and USB-2.1 
devices?

Alan Stern

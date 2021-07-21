Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C6D3D113F
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 16:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238000AbhGUNpg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 09:45:36 -0400
Received: from netrider.rowland.org ([192.131.102.5]:40079 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S239487AbhGUNmN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 09:42:13 -0400
Received: (qmail 634121 invoked by uid 1000); 21 Jul 2021 10:22:16 -0400
Date:   Wed, 21 Jul 2021 10:22:16 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     dave penkler <dpenkler@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, qiang.zhang@windriver.com,
        Dmitry Vyukov <dvyukov@google.com>, paulmck@kernel.org,
        Guido <guido.kiener@rohde-schwarz.com>,
        USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning
Message-ID: <20210721142216.GA633399@rowland.harvard.edu>
References: <20210629033236.7107-1-qiang.zhang@windriver.com>
 <YPfIAolSC8mJoQUr@kroah.com>
 <CAL=kjP0YnzF8sALwH5T5+NpWn3wsuqR+K3GLHDJXLkdO4usyWw@mail.gmail.com>
 <YPfSR4+XANsatypk@kroah.com>
 <CAL=kjP1OweXxw3zgs_WfpmZw-YJZN=dxand6twgQruwgAyfAaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL=kjP1OweXxw3zgs_WfpmZw-YJZN=dxand6twgQruwgAyfAaQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 21, 2021 at 11:44:23AM +0200, dave penkler wrote:
> Sorry, the issue this patch is trying to fix occurs because the
> current usbtmc driver resubmits the URB when it gets an EPROTO return.
> The dummy usb host controller driver used in the syzbot tests keeps
> returning the resubmitted URB with EPROTO causing a loop that starves
> RCU. With an actual HCI driver it either recovers or returns an EPIPE.

Are you sure about that?  Have you ever observed a usbtmc device recovering 
and continuing to operate after an EPROTO error?

An EPIPE error also seems rather unlikely -- particularly if the device is 
not plugged into a high-speed hub.

Alan Stern

> In either case no loop occurs. So for my part as a user and maintainer
> this patch is not ok.

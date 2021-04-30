Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C4836FCDE
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 16:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233485AbhD3Osn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 10:48:43 -0400
Received: from netrider.rowland.org ([192.131.102.5]:43985 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S233361AbhD3Ose (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Apr 2021 10:48:34 -0400
Received: (qmail 527936 invoked by uid 1000); 30 Apr 2021 10:47:44 -0400
Date:   Fri, 30 Apr 2021 10:47:44 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Li Jun <jun.li@nxp.com>
Cc:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        peter.chen@kernel.org, jackp@codeaurora.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v2 1/3] usb: host: move EH SINGLE_STEP_SET_FEATURE
 implementation to core
Message-ID: <20210430144744.GB526617@rowland.harvard.edu>
References: <1619763393-20029-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619763393-20029-1-git-send-email-jun.li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 30, 2021 at 02:16:31PM +0800, Li Jun wrote:
> From: Peter Chen <peter.chen@nxp.com>
> 
> It is needed at USB Certification test for Embedded Host 2.0, and
> the detail is at CH6.4.1.1 of On-The-Go and Embedded Host Supplement
> to the USB Revision 2.0 Specification. Since other USB 2.0 capable
> host like XHCI also need it, so move it to HCD core.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

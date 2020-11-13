Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064E62B21F3
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 18:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgKMRTg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 12:19:36 -0500
Received: from netrider.rowland.org ([192.131.102.5]:52969 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726603AbgKMRTf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Nov 2020 12:19:35 -0500
Received: (qmail 327245 invoked by uid 1000); 13 Nov 2020 12:19:48 -0500
Date:   Fri, 13 Nov 2020 12:19:48 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     gregkh@linuxfoundation.org, peter.chen@nxp.com,
        s.hauer@pengutronix.de, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-mxc: Remove the driver
Message-ID: <20201113171948.GG322940@rowland.harvard.edu>
References: <20201113171231.2205-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113171231.2205-1-festevam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 13, 2020 at 02:12:31PM -0300, Fabio Estevam wrote:
> The ehci-mxc driver was only used by i.MX non-DT platforms.
> 
> Since 5.10-rc1, i.MX has been converted to a DT-only platform and all
> board files are gone.
> 
> Remove the ehci-mxc driver as there are no more users at all.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

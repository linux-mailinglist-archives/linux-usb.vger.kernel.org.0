Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06FC748DF2D
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 21:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234648AbiAMUrr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 15:47:47 -0500
Received: from netrider.rowland.org ([192.131.102.5]:34921 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230515AbiAMUrq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 15:47:46 -0500
Received: (qmail 276775 invoked by uid 1000); 13 Jan 2022 15:47:45 -0500
Date:   Thu, 13 Jan 2022 15:47:45 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jack Pham <quic_jackp@quicinc.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] usb: gadget: f_mass_storage: Make CD-ROM emulation
 work with Mac OS-X
Message-ID: <YeCP8c+IXVRurILA@rowland.harvard.edu>
References: <20220113175916.10090-1-quic_jackp@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113175916.10090-1-quic_jackp@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 13, 2022 at 09:59:16AM -0800, Jack Pham wrote:
> From: Roger Quadros <roger.quadros@nokia.com>
> 
> Mac OS-X expects CD-ROM TOC in raw format (i.e. format:2). It also
> sends the READ_TOC CDB in old style SFF8020i format. i.e. 2 format bits
> are encoded in MSBs of CDB byte 9.
> 
> This patch will enable CD-ROM emulation to work with Mac OS-X. Tested on
> Mac OS X v10.6.3.
> 
> Signed-off-by: Roger Quadros <roger.quadros@nokia.com>
> Signed-off-by: Jack Pham <quic_jackp@quicinc.com>
> ---
> v3: Updated command mask to allow for non-zero byte 2
> v2: Removed Change-Id
> v1: Resurrected original change [1] and consolidated into single patch
> 
> [1] https://lore.kernel.org/lkml/1302015569-9668-1-git-send-email-roger.quadros@nokia.com/T/#u

Acked-by: Alan Stern <stern@rowland.harvard.edu>

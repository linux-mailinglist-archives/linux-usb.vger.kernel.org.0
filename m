Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92ADD49C9DD
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 13:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241415AbiAZMhb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 07:37:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241407AbiAZMha (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 07:37:30 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA9BC06173B
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 04:37:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 50722B81B99
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 12:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCEEC340E6;
        Wed, 26 Jan 2022 12:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1643200648;
        bh=QTG/TAweLFNRqCK/sgXVOjQ0mizCjgq2LcFw1XRjIm4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zTBWszPiQYerK2szfitfLhCKUHav4ejDTCj+C+AfeG6w3GZOfdJS9bqJs81ZUT4mB
         LKPY/GePpDXMAQ20gRSlKEDm27FAAH5ESrFW8QoRutcm+E8jmgGkD2BcT7kVGsMva9
         LMIfz/CTZlOK48t9tQlSVd87F98lvxuOysDCWpK8=
Date:   Wed, 26 Jan 2022 13:37:25 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jack Pham <quic_jackp@quicinc.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: gadget: f_mass_storage: Make CD-ROM emulation
 work with Mac OS-X
Message-ID: <YfFAhez1altQSiMq@kroah.com>
References: <20220124160150.19499-1-quic_jackp@quicinc.com>
 <20220126012154.GH3221@jackp-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126012154.GH3221@jackp-linux.qualcomm.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 25, 2022 at 05:21:54PM -0800, Jack Pham wrote:
> On Mon, Jan 24, 2022 at 08:01:50AM -0800, Jack Pham wrote:
> > From: Roger Quadros <roger.quadros@nokia.com>
> > 
> > Mac OS-X expects CD-ROM TOC in raw format (i.e. format:2). It also
> > sends the READ_TOC CDB in old style SFF8020i format. i.e. 2 format bits
> > are encoded in MSBs of CDB byte 9.
> > 
> > This patch will enable CD-ROM emulation to work with Mac OS-X. Tested on
> > Mac OS X v10.6.3.
> > 
> > Signed-off-by: Roger Quadros <roger.quadros@nokia.com>
> > Signed-off-by: Jack Pham <quic_jackp@quicinc.com>
> > ---
> > v4: Updated return length as I had inadvertently applied an earlier version of
> >     Roger's patch which had the same mistake [2]
> 
> Hi Alan, if this looks fine to you would you please mind providing your
> Acked-by again?
> 
> Also, if there are no objections, I think this patch can qualify as a
> bugfix and I can send a v5 Cc'ed to stable with a Fixes tag of commit
> d5e2b67aae79 ("USB: g_mass_storage: template f_mass_storage.c file
> created") -- basically this has been around for as long as
> f_mass_storage.c itself (if not even before when CD-ROM emulation was
> first introduced to the former file_storage gadget).

It's a new feature, not a bugfix :)

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8B168D0CE
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 08:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbjBGHsH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 02:48:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjBGHsG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 02:48:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B891816A
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 23:48:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6B8D0B81716
        for <linux-usb@vger.kernel.org>; Tue,  7 Feb 2023 07:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB2C7C433EF;
        Tue,  7 Feb 2023 07:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675756083;
        bh=9BORsh7FqGoYJnCBto71MBYQCay5cmv9ez0JeeqgtB0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pib8cpHBgGCXBqTSF4Kh0TNe4+JPV26Oce/e/7SHmBE3g1R6o0P/MavRoZbrN71xL
         YL+prKm1s7OaoAkTcmLyf83WXL1q6/7e9aVL+c9sShnXsm0+Re5D3V1DIqdapLQKme
         BM3YCYTgF1eLm2FH+O7XTzC+Yvq3dkYoTm0KBIjA=
Date:   Tue, 7 Feb 2023 08:48:00 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>
Subject: Re: [PATCH v2] usb: roles: disable pm for role switch device
Message-ID: <Y+ICMHZxz/32gGLk@kroah.com>
References: <1675425314-13857-1-git-send-email-quic_linyyuan@quicinc.com>
 <Y+DlHUUMX6bACxA6@kuha.fi.intel.com>
 <ba912bbb-278e-f23d-ac2b-88958f7da491@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba912bbb-278e-f23d-ac2b-88958f7da491@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 07, 2023 at 03:41:17PM +0800, Linyu Yuan wrote:
> 
> On 2/6/2023 7:31 PM, Heikki Krogerus wrote:
> > On Fri, Feb 03, 2023 at 07:55:14PM +0800, Linyu Yuan wrote:
> > > there is no PM operation for a role switch device,
> > > call device_set_pm_not_required() in usb_role_switch_register() to disable.
> > > 
> > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> 
> as discussion in Re: [PATCH] usb: typec: disable pm for typec class devices
> - Heikki Krogerus (kernel.org)
> <https://lore.kernel.org/linux-usb/Y+H+8Nt%2F5bgTBv4Y@kuha.fi.intel.com/> ,
> 
> 
> please don't merge this change after we have final solution with Heikki.

I will just drop this from my review queue.  Please feel free to resend
it when you all have it worked out.

thanks,

greg k-h

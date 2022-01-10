Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C06294896E9
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 12:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244358AbiAJLDZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 06:03:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244377AbiAJLDZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 06:03:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D46AC06173F
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 03:03:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CABBFB815CE
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 11:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBEAC36AE3;
        Mon, 10 Jan 2022 11:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1641812602;
        bh=2I5RRpGwgoHkYDdIOnRG6dsIvrvNbiPuEjJVKu/n5Mw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wHz8i5RG8lJca6jbVZkQw5K+3a9dV6ZKrTR4NUdHQu9cNdmAlOxnGCA9Bka4+07Wp
         7/bhBo1Qmyzt2qNL+mt/m+JAnSrCPIRwDoOk3PzyBKfxiIzGY0tk19yBK/c7lsBP3r
         BV7QjQFGwVpBshNQDQ0Co25MLPaSDM/rVWFhz/h0=
Date:   Mon, 10 Jan 2022 12:03:19 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH] usb: roles: fix include/linux/usb/role.h compile issue
Message-ID: <YdwSd64xjkECxiaa@kroah.com>
References: <1641812126-8284-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1641812126-8284-1-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 10, 2022 at 06:55:26PM +0800, Linyu Yuan wrote:
> when CONFIG_USB_ROLE_SWITCH is not defined,
> add usb_role_switch_find_by_fwnode() definition which return NULL.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>

What commit does this fix?

thanks,

greg k-h

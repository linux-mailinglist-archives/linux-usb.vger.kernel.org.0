Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6D124876A9
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jan 2022 12:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347178AbiAGLle (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jan 2022 06:41:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237059AbiAGLle (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jan 2022 06:41:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3BEC061245
        for <linux-usb@vger.kernel.org>; Fri,  7 Jan 2022 03:41:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 26D8AB8259C
        for <linux-usb@vger.kernel.org>; Fri,  7 Jan 2022 11:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6404EC36AE0;
        Fri,  7 Jan 2022 11:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1641555691;
        bh=F9ldTngDZdGcfCxC1XNh7mBlkNN4T4+gI5ZN7F1lzCw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YUmUEkNWAP1fLl0hS2jAsYlQMxZGyaSBh80OA6SxLt25wy0pGWigS1FJQ9zH4a6as
         //RIH5KFB+hT/FI1YeND2taCe1Y8ndspA8oC2RVmKahaTsAkPO9z4JkSC3Bdv/Yhw0
         /nfwtIKc1qOg4AIrdaxcZJp0lt1rsZlaJa+5lCNQ=
Date:   Fri, 7 Jan 2022 12:41:29 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] docs: ABI: fixed formatting in configfs-usb-gadget-uac2
Message-ID: <Ydgm6TPYzv5eqE78@kroah.com>
References: <20220107113301.277820-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107113301.277820-1-pavel.hofman@ivitera.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 07, 2022 at 12:33:01PM +0100, Pavel Hofman wrote:
> Added missing tab, line breaks.
> 
> Fixes: e3088ebc1b97 ("docs: ABI: added missing num_requests param to UAC2")
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>

You forgot a "reported-by:" tag :(

Can you fix that up and resend?

thanks,

greg k-h

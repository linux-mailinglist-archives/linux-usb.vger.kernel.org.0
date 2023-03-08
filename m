Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A442C6B0F8F
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 18:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjCHRBT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 12:01:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbjCHQ7v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 11:59:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6C1EAF283;
        Wed,  8 Mar 2023 08:58:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C9BEBB81D31;
        Wed,  8 Mar 2023 16:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465AAC433EF;
        Wed,  8 Mar 2023 16:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678294693;
        bh=BS3TSOSb1lKA0GEtXmbpsbzUsW+bjMAUX1S4QvhB23Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FSnc+UoWTiXSVepgNsB2aNKTnEksXHBmwNVwXT4zxk5BorJ+8ostmcXeYxN7i+/Ny
         1LU+q0lqi6vlUIXnTa4F0yMfpNpp/1aTsTZ6yKlLD1VE7bEO9KpogGJpDPq2G7SDt5
         wHbhdhcl64vKE6xe08zF/Yx+jX+VMjN6b/EMlgZU=
Date:   Wed, 8 Mar 2023 17:58:11 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org,
        linux-doc@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH] docs: usb: Add documentation for the UVC Gadget
Message-ID: <ZAi+o84djBCzFXIy@kroah.com>
References: <20230308165213.139315-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308165213.139315-1-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 08, 2023 at 04:52:13PM +0000, Daniel Scally wrote:
> The UVC Gadget function has become quite complex, but documentation
> for it is fairly sparse. Add some more detailed documentation to
> improve the situation.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Greg, Jonathan - I didn't know if there's a specific tree for Documentation/
> only patches, so this is on usb-next. If that was wrong let me know and I'll
> resend the patch.

I can take it with my normal USB patches, thanks!

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E10C35FC07B
	for <lists+linux-usb@lfdr.de>; Wed, 12 Oct 2022 08:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbiJLGQh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Oct 2022 02:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiJLGQg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Oct 2022 02:16:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB173286E0
        for <linux-usb@vger.kernel.org>; Tue, 11 Oct 2022 23:16:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 75332613FB
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 06:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0D1C433C1;
        Wed, 12 Oct 2022 06:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665555393;
        bh=v32LFlvhvYFoxrCUhDb44AIF0qg2ox67nh0BWaFGI/E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uDus0xxMcg5OTBnTQjR4Fc2dDsMRaFXsdGqmXrJ63J3n8IP8mZrEsoRh//jqcYt33
         yve/7zJV3xpBSCuKY8DkWRXqj2Qu/G30XSfcDxO5Pj3fGlQsVd6pm9e4ILe6+TcF7Q
         uPBXZ81MxeMiEydGlGiYZOzba1TqKQXQNvGcTBE5g6d6a/r2G8r8UZIKrRhl4bNPuv
         H3tAv3RsjGxyzWbTkGhpXGeY5X3+tPvdoIfSwmNHJPgIwZGGZKxUBrPjCkIAJaDq1e
         qKXckMb4RtwihFb0Soelnt4hievAWb4uTwp+FAj7Y4AMAY+zTerKiIBRghm5ZWnxIF
         54o6B9llFYNPA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oiV2W-0005ra-Qi; Wed, 12 Oct 2022 08:16:24 +0200
Date:   Wed, 12 Oct 2022 08:16:24 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Davide Tronchin <davide.tronchin.94@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: option: the patch is meant to support
 LARA-R6 Cat 1 and LARA-L6 CAT 4 module family.
Message-ID: <Y0ZbuMxNvZGvFo6+@hovoldconsulting.com>
References: <20221011142008.3654-1-davide.tronchin.94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011142008.3654-1-davide.tronchin.94@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 11, 2022 at 04:20:08PM +0200, Davide Tronchin wrote:
> The LARA-R6 module old PID (defined as: UBLOX_PRODUCT_R6XX
> 0x90fa) has been removed. The new LARA-R6 (00B) definition uses 0x908b PID
> and the reservation of port 3 is not needed anymore.
> 
> LARA-R6 00B USB composition exposes the following interfaces:
> If 0: Diagnostic
> If 1: AT parser
> If 2: AT parser
> If 3: AT parser/alternative functions

> Signed-off-by: Davide Tronchin <davide.tronchin.94@gmail.com>
> ---
>  drivers/usb/serial/option.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)

Greg already mentioned the missing changelog here.

Also make sure to CC anyone that helps you with you review when
resending (i.e. Lars in this case).

And do remember to CC the maintainer, that is, me.

Johan

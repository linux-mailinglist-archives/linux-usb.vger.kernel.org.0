Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3570F642AEB
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 16:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbiLEPCD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 10:02:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232016AbiLEPB4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 10:01:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7BD1D314
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 07:01:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2BBCE611A0
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 15:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1E2C433C1;
        Mon,  5 Dec 2022 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1670252514;
        bh=MxUzayIc2aYfuKjDVZAt6Wy7vWNZIJtK8ljA5v9fMjI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yQ58ul6OVKPm8s9teHMJWa2iHUCeWXg2vJgLRxdyNMUUcLMeQvkRulQI6ibEaRgq9
         oevNOQELQDzIwAr2l0rTzlt+USE6RALvoEqWSo1XIfr2XcmXqbQfHKiQeU7ACT0i0l
         +cLlJyyn20fOJD3hSlKU9I5QU4g1+i/xWAbaCQQ4=
Date:   Mon, 5 Dec 2022 16:01:51 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] usb: gadget: uvc: Rename bmInterfaceFlags ->
 bmInterlaceFlags
Message-ID: <Y44H33+G/ekqWEKv@kroah.com>
References: <20221205145807.1099062-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205145807.1099062-1-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 05, 2022 at 02:58:07PM +0000, Daniel Scally wrote:
> In the specification documents for the Uncompressed and MJPEG USB
> Video Payloads, the field name is bmInterlaceFlags - it has been
> misnamed within the kernel.
> 
> Although renaming the field does break the kernel's interface to
> userspace it should be low-risk in this instance. The field is read
> only and hardcoded to 0, so there was never any value in anyone
> reading it. A search of our uvc-gadget application and all the major
> forks that I could find for it did not reveal any users either.

Note, if this does break someone, we will have to rename it back, ok?


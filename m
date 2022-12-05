Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BABA0642AEC
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 16:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbiLEPCJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 10:02:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232180AbiLEPCI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 10:02:08 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379601D302
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 07:02:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D111CB81115
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 15:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E355C433C1;
        Mon,  5 Dec 2022 15:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1670252524;
        bh=OAc8RirufbP48xh4gL5Im2LRPW5gI2hSQO+qarpE02A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KDgsDIYo4neZWqvrpNZRY1L9AZhikcSiNNT/IL7hXqO6qBEEaPGVqWcDOitaZdVUg
         0Z/2n50tedkWHo5qR/gB70/3dg3H1in/BkZechkpbl4EPUzF4e+SttRJk4brq++A3h
         tGKghoCk96qFovoka9MRj9Ev4mKasq3PImZHEd8w=
Date:   Mon, 5 Dec 2022 16:02:02 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] usb: gadget: uvc: Rename bmInterfaceFlags ->
 bmInterlaceFlags
Message-ID: <Y44H6ggXd6CNQ268@kroah.com>
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
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

What commit id does this fix?

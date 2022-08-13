Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA286591930
	for <lists+linux-usb@lfdr.de>; Sat, 13 Aug 2022 09:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238155AbiHMHQI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Aug 2022 03:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiHMHQH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Aug 2022 03:16:07 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F283C51A3D
        for <linux-usb@vger.kernel.org>; Sat, 13 Aug 2022 00:16:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 55D4DCE114D
        for <linux-usb@vger.kernel.org>; Sat, 13 Aug 2022 07:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190F5C433D6;
        Sat, 13 Aug 2022 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660374963;
        bh=b+iSo2W9rd5G/WbWpyVayg+Be8TgXCjHs5rhwmGQZgs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K5YDuaNqbreLHFkZ62POyjfczr0Pa0KDDSv76Gefxh3OSj1cgSTM/BU9Qlk/yfq7m
         6WOD1HnJqNd+Y2IyNUXTXwhDupE5QdGTub/jJdcDA0b+6PVDaHH0KaSqgr6chn0OA4
         2PAuVwBwiNWu7D8ZsIiQPFu67+/2dGtRD9qHl/Z0=
Date:   Sat, 13 Aug 2022 09:15:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Frank Mori Hess <fmh6jj@gmail.com>
Cc:     Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [BUG] usb: dwc2: split interrupt in transactions silently
 dropped due to driver latency
Message-ID: <YvdPr0Hn5eOPehIm@kroah.com>
References: <CAJz5Opd7VxpLSdvDCivgKbazG-t8uGcqazMVjs864w-AhviuRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJz5Opd7VxpLSdvDCivgKbazG-t8uGcqazMVjs864w-AhviuRw@mail.gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 12, 2022 at 09:37:29PM -0400, Frank Mori Hess wrote:
> Also I should mention I am using an old kernel 5.4.13, but based on
> inspection of the mainline master branch, this problem still exists in
> current kernels.

Loads of things have changed since 2019, please try the 5.19 kernel to
see if it still has the same issue.

thanks,

greg k-h

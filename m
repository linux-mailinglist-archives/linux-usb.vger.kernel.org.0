Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96B45508153
	for <lists+linux-usb@lfdr.de>; Wed, 20 Apr 2022 08:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344576AbiDTGnO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Apr 2022 02:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243347AbiDTGnN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Apr 2022 02:43:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C06A167F4
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 23:40:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B466A617D9
        for <linux-usb@vger.kernel.org>; Wed, 20 Apr 2022 06:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F011C385A0;
        Wed, 20 Apr 2022 06:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650436826;
        bh=jVbrNzUtibAMfJ8b7W2lBxQldZwtPKmWcUv6qx4s//Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LDn7caXymgGQbH8SlDjdlVmx3ukYD/WYKfSO61Dx97wFkpor3jXkQYGfTO0TQZ/Yg
         D681T0xPWvws4uPpjV8s/oD6h7qat+5zJhy+TvzRd928R+8MtoQYNqWQDBNSpsNgp+
         PEubf1pHdxbCRdcF5haRxBVwY380wFY4vXIEnAuw=
Date:   Wed, 20 Apr 2022 08:40:21 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: devices: use scnprintf() instead of sprintf()
Message-ID: <Yl+q1QL2vkuKYPDx@kroah.com>
References: <ebfd7a94-34d2-6259-fa0c-4a5dcc649d2b@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebfd7a94-34d2-6259-fa0c-4a5dcc649d2b@omp.ru>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 19, 2022 at 10:50:22PM +0300, Sergey Shtylyov wrote:
> The USB device dump code uses the sprintf() calls with a 2-page buffer,
> leaving 256 bytes at the end of that buffer to prevent buffer overflow.
> Using scnprntf() instead eliminates the very possibility of the buffer
> overflow, while also simplifying the code. This however is achieved at
> the expense of not printing the "(truncated)" line anymore when the end
> of that buffer is actually reached; instead a possible partial line at
> the end of buffer (not ending with '\n') is now not printed.

So you just changed a user-visable abi :(

Please no, obviously that is not allowed.

greg k-h

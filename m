Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1C614B3381
	for <lists+linux-usb@lfdr.de>; Sat, 12 Feb 2022 08:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbiBLHD2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Feb 2022 02:03:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbiBLHD1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Feb 2022 02:03:27 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 147182716D
        for <linux-usb@vger.kernel.org>; Fri, 11 Feb 2022 23:03:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4C97060916
        for <linux-usb@vger.kernel.org>; Sat, 12 Feb 2022 07:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731E3C340E7;
        Sat, 12 Feb 2022 07:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644649403;
        bh=kPluDgmfyJ66SdQ/PM4TOBaKd0KUp7UvozGmpz6hQSk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p+XuvShAhCsDFjgMdSDLxXVXfAa/Q/RqcLU1CX08m0pYZ1uTNZ7oQQdqCXG9O0CB2
         glOq/OHm8loHSz0eVqt6aY2dUwB11duSTJDLf25NssbzSPeuDzj1GvMGz5rfBuoUV9
         0FsJVGaKLHV69KX19WeT3p36yz8Fmquc+q/HVUEI=
Date:   Sat, 12 Feb 2022 08:03:15 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: host: xhci-hub: drop redundant port register reads
Message-ID: <Ygdbs5A/v/9rrdiX@kroah.com>
References: <5ea9b08b-38a5-498b-8312-c64ad782318a@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ea9b08b-38a5-498b-8312-c64ad782318a@omp.ru>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 11, 2022 at 10:05:19PM +0300, Sergey Shtylyov wrote:
> In xhci_hub_control(), there are many port register readbacks in several
> branches of the *switch* statement which get duplicated right after that
> *switch* by reading back the port register once more -- which is done to
> flush the posted writes. Remove the redundant reads inside that *switch*.

Doing a read right after a write is good, perhaps the one after the
switch should be removed instead?

thanks,

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFE2251FD54
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 14:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234961AbiEIMyt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 08:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234939AbiEIMys (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 08:54:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19EF82AE16
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 05:50:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B9357B8124F
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 12:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233E0C385A8;
        Mon,  9 May 2022 12:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652100652;
        bh=VM6cgP7Ywo5fi58XY5hfL4FywLItfYnE2w2KiIYnu38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iexW2bTF+waC9Z+6FTybMFrKSOJl/Rwupe7udhXi78gNOcMscAlJQiRygzkGgETUe
         luRXob7g1yyttjh1zizi8sdwXos1m5FIx32w0crmosM/Oytzzn8Z50J7fGqv6NttNF
         KNUqKXtYKPqxd6eICliPH1yvQyFnznsdGtEh/wDs=
Date:   Mon, 9 May 2022 14:50:49 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH v3 4/4] usb: gadget: add '_' in
 DECLARE_USB_FUNCTION(_INIT) macros
Message-ID: <YnkOKbQiALfgtjsn@kroah.com>
References: <1652097288-19909-1-git-send-email-quic_linyyuan@quicinc.com>
 <1652097288-19909-5-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652097288-19909-5-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 09, 2022 at 07:54:48PM +0800, Linyu Yuan wrote:
> DECLARE_USB_FUNCTION_INIT(ffs, ffs_alloc_inst, ffs_alloc)
> will generate function ffsmod_init/ffsmod_exit()
> and variable ffsusb_func.
> 
> Add possible character '_' in the macros which will generate
> function/variable name in common format, ffs_mod_init/ffs_mod_exit()
> and ffs_usb_func.

You say what you are doing here, but I still do not understand why you
want to do this.

And again, as your previous submissions were never test-built, this
isn't solving a real problem for your devices, so why are you needing
this change at all?

still confused,

greg k-h

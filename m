Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 582476E6806
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 17:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbjDRPZ1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 11:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbjDRPZZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 11:25:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA59312C9C
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 08:25:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5534261596
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 15:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F374C433D2;
        Tue, 18 Apr 2023 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1681831518;
        bh=PnydSr2sb9YS//PSMwh63qYeYdkLGjjL6m89y0XpXrY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CGQM67+BXQM2XfXKv6+ieb1DOkCoVlkCNgED1HbdS97KupxC1tmvi9i76yXcDx+OW
         ZRe0bnmhKsazGNh8R72OZK8bqtJAaWeNyWM6iTRGsRl6uECDUWX3HugPnVMunKm0pw
         BhPth/ZBq0bkb1xgVPUrmG1QtFaHNLptdMPmNOfY=
Date:   Tue, 18 Apr 2023 17:25:16 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     stern@rowland.harvard.edu, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] xhci: Improve the XHCI resume time
Message-ID: <2023041856-shed-sesame-4a5c@gregkh>
References: <20230418140817.3651909-1-Basavaraj.Natikar@amd.com>
 <20230418140817.3651909-3-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418140817.3651909-3-Basavaraj.Natikar@amd.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 18, 2023 at 07:38:17PM +0530, Basavaraj Natikar wrote:
> xHC system resume time may increase due to a 120ms delay.

I'm sorry, but I can not understand this sentence.  Is the delay 120ms
too long?  Or too short?  Or will it change to be always at least 120ms?
Or something else?

> A PME# signal
> will trigger the xHC host to resume runtime, and the host must wait for a
> missed U3 LFPS wake signal before re-checking for port activity. It may
> be necessary to wait only for auto-resume cases. Add a check only for
> runtime resume to avoid the delay for other PM events so that the resume
> time can be improved.

I also can not understand these last two sentences, can you try to
reword it a bit differently?

thanks,

greg k-h

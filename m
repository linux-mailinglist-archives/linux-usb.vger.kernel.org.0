Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE5A16E6504
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 14:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbjDRMyH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 08:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232306AbjDRMx4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 08:53:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E16714F7F
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 05:53:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EED296347C
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 12:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D99C4339B;
        Tue, 18 Apr 2023 12:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1681822434;
        bh=CM2sExAnwfsEjvvUHWGScTZSC2ZVJtbTyg7/uo0KJ38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1iimwit9pMjNb9ZnZ0DGDHGZHS8iJ4j+p5xPxlTy8apEZgEYXpBjjteLuHMmZIHN3
         sxn0frrMu/3YuifxilA9DUueGhmFourQWjYdusIWqSBxYbfppgKMypMKWCJTFThPfY
         xHpo75c3K3MaQ47HJ/mPLpEmbrV8OWGS0E8b+yWU=
Date:   Tue, 18 Apr 2023 14:25:38 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org,
        Oliver Neukum <oneukum@suse.com>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v5] usb: dwc3: debugfs: Prevent any register access when
 devices
Message-ID: <2023041821-oak-comrade-f859@gregkh>
References: <20230418121835.17550-1-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418121835.17550-1-quic_ugoswami@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 18, 2023 at 05:48:35PM +0530, Udipto Goswami wrote:
> When the dwc3 device is runtime suspended, various required clocks would
> get disabled and it is not guaranteed that access to any registers would
> work. Depending on the SoC glue, a register read could be as benign as
> returning 0 or be fatal enough to hang the system.
> 
> In order to prevent such scenarios of fatal errors, make sure to resume
> dwc3 then allow the function to proceed.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Where did they sign off on this?  I don't see that in the v4 thread, did
I miss it somewhere?

greg k-h

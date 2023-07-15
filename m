Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73A957546E8
	for <lists+linux-usb@lfdr.de>; Sat, 15 Jul 2023 07:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjGOFWm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 Jul 2023 01:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjGOFWl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 Jul 2023 01:22:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF603A9D
        for <linux-usb@vger.kernel.org>; Fri, 14 Jul 2023 22:22:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A5EC960201
        for <linux-usb@vger.kernel.org>; Sat, 15 Jul 2023 05:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B3FC433C8;
        Sat, 15 Jul 2023 05:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689398559;
        bh=w1lMhlbmqQC0awT22Y+mRvFRyI38vGfPoUIO4C1MCGM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SgNqdvHgZRwzypSQyfWtJZNOLcvLoxAJY5pWiJut4X5EpLQzuO3AD2a/E9BF3Z3Mv
         g3RmY+F48uVEGBXFHBgeCnVFCJKXOStzHL0r/NltqAIjE0FX83SADSZ8v7HVhAtUl9
         HYnNYW+Bptaqswi33NSMkk5uOWc34GwJcKr47AW4=
Date:   Sat, 15 Jul 2023 07:22:35 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: usb: dwc3: Init vacation mode
Message-ID: <2023071527-hemlock-unspoken-7373@gregkh>
References: <20230714223841.nw3576sia4aw5ryf@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714223841.nw3576sia4aw5ryf@synopsys.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 14, 2023 at 10:38:45PM +0000, Thinh Nguyen wrote:
> Hi,
> 
> I'll be back toward the end of July. My response may be delayed.

Have a nice break!

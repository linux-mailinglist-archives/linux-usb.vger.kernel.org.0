Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A638F55115D
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 09:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239230AbiFTHTU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 03:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239288AbiFTHTT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 03:19:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57AC8E0CB
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 00:19:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E773A61185
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 07:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591B1C3411B;
        Mon, 20 Jun 2022 07:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655709557;
        bh=a5SdNlSeU/YL1MKfIpDJROfIKZNWOuUqtQEnonI1v5A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=opXHM4/ErYO3+lx18FZbBTLMnD8PUxjiq2Kr1GvY71mpB1j2Gk339jL21ZXIQRs9h
         Naj13ASblvhNrQt7kboTmAvMDkWtuyUUwi/9tHcd4hOkuU5TCEhQ/T5Pfy7c+1n2m4
         zJUN9nfs1rghi+EOzFIe+3GEdzbRc6eDBGjmvQIeQAQF51xtHtnBvhVTCI9bl/Q56A
         1y9P1r2v6weU88EgvguFsysCkxBY0fv9T6/juMa6MBdmTl/gmmIQUwdaifYfJmdFuN
         RIF1VLdV7VcjeoMDRjPgYDdW3cE72b07R7K7FOAC7tLl+SfWp46mrTBADoMV0mBb9B
         wtw4Hv1x44TFw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1o3Bgn-0003L2-HN; Mon, 20 Jun 2022 09:19:13 +0200
Date:   Mon, 20 Jun 2022 09:19:13 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Giles Roadnight <giles.roadnight@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Prolific Technology pl2303: unknown device type
Message-ID: <YrAfcXUORApvdAxU@hovoldconsulting.com>
References: <CAA0uCUZV0Jdc5HJnPg=Rqv06+UVYAudbx5qUNOatE9ZZsP6vsA@mail.gmail.com>
 <CAA0uCUYnMjJxdsxjue3zD2-LZkJbg3imckTrV=4VakPMchdLWg@mail.gmail.com>
 <YrAcTDCnEiipWEM3@hovoldconsulting.com>
 <CAA0uCUZ10rCXctv0nnYD60ugK9WDFbmnvVSVwJ5Zc9hzfPVeGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA0uCUZ10rCXctv0nnYD60ugK9WDFbmnvVSVwJ5Zc9hzfPVeGg@mail.gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 20, 2022 at 08:10:22AM +0100, Giles Roadnight wrote:
> Yes thanks. The new kernel has not made it to the default raspberry pi
> repos yet so doing apt upgrade does not fix it. I did find a tool that
> does update the kernel in an "unsafe" way and that has fixed it for
> me.

Good to hear you found a way to resolve this.

Johan

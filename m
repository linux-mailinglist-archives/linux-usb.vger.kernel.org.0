Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 548EC4FF454
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 12:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233507AbiDMKB7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 06:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234587AbiDMKB5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 06:01:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FA4DFC7
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 02:59:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A6238B821C2
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 09:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C163BC385A3;
        Wed, 13 Apr 2022 09:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649843974;
        bh=edWDMNFQGzOPrM0txe1XmiULQnLSuJwBlfUIiC8ELSY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hrZsvSiHzSpRS/FUjbvVvDmC0pKyLTp950vO2SsROj6/bBNQfQsMyp72qz6tiLRyh
         he2HlrnlYZqfUfmcBlHhg92k6eR5gP6xjAHTJK3D1xPsxv30Afr8hzjAQGPp9r5cxW
         tzmIs9Rf4W1PnO1Bu42gEwnNNmhXjau3+Qirmb7413kvxcbFash1/aHLNziDvfZDKo
         Ted7jtaTDs7e9fGavnyU/Sf0+xgVAOIIVLbmr1XgKkXSzBfliwjM59uHYzFVsM0UxO
         HaoVj2WRd5ZKLZYykfgVGuc1DcBVCz7/0/bE+dOMGxApdJDLCZg1OF6mbiYGMy+6Fi
         J/dPhuveTJsYQ==
Date:   Wed, 13 Apr 2022 15:29:30 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jules Maselbas <jmaselbas@kalray.eu>
Cc:     linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Michael Grzeschik <mgr@pengutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND v3 2/3] phy: core: Update documentation syntax
Message-ID: <YlafAkEQq81R4MGC@matsya>
References: <20220407102108.24211-1-jmaselbas@kalray.eu>
 <20220407102108.24211-3-jmaselbas@kalray.eu>
 <YlZnb2dJjaroDfyu@matsya>
 <20220413095349.GA25550@tellis.lin.mbt.kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413095349.GA25550@tellis.lin.mbt.kalray.eu>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13-04-22, 11:53, Jules Maselbas wrote:
> On Wed, Apr 13, 2022 at 11:32:23AM +0530, Vinod Koul wrote:
> > On 07-04-22, 12:21, Jules Maselbas wrote:
> > > Update the syntax used by the documentation of phy operation functions.
> > > This is to unify the syntax with the newly added documentation.
> > 
> > Is there any reason for using this sytax, is it documented somewhere..?
> > How does this syntax help?
> 
> I don't have any particular reason for this syntax, this syntax have been
> suggested by Randy Dunlap.

Is this documented somewhere?

-- 
~Vinod

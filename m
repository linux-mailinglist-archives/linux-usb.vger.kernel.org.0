Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE517292EB
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jun 2023 10:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240620AbjFIIWr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Jun 2023 04:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240611AbjFIIW2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Jun 2023 04:22:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0C449DD
        for <linux-usb@vger.kernel.org>; Fri,  9 Jun 2023 01:21:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7DCE26548C
        for <linux-usb@vger.kernel.org>; Fri,  9 Jun 2023 08:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DBFC4339E;
        Fri,  9 Jun 2023 08:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1686298816;
        bh=VxCYzCNheFhxwbcito8zCahguC7+OOG81bcx4RDH0n8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UMSlD+kI46qFVPuM9evZAB+r3WUFthxo28+VK+sIKMTO3fKBSP1GN/zbZCvea1os9
         xaWLR4Cktcl5o2d+/izd1fGVL47CDt2LmevkZkHJHtc+l7COJCX04Z9DDr3cu+fjvQ
         u1CUNn2V0kulFBIy66Jorw1CckY6CPioig/Qt9aE=
Date:   Fri, 9 Jun 2023 10:20:14 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dmitry Antipov <dmantipov@yandex.ru>
Cc:     Michael Jamet <michael.jamet@intel.com>, linux-usb@vger.kernel.org,
        lvc-project@linuxtesting.org
Subject: Re: [PATCH] thunderbolt: handle possible NULL pointer from
 get_device()
Message-ID: <2023060939-undead-nuptials-3fc1@gregkh>
References: <20230609061619.57756-1-dmantipov@yandex.ru>
 <2023060911-expose-unplanned-964a@gregkh>
 <d68c759a-e44c-0c6f-03cc-1e07418424eb@yandex.ru>
 <2023060903-unashamed-proactive-8bc9@gregkh>
 <d4ce3fc8-fdc7-109e-f8d6-d1de71639c5e@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4ce3fc8-fdc7-109e-f8d6-d1de71639c5e@yandex.ru>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 09, 2023 at 11:05:59AM +0300, Dmitry Antipov wrote:
> On 6/9/23 10:46, Greg KH wrote:
> 
> > Again, how did you test this?
> 
> Did you look at the patch header? For that particular case, the static
> analysis tool complains that the value returned by get_device() is most
> likely should be checked just because it is checked on a lot of other
> code paths. Usually it may be a good precaution to handle the very rare
> and unexpected errors; again, if you're sure that this is not the case,
> just disregard it.

Just because a static tool said "this might be wrong" does not mean you
do not need to actually test your change or do some work to verify that
it is a sane change at all.

So far I have seen more and more false-positives from this "tool" of
your group that I am very inclined to just tell all kernel maintainers
to ignore them for a very long time as you are not following the
documented rules for such patches as outlined in
Documentation/process/researcher-guidelines.rst

Please read that and fix your tool, and your submission process, I've
said this many times already.

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 177C14D0199
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 15:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237157AbiCGOlq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 09:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiCGOlq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 09:41:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E50865D38
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 06:40:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BD0FD61353
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 14:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245F8C340EB;
        Mon,  7 Mar 2022 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646664051;
        bh=nkM1tIk/o+fP7yDr3KgBsDtgWDKgFboHCYO4CYRVs/E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bPchw8EbidVne+/xjnO4D/MuzqnPDJf12oNkBGVzutNw++C7SllhDYmiw7rUzkqCo
         0nBpW/dIX7iDDBQgj+NezGqbr11atfHCO1hEmpn5k+2PEGNlXHcXr822ut4K2WAKwr
         5TDCKWScKIOu/ajc93agIAsgijwTt0wO4JzlODpecIXamaNVKrO8c5VJ0mVuK7vq0n
         /Fo35FiGiYL/CEfFz95m/qza7DqU5OySkDgqJ0lPsfUMnWJtkSF4/4dVlWZWhXTnnJ
         IPeUhQegue1lUCQZcgnB41SVsmMy9DGhrtUqfVxt7TGFD367smuyEILXYufIRAmQLm
         t60DyYx6saKug==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nREXV-0005MJ-Rt; Mon, 07 Mar 2022 15:40:46 +0100
Date:   Mon, 7 Mar 2022 15:40:45 +0100
From:   Johan Hovold <johan@kernel.org>
To:     =?utf-8?B?TWF0ecOhxaE=?= Kroupa <kroupa.matyas@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Another PL2303
Message-ID: <YiYZbfKDovInvSiB@hovoldconsulting.com>
References: <165de6a0-43e9-092c-2916-66b115c7fbf4@gmail.com>
 <YiYWrhe4w5iC/Hm0@hovoldconsulting.com>
 <04428d68-256f-559b-6f1c-9397b7a43bfc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04428d68-256f-559b-6f1c-9397b7a43bfc@gmail.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 07, 2022 at 03:38:39PM +0100, Matyáš Kroupa wrote:
> Yes, it is PL2023GS. I wasn't able to read it but now that I know what 
> to look for, I can confirm it.

Perfect, thanks again!

Johan

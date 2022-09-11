Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50BAE5B501C
	for <lists+linux-usb@lfdr.de>; Sun, 11 Sep 2022 18:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiIKQyX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Sep 2022 12:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiIKQyW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Sep 2022 12:54:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA34220F7
        for <linux-usb@vger.kernel.org>; Sun, 11 Sep 2022 09:54:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B21A6B80AFE
        for <linux-usb@vger.kernel.org>; Sun, 11 Sep 2022 16:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CFB6C433D6;
        Sun, 11 Sep 2022 16:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662915259;
        bh=UlBl1VZr65IvLBgmS22N5ItDFO+Meetasxvgo56WKaQ=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=TgdfaFeC13Q+QmcA12v1WVTFu72c5tnt87T6DMN1rqoq62YSIT+8WHJpPCpAC07nJ
         bTFL/oHcjVcBxBki+jxtUVnfxzM8YeyCoJxxV/7Fx7VNubQjkaZcEtFCzVpqF4YfFu
         PmR8ckuLqpFQ+2tyBd26xSs5XSWrkWEpCz6ILoNz/azsU+XhZMK1n1ffWLdm5/5YOF
         IEsaLDUh91Bn0C93KEJ7uy7GUlVMsR3mrwIPqjXDvkQ5YADxYkIWZbrXMassDnEn2f
         qZo2ddKH78xfObe3lpVdUKDgUoRYC1Ii30DMHn+cp3QZBIpeOpT90Ceyy4ey96xSyv
         MyTuAWLDb+/7g==
References: <CADscph3w83NsduPiOBw+4H1o4jFmktFnoRnMJ5+J6eBD4=0+NQ@mail.gmail.com>
 <Yxm/3Gr/4U32EMaC@kuha.fi.intel.com>
User-agent: mu4e 1.8.9; emacs 28.1
From:   Felipe Balbi <balbi@kernel.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Daniel Martin <consume.noise@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: dwc3: multiple ones and speed?
Date:   Sun, 11 Sep 2022 19:50:22 +0300
In-reply-to: <Yxm/3Gr/4U32EMaC@kuha.fi.intel.com>
Message-ID: <87leqp7sy3.fsf@balbi.sh>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Heikki Krogerus <heikki.krogerus@linux.intel.com> writes:
> On Thu, Sep 08, 2022 at 10:51:00AM +0200, Daniel Martin wrote:
>> Hi Heikki,
>> 
>> `git blame drivers/usb/dwc3/dwc3-pci.c` said, that you might be the
>> right person to ask. ;-)
>
> Felipe is the dwc3 driver and also the USB gadget subsystem
> maintainer. I'll add him here, and also the linux-usb ml.
>
>> - Do you know of any device (preferably Intel x86_64) that has more
>> than one dwc3 controller?
>> - Do you have any speed comparisions for devices with a dwc3 acting in
>> device mode (i. e. throughput and latency of a storage gadget)?
>
> I'm sorry I don't. But perhaps Felipe or someone else on the list has?

I've been out of the Intel loop for quite some time, but IIRC some of
the newest cores supporting USB 3.2 on the peripheral side were made so
that SuperSpeed would be handled by one dwc3 instance and SuperSpeed
Plus would be handled by another dwc3 instance altogether.

>> I've got a few Rock Pi X at the moment, though its gadget performance
>> isn't that satisfying and I don't know if the Cherry Trail Z8350 or
>> the included dwc3 is the limiting factor.

why would it be? Can you define "performance"? Which kernel version are
you using? Have you tried latest tag from Linus? What gadget driver are
you using? How have you configured it? Are you running HighSpeed or
SuperSpeed? (IIRC, CherryTrail is superspeed only).

-- 
balbi
